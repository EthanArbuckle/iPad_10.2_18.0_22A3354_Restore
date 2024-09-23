@implementation WBSCloudTabDeviceParameters

- (WBSCloudTabDeviceParameters)init
{
  WBSCloudTabDeviceParameters *v2;
  WBSCloudTabDeviceParameters *v3;
  WBSCloudTabDeviceParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSCloudTabDeviceParameters;
  v2 = -[WBSCloudTabDeviceParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_closeRequestSupported = 257;
    v4 = v2;
  }

  return v3;
}

+ (id)parametersWithDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setCloseRequestSupported:", objc_msgSend(v4, "isCloseRequestSupported"));
  objc_msgSend(v5, "setCloudKitBookmarkSyncingSupported:", objc_msgSend(v4, "isCloudKitBookmarkSyncingSupported"));
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceName:", v6);

  objc_msgSend(v4, "deviceTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceTypeIdentifier:", v7);

  objc_msgSend(v5, "setHasDuplicateName:", objc_msgSend(v4, "hasDuplicateName"));
  objc_msgSend(v5, "setEphemeralDevice:", objc_msgSend(v4, "isEphemeralDevice"));
  objc_msgSend(v4, "lastModified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastModified:", v8);

  objc_msgSend(v4, "tabs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTabs:", v9);
  return v5;
}

+ (id)parametersWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  WBSCloudTab *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("DeviceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "setDeviceName:", v7);

  objc_msgSend(v5, "setHasDuplicateName:", objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("HasDuplicateDeviceName")));
  objc_msgSend(v5, "setEphemeralDevice:", objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("IsEphemeralDevice")));
  objc_msgSend(v4, "safari_dateForKey:", CFSTR("LastModified"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_startOfDay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastModified:", v9);

  objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("Capabilities"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloseRequestSupported:", objc_msgSend(v10, "safari_BOOLForKey:", CFSTR("CloseTabRequest")));
  v22 = v10;
  objc_msgSend(v5, "setCloudKitBookmarkSyncingSupported:", objc_msgSend(v10, "safari_BOOLForKey:", CFSTR("CloudKitBookmarkSyncing")));
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("DeviceTypeIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceTypeIdentifier:", v11);

  objc_msgSend(v4, "safari_arrayForKey:", CFSTR("Tabs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = -[WBSCloudTab initWithDictionary:]([WBSCloudTab alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18));
        -[WBSCloudTab url](v19, "url");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(v5, "setTabs:", v13);
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  NSString *deviceName;
  void *v6;
  void *v7;
  NSString *deviceTypeIdentifier;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("CloseTabRequest"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("CloudKitBookmarkSyncing"));
  v11[0] = CFSTR("DictionaryType");
  v11[1] = CFSTR("DeviceName");
  deviceName = self->_deviceName;
  v12[0] = CFSTR("Device");
  v12[1] = deviceName;
  v11[2] = CFSTR("LastModified");
  v11[3] = CFSTR("Capabilities");
  v12[2] = self->_lastModified;
  v12[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (self->_hasDuplicateName)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HasDuplicateDeviceName"));
  if (self->_ephemeralDevice)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsEphemeralDevice"));
  deviceTypeIdentifier = self->_deviceTypeIdentifier;
  if (deviceTypeIdentifier)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", deviceTypeIdentifier, CFSTR("DeviceTypeIdentifier"));
  if (-[NSArray count](self->_tabs, "count"))
  {
    -[NSArray safari_mapAndFilterObjectsUsingBlock:](self->_tabs, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("Tabs"));

  }
  return (NSDictionary *)v7;
}

uint64_t __55__WBSCloudTabDeviceParameters_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (BOOL)closeRequestSupported
{
  return self->_closeRequestSupported;
}

- (void)setCloseRequestSupported:(BOOL)a3
{
  self->_closeRequestSupported = a3;
}

- (BOOL)cloudKitBookmarkSyncingSupported
{
  return self->_cloudKitBookmarkSyncingSupported;
}

- (void)setCloudKitBookmarkSyncingSupported:(BOOL)a3
{
  self->_cloudKitBookmarkSyncingSupported = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceTypeIdentifier
{
  return self->_deviceTypeIdentifier;
}

- (void)setDeviceTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasDuplicateName
{
  return self->_hasDuplicateName;
}

- (void)setHasDuplicateName:(BOOL)a3
{
  self->_hasDuplicateName = a3;
}

- (BOOL)isEphemeralDevice
{
  return self->_ephemeralDevice;
}

- (void)setEphemeralDevice:(BOOL)a3
{
  self->_ephemeralDevice = a3;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)tabs
{
  return self->_tabs;
}

- (void)setTabs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabs, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_deviceTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
