@implementation ICQCloudStorageInfo

+ (id)backupInfoHeaders
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "backupInfoHeadersForAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)backupInfoHeadersForAccount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x24BDB4558]))
    v6 = CFSTR("ON");
  else
    v6 = CFSTR("OFF");
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("X-Client-Backup"));
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("X-Client-DeviceName"));
  v30 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66C40]), "initWithAccount:delegate:eventQueue:error:", v4, 0, 0, &v30);

  v12 = v30;
  if (v12)
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[ICQCloudStorageInfo backupInfoHeadersForAccount:].cold.1((uint64_t)v12, v13);
    goto LABEL_11;
  }
  objc_msgSend(v11, "backupState");
  v13 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject state](v13, "state") != 6)
  {
LABEL_11:
    v17 = CFSTR("SUCCESS");
    goto LABEL_12;
  }
  -[NSObject error](v13, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "code");

  if (v15 == 303)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v11, "nextBackupSize"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("X-Client-LastBackupSizeBytes"));

  }
  v17 = CFSTR("FAIL");
LABEL_12:

  objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("X-Client-LastBackupState"));
  v18 = (void *)MGCopyAnswer();
  if (v18)
    objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("X-Client-Device-Color"));
  v19 = (void *)MGCopyAnswer();
  if (v19)
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("X-Client-Device-Enclosure-Color"));
  v20 = (void *)MGCopyAnswer();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("X-Client-Device-CoverGlassColor"));

  }
  v23 = (void *)MGCopyAnswer();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "stringValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("X-Client-Device-HousingColor"));

  }
  v26 = (void *)MGCopyAnswer();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "stringValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("X-Client-Device-BackingColor"));

  }
  return v5;
}

+ (void)backupInfoHeadersForAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[ICQCloudStorageInfo backupInfoHeadersForAccount:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "%s unable to init MBManager with error: %@", (uint8_t *)&v2, 0x16u);
}

@end
