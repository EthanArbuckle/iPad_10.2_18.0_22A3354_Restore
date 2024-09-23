@implementation SDAirDropHandlerPDFs

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
  int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v18.receiver = self;
  v18.super_class = (Class)SDAirDropHandlerPDFs;
  if (!-[SDAirDropHandlerGenericFiles canHandleTransfer](&v18, "canHandleTransfer"))
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "type"));
        v11 = SFIsPDF(v10);

        if (!v11)
        {
          v12 = 0;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_13:

  return v12;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerPDFs;
  return (unint64_t)-[SDAirDropHandlerGenericFiles transferTypes](&v3, "transferTypes") | 0x4000;
}

- (id)suitableContentsDescription
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  id v14;
  void *v15;
  uint64_t v17;
  objc_super v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  if (v4 < 2)
  {
    v18.receiver = self;
    v18.super_class = (Class)SDAirDropHandlerPDFs;
    v14 = -[SDAirDropHandlerGenericFiles suitableContentsDescription](&v18, "suitableContentsDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
    v5 = v4;
    v19 = CFSTR("PDF");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v20 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v21 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v8));

    LODWORD(v7) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    v11 = SFLocalizedStringForKey(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((_DWORD)v7)
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v5, v17);
    else
      v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v3, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v13);

  }
  return v15;
}

@end
