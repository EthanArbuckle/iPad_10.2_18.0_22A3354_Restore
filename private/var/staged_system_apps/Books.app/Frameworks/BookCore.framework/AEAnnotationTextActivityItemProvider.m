@implementation AEAnnotationTextActivityItemProvider

- (id)supportedActivityTypes
{
  _QWORD v3[6];

  v3[0] = UIActivityTypeMessage;
  v3[1] = CFSTR("com.apple.share.Messages.window");
  v3[2] = UIActivityTypeCopyToPasteboard;
  v3[3] = UIActivityTypeSaveToNotes;
  v3[4] = CFSTR("com.apple.Notes.SharingExtension");
  v3[5] = UIActivityTypeCreateReminder;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 6));
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;

  v5 = a4;
  if (-[AEAssetActivityItemProviderSource supportsActivityType:](self, "supportsActivityType:", v5))
  {
    if (objc_msgSend(v5, "isEqualToString:", UIActivityTypeCopyToPasteboard)
      || (objc_msgSend(v5, "isEqualToString:", UIActivityTypeCreateReminder) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", UIActivityTypeSaveToNotes) & 1) != 0
      || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Notes.SharingExtension")))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationTextActivityItemProvider textForActivityType:](self, "textForActivityType:", v5));
      goto LABEL_10;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource annotations](self, "annotations"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    if (!objc_msgSend(v15, "isStoreAsset")
      || (objc_msgSend(v14, "annotationHasNote") & 1) != 0)
    {

LABEL_14:
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationTextActivityItemProvider textForActivityType:](self, "textForActivityType:", v5));
LABEL_15:

      goto LABEL_10;
    }
    if ((objc_msgSend(v5, "isEqualToString:", UIActivityTypeMessage) & 1) != 0)
    {

    }
    else
    {
      v16 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.share.Messages.window"));

      if ((v16 & 1) == 0)
        goto LABEL_14;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource _generateLinkMetadata](self, "_generateLinkMetadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URL"));

    goto LABEL_15;
  }
  v7 = AESharingLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v18 = 138412546;
    v19 = v11;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%@ returning nil for activity:%@", (uint8_t *)&v18, 0x16u);

  }
  v6 = 0;
LABEL_10:

  return v6;
}

- (id)textForActivityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  id v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource text](self, "text"));
  if ((unint64_t)objc_msgSend(v5, "tokenCountWithEnumerationOptions:maxTokenCount:outLimitLength:", 3, -1, 0) >= 4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByEnclosingInQuotes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource annotations](self, "annotations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    v45 = v8;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "annotationNote"));
    if (objc_msgSend(v46, "length"))
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\n%@"), v46));

      v6 = (void *)v9;
    }
    v10 = IMCommonCoreBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Excerpt From"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

    v13 = IMCommonCoreBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("This material may be protected by copyright."), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

    if (objc_msgSend(v4, "isEqualToString:", UIActivityTypeCopyToPasteboard))
    {
      v42 = v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));

      if (objc_msgSend(v18, "length"))
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("\n%@"), v18));

        v16 = (void *)v19;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "author"));

      if (objc_msgSend(v21, "length"))
      {
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("\n%@"), v21));

        v16 = (void *)v22;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "storeURLPreferShort"));

      v44 = v21;
      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "absoluteString"));
        v26 = v15;
        v27 = v6;
        v28 = v4;
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("\n%@"), v25));

        v16 = (void *)v29;
        v4 = v28;
        v6 = v27;
        v15 = v26;
      }
      v12 = v42;
      v30 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n\n%@%@\n%@"), v6, v42, v16, v15));

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource citation](self, "citation"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n\n%@: %@\n%@"), v6, v12, v16, v15));

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      if (!objc_msgSend(v18, "isStoreAsset"))
        goto LABEL_22;
      v43 = v15;
      v31 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.share.Messages.window"));

      if ((v31 & 1) != 0)
      {
        v15 = v43;
LABEL_23:

        v5 = v24;
        goto LABEL_24;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "storeURLPreferShort"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "absoluteString"));

      if (!v18)
      {
        v15 = v43;
        goto LABEL_22;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v35 = (char *)objc_msgSend(v34, "assetType");

      v36 = IMCommonCoreBundle();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = v37;
      if (v35 == (_BYTE *)&dword_4 + 2)
        v39 = CFSTR("Check out this audiobook on Apple Books:");
      else
        v39 = CFSTR("Check out this book on Apple Books:");
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", v39, &stru_296430, CFSTR("BCCommonCoreLocalizable")));

      v44 = (void *)v40;
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("\n\n%@ %@"), v40, v18));
      v15 = v43;
    }

    v24 = (void *)v30;
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:

  return v5;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_opt_class(self);
  if (v4 == objc_opt_class(AEAnnotationTextActivityItemProvider))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource _generateLinkMetadata](self, "_generateLinkMetadata"));
  else
    v5 = 0;
  return v5;
}

@end
