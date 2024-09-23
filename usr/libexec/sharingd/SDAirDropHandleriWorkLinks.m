@implementation SDAirDropHandleriWorkLinks

- (SDAirDropHandleriWorkLinks)initWithTransfer:(id)a3
{
  id v4;
  SDAirDropHandleriWorkLinks *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SDAirDropHandleriWorkLinks;
  v5 = -[SDAirDropHandler initWithTransfer:](&v10, "initWithTransfer:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completedURLs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriWorkLinks bundleProxyForiWorkURL:](v5, "bundleProxyForiWorkURL:", v7));
    -[SDAirDropHandler setBundleProxy:](v5, "setBundleProxy:", v8);

  }
  return v5;
}

- (BOOL)canHandleTransfer
{
  SDAirDropHandlerWebLinks *v3;
  void *v4;
  SDAirDropHandlerWebLinks *v5;
  SDAirDropHandlerWebLinks *webLinksHandler;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];

  v19.receiver = self;
  v19.super_class = (Class)SDAirDropHandleriWorkLinks;
  if (!-[SDAirDropHandlerGenericLinks canHandleTransfer](&v19, "canHandleTransfer"))
  {
    v3 = [SDAirDropHandlerWebLinks alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v5 = -[SDAirDropHandlerWebLinks initWithTransfer:](v3, "initWithTransfer:", v4);
    webLinksHandler = self->_webLinksHandler;
    self->_webLinksHandler = v5;

    if (!-[SDAirDropHandlerWebLinks canHandleTransfer](self->_webLinksHandler, "canHandleTransfer"))
      return 0;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "completedURLs"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "isiWorkURL"))
        {
          v13 = 0;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_13:

  return v13;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandleriWorkLinks;
  return (unint64_t)-[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x10000000;
}

- (id)bundleProxyForiWorkURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  NSString *v11;
  NSString *appName;

  v4 = a3;
  if (!objc_msgSend(v4, "isiWorkURL"))
  {
    v8 = 0;
    goto LABEL_14;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iWorkApplicationName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "capitalizedString"));

  if ((objc_msgSend(v6, "isEqual:", CFSTR("Pages")) & 1) != 0)
  {
    v7 = CFSTR("com.apple.Pages");
  }
  else if ((objc_msgSend(v6, "isEqual:", CFSTR("Numbers")) & 1) != 0)
  {
    v7 = CFSTR("com.apple.Numbers");
  }
  else
  {
    if (!objc_msgSend(v6, "isEqual:", CFSTR("Keynote")))
    {
      v8 = 0;
      goto LABEL_10;
    }
    v7 = CFSTR("com.apple.Keynote");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v7));
LABEL_10:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appState"));
  v10 = objc_msgSend(v9, "isInstalled");

  if (v10)
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedName"));
    appName = self->_appName;
    self->_appName = v11;
  }
  else
  {
    objc_storeStrong((id *)&self->_appName, v6);
    appName = (NSString *)v8;
    v8 = 0;
  }

LABEL_14:
  return v8;
}

- (id)documentName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "completedURLs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iWorkDocumentName"));
  return v5;
}

- (id)suitableContentsDescription
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v5 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandleriWorkLinks documentName](self, "documentName"));
  v6 = (void *)v5;
  if (v4 == 1 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", &off_10074FC10));
    v9 = SFLocalizedStringForKey(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v3, self->_appName, v6));

  }
  else
  {
    v19 = CFSTR("IWORK_LINK");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v20 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v21 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v14));

    v16 = SFLocalizedStringForKey(v7, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v3, v4, self->_appName));

  }
  return v11;
}

- (void)updatePossibleActions
{
  SDAirDropHandlerWebLinks *webLinksHandler;
  id v4;
  objc_super v5;

  webLinksHandler = self->_webLinksHandler;
  if (webLinksHandler)
  {
    -[SDAirDropHandlerGenericLinks updatePossibleActions](webLinksHandler, "updatePossibleActions");
    v4 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler completionHandler](self, "completionHandler"));
    -[SDAirDropHandler setCompletionHandler:](self->_webLinksHandler, "setCompletionHandler:", v4);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SDAirDropHandleriWorkLinks;
    -[SDAirDropHandlerGenericLinks updatePossibleActions](&v5, "updatePossibleActions");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webLinksHandler, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
