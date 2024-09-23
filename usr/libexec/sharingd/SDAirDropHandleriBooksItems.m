@implementation SDAirDropHandleriBooksItems

- (SDAirDropHandleriBooksItems)initWithTransfer:(id)a3
{
  SDAirDropHandleriBooksItems *v3;
  SDAirDropHandleriBooksItems *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  void *v10;

  v9.receiver = self;
  v9.super_class = (Class)SDAirDropHandleriBooksItems;
  v3 = -[SDAirDropHandlerGenericFiles initWithTransfer:bundleIdentifier:](&v9, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.iBooks"));
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
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = -[SDAirDropHandler isJustFiles](self, "isJustFiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  v7 = objc_msgSend(v6, "count");

  v8 = 0;
  v9 = 1;
  if (v3 && (unint64_t)v7 >= 2)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "metaData"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "type"));
          v9 &= SFIsePub();

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "type"));
          if (SFIsPDF(v19))
          {

          }
          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "type"));
            v21 = SFIsePub();

            if (!v21)
            {
              v8 = 0;
              goto LABEL_15;
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          continue;
        break;
      }
    }
    v8 = 1;
LABEL_15:

  }
  return v8 & (v9 ^ 1);
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandleriBooksItems;
  return (unint64_t)-[SDAirDropHandlerGenericFiles transferTypes](&v3, "transferTypes") | 0x24000;
}

- (id)defaultOpenActionBundleID
{
  return 0;
}

@end
