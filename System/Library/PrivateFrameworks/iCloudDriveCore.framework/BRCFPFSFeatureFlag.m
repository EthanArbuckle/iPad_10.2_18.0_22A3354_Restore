@implementation BRCFPFSFeatureFlag

- (BRCFPFSFeatureFlag)init
{
  BRCFPFSFeatureFlag *v2;
  id v3;
  uint64_t v4;
  NSUserDefaults *fpfsFeatureDefaults;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCFPFSFeatureFlag;
  v2 = -[BRCFPFSFeatureFlag init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCF50]);
    v4 = objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x24BDC80C0]);
    fpfsFeatureDefaults = v2->_fpfsFeatureDefaults;
    v2->_fpfsFeatureDefaults = (NSUserDefaults *)v4;

  }
  return v2;
}

- (void)fixFPFSFeatureFlagUserDefaultsIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSUserDefaults *fpfsFeatureDefaults;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC80C8];
  -[NSUserDefaults objectForKey:](self->_fpfsFeatureDefaults, "objectForKey:", *MEMORY[0x24BDC80C8]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)MEMORY[0x24BDC80D0];
  if (v4)
  {
    v6 = (void *)v4;
    -[NSUserDefaults objectForKey:](self->_fpfsFeatureDefaults, "objectForKey:", CFSTR("iCloudDrive-on-FPFS-last-boot-uuid"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[NSUserDefaults objectForKey:](self->_fpfsFeatureDefaults, "objectForKey:", *v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_9;
    }
    else
    {

    }
  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v10;
    _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] Running as FPFS but FPFS feature user defaults are missing. Fixing FPFS feature in user defaults%@", (uint8_t *)&v16, 0xCu);
  }

  -[NSUserDefaults setObject:forKey:](self->_fpfsFeatureDefaults, "setObject:forKey:", &unk_24FEB3440, *v5);
  fpfsFeatureDefaults = self->_fpfsFeatureDefaults;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](fpfsFeatureDefaults, "setObject:forKey:", v14, CFSTR("iCloudDrive-on-FPFS-last-boot-uuid"));

  -[NSUserDefaults setBool:forKey:](self->_fpfsFeatureDefaults, "setBool:forKey:", 1, v3);
LABEL_9:
  -[NSUserDefaults objectForKey:](self->_fpfsFeatureDefaults, "objectForKey:", CFSTR("iCloudDrive-moved-to-FPFS"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    -[NSUserDefaults setBool:forKey:](self->_fpfsFeatureDefaults, "setBool:forKey:", 1, CFSTR("iCloudDrive-moved-to-FPFS"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpfsFeatureDefaults, 0);
}

@end
