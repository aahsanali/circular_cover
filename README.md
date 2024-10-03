# Circular Button Menu

I have built a dynamic Circular Menu in Flutter using a CustomPainter. Each menu item is represented by a sector of a circle, where the number of sectors dynamically adjusts based on the items provided in the initial array. The menu has an interactive tab-like structure, with each sector containing an icon and a title. A user’s profile picture is displayed in the center of the circular menu. Each menu sector is clickable and triggers a callback function for navigation.

*Key Components*

- CustomPainter: Used to draw the circular menu and divide it into sectors.
- Dynamic Sectors: The number of sectors depends on the number of menu items provided in the initial array.
- Icon and Title: Each sector displays an image and a title, fetched from the assets folder.
- Profile Picture: A central image widget represents the user’s profile picture.
- Callbacks: Each sector has an onPressed callback, which can be used to navigate to different screens.
- Separation Lines: Each sector is separated by white lines, providing a visual distinction between menu items.

Initialization
Circular button menu will be initalize based on number of items passed in to menu array, 

```json

	final menuList = [

		MenuItem(title: "Menu", iconName: "documents_icon.png"),
		MenuItem(title: "Documents", iconName: "documents_icon.png"),
		MenuItem(title: "About", iconName: "documents_icon.png"),
		MenuItem(title: "Medications", iconName: "documents_icon.png"),
	];

```
example:

![circular button menu 1 ](/assets/icons/scr1.png)

![circular button menu 2 ](/assets/icons/scr1.png)


## Getting Started with Flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
