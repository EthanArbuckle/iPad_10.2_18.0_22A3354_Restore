@implementation CollectionTextActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", UIActivityTypeMail))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider mapItems](self, "mapItems"));
    v7 = HTMLStringForAnnotatedSnapshotImageWithMapItems();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Maps Guide: Guide Name [User Guide Sharing]"), CFSTR("localized string not found"), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_navigation_sanitizedStringForDisplayInHTML"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("count_of_places"), CFSTR("localized string not found"), 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider mapItems](self, "mapItems"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, objc_msgSend(v17, "count")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_navigation_sanitizedStringForDisplayInHTML"));

    v20 = (void *)v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<b>%@</b><br>%@"), v14, v19));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sharingURL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Open in Apple Maps [User Guide Sharing]"), CFSTR("localized string not found"), 0));
    v26 = HTMLStringForURLWithLabel(v23, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    v28 = HTMLBodyWrapperStringWithFormat(CFSTR("%@<br><br>%@<br><br>%@"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

LABEL_7:
    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "isEqualToString:", UIActivityTypeMessage) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", UIActivityTypeCopyToPasteboard) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    goto LABEL_7;
  }
  v29 = 0;
LABEL_8:

  return v29;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1011EB268;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  return v5;
}

@end
