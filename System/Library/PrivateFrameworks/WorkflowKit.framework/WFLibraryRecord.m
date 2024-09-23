@implementation WFLibraryRecord

- (int64_t)computedSyncHash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;

  v3 = (void *)objc_opt_new();
  -[WFLibraryRecord version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFLibraryRecord version](self, "version");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v5);

  }
  -[WFLibraryRecord data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFLibraryRecord data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v8);

  }
  v10 = objc_msgSend(v3, "finalize");

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)version
{
  return self->_version;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)cloudKitRecordMetadata
{
  return self->_cloudKitRecordMetadata;
}

- (void)setCloudKitRecordMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)lastSyncedHash
{
  return self->_lastSyncedHash;
}

- (void)setLastSyncedHash:(int64_t)a3
{
  self->_lastSyncedHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitRecordMetadata, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
