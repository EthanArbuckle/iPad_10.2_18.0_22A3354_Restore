@implementation SDAirDropHandlerContacts

- (SDAirDropHandlerContacts)initWithTransfer:(id)a3
{
  SDAirDropHandlerContacts *v3;
  SDAirDropHandlerContacts *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  void *v10;

  v9.receiver = self;
  v9.super_class = (Class)SDAirDropHandlerContacts;
  v3 = -[SDAirDropHandlerGenericFiles initWithTransfer:bundleIdentifier:](&v9, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.MobileAddressBook"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](v3, "bundleProxy"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](v4, "bundleProxy"));
      v10 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
      -[SDAirDropHandlerGenericFiles setAvailableApplications:](v4, "setAvailableApplications:", v7);

    }
  }
  return v4;
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (!-[SDAirDropHandler isJustFiles](self, "isJustFiles"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawFiles"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 1;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rawFiles"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    v13 = kSFOperationFileTypeKey;
    v14 = kSFOperationFileNameKey;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v13));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v14));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pathExtension"));

        LODWORD(v18) = SFIsContact(v17, v19);
        if (!(_DWORD)v18)
        {
          v20 = 0;
          goto LABEL_14;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }
  v20 = 1;
LABEL_14:

  return v20;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerContacts;
  return (unint64_t)-[SDAirDropHandlerGenericFiles transferTypes](&v3, "transferTypes") | 0x80;
}

- (id)suitableContentsDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v16 = CFSTR("CONTACT");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v7));

  LODWORD(v6) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  v10 = SFLocalizedStringForKey(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((_DWORD)v6)
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v4, v15);
  else
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v3, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)defaultOpenActionBundleID
{
  return 0;
}

@end
