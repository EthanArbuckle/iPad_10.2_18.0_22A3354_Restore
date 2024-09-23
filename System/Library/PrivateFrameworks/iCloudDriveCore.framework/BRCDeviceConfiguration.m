@implementation BRCDeviceConfiguration

- (NSDictionary)getConfiguration
{
  BRCDeviceConfiguration *v2;
  NSDictionary *configuration;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *v17;
  NSDictionary *v18;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  configuration = v2->_configuration;
  if (!configuration)
  {
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BRCDeviceConfiguration _isFPFS](v2, "_isFPFS");
    v6 = -[BRCDeviceConfiguration _isSharedIPad:](v2, "_isSharedIPad:", v4);
    v7 = -[BRCDeviceConfiguration _isIsSycBubble](v2, "_isIsSycBubble");
    v8 = -[BRCDeviceConfiguration _isTesting](v2, "_isTesting");
    objc_msgSend(v4, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDataSeparatedPersona");

    v20[0] = CFSTR("FPFS");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v20[1] = CFSTR("TESTING");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    v20[2] = CFSTR("EDS");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    v20[3] = CFSTR("SHARED_IPAD");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v14;
    v20[4] = CFSTR("SYNC_BUBBLE");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v2->_configuration;
    v2->_configuration = (NSDictionary *)v16;

    configuration = v2->_configuration;
  }
  v18 = configuration;
  objc_sync_exit(v2);

  return v18;
}

- (BOOL)_isSharedIPad:(id)a3
{
  return objc_msgSend(a3, "isSharedIPad");
}

- (BOOL)_isIsSycBubble
{
  return objc_msgSend(MEMORY[0x24BEBF268], "br_isInSyncBubble");
}

- (BOOL)_isTesting
{
  void *v2;
  char v3;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "testDevice");

  return v3;
}

- (id)getDeviceConfigurationString
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@::"), CFSTR("1.1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDeviceConfiguration getConfiguration](self, "getConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__BRCDeviceConfiguration_getDeviceConfigurationString__block_invoke;
  v7[3] = &unk_24FE44998;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

uint64_t __54__BRCDeviceConfiguration_getDeviceConfigurationString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@:%@;"), a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
