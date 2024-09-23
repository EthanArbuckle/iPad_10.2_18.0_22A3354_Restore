@implementation RCMenuBarManager

+ (id)sharedMenuBarManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079AC0;
  block[3] = &unk_1001AB4D8;
  block[4] = a1;
  if (qword_1001ED938 != -1)
    dispatch_once(&qword_1001ED938, block);
  return (id)qword_1001ED930;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeMenuForIdentifier:", UIMenuFormat);
  objc_msgSend(v4, "removeMenuForIdentifier:", UIMenuToolbar);
  -[RCMenuBarManager addFileMenuItemsToBuilder:](self, "addFileMenuItemsToBuilder:", v4);
  -[RCMenuBarManager addEditMenuItemsToBuilder:](self, "addEditMenuItemsToBuilder:", v4);
  -[RCMenuBarManager addControlsMenuItemsToBuilder:](self, "addControlsMenuItemsToBuilder:", v4);

}

- (void)addFileMenuItemsToBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RCMenuBarManager _removeDefaultDocumentCommandsInBuilder:](self, "_removeDefaultDocumentCommandsInBuilder:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMenuBarManager fileMenu](self, "fileMenu"));
  objc_msgSend(v4, "insertChildMenu:atStartOfMenuForIdentifier:", v5, UIMenuFile);

}

- (void)addEditMenuItemsToBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RCMenuBarManager _removeDefaultFindCommandsInBuilder:](self, "_removeDefaultFindCommandsInBuilder:", v4);
  -[RCMenuBarManager _replaceDefaultDeleteCommandWithCustomCommandInBuilder:](self, "_replaceDefaultDeleteCommandWithCustomCommandInBuilder:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMenuBarManager editMenu](self, "editMenu"));
  objc_msgSend(v4, "insertSiblingMenu:afterMenuForIdentifier:", v5, UIMenuStandardEdit);

}

- (void)_replaceDefaultDeleteCommandWithCustomCommandInBuilder:(id)a3
{
  _objc_msgSend(a3, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", UIMenuStandardEdit, &stru_1001ACDA0);
}

- (void)_removeDefaultDocumentCommandsInBuilder:(id)a3
{
  objc_msgSend(a3, "removeMenuForIdentifier:", UIMenuDocument);
}

- (void)_removeDefaultFindCommandsInBuilder:(id)a3
{
  objc_msgSend(a3, "removeMenuForIdentifier:", UIMenuFind);
}

- (void)addControlsMenuItemsToBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCMenuBarManager controlsMenu](self, "controlsMenu"));
  objc_msgSend(v4, "insertSiblingMenu:afterMenuForIdentifier:", v5, UIMenuView);

}

- (id)fileMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DONE_EDITING"), &stru_1001B2BC0, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "handleDone:", CFSTR("s"), 0x100000, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("START_NEW_RECORDING_MENU_ITEM"), &stru_1001B2BC0, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v6, 0, "startNewRecording:", CFSTR("n"), 0x100000, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DUPLICATE_CURRENT_RECORDING_MENU_ITEM"), &stru_1001B2BC0, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v9, 0, "duplicateRecording:", CFSTR("d"), 0x100000, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("RENAME_CURRENT_RECORDING_MENU_ITEM"), &stru_1001B2BC0, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v12, 0, "renameRecording:", 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1001B2BC0, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v15, 0, "handleCancel:", UIKeyInputEscape, 0, 0));

  objc_msgSend(v16, "setAttributes:", 4);
  v20[0] = v4;
  v20[1] = v7;
  v20[2] = v10;
  v20[3] = v13;
  v20[4] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 5));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1001B2BC0, 0, CFSTR("RCFileMenuIdentifier"), 1, v17));

  return v18;
}

- (id)editMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EDIT_CURRENT_RECORDING_MENU_ITEM"), &stru_1001B2BC0, 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v3, 0, "editRecording:", 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TRIM_CURRENT_RECORDING_MENU_ITEM"), &stru_1001B2BC0, 0));
  v6 = objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v5, 0, "trimRecording:", CFSTR("t"), 0x100000, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FAVORITE_RECORDING"), &stru_1001B2BC0, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v19, 0, "toggleFavorite:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ENHANCE_RECORDING_SETTING"), &stru_1001B2BC0, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v10, 0, "toggleEnhance:", CFSTR("e"), 1179648, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SKIP_SILENCE_SETTING"), &stru_1001B2BC0, 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v13, 0, "toggleRemoveSilence:", CFSTR("x"), 1179648, 0));
  v21[0] = v20;
  v21[1] = v6;
  v15 = (void *)v6;
  v21[2] = v8;
  v21[3] = v11;
  v21[4] = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 5));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1001B2BC0, 0, CFSTR("RCEditMenuIdentifier"), 1, v16));

  return v17;
}

- (id)controlsMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PLAY_PAUSE_CURRENT_RECORDING_MENU_ITEM"), &stru_1001B2BC0, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "playRecording:", CFSTR(" "), 0, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_nonRepeatableKeyCommand"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SKIP_BACKWARD"), &stru_1001B2BC0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v7, 0, "jumpSelectionBackward:", UIKeyInputLeftArrow, 0x100000, 0));

  objc_msgSend(v8, "setAllowsAutomaticMirroring:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SKIP_FORWARD"), &stru_1001B2BC0, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v10, 0, "jumpSelectionForward:", UIKeyInputRightArrow, 0x100000, 0));

  objc_msgSend(v11, "setAllowsAutomaticMirroring:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CONTROLS_MENU_NAME"), &stru_1001B2BC0, 0));
  v17[0] = v5;
  v17[1] = v8;
  v17[2] = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v13, 0, CFSTR("RCControlsMenuIdentifier"), 0, v14));

  return v15;
}

@end
