@implementation WBSCloudTabDevice

- (WBSCloudTabDevice)initWithDictionary:(id)a3 uuid:(id)a4
{
  id v6;
  void *v7;
  WBSCloudTabDevice *v8;

  v6 = a4;
  +[WBSCloudTabDeviceParameters parametersWithDictionary:](WBSCloudTabDeviceParameters, "parametersWithDictionary:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WBSCloudTabDevice initWithParameters:uuid:](self, "initWithParameters:uuid:", v7, v6);

  return v8;
}

- (WBSCloudTabDevice)initWithParameters:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  WBSCloudTabDevice *v8;
  uint64_t v9;
  NSString *deviceTypeIdentifier;
  uint64_t v11;
  NSDate *lastModified;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSArray *tabs;
  uint64_t v17;
  NSString *uuid;
  WBSCloudTabDevice *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSCloudTabDevice;
  v8 = -[WBSCloudTabDevice init](&v21, sel_init);
  if (v8)
  {
    v8->_closeRequestSupported = objc_msgSend(v6, "closeRequestSupported");
    v8->_cloudKitBookmarkSyncingSupported = objc_msgSend(v6, "closeRequestSupported");
    objc_msgSend(v6, "deviceTypeIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    deviceTypeIdentifier = v8->_deviceTypeIdentifier;
    v8->_deviceTypeIdentifier = (NSString *)v9;

    v8->_ephemeralDevice = objc_msgSend(v6, "isEphemeralDevice");
    v8->_hasDuplicateName = objc_msgSend(v6, "hasDuplicateName");
    objc_msgSend(v6, "lastModified");
    v11 = objc_claimAutoreleasedReturnValue();
    lastModified = v8->_lastModified;
    v8->_lastModified = (NSDate *)v11;

    objc_msgSend(v6, "deviceName");
    v13 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v13;

    objc_msgSend(v6, "tabs");
    v15 = objc_claimAutoreleasedReturnValue();
    tabs = v8->_tabs;
    v8->_tabs = (NSArray *)v15;

    v17 = objc_msgSend(v7, "copy");
    uuid = v8->_uuid;
    v8->_uuid = (NSString *)v17;

    v19 = v8;
  }

  return v8;
}

- (WBSCloudTabDevice)initWithDeviceName:(id)a3 lastModified:(id)a4 hasDuplicateName:(BOOL)a5 tabs:(id)a6 uuid:(id)a7
{
  return -[WBSCloudTabDevice initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:isEphemeralDevice:](self, "initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:isEphemeralDevice:", a3, a4, a5, a6, a7, 0);
}

- (WBSCloudTabDevice)initWithDeviceName:(id)a3 lastModified:(id)a4 hasDuplicateName:(BOOL)a5 tabs:(id)a6 uuid:(id)a7 isEphemeralDevice:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  WBSCloudTabDeviceParameters *v18;
  WBSCloudTabDevice *v19;

  v8 = a8;
  v10 = a5;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(WBSCloudTabDeviceParameters);
  -[WBSCloudTabDeviceParameters setDeviceName:](v18, "setDeviceName:", v17);

  -[WBSCloudTabDeviceParameters setLastModified:](v18, "setLastModified:", v16);
  -[WBSCloudTabDeviceParameters setHasDuplicateName:](v18, "setHasDuplicateName:", v10);
  -[WBSCloudTabDeviceParameters setTabs:](v18, "setTabs:", v15);

  -[WBSCloudTabDeviceParameters setEphemeralDevice:](v18, "setEphemeralDevice:", v8);
  v19 = -[WBSCloudTabDevice initWithParameters:uuid:](self, "initWithParameters:uuid:", v18, v14);

  return v19;
}

- (NSString)disambiguatedName
{
  NSString *disambiguatedName;

  disambiguatedName = self->_disambiguatedName;
  if (!disambiguatedName)
    disambiguatedName = self->_name;
  return disambiguatedName;
}

- (id)deviceByRemovingTab:(id)a3
{
  id v4;
  NSArray *tabs;
  id v6;
  uint64_t v7;
  WBSCloudTabDevice *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  tabs = self->_tabs;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__WBSCloudTabDevice_deviceByRemovingTab___block_invoke;
  v12[3] = &unk_1E4B2BDC8;
  v6 = v4;
  v13 = v6;
  v7 = -[NSArray indexOfObjectPassingTest:](tabs, "indexOfObjectPassingTest:", v12);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (WBSCloudTabDevice *)-[WBSCloudTabDevice copy](self, "copy");
  }
  else
  {
    v9 = v7;
    v10 = (void *)-[NSArray mutableCopy](self->_tabs, "mutableCopy");
    objc_msgSend(v10, "removeObjectAtIndex:", v9);
    v8 = -[WBSCloudTabDevice initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:isEphemeralDevice:]([WBSCloudTabDevice alloc], "initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:isEphemeralDevice:", self->_name, self->_lastModified, self->_hasDuplicateName, v10, self->_uuid, self->_ephemeralDevice);

  }
  return v8;
}

uint64_t __41__WBSCloudTabDevice_deviceByRemovingTab___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasSameUUIDAndURLAsTab:", a2);
}

- (id)deviceByRemovingTabs:(id)a3
{
  id v4;
  NSArray *tabs;
  id v6;
  void *v7;
  void *v8;
  WBSCloudTabDevice *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  tabs = self->_tabs;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__WBSCloudTabDevice_deviceByRemovingTabs___block_invoke;
  v11[3] = &unk_1E4B2BDC8;
  v6 = v4;
  v12 = v6;
  -[NSArray indexesOfObjectsPassingTest:](tabs, "indexesOfObjectsPassingTest:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)-[NSArray mutableCopy](self->_tabs, "mutableCopy");
    objc_msgSend(v8, "removeObjectsAtIndexes:", v7);
    v9 = -[WBSCloudTabDevice initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:isEphemeralDevice:]([WBSCloudTabDevice alloc], "initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:isEphemeralDevice:", self->_name, self->_lastModified, self->_hasDuplicateName, v8, self->_uuid, self->_ephemeralDevice);

  }
  else
  {
    v9 = (WBSCloudTabDevice *)-[WBSCloudTabDevice copy](self, "copy");
  }

  return v9;
}

uint64_t __42__WBSCloudTabDevice_deviceByRemovingTabs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hasSameUUIDAndURLAsTab:", v3, (_QWORD)v9) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)deviceBySettingDisambiguatedName:(id)a3
{
  id v4;
  WBSCloudTabDevice *v5;
  uint64_t v6;
  NSString *disambiguatedName;

  v4 = a3;
  v5 = -[WBSCloudTabDevice initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:isEphemeralDevice:]([WBSCloudTabDevice alloc], "initWithDeviceName:lastModified:hasDuplicateName:tabs:uuid:isEphemeralDevice:", self->_name, self->_lastModified, self->_hasDuplicateName, self->_tabs, self->_uuid, self->_ephemeralDevice);
  v6 = objc_msgSend(v4, "copy");

  disambiguatedName = v5->_disambiguatedName;
  v5->_disambiguatedName = (NSString *)v6;

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uuid, "hash");
}

- (BOOL)isEqual:(id)a3
{
  WBSCloudTabDevice *v4;
  NSString *uuid;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (WBSCloudTabDevice *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (uuid = self->_uuid,
          -[WBSCloudTabDevice uuid](v4, "uuid"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(uuid) = -[NSString isEqualToString:](uuid, "isEqualToString:", v6),
          v6,
          (_DWORD)uuid))
    {
      -[WBSCloudTabDevice dictionaryRepresentation](self, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSCloudTabDevice dictionaryRepresentation](v4, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *name;
  NSString *uuid;
  _BOOL8 closeRequestSupported;
  NSDate *lastModified;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  uuid = self->_uuid;
  closeRequestSupported = self->_closeRequestSupported;
  lastModified = self->_lastModified;
  -[NSArray componentsJoinedByString:](self->_tabs, "componentsJoinedByString:", CFSTR(",\r    "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; name = \"%@\"; uuid = %@; closeRequestSupported = %d; lastModified = %@; tabs = (\r    %@\r)>"),
    v5,
    self,
    name,
    uuid,
    closeRequestSupported,
    lastModified,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v2;
  void *v3;

  +[WBSCloudTabDeviceParameters parametersWithDevice:](WBSCloudTabDeviceParameters, "parametersWithDevice:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (BOOL)isCloudTabDeviceDictionary:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safari_stringForKey:", CFSTR("DictionaryType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Device"));
    else
      v5 = 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (unint64_t)tabCountInDictionary:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "safari_arrayForKey:", CFSTR("Tabs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

+ (id)deviceNameInDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "safari_stringForKey:", CFSTR("DeviceName"));
}

+ (id)lastModifiedDateInDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "safari_dateForKey:", CFSTR("LastModified"));
}

+ (BOOL)hasDuplicateDeviceNameInDictionary:(id)a3
{
  return objc_msgSend(a3, "safari_BOOLForKey:", CFSTR("HasDuplicateDeviceName"));
}

+ (BOOL)isEphemeralDeviceInDictionary:(id)a3
{
  return objc_msgSend(a3, "safari_BOOLForKey:", CFSTR("IsEphemeralDevice"));
}

- (BOOL)isCloseRequestSupported
{
  return self->_closeRequestSupported;
}

- (NSString)deviceTypeIdentifier
{
  return self->_deviceTypeIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSArray)tabs
{
  return self->_tabs;
}

- (BOOL)hasDuplicateName
{
  return self->_hasDuplicateName;
}

- (BOOL)isEphemeralDevice
{
  return self->_ephemeralDevice;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (BOOL)isCloudKitBookmarkSyncingSupported
{
  return self->_cloudKitBookmarkSyncingSupported;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_tabs, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_disambiguatedName, 0);
  objc_storeStrong((id *)&self->_deviceTypeIdentifier, 0);
}

@end
