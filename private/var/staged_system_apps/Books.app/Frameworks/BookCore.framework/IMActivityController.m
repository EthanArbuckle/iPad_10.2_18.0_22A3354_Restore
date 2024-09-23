@implementation IMActivityController

- (IMActivityController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 shareType:(int64_t)a5 propertySource:(id)a6 tracker:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IMActivityController *v17;
  IMActivityController *v18;
  AEAssetActivityPropertyProvider *v19;
  AEAssetActivityPropertyProvider *propertyProvider;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = -[IMActivityController init](self, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_activityItems, a3);
    objc_storeStrong((id *)&v18->_applicationActivities, a4);
    v18->_shareType = a5;
    v19 = -[AEAssetActivityPropertyProvider initWithPropertySource:]([AEAssetActivityPropertyProvider alloc], "initWithPropertySource:", v15);
    propertyProvider = v18->_propertyProvider;
    v18->_propertyProvider = v19;

    objc_storeStrong((id *)&v18->_tracker, a7);
  }

  return v18;
}

- (IMActivityController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 shareType:(int64_t)a5 propertySource:(id)a6 sharingStyle:(int64_t)a7 customActivityTypeOrder:(id)a8 customShareActivityTitle:(id)a9 tracker:(id)a10
{
  id v17;
  id v18;
  IMActivityController *v19;
  IMActivityController *v20;
  NSString *v21;
  NSString *customShareActivityTitle;

  v17 = a8;
  v18 = a9;
  v19 = -[IMActivityController initWithActivityItems:applicationActivities:shareType:propertySource:tracker:](self, "initWithActivityItems:applicationActivities:shareType:propertySource:tracker:", a3, a4, a5, a6, a10);
  v20 = v19;
  if (v19)
  {
    v19->_sharingStyle = a7;
    objc_storeStrong((id *)&v19->_customActivityTypeOrder, a8);
    v21 = (NSString *)objc_msgSend(v18, "copy");
    customShareActivityTitle = v20->_customShareActivityTitle;
    v20->_customShareActivityTitle = v21;

  }
  return v20;
}

- (void)setCompletionHandler:(id)a3
{
  id v4;
  id completionHandler;

  v4 = objc_retainBlock(a3);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v4;

}

- (id)viewController
{
  void *v3;
  BCActivityViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BCActivityViewController *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController activityVC](self, "activityVC"));

  if (!v3)
  {
    v4 = [BCActivityViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController activityItems](self, "activityItems"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController expandedActivityItems](self, "expandedActivityItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController applicationActivities](self, "applicationActivities"));
    v8 = -[IMActivityController sharingStyle](self, "sharingStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController customActivityTypeOrder](self, "customActivityTypeOrder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController customShareActivityTitle](self, "customShareActivityTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController propertyProvider](self, "propertyProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController tracker](self, "tracker"));
    v13 = -[BCActivityViewController initWithRootActivityItems:expandedActivityItems:applicationActivities:sharingStyle:customActivityTypeOrder:customShareActivityTitle:appAnalyticsProvider:tracker:](v4, "initWithRootActivityItems:expandedActivityItems:applicationActivities:sharingStyle:customActivityTypeOrder:customShareActivityTitle:appAnalyticsProvider:tracker:", v5, v6, v7, v8, v9, v10, v11, v12);

    if ((char *)-[IMActivityController shareType](self, "shareType") != (char *)&dword_0 + 2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController includedActivityTypes](self, "includedActivityTypes"));
      -[BCActivityViewController setIncludedActivityTypes:](v13, "setIncludedActivityTypes:", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController excludedActivityTypes](self, "excludedActivityTypes"));
    -[BCActivityViewController setExcludedActivityTypes:](v13, "setExcludedActivityTypes:", v15);

    -[BCActivityViewController setManagedBook:](v13, "setManagedBook:", self->_managedBook);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_144200;
    v17[3] = &unk_292518;
    v17[4] = self;
    -[BCActivityViewController setCompletionWithItemsHandler:](v13, "setCompletionWithItemsHandler:", v17);
    -[IMActivityController setActivityVC:](self, "setActivityVC:", v13);

  }
  return (id)objc_claimAutoreleasedReturnValue(-[IMActivityController activityVC](self, "activityVC"));
}

- (void)dealloc
{
  id completionHandler;
  BCActivityViewController *activityVC;
  objc_super v5;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  activityVC = self->_activityVC;
  self->_activityVC = 0;

  v5.receiver = self;
  v5.super_class = (Class)IMActivityController;
  -[IMActivityController dealloc](&v5, "dealloc");
}

- (NSArray)excludedActivityTypes
{
  id v3;
  void *v4;
  char *v5;
  void *v6;
  unsigned __int8 v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  if ((char *)-[IMActivityController shareType](self, "shareType") == (char *)&dword_0 + 2)
  {
    v16[0] = UIActivityTypeCloudSharing;
    v16[1] = UIActivityTypeMarkupAsPDF;
    v16[2] = UIActivityTypeAddToReadingList;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 3));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController propertyProvider](self, "propertyProvider"));
    v5 = (char *)objc_msgSend(v4, "assetType");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController propertyProvider](self, "propertyProvider"));
    v7 = objc_msgSend(v6, "isStoreAsset");

    if (v5 == (_BYTE *)&dword_0 + 3)
      v8 = 1;
    else
      v8 = v7;
    if (self->_managedBook || (v8 & 1) == 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", UIActivityTypeAirDrop));

      v3 = (id)v9;
    }
    if (v5 != (_BYTE *)&dword_0 + 3)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", UIActivityTypeSaveToFiles));

      v3 = (id)v10;
    }
    if ((v7 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", UIActivityTypePostToFacebook));

      return (NSArray *)v11;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMActivity activityTypes](IMActivity, "activityTypes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController includedActivityTypes](self, "includedActivityTypes"));
    objc_msgSend(v14, "removeObjectsInArray:", v15);

    v3 = objc_msgSend(v14, "copy");
  }
  return (NSArray *)v3;
}

- (id)includedActivityTypes
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = objc_opt_new(NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController expandedActivityItems](self, "expandedActivityItems", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = BUProtocolCast(&OBJC_PROTOCOL___IMActivityItemSource, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = v11;
        if (v11)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "supportedActivityTypes"));
          -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v13);

        }
        else
        {
          v14 = objc_opt_class(CLSContext);
          v15 = BUDynamicCast(v14, v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          if (v16)
          {
            -[NSMutableArray addObject:](v3, "addObject:", CFSTR("com.apple.schoolwork.ClassKitApp.SaveToClassKitApp"));
            -[NSMutableArray addObject:](v3, "addObject:", CFSTR("com.apple.schoolwork.ClassKitApp.ShareWithClassKitApp"));
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSArray)expandedActivityItems
{
  NSArray *expandedActivityItems;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  expandedActivityItems = self->_expandedActivityItems;
  if (!expandedActivityItems)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController activityItems](self, "activityItems"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[IMActivityController expandedActivityItemsFromActivityItems:conformingToProtocol:](self, "expandedActivityItemsFromActivityItems:conformingToProtocol:", v4, &OBJC_PROTOCOL___UIActivityItemSource));
    v6 = self->_expandedActivityItems;
    self->_expandedActivityItems = v5;

    expandedActivityItems = self->_expandedActivityItems;
  }
  return expandedActivityItems;
}

- (id)expandedActivityItemsFromActivityItems:(id)a3 conformingToProtocol:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "conformsToProtocol:", v7))
            objc_msgSend(v8, "addObject:", v14);
          if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___IMActivityItemSourceExpanding))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "expandedItemProviders"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMActivityController expandedActivityItemsFromActivityItems:conformingToProtocol:](self, "expandedActivityItemsFromActivityItems:conformingToProtocol:", v15, v7));

            if (v16)
              objc_msgSend(v8, "addObjectsFromArray:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v6 = v18;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
  objc_storeStrong((id *)&self->_activityItems, a3);
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
  objc_storeStrong((id *)&self->_applicationActivities, a3);
}

- (void)setExpandedActivityItems:(id)a3
{
  objc_storeStrong((id *)&self->_expandedActivityItems, a3);
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isManagedBook
{
  return self->_managedBook;
}

- (void)setManagedBook:(BOOL)a3
{
  self->_managedBook = a3;
}

- (BCActivityViewController)activityVC
{
  return self->_activityVC;
}

- (void)setActivityVC:(id)a3
{
  objc_storeStrong((id *)&self->_activityVC, a3);
}

- (int64_t)shareType
{
  return self->_shareType;
}

- (void)setShareType:(int64_t)a3
{
  self->_shareType = a3;
}

- (AEAssetActivityPropertyProvider)propertyProvider
{
  return self->_propertyProvider;
}

- (void)setPropertyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_propertyProvider, a3);
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (NSArray)customActivityTypeOrder
{
  return self->_customActivityTypeOrder;
}

- (void)setCustomActivityTypeOrder:(id)a3
{
  objc_storeStrong((id *)&self->_customActivityTypeOrder, a3);
}

- (NSString)customShareActivityTitle
{
  return self->_customShareActivityTitle;
}

- (void)setCustomShareActivityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (_TtC13BookAnalytics9BATracker)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
  objc_storeStrong((id *)&self->_tracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_customShareActivityTitle, 0);
  objc_storeStrong((id *)&self->_customActivityTypeOrder, 0);
  objc_storeStrong((id *)&self->_propertyProvider, 0);
  objc_storeStrong((id *)&self->_activityVC, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_expandedActivityItems, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
