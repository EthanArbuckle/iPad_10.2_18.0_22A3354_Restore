@implementation MapsMenuBuilder

+ (void)buildMenuWithBuilder:(id)a3 sendToDeviceEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a4;
  v21 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v6 = sub_1002A8AA0(v5);

  if (v6 == 5)
    objc_msgSend(v21, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", UIMenuPreferences, &stru_1011BB230);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder applicationMenu](MapsMenuBuilder, "applicationMenu"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "children"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
    objc_msgSend(v21, "insertSiblingMenu:afterMenuForIdentifier:", v7, UIMenuPreferences);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder userProfileMenu](MapsMenuBuilder, "userProfileMenu"));
  objc_msgSend(v21, "insertSiblingMenu:afterMenuForIdentifier:", v10, UIMenuPreferences);

  objc_msgSend(v21, "removeMenuForIdentifier:", UIMenuNewScene);
  objc_msgSend(v21, "removeMenuForIdentifier:", UIMenuOpenRecent);
  objc_msgSend(v21, "removeMenuForIdentifier:", UIMenuPrint);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder fileMenuStart](MapsMenuBuilder, "fileMenuStart"));
  objc_msgSend(v21, "insertChildMenu:atStartOfMenuForIdentifier:", v11, UIMenuFile);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", v4));
  objc_msgSend(v21, "insertSiblingMenu:afterMenuForIdentifier:", v12, UIMenuClose);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder fileMenuEnd](MapsMenuBuilder, "fileMenuEnd"));
  objc_msgSend(v21, "insertSiblingMenu:afterMenuForIdentifier:", v13, CFSTR("SendToDeviceAndShareSubMenuIdentifier"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder editMenu](MapsMenuBuilder, "editMenu"));
  objc_msgSend(v21, "insertSiblingMenu:afterMenuForIdentifier:", v14, UIMenuStandardEdit);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder findSubMenu](MapsMenuBuilder, "findSubMenu"));
  objc_msgSend(v21, "replaceMenuForIdentifier:withMenu:", UIMenuFind, v15);

  objc_msgSend(v21, "removeMenuForIdentifier:", UIMenuSubstitutions);
  objc_msgSend(v21, "removeMenuForIdentifier:", UIMenuTransformations);
  objc_msgSend(v21, "removeMenuForIdentifier:", UIMenuFormat);
  objc_msgSend(v21, "removeMenuForIdentifier:", UIMenuToolbar);
  objc_msgSend(v21, "removeMenuForIdentifier:", UIMenuTextSize);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder mapModeSubMenu](MapsMenuBuilder, "mapModeSubMenu"));
  objc_msgSend(v21, "insertChildMenu:atStartOfMenuForIdentifier:", v16, UIMenuView);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder visibleAttributesSubMenu](MapsMenuBuilder, "visibleAttributesSubMenu"));
  objc_msgSend(v21, "insertSiblingMenu:afterMenuForIdentifier:", v17, CFSTR("MapModeSubMenuIdentifier"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder zoomSubMenu](MapsMenuBuilder, "zoomSubMenu"));
  objc_msgSend(v21, "insertSiblingMenu:afterMenuForIdentifier:", v18, CFSTR("VisibleAttributesSubMenuIdentifier"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder currentLocationSubMenu](MapsMenuBuilder, "currentLocationSubMenu"));
  objc_msgSend(v21, "insertSiblingMenu:afterMenuForIdentifier:", v19, CFSTR("ZoomSubMenuIdentifier"));

  if (sub_100424728())
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder debugMenu](MapsMenuBuilder, "debugMenu"));
    objc_msgSend(v21, "insertSiblingMenu:afterMenuForIdentifier:", v20, UIMenuHelp);

  }
}

+ (id)preferencesMenuCommand
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Settings…"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "presentPreferences", CFSTR(","), 0x100000, 0));

  return v4;
}

+ (id)userProfileMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Account in Maps…"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "openUserProfile", CFSTR("a"), 1572864, 0));

  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v5));

  return v6;
}

+ (id)applicationMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Report an Issue…"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v3, 0, "presentRAP", 0));

  LODWORD(v2) = GEOConfigGetBOOL(MapKitConfig_RAPFlowReportSomethingMissing[0], MapKitConfig_RAPFlowReportSomethingMissing[1]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if ((_DWORD)v2)
    v7 = CFSTR("[Menu] Report Something Missing");
  else
    v7 = CFSTR("[Menu] Add to Maps…");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v8, 0, "presentAddAMissingPlace", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  if (_MKRAPIsAvailable(v10) && (sub_1003DDB84() & 1) == 0)
  {
    v19[0] = v4;
    v19[1] = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11));

    v10 = (void *)v12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v14 = objc_msgSend(v13, "isInternalInstall");

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", CFSTR("File a Radar…"), 0, "presentRadar", 0));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrayByAddingObject:", v15));

    v10 = (void *)v16;
  }
  if (objc_msgSend(v10, "count"))
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v10));
  else
    v17 = 0;

  return v17;
}

+ (id)fileMenuStart
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] New Window"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "requestNewWindow:", CFSTR("N"), 0x100000, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Menu] New Tab"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v6, 0, "requestNewTab:", CFSTR("T"), 0x100000, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v9 = sub_1002A8AA0(v8);

  if (v9 == 5)
  {
    v16 = v4;
    v17 = v7;
    v10 = &v16;
    v11 = 2;
  }
  else
  {
    v15 = v4;
    v10 = &v15;
    v11 = 1;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, v11, v15, v16, v17));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v12));

  return v13;
}

+ (id)filePrintKeyCommand
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Print…"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "printCurrentState", CFSTR("P"), 0x100000, 0));

  return v4;
}

+ (id)fileMenuEnd
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "filePrintKeyCommand"));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v3));

  return v4;
}

+ (id)dropPinKeyCommand
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v2 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("[Menu] Mark Location");
  else
    v5 = CFSTR("[Menu] Drop Pin");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v6, 0, "createCustomSearchResultForDroppedPinAtCenterPoint", CFSTR("d"), 1179648, 0));
  return v7;
}

+ (id)editMenu
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dropPinKeyCommand"));
  v3 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("[Menu] Remove Marked Location");
  else
    v6 = CFSTR("[Menu] Remove Pin");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v7, 0, "removeDroppedPin", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Menu] Delete Stop"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v10, 0, "deleteStop", 0));

  v15[0] = v2;
  v15[1] = v8;
  v15[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v12));

  return v13;
}

+ (id)findSubMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Find"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "find:", CFSTR("f"), 0x100000, 0));

  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, UIMenuFind, 1, v5));

  return v6;
}

+ (id)mapModeSubMenuCommands
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Explore Map"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "switchMapMode:", CFSTR("1"), 0x100000, &off_10126DCF0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Switch to Explore"), CFSTR("localized string not found"), 0));
  objc_msgSend(v4, "setDiscoverabilityTitle:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Menu] Driving"), CFSTR("localized string not found"), 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v8, 0, "switchMapMode:", CFSTR("2"), 0x100000, &off_10126DD20));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Switch to Driving"), CFSTR("localized string not found"), 0));
  objc_msgSend(v9, "setDiscoverabilityTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Menu] Transit"), CFSTR("localized string not found"), 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v13, 0, "switchMapMode:", CFSTR("3"), 0x100000, &off_10126DD38));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Switch to Transit"), CFSTR("localized string not found"), 0));
  objc_msgSend(v14, "setDiscoverabilityTitle:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[Menu] Satellite"), CFSTR("localized string not found"), 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v18, 0, "switchMapMode:", CFSTR("4"), 0x100000, &off_10126DD08));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Switch to Satellite"), CFSTR("localized string not found"), 0));
  objc_msgSend(v19, "setDiscoverabilityTitle:", v21);

  v24[0] = v4;
  v24[1] = v9;
  v24[2] = v14;
  v24[3] = v19;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));

  return v22;
}

+ (id)mapModeSubMenu
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mapModeSubMenuCommands"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, CFSTR("MapModeSubMenuIdentifier"), 1, v2));

  return v3;
}

+ (id)zoomSubMenuCommands
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[6];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Default Zoom"), CFSTR("localized string not found"), 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "defaultZoom", CFSTR("0"), 0x100000, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Menu] Zoom In"), CFSTR("localized string not found"), 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v5, 0, "zoomIn", CFSTR("+"), 0x100000, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Menu] Zoom Out"), CFSTR("localized string not found"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v7, 0, "zoomOut", CFSTR("-"), 0x100000, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Menu] Snap to North"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v10, 0, "snapToNorth", UIKeyInputUpArrow, 1179648, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Menu] Show 3D Map"), CFSTR("localized string not found"), 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Menu] Hide 3D Map"), CFSTR("localized string not found"), 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand _maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:input:modifierFlags:](UIKeyCommand, "_maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:input:modifierFlags:", v13, v15, "select3dMode", CFSTR("d"), 0x100000));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[Menu] Show Look Around"), CFSTR("localized string not found"), 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("[Menu] Hide Look Around"), CFSTR("localized string not found"), 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand _maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:input:modifierFlags:](UIKeyCommand, "_maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:input:modifierFlags:", v18, v20, "selectLookAroundMode", CFSTR("k"), 0x100000));

  v26[0] = v25;
  v26[1] = v24;
  v26[2] = v8;
  v26[3] = v11;
  v26[4] = v16;
  v26[5] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 6));

  return v22;
}

+ (id)zoomSubMenu
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "zoomSubMenuCommands"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, CFSTR("ZoomSubMenuIdentifier"), 1, v2));

  return v3;
}

+ (id)currentLocationSubMenu
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
  _QWORD v13[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Go to Current Location"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "centerMapToUserLocation", CFSTR("l"), 0x100000, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Menu] Show Directions"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Menu] Hide Directons"), CFSTR("localized string not found"), 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand _maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:input:modifierFlags:](UIKeyCommand, "_maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:input:modifierFlags:", v6, v8, "toggleDirections", CFSTR("r"), 0x100000));

  v13[0] = v4;
  v13[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, CFSTR("CurrentLocationSubMenuIdentifier"), 1, v10));

  return v11;
}

+ (id)visibleAttributesSubMenu
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
  _QWORD v20[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Show Scale"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Menu] Hide Scale"), CFSTR("localized string not found"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand _maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:](UICommand, "_maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:", v3, v5, "toggleMapScale"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Menu] Show Traffic"), CFSTR("localized string not found"), 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Menu] Hide Traffic"), CFSTR("localized string not found"), 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand _maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:](UICommand, "_maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:", v8, v10, "toggleTraffic"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Menu] Show Labels"), CFSTR("localized string not found"), 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Menu] Hide Labels"), CFSTR("localized string not found"), 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand _maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:](UICommand, "_maps_commandWithEnableFeatureTitle:disableFeatureTitle:action:", v13, v15, "toggleLabels"));

  v20[0] = v6;
  v20[1] = v11;
  v20[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, CFSTR("VisibleAttributesSubMenuIdentifier"), 1, v17));

  return v18;
}

+ (id)performanceTestsMenu
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Maps")));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathForResource:ofType:", CFSTR("testDefinitions"), CFSTR("plist")));

  v16 = (void *)v3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithContentsOfFile:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testName")));
        if (objc_msgSend(v12, "length"))
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_10055D73C;
          v17[3] = &unk_1011BB258;
          v18 = v12;
          v19 = v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v18, 0, 0, v17));
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", CFSTR("Performance Tests"), v5));
  return v14;
}

+ (id)debugMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v25[2];
  _QWORD v26[3];
  void *v27;
  _QWORD v28[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Debug Menu…"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "presentMapsDebugControllerIfEnabled", CFSTR(","), 1572864, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", CFSTR("Disable Menu Sharing"), 0, "toggleDisableMenuSharing", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setState:", objc_msgSend(v6, "BOOLForKey:", CFSTR("MENU_SHARING_DISABLED_KEY")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", CFSTR("Enable Sidebar Selection"), 0, "toggleSidebarSelection", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("SIDEBAR_SELECTION_ENABLED_KEY")));

  v10 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = objc_msgSend(v9, "BOOLValue");
  else
    v11 = 1;

  objc_msgSend(v7, "setState:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", CFSTR("Scrolling Opens Placecard"), 0, "toggleScrollingOpensPlacecard", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v12, "setState:", objc_msgSend(v13, "BOOLForKey:", CFSTR("SCROLLING_OPENS_PLACECARD_KEY_ROTATED")));

  v28[0] = v5;
  v28[1] = v7;
  v28[2] = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", CFSTR("Maps Catalyst Defaults"), 0, 0, 0, v14));

  v27 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v19 = sub_1002A8AA0(v18);

  if (v19 == 5)
  {
    v26[0] = v4;
    v26[1] = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "performanceTestsMenu"));
    v26[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 3));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", CFSTR("Debug"), v21));

  }
  else
  {
    v25[0] = v4;
    v25[1] = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", CFSTR("Debug"), v20));
  }

  return v22;
}

+ (id)addMenu
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[3];
  void *v43;
  _QWORD v44[2];
  _BYTE v45[128];

  v2 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("[Menu] Pinned");
  else
    v5 = CFSTR("[Menu] Favorites");
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  v36 = (void *)v6;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v6, 0, "presentAddToFavorites", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentCollectionsForToolbarMenu"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v16, 0, "presentAddToCollection:", v17));

          objc_msgSend(v7, "addObject:", v18);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v11);
  }

  v19 = objc_msgSend(v7, "copy");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v19));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[Menu] Add New Place To"), CFSTR("localized string not found"), 0));
  v44[0] = v37;
  v44[1] = v35;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", v21, v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Menu] Create New Guide"), CFSTR("localized string not found"), 0));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v25, 0, "presentAddNewCollection", 0));
  v43 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v27));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("[Menu] New Tab"), CFSTR("localized string not found"), 0));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v30, 0, "requestNewTab:", CFSTR("T"), 0x100000, 0));

  v42[0] = v23;
  v42[1] = v28;
  v42[2] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 3));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v32));

  return v33;
}

+ (id)disabledAddMenu
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
  _QWORD v14[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Menu] Add New Place To"), CFSTR("localized string not found"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v3, 0, 0, &stru_1011BB278));

  objc_msgSend(v4, "setAttributes:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Menu] Create New Guide"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, 0, 0, &stru_1011BB298));
  objc_msgSend(v7, "setAttributes:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Menu] New Tab"), CFSTR("localized string not found"), 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v9, 0, "requestNewTab:", CFSTR("T"), 0x100000, 0));

  v14[0] = v4;
  v14[1] = v7;
  v14[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v11));

  return v12;
}

+ (id)sendToDeviceAndShareMenuWithSendToDeviceEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];
  void *v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("MENU_SHARING_DISABLED_KEY"));

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Menu] Share"), CFSTR("localized string not found"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v8, 0, "_share:", UICommandTagShare));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("[Menu] Send to Device"), CFSTR("localized string not found"), 0));

  if (v3 && objc_msgSend(v9, "count"))
  {
    v12 = objc_msgSend(v9, "copy");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v11, 0, 0, 0, v12));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v11, 0, 0, &stru_1011BB2B8));
    objc_msgSend(v13, "setAttributes:", 1);
  }
  v19 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  if (v6)
  {
    v18[0] = v6;
    v18[1] = v13;
    v15 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));

    v14 = (void *)v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, CFSTR("SendToDeviceAndShareSubMenuIdentifier"), 1, v14));

  return v16;
}

@end
