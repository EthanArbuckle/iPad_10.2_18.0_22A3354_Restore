@implementation WFCloudKitLibrary

- (WFCloudKitLibrary)init
{
  WFCloudKitLibrary *v2;
  WFCloudKitLibrary *v3;
  CKRecordID *identifier;
  NSString *version;
  WFFileRepresentation *dataFileRepresentation;
  WFCloudKitLibrary *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFCloudKitLibrary;
  v2 = -[WFCloudKitLibrary init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = 0;

    version = v3->_version;
    v3->_version = 0;

    dataFileRepresentation = v3->_dataFileRepresentation;
    v3->_dataFileRepresentation = 0;

    v7 = v3;
  }

  return v3;
}

- (WFCloudKitLibrary)initWithIdentifier:(id)a3 version:(id)a4 data:(id)a5 syncHash:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  WFCloudKitLibrary *v14;
  WFCloudKitLibrary *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  WFFileRepresentation *dataFileRepresentation;
  WFCloudKitLibrary *v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[WFCloudKitLibrary init](self, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_version, a4);
    v16 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileWithData:ofType:proposedFilename:", v13, v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    dataFileRepresentation = v15->_dataFileRepresentation;
    v15->_dataFileRepresentation = (WFFileRepresentation *)v18;

    v15->_syncHash = a6;
    v20 = v15;
  }

  return v15;
}

- (WFCloudKitLibrary)initWithLibraryRecord:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  WFCloudKitLibrary *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CKRecordID *identifier;
  uint64_t v13;
  NSString *version;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  WFFileRepresentation *dataFileRepresentation;
  WFCloudKitLibrary *v20;

  v6 = a3;
  v7 = a4;
  v8 = -[WFCloudKitLibrary init](self, "init");
  if (v8)
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordIDWithZoneID:libraryIdentifier:", v7, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (CKRecordID *)v11;

    objc_msgSend(v6, "version");
    v13 = objc_claimAutoreleasedReturnValue();
    version = v8->_version;
    v8->_version = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0D13F78];
    objc_msgSend(v6, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileWithData:ofType:proposedFilename:", v16, v17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    dataFileRepresentation = v8->_dataFileRepresentation;
    v8->_dataFileRepresentation = (WFFileRepresentation *)v18;

    v8->_syncHash = objc_msgSend(v6, "lastSyncedHash");
    v20 = v8;
  }

  return v8;
}

- (id)libraryIdentifierWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFCloudKitLibrary identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitLibraryErrorDomain"), 0, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)objc_opt_class();
  -[WFCloudKitLibrary identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryIdentifierFromRecordID:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (NSData)recordSystemFieldsData
{
  return self->_recordSystemFieldsData;
}

- (void)setRecordSystemFieldsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (WFFileRepresentation)dataFileRepresentation
{
  return self->_dataFileRepresentation;
}

- (void)setDataFileRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_dataFileRepresentation, a3);
}

- (int64_t)syncHash
{
  return self->_syncHash;
}

- (void)setSyncHash:(int64_t)a3
{
  self->_syncHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFileRepresentation, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (NSString)recordType
{
  return (NSString *)CFSTR("CoherenceLibrary");
}

+ (NSDictionary)properties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithUTType:", *MEMORY[0x1E0CEC4A0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCloudKitItemProperty assetPropertyWithName:fileType:](WFCloudKitItemProperty, "assetPropertyWithName:fileType:", CFSTR("dataFileRepresentation"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("version");
  +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("syncHash");
  +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:ignoredByDefault:encrypted:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

+ (id)recordIDWithZoneID:(id)a3 libraryIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(a1, "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v10, v8);
  return v11;
}

+ (id)libraryIdentifierFromRecordID:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hasPrefix:", v9) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitLibraryErrorDomain"), 1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E7AFA810);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)isLibraryRecordID:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPrefix:", v5);

  return v6;
}

@end
