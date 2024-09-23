@implementation PKCloudStoreContainerDiagnosticSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreContainerDiagnosticSnapshot)initWithRecordIDs:(id)a3 localRecordIDs:(id)a4
{
  id v7;
  id v8;
  PKCloudStoreContainerDiagnosticSnapshot *v9;
  PKCloudStoreContainerDiagnosticSnapshot *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKCloudStoreContainerDiagnosticSnapshot;
  v9 = -[PKCloudStoreContainerDiagnosticSnapshot init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordIDs, a3);
    objc_storeStrong((id *)&v10->_localRecordIDs, a4);
  }

  return v10;
}

- (PKCloudStoreContainerDiagnosticSnapshot)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreContainerDiagnosticSnapshot *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *recordIDs;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *localRecordIDs;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKCloudStoreContainerDiagnosticSnapshot;
  v5 = -[PKCloudStoreContainerDiagnosticSnapshot init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("recordIDs"));
    v10 = objc_claimAutoreleasedReturnValue();
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSDictionary *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("localRecordIDs"));
    v16 = objc_claimAutoreleasedReturnValue();
    localRecordIDs = v5->_localRecordIDs;
    v5->_localRecordIDs = (NSDictionary *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *recordIDs;
  id v5;

  recordIDs = self->_recordIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordIDs, CFSTR("recordIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localRecordIDs, CFSTR("localRecordIDs"));

}

- (NSDictionary)recordIDs
{
  return self->_recordIDs;
}

- (NSDictionary)localRecordIDs
{
  return self->_localRecordIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end
