@implementation RCRecordingsFolder

- (RCRecordingsFolder)initWithContext:(id)a3 name:(id)a4 rank:(int64_t)a5 uuid:(id)a6
{
  id v10;
  id v11;
  RCRecordingsFolder *v12;
  RCRecordingsFolder *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v10 = a4;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)RCRecordingsFolder;
  v12 = -[RCRecordingsFolder initWithContext:](&v17, sel_initWithContext_, a3);
  v13 = v12;
  if (v12)
  {
    -[RCRecordingsFolder setEncryptedName:](v12, "setEncryptedName:", v10);
    -[RCRecordingsFolder setRank:](v13, "setRank:", a5);
    if (v11)
    {
      -[RCRecordingsFolder setUuid:](v13, "setUuid:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RCRecordingsFolder setUuid:](v13, "setUuid:", v15);

    }
  }

  return v13;
}

- (BOOL)containsRecording:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "userFolderUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCRecordingsFolder uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

+ (id)keyPathsForValuesAffectingCount
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("recordings"));
}

- (int64_t)folderType
{
  return 4;
}

@end
