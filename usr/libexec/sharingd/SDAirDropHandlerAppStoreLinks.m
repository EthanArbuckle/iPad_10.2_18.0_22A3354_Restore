@implementation SDAirDropHandlerAppStoreLinks

- (SDAirDropHandlerAppStoreLinks)initWithTransfer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerAppStoreLinks;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v4, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.AppStore"));
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
  -[NSMutableArray addObject:](v3, "addObject:", CFSTR("com.apple.TVAppStore"));
  return v3;
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!-[SDAirDropHandler isJustLinks](self, "isJustLinks"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerAppStoreLinks candidateIdentifiers](self, "candidateIdentifiers"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completedURLs"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxyFromCandidateIdentifiers:handlesURL:](self, "bundleProxyFromCandidateIdentifiers:handlesURL:", v3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i)));

        if (!v10)
        {
          v11 = 0;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_13:

  return v11;
}

- (id)singleItemActionTitle
{
  return (id)SFLocalizedStringForKey(CFSTR("VIEW_BUTTON_TITLE"), a2);
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerAppStoreLinks;
  return -[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | (unint64_t)&_mh_execute_header;
}

- (id)suitableContentsDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _UNKNOWN **v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  void *v17;
  uint64_t v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemsDescription"));
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metaData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemsDescription"));

  }
  else
  {
    v9 = 0;
  }

  if (v9)
    v10 = &off_10074FC28;
  else
    v10 = &off_10074FC40;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v10));
  v12 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  v14 = SFLocalizedStringForKey(v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v12)
    v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v9, v19);
  else
    v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v3, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

@end
