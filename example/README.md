# snack_grid_menu

Showing grid menu on Snackbar.

## Example
```
SnackGridMenu(
    maxItemView: 6,
    crossAxisCount: 2,
    itemList: <MenuItem>[
        MenuItem(imagePath: "assets/images/default/airplane.png", title: "Flights", onTap: ()=>{print('tes')}),
        MenuItem(imagePath: "assets/images/default/access.png", title: "Payment", onTap: ()=>{print('tes2')}),
        MenuItem(imagePath: "assets/images/default/hand.png", title: "Events", onTap: ()=>{print('tes2')}),
        MenuItem(imagePath: "assets/images/default/phone-charge.png", title: "Top Up", onTap:()=>getIt<NavigationServices>().navigateTo(DefaultRoutes.page6)),
        MenuItem(imagePath: "assets/images/default/console.png", title: "Games", ),
    ],)
```



## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
