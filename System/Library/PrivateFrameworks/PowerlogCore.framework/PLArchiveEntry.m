@implementation PLArchiveEntry

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLArchiveEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  return +[PLOperator entryKeyForType:andName:](PLStorageOperator, "entryKeyForType:andName:", CFSTR("EventPoint"), CFSTR("Archive"));
}

- (PLArchiveEntry)initWithStartDate:(id)a3 endDate:(id)a4 andUUID:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  PLArchiveEntry *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("StartDate");
  v15[1] = CFSTR("EndDate");
  v16[0] = a3;
  v16[1] = a4;
  v15[2] = CFSTR("UUID");
  v16[2] = a5;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PLArchiveEntry initEntryWithRawData:](self, "initEntryWithRawData:", v12);
  -[PLArchiveEntry log](v13, "log");

  return v13;
}

- (PLArchiveEntry)initWithMetadata:(id)a3
{
  id v4;
  PLArchiveEntry *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PLArchiveEntry *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  PLArchiveEntry *v30;
  id v31;
  objc_super v32;
  _QWORD v33[7];
  _QWORD v34[9];

  v34[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PLArchiveEntry;
  v5 = -[PLEntry init](&v32, sel_init);
  if (v5)
  {
    v30 = v5;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v4);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemTimeOffset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    v10 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemTimeStart"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemTimeEnd"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = CFSTR("StartDate");
    v29 = v12;
    objc_msgSend(v12, "dateByAddingTimeInterval:", -v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v27;
    v33[1] = CFSTR("EndDate");
    v28 = v15;
    objc_msgSend(v15, "dateByAddingTimeInterval:", -v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v16;
    v33[2] = CFSTR("UUID");
    v31 = v4;
    +[PLUtilities extractDateStringAndUUIDStringFromFilePath:](PLUtilities, "extractDateStringAndUUIDStringFromFilePath:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v18;
    v33[3] = CFSTR("SystemTimeOffset");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v19;
    v33[4] = CFSTR("SystemTimeOffsetModified");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("systemTimeModified"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v20;
    v33[5] = CFSTR("FullMode");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fullMode"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v21;
    v33[6] = CFSTR("SyncedOffDate");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasBeenLinkedToCR"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[6] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = -[PLArchiveEntry initEntryWithRawData:](v30, "initEntryWithRawData:", v25);
    -[PLArchiveEntry log](v23, "log");

    v4 = v31;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)initEntryWithRawData:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PLArchiveEntry *v21;
  objc_super v23;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SystemTimeOffset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    objc_msgSend(v6, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("SystemTimeOffset"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SystemTimeOffsetModified"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("SystemTimeOffsetModified"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FullMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLDefaults fullMode](PLDefaults, "fullMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("FullMode"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Stage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E6ABAA48, CFSTR("Stage"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NumAttempts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E6ABAA60, CFSTR("NumAttempts"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SyncedOffDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("SyncedOffDate"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RemovedDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("RemovedDate"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MainDBSizeAtStart"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E6ABAA60, CFSTR("MainDBSizeAtStart"));
  +[PLArchiveEntry entryKey](PLArchiveEntry, "entryKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)PLArchiveEntry;
  v21 = -[PLEntry initWithEntryKey:withRawData:](&v23, sel_initWithEntryKey_withRawData_, v20, v4);

  return v21;
}

- (NSString)path
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

  v3 = (void *)MEMORY[0x1E0C99D68];
  -[PLArchiveEntry startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveEntry systemTimeOffset](self, "systemTimeOffset");
  objc_msgSend(v4, "dateByAddingTimeInterval:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveEntry endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveEntry systemTimeOffset](self, "systemTimeOffset");
  objc_msgSend(v6, "dateByAddingTimeInterval:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filenameDateStringWithStartDate:endDate:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/powerlog_%@_%@.PLSQL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLArchiveEntry uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)compressedPath
{
  void *v2;
  void *v3;

  -[PLArchiveEntry path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR(".gz"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[PLArchiveEntry path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)startDate
{
  return (NSDate *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("StartDate"));
}

- (NSDate)endDate
{
  return (NSDate *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("EndDate"));
}

- (NSString)uuid
{
  return (NSString *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("UUID"));
}

- (void)setSystemTimeOffset:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  PLArchiveEntry *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[4];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  PLArchiveEntry *v25;

  -[PLArchiveEntry systemTimeOffset](self, "systemTimeOffset");
  if (v5 != a3)
  {
    -[PLArchiveEntry path](self, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLArchiveEntry compressedPath](self, "compressedPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    v8 = self;
    v25 = v8;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    *(double *)&v19[3] = a3;
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21[5];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __38__PLArchiveEntry_setSystemTimeOffset___block_invoke;
    v18[3] = &unk_1E6A52298;
    v18[4] = &v20;
    v18[5] = v19;
    objc_msgSend(v10, "updateEntry:withBlock:", v11, v18);

    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "flushCachesWithReason:", CFSTR("ArchiveEntryUpdate"));

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLArchiveEntry path](v8, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "moveItemAtPath:toPath:error:", v6, v15, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLArchiveEntry compressedPath](v8, "compressedPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "moveItemAtPath:toPath:error:", v7, v17, 0);

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(&v20, 8);

  }
}

uint64_t __38__PLArchiveEntry_setSystemTimeOffset___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v2, CFSTR("SystemTimeOffset"));

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SystemTimeOffsetModified"));
}

- (double)systemTimeOffset
{
  void *v2;
  double v3;
  double v4;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("SystemTimeOffset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (BOOL)fullMode
{
  void *v2;
  char v3;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("FullMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setStage:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[4];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  PLArchiveEntry *v17;

  if (-[PLArchiveEntry stage](self, "stage") != a3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = self;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = a3;
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13[5];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__PLArchiveEntry_setStage___block_invoke;
    v10[3] = &unk_1E6A52298;
    v10[4] = &v12;
    v10[5] = v11;
    objc_msgSend(v6, "updateEntry:withBlock:", v7, v10);

    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flushCachesWithReason:", CFSTR("ArchiveEntryUpdate"));

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v12, 8);

  }
}

void __27__PLArchiveEntry_setStage___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v2, CFSTR("Stage"));

}

- (int64_t)stage
{
  void *v2;
  int64_t v3;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Stage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setNumAttempts:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[4];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  PLArchiveEntry *v17;

  if (-[PLArchiveEntry numAttempts](self, "numAttempts") != a3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = self;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = a3;
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13[5];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__PLArchiveEntry_setNumAttempts___block_invoke;
    v10[3] = &unk_1E6A52298;
    v10[4] = &v12;
    v10[5] = v11;
    objc_msgSend(v6, "updateEntry:withBlock:", v7, v10);

    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flushCachesWithReason:", CFSTR("ArchiveEntryUpdate"));

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v12, 8);

  }
}

void __33__PLArchiveEntry_setNumAttempts___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v2, CFSTR("NumAttempts"));

}

- (unint64_t)numAttempts
{
  void *v2;
  unint64_t v3;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("NumAttempts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setSyncedOffDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  PLArchiveEntry *v20;

  v4 = a3;
  -[PLArchiveEntry syncedOffDate](self, "syncedOffDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToDate:", v5) & 1) != 0
    || !+[PLDefaults fullMode](PLDefaults, "fullMode"))
  {

  }
  else
  {
    v6 = -[PLArchiveEntry stage](self, "stage");

    if (v6 >= 5)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__0;
      v19 = __Block_byref_object_dispose__0;
      v20 = self;
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x3032000000;
      v13[3] = __Block_byref_object_copy__0;
      v13[4] = __Block_byref_object_dispose__0;
      v14 = v4;
      +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v16[5];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __35__PLArchiveEntry_setSyncedOffDate___block_invoke;
      v12[3] = &unk_1E6A52298;
      v12[4] = &v15;
      v12[5] = v13;
      objc_msgSend(v8, "updateEntry:withBlock:", v9, v12);

      +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "storage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "flushCachesWithReason:", CFSTR("ArchiveEntryUpdate"));

      _Block_object_dispose(v13, 8);
      _Block_object_dispose(&v15, 8);

    }
  }

}

uint64_t __35__PLArchiveEntry_setSyncedOffDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("SyncedOffDate"));
}

- (NSDate)syncedOffDate
{
  return (NSDate *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("SyncedOffDate"));
}

- (BOOL)syncedOff
{
  void *v2;
  double v3;
  BOOL v4;

  -[PLArchiveEntry syncedOffDate](self, "syncedOffDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3 > 0.0;

  return v4;
}

- (void)setRemovedDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  PLArchiveEntry *v20;

  v4 = a3;
  -[PLArchiveEntry removedDate](self, "removedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToDate:", v5) & 1) != 0)
  {

  }
  else
  {
    v6 = -[PLArchiveEntry stage](self, "stage");

    if (v6 >= 5)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__0;
      v19 = __Block_byref_object_dispose__0;
      v20 = self;
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x3032000000;
      v13[3] = __Block_byref_object_copy__0;
      v13[4] = __Block_byref_object_dispose__0;
      v14 = v4;
      +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v16[5];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __33__PLArchiveEntry_setRemovedDate___block_invoke;
      v12[3] = &unk_1E6A52298;
      v12[4] = &v15;
      v12[5] = v13;
      objc_msgSend(v8, "updateEntry:withBlock:", v9, v12);

      +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "storage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "flushCachesWithReason:", CFSTR("ArchiveEntryUpdate"));

      _Block_object_dispose(v13, 8);
      _Block_object_dispose(&v15, 8);

    }
  }

}

uint64_t __33__PLArchiveEntry_setRemovedDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("RemovedDate"));
}

- (NSDate)removedDate
{
  return (NSDate *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("RemovedDate"));
}

- (BOOL)removed
{
  void *v2;
  double v3;
  BOOL v4;

  -[PLArchiveEntry removedDate](self, "removedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3 > 0.0;

  return v4;
}

- (void)setMainDBSizeAtStart:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[4];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  PLArchiveEntry *v17;

  if (-[PLArchiveEntry mainDBSizeAtStart](self, "mainDBSizeAtStart") != a3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = self;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = a3;
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13[5];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__PLArchiveEntry_setMainDBSizeAtStart___block_invoke;
    v10[3] = &unk_1E6A52298;
    v10[4] = &v12;
    v10[5] = v11;
    objc_msgSend(v6, "updateEntry:withBlock:", v7, v10);

    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flushCachesWithReason:", CFSTR("ArchiveEntryUpdate"));

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v12, 8);

  }
}

void __39__PLArchiveEntry_setMainDBSizeAtStart___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v2, CFSTR("MainDBSizeAtStart"));

}

- (int64_t)mainDBSizeAtStart
{
  void *v2;
  int64_t v3;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("MainDBSizeAtStart"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (void)log
{
  void *v3;
  id v4;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeEntry:withCompletionBlock:", self, &__block_literal_global_4);

}

+ (id)storageQueue
{
  void *v2;
  void *v3;

  +[PLCoreStorage storageQueueNameForClass:](PLCoreStorage, "storageQueueNameForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)crPath
{
  return self->_crPath;
}

- (BOOL)systemTimeOffsetModified
{
  return self->_systemTimeOffsetModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crPath, 0);
}

@end
