@implementation MapsSharedTripVirtualReceiversDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Virtual Receivers");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsSharedTripVirtualReceiversDebugController;
  -[MapsDebugValuesViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  -[MapsDebugValuesViewController rebuildSections](self, "rebuildSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  objc_msgSend(v4, "addSendingObserver:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsSharedTripVirtualReceiversDebugController;
  -[MapsSharedTripVirtualReceiversDebugController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  objc_msgSend(v4, "removeSendingObserver:", self);

}

- (void)prepareContent
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id location;
  objc_super v26;
  _BYTE v27[128];

  v26.receiver = self;
  v26.super_class = (Class)MapsSharedTripVirtualReceiversDebugController;
  v2 = -[MapsDebugValuesViewController prepareContent](&v26, "prepareContent");
  if ((MSPSharedTripSharingAvailable(v2, v3) & 1) != 0)
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "receivers"));
    v6 = sub_10039DCD4(v5, &stru_1011E04C0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (objc_msgSend(v16, "count"))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = v16;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName", v16));
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_100A3BE30;
            v19[3] = &unk_1011DE5F0;
            v19[4] = v11;
            objc_copyWeak(&v20, &location);
            v13 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v12, v19);

            objc_destroyWeak(&v20);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        }
        while (v8);
      }

    }
    else
    {
      v15 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Virtual Receivers"), &stru_1011E04E0);
    }
    -[MapsSharedTripVirtualReceiversDebugController _addSectionWithTitle:forMapsSharing:defaultName:contactBuilder:](self, "_addSectionWithTitle:forMapsSharing:defaultName:contactBuilder:", CFSTR("Maps"), 1, CFSTR("Maps Receiver"), &stru_1011E0598, v16);
    -[MapsSharedTripVirtualReceiversDebugController _addSectionWithTitle:forMapsSharing:defaultName:contactBuilder:](self, "_addSectionWithTitle:forMapsSharing:defaultName:contactBuilder:", CFSTR("iMessage"), 0, CFSTR("iMessage Receiver"), &stru_1011E05B8);
    -[MapsSharedTripVirtualReceiversDebugController _addSectionWithTitle:forMapsSharing:defaultName:contactBuilder:](self, "_addSectionWithTitle:forMapsSharing:defaultName:contactBuilder:", CFSTR("SMS"), 0, CFSTR("SMS Receiver"), &stru_1011E05D8);

    objc_destroyWeak(&location);
  }
  else
  {
    v14 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", 0, &stru_1011E0480);
  }
}

- (void)_addSectionWithTitle:(id)a3 forMapsSharing:(BOOL)a4 defaultName:(id)a5 contactBuilder:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A3C504;
  v16[3] = &unk_1011E06E8;
  v13 = v11;
  v17 = v13;
  v20 = a4;
  v14 = v12;
  v18 = v14;
  objc_copyWeak(&v19, &location);
  v15 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", v10, v16);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

@end
