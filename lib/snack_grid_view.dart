
import 'package:flutter/material.dart';
import 'menu_item.dart';

class SnackGridMenu extends StatelessWidget{
  final List<MenuItem> itemList;
  final int crossAxisCount;
  final int maxItemView;
  final bool shrinkWrap;
  final Color color; 
  final double height; 
  final double width;
  final String moreLabel;
  final _moreImage='assets/images/more.png';
  

  SnackGridMenu({Key key,
            @required this.itemList, 
            this.crossAxisCount = 3, 
            this.maxItemView=3, 
            this.shrinkWrap = true,
            this.color,
            this.height,
            this.width,
            this.moreLabel = "More"
            }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MenuItem> _newList = List<MenuItem>();
    List<MenuItem> _remainsList = List<MenuItem>();
    // int _newLength = maxItemView;
    _reListGrid(_newList, _remainsList,context);
    return GridView.count(
              shrinkWrap: shrinkWrap,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              children: List<_GridItem>.generate(maxItemView, (int index) {
                var i = _newList[index];
                return _GridItem(item:i, snackMenu: _snackMenu(_remainsList),moreLabel: moreLabel);
              })
          );
  }

  _reListGrid(
      List<MenuItem> newList, 
      //int newLength, 
      List<MenuItem> remainsList,
      BuildContext context){

    if(maxItemView !=null){
     // newLength = maxItemView;

      for(int i=0;i < itemList.length;i++){
        if(i < maxItemView-1)
          newList.add(itemList[i]);
        else
          remainsList.add(itemList[i]);
      }
      newList.add(_more(context));
    } else 
      newList = itemList;
  }

  _snackMenu(List<MenuItem> list){
    return Container(
            child: GridView.count(
              shrinkWrap: shrinkWrap,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              children: List<_GridItem>.generate(list.length, (int index) {
                var i = list[index];
                return _GridItem(item:i);
              })
          )
      );
  }

  _more(BuildContext context) => MenuItem(imagePath: _moreImage, title: moreLabel);

}


class _GridItem extends StatelessWidget { 
  final double height; 
  final double width;
  final MenuItem item;
  final Widget snackMenu;
  final String moreLabel;

  _GridItem({Key key, 
    this.height=30, 
    this.width=30,
    this.item,
    this.snackMenu,
    this.moreLabel
    
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return item.title == moreLabel ? _moreBtn(context):_itemBtn(context);
  }

  _itemBtn(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(1 / 2),
      child: GestureDetector(
      child:_item(),
      onTap: item.onTap
      )
    );
  }

  _moreBtn(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(1 / 2),
      child: GestureDetector(
      child:_item(),
      onTap: ()=> 
     _showBottomSheet(context)/// _navigateTo(context)
      )
    );
  }

   _onTap(BuildContext context){
   if(item.title == moreLabel) {
     _showBottomSheet(context);
      print('showSnack.toString()');
   }else 
   return  item.onTap;
    //return //showSnack?
      //:item.onTap;
  }

  _item(){
    return Container(
       // color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _image(),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      );
  }

  _image()=> Image.asset(
                item.imagePath,
                width: width,
                height: height,
                color: item.color,
              );

  _showBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return snackMenu;
      }
    );
  }
}