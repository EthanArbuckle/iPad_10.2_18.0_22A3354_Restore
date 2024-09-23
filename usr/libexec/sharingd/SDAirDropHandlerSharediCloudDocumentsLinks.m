@implementation SDAirDropHandlerSharediCloudDocumentsLinks

- (SDAirDropHandlerSharediCloudDocumentsLinks)initWithTransfer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerSharediCloudDocumentsLinks;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v4, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.CloudKit.ShareBear"));
}

- (id)candidateIdentifiers
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    -[NSMutableArray addObject:](v3, "addObject:", v6);

  }
  return v3;
}

- (BOOL)urlIsCloudDocument:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;

  v22 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSAppLink appLinksWithURL:limit:error:](LSAppLink, "appLinksWithURL:limit:error:", a3, -1, &v22));
  v5 = v22;
  v6 = v5;
  if (v4)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerSharediCloudDocumentsLinks candidateIdentifiers](self, "candidateIdentifiers"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "targetApplicationRecord", (_QWORD)v18));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));

          if (v13 && (-[NSObject containsObject:](v15, "containsObject:", v13) & 1) != 0)
          {

            LOBYTE(v9) = 1;
            goto LABEL_20;
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_20:

  }
  else
  {
    v14 = airdrop_log(v5);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to get app links with error %@", buf, 0xCu);
    }
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!-[SDAirDropHandler isJustLinks](self, "isJustLinks"))
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completedURLs"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!-[SDAirDropHandlerSharediCloudDocumentsLinks urlIsCloudDocument:](self, "urlIsCloudDocument:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i)))
        {
          v9 = 0;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_13:

  return v9;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerSharediCloudDocumentsLinks;
  return (unint64_t)-[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x40000000;
}

- (id)suitableContentsDescription
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  _UNKNOWN **v34;
  void *v35;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v3 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completedURLs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = SFSharediCloudDocumentsLinkToAppName(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));

  v10 = SFSharediCloudDocumentsLinkToFileName(v6);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)v11;
  v13 = 0;
  if (v3 != 1 || !v9 || !v11)
    goto LABEL_13;
  if ((objc_msgSend(v9, "isEqual:", CFSTR("keynote")) & 1) != 0)
  {
    v14 = CFSTR("SHARED_KEYNOTE_DOCUMENT_LINK");
  }
  else if ((objc_msgSend(v9, "isEqual:", CFSTR("numbers")) & 1) != 0)
  {
    v14 = CFSTR("SHARED_NUMBERS_DOCUMENT_LINK");
  }
  else
  {
    if (!objc_msgSend(v9, "isEqual:", CFSTR("pages")))
    {
      v13 = 0;
LABEL_13:
      v30 = CFSTR("SHARED_ICLOUD_DOCUMENT_LINK");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
      v31 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      v32 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v32, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v24));

      v26 = SFLocalizedStringForKey(v21, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v29, v3));

      goto LABEL_14;
    }
    v14 = CFSTR("SHARED_PAGES_DOCUMENT_LINK");
  }
  v33 = v14;
  v34 = &off_10074B2F8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  v35 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v16));

  v18 = SFLocalizedStringForKey(v13, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v29, v12));

  v21 = v13;
  if (!v20)
    goto LABEL_13;
LABEL_14:

  return v20;
}

@end
