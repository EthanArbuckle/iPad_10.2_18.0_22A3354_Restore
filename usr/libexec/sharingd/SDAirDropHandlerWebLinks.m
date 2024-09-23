@implementation SDAirDropHandlerWebLinks

- (SDAirDropHandlerWebLinks)initWithTransfer:(id)a3
{
  id v4;
  void *v5;
  SDAirDropHandlerWebLinks *v6;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropHandlerWebLinks safariBundleID](SDAirDropHandlerWebLinks, "safariBundleID"));
  v8.receiver = self;
  v8.super_class = (Class)SDAirDropHandlerWebLinks;
  v6 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v8, "initWithTransfer:bundleIdentifier:", v4, v5);

  return v6;
}

+ (id)safariBundleID
{
  return CFSTR("com.apple.mobilesafari");
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (!-[SDAirDropHandler isJustLinks](self, "isJustLinks"))
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completedURLs"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));
        if (objc_msgSend(v11, "isEqual:", CFSTR("http")))
        {

        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scheme"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));
          v14 = objc_msgSend(v13, "isEqual:", CFSTR("https"));

          if (!v14)
          {
            v15 = 0;
            goto LABEL_15;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_15:

  return v15;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerWebLinks;
  return -[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x8000000000;
}

- (id)suitableContentsDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v29;
  void *v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metaData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsDescription"));

  if (qword_1007C6500 != -1)
    dispatch_once(&qword_1007C6500, &stru_100714D48);
  if (v4 != 1)
  {
    v16 = 0;
LABEL_10:
    v29 = CFSTR("WEBSITE");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v30 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v31 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    v24 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v23));

    v26 = SFLocalizedStringForKey(v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v3, v4));

    v16 = (void *)v24;
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropHandlerWebLinks safariBundleID](SDAirDropHandlerWebLinks, "safariBundleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metaData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "senderBundleID"));
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if (!v11 || !v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completedURLs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_lp_simplifiedDisplayString"));

    v7 = (void *)v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", &off_10074F9A0));
  v18 = SFLocalizedStringForKey(v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v3, v7));

  if (!v20)
    goto LABEL_10;
LABEL_11:

  return v20;
}

@end
