@implementation TITypingDESRecordWriter

- (TITypingDESRecordWriter)init
{
  TITypingDESRecordWriter *v2;
  uint64_t v3;
  DESRecordStore *typingDataStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TITypingDESRecordWriter;
  v2 = -[TITypingDESRecordWriter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D398]), "initWithBundleIdentifier:", CFSTR("com.apple.TextInput.TypingDESPlugin"));
    typingDataStore = v2->_typingDataStore;
    v2->_typingDataStore = (DESRecordStore *)v3;

  }
  return v2;
}

- (void)storeTypingSession:(id)a3 containsCP:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v6 = a4;
  v18[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (-[TITypingDESRecordWriter shouldRecordToDES](self, "shouldRecordToDES"))
  {
    v17[0] = CFSTR("source");
    v17[1] = CFSTR("type");
    v18[0] = CFSTR("TITypingDESRecordWriter");
    v18[1] = CFSTR("typingSession");
    v17[2] = CFSTR("timestamp");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v11;
    v17[3] = CFSTR("containsCP");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TITypingDESRecordWriter typingDataStore](self, "typingDataStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__TITypingDESRecordWriter_storeTypingSession_containsCP_completion___block_invoke;
    v15[3] = &unk_1EA0FB438;
    v16 = v9;
    objc_msgSend(v14, "saveRecordWithData:recordInfo:completion:", v8, v13, v15);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, 0, 1);
  }

}

- (BOOL)shouldRecordToDES
{
  void *v4;
  char v5;

  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
    return 1;
  -[TITypingDESRecordWriter typingDataStore](self, "typingDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldMakeRecord");

  return v5;
}

- (void)storeAlignedSession:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(a3, "restrictedAlignedSessionWithWordLimit:", 20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    v10 = objc_msgSend(v7, "containsCPEntries");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__TITypingDESRecordWriter_storeAlignedSession_completion___block_invoke;
    v11[3] = &unk_1EA0FB460;
    v12 = v6;
    -[TITypingDESRecordWriter storeTypingSession:containsCP:completion:](self, "storeTypingSession:containsCP:completion:", v8, v10, v11);

  }
}

- (void)fetchRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[TITypingDESRecordWriter typingDataStore](self, "typingDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__TITypingDESRecordWriter_fetchRecords___block_invoke;
  v7[3] = &unk_1EA0FB488;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchSavedRecordInfoWithCompletion:", v7);

}

- (void)clearStoredRecordsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[TITypingDESRecordWriter typingDataStore](self, "typingDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__TITypingDESRecordWriter_clearStoredRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1EA0FB4B0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "deleteAllSavedRecordsWithCompletion:", v7);

}

- (DESRecordStore)typingDataStore
{
  return self->_typingDataStore;
}

- (void)setTypingDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_typingDataStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingDataStore, 0);
}

uint64_t __67__TITypingDESRecordWriter_clearStoredRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__TITypingDESRecordWriter_fetchRecords___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__TITypingDESRecordWriter_storeAlignedSession_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__TITypingDESRecordWriter_storeTypingSession_containsCP_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[TITypingDESRecordWriter storeTypingSession:containsCP:completion:]_block_invoke";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Error: %@", (uint8_t *)&v9, 0x16u);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, BOOL))(v8 + 16))(v8, v5, v6 == 0);

}

@end
