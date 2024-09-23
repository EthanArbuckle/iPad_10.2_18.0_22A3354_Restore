@implementation SDAirDropHandlerKeynoteLiveLinks

- (SDAirDropHandlerKeynoteLiveLinks)initWithTransfer:(id)a3
{
  SDAirDropHandlerKeynoteLiveLinks *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDAirDropHandlerKeynoteLiveLinks;
  v3 = -[SDAirDropHandler initWithTransfer:](&v6, "initWithTransfer:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleProxy bundleProxyForIdentifier:](LSBundleProxy, "bundleProxyForIdentifier:", CFSTR("com.apple.Keynote")));
    -[SDAirDropHandler setBundleProxy:](v3, "setBundleProxy:", v4);

  }
  return v3;
}

- (BOOL)canHandleTransfer
{
  void *v3;
  SDAirDropHandlerWebLinks *v4;
  void *v5;
  SDAirDropHandlerWebLinks *v6;
  SDAirDropHandlerWebLinks *webLinksHandler;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (!-[SDAirDropHandler isJustLinks](self, "isJustLinks"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (!v3)
  {
    v4 = [SDAirDropHandlerWebLinks alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v6 = -[SDAirDropHandlerWebLinks initWithTransfer:](v4, "initWithTransfer:", v5);
    webLinksHandler = self->_webLinksHandler;
    self->_webLinksHandler = v6;

    if (!-[SDAirDropHandlerWebLinks canHandleTransfer](self->_webLinksHandler, "canHandleTransfer"))
      return 0;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completedURLs"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        if (!SFIsKeynoteLiveLink(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i)))
        {
          v14 = 0;
          goto LABEL_15;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_15:

  return v14;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerKeynoteLiveLinks;
  return (unint64_t)-[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x20000000;
}

- (id)suitableContentsDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", &off_10074F970));
  v6 = SFLocalizedStringForKey(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v3));

  return v8;
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
    v5.super_class = (Class)SDAirDropHandlerKeynoteLiveLinks;
    -[SDAirDropHandlerGenericLinks updatePossibleActions](&v5, "updatePossibleActions");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webLinksHandler, 0);
}

@end
