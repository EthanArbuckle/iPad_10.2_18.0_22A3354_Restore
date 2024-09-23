@implementation _TVRCRMSDeviceManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39___TVRCRMSDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, block);
  return (id)sharedInstance_sharedInstance_3;
}

- (id)pairingGUIDForNetworkName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[_TVRCRMSDeviceManager _allRecords](self, "_allRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (objc_msgSend(v4, "containsString:", CFSTR("_")))
    {
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pairingGUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addStoredInfoForNetworkName:(id)a3 displayName:(id)a4 pairingGUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[3];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _TVRCRMSLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v17 = 2080;
    v18 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _os_log_impl(&dword_21A51B000, v11, OS_LOG_TYPE_DEFAULT, "#LegacyDevice adding stored info for network name %s, display name \"%s\", buf, 0x16u);
  }

  v13[0] = CFSTR("networkName");
  v13[1] = CFSTR("displayName");
  v14[0] = v8;
  v14[1] = v9;
  v13[2] = CFSTR("pairingGUID");
  v14[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVRCRMSDeviceManager _addOrUpdateRecordInUserDefaults:](self, "_addOrUpdateRecordInUserDefaults:", v12);
}

- (void)removeStoredInfoForNetworkName:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    _TVRCRMSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "#LegacyDevice removing stored info for network name %s", (uint8_t *)&v6, 0xCu);
    }

    -[_TVRCRMSDeviceManager _removeRecordWithNetworkNameFromUserDefaults:](self, "_removeRecordWithNetworkNameFromUserDefaults:", v4);
  }

}

- (id)_allRecords
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("TVRCStoredLegacyDevices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_performWithMutableRecords:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[_TVRCRMSDeviceManager _allRecords](self, "_allRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[2](v8, v5);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("TVRCStoredLegacyDevices"));

}

- (void)_addOrUpdateRecordInUserDefaults:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58___TVRCRMSDeviceManager__addOrUpdateRecordInUserDefaults___block_invoke;
  v6[3] = &unk_24DCD8810;
  v7 = v4;
  v5 = v4;
  -[_TVRCRMSDeviceManager _performWithMutableRecords:](self, "_performWithMutableRecords:", v6);

}

- (void)_removeRecordWithNetworkNameFromUserDefaults:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70___TVRCRMSDeviceManager__removeRecordWithNetworkNameFromUserDefaults___block_invoke;
  v6[3] = &unk_24DCD8810;
  v7 = v4;
  v5 = v4;
  -[_TVRCRMSDeviceManager _performWithMutableRecords:](self, "_performWithMutableRecords:", v6);

}

@end
