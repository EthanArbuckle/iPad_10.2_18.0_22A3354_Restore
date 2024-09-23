@implementation TRISubjectProvider

- (id)subject
{
  _PASLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__TRISubjectProvider_subject__block_invoke;
  v5[3] = &unk_1E3BFFFA8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)defaultProviderWithPaths:(id)a3
{
  id v3;
  TRISubjectProvider *v4;
  void *v5;
  TRISubjectProvider *v6;

  v3 = a3;
  v4 = [TRISubjectProvider alloc];
  objc_msgSend(v3, "subjectDataFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[TRISubjectProvider initWithPath:](v4, "initWithPath:", v5);
  return v6;
}

- (TRISubjectProvider)initWithPath:(id)a3
{
  id v5;
  TRISubjectProvider *v6;
  TRISubjectProvider *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _PASLock *lock;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TRISubjectProvider;
  v6 = -[TRISubjectProvider init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v8 = objc_alloc(MEMORY[0x1E0D815F0]);
    v9 = (void *)objc_opt_new();
    v10 = objc_msgSend(v8, "initWithGuardedData:", v9);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v10;

  }
  return v7;
}

void __29__TRISubjectProvider_subject__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  uint32_t v6;
  uint32_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)v3[1];
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadUsingGuardedData:", v3);
    v4 = (void *)v3[1];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    TRILogCategory_ClientFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "com.apple.triald.wake";
      _os_log_impl(&dword_19B89C000, v5, OS_LOG_TYPE_DEFAULT, "Unable to deserialize subject. Posting %s", (uint8_t *)&v9, 0xCu);
    }

    v6 = notify_post("com.apple.triald.wake");
    if (v6)
    {
      v7 = v6;
      TRILogCategory_ClientFramework();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "com.apple.triald.wake";
        v11 = 2048;
        v12 = v7;
        _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "failed to post %s: %lu", (uint8_t *)&v9, 0x16u);
      }

    }
  }

}

- (BOOL)loadUsingGuardedData:(id)a3
{
  id v4;
  void *v5;
  NSString *path;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isReadableFileAtPath:", self->_path))
  {
    path = self->_path;
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", path, 2, &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    v9 = v8;
    if (v7)
    {

      v21 = 0;
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v7, &v21);
      v9 = v21;
      if (v10
        && (-[TRISubjectProvider decodeWithCoder:guardedData:](self, "decodeWithCoder:guardedData:", v10, v4), !v9))
      {
        if (!objc_msgSend(*((id *)v4 + 1), "hasDeviceId")
          || (objc_msgSend(*((id *)v4 + 1), "deviceId"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "length"),
              v14,
              v15 > 7))
        {
          v9 = 0;
          v12 = 1;
          goto LABEL_12;
        }
        TRILogCategory_ClientFramework();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*((id *)v4 + 1), "deviceId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "length");
          *(_DWORD *)buf = 134217984;
          v24 = v20;
          _os_log_error_impl(&dword_19B89C000, v16, OS_LOG_TYPE_ERROR, "rejecting deserialized subject due to unreasonably short deviceId of length %tu", buf, 0xCu);

        }
        v17 = (void *)*((_QWORD *)v4 + 1);
        *((_QWORD *)v4 + 1) = 0;

        v11 = *((_QWORD *)v4 + 2);
        *((_QWORD *)v4 + 2) = 0;
      }
      else
      {
        TRILogCategory_ClientFramework();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = (uint64_t)v9;
          _os_log_error_impl(&dword_19B89C000, v11, OS_LOG_TYPE_ERROR, "failed to decode subject from data -- %@", buf, 0xCu);
        }
      }

    }
    else
    {
      TRILogCategory_ClientFramework();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v18 = self->_path;
        *(_DWORD *)buf = 138412546;
        v24 = (uint64_t)v18;
        v25 = 2112;
        v26 = v9;
        _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "failed to read subject data from file %@ -- %@", buf, 0x16u);
      }
    }
    v12 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (void)decodeWithCoder:(id)a3 guardedData:(id)a4
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subjectData"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v5[1];
  v5[1] = v7;

  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rotationDate"));
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (id)v5[2];
  v5[2] = v9;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISubjectProvider)initWithCoder:(id)a3
{
  id v4;
  TRISubjectProvider *v5;
  void *v6;
  uint64_t v7;
  _PASLock *lock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TRISubjectProvider;
  v5 = -[TRISubjectProvider init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[TRISubjectProvider decodeWithCoder:guardedData:](v5, "decodeWithCoder:guardedData:", v4, v6);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v6);
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__TRISubjectProvider_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E3BFFF58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __38__TRISubjectProvider_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeWithCoder:guardedData:", *(_QWORD *)(a1 + 40), a2);
}

- (void)encodeWithCoder:(id)a3 guardedData:(id)a4
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;

  v5 = *((_QWORD *)a4 + 1);
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("subjectData"));
  v7 = v6[2];

  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("rotationDate"));
}

- (void)setNextRotationDate:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__TRISubjectProvider_setNextRotationDate___block_invoke;
  v7[3] = &unk_1E3BFFF80;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __42__TRISubjectProvider_setNextRotationDate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 16), *(id *)(a1 + 32));
}

- (BOOL)save
{
  _PASLock *lock;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__TRISubjectProvider_save__block_invoke;
  v5[3] = &unk_1E3BFFFA8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __26__TRISubjectProvider_save__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithCoder:guardedData:", v5, v4);

  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v20 = 0;
    objc_msgSend(v7, "triCreateDirectoryForPath:isDirectory:error:", v8, 0, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;

    if (v9)
      v11 = v10 == 0;
    else
      v11 = 0;
    if (v11)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v19 = 0;
      v17 = objc_msgSend(v6, "writeToFile:options:error:", v16, 1, &v19);
      v10 = v19;
      if ((v17 & 1) != 0)
      {
LABEL_14:

        goto LABEL_15;
      }
      TRILogCategory_ClientFramework();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        v22 = v18;
        v23 = 2112;
        v24 = v10;
        v14 = "failed to write subject data to file %@ -- %@";
        goto LABEL_17;
      }
    }
    else
    {
      TRILogCategory_ClientFramework();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        v22 = v13;
        v23 = 2112;
        v24 = v10;
        v14 = "failed to create directory for file %@ -- %@";
LABEL_17:
        _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
      }
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_14;
  }
  TRILogCategory_ClientFramework();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = 0;
    _os_log_error_impl(&dword_19B89C000, v15, OS_LOG_TYPE_ERROR, "failed to encode subject -- %@", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
LABEL_15:

}

- (unint64_t)numberOfWeeksPerRotation
{
  return 4;
}

- (id)subjectWithProjectId:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _PASLock *lock;
  _QWORD v13[4];
  id v14;
  int v15;

  v5 = (void *)objc_opt_new();
  -[TRISubjectProvider subject](self, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TRISubjectProvider subject](self, "subject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "copyTo:", v5);

    objc_msgSend(v5, "deviceId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "triHashWithIntegerSalt:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeviceId:", v10);

  }
  else
  {
    lock = self->_lock;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__TRISubjectProvider_subjectWithProjectId___block_invoke;
    v13[3] = &unk_1E3BFFFD0;
    v15 = a3;
    v14 = v5;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
    v8 = v14;
  }

  return v5;
}

void __43__TRISubjectProvider_subjectWithProjectId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;

  v12 = a2;
  if (!v12[3])
  {
    v3 = objc_opt_new();
    v4 = v12[3];
    v12[3] = (id)v3;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12[3], "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (*(_DWORD *)(a1 + 40) % 10000);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringFromIndex:", 24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("00000000-0000-0000-%04X-%@"), v8, v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12[3], "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "setDeviceId:", v6);

}

- (id)nextRotationDate
{
  _PASLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__TRISubjectProvider_nextRotationDate__block_invoke;
  v5[3] = &unk_1E3BFFFA8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__TRISubjectProvider_nextRotationDate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;

  v4 = a2;
  v3 = (void *)v4[2];
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadUsingGuardedData:", v4);
    v3 = (void *)v4[2];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);

}

- (id)anchorDate
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", 536457600.0);
}

- (id)nextRotationDateAfter:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996D8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  -[TRISubjectProvider anchorDate](self, "anchorDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v8, v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "day") / 7;
  v11 = v10 / (int64_t)-[TRISubjectProvider numberOfWeeksPerRotation](self, "numberOfWeeksPerRotation");
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setDay:", -[TRISubjectProvider numberOfWeeksPerRotation](self, "numberOfWeeksPerRotation") * (7 * v11 + 7));
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v12, v8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISubjectProvider.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("epochRelativeDate"));

  }
  objc_msgSend(v6, "startOfDayForDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)rotateSubject
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__TRISubjectProvider_rotateSubject__block_invoke;
  v3[3] = &unk_1E3BFFF80;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

void __35__TRISubjectProvider_rotateSubject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v4 = objc_opt_new();
  v5 = (void *)*((_QWORD *)v3 + 1);
  *((_QWORD *)v3 + 1) = v4;

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v3 + 1), "setDeviceId:", v7);

  objc_msgSend(*(id *)(a1 + 32), "nextRotationDateAfter:", 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (id)*((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 2) = v8;

}

@end
