@implementation SDAirDropHandlerVoiceMemos

- (SDAirDropHandlerVoiceMemos)initWithTransfer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerVoiceMemos;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v4, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.VoiceMemos"));
}

- (BOOL)canHandleTransferRegardlessOfBundleID
{
  unsigned int v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = -[SDAirDropHandler isJustFiles](self, "isJustFiles");
  v4 = SFVoiceMemosAppAvailable();
  v5 = 0;
  if (v3 && v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metaData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "type"));
          v14 = SFIsVoiceMemo();

          if (!v14)
          {
            v5 = 0;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    v5 = 1;
LABEL_13:

  }
  return v5;
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderBundleID"));
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("com.apple.VoiceMemos"));

  return v6 & -[SDAirDropHandlerVoiceMemos canHandleTransferRegardlessOfBundleID](self, "canHandleTransferRegardlessOfBundleID");
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerVoiceMemos;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x1000;
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
  v16 = CFSTR("VOICE_MEMO");
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
  v22.super_class = (Class)SDAirDropHandlerVoiceMemos;
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
  v18 = sub_1000D7B58;
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
  v3[2] = sub_1000D7C30;
  v3[3] = &unk_100717210;
  objc_copyWeak(&v4, &location);
  -[SDAirDropHandlerVoiceMemos importMemosWithCompletion:](self, "importMemosWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)importMemosWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "completedURLs"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D7D90;
  v8[3] = &unk_100717238;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  +[SDAirDropHandlerVoiceMemos importMemosForItems:completion:](SDAirDropHandlerVoiceMemos, "importMemosForItems:completion:", v6, v8);

}

+ (void)importMemosForItems:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSDate *v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  NSDate *v16;
  id v17;
  id v18;
  dispatch_queue_global_t v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD block[4];
  id v31;
  id v32;
  NSDate *v33;
  NSObject *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  void *v39;

  v5 = a3;
  v24 = a4;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_1000D8128;
  v36[4] = sub_1000D8138;
  v37 = 0;
  v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = dispatch_group_create();
  for (i = 0; (unint64_t)objc_msgSend(v5, "count") > i; ++i)
  {
    dispatch_group_enter(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByDeletingPathExtension"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));

    v11 = objc_opt_new(NSDate);
    v12 = airdrop_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Start importing voice memo for %@", buf, 0xCu);
    }

    global_queue = dispatch_get_global_queue(2, 0);
    v15 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D8140;
    block[3] = &unk_100717288;
    v31 = v8;
    v32 = v10;
    v33 = v11;
    v35 = v36;
    v34 = v6;
    v16 = v11;
    v17 = v10;
    v18 = v8;
    dispatch_async(v15, block);

  }
  v19 = sub_10019AB98();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000D83D4;
  v25[3] = &unk_1007172B0;
  v26 = v6;
  v27 = v5;
  v29 = v36;
  v28 = v24;
  v21 = v24;
  v22 = v5;
  v23 = v6;
  dispatch_async(v20, v25);

  _Block_object_dispose(v36, 8);
}

- (void)performImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D8538;
  v6[3] = &unk_1007172D8;
  v7 = a4;
  v5 = v7;
  -[SDAirDropHandlerVoiceMemos importMemosWithCompletion:](self, "importMemosWithCompletion:", v6);

}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void (**v9)(id, _BOOL8, _QWORD);

  v9 = (void (**)(id, _BOOL8, _QWORD))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerVoiceMemos openAppURLs](self, "openAppURLs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v8 = -[SDAirDropHandler openURLs:bundleIdentifier:](self, "openURLs:bundleIdentifier:", v5, v7);

  v9[2](v9, v8, 0);
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (NSArray)openAppURLs
{
  return self->_openAppURLs;
}

- (void)setOpenAppURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openAppURLs, 0);
}

@end
