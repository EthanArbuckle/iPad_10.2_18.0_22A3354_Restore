@implementation WBMutableProfile

- (void)setSettingsDictionary:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *settingsDictionary;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  settingsDictionary = self->super._settingsDictionary;
  self->super._settingsDictionary = v4;

}

- (WBMutableProfile)initWithBookmark:(id)a3 tabGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  WBMutableProfile *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE82E70]) ^ 1;

  v10 = -[WBMutableProfile initWithBookmark:kind:tabGroups:](self, "initWithBookmark:kind:tabGroups:", v7, v9, v6);
  return v10;
}

- (WBMutableProfile)initWithBookmark:(id)a3 kind:(int64_t)a4 tabGroups:(id)a5
{
  id v8;
  WBMutableProfile *v9;
  uint64_t v10;
  NSArray *tabGroups;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  WBMutableProfile *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = -[WBProfile initWithBookmark:kind:](self, "initWithBookmark:kind:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "mutableCopy");
    tabGroups = v9->super._tabGroups;
    v9->super._tabGroups = (NSArray *)v10;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v9->super._tabGroups;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
          -[WBProfile identifier](v9, "identifier", (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setProfileIdentifier:", v18);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    v19 = v9;
  }

  return v9;
}

+ (id)createDefaultProfileWithTabGroups:(id)a3
{
  id v3;
  WebBookmark *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  WBMutableProfile *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = [WebBookmark alloc];
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("~DefaultProfileDeviceIdentifier-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WebBookmark initFolderWithParentID:subtype:deviceIdentifier:collectionType:](v4, "initFolderWithParentID:subtype:deviceIdentifier:collectionType:", 0, 2, v8, 1);

  v10 = *MEMORY[0x24BE82E70];
  objc_msgSend(v9, "_setUUID:", *MEMORY[0x24BE82E70]);
  objc_msgSend(v9, "_setServerID:", v10);
  v11 = -[WBMutableProfile initWithBookmark:kind:tabGroups:]([WBMutableProfile alloc], "initWithBookmark:kind:tabGroups:", v9, 0, v3);

  -[WBMutableProfile setSyncable:](v11, "setSyncable:", 1);
  objc_msgSend(MEMORY[0x24BE82CB0], "defaultPersonalProfileSymbolImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBMutableProfile setSymbolImageName:](v11, "setSymbolImageName:", v12);

  objc_msgSend(MEMORY[0x24BE82CB0], "defaultPersonalProfileColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBMutableProfile setColor:](v11, "setColor:", v13);

  return v11;
}

- (WBSCRDTPosition)syncPosition
{
  void *v2;
  void *v3;

  -[WBProfile bookmark](self, "bookmark");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncPosition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSCRDTPosition *)v3;
}

- (void)setSyncPosition:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBProfile bookmark](self, "bookmark");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSyncPosition:", v4);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBProfile bookmark](self, "bookmark");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)setDatabaseIdentifier:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[WBProfile bookmark](self, "bookmark");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setID:", v3);

}

- (void)setSymbolImageName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBProfile bookmark](self, "bookmark");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSymbolImageName:", v4);

}

- (void)setSyncable:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[WBProfile bookmark](self, "bookmark");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSyncable:", v3);

}

- (void)setIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBProfile bookmark](self, "bookmark");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setUUID:", v4);

}

- (void)setTabGroups:(id)a3
{
  NSArray *v4;
  NSArray *tabGroups;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  tabGroups = self->super._tabGroups;
  self->super._tabGroups = v4;

}

- (void)markBackgroundImageAsModified
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[WBProfile bookmark](self, "bookmark");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundImageModifiedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "BOOLValue") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBProfile bookmark](self, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundImageModifiedState:", v5);

}

- (void)setStartPageSectionsDataRepresentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WBProfile bookmark](self, "bookmark");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartPageSectionsDataRepresentation:", v4);

}

- (NSDictionary)settingsDictionary
{
  return (NSDictionary *)self->super._settingsDictionary;
}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBProfile bookmark](self, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__WBMutableProfile_setSetting_forKey___block_invoke;
  v11[3] = &unk_24CB324C0;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performWithFieldsWriteLock:", v11);

}

void __38__WBMutableProfile_setSetting_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 48));

  if ((v7 & 1) == 0)
  {
    v8 = v18;
    if (!v18)
    {
      v9 = objc_alloc(MEMORY[0x24BE830C8]);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = objc_alloc(MEMORY[0x24BE830D0]);
      objc_msgSend(*(id *)(a1 + 32), "bookmark");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithDeviceIdentifier:generation:", v13, 1);
      objc_msgSend(*(id *)(a1 + 32), "bookmark");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v9, "initWithValue:generation:deviceIdentifier:", v10, v14, v16);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v19, *(_QWORD *)(a1 + 40));
      v8 = v19;
    }
    v18 = v8;
    objc_msgSend(v8, "setValue:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v18, "incrementGenerationIfNeeded");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("modified"));
    objc_msgSend(*(id *)(a1 + 32), "bookmark");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "markAttributesAsModified:", 0x100000);

  }
}

- (void)resumeIncrementingFields:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global_24);
}

uint64_t __45__WBMutableProfile_resumeIncrementingFields___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldIncrementGeneration:", 1);
}

- (void)setColor:(id)a3
{
  id v4;

  objc_msgSend(a3, "dataRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBMutableProfile setSetting:forKey:](self, "setSetting:forKey:", v4, *MEMORY[0x24BE82F98]);

}

- (void)mergeWithProfile:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isSyncable"))
  {
    -[WBProfile bookmark](self, "bookmark");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bookmark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mergeWithBookmark:", v5);

    objc_msgSend(v7, "recentsStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBProfile setRecentsStore:](self, "setRecentsStore:", v6);

  }
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
