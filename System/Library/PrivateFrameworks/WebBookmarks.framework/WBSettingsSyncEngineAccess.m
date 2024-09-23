@implementation WBSettingsSyncEngineAccess

- (int64_t)_settingForValue:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83240]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83210]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83218]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83228]) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83248]) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83208]) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83230]) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83200]) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83220]) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83238]) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83258]) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83190]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83198]) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE83250]) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE831F8]))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)syncEnabled
{
  return objc_msgSend(MEMORY[0x24BE82CC8], "isCustomizationSyncEnabled");
}

- (void)didReceiveRemoteCloudSettingsUpdateWithRecord:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  _QWORD *v7;
  id v8;

  v8 = a3;
  if (-[WBSettingsSyncEngineAccess syncEnabled](self, "syncEnabled"))
  {
    if (objc_msgSend(v8, "safari_isCloudBackgroundImageRecord")
      && objc_msgSend(MEMORY[0x24BE82CC8], "isStartPageSettingSyncEnabled"))
    {
      -[WBSettingsSyncEngineAccess _updateStartPageBackgroundImageWithRecord:](self, "_updateStartPageBackgroundImageWithRecord:", v8);
    }
    else if (objc_msgSend(v8, "safari_isCloudPerSiteSettingRecord")
           && objc_msgSend(MEMORY[0x24BE82CC8], "isPerSiteSettingSyncEnabled"))
    {
      -[WBSettingsSyncEngineAccess _updatePerSiteSettingsWithRecord:](self, "_updatePerSiteSettingsWithRecord:", v8);
    }
    else if (objc_msgSend(v8, "safari_isCloudSettingRecord")
           && objc_msgSend(MEMORY[0x24BE82CC8], "isStartPageSettingSyncEnabled"))
    {
      objc_msgSend(v8, "recordID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[WBSettingsSyncEngineAccess _settingForValue:](self, "_settingForValue:", v5);

      v7 = (_QWORD *)MEMORY[0x24BE83288];
      switch(v6)
      {
        case 1:
          -[WBSettingsSyncEngineAccess _updateStartPageSectionOrder:](self, "_updateStartPageSectionOrder:", v8);
          break;
        case 2:
          goto LABEL_23;
        case 3:
          v7 = (_QWORD *)MEMORY[0x24BE83290];
          goto LABEL_23;
        case 4:
          v7 = (_QWORD *)MEMORY[0x24BE832A0];
          goto LABEL_23;
        case 5:
          v7 = (_QWORD *)MEMORY[0x24BE832B8];
          goto LABEL_23;
        case 6:
          v7 = (_QWORD *)MEMORY[0x24BE83280];
          goto LABEL_23;
        case 7:
          v7 = (_QWORD *)MEMORY[0x24BE832A8];
          goto LABEL_23;
        case 8:
          -[WBSettingsSyncEngineAccess _didUpdateStartPageBackgroundImageVisibilityWithRecord:](self, "_didUpdateStartPageBackgroundImageVisibilityWithRecord:", v8);
          break;
        case 9:
          v7 = (_QWORD *)MEMORY[0x24BE83298];
          goto LABEL_23;
        case 10:
          v7 = (_QWORD *)MEMORY[0x24BE832B0];
          goto LABEL_23;
        case 11:
          v7 = (_QWORD *)MEMORY[0x24BE832C8];
          goto LABEL_23;
        case 12:
          -[WBSettingsSyncEngineAccess _didUpdateIOSDefaultBrowserWithRecord:](self, "_didUpdateIOSDefaultBrowserWithRecord:", v8);
          break;
        case 13:
          v7 = (_QWORD *)MEMORY[0x24BE832C0];
LABEL_23:
          -[WBSettingsSyncEngineAccess _updateStartPageSectionVisibilityWithIdentifier:record:](self, "_updateStartPageSectionVisibilityWithIdentifier:record:", *v7, v8);
          break;
        case 14:
          -[WBSettingsSyncEngineAccess _updateStartPageCloudTabsConsent:](self, "_updateStartPageCloudTabsConsent:", v8);
          break;
        default:
          break;
      }
    }
  }

}

- (void)didDeleteRemoteRecordWithID:(id)a3
{
  void *v3;
  int v4;
  NSObject *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x24BE82CC8], "isStartPageSettingSyncEnabled") & 1) != 0)
  {
    objc_msgSend(v6, "recordName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE831D0]);

    if (v4)
    {
      dispatch_get_global_queue(17, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v5, &__block_literal_global_0);

    }
  }

}

void __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_startPageBackgroundImageFileURLForDefaultProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v0, "removeItemAtURL:error:", v2, &v9);
  v4 = v9;

  if ((v3 & 1) != 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_cold_1();
    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x24BE831A0]);

    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_5);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_cold_2((uint64_t)v4, v7, v8);
  }

}

void __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_4()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:deliverImmediately:", *MEMORY[0x24BE831D8], 0, 0, 1);

}

- (void)_updateStartPageBackgroundImageWithRecord:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  WBSettingsSyncEngineAccess *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke;
  block[3] = &unk_24CB316B8;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  _BYTE v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isReadableFileAtPath:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_startPageBackgroundImageFileURLForDefaultProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeItemAtURL:error:", v7, 0);

    objc_msgSend(v2, "safari_startPageBackgroundImageFileURLForDefaultProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v2, "safari_ensureDirectoryExists:", v9);

    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_startPageBackgroundImageFileURLForDefaultProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v13 = objc_msgSend(v2, "copyItemAtURL:toURL:error:", v11, v12, &v23);
    v14 = v23;

    if ((v13 & 1) == 0)
    {
      v15 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "safari_privacyPreservingDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke_cold_1(v16, (uint64_t)v24, v15);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "safari_encryptedValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("isLightAppearance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "BOOLValue"))
      v20 = 1;
    else
      v20 = 2;
    objc_msgSend(v19, "setInteger:forKey:", v20, *MEMORY[0x24BE831A0]);

    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_12);
    v21 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_installMobileAssetIfApplicableWithURL:", v22);

  }
}

void __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke_11()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:deliverImmediately:", *MEMORY[0x24BE831E0], 0, 0, 1);

}

- (id)startPageSectionsManager
{
  WBSStartPageSectionManager *lazyStartPageSectionsManager;
  WBSStartPageSectionManager *v4;
  WBSStartPageSectionManager *v5;

  lazyStartPageSectionsManager = self->_lazyStartPageSectionsManager;
  if (!lazyStartPageSectionsManager)
  {
    v4 = (WBSStartPageSectionManager *)objc_alloc_init(MEMORY[0x24BE83140]);
    v5 = self->_lazyStartPageSectionsManager;
    self->_lazyStartPageSectionsManager = v4;

    lazyStartPageSectionsManager = self->_lazyStartPageSectionsManager;
  }
  return lazyStartPageSectionsManager;
}

- (void)_updateStartPageSectionVisibilityWithIdentifier:(id)a3 record:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(a4, "safari_encryptedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE83180]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE832C8]))
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "BOOLValue");
      objc_msgSend(v8, "setBool:forKey:", v9, *MEMORY[0x24BE83278]);
    }
    else
    {
      -[WBSettingsSyncEngineAccess startPageSectionsManager](self, "startPageSectionsManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSectionIdentifier:enabled:", v10, objc_msgSend(v7, "BOOLValue"));
    }

  }
}

- (void)_installMobileAssetIfApplicableWithURL:(id)a3
{
  const __CFURL *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  const CGImageMetadata *v7;
  const CGImageMetadata *v8;
  CGImageMetadataTag *v9;
  CGImageMetadataTag *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFURL *)a3;
  v5 = CGImageSourceCreateWithURL(v4, 0);
  v6 = v5;
  if (v5)
  {
    v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
    v8 = v7;
    if (v7)
    {
      v9 = CGImageMetadataCopyTagWithPath(v7, 0, CFSTR("safari:fileName"));
      v10 = v9;
      if (v9)
      {
        v11 = (void *)CGImageMetadataTagCopyValue(v9);
        CFRelease(v10);
      }
      else
      {
        v11 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v6);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safari_startPageBackgroundImageMobileAssetFolderURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLByAppendingPathComponent:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v16 = objc_msgSend(v15, "copyItemAtURL:toURL:error:", v4, v14, &v22);
      v17 = v22;

      if ((v16 & 1) == 0)
      {
        v18 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "safari_privacyPreservingDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSettingsSyncEngineAccess _installMobileAssetIfApplicableWithURL:].cold.1(v19, (uint64_t)v25, v18);
        }

      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("FileName");
      v24 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postNotificationName:object:userInfo:", CFSTR("WBSBackgroundImageMobileAssetDidInstallBackgroundImage"), self, v21);

    }
  }

}

- (void)_didUpdateStartPageBackgroundImageVisibilityWithRecord:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE83180]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x24BE83268];
  v7 = objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", *MEMORY[0x24BE83268], 1);
  if (v7 != objc_msgSend(v5, "BOOLValue"))
    objc_msgSend(v3, "setBool:forKey:", objc_msgSend(v5, "BOOLValue"), v6);

}

- (void)_didUpdateIOSDefaultBrowserWithRecord:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "safari_encryptedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE83180]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "intValue"))
  {
    objc_msgSend(v11, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_numberForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");
    v10 = objc_msgSend(v4, "intValue");

    if (v9 != v10)
      objc_msgSend(v7, "setInteger:forKey:", (int)objc_msgSend(v4, "intValue"), v6);

  }
}

- (id)_perSitePreferencesStore
{
  if (-[WBSettingsSyncEngineAccess _perSitePreferencesStore]::once != -1)
    dispatch_once(&-[WBSettingsSyncEngineAccess _perSitePreferencesStore]::once, &__block_literal_global_20);
  return (id)-[WBSettingsSyncEngineAccess _perSitePreferencesStore]::perSitePreferencesStore;
}

void __54__WBSettingsSyncEngineAccess__perSitePreferencesStore__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BE83130]);
  objc_msgSend(MEMORY[0x24BE83130], "defaultDatabaseURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithDatabaseURL:");
  v2 = (void *)-[WBSettingsSyncEngineAccess _perSitePreferencesStore]::perSitePreferencesStore;
  -[WBSettingsSyncEngineAccess _perSitePreferencesStore]::perSitePreferencesStore = v1;

}

- (BOOL)_isKnownPerSiteSetting:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (-[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::once != -1)
    dispatch_once(&-[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::once, &__block_literal_global_22);
  v4 = objc_msgSend((id)-[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::knownPerSiteSettings, "containsObject:", v3);

  return v4;
}

void __53__WBSettingsSyncEngineAccess__isKnownPerSiteSetting___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BE831C8];
  v6[0] = *MEMORY[0x24BE831A8];
  v6[1] = v1;
  v2 = *MEMORY[0x24BE831B0];
  v6[2] = *MEMORY[0x24BE831C0];
  v6[3] = v2;
  v6[4] = *MEMORY[0x24BE831B8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)-[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::knownPerSiteSettings;
  -[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:]::knownPerSiteSettings = v4;

}

- (void)_updatePerSiteSettingsWithRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WBSettingsSyncEngineAccess _updatePerSiteSettingsWithRecord:].cold.1();
  objc_msgSend(v4, "safari_encryptedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE83160]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !-[WBSettingsSyncEngineAccess _isKnownPerSiteSetting:](self, "_isKnownPerSiteSetting:", v7))
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138543362;
      v15 = v7;
      _os_log_impl(&dword_211022000, v12, OS_LOG_TYPE_INFO, "Received a %{public}@ Per-Site Setting from CloudKit that is unrecognized to this device.", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE831B0]) & 1) == 0
      && !objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE831C0]))
    {
      goto LABEL_9;
    }
    objc_msgSend(v4, "safari_encryptedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE83150]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSettingsSyncEngineAccess _deviceClass](self, "_deviceClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v9);

    if ((v11 & 1) != 0)
    {

LABEL_9:
      -[WBSettingsSyncEngineAccess _attemptUpdatingSavingPerSiteSettingsWithRecord:](self, "_attemptUpdatingSavingPerSiteSettingsWithRecord:", v4);
      goto LABEL_15;
    }
    v13 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138543362;
      v15 = v7;
      _os_log_impl(&dword_211022000, v13, OS_LOG_TYPE_INFO, "Received a %{public}@ Per-Site Setting from CloudKit that is not applicable to this device.", (uint8_t *)&v14, 0xCu);
    }

  }
LABEL_15:

}

- (void)_attemptUpdatingSavingPerSiteSettingsWithRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke;
  v6[3] = &unk_24CB31770;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSettingsSyncEngineAccess _updatePerSiteSettingsWithRecord:completionHandler:](self, "_updatePerSiteSettingsWithRecord:completionHandler:", v5, v6);

}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5)
      __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_1();
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", *MEMORY[0x24BE831E8], 0);

    objc_msgSend(*(id *)(a1 + 32), "_perSitePreferencesStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_25;
    v16[3] = &unk_24CB31720;
    v17 = v8;
    objc_msgSend(v7, "savePerSiteSettingCloudKitRecordToDisk:completionHandler:", v17, v16);

    v9 = v17;
  }
  else
  {
    if (v5)
      __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_3();
    v10 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_2();
    v11 = (void *)MEMORY[0x24BDBCF40];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_28;
    v14[3] = &unk_24CB31748;
    v12 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v12;
    v13 = (id)objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 0, v14, 30.0);
    v9 = v15;
  }

}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_25(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = v7;
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_211022000, v4, OS_LOG_TYPE_INFO, "Save with record name %{public}@ in WBSPerSitePreferencesSQLiteStore did finish with success: %{public}@", (uint8_t *)&v9, 0x16u);

  }
}

uint64_t __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attemptUpdatingSavingPerSiteSettingsWithRecord:", *(_QWORD *)(a1 + 40));
}

- (id)_deviceClass
{
  void *v2;
  int v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceClass");

  v4 = CFSTR("UndefinedDeviceClass");
  if (v3 == 3)
    v4 = CFSTR("iPad");
  if (v3 == 1)
    return CFSTR("iPhone");
  else
    return (id)v4;
}

- (void)_updatePerSiteSettingsWithRecord:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "safari_encryptedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE83170]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safari_encryptedValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE83160]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __81__WBSettingsSyncEngineAccess__updatePerSiteSettingsWithRecord_completionHandler___block_invoke;
  v21[3] = &unk_24CB31798;
  v12 = v7;
  v22 = v12;
  v13 = (void *)MEMORY[0x212BD4C84](v21);
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE83168]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WBSettingsSyncEngineAccess _perSitePreferencesStore](self, "_perSitePreferencesStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removePreferenceValueWithRecordName:completionHandler:", v17, v13);
  }
  else
  {
    objc_msgSend(v6, "safari_encryptedValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x24BE83158];
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE83158]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[WBSettingsSyncEngineAccess _perSitePreferencesStore](self, "_perSitePreferencesStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDefaultValue:forPreference:completionHandler:", v9, v11, v13);
      goto LABEL_6;
    }
    -[WBSettingsSyncEngineAccess _perSitePreferencesStore](self, "_perSitePreferencesStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_encryptedValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:ofPreference:forDomain:withTimestamp:completionHandler:", v9, v11, v17, 0, v13);
  }

LABEL_6:
}

uint64_t __81__WBSettingsSyncEngineAccess__updatePerSiteSettingsWithRecord_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateStartPageSectionOrder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v24 = a3;
  objc_msgSend(v24, "safari_encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE83180]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BE83140], "allSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke;
  v31[3] = &unk_24CB317C0;
  v10 = v7;
  v32 = v10;
  v11 = v8;
  v33 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v31);
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke_2;
  v28[3] = &unk_24CB317C0;
  v12 = v11;
  v29 = v12;
  v13 = v6;
  v30 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v28);
  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v14, "setObject:forKey:", v15, *MEMORY[0x24BE82E68]);

  if (v12)
  {
    v16 = (void *)MEMORY[0x24BDBCF20];
    -[WBSettingsSyncEngineAccess startPageSectionsManager](self, "startPageSectionsManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "enabledSectionIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke_3;
    v25[3] = &unk_24CB317C0;
    v21 = v19;
    v26 = v21;
    v22 = v20;
    v27 = v22;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);
    -[WBSettingsSyncEngineAccess startPageSectionsManager](self, "startPageSectionsManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSectionsIdentifiers:enabledIndexes:", v12, v22);

  }
}

void __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

void __59__WBSettingsSyncEngineAccess__updateStartPageSectionOrder___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);

}

- (id)_startPageSectionOrder
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE82E68];
  objc_msgSend(v3, "arrayForKey:", *MEMORY[0x24BE82E68]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "arrayForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WBSettingsSyncEngineAccess startPageSectionsManager](self, "startPageSectionsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_updateStartPageCloudTabsConsent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[WBSettingsSyncEngineAccess _updateStartPageCloudTabsConsent:].cold.1();
  objc_msgSend(v3, "safari_encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE83180]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_msgSend(v7, "setBool:forKey:", v8, *MEMORY[0x24BE83188]);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:deliverImmediately:", *MEMORY[0x24BE831F0], 0, 0, 1);

}

- (NSArray)syncSettingsUpDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  objc_object *v13;
  void *v14;
  objc_object *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_object *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_object *v23;
  void *v24;
  id v26;
  objc_object *v27;
  void *v28;
  void *v29;
  objc_object *v30;
  void *v31;
  objc_object *v32;
  void *v33;
  objc_object *v34;
  void *v35;
  objc_object *v36;
  void *v37;
  objc_object *v38;
  void *v39;
  objc_object *v40;
  void *v41;
  objc_object *v42;
  void *v43;
  objc_object *v44;
  void *v45;
  objc_object *v46;
  void *v47;
  objc_object *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[17];

  v53[15] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF20];
  -[WBSettingsSyncEngineAccess startPageSectionsManager](self, "startPageSectionsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)*MEMORY[0x24BE83190];
  v51 = v7;
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "integerForKey:", *MEMORY[0x24BE83190]));
  v48 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary(v8, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v49;
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSString *)*MEMORY[0x24BE83198];
  v50 = v10;
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "integerForKey:", *MEMORY[0x24BE83198]));
  v46 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary(v11, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v47;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x24BE83288]));
  v44 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83210], v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v45;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x24BE83290]));
  v42 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83218], v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v43;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x24BE832A0]));
  v40 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83228], v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v41;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x24BE832B8]));
  v38 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83248], v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v39;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x24BE83280]));
  v36 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83208], v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v37;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x24BE832A8]));
  v34 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83230], v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v35;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WBSettingsSyncEngineAccess _isShowBackgroundImageEnabled](self, "_isShowBackgroundImageEnabled"));
  v32 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83200], v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v33;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x24BE83298]));
  v30 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83220], v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v31;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v52, "containsObject:", *MEMORY[0x24BE832C0]));
  v27 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83250], v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v28;
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v29, "BOOLForKey:", *MEMORY[0x24BE83188]));
  v13 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE831F8], v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v14;
  -[WBSettingsSyncEngineAccess _startPageSectionOrder](self, "_startPageSectionOrder");
  v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83240], v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v16;
  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "BOOLForKey:", *MEMORY[0x24BE83278]));
  v19 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83258], v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v20;
  v21 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "BOOLForKey:", *MEMORY[0x24BE83270]));
  v23 = (objc_object *)objc_claimAutoreleasedReturnValue();
  makeSettingDictionary((NSString *)*MEMORY[0x24BE83238], v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 15);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v26;
}

- (BOOL)backgroundImageExists
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", *MEMORY[0x24BE831A0]) != 0;

  return v3;
}

- (BOOL)backgroundImageAppearanceIsLight
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", *MEMORY[0x24BE831A0]);

  return v3 == 1;
}

- (BOOL)_isShowBackgroundImageEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE83268]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)deleteBackgroundImageDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_211022000, v0, v1, "Attempting to remove Safari's background image directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_startPageBackgroundImageFolderURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v0, "removeItemAtURL:error:", v2, &v9);
  v4 = v9;

  if ((v3 & 1) != 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_cold_1();
    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x24BE831A0]);

    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_43);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_cold_2((uint64_t)v4, v7, v8);
  }

}

void __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_42()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:deliverImmediately:", *MEMORY[0x24BE831D8], 0, 0, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyStartPageSectionsManager, 0);
}

void __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_211022000, v0, v1, "Removing Safari's background image was successful.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__WBSettingsSyncEngineAccess_didDeleteRemoteRecordWithID___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_211022000, a2, a3, "Removing Safari's background image failed with error: %@.", (uint8_t *)&v3);
}

void __72__WBSettingsSyncEngineAccess__updateStartPageBackgroundImageWithRecord___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_211022000, a3, (uint64_t)a3, "Failed to copy the background image over. Error: %{public}@", (uint8_t *)a2);

}

- (void)_installMobileAssetIfApplicableWithURL:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_211022000, a3, (uint64_t)a3, "Failed to copy the mobile asset background image over. Error: %{public}@", (uint8_t *)a2);

}

- (void)_updatePerSiteSettingsWithRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_211022000, v0, v1, "Received a Per-Site Settings push notification from CloudKit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_211022000, v0, v1, "Successfully updated WBSPerSitePreferencesSQLiteStore in response to a push notification from CloudKit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_211022000, v0, OS_LOG_TYPE_ERROR, "Will retry operation in 30 seconds due to a failure to update WBSPerSitePreferencesSQLiteStore.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __78__WBSettingsSyncEngineAccess__attemptUpdatingSavingPerSiteSettingsWithRecord___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_211022000, v0, v1, "Failed to update WBSPerSitePreferencesSQLiteStore after a push notification from CloudKit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateStartPageCloudTabsConsent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_211022000, v0, v1, "Updating start page cloud tabs consent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_211022000, v0, v1, "Removing Safari's background image directory was successful.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__WBSettingsSyncEngineAccess_deleteBackgroundImageDirectory__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_211022000, a2, a3, "Removing Safari's background image directory failed with error: %@.", (uint8_t *)&v3);
}

@end
