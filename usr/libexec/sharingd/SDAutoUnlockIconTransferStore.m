@implementation SDAutoUnlockIconTransferStore

- (SDAutoUnlockIconTransferStore)init
{
  SDAutoUnlockIconTransferStore *v2;
  SDAutoUnlockIconTransferStore *v3;
  SDAutoUnlockIconTransferStore *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDAutoUnlockIconTransferStore;
  v2 = -[SDAutoUnlockIconTransferStore init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[SDAutoUnlockIconTransferStore _loadTransferStore](v2, "_loadTransferStore");
    v4 = v3;
  }

  return v3;
}

- (void)storeCachedImageForHash:(id)a3 device:(id)a4 appName:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = SFHexStringForData(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_transferStore, "objectForKeyedSubscript:", v9));
  v14 = (NSMutableDictionary *)objc_msgSend(v13, "mutableCopy");

  if (!v14 || (v16 = objc_opt_class(NSDictionary, v15), (objc_opt_isKindOfClass(v14, v16) & 1) == 0))
  {
    v17 = objc_opt_new(NSMutableDictionary);

    v14 = v17;
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1000EB100;
  v29 = sub_1000EB110;
  v30 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000EB118;
  v22[3] = &unk_1007174E0;
  v18 = v10;
  v23 = v18;
  v24 = &v25;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v14, "enumerateKeysAndObjectsUsingBlock:", v22);
  if (v26[5])
    -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, v12);
  v19 = -[NSMutableDictionary copy](v14, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transferStore, "setObject:forKeyedSubscript:", v19, v9);

  if (dword_1007B1A28 <= 50 && (dword_1007B1A28 != -1 || _LogCategory_Initialize(&dword_1007B1A28, 50)))
    LogPrintF(&dword_1007B1A28, "-[SDAutoUnlockIconTransferStore storeCachedImageForHash:device:appName:]", 50, "Storing cached image state: %@, device: %@, hash: %@", v18, v9, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v21 = -[NSMutableDictionary copy](self->_transferStore, "copy");
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("AUIconTransferStore"));

  objc_msgSend(v20, "synchronize");
  _Block_object_dispose(&v25, 8);

}

- (BOOL)imageCachedForHash:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_transferStore, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "mutableCopy");

  if (!v9)
  {
    if (dword_1007B1A28 <= 50
      && (dword_1007B1A28 != -1 || _LogCategory_Initialize(&dword_1007B1A28, 50)))
    {
      LogPrintF(&dword_1007B1A28, "-[SDAutoUnlockIconTransferStore imageCachedForHash:device:]", 50, "Nothing stored in device store yet");
    }
    goto LABEL_18;
  }
  v11 = objc_opt_class(NSDictionary, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {
    if (dword_1007B1A28 <= 90
      && (dword_1007B1A28 != -1 || _LogCategory_Initialize(&dword_1007B1A28, 90)))
    {
      LogPrintF(&dword_1007B1A28, "-[SDAutoUnlockIconTransferStore imageCachedForHash:device:]", 90, "### Device store isn't a dictionary");
    }
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  v12 = SFHexStringForData(v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v13));
  if (dword_1007B1A28 <= 50 && (dword_1007B1A28 != -1 || _LogCategory_Initialize(&dword_1007B1A28, 50)))
    LogPrintF(&dword_1007B1A28, "-[SDAutoUnlockIconTransferStore imageCachedForHash:device:]", 50, "Looking for transfer state for device %@ hash: %@ app: %@, store %@", v7, v13, v14, v9);
  v15 = v14 != 0;

LABEL_19:
  return v15;
}

- (void)_loadTransferStore
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *transferStore;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("AUIconTransferStore")));
  v4 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");

  if (!v4 || (v6 = objc_opt_class(NSDictionary, v5), (objc_opt_isKindOfClass(v4, v6) & 1) == 0))
  {
    v7 = objc_opt_new(NSMutableDictionary);

    v4 = v7;
  }
  transferStore = self->_transferStore;
  self->_transferStore = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferStore, 0);
}

@end
