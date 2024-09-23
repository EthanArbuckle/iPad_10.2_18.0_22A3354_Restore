@implementation SDAirDropHandlerWalletItems

- (SDAirDropHandlerWalletItems)initWithTransfer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerWalletItems;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v4, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.Passbook"));
}

- (BOOL)canHandleTransfer
{
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = -[SDAirDropHandler isJustFiles](self, "isJustFiles");
  v4 = SFWalletAppAvailable();
  if (!-[objc_class isPassLibraryAvailable](off_1007B1770(), "isPassLibraryAvailable"))
    return 0;
  v5 = v3 & v4;
  v6 = -[objc_class canAddPasses](off_1007B1778(), "canAddPasses");
  v7 = 0;
  if (v5 == 1 && v6)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metaData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rawFiles"));

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      v14 = kSFOperationFileTypeKey;
      v15 = kSFOperationFileNameKey;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v14));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v15));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pathExtension"));

          LODWORD(v19) = SFIsPass(v18, v20);
          if (!(_DWORD)v19)
          {
            v7 = 0;
            goto LABEL_15;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          continue;
        break;
      }
    }
    v7 = 1;
LABEL_15:

  }
  return v7;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerWalletItems;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x2000;
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
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSString *v25;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metaData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsDescription"));
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metaData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemsDescription"));

  }
  else
  {
    v10 = 0;
  }

  v11 = 0;
  if (v4 != 1
    || !v10
    || ((v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", &off_10074FB80)), v12 = -[SDAirDropHandler isModernProgress](self, "isModernProgress"), v14 = SFLocalizedStringForKey(v11, v13), v15 = (void *)objc_claimAutoreleasedReturnValue(v14), !v12)? (v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v3, v10)): (v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v10,
                 v27)),
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16),
        v15,
        !v17))
  {
    v28 = CFSTR("PASS");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v29 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v30 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    v21 = objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v20));

    LODWORD(v18) = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
    v23 = SFLocalizedStringForKey(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((_DWORD)v18)
      v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v24, v4, v27);
    else
      v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v24, v3, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v25);

    v11 = (void *)v21;
  }

  return v17;
}

- (void)updatePossibleActions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;
  id v23;

  v22.receiver = self;
  v22.super_class = (Class)SDAirDropHandlerWalletItems;
  -[SDAirDropHandler updatePossibleActions](&v22, "updatePossibleActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v4));
  }
  else
  {
    v6 = objc_alloc((Class)SFAirDropAction);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v9 = (objc_class *)objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
    v5 = objc_msgSend(v6, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v7, v11, v12, v13, 1);

  }
  location = 0;
  objc_initWeak(&location, self);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000E824C;
  v19 = &unk_100714348;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v5, "setActionHandler:", &v16);
  v23 = v5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1, v16, v17, v18, v19));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v15, "setPossibleActions:", v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)triggerImport
{
  _QWORD v3[4];
  id v4;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E8324;
  v3[3] = &unk_100717428;
  objc_copyWeak(&v4, &location);
  -[SDAirDropHandlerWalletItems importPassesWithCompletion:](self, "importPassesWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)importPassesWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  NSMutableArray *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  NSMutableArray *v30;
  _QWORD v31[4];
  NSMutableArray *v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];

  v5 = a3;
  v6 = -[objc_class isPassLibraryAvailable](off_1007B1770(), "isPassLibraryAvailable");
  if ((_DWORD)v6 && (v6 = -[objc_class canAddPasses](off_1007B1778(), "canAddPasses"), (_DWORD)v6))
  {
    v29 = v5;
    v28 = objc_alloc_init(off_1007B1770());
    v30 = objc_opt_new(NSMutableArray);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "completedURLs"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v35 = 0;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v13, 0, &v35));
          v15 = v35;
          if (v15)
          {
            v16 = v15;
            v17 = airdrop_log(v15);
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Wallet pass add failed %@", buf, 0xCu);
            }
          }
          else
          {
            v19 = objc_alloc((Class)off_1007B1780());
            v34 = 0;
            v18 = objc_msgSend(v19, "initWithData:error:", v14, &v34);
            v20 = v34;
            v16 = v20;
            if (v20 || !v18)
            {
              v21 = airdrop_log(v20);
              v22 = objc_claimAutoreleasedReturnValue(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v16;
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "PKPass initWithData failed %@", buf, 0xCu);
              }

            }
            else
            {
              -[NSMutableArray addObject:](v30, "addObject:", v18);
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v10);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000E879C;
    v31[3] = &unk_100717450;
    v32 = v30;
    v5 = v29;
    v33 = v29;
    v23 = v30;
    objc_msgSend(v28, "addPasses:withCompletionHandler:", v23, v31);

  }
  else
  {
    v24 = airdrop_log(v6);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1000E8AB4(v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDAirDropHandlerWalletItems.m"), 161, CFSTR("%@ not supported on this platform"), objc_opt_class(self, v27));

    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E88A8;
  v6[3] = &unk_100717478;
  v7 = a4;
  v5 = v7;
  -[SDAirDropHandlerWalletItems importPassesWithCompletion:](self, "importPassesWithCompletion:", v6);

}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

@end
