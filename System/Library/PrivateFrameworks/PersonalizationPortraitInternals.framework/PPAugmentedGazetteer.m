@implementation PPAugmentedGazetteer

- (void)dealloc
{
  objc_super v3;

  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_15529);
  v3.receiver = self;
  v3.super_class = (Class)PPAugmentedGazetteer;
  -[PPAugmentedGazetteer dealloc](&v3, sel_dealloc);
}

- (PPAugmentedGazetteer)init
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PPContextPredictor *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  PPAugmentedGazetteer *v19;
  const char *v20;
  id v22;
  uint8_t buf[4];
  NSObject *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filepathForFactor:namespaceName:", CFSTR("AugmentedGazetteerMetadata.db"), CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filepathForFactor:namespaceName:", CFSTR("AugmentedGazetteer.dat"), CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"));
  v6 = objc_claimAutoreleasedReturnValue();

  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v6;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPAugmentedGazetteer: initializing with gazetteer at %@ and database at %@", buf, 0x16u);
  }

  if (!v6)
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "PPAugmentedGazetteer: unable to get gazetteer path.";
LABEL_11:
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_12:
    v19 = 0;
    goto LABEL_17;
  }
  if (!v4)
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "PPAugmentedGazetteer: unable to get SQL path.";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v8 = objc_alloc(MEMORY[0x1E0D81620]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("file://%@?immutable=1"), v4);
  v22 = 0;
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_msgSend(v8, "initWithFilename:flags:error:errorHandler:", v9, 1, &v22, v10);
  v12 = v22;

  if (v11)
  {
    v13 = [PPContextPredictor alloc];
    v14 = (void *)MEMORY[0x1E0D70A90];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "languageCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "languageForLocaleIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PPContextPredictor initWithLanguage:](v13, "initWithLanguage:", v17);

    self = -[PPAugmentedGazetteer initWithDatabaseAsset:gazetteerPath:contextPredictor:](self, "initWithDatabaseAsset:gazetteerPath:contextPredictor:", v11, v6, v18);
    v19 = self;
  }
  else
  {
    pp_default_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "PPAugmentedGazetteer: unable to open database. %@", buf, 0xCu);
    }
    v19 = 0;
  }

LABEL_17:
  return v19;
}

- (PPAugmentedGazetteer)initWithDatabaseAsset:(id)a3 gazetteerPath:(id)a4 contextPredictor:(id)a5
{
  id v9;
  id v10;
  id v11;
  PPAugmentedGazetteer *v12;
  PPAugmentedGazetteer *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  const void *v21;
  __CFArray *Mutable;
  __CFArray *v23;
  uint64_t v24;
  _PASLock *lock;
  objc_super v27;
  _QWORD v28[2];
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PPAugmentedGazetteer;
  v12 = -[PPAugmentedGazetteer init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_db, a3);
    objc_storeStrong((id *)&v13->_contextPredictor, a5);
    v14 = (_QWORD *)objc_opt_new();
    v15 = v10;
    objc_opt_self();
    v30 = *MEMORY[0x1E0D174D8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v16 = *MEMORY[0x1E0D17530];
    v28[0] = *MEMORY[0x1E0D17500];
    v28[1] = v16;
    v29[0] = &unk_1E7E59A08;
    v29[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v17 = NLTaggerCreate();
    v18 = v15;
    objc_opt_self();
    v31 = *MEMORY[0x1E0D173B0];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v18);

    v32[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (const void *)NLGazetteerCreate();
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v23 = Mutable;
    if (v21)
    {
      CFArrayAppendValue(Mutable, v21);
      NLTaggerSetGazetteers();
      CFRelease(v21);
    }
    else
    {
      NLTaggerSetGazetteers();
    }
    CFRelease(v23);
    v14[1] = v17;
    objc_opt_self();
    CFLocaleGetSystem();
    v14[2] = NLTokenizerCreate();
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v14);
    lock = v13->_lock;
    v13->_lock = (_PASLock *)v24;

  }
  return v13;
}

- (void)iterExtractionsForText:(id)a3 addEntity:(id)a4 addTopic:(id)a5 addLocation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__PPAugmentedGazetteer_iterExtractionsForText_addEntity_addTopic_addLocation___block_invoke;
  v16[3] = &unk_1E7E1B920;
  v16[4] = self;
  v17 = v10;
  v18 = v12;
  v19 = v11;
  v13 = v11;
  v14 = v12;
  v15 = v10;
  -[PPAugmentedGazetteer iterSentencesForText:block:](self, "iterSentencesForText:block:", a3, v16);

}

- (id)metadataForName:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  db = self->_db;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT * FROM %s WHERE name = :name"), "metadata");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__PPAugmentedGazetteer_metadataForName___block_invoke;
  v15[3] = &unk_1E7E1F040;
  v16 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__PPAugmentedGazetteer_metadataForName___block_invoke_2;
  v13[3] = &unk_1E7E1F120;
  v8 = v5;
  v14 = v8;
  v9 = v4;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v7, v15, v13, &__block_literal_global_57);

  v10 = v14;
  v11 = v8;

  return v11;
}

- (void)iterSentencesForText:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__PPAugmentedGazetteer_iterSentencesForText_block___block_invoke;
  v11[3] = &unk_1E7E1B9B0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);

}

- (void)iterTokensForSentence:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PPAugmentedGazetteer_iterTokensForSentence_block___block_invoke;
  v11[3] = &unk_1E7E1B9B0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextPredictor, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

void __52__PPAugmentedGazetteer_iterTokensForSentence_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  NLTaggerSetString();
  objc_msgSend(*(id *)(a1 + 32), "length");
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v4 = v3;
  NLTaggerEnumerateTokens();
  NLTaggerSetString();

}

void __52__PPAugmentedGazetteer_iterTokensForSentence_block___block_invoke_2(uint64_t a1, __int128 *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PPToken *v10;
  __int128 v11;
  uint64_t v12;

  v6 = (void *)MEMORY[0x1C3BD6630]();
  v7 = *(void **)(a1 + 32);
  v11 = *a2;
  v12 = *((_QWORD *)a2 + 2);
  +[PPAugmentedGazetteer textForToken:text:]((uint64_t)PPAugmentedGazetteer, (uint64_t *)&v11, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)NLTaggerCopyTagForCurrentToken();
  v10 = -[PPToken initWithText:tag:]([PPToken alloc], "initWithText:tag:", v8, v9);
  LOBYTE(v11) = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (a3 && (_BYTE)v11)
    *a3 = 1;

  objc_autoreleasePoolPop(v6);
}

+ (id)textForToken:(void *)a3 text:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_opt_self();
  v7 = *a2;
  v6 = a2[1];
  v8 = (void *)MEMORY[0x1C3BD6630](v5);
  objc_msgSend(v4, "substringWithRange:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v8);

  return v9;
}

void __51__PPAugmentedGazetteer_iterSentencesForText_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "length");
  NLTokenizerSetString();
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  NLTokenizerEnumerateTokens();

  NLTokenizerSetString();
}

void __51__PPAugmentedGazetteer_iterSentencesForText_block___block_invoke_2(uint64_t a1, __int128 *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  uint64_t v11;
  char v12;

  v12 = 0;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1C3BD6630]();
    v7 = *(void **)(a1 + 32);
    v10 = *a2;
    v11 = *((_QWORD *)a2 + 2);
    +[PPAugmentedGazetteer textForToken:text:]((uint64_t)PPAugmentedGazetteer, (uint64_t *)&v10, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (a3)
    {
      if (v12)
        *a3 = 1;
    }

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "Nil pointer provided from sentence tokenizer.", (uint8_t *)&v10, 2u);
    }

  }
}

uint64_t __40__PPAugmentedGazetteer_metadataForName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":name", *(_QWORD *)(a1 + 32));
}

uint64_t __40__PPAugmentedGazetteer_metadataForName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PPAugmentedGazetteerMetadata *v4;
  unsigned __int8 *v5;

  v3 = a2;
  v4 = -[PPAugmentedGazetteerMetadata initWithStatement:]([PPAugmentedGazetteerMetadata alloc], "initWithStatement:", v3);

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v5;
}

uint64_t __40__PPAugmentedGazetteer_metadataForName___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  pp_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_1C392E000, v3, OS_LOG_TYPE_ERROR, "PPAugmentedGazetteer: error serializing from the database: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E0D81780];
}

void __78__PPAugmentedGazetteer_iterExtractionsForText_addEntity_addTopic_addLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD *, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = MEMORY[0x1E0C809B0];
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __78__PPAugmentedGazetteer_iterExtractionsForText_addEntity_addTopic_addLocation___block_invoke_2;
  v24 = &unk_1E7E1B8F8;
  v25 = v4;
  v7 = *(void **)(a1 + 32);
  v27 = *(id *)(a1 + 40);
  v28 = *(id *)(a1 + 48);
  v26 = v5;
  v8 = v5;
  v9 = v4;
  objc_msgSend(v7, "iterTokensForSentence:block:", v3, &v21);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "contextForSentence:", v8, v21, v22, v23, v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v14 = *(void **)(a1 + 48);
  v13 = *(void **)(a1 + 56);
  v15 = v9;
  v16 = v10;
  v17 = v11;
  v18 = v13;
  v19 = v14;
  if (v12 && objc_msgSend(v15, "count"))
  {
    v20 = *(void **)(v12 + 8);
    v29[0] = v6;
    v29[1] = 3221225472;
    v29[2] = __78__PPAugmentedGazetteer_addExtractions_context_addEntity_addTopic_addLocation___block_invoke;
    v29[3] = &unk_1E7E1B8D0;
    v30 = v15;
    v31 = v12;
    v32 = v16;
    v33 = v17;
    v34 = v18;
    v35 = v19;
    objc_msgSend(v20, "readTransaction:", v29);

  }
}

void __78__PPAugmentedGazetteer_iterExtractionsForText_addEntity_addTopic_addLocation___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "tag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("EXTRACTION"));

  if (v4)
  {
    v5 = (void *)a1[4];
    objc_msgSend(v20, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v20, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D17158]);

  if (v8)
  {
    v9 = a1[6];
    objc_msgSend(v20, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD, uint64_t))(v9 + 16))(v9, v6, 1, 0, 2);
    goto LABEL_9;
  }
  objc_msgSend(v20, "tag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D17160]);

  if (v11)
  {
    v12 = a1[6];
    objc_msgSend(v20, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD, uint64_t))(v12 + 16))(v12, v13, 5, 0, 2);

    v14 = a1[7];
    objc_msgSend(v20, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v14 + 16))(v14, v6, 3, 2);
    goto LABEL_9;
  }
  objc_msgSend(v20, "tag");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D17150]);

  if (v16)
  {
    v17 = a1[6];
    objc_msgSend(v20, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD, uint64_t))(v17 + 16))(v17, v6, 2, 0, 2);
    goto LABEL_9;
  }
LABEL_10:
  v18 = (void *)a1[5];
  objc_msgSend(v20, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v19);

}

void __78__PPAugmentedGazetteer_addExtractions_context_addEntity_addTopic_addLocation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  id v14;
  uint64_t v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  void *context;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(obj);
        v20 = v2;
        v3 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v2);
        context = (void *)MEMORY[0x1C3BD6630]();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v4 = *(void **)(a1 + 40);
        objc_msgSend(v3, "lowercaseString");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "metadataForName:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v22;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v22 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
              v12 = *(void **)(a1 + 48);
              if (v11)
              {
                objc_msgSend(v12, "probabilityForDomain:", *(unsigned int *)(v11 + 12));
                if (v13 >= *(double *)(v11 + 24))
                {
                  if (*(_QWORD *)(v11 + 32))
                  {
                    if (objc_msgSend(MEMORY[0x1E0D70BC0], "categoryForDescription:"))
                      v14 = 0;
                    else
                      v14 = *(id *)(v11 + 32);
                    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
                    if (*(_QWORD *)(v11 + 40))
                      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

                  }
                  if (*(_QWORD *)(v11 + 16))
                    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
                  if (*(_BYTE *)(v11 + 8))
                  {
                    objc_msgSend(MEMORY[0x1E0D70B78], "categoryForDescription:", *(_QWORD *)(v11 + 32));
                    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
                  }
                }
              }
              else
              {
                objc_msgSend(v12, "probabilityForDomain:", 0);
              }
              ++v10;
            }
            while (v8 != v10);
            v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            v8 = v15;
          }
          while (v15);
        }

        objc_autoreleasePoolPop(context);
        v2 = v20 + 1;
      }
      while (v20 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v18);
  }

}

uint64_t __31__PPAugmentedGazetteer_dealloc__block_invoke(uint64_t a1, _QWORD *a2)
{
  const void *v2;
  _QWORD *v3;

  v2 = (const void *)a2[1];
  v3 = a2;
  CFRelease(v2);

  return NLTokenizerRelease();
}

@end
