@implementation SDAirDropHandleriLifeLinks

- (BOOL)canHandleTransfer
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = -[SDAirDropHandler isJustLinks](self, "isJustLinks");
  if (v3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completedURLs"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      v9 = 1;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxyFromCandidateIdentifiers:handlesURL:](self, "bundleProxyFromCandidateIdentifiers:handlesURL:", &off_10074F988, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i)));
          v12 = v11;
          if (v11 == 0 || !v9)
          {

            LOBYTE(v3) = 0;
            return v3;
          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
            v15 = objc_msgSend(v14, "isEqual:", v12);

          }
          else
          {
            -[SDAirDropHandler setBundleProxy:](self, "setBundleProxy:", v12);
            v15 = 1;
          }

          v9 = v15 != 0;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v15 = 1;
    }

    LOBYTE(v3) = v15 != 0;
  }
  return v3;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandleriLifeLinks;
  return -[SDAirDropHandlerGenericLinks transferTypes](&v3, "transferTypes") | 0x2000000000;
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
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v16 = CFSTR("ILIFE_ITEM");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v7));

  v10 = SFLocalizedStringForKey(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v3, v4, v13));

  return v14;
}

@end
