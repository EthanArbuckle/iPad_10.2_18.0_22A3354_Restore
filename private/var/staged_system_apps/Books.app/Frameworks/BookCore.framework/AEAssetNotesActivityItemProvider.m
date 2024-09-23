@implementation AEAssetNotesActivityItemProvider

- (AEAssetNotesActivityItemProvider)initWithDelegate:(id)a3 propertySource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  AEAssetNotesActivityItemProvider *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v9 = (objc_class *)objc_opt_class(self, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v14.receiver = self;
  v14.super_class = (Class)AEAssetNotesActivityItemProvider;
  v12 = -[AEAssetBaseActivityItemProvider initWithDelegate:placeholderItem:propertySource:](&v14, "initWithDelegate:placeholderItem:propertySource:", v7, v11, v6);

  return v12;
}

- (BOOL)supportsActivityType:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", UIActivityTypeSaveToNotes) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Notes.SharingExtension"));

  return v4;
}

- (id)placeholderItem
{
  return &stru_296430;
}

- (id)item
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  id v40;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetNotesActivityItemProvider activityType](self, "activityType"));
  v4 = -[AEAssetBaseActivityItemProvider shouldShareActivityType:](self, "shouldShareActivityType:", v3);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetNotesActivityItemProvider activityType](self, "activityType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    objc_msgSend(v6, "setActivityType:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));

    if (objc_msgSend(v9, "length"))
    {
      v10 = objc_msgSend(v9, "copy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "author"));

    if (objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(v12, "copy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("author"));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "genre"));

    if (objc_msgSend(v15, "length"))
    {
      v16 = objc_msgSend(v15, "copy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("genre"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "publisherYear"));

    if (objc_msgSend(v18, "length"))
    {
      v19 = objc_msgSend(v18, "copy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("publishing_date"));

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "assetTypeString"));

    if (objc_msgSend(v21, "length"))
    {
      v22 = objc_msgSend(v21, "copy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("media_type"));

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider", v12));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bookDescription"));

    if (objc_msgSend(v24, "length"))
    {
      v25 = objc_msgSend(v24, "copy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("description"));

    }
    v26 = v9;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "seriesTitle"));

    if (objc_msgSend(v28, "length"))
    {
      v29 = objc_msgSend(v28, "copy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("series"));

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
    v31 = objc_msgSend(v30, "isStoreAsset");

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "storeURL"));

      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "storeURL"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("url"));

      }
    }
    v40 = 0;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v40));
    v37 = v40;
    if (!v36 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1B4F80();

  }
  else
  {
    v36 = 0;
  }
  return v36;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v4;
  __CFString *v5;

  v4 = a4;
  if ((objc_msgSend(v4, "isEqualToString:", UIActivityTypeSaveToNotes) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Notes.SharingExtension")))
  {
    v5 = CFSTR("com.apple.notes.share-metadata");
  }
  else
  {
    v5 = &stru_296430;
  }

  return v5;
}

@end
