@implementation STAppOverrides

- (STAppOverrides)initWithDictionary:(id)a3
{
  id v4;
  STAppOverrides *v5;
  STAppOverrides *v6;
  _QWORD v8[4];
  STAppOverrides *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STAppOverrides;
  v5 = -[STAppOverrides init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__STAppOverrides_initWithDictionary___block_invoke;
    v8[3] = &unk_24C75FB20;
    v9 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  return v6;
}

uint64_t __37__STAppOverrides_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, a2);
}

- (BOOL)isMediaApp
{
  int v2;
  BOOL v3;

  v2 = -[STAppOverrides category](self, "category");
  if (v2)
    v3 = v2 == 7;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)excludeUsageBundle
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  -[STAppOverrides includeFsPaths](self, "includeFsPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[STAppOverrides includeMediaUsage](self, "includeMediaUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  -[STAppOverrides includeCacheDeleteKeys](self, "includeCacheDeleteKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "count")
    || -[STAppOverrides includeSoftwareUpdates](self, "includeSoftwareUpdates")
    || -[STAppOverrides forceExcludeUsageBundle](self, "forceExcludeUsageBundle");

  return v8;
}

+ (id)overridesForApplication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "overridesFor:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "counterpartIdentifiers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v7);
          objc_msgSend(a1, "overridesFor:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v6 = v10;

            v7 = v6;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v6;
}

+ (id)overridesFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "overrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)overrides
{
  if (overrides_onceToken_75 != -1)
    dispatch_once(&overrides_onceToken_75, &__block_literal_global_76);
  return (id)_appOverrides;
}

void __27__STAppOverrides_overrides__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  STAppOverrides *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  const __CFString *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  const __CFString *v39;
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[4];
  _QWORD v52[4];
  _QWORD v53[2];
  _QWORD v54[2];
  const __CFString *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  _QWORD v59[3];
  _QWORD v60[3];
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  const __CFString *v64;
  void *v65;
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[16];
  _QWORD v71[18];

  v71[16] = *MEMORY[0x24BDAC8D0];
  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v70[0] = CFSTR("com.apple.MobileSMS");
  v68[0] = CFSTR("category");
  v68[1] = CFSTR("forceVisible");
  v0 = MEMORY[0x24BDBD1C8];
  v69[0] = &unk_24C768A20;
  v69[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = CFSTR("com.apple.mobileslideshow");
  v71[0] = v32;
  v66[0] = CFSTR("category");
  v66[1] = CFSTR("forceVisible");
  v67[0] = &unk_24C768A08;
  v67[1] = v0;
  v66[2] = CFSTR("includeMediaUsage");
  v67[2] = &unk_24C768BF0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v31;
  v70[2] = CFSTR("com.apple.mobilenotes");
  v64 = CFSTR("includeFsPaths");
  v63 = CFSTR("/private/var/mobile/Library/Notes/");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v29;
  v70[3] = CFSTR("com.apple.Translate");
  v61 = CFSTR("includeCacheDeleteKeys");
  v62 = &unk_24C768C08;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v28;
  v70[4] = CFSTR("com.apple.Preferences");
  v60[0] = v0;
  v59[0] = CFSTR("forceExcludeUsageBundle");
  v59[1] = CFSTR("defaultName");
  STStorageDataLocStr(CFSTR("SOFTWARE_UPDATE"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = CFSTR("forceHidden");
  v60[1] = v27;
  v60[2] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v25;
  v70[5] = CFSTR("com.apple.Health");
  v57 = CFSTR("includeFsPaths");
  v58 = &unk_24C768C20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v24;
  v70[6] = CFSTR("com.apple.MobileAddressBook");
  v55 = CFSTR("includeFsPaths");
  v56 = &unk_24C768C38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v23;
  v70[7] = CFSTR("com.apple.iBooks");
  v53[0] = CFSTR("category");
  v53[1] = CFSTR("includeMediaUsage");
  v54[0] = &unk_24C768A38;
  v54[1] = &unk_24C768C50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v70[8] = CFSTR("com.apple.mobilemail");
  v71[7] = v22;
  v51[0] = CFSTR("category");
  v51[1] = CFSTR("includeCacheDeleteKeys");
  v52[0] = &unk_24C768A50;
  v52[1] = &unk_24C768C68;
  v51[2] = CFSTR("includeContainers");
  v51[3] = CFSTR("includeFsPaths");
  v52[2] = &unk_24C768C80;
  v52[3] = &unk_24C768C98;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v71[8] = v21;
  v70[9] = CFSTR("com.apple.Music");
  v49[0] = CFSTR("category");
  v49[1] = CFSTR("usageBundleOverride");
  v50[0] = &unk_24C768A68;
  v50[1] = CFSTR("com.apple.MusicUsage");
  v49[2] = CFSTR("includeFsPaths");
  v48 = CFSTR("/private/var/mobile/Media/iTunes_Control/iTunes/Artwork/");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = CFSTR("includeMediaUsage");
  v50[2] = v20;
  v50[3] = &unk_24C768CB0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v71[9] = v1;
  v70[10] = CFSTR("com.apple.podcasts");
  v46[0] = CFSTR("category");
  v46[1] = CFSTR("includeMediaUsage");
  v47[0] = &unk_24C768A68;
  v47[1] = &unk_24C768CC8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v71[10] = v2;
  v70[11] = CFSTR("com.apple.VoiceMemos");
  v44[0] = CFSTR("category");
  v44[1] = CFSTR("includeMediaUsage");
  v45[0] = &unk_24C768A68;
  v45[1] = &unk_24C768CE0;
  v44[2] = CFSTR("includeFsPaths");
  v45[2] = &unk_24C768CF8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v71[11] = v3;
  v70[12] = CFSTR("com.apple.tv");
  v42[0] = CFSTR("category");
  v42[1] = CFSTR("usageBundleOverride");
  v43[0] = &unk_24C768A68;
  v43[1] = CFSTR("com.apple.VideosUsage");
  v42[2] = CFSTR("includeMediaUsage");
  v43[2] = &unk_24C768D10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v71[12] = v4;
  v70[13] = CFSTR("com.apple.fakeapp.MiscMedia.hidden");
  v40[0] = CFSTR("category");
  v40[1] = CFSTR("includeMediaUsage");
  v41[0] = &unk_24C768A68;
  v41[1] = &unk_24C768D28;
  v40[2] = CFSTR("includeFsPaths");
  v39 = CFSTR("/private/var/mobile/Media/Downloads/");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = CFSTR("forceHidden");
  v41[2] = v5;
  v6 = MEMORY[0x24BDBD1C8];
  v41[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v71[13] = v7;
  v70[14] = CFSTR("com.apple.Passbook");
  v37[1] = CFSTR("forceHidden");
  v38[0] = &unk_24C768D40;
  v37[0] = CFSTR("includeFsPaths");
  v8 = STStorageDeviceIsiPad();
  v9 = MEMORY[0x24BDBD1C0];
  if (v8)
    v9 = v6;
  v38[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v71[14] = v10;
  v70[15] = CFSTR("com.apple.reminders");
  v35 = CFSTR("includeFsPaths");
  v36 = &unk_24C768D58;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v71[15] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addEntriesFromDictionary:", v12);

  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __27__STAppOverrides_overrides__block_invoke_154;
  v33[3] = &unk_24C75FB20;
  v14 = v13;
  v34 = v14;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v33);
  v15 = (void *)_appOverrides;
  _appOverrides = (uint64_t)v14;
  v16 = v14;

  v17 = [STAppOverrides alloc];
  v18 = -[STAppOverrides initWithDictionary:](v17, "initWithDictionary:", MEMORY[0x24BDBD1B8]);
  v19 = (void *)_defaultAppOverrides;
  _defaultAppOverrides = v18;

}

void __27__STAppOverrides_overrides__block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  STAppOverrides *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[STAppOverrides initWithDictionary:]([STAppOverrides alloc], "initWithDictionary:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

- (int)category
{
  return self->_category;
}

- (BOOL)hideLastUsed
{
  return self->_hideLastUsed;
}

- (BOOL)forceVisible
{
  return self->_forceVisible;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (NSString)usageBundleOverride
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)defaultName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isICloud
{
  return self->_isICloud;
}

- (NSArray)includeMediaUsage
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)includeFsPaths
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)includeCacheDeleteKeys
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)includeContainers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)includeSoftwareUpdates
{
  return self->_includeSoftwareUpdates;
}

- (NSString)unInstalledName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)forceExcludeUsageBundle
{
  return self->_forceExcludeUsageBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unInstalledName, 0);
  objc_storeStrong((id *)&self->_includeContainers, 0);
  objc_storeStrong((id *)&self->_includeCacheDeleteKeys, 0);
  objc_storeStrong((id *)&self->_includeFsPaths, 0);
  objc_storeStrong((id *)&self->_includeMediaUsage, 0);
  objc_storeStrong((id *)&self->_defaultName, 0);
  objc_storeStrong((id *)&self->_usageBundleOverride, 0);
}

@end
