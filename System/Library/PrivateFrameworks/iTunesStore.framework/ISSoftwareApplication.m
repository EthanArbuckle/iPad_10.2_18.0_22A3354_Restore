@implementation ISSoftwareApplication

- (ISSoftwareApplication)initWithLaunchServicesApplication:(id)a3
{
  return -[ISSoftwareApplication initWithLaunchServicesApplication:containerPath:](self, "initWithLaunchServicesApplication:containerPath:", a3, objc_msgSend((id)objc_msgSend(a3, "bundleContainerURL"), "path"));
}

- (ISSoftwareApplication)initWithLaunchServicesApplication:(id)a3 containerPath:(id)a4
{
  ISSoftwareApplication *v7;
  objc_super v9;

  __ISRecordSPIClassUsage(self);
  v9.receiver = self;
  v9.super_class = (Class)ISSoftwareApplication;
  v7 = -[ISSoftwareApplication init](&v9, sel_init);
  if (v7)
  {
    objc_msgSend(a3, "applicationDSID");
    -[ISSoftwareApplication setAccountDSID:](v7, "setAccountDSID:", SSAccountGetUniqueIdentifierFromValue());
    -[ISSoftwareApplication setBeta:](v7, "setBeta:", objc_msgSend(a3, "isBetaApp"));
    -[ISSoftwareApplication setBundleIdentifier:](v7, "setBundleIdentifier:", objc_msgSend(a3, "bundleIdentifier"));
    -[ISSoftwareApplication setBundleShortVersionString:](v7, "setBundleShortVersionString:", objc_msgSend(a3, "shortVersionString"));
    -[ISSoftwareApplication setBundleVersion:](v7, "setBundleVersion:", objc_msgSend(a3, "bundleVersion"));
    -[ISSoftwareApplication setContainerPath:](v7, "setContainerPath:", a4);
    -[ISSoftwareApplication setPlaceholder:](v7, "setPlaceholder:", objc_msgSend(a3, "isPlaceholder"));
    -[ISSoftwareApplication setProfileValidated:](v7, "setProfileValidated:", objc_msgSend(a3, "profileValidated"));
    -[ISSoftwareApplication _loadMetadataFromContainer:](v7, "_loadMetadataFromContainer:", a4);
    -[ISSoftwareApplication setHasMIDBasedSINF:](v7, "setHasMIDBasedSINF:", objc_msgSend(a3, "hasMIDBasedSINF"));
    -[ISSoftwareApplication setMissingRequiredSINF:](v7, "setMissingRequiredSINF:", objc_msgSend(a3, "missingRequiredSINF"));
    v7->_removableStatus = 0;
    if (objc_msgSend((id)objc_msgSend(a3, "applicationType"), "isEqualToString:", CFSTR("System"))
      && objc_msgSend(a3, "isDeletable"))
    {
      v7->_removableStatus |= 2uLL;
    }
    if (objc_msgSend(a3, "isRemovedSystemApp"))
      v7->_removableStatus |= 4uLL;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISSoftwareApplication;
  -[ISSoftwareApplication dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISSoftwareApplication;
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: (%@, %@:%@)"), -[ISSoftwareApplication description](&v3, sel_description), -[ISSoftwareApplication bundleIdentifier](self, "bundleIdentifier"), -[ISSoftwareApplication itemIdentifier](self, "itemIdentifier"), -[ISSoftwareApplication versionIdentifier](self, "versionIdentifier"));
}

- (NSString)deviceIdentifierForVendor
{
  void *v3;

  if (!self->_deviceIdentifierForVendor)
  {
    if (-[NSString length](self->_bundleIdentifier, "length"))
    {
      v3 = (void *)objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", self->_bundleIdentifier);
      if (v3)
        self->_deviceIdentifierForVendor = (NSString *)(id)objc_msgSend((id)objc_msgSend(v3, "deviceIdentifierForVendor"), "UUIDString");
    }
  }
  return self->_deviceIdentifierForVendor;
}

- (BOOL)isLaunchProhibited
{
  void *v3;

  if (!-[ISSoftwareApplication didCheckLaunchProhibited](self, "didCheckLaunchProhibited")
    && -[NSString length](self->_bundleIdentifier, "length"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", self->_bundleIdentifier);
    if (v3)
      self->_launchProhibited = objc_msgSend(v3, "isLaunchProhibited");
    -[ISSoftwareApplication setDidCheckLaunchProhibited:](self, "setDidCheckLaunchProhibited:", 1);
  }
  return self->_launchProhibited;
}

- (void)resetVPPStateFlags
{
  self->_vppStateFlags = 0;
}

- (NSString)vendorName
{
  void *v3;

  if (!self->_vendorName)
  {
    if (-[NSString length](self->_bundleIdentifier, "length"))
    {
      v3 = (void *)objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", self->_bundleIdentifier);
      if (v3)
        self->_vendorName = (NSString *)(id)objc_msgSend(v3, "vendorName");
    }
  }
  return self->_vendorName;
}

- (unint64_t)vppStateFlags
{
  unint64_t result;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t vppStateFlags;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;

  result = self->_vppStateFlags;
  if (!result)
  {
    v4 = (void *)MEMORY[0x20BD37A0C](0, a2);
    if (self->_bundleIdentifier)
      v5 = (void *)objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:");
    else
      v5 = 0;
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "dataContainerURL"), "path"), "stringByAppendingPathComponent:", CFSTR("StoreKit"));
    if (objc_msgSend(v5, "profileValidated"))
      v7 = CFSTR("sandboxReceipt");
    else
      v7 = CFSTR("receipt");
    v8 = objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v9 = objc_alloc_init(MEMORY[0x24BDD1580]);
    if ((objc_msgSend(v9, "fileExistsAtPath:", v8) & 1) != 0)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F80]), "initWithContentsOfFile:", v8);
      vppStateFlags = self->_vppStateFlags;
      if (v10)
      {
        v12 = v10;
        self->_vppStateFlags = vppStateFlags | 1;
        self->_receiptExpirationDate = (NSDate *)(id)objc_msgSend(v10, "expirationDate");
        if (objc_msgSend(v12, "isVPPLicensed"))
        {
          self->_vppStateFlags |= 2uLL;
          if ((objc_msgSend(v12, "isRevoked") & 1) != 0)
          {
            v13 = 8;
LABEL_18:
            self->_vppStateFlags |= v13;
            goto LABEL_19;
          }
          v15 = (void *)objc_msgSend(v12, "expirationDate");
          if (objc_msgSend(v15, "compare:", objc_msgSend(MEMORY[0x24BDBCE60], "date")) == -1)
          {
            v13 = 4;
            goto LABEL_18;
          }
        }
LABEL_19:

        goto LABEL_20;
      }
      v14 = vppStateFlags | 0xFFFFFFFF80000000;
    }
    else
    {
      v14 = self->_vppStateFlags | 0x40000000;
    }
    self->_vppStateFlags = v14;
LABEL_20:

    objc_autoreleasePoolPop(v4);
    return self->_vppStateFlags;
  }
  return result;
}

- (id)ITunesMetadataDictionary
{
  NSString *v2;

  v2 = -[NSString stringByAppendingPathComponent:](-[ISSoftwareApplication containerPath](self, "containerPath"), "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v2);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "15", self->_hasMIDBasedSINF);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "16", self->_missingRequiredSINF);
  xpc_dictionary_set_BOOL(v3, "9", self->_profileValidated);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  return v3;
}

- (ISSoftwareApplication)initWithXPCEncoding:(id)a3
{
  ISSoftwareApplication *v5;
  xpc_object_t value;
  xpc_object_t v8;
  objc_super v9;

  if (a3 && MEMORY[0x20BD37E20](a3, a2) == MEMORY[0x24BDACFA0])
  {
    v9.receiver = self;
    v9.super_class = (Class)ISSoftwareApplication;
    v5 = -[ISSoftwareApplication init](&v9, sel_init);
    if (v5)
    {
      objc_opt_class();
      v5->_accountDSID = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_accountIdentifier = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_bundleIdentifier = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_bundleShortVersionString = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_bundleVersion = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_containerPath = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_familyAccountIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      v5->_hasMIDBasedSINF = xpc_dictionary_get_BOOL(a3, "15");
      objc_opt_class();
      v5->_itemIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_itemName = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      v5->_missingRequiredSINF = xpc_dictionary_get_BOOL(a3, "16");
      v5->_profileValidated = xpc_dictionary_get_BOOL(a3, "9");
      objc_opt_class();
      v5->_softwareType = (NSString *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_storeFrontIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_versionIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass();
      objc_opt_class();
      v5->_versionOrdering = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass();
      value = xpc_dictionary_get_value(a3, "6");
      if (value)
      {
        v8 = value;
        if (MEMORY[0x20BD37E20]())
          v5->_contentRating = (SSItemContentRating *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E58]), "initWithXPCEncoding:", v8);
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)_loadMetadataFromContainer:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSNumber *v23;
  char v24;
  void *v25;

  v4 = objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v4);
  v6 = v5;
  if (v5)
  {
    v25 = v5;
    v7 = objc_msgSend(v5, "objectForKey:", CFSTR("appleId"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISSoftwareApplication setAccountIdentifier:](self, "setAccountIdentifier:", v7);
    v8 = objc_msgSend(v25, "objectForKey:", CFSTR("itemId"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISSoftwareApplication setItemIdentifier:](self, "setItemIdentifier:", v8);
    v9 = objc_msgSend(v25, "objectForKey:", CFSTR("itemName"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISSoftwareApplication setItemName:](self, "setItemName:", v9);
    v10 = objc_msgSend(v25, "objectForKey:", *MEMORY[0x24BEB22E8]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E58]), "initWithDictionary:", v10);
      -[ISSoftwareApplication setContentRating:](self, "setContentRating:", v11);

    }
    v12 = objc_msgSend(v25, "objectForKey:", *MEMORY[0x24BEB22F0]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISSoftwareApplication setSoftwareType:](self, "setSoftwareType:", v12);
    v13 = objc_msgSend(v25, "objectForKey:", CFSTR("s"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISSoftwareApplication setStoreFrontIdentifier:](self, "setStoreFrontIdentifier:", v13);
    v14 = objc_msgSend(v25, "objectForKey:", CFSTR("softwareVersionExternalIdentifier"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISSoftwareApplication setVersionIdentifier:](self, "setVersionIdentifier:", v14);
    v15 = objc_msgSend(v25, "objectForKey:", CFSTR("softwareVersionExternalIdentifiers"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ISSoftwareApplication setVersionOrdering:](self, "setVersionOrdering:", v15);
    v16 = (void *)objc_msgSend(v25, "objectForKey:", *MEMORY[0x24BEB22E0]);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = v25;
    if ((isKindOfClass & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BEB22D8]);
      objc_opt_class();
      v19 = objc_opt_isKindOfClass();
      v6 = v25;
      if ((v19 & 1) != 0)
      {
        v20 = objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BEB2C40]);
        if (!-[ISSoftwareApplication accountIdentifier](self, "accountIdentifier"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[ISSoftwareApplication setAccountIdentifier:](self, "setAccountIdentifier:", v20);
        }
        v21 = objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BEB2C38]);
        if (!-[ISSoftwareApplication accountDSID](self, "accountDSID"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[ISSoftwareApplication setAccountDSID:](self, "setAccountDSID:", v21);
        }
        v22 = objc_msgSend(v18, "objectForKey:", CFSTR("FamilyID"));
        v23 = -[ISSoftwareApplication familyAccountIdentifier](self, "familyAccountIdentifier");
        v6 = v25;
        if (!v23)
        {
          objc_opt_class();
          v24 = objc_opt_isKindOfClass();
          v6 = v25;
          if ((v24 & 1) != 0)
          {
            -[ISSoftwareApplication setFamilyAccountIdentifier:](self, "setFamilyAccountIdentifier:", v22);
            v6 = v25;
          }
        }
      }
    }
  }

}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAccountDSID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isBeta
{
  return self->_beta;
}

- (void)setBeta:(BOOL)a3
{
  self->_beta = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleShortVersionString
{
  return self->_bundleShortVersionString;
}

- (void)setBundleShortVersionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SSItemContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setDeviceIdentifierForVendor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)familyAccountIdentifier
{
  return self->_familyAccountIdentifier;
}

- (void)setFamilyAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)hasMIDBasedSINF
{
  return self->_hasMIDBasedSINF;
}

- (void)setHasMIDBasedSINF:(BOOL)a3
{
  self->_hasMIDBasedSINF = a3;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)missingRequiredSINF
{
  return self->_missingRequiredSINF;
}

- (void)setMissingRequiredSINF:(BOOL)a3
{
  self->_missingRequiredSINF = a3;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)isProfileValidated
{
  return self->_profileValidated;
}

- (void)setProfileValidated:(BOOL)a3
{
  self->_profileValidated = a3;
}

- (NSString)softwareType
{
  return self->_softwareType;
}

- (void)setSoftwareType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSArray)versionOrdering
{
  return self->_versionOrdering;
}

- (void)setVersionOrdering:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDate)receiptExpirationDate
{
  return self->_receiptExpirationDate;
}

- (void)setLaunchProhibited:(BOOL)a3
{
  self->_launchProhibited = a3;
}

- (BOOL)didCheckLaunchProhibited
{
  return self->_didCheckLaunchProhibited;
}

- (void)setDidCheckLaunchProhibited:(BOOL)a3
{
  self->_didCheckLaunchProhibited = a3;
}

- (unint64_t)removableStatus
{
  return self->_removableStatus;
}

@end
