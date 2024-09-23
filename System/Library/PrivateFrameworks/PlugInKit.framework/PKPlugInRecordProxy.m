@implementation PKPlugInRecordProxy

- (PKPlugInRecordProxy)initWithUUID:(id)a3 error:(id *)a4
{
  id v5;
  PKPlugInRecordProxy *v6;
  id v7;
  uint64_t v8;
  LSApplicationExtensionRecord *lsRecord;
  PKPlugInRecordProxy *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPlugInRecordProxy;
  v5 = a3;
  v6 = -[PKPlugInRecordProxy init](&v12, sel_init);
  v7 = objc_alloc(MEMORY[0x1E0CA5848]);
  v8 = objc_msgSend(v7, "initWithUUID:error:", v5, a4, v12.receiver, v12.super_class);

  lsRecord = v6->_lsRecord;
  v6->_lsRecord = (LSApplicationExtensionRecord *)v8;

  if (v6->_lsRecord)
    v10 = v6;
  else
    v10 = 0;

  return v10;
}

- (PKPlugInRecordProxy)initWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  PKPlugInRecordProxy *v6;
  id v7;
  uint64_t v8;
  LSApplicationExtensionRecord *lsRecord;
  PKPlugInRecordProxy *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPlugInRecordProxy;
  v5 = a3;
  v6 = -[PKPlugInRecordProxy init](&v12, sel_init);
  v7 = objc_alloc(MEMORY[0x1E0CA5848]);
  v8 = objc_msgSend(v7, "initWithBundleIdentifier:error:", v5, a4, v12.receiver, v12.super_class);

  lsRecord = v6->_lsRecord;
  v6->_lsRecord = (LSApplicationExtensionRecord *)v8;

  if (v6->_lsRecord)
    v10 = v6;
  else
    v10 = 0;

  return v10;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[PKPlugInRecordProxy lsRecord](self, "lsRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedShortName
{
  void *v2;
  void *v3;

  -[PKPlugInRecordProxy lsRecord](self, "lsRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedShortName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[PKPlugInRecordProxy lsRecord](self, "lsRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleVersion
{
  void *v2;
  void *v3;

  -[PKPlugInRecordProxy lsRecord](self, "lsRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUUID)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[PKPlugInRecordProxy lsRecord](self, "lsRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (PKPlugInProxy)compatibilityObject
{
  void *v2;
  void *v3;

  -[PKPlugInRecordProxy lsRecord](self, "lsRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compatibilityObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPlugInProxy *)v3;
}

- (PKPropertyList)entitlements
{
  void *v2;
  void *v3;

  -[PKPlugInRecordProxy lsRecord](self, "lsRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPropertyList *)v3;
}

- (LSApplicationExtensionRecord)lsRecord
{
  return self->_lsRecord;
}

- (void)setLsRecord:(id)a3
{
  objc_storeStrong((id *)&self->_lsRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsRecord, 0);
}

@end
