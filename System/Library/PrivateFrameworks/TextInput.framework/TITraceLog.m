@implementation TITraceLog

- (TITraceLog)initWithLogContents:(id)a3
{
  id v4;
  TITraceLog *v5;
  uint64_t v6;
  NSString *logContents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITraceLog;
  v5 = -[TITraceLog init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    logContents = v5->_logContents;
    v5->_logContents = (NSString *)v6;

  }
  return v5;
}

- (id)recordStringMatchingUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TITraceLog recordEntryCache](self, "recordEntryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)recordStringMatchingTypologyRecord:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITraceLog recordStringMatchingUUID:](self, "recordStringMatchingUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateRecordsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__TITraceLog_enumerateRecordsWithBlock___block_invoke;
  v6[3] = &unk_1E24398A0;
  v7 = v4;
  v8 = v9;
  v5 = v4;
  -[TITraceLog enumerateTextRecordEntriesUsingBlock:](self, "enumerateTextRecordEntriesUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

- (NSMutableDictionary)recordEntryCache
{
  NSMutableDictionary *recordEntryCache;
  NSMutableDictionary **p_recordEntryCache;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  p_recordEntryCache = &self->_recordEntryCache;
  recordEntryCache = self->_recordEntryCache;
  if (!recordEntryCache)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__2607;
    v11 = __Block_byref_object_dispose__2608;
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__TITraceLog_recordEntryCache__block_invoke;
    v6[3] = &unk_1E24398C8;
    v6[4] = &v7;
    -[TITraceLog enumerateTextRecordEntriesUsingBlock:](self, "enumerateTextRecordEntriesUsingBlock:", v6);
    objc_storeStrong((id *)p_recordEntryCache, (id)v8[5]);
    _Block_object_dispose(&v7, 8);

    recordEntryCache = self->_recordEntryCache;
  }
  return recordEntryCache;
}

- (void)enumerateTextRecordEntriesUsingBlock:(id)a3
{
  void (**v4)(id, id, id, _BYTE *);
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;

  v4 = (void (**)(id, id, id, _BYTE *))a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3900]);
  -[TITraceLog logContents](self, "logContents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v19 = 0;
  v18 = 0;
  objc_msgSend(v7, "scanString:intoString:", CFSTR("RECORD ID: "), &v18);
  v8 = v18;
  if ((objc_msgSend(v7, "isAtEnd") & 1) == 0)
  {
    v9 = 0;
    do
    {
      v10 = v9;
      v21 = 0;
      v11 = v7;
      objc_msgSend(v11, "scanUpToString:intoString:", CFSTR("\n"), &v21);
      v12 = v21;
      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
      v20 = v12;
      objc_msgSend(v11, "scanUpToString:intoString:", CFSTR("RECORD ID: "), &v20);

      v14 = v20;
      v15 = (id)objc_msgSend(v14, "copy");

      v16 = v15;
      v9 = v13;

      if (v16 && v9)
        v4[2](v4, v16, v9, &v19);
      v17 = v16;
      objc_msgSend(v11, "scanString:intoString:", CFSTR("RECORD ID: "), &v17);
      v8 = v17;

    }
    while ((objc_msgSend(v11, "isAtEnd") & 1) == 0 && !v19);

  }
}

- (void)setRecordEntryCache:(id)a3
{
  objc_storeStrong((id *)&self->_recordEntryCache, a3);
}

- (NSString)logContents
{
  return self->_logContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logContents, 0);
  objc_storeStrong((id *)&self->_recordEntryCache, 0);
}

uint64_t __30__TITraceLog_recordEntryCache__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", a2, a3);
}

uint64_t __40__TITraceLog_enumerateRecordsWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

@end
