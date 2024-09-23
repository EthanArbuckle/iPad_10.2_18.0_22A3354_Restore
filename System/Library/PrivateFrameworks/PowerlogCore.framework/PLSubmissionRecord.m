@implementation PLSubmissionRecord

+ (id)getDASubmissionDirPathForTag:(id)a3
{
  return (id)objc_msgSend(CFSTR("/tmp/powerlog/"), "stringByAppendingPathComponent:", a3);
}

+ (id)getCKSubmissionDirPathForTag:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Powerlog_%@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/tmp/powerlog/cloud/"), "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PLSubmissionRecord)initWithCKFilePath:(id)a3 tagUUID:(id)a4 tagConfig:(id)a5 configUUID:(id)a6 configDateReceived:(id)a7 configDateApplied:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PLSubmissionRecord *v20;
  PLSubmissionRecord *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v28;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)PLSubmissionRecord;
  v20 = -[PLSubmissionRecord init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    -[PLSubmissionRecord setFilePath:](v20, "setFilePath:", v14);
    -[PLSubmissionRecord setTagUUID:](v21, "setTagUUID:", v15);
    -[PLSubmissionRecord setTagConfig:](v21, "setTagConfig:", v16);
    -[PLSubmissionRecord setInSubmission:](v21, "setInSubmission:", 0);
    v28 = v16;
    +[PLSubmissionRecord getDASubmissionDirPathForTag:](PLSubmissionRecord, "getDASubmissionDirPathForTag:", v15);
    v22 = v19;
    v23 = v14;
    v24 = v17;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionRecord setDaFileDirPath:](v21, "setDaFileDirPath:", v25);

    +[PLSubmissionRecord getCKSubmissionDirPathForTag:](PLSubmissionRecord, "getCKSubmissionDirPathForTag:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionRecord setCkFileDirPath:](v21, "setCkFileDirPath:", v26);

    v17 = v24;
    v14 = v23;
    v19 = v22;
    objc_storeStrong((id *)&v21->_configUUID, a6);
    objc_storeStrong((id *)&v21->_configDateApplied, a8);
    v16 = v28;
    objc_storeStrong((id *)&v21->_configDateReceived, a7);
  }

  return v21;
}

- (void)emitAttemptEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("attempt"), CFSTR("iCloudSubmissionState"));
  -[PLSubmissionRecord tagConfig](self, "tagConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("TaskingReason"));

  -[PLSubmissionRecord configUUID](self, "configUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLSubmissionRecord configUUID](self, "configUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("DPTaskingUUID"));

    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[PLSubmissionRecord configDateApplied](self, "configDateApplied");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionRecord configDateReceived](self, "configDateReceived");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    objc_msgSend(v9, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("TaskingDelayFromDPBlobReceivedTime"));

  }
  -[PLSubmissionRecord configDateApplied](self, "configDateApplied");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[PLSubmissionRecord configDateApplied](self, "configDateApplied");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v15);
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("TaskingDurationStartToiCloudAttempt"));

  }
  _submitTaskingCAEventPayload(v3, CFSTR("Attempting log upload"));

}

- (void)emitSuccessEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("success"), CFSTR("iCloudSubmissionState"));
  -[PLSubmissionRecord tagConfig](self, "tagConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("TaskingReason"));

  -[PLSubmissionRecord configUUID](self, "configUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLSubmissionRecord configUUID](self, "configUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("DPTaskingUUID"));

  }
  -[PLSubmissionRecord configDateApplied](self, "configDateApplied");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[PLSubmissionRecord configDateApplied](self, "configDateApplied");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v11);
    objc_msgSend(v10, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("TaskingDurationStartToiCloudSuccess"));

  }
  _submitTaskingCAEventPayload(v3, CFSTR("Successful log upload"));

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PLSubmissionRecord filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("filePath"));

  -[PLSubmissionRecord tagUUID](self, "tagUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("tagUUID"));

  -[PLSubmissionRecord tagConfig](self, "tagConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("tagConfig"));

  -[PLSubmissionRecord configUUID](self, "configUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLSubmissionRecord configUUID](self, "configUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("configUUID"));

  }
  -[PLSubmissionRecord configDateApplied](self, "configDateApplied");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PLSubmissionRecord configDateApplied](self, "configDateApplied");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("configDateApplied"));

  }
  -[PLSubmissionRecord configDateReceived](self, "configDateReceived");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PLSubmissionRecord configDateReceived](self, "configDateReceived");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("configDateReceived"));

  }
}

- (PLSubmissionRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLSubmissionRecord *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tagUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("tagConfig"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configDateReceived"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configDateApplied"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PLSubmissionRecord initWithCKFilePath:tagUUID:tagConfig:configUUID:configDateReceived:configDateApplied:](self, "initWithCKFilePath:tagUUID:tagConfig:configUUID:configDateReceived:configDateApplied:", v5, v6, v10, v11, v12, v13);
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)cleanup
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PLSubmissionRecord *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (+[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("PLSubmissionCleanup"), 1))
  {
    PLLogSubmission();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up files for submission record %@", (uint8_t *)&v11, 0xCu);
    }

    -[PLSubmissionRecord filePath](self, "filePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionRecord removeFileAtPath:](self, "removeFileAtPath:", v4);

    -[PLSubmissionRecord daFileDirPath](self, "daFileDirPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionRecord removeFileAtPath:](self, "removeFileAtPath:", v5);

    -[PLSubmissionRecord ckFileDirPath](self, "ckFileDirPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionRecord removeFileAtPath:](self, "removeFileAtPath:", v6);

    NSTemporaryDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("PLSubmissionConfig"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionRecord tagUUID](self, "tagUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionRecord removeFileAtPath:](self, "removeFileAtPath:", v10);

  }
}

- (void)removeFileAtPath:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v3, &v11);
    v8 = v11;

    PLLogSubmission();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "Removed item at %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PLSubmissionRecord removeFileAtPath:].cold.1();
    }

  }
}

- (NSString)tagUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTagUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSUUID)configUUID
{
  return self->_configUUID;
}

- (NSDate)configDateApplied
{
  return self->_configDateApplied;
}

- (NSDate)configDateReceived
{
  return self->_configDateReceived;
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)ckFileDirPath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCkFileDirPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)daFileDirPath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDaFileDirPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDictionary)tagConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTagConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)inSubmission
{
  return self->_inSubmission;
}

- (void)setInSubmission:(BOOL)a3
{
  self->_inSubmission = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagConfig, 0);
  objc_storeStrong((id *)&self->_daFileDirPath, 0);
  objc_storeStrong((id *)&self->_ckFileDirPath, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_configDateReceived, 0);
  objc_storeStrong((id *)&self->_configDateApplied, 0);
  objc_storeStrong((id *)&self->_configUUID, 0);
  objc_storeStrong((id *)&self->_tagUUID, 0);
}

- (void)removeFileAtPath:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_4(&dword_1B6AB6000, v0, (uint64_t)v0, "Failed to remove item at %@, error: %@", v1);
  OUTLINED_FUNCTION_1_0();
}

@end
