@implementation OpenOfflineMapsManagementActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  v6 = objc_opt_class(OpenOfflineMapsManagementAction);
  if ((objc_opt_isKindOfClass(v14, v6) & 1) != 0)
  {
    v7 = v14;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadRegion"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadRegion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadRegionName"));
      objc_msgSend(v9, "showOfflineMapRegionSelectorForRegion:name:pushDataManagementFirst:", v10, v11, 1);

    }
    else
    {
      v12 = objc_msgSend(v7, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
      v9 = v13;
      if (v12 == (id)1)
        objc_msgSend(v13, "viewControllerShowExpiredOfflineMaps:", 0);
      else
        objc_msgSend(v13, "viewControllerShowOfflineMaps:", 0);
    }

  }
}

@end
