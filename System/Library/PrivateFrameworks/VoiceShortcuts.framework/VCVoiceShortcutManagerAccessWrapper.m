@implementation VCVoiceShortcutManagerAccessWrapper

id __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DC7D88];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSection:action:parameter:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return v5;
}

- (void)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShortcutSuggestions:forAppWithBundleIdentifier:accessSpecifier:", v7, v6, v8);

}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5 completionHandler:(id)a6
{
  void (**v10)(id, _BOOL8, id);
  id v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  id v16;

  v10 = (void (**)(id, _BOOL8, id))a6;
  v11 = a5;
  v12 = a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v14 = +[VCGuardedPreferencesManager setInteger:forKey:inDomain:withAccessSpecifier:error:](VCGuardedPreferencesManager, "setInteger:forKey:inDomain:withAccessSpecifier:error:", a3, v12, v11, v13, &v16);

  v15 = v16;
  v10[2](v10, v14, v15);

}

- (VCAccessSpecifier)accessSpecifier
{
  return self->_accessSpecifier;
}

- (VCVoiceShortcutManager)voiceShortcutManager
{
  return self->_voiceShortcutManager;
}

- (VCVoiceShortcutManagerAccessWrapper)initWithVoiceShortcutManager:(id)a3 triggerRegistrar:(id)a4 accessSpecifier:(id)a5 syncCoordinator:(id)a6 syncDataEndpoint:(id)a7 runCoordinator:(id)a8 auditToken:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char *v22;
  uint64_t v23;
  void *v24;
  WFShareSheetWorkflowProvider *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  id v30;
  void *v31;
  char *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  id v40;
  objc_super v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  obj = a6;
  v19 = a6;
  v40 = a7;
  v20 = a7;
  v21 = a8;
  if (v16)
  {
    if (v18)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManagerAccessWrapper.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v21)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManagerAccessWrapper.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("voiceShortcutManager"));

  if (!v18)
    goto LABEL_10;
LABEL_3:
  if (v21)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManagerAccessWrapper.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runCoordinator"));

LABEL_4:
  if ((objc_msgSend(v18, "allowConnection") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManagerAccessWrapper.m"), 105, CFSTR("Cannot build access wrapper exported object when connection is not allowed"));

  }
  v41.receiver = self;
  v41.super_class = (Class)VCVoiceShortcutManagerAccessWrapper;
  v22 = -[VCVoiceShortcutManagerAccessWrapper init](&v41, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v18, "copy");
    v24 = (void *)*((_QWORD *)v22 + 1);
    *((_QWORD *)v22 + 1) = v23;

    objc_storeStrong((id *)v22 + 2, a3);
    objc_storeStrong((id *)v22 + 3, a4);
    objc_storeStrong((id *)v22 + 6, obj);
    objc_storeStrong((id *)v22 + 5, v40);
    objc_storeStrong((id *)v22 + 7, a8);
    v25 = [WFShareSheetWorkflowProvider alloc];
    objc_msgSend(v16, "databaseProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[WFShareSheetWorkflowProvider initWithDatabaseProvider:](v25, "initWithDatabaseProvider:", v26);
    v28 = (void *)*((_QWORD *)v22 + 4);
    *((_QWORD *)v22 + 4) = v27;

    v29 = *(_OWORD *)a9->var0;
    *(_OWORD *)(v22 + 88) = *(_OWORD *)&a9->var0[4];
    *(_OWORD *)(v22 + 72) = v29;
    v30 = objc_alloc_init(MEMORY[0x1E0DC7C60]);
    v31 = (void *)*((_QWORD *)v22 + 8);
    *((_QWORD *)v22 + 8) = v30;

    v32 = v22;
  }

  return (VCVoiceShortcutManagerAccessWrapper *)v22;
}

- (void)fetchAllValueSectionsForStaccatoParameter:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper linkActionWithStaccatoIdentifier:](self, "linkActionWithStaccatoIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parameterForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke;
    aBlock[3] = &unk_1E7AA7278;
    v16 = v9;
    v33 = v16;
    v27 = v13;
    v34 = v27;
    v17 = v6;
    v35 = v17;
    v18 = v7;
    v36 = v18;
    v19 = _Block_copy(aBlock);
    getWFStaccatoLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315650;
        v38 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]";
        v39 = 2112;
        v40 = v17;
        v41 = 2112;
        v42 = v16;
        _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_DEFAULT, "%s Fetching dynamic values for parameter: %@ in action: %@", buf, 0x20u);
      }

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke_255;
      v28[3] = &unk_1E7AA72A0;
      v29 = v15;
      v30 = v18;
      v31 = v19;
      objc_msgSend(v29, "loadPossibleStatesWithCompletionHandler:", v28);

      v22 = v29;
      v23 = v27;
    }
    else
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315650;
        v38 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]";
        v39 = 2112;
        v40 = v17;
        v41 = 2112;
        v42 = v16;
        _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_DEFAULT, "%s Fetching static values for parameter: %@ in action: %@", buf, 0x20u);
      }

      v25 = objc_alloc(MEMORY[0x1E0CBDA10]);
      v23 = v27;
      objc_msgSend(v27, "possibleStates");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id)objc_msgSend(v25, "initWithItems:", v26);

      (*((void (**)(void *, id))v19 + 2))(v19, v22);
      v15 = 0;
    }

  }
  else
  {

    getWFStaccatoLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v38 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]";
      v39 = 2112;
      v40 = v6;
      v41 = 2112;
      v42 = v12;
      _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_ERROR, "%s Invalid parameter provided: %@ - %@.", buf, 0x20u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }

}

id __69__VCVoiceShortcutManagerAccessWrapper_fetchAvailableStaccatoActions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "linkActionWithStaccatoIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D70]), "initWithIdentifier:sectionIdentifier:linkAction:", v3, *(_QWORD *)(a1 + 40), v4);
    getWFStaccatoLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "-[VCVoiceShortcutManagerAccessWrapper fetchAvailableStaccatoActions:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Found link action matching staccato identifier: %@ - %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    getWFStaccatoLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[VCVoiceShortcutManagerAccessWrapper fetchAvailableStaccatoActions:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Link action for %@ not found.", (uint8_t *)&v8, 0x16u);
    }
    v5 = 0;
  }

  return v5;
}

- (id)linkActionWithStaccatoIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0DD9C20];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithActionIdentifier:serializedParameters:", v4, MEMORY[0x1E0C9AA70]);

  objc_msgSend(MEMORY[0x1E0DD9D98], "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createActionsForRequests:", v8);

  objc_msgSend(v6, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

void __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke_2;
  v8[3] = &unk_1E7AA7250;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "if_map:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  getWFStaccatoLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v12 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]_block_invoke";
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Returning: %@ values for parameter %@.", buf, 0x20u);
  }

  (*(void (**)(_QWORD, void *, _QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v4, 0, v7);
}

- (void)fetchAvailableStaccatoActions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void (**v17)(id, void *, _QWORD);
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17 = (void (**)(id, void *, _QWORD))a3;
  WFSystemStaccatoActionIdentifiersBySection();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __69__VCVoiceShortcutManagerAccessWrapper_fetchAvailableStaccatoActions___block_invoke;
        v18[3] = &unk_1E7AA7228;
        v18[4] = self;
        v18[5] = v11;
        objc_msgSend(v12, "if_compactMap:", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

  getWFStaccatoLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 136315394;
    v24 = "-[VCVoiceShortcutManagerAccessWrapper fetchAvailableStaccatoActions:]";
    v25 = 2048;
    v26 = v15;
    _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, "%s Returning %ld available staccato sections.", buf, 0x16u);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  v17[2](v17, v16, 0);

}

- (void)getNumberOfVoiceShortcutsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getNumberOfVoiceShortcutsWithAccessSpecifier:completion:", v5, v4);

}

- (void)getVoiceShortcutWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getVoiceShortcutWithIdentifier:accessSpecifier:completion:", v7, v8, v6);

}

- (void)getVoiceShortcutWithPhrase:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getVoiceShortcutWithPhrase:accessSpecifier:completion:", v7, v8, v6);

}

- (void)getVoiceShortcutsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getVoiceShortcutsWithAccessSpecifier:completion:", v5, v4);

}

- (void)getVoiceShortcutsForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getVoiceShortcutsForAppsWithBundleIdentifiers:accessSpecifier:completion:", v9, v10, v6);

}

- (void)addVoiceShortcut:(id)a3 phrase:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addVoiceShortcut:phrase:accessSpecifier:completion:", v10, v9, v11, v8);

}

- (void)updateVoiceShortcutWithIdentifier:(id)a3 phrase:(id)a4 shortcut:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateVoiceShortcutWithIdentifier:phrase:shortcut:accessSpecifier:completion:", v13, v12, v11, v14, v10);

}

- (void)deleteVoiceShortcutWithIdentifier:(id)a3 name:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteVoiceShortcutWithIdentifier:name:accessSpecifier:completion:", v10, v9, v11, v8);

}

- (void)getShortcutSuggestionsForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getShortcutSuggestionsForAppWithBundleIdentifier:accessSpecifier:completion:", v7, v8, v6);

}

- (void)getShortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getShortcutSuggestionsForAllAppsWithLimit:accessSpecifier:completion:", a3, v7, v6);

}

- (void)describeSyncStateIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowUnrestrictedAccess");

  if ((v6 & 1) != 0)
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v7);

  }
}

- (void)requestDataMigration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestDataMigrationWithCompletion:", v4);

}

- (void)getShareSheetWorkflowsForExtensionMatchingDictionaries:(id)a3 hostBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id);
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowReadAccessToShortcutsLibrary");

  if ((v12 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper shareSheetProvider](self, "shareSheetProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v13, "shareSheetWorkflowsForExtensionMatchingDictionaries:hostBundleIdentifier:error:", v8, v9, &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;

    v10[2](v10, v14, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v16);

  }
}

- (void)getResultsForQuery:(id)a3 resultClassName:(id)a4 completion:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowReadAccessToShortcutsLibrary");

  v13 = v8;
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v13, "workflowType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC8508]))
    {
      -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "allowReadAccessForSleepWorkflows");

      v12 |= v16;
    }

    v17 = v13;
    if ((v12 & 1) == 0)
      goto LABEL_6;
  }
  else
  {

    v17 = 0;
    if ((v12 & 1) == 0)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v18);
      goto LABEL_11;
    }
  }
  getWFGeneralLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315650;
    v23 = "-[VCVoiceShortcutManagerAccessWrapper getResultsForQuery:resultClassName:completion:]";
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v21;
    _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_INFO, "%s Running query: %@ for client: %@", (uint8_t *)&v22, 0x20u);

  }
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "getResultsForQuery:resultClass:completion:", v13, NSClassFromString(v9), v10);
LABEL_11:

}

- (void)getValueForDescriptor:(id)a3 resultClassName:(id)a4 completion:(id)a5
{
  NSString *v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = (NSString *)a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowReadAccessToShortcutsLibrary");

  if ((v11 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getValueForDescriptor:resultClass:completion:", v13, NSClassFromString(v8), v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v12);
  }

}

- (void)generateSingleUseTokenForWorkflowIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowReadAccessToShortcutsLibrary");

  if ((v8 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper shareSheetProvider](self, "shareSheetProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "generateSingleUseTokenForWorkflowIdentifier:", v11);
    v10 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10, 0);

    v6 = (void (**)(id, uint64_t, _QWORD))v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v9);
  }

}

- (void)triggerFullContextualActionReindexWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerFullContextualActionReindexWithCompletion:", v4);

}

- (void)getSiriPodcastsDatabaseURLWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowReadAccessToPodcastsDatabase");

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0CA5870]);
    v8 = *MEMORY[0x1E0DC7F28];
    v15 = 0;
    v9 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, &v15);
    v10 = v15;
    if (v9)
    {
      objc_msgSend(v9, "dataContainerURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("Documents/PodcastsDB.plist"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v12, 1);
      v4[2](v4, v13, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:underlyingError:", 1001, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v12);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (no read access to podcasts database)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v14);

  }
}

- (void)refreshTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowWriteAccessForTriggers");

  if ((v9 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper triggerRegistrar](self, "triggerRegistrar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
      objc_msgSend(v10, "registerTriggerWithIdentifier:completion:", v6, v7);
    else
      objc_msgSend(v10, "registerAllTriggersWithCompletion:", v7);
  }
  else
  {
    getWFTriggersLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[VCVoiceShortcutManagerAccessWrapper refreshTriggerWithIdentifier:completion:]";
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s Denying access to trigger writes for accessSpecifier (%@)", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (no write access to triggers)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
  }

}

- (void)unregisterTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowWriteAccessForTriggers");

  if ((v11 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper triggerRegistrar](self, "triggerRegistrar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unregisterTriggerWithIdentifier:triggerBacking:", v8, a4);

    v9[2](v9, 1, 0);
  }
  else
  {
    getWFTriggersLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315394;
      v17 = "-[VCVoiceShortcutManagerAccessWrapper unregisterTriggerWithIdentifier:triggerBacking:completion:]";
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_ERROR, "%s Denying access to trigger writes for accessSpecifier (%@)", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (no write access to triggers)"));
    v15 = objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v15);

    v9 = (void (**)(id, uint64_t, _QWORD))v15;
  }

}

- (void)getConfiguredTriggerDescriptionsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  char v6;
  id v7;

  v4 = (void (**)(id, _QWORD))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowReadAccessForTriggers");

  if ((v6 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper triggerRegistrar](self, "triggerRegistrar");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getConfiguredTriggerDescriptionsWithCompletion:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (no read access to triggers)"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);
  }

}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowReadAccessForTriggers");

  if ((v11 & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82__VCVoiceShortcutManagerAccessWrapper_fireTriggerWithIdentifier_force_completion___block_invoke;
    v13[3] = &unk_1E7AA6ED8;
    v13[4] = self;
    v14 = v8;
    v16 = a4;
    v15 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (no read access to triggers)"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v12);

  }
}

- (void)checkTriggerStateWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowReadAccessForTriggers");

  if ((v8 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper triggerRegistrar](self, "triggerRegistrar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coreDuetListener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "checkTriggerStateWithIdentifier:completion:", v11, v6);

    v6 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (no read access to triggers)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v9);
  }

}

- (void)checkTriggerStateWithKeyPath:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowReadAccessForTriggers");

  if ((v8 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper triggerRegistrar](self, "triggerRegistrar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coreDuetListener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "checkTriggerStateWithKeyPath:completion:", v11, v6);

    v6 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (no read access to triggers)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);
  }

}

- (void)deleteTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowWriteAccessForTriggers");

  if ((v8 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper triggerRegistrar](self, "triggerRegistrar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteTriggerWithIdentifier:completion:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (no write access to triggers)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);
  }

}

- (void)getVaultItemsAccessForBackgroundRunner:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (void (**)(id, void *))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBackgroundShortcutRunner");

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3910]);
    WFAssetsDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v7, "initWithURL:readonly:", v8, 1);

    objc_msgSend(MEMORY[0x1E0C99E98], "wf_shortcutsDirectoryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("ssh"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v12, 0);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 0, 0, 0);

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v10, 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v17, v15, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v16);

  }
  else
  {
    v17 = (id)objc_opt_new();
    ((void (*)(void (**)(id, void *)))v4[2])(v4);
    v10 = v4;
  }

}

- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, WFOnScreenContentManager *);
  void *v7;
  char v8;
  WFOnScreenContentManager *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, WFOnScreenContentManager *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowReadingOnScreenContent");

  if ((v8 & 1) != 0)
  {
    v9 = objc_alloc_init(WFOnScreenContentManager);
    -[WFOnScreenContentManager getOnScreenContentWithOptions:completion:](v9, "getOnScreenContentWithOptions:completion:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v9 = (WFOnScreenContentManager *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);
  }

}

- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, WFOnScreenContentManager *);
  void *v7;
  char v8;
  WFOnScreenContentManager *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, WFOnScreenContentManager *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowReadingOnScreenContent");

  if ((v8 & 1) != 0)
  {
    v9 = objc_alloc_init(WFOnScreenContentManager);
    -[WFOnScreenContentManager getOnScreenContentWithOptions:completionHandler:](v9, "getOnScreenContentWithOptions:completionHandler:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v9 = (WFOnScreenContentManager *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);
  }

}

- (void)obliterateShortcuts:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  VCShortcutsObliterator *v12;
  void *v13;
  VCShortcutsObliterator *v14;
  id v15;
  id v16;
  id v17;

  v4 = (void (**)(id, id))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRemovalService");

  if ((v6 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper syncDataEndpoint](self, "syncDataEndpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncDataHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_opt_new();
    v11 = v10;

    v12 = [VCShortcutsObliterator alloc];
    -[VCVoiceShortcutManagerAccessWrapper triggerRegistrar](self, "triggerRegistrar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[VCShortcutsObliterator initWithTriggerRegistrar:syncDataHandlers:](v12, "initWithTriggerRegistrar:syncDataHandlers:", v13, v11);

    v17 = 0;
    -[VCShortcutsObliterator obliterate:](v14, "obliterate:", &v17);
    v15 = v17;
    v4[2](v4, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (must be called from ShortcutsRemovalService)"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v16);

  }
}

- (void)createShortcutWithRecordData:(id)a3 name:(id)a4 shortcutSource:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:", v13, v12, v11, v14, v10);

}

- (void)sendAceCommandDictionary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowIntentsExtensionDiscovery");

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DD9E18], "sharedCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hasPairedDevice") & 1) != 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __75__VCVoiceShortcutManagerAccessWrapper_sendAceCommandDictionary_completion___block_invoke;
      v12[3] = &unk_1E7AA6F00;
      v14 = v7;
      v13 = v10;
      objc_msgSend(v13, "sendAceCommandDictionary:completion:", v6, v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 9001, CFSTR("No paired device"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);
  }

}

- (void)drawGlyphs:(id)a3 withBackgroundColorValues:(id)a4 padding:(double)a5 intoContext:(id)a6 completion:(id)a7
{
  -[VCVoiceShortcutManagerAccessWrapper drawGlyphs:withBackgroundColorValues:padding:rounded:intoContext:completion:](self, "drawGlyphs:withBackgroundColorValues:padding:rounded:intoContext:completion:", a3, a4, 1, a6, a7, a5);
}

- (void)drawGlyphs:(id)a3 withBackgroundColorValues:(id)a4 padding:(double)a5 rounded:(BOOL)a6 intoContext:(id)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  void (**v18)(void);

  v9 = a6;
  v18 = (void (**)(void))a8;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "drawGlyphs:withBackgroundColorValues:padding:rounded:intoContext:", v16, v15, v9, v14, a5);

  v18[2]();
}

- (void)getFirstUnsortedWorkflowWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *, _QWORD);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, _QWORD))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowReadAccessToShortcutsLibrary");

  if ((v6 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 0);
      objc_msgSend(v9, "setResultsLimit:", 1);
      objc_msgSend(v8, "sortedWorkflowsWithQuery:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "descriptors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC7E30]);
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v12, "color");
        v17 = objc_msgSend(v12, "glyphCharacter");
        objc_msgSend(v12, "associatedAppBundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v13, "initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:", v14, v15, v16, v17, v18);

        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "icon");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "backgroundColorValue"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v4[2](v4, v19, v22, 0);
      }
      else
      {
        getWFWidgetLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136315138;
          v25 = "-[VCVoiceShortcutManagerAccessWrapper getFirstUnsortedWorkflowWithCompletion:]";
          _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_DEFAULT, "%s Unable to get first unsorted workflow, nothing was returned by the query", (uint8_t *)&v24, 0xCu);
        }

        v4[2](v4, 0, 0, 0);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1004, CFSTR("Unable to load database"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *, void *))v4)[2](v4, 0, 0, v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *, void *))v4)[2](v4, 0, 0, v8);
  }

}

- (void)getStingWorkflowsWithCompletion:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *, _QWORD);

  v11 = (void (**)(id, void *, _QWORD))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowReadAccessToShortcutsLibrary");

  if ((v5 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "database");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "sortedVisibleWorkflowsWithType:", *MEMORY[0x1E0DC8510]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "descriptors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "if_map:", &__block_literal_global_4997);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v10, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1004, CFSTR("Unable to load database"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v11)[2](v11, 0, v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v11)[2](v11, 0, v7);
  }

}

- (void)getStingWorkflowWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowReadAccessToShortcutsLibrary");

  if ((v8 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "referenceForWorkflowID:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x1E0DC7DA0]);
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v11, "color");
        v16 = objc_msgSend(v11, "glyphCharacter");
        objc_msgSend(v11, "associatedAppBundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v12, "initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:", v13, v14, v15, v16, v17);

        v6[2](v6, v18, 0);
      }
      else
      {
        v6[2](v6, 0, 0);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1004, CFSTR("Unable to load database"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v10);
  }

}

- (void)showSingleStepCompletionForWebClip:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSpringBoard");

  if ((v9 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper runCoordinator](self, "runCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__VCVoiceShortcutManagerAccessWrapper_showSingleStepCompletionForWebClip_completion___block_invoke;
    v13[3] = &unk_1E7AA78B8;
    v14 = v7;
    objc_msgSend(v10, "showSingleStepCompletionWithWebClipMetadata:completion:", v6, v13);

    -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logHomescreenFastPathRunEventForShortcutWithWebClip:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied (must be SpringBoard)"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);

  }
}

- (void)computeFinderResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id);
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowBackgroundShortcutRunning");

  if ((v12 & 1) != 0)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0DC7C18], "computeFinderResizedSizesForImages:inSizes:error:", v8, v9, &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v10[2](v10, v13, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v15);

  }
}

- (void)getSuggestedShortcutsWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowBackgroundShortcutRunning");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E58]), "initWithLocation:", 0);
    objc_msgSend(v9, "setResultsLimit:", a3);
    -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedWorkflowsWithQuery:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "descriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0DC7E30];
      objc_msgSend(v11, "descriptors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __81__VCVoiceShortcutManagerAccessWrapper_getSuggestedShortcutsWithLimit_completion___block_invoke;
      v17[3] = &unk_1E7AA6FA8;
      v18 = v6;
      objc_msgSend(v13, "getObjectsFromReferences:databaseProvider:completion:", v14, v15, v17);

    }
    else
    {
      objc_msgSend(v11, "fetchError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v16);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);
  }

}

- (void)getRecentsCallWithTelephony:(BOOL)a3 limit:(int64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[3];

  v6 = a3;
  v48[2] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD, void *))a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "allowBackgroundShortcutRunning");

  if ((v10 & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = CFSTR("Access was denied");
LABEL_12:
    objc_msgSend(v40, "vc_voiceShortcutErrorWithCode:reason:", 1011, v41);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v13);
    goto LABEL_15;
  }
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) != 3)
  {
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = CFSTR("Contact Access was denied");
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *MEMORY[0x1E0D0CEC0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *MEMORY[0x1E0D0CEB8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *MEMORY[0x1E0D0CEC8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("callType IN %@"), v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "recentCallsWithPredicate:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (v18 >= a4)
    v19 = a4;
  else
    v19 = v18;
  objc_msgSend(v17, "subarrayWithRange:", 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "if_flatMap:", &__block_literal_global_178_4975);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0C97210]);
  objc_msgSend(MEMORY[0x1E0CBDA58], "expectedCNContactKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0C96708];
  v47[0] = *MEMORY[0x1E0C96700];
  v47[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "arrayByAddingObjectsFromArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v22, "initWithKeysToFetch:", v26);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingHandleStrings:", v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPredicate:", v28);

  v29 = (void *)objc_opt_new();
  v46 = 0;
  objc_msgSend(v29, "executeFetchRequest:error:", v27, &v46);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v46;
  objc_msgSend(v30, "value");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v30, "value");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_3;
    v44[3] = &unk_1E7AA7078;
    v45 = v33;
    v42 = v33;
    objc_msgSend(v20, "if_compactMap:", v44);
    v34 = v31;
    v35 = v20;
    v36 = v13;
    v37 = v21;
    v38 = v16;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v8)[2](v8, v39, 0);

    v16 = v38;
    v21 = v37;
    v13 = v36;
    v20 = v35;
    v31 = v34;

  }
  else
  {
    v8[2](v8, 0, v31);
  }

LABEL_15:
}

- (void)getFavoriteContactsWithLimit:(int64_t)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void (**v52)(id, _QWORD, void *);
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id obj;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id v65;
  void *v66;
  uint64_t v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowBackgroundShortcutRunning");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v48);

    goto LABEL_28;
  }
  v52 = v5;
  objc_msgSend(MEMORY[0x1E0C972F8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v51 = v8;
  objc_msgSend(v8, "entries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (!v63)
    goto LABEL_24;
  v62 = *(_QWORD *)v70;
  v61 = (void *)*MEMORY[0x1E0D14188];
  v60 = *MEMORY[0x1E0C965E8];
  v59 = *MEMORY[0x1E0C965C0];
  v55 = *MEMORY[0x1E0C965F8];
  v54 = *MEMORY[0x1E0C96658];
  v53 = (void *)*MEMORY[0x1E0D14190];
  v57 = (void *)*MEMORY[0x1E0D14180];
  v58 = v9;
  while (2)
  {
    for (i = 0; i != v63; ++i)
    {
      if (*(_QWORD *)v70 != v62)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
      v12 = (void *)MEMORY[0x1C3BAFA00]();
      if (objc_msgSend(v9, "count") == a3)
      {
        objc_autoreleasePoolPop(v12);
        goto LABEL_24;
      }
      v13 = v61;
      objc_msgSend(v11, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v60);

      if ((v15 & 1) != 0)
      {
        v68 = v12;
        v16 = v57;
        v17 = CFSTR("Audio");
        v18 = 1;
LABEL_17:
        v67 = v18;
        v65 = v16;

        v25 = (void *)MEMORY[0x1E0D13E30];
        objc_msgSend(v11, "contactProperty");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "contact");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "contactWithCNContact:", v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13E78]), "initWithContact:", v22);
        v28 = objc_alloc(MEMORY[0x1E0DD9DE8]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithIdentity:parameterState:", v29, v66);

        v31 = objc_alloc(MEMORY[0x1E0DD9CF0]);
        v73 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v31, "initWithValue:", v32);

        v34 = objc_alloc(MEMORY[0x1E0D13E60]);
        objc_msgSend(v11, "bundleIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(v34, "initWithBundleIdentifier:type:", v35, v65);
        objc_msgSend(v33, "setCommunicationMethod:", v36);

        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9E98]), "initWithValue:", v17);
        v38 = objc_alloc(MEMORY[0x1E0CBDA58]);
        objc_msgSend(v11, "contactProperty");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "contact");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v38, "initWithContact:handle:", v40, v41);

        v43 = objc_alloc(MEMORY[0x1E0DC7A88]);
        objc_msgSend(v11, "value");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "serializedRepresentation");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "serializedRepresentation");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v43, "initWithHandle:callType:person:callTypeSerializedRepresentation:personSerializedRepresentation:", v44, v67, v42, v45, v46);

        v9 = v58;
        objc_msgSend(v58, "addObject:", v47);

        v13 = v65;
        v12 = v68;
        goto LABEL_18;
      }
      objc_msgSend(v11, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqualToString:", v59) & 1) != 0)
      {
        objc_msgSend(v11, "actionType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v55);

        if ((v21 & 1) != 0)
        {
          v68 = v12;
          v16 = v57;
          v17 = CFSTR("Audio");
          v18 = 3;
          goto LABEL_17;
        }
      }
      else
      {

      }
      objc_msgSend(v11, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToString:", v59))
      {
        objc_msgSend(v11, "actionType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v54);

        if (!v24)
          goto LABEL_19;
        v68 = v12;
        v16 = v53;
        v17 = CFSTR("Video");
        v18 = 2;
        goto LABEL_17;
      }
LABEL_18:

LABEL_19:
      objc_autoreleasePoolPop(v12);
    }
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v63)
      continue;
    break;
  }
LABEL_24:

  if (v9)
    v49 = v9;
  else
    v49 = (void *)MEMORY[0x1E0C9AA60];
  v50 = v9;
  v5 = v52;
  ((void (**)(id, void *, void *))v52)[2](v52, v49, 0);

LABEL_28:
}

- (void)getUpcomingMediaForBundleIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  void (**v28)(id, _QWORD, void *);
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowBackgroundShortcutRunning");

  if ((v11 & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = CFSTR("Access was denied");
    v25 = 1011;
LABEL_10:
    objc_msgSend(v23, "vc_voiceShortcutErrorWithCode:reason:", v25, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v14);
    goto LABEL_11;
  }
  if (!getMRMediaSuggestionRequestClass())
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = CFSTR("Cannot fetch upcoming media query");
    v25 = 0;
    goto LABEL_10;
  }
  v12 = objc_alloc((Class)getMRMediaSuggestionRequestClass());
  v13 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke;
  v31[3] = &__block_descriptor_40_e72_v16__0__MRMediaSuggestionRequest_MRMediaSuggestionRequestConfigurable__8l;
  v31[4] = a4;
  v14 = (void *)objc_msgSend(v12, "initWithBlock:", v31);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v15 = (void *)getMRMediaSuggestionRequestOptionsClass_softClass;
  v40 = getMRMediaSuggestionRequestOptionsClass_softClass;
  if (!getMRMediaSuggestionRequestOptionsClass_softClass)
  {
    v32 = v13;
    v33 = 3221225472;
    v34 = __getMRMediaSuggestionRequestOptionsClass_block_invoke;
    v35 = &unk_1E7AA8030;
    v36 = &v37;
    __getMRMediaSuggestionRequestOptionsClass_block_invoke((uint64_t)&v32);
    v15 = (void *)v38[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v37, 8);
  v17 = [v16 alloc];
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_2;
  v29[3] = &unk_1E7AA70C0;
  v18 = v8;
  v30 = v18;
  v19 = (void *)objc_msgSend(v17, "initWithBlock:", v29);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v20 = (void *)getMRMediaSuggestionPreferencesClass_softClass;
  v40 = getMRMediaSuggestionPreferencesClass_softClass;
  if (!getMRMediaSuggestionPreferencesClass_softClass)
  {
    v32 = v13;
    v33 = 3221225472;
    v34 = __getMRMediaSuggestionPreferencesClass_block_invoke;
    v35 = &unk_1E7AA8030;
    v36 = &v37;
    __getMRMediaSuggestionPreferencesClass_block_invoke((uint64_t)&v32);
    v20 = (void *)v38[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v37, 8);
  v22 = (void *)objc_opt_new();
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_3;
  v26[3] = &unk_1E7AA6F00;
  v28 = v9;
  v27 = v18;
  objc_msgSend(v14, "performWithPreferences:options:completion:", v22, v19, v26);

LABEL_11:
}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 expandingParameterName:(id)a5 limit:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "allowBackgroundShortcutRunning");

  if ((v16 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:limit:completion:", v18, v12, v13, a6, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v14 + 2))(v14, 0, 0, v17);
  }

}

- (void)resolveFilePath:(id)a3 workflowID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  char v18;
  void *v19;
  id *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  char v36;
  id v37;
  id v38;
  char v39;
  id obj;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__4926;
  v45 = __Block_byref_object_dispose__4927;
  v46 = 0;
  objc_msgSend(v7, "stringByStandardizingPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DD9D00], "defaultDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)(v42 + 5);
  obj = (id)v42[5];
  objc_msgSend(v11, "bookmarkDataForWorkflowID:path:error:", v8, v10, &obj);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v12, obj);
  if (v13)
  {
    v39 = 0;
    v14 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v13, "bookmarkData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id *)(v42 + 5);
    v38 = (id)v42[5];
    objc_msgSend(v14, "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v15, 0, 0, &v39, &v38);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v16, v38);

    if (v17)
    {
      v18 = objc_msgSend(v17, "startAccessingSecurityScopedResource");
      v19 = (void *)objc_opt_new();
      v20 = (id *)(v42 + 5);
      v37 = (id)v42[5];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __77__VCVoiceShortcutManagerAccessWrapper_resolveFilePath_workflowID_completion___block_invoke;
      v32[3] = &unk_1E7AA7110;
      v33 = v17;
      v35 = &v41;
      v36 = v18;
      v34 = v9;
      objc_msgSend(v19, "coordinateReadingItemAtURL:options:error:byAccessor:", v33, 0, &v37, v32);
      objc_storeStrong(v20, v37);

    }
    else
    {
      getWFFilesLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)v42[5];
        *(_DWORD *)buf = 136315650;
        v48 = "-[VCVoiceShortcutManagerAccessWrapper resolveFilePath:workflowID:completion:]";
        v49 = 2112;
        v50 = v13;
        v51 = 2112;
        v52 = v24;
        _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_ERROR, "%s Failed to create bookmark from %@ with error %@", buf, 0x20u);
      }

      v25 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend((id)v42[5], "localizedFailureReason");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "vc_voiceShortcutErrorWithCode:reason:", 10003, CFSTR("%@"), v26);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v42[5];
      v42[5] = v27;

      (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, 0, v42[5]);
    }

  }
  else
  {
    if (v42[5])
    {
      getWFFilesLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = v42[5];
        *(_DWORD *)buf = 136315906;
        v48 = "-[VCVoiceShortcutManagerAccessWrapper resolveFilePath:workflowID:completion:]";
        v49 = 2112;
        v50 = v10;
        v51 = 2112;
        v52 = v8;
        v53 = 2112;
        v54 = v22;
        _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_ERROR, "%s Failed to look up bookmark for path %@ workflowID %@, with error %@", buf, 0x2Au);
      }
    }
    else
    {
      getWFFilesLogObject();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v48 = "-[VCVoiceShortcutManagerAccessWrapper resolveFilePath:workflowID:completion:]";
        v49 = 2112;
        v50 = v10;
        v51 = 2112;
        v52 = v8;
        _os_log_impl(&dword_1C146A000, v29, OS_LOG_TYPE_ERROR, "%s No bookmark found for path %@ workflowID %@", buf, 0x20u);
      }

      WFLocalizedString(CFSTR("No bookmark found for file."));
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 10001, CFSTR("%@"), v21);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v42[5];
      v42[5] = v30;

    }
    (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, 0, v42[5]);
  }

  _Block_object_dispose(&v41, 8);
}

- (void)resolveBookmarkData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD *v21;
  char v22;
  id v23;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[3];
  _BYTE v32[8];

  v5 = a3;
  v6 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32[0] = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__4926;
  v29 = __Block_byref_object_dispose__4927;
  v30 = 0;
  obj = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v5, 0, 0, v32, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v30, obj);
  if (!v7)
  {
    objc_msgSend((id)v26[5], "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB28A8];
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v13 = objc_msgSend((id)v26[5], "code");

      if (v13 != 259)
      {
LABEL_7:
        (*((void (**)(id, _QWORD, _QWORD, uint64_t))v6 + 2))(v6, 0, 0, v26[5]);
        goto LABEL_8;
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend((id)v26[5], "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v12, 4, v11);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v26[5];
      v26[5] = v15;

    }
    goto LABEL_7;
  }
  v8 = objc_msgSend(v7, "startAccessingSecurityScopedResource");
  v9 = (void *)objc_opt_new();
  v10 = (id *)(v26 + 5);
  v23 = (id)v26[5];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__VCVoiceShortcutManagerAccessWrapper_resolveBookmarkData_completion___block_invoke;
  v17[3] = &unk_1E7AA7138;
  v20 = &v25;
  v18 = v7;
  v21 = v31;
  v22 = v8;
  v19 = v6;
  objc_msgSend(v9, "coordinateReadingItemAtURL:options:error:byAccessor:", v18, 0, &v23, v17);
  objc_storeStrong(v10, v23);

LABEL_8:
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
}

- (void)resolveCrossDeviceItemID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  getWFFilesLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[VCVoiceShortcutManagerAccessWrapper resolveCrossDeviceItemID:completion:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEBUG, "%s Resolving itemID: %@", buf, 0x16u);
  }

  if (v5)
  {
    v8 = v6;
    FPItemURLForCrossDeviceItemID();

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

- (void)createBookmarkWithURL:(id)a3 workflowID:(id)a4 completion:(id)a5
{
  id v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id *v15;
  id v16;
  id v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  _QWORD v19[4];
  id v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  id v22;
  _BYTE *v23;
  char v24;
  id obj;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v9 = a5;
  getWFFilesLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    v27 = v8;
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Attempting to create local bookmark with URL: %@ workflowID: %@", buf, 0x20u);
  }

  objc_msgSend(v7, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "startAccessingSecurityScopedResource");

  v13 = (void *)objc_opt_new();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__4926;
  v28 = __Block_byref_object_dispose__4927;
  v29 = 0;
  objc_msgSend(v7, "url");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id *)(*(_QWORD *)&buf[8] + 40);
  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __83__VCVoiceShortcutManagerAccessWrapper_createBookmarkWithURL_workflowID_completion___block_invoke;
  v19[3] = &unk_1E7AA7188;
  v16 = v7;
  v20 = v16;
  v17 = v9;
  v22 = v17;
  v23 = buf;
  v24 = v12;
  v18 = v8;
  v21 = v18;
  objc_msgSend(v13, "coordinateReadingItemAtURL:options:error:byAccessor:", v14, 0, &obj, v19);
  objc_storeStrong(v15, obj);

  _Block_object_dispose(buf, 8);
}

- (void)createBookmarkWithBookmarkableString:(id)a3 path:(id)a4 workflowID:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a4;
  v9 = a5;
  v14 = v8;
  v15 = a6;
  v13 = v9;
  v10 = v8;
  v11 = v9;
  v12 = v15;
  FPDocumentURLFromBookmarkableString();

}

- (void)fetchURLForFPItem:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CAAC80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchURLForItem:completionHandler:", v7, v6);

}

- (void)setPerWorkflowStateData:(id)a3 forSmartPromptWithActionUUID:(id)a4 reference:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "allowUnrestrictedAccess");

  if ((v14 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPerWorkflowStateData:forSmartPromptWithActionUUID:reference:", v17, v10, v11);

    v12[2](v12, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v16 = objc_claimAutoreleasedReturnValue();
    v12[2](v12, v16);

    v12 = (void (**)(id, _QWORD))v16;
  }

}

- (void)userHasAutomationsWithCompletion:(id)a3
{
  void (**v4)(id, _BOOL8, _QWORD);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _BOOL8, _QWORD))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowResettingAutomationConfirmationLevel");

  if ((v6 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "databaseProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v8, "databaseWithError:", &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;

    if (v9)
    {
      objc_msgSend(v9, "allConfiguredTriggers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count") != 0;

      v4[2](v4, v12, 0);
    }
    else
    {
      getWFTriggerNotificationsLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[VCVoiceShortcutManagerAccessWrapper userHasAutomationsWithCompletion:]";
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Couldn't access database when checking if user has automations with error: %@!", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1004, CFSTR("Unable to load database"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, _BOOL8, void *))v4)[2](v4, 0, v15);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, _BOOL8, void *))v4)[2](v4, 0, v13);

  }
}

- (void)resetAutomationConfirmationStatusWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowResettingAutomationConfirmationLevel");

  if ((v6 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "databaseProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v8, "databaseWithError:", &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;

    if (v9)
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(v9, "allConfiguredTriggers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "descriptors");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9EC0]), "initWithDatabase:", v9);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __87__VCVoiceShortcutManagerAccessWrapper_resetAutomationConfirmationStatusWithCompletion___block_invoke;
      v20[3] = &unk_1E7AA71D8;
      v21 = v14;
      v22 = v11;
      v15 = v11;
      v16 = v14;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v20);
      objc_msgSend(v15, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v17);

    }
    else
    {
      getWFTriggerNotificationsLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[VCVoiceShortcutManagerAccessWrapper resetAutomationConfirmationStatusWithCompletion:]";
        v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_ERROR, "%s Couldn't access database when resetting automation confirmation status with error: %@!", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1004, CFSTR("Unable to load database"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v13);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v18);

  }
}

- (void)getSiriAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4
{
  -[VCVoiceShortcutManager getSiriAutoShortcutsEnablementForBundleIdentifier:completion:](self->_voiceShortcutManager, "getSiriAutoShortcutsEnablementForBundleIdentifier:completion:", a3, a4);
}

- (void)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  -[VCVoiceShortcutManager setSiriAutoShortcutsEnablement:forBundleIdentifier:completion:](self->_voiceShortcutManager, "setSiriAutoShortcutsEnablement:forBundleIdentifier:completion:", a3, a4, a5);
}

- (void)updateAppShortcutsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAppShortcutsWithCompletion:", v4);

}

- (void)serializedParametersForAppEntityIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serializedParametersForAppEntityIdentifier:completion:", v7, v6);

}

- (void)storeSerializedParameters:(id)a3 forAppEntityIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "storeSerializedParameters:forAppEntityIdentifier:queryName:badgeType:completion:", v15, v14, v13, a6, v12);

}

- (void)removeAllSerializedParametersForQueryName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllSerializedParametersForQueryName:completion:", v7, v6);

}

- (void)archiveAction:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "archiveAction:withActionMetadata:completion:", v10, v9, v8);

}

- (void)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unarchiveActionFromData:withActionMetadata:completion:", v10, v9, v8);

}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameterStates:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getLinkActionWithAppBundleIdentifier:appIntentIdentifier:serializedParameterStates:completion:", v13, v12, v11, v10);

}

- (void)getMigratedAppIntentWithINIntent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getMigratedAppIntentWithINIntent:completion:", v7, v6);

}

- (void)getSerializedParametersForLinkAction:(id)a3 actionMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getSerializedParametersForLinkAction:actionMetadata:completion:", v10, v9, v8);

}

- (void)requestSandboxExtensionForAccessResources:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id, _QWORD);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14[32];

  v6 = a3;
  v7 = (void (**)(id, void *, id, _QWORD))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBackgroundShortcutRunner");

  if ((v9 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper sandboxExtensionManager](self, "sandboxExtensionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCVoiceShortcutManagerAccessWrapper auditToken](self, "auditToken");
    v13 = 0;
    objc_msgSend(v10, "requestSandboxExtensionForResources:destinationProcessAuditToken:unauthorizedResources:", v6, v14, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;

    v7[2](v7, v11, v12, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, id, void *))v7)[2](v7, 0, 0, v11);
  }

}

- (void)requestSandboxExtensionForToolKitIndexingWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *, _QWORD);
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _BYTE v18[32];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, _QWORD))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBackgroundShortcutRunner");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC7C60], "allAvailableExtensionResourceClassNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCVoiceShortcutManagerAccessWrapper sandboxExtensionManager](self, "sandboxExtensionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCVoiceShortcutManagerAccessWrapper auditToken](self, "auditToken");
    v17 = 0;
    objc_msgSend(v8, "requestSandboxExtensionForResources:destinationProcessAuditToken:unauthorizedResources:", v7, v18, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;

    if (objc_msgSend(v10, "count"))
    {
      getWFSecurityLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[VCVoiceShortcutManagerAccessWrapper requestSandboxExtensionForToolKitIndexingWithCompletion:]";
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed to extend sandbox for access resources: %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CPSharedResourcesDirectory(), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", CFSTR("Shortcuts"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:", v14);
    v4[2](v4, v9, v15, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, void *, void *, _QWORD), _QWORD, _QWORD))v4[2])(v4, 0, 0);

  }
}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isBackgroundShortcutRunner");

  if (v10)
  {
    -[VCVoiceShortcutManagerAccessWrapper runCoordinator](self, "runCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationWithRequest:presentationMode:runningContext:", v12, a4, v8);

  }
}

- (void)postNotificationAboutFailure:(id)a3 inWorkflow:(id)a4 dialogAttribution:(id)a5 runningContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isBackgroundShortcutRunner");

  if (v14)
  {
    -[VCVoiceShortcutManagerAccessWrapper runCoordinator](self, "runCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationAboutFailure:inWorkflow:dialogAttribution:runningContext:", v16, v10, v11, v12);

  }
}

- (void)toastSessionKitSessionWithIdentifier:(id)a3 forDuration:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isBackgroundShortcutRunner");

  if ((v11 & 1) != 0)
  {
    -[VCVoiceShortcutManagerAccessWrapper runCoordinator](self, "runCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "toastSessionKitSessionWithIdentifier:forDuration:completion:", v13, v8, v9);

  }
  else
  {
    v9[2](v9, 0);
  }

}

- (void)dismissToastedSessionKitSessionsWithReason:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManagerAccessWrapper.m"), 1124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[VCVoiceShortcutManagerAccessWrapper runCoordinator](self, "runCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissToastedSessionKitSessionsWithReason:completion:", v10, v7);

}

- (id)database
{
  void *v2;
  void *v3;

  -[VCVoiceShortcutManagerAccessWrapper voiceShortcutManager](self, "voiceShortcutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)getReferenceForWorkflowID:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isBackgroundShortcutRunner");

    if ((v9 & 1) == 0)
    {
      v6[2](v6, 0);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "referenceForWorkflowID:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, void *))v6)[2](v6, v11);
LABEL_6:

}

- (void)getUniqueVisibleReferenceForWorkflowName:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isBackgroundShortcutRunner");

    if ((v9 & 1) == 0)
    {
      v6[2](v6, 0);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueVisibleReferenceForWorkflowName:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, void *))v6)[2](v6, v11);
LABEL_6:

}

- (void)getWorkflowRecordDataForDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isBackgroundShortcutRunner");

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v17);

      goto LABEL_9;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v11, "recordWithDescriptor:error:", v6, &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;

  if (v12)
  {
    objc_msgSend(v12, "fileRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v13;
    objc_msgSend(v14, "fileDataWithError:", &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;

    v13 = v16;
  }
  else
  {
    v15 = 0;
  }
  ((void (**)(id, void *, void *))v7)[2](v7, v15, v13);

LABEL_9:
}

- (void)getSortedVisibleWorkflowsByNameWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, _QWORD, void *);

  v12 = (void (**)(id, _QWORD, void *))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBackgroundShortcutRunner");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v8);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedVisibleWorkflowsByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "descriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v8, "fetchError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v12)[2](v12, v10, v11);

LABEL_6:
}

- (void)getSortedVisibleWorkflowsInCollection:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isBackgroundShortcutRunner");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v11);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedVisibleWorkflowsInCollection:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "descriptors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v11, "fetchError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v6)[2](v6, v13, v14);

LABEL_6:
}

- (void)getSortedWorkflowsWithQuery:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isBackgroundShortcutRunner");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v11);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedWorkflowsWithQuery:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "descriptors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v11, "fetchError");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v6)[2](v6, v13, v14);

LABEL_6:
}

- (void)getSortedVisibleFoldersWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, _QWORD, void *);

  v11 = (void (**)(id, _QWORD, void *))a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBackgroundShortcutRunner");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, v8);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedVisibleFolders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "descriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v11)[2](v11, v9, v10);

LABEL_6:
}

- (void)getCollectionWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isBackgroundShortcutRunner");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v11);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionWithIdentifier:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, void *, void *))v6)[2](v6, v11, 0);
LABEL_6:

}

- (void)getFolderForWorkflowReference:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isBackgroundShortcutRunner");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v11);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "folderForWorkflowReference:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, void *, void *))v6)[2](v6, v11, 0);
LABEL_6:

}

- (void)getConfiguredTriggersForWorkflowID:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isBackgroundShortcutRunner");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v11);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuredTriggersForWorkflowID:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "descriptors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v6)[2](v6, v12, v13);

LABEL_6:
}

- (void)createWorkflowWithWorkflowData:(id)a3 name:(id)a4 nameCollisionBehavior:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isBackgroundShortcutRunner");

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v25);

      goto LABEL_12;
    }
  }
  v28 = 0;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9F08]), "initWithFileData:name:error:", v10, 0, &v28);
  v17 = v28;
  v18 = v17;
  if (v16)
  {
    v27 = v17;
    objc_msgSend(v16, "recordRepresentationWithError:", &v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v27;

    objc_msgSend(v19, "setName:", v11);
    if (v19)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9F00]), "initWithRecord:", v19);
      -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v20;
      objc_msgSend(v22, "createWorkflowWithOptions:nameCollisionBehavior:error:", v21, a5, &v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v26;

      ((void (**)(id, void *, void *))v12)[2](v12, v23, v24);
      v20 = v24;
    }
    else
    {
      v12[2](v12, 0, v20);
    }

    v18 = v20;
  }
  else
  {
    v12[2](v12, 0, v17);
  }

LABEL_12:
}

- (void)getIsReference:(id)a3 allowedToRunOnDomain:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isBackgroundShortcutRunner");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v15);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isReference:allowedToRunOnDomain:", v16, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v9)[2](v9, v15, 0);
LABEL_6:

}

- (void)setTrustedToRunScripts:(BOOL)a3 forReference:(id)a4 onDomain:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a3;
  v17 = a4;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isBackgroundShortcutRunner");

    if ((v14 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v16);

      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTrustedToRunScripts:forReference:onDomain:", v8, v17, v10);

  v11[2](v11, 0);
LABEL_6:

}

- (void)approvalResultForContentAttributionSet:(id)a3 contentDestination:(id)a4 actionUUID:(id)a5 actionIdentifier:(id)a6 actionIndex:(unint64_t)a7 reference:(id)a8 allowedOnceStates:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(id, _QWORD, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  id v33;

  v33 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = (void (**)(id, _QWORD, void *))a10;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v32 = v20;
    v23 = v19;
    v24 = v18;
    v25 = v17;
    v26 = v16;
    v27 = a7;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isBackgroundShortcutRunner");

    a7 = v27;
    v16 = v26;
    v17 = v25;
    v18 = v24;
    v19 = v23;
    v20 = v32;

    if ((v29 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v31);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "approvalResultForContentAttributionSet:contentDestination:actionUUID:actionIdentifier:actionIndex:reference:allowedOnceStates:", v33, v16, v17, v18, a7, v19, v20);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, void *, void *))v21)[2](v21, v31, 0);
LABEL_6:

}

- (void)currentDeletionAuthorizationStatusWithContentItemClassName:(id)a3 actionUUID:(id)a4 actionIdentifier:(id)a5 actionIndex:(unint64_t)a6 count:(unint64_t)a7 reference:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = (void (**)(id, _QWORD, void *))a9;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isBackgroundShortcutRunner");

    if ((v21 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2](v18, 0, v23);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIdentifier:actionIndex:count:reference:", v24, v15, v16, a6, a7, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, void *, void *))v18)[2](v18, v23, 0);
LABEL_6:

}

- (void)saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 reference:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isBackgroundShortcutRunner");

    if ((v16 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v20);

      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v18 = objc_msgSend(v17, "saveSmartPromptStateData:actionUUID:reference:error:", v10, v11, v12, &v21);
  v19 = v21;

  v13[2](v13, v18, v19);
LABEL_6:

}

- (void)saveOutputActionSmartPromtDataForWorkflowReference:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isBackgroundShortcutRunner");

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v13);

      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v11, "saveOutputActionSmartPromtDataForWorkflowReference:error:", v6, &v14);
  v12 = v14;

  v7[2](v7, v12);
LABEL_6:

}

- (void)updateAppDescriptor:(id)a3 atKey:(id)a4 actionUUID:(id)a5 actionIndex:(id)a6 actionIdentifier:(id)a7 workflowID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;

  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "allowReadAccessToShortcutsLibrary"))
  {

LABEL_4:
    -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateAppDescriptor:atKey:actionUUID:actionIndex:actionIdentifier:workflowID:", v23, v14, v15, v16, v17, v18);

    goto LABEL_5;
  }
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isBackgroundShortcutRunner");

  if (v21)
    goto LABEL_4;
LABEL_5:

}

- (void)quarantineWorkflowWithReference:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBackgroundShortcutRunner");

    if (!v6)
      goto LABEL_7;
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "recordWithDescriptor:properties:error:", v11, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "setRemoteQuarantineStatus:", 1);
    -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveRecord:withDescriptor:error:", v9, v11, 0);

  }
LABEL_7:

}

- (void)storeQuarantineHashForWorkflowWithReference:(id)a3 quarantineHash:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isBackgroundShortcutRunner");

    if (!v9)
      goto LABEL_7;
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "recordWithDescriptor:properties:error:", v14, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "setRemoteQuarantineHash:", v6);
    -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "saveRecord:withDescriptor:error:", v12, v14, 0);

  }
LABEL_7:

}

- (void)logRunOfWorkflow:(id)a3 withSource:(id)a4 triggerID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "allowReadAccessToShortcutsLibrary"))
  {

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isBackgroundShortcutRunner");

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v17);
      goto LABEL_6;
    }
  }
  -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logRunOfWorkflow:withSource:triggerID:", v18, v10, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, void *, void *))v12)[2](v12, v17, 0);
LABEL_6:

}

- (void)setOutcome:(int64_t)a3 forRunEvent:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a4;
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "allowReadAccessToShortcutsLibrary"))
  {

LABEL_4:
    -[VCVoiceShortcutManagerAccessWrapper database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOutcome:forRunEvent:", a3, v10);

    goto LABEL_5;
  }
  -[VCVoiceShortcutManagerAccessWrapper accessSpecifier](self, "accessSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBackgroundShortcutRunner");

  if (v8)
    goto LABEL_4;
LABEL_5:

}

- (void)loadFileURLWithItemProviderRequestMetadata:(id)a3 type:(id)a4 openInPlace:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  char isKindOfClass;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _OWORD v35[2];
  id v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  getWFAppIntentsLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v39 = "-[VCVoiceShortcutManagerAccessWrapper loadFileURLWithItemProviderRequestMetadata:type:openInPlace:completion:]";
    v40 = 2112;
    v41 = v9;
    v42 = 2112;
    v43 = v10;
    _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s Loading file url representation with metadata: %@ type: %@", buf, 0x20u);
  }

  v13 = v9;
  if (v13 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v13, (isKindOfClass & 1) != 0))
  {
    v15 = v13;
    v16 = (void *)MEMORY[0x1E0D44180];
    objc_msgSend(v15, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "policyWithEntityMetadata:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0;
    objc_msgSend(v18, "connectionWithError:", &v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v36;
    v21 = v20;
    if (v19)
    {
      v31 = v20;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C40]), "initWithContentType:", v10);
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441D8]), "initWithContentType:preferredExtractionType:", v22, 0);
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v32 = v18;
      if (v24)
        objc_msgSend(v24, "if_auditToken");
      else
        memset(v35, 0, sizeof(v35));
      objc_msgSend(v23, "configurationWithAuditToken:", v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "entity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "metadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __110__VCVoiceShortcutManagerAccessWrapper_loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke;
      v33[3] = &unk_1E7AA7200;
      v34 = v11;
      objc_msgSend(v19, "exportEntities:metadata:withConfiguration:completionHandler:", v29, v30, v27, v33);

      v21 = v31;
      v18 = v32;
    }
    else
    {
      getWFGeneralLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[VCVoiceShortcutManagerAccessWrapper loadFileURLWithItemProviderRequestMetadata:type:openInPlace:completion:]";
        v40 = 2112;
        v41 = v21;
        _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
      }

      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v21);
    }

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper unsupportedRequestErrorWithMessage:](self, "unsupportedRequestErrorWithMessage:", CFSTR("Unsupported item provider load request."));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v15);
  }

}

- (void)loadDataWithItemProviderRequestMetadata:(id)a3 type:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  char isKindOfClass;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFAppIntentsLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[VCVoiceShortcutManagerAccessWrapper loadDataWithItemProviderRequestMetadata:type:completion:]";
    v34 = 2112;
    v35 = v8;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Loading data representation with metadata: %@ type: %@", buf, 0x20u);
  }

  v12 = v8;
  if (v12 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v12, (isKindOfClass & 1) != 0))
  {
    v14 = v12;
    v15 = (void *)MEMORY[0x1E0D44180];
    objc_msgSend(v14, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "policyWithEntityMetadata:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0;
    objc_msgSend(v17, "connectionWithError:", &v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v30;
    if (v18)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43C40]), "initWithContentType:", v9);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441D8]), "initWithContentType:preferredExtractionType:", v26, 1);
      objc_msgSend(v14, "entity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v27 = v19;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "metadata");
      v23 = v17;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __95__VCVoiceShortcutManagerAccessWrapper_loadDataWithItemProviderRequestMetadata_type_completion___block_invoke;
      v28[3] = &unk_1E7AA7200;
      v29 = v10;
      objc_msgSend(v18, "exportEntities:metadata:withConfiguration:completionHandler:", v22, v24, v20, v28);

      v17 = v23;
      v19 = v27;

    }
    else
    {
      getWFGeneralLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[VCVoiceShortcutManagerAccessWrapper loadDataWithItemProviderRequestMetadata:type:completion:]";
        v34 = 2112;
        v35 = v19;
        _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
      }

      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v19);
    }

  }
  else
  {
    -[VCVoiceShortcutManagerAccessWrapper unsupportedRequestErrorWithMessage:](self, "unsupportedRequestErrorWithMessage:", CFSTR("Unsupported item provider load request."));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v14);
  }

}

- (id)unsupportedRequestErrorWithMessage:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = *MEMORY[0x1E0DC8058];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 11006, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)configuredStaccatoActionFromTemplate:(id)a3 valuesByParameterKey:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  +[WFConfiguredSystemActionProvider sharedProvider](WFConfiguredSystemActionProvider, "sharedProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "configuredStaccatoActionFromTemplate:valuesByParameterKey:error:", v7, v8, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  getWFStaccatoLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "-[VCVoiceShortcutManagerAccessWrapper configuredStaccatoActionFromTemplate:valuesByParameterKey:completion:]";
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_DEFAULT, "%s Configured action for template: %@ with parameters: %@ -> %@", buf, 0x2Au);
  }

  if (v11)
  {
    v9[2](v9, v11, 0);
  }
  else
  {
    getWFStaccatoLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[VCVoiceShortcutManagerAccessWrapper configuredStaccatoActionFromTemplate:valuesByParameterKey:completion:]";
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to construct configured action with template: %@.", buf, 0x16u);
    }

    ((void (**)(id, void *, id))v9)[2](v9, 0, v12);
  }

}

- (void)defaultStaccatoActionWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *, _QWORD))a3;
  +[WFConfiguredSystemActionProvider sharedProvider](WFConfiguredSystemActionProvider, "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultSystemActionForActionType:", *MEMORY[0x1E0DC82F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getWFStaccatoLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[VCVoiceShortcutManagerAccessWrapper defaultStaccatoActionWithCompletion:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Returning default action: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v5)
  {
    v3[2](v3, v5, 0);
  }
  else
  {
    getWFStaccatoLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[VCVoiceShortcutManagerAccessWrapper defaultStaccatoActionWithCompletion:]";
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Unable to find default action for action button.", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1002, CFSTR("Unable to construct the default action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v3)[2](v3, 0, v8);

  }
}

- (WFTriggerRegistrar)triggerRegistrar
{
  return self->_triggerRegistrar;
}

- (WFShareSheetWorkflowProvider)shareSheetProvider
{
  return self->_shareSheetProvider;
}

- (VCSyncDataEndpoint)syncDataEndpoint
{
  return self->_syncDataEndpoint;
}

- (VCCKShortcutSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (WFWorkflowRunCoordinator)runCoordinator
{
  return self->_runCoordinator;
}

- (WFSandboxExtensionManager)sandboxExtensionManager
{
  return self->_sandboxExtensionManager;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionManager, 0);
  objc_storeStrong((id *)&self->_runCoordinator, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_syncDataEndpoint, 0);
  objc_storeStrong((id *)&self->_shareSheetProvider, 0);
  objc_storeStrong((id *)&self->_triggerRegistrar, 0);
  objc_storeStrong((id *)&self->_voiceShortcutManager, 0);
  objc_storeStrong((id *)&self->_accessSpecifier, 0);
}

void __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke_255(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFStaccatoLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v8 = 136315394;
      v9 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Failed to load possible states for parameter: %@", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "possibleStatesCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __95__VCVoiceShortcutManagerAccessWrapper_loadDataWithItemProviderRequestMetadata_type_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a2)
  {
    objc_msgSend(a2, "value");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "exportedContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wf_fileRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __110__VCVoiceShortcutManagerAccessWrapper_loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a2)
  {
    objc_msgSend(a2, "value");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "exportedContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wf_fileRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v7, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __87__VCVoiceShortcutManagerAccessWrapper_resetAutomationConfirmationStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = 0;
  v5 = objc_msgSend(v4, "updateNotificationLevel:forConfiguredTrigger:error:", 0, v3, &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    getWFTriggerNotificationsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v10 = "-[VCVoiceShortcutManagerAccessWrapper resetAutomationConfirmationStatusWithCompletion:]_block_invoke";
      v11 = 2114;
      v12 = v3;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Could not reset automation confirmation status for trigger: %{public}@ with error: %{public}@", buf, 0x20u);
    }

  }
}

void __103__VCVoiceShortcutManagerAccessWrapper_createBookmarkWithBookmarkableString_path_workflowID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = a2;
    v5 = objc_msgSend(v4, "startAccessingSecurityScopedResource");
    v19 = 0;
    objc_msgSend(v4, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    if (v6)
    {
      if (v5)
        objc_msgSend(v4, "stopAccessingSecurityScopedResource");
      objc_msgSend(MEMORY[0x1E0DD9D00], "defaultDatabase");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "stringByStandardizingPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v7;
      objc_msgSend(v8, "createBookmarkWithWorkflowID:path:bookmarkData:error:", v9, v10, v6, &v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v18;

      getWFFilesLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v11)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v21 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithBookmarkableString:path:workflowID:completion:]_block_invoke";
          _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEBUG, "%s Created local bookmark", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithBookmarkableString:path:workflowID:completion:]_block_invoke";
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to create local bookmark with error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v7 = v12;
    }
    else
    {
      getWFFilesLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithBookmarkableString:path:workflowID:completion:]_block_invoke";
        v22 = 2112;
        v23 = v7;
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_ERROR, "%s Could not create bookmark data with error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    getWFFilesLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithBookmarkableString:path:workflowID:completion:]_block_invoke";
      v22 = 2112;
      v23 = a3;
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_ERROR, "%s Could not create document url from bookmarkable string with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __83__VCVoiceShortcutManagerAccessWrapper_createBookmarkWithURL_workflowID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void (*v15)(void);
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id obj;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "wf_fileIsReadable") & 1) == 0)
  {
    getWFFilesLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
      v26 = 2112;
      v27 = v3;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_ERROR, "%s Do not have access to new url: %@ original url: %@ during coordinated read", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 10002, CFSTR("Could not create bookmark for file."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopAccessingSecurityScopedResource");

  }
  if (v5)
  {
    if (!*(_QWORD *)(a1 + 40))
    {
LABEL_10:
      getWFFilesLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
        _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_INFO, "%s Created local bookmark", buf, 0xCu);
      }

      v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_16:
      v15();
      goto LABEL_23;
    }
    getWFFilesLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_INFO, "%s Workflow identifier present persisting to database", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0DD9D00], "defaultDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByStandardizingPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(id *)(v12 + 40);
    objc_msgSend(v8, "createBookmarkWithWorkflowID:path:bookmarkData:error:", v9, v11, v5, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v12 + 40), v22);

    if (v13)
    {

      goto LABEL_10;
    }
    getWFFilesLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_ERROR, "%s Failed to save local bookmark with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    getWFFilesLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_ERROR, "%s Could not create bookmark data with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = 0;
  }
LABEL_23:

}

uint64_t __75__VCVoiceShortcutManagerAccessWrapper_resolveCrossDeviceItemID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  getWFFilesLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315650;
    v9 = "-[VCVoiceShortcutManagerAccessWrapper resolveCrossDeviceItemID:completion:]_block_invoke";
    v10 = 2112;
    v11 = a2;
    v12 = 2112;
    v13 = a3;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEBUG, "%s Resolved to url: %@ with error: %@", (uint8_t *)&v8, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__VCVoiceShortcutManagerAccessWrapper_resolveBookmarkData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id obj;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "wf_fileIsWritable");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v3, v4 ^ 1u, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  getWFFilesLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[VCVoiceShortcutManagerAccessWrapper resolveBookmarkData:completion:]_block_invoke";
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEBUG, "%s Created bookmark url: %@ from bookmark data", buf, 0x16u);
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v12 = 0;
    objc_msgSend(v3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    if (!v9)
    {
      getWFFilesLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[VCVoiceShortcutManagerAccessWrapper resolveBookmarkData:completion:]_block_invoke";
        v16 = 2114;
        v17 = v10;
        _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s Could not create bookmark data from resolved url with error: %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    v9 = 0;
  }
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __77__VCVoiceShortcutManagerAccessWrapper_resolveFilePath_workflowID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "wf_fileIsWritable") ^ 1;
  getWFFilesLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v11 = "-[VCVoiceShortcutManagerAccessWrapper resolveFilePath:workflowID:completion:]_block_invoke";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEBUG, "%s Created URL %@ from bookmark", buf, 0x16u);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v3, v4, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setMaxResults:", v2);
  objc_msgSend(v3, "setIncludeArtwork:", 1);

}

void __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleIdentifiers:", v4, v5, v6);

}

void __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 0, CFSTR("Failed to fetch upcoming media query"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v9);
LABEL_9:

    return;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v7 = (_QWORD *)getMRSuggestionContextHomeScreenSymbolLoc_ptr;
  v19 = getMRSuggestionContextHomeScreenSymbolLoc_ptr;
  if (!getMRSuggestionContextHomeScreenSymbolLoc_ptr)
  {
    v8 = MediaRemoteLibrary();
    v7 = dlsym(v8, "MRSuggestionContextHomeScreen");
    v17[3] = (uint64_t)v7;
    getMRSuggestionContextHomeScreenSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v16, 8);
  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_4;
      v14[3] = &unk_1E7AA70E8;
      v15 = *(id *)(a1 + 32);
      objc_msgSend(v9, "if_compactMap:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], 0);
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRSuggestionContext getMRSuggestionContextHomeScreen(void)");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("VCVoiceShortcutManagerAccessWrapper.m"), 68, CFSTR("%s"), dlerror());

  __break(1u);
}

id __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "valueForKey:", CFSTR("intent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0DC7F00])
    || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0DC7F28]))
  {
    v5 = objc_alloc(MEMORY[0x1E0DC7A90]);
    objc_msgSend(v3, "artwork");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithPlayMediaIntent:artwork:", v4, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(_QWORD *, void *, _BYTE *);
  void *v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__4926;
  v46 = __Block_byref_object_dispose__4927;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__4926;
  v40 = __Block_byref_object_dispose__4927;
  v41 = 0;
  objc_msgSend(v3, "remoteParticipantHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_184;
  v32 = &unk_1E7AA7050;
  v34 = &v42;
  v33 = *(id *)(a1 + 32);
  v35 = &v36;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v29);

  if (v43[5])
  {
    objc_msgSend(MEMORY[0x1E0D13E30], "contactWithCNContact:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13E78]), "initWithContact:", v5);
    v28 = (void *)v5;
    v7 = objc_alloc(MEMORY[0x1E0DD9DE8]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithIdentity:parameterState:", v8, v6);
    v27 = (void *)v6;

    v10 = objc_alloc(MEMORY[0x1E0DD9CF0]);
    v48[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithValue:", v11);

    v13 = objc_alloc(MEMORY[0x1E0CBDA58]);
    v14 = v43[5];
    objc_msgSend((id)v37[5], "value");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithContact:handle:", v14, v15);

    objc_msgSend(v3, "serviceProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.Telephony"));

    if ((v15 & 1) != 0)
    {
      v18 = CFSTR("Audio");
      v19 = 1;
    }
    else if (objc_msgSend(v3, "mediaType", v27, v28, v29, v30, v31, v32) == 1)
    {
      v18 = CFSTR("Audio");
      v19 = 3;
    }
    else
    {
      if (objc_msgSend(v3, "mediaType") == 2)
        v18 = CFSTR("Video");
      else
        v18 = 0;
      v19 = 2;
    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9E98]), "initWithValue:", v18);
    v22 = objc_alloc(MEMORY[0x1E0DC7A88]);
    objc_msgSend((id)v37[5], "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "serializedRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serializedRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v22, "initWithHandle:callType:person:callTypeSerializedRepresentation:personSerializedRepresentation:", v23, v19, v16, v24, v25);

  }
  else
  {
    v20 = 0;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v20;
}

void __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_184(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = a2;
  v7 = (void *)a1[4];
  v13 = v6;
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }

}

id __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "remoteParticipantHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_180);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

uint64_t __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

void __81__VCVoiceShortcutManagerAccessWrapper_getSuggestedShortcutsWithLimit_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "if_compactMap:", &__block_literal_global_165);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

id __81__VCVoiceShortcutManagerAccessWrapper_getSuggestedShortcutsWithLimit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = objc_alloc(MEMORY[0x1E0DD9F18]);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithWorkflowName:workflowIdentifier:isSelf:", v6, v7, 0);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9F10]), "initWithValue:", v8);
  v10 = objc_alloc(MEMORY[0x1E0DC7A98]);
  objc_msgSend(v9, "serializedRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithDescriptor:serializedRepresentation:", v4, v11);

  return v12;
}

uint64_t __85__VCVoiceShortcutManagerAccessWrapper_showSingleStepCompletionForWebClip_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __71__VCVoiceShortcutManagerAccessWrapper_getStingWorkflowsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = (objc_class *)MEMORY[0x1E0DC7DA0];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "color");
  v8 = objc_msgSend(v3, "glyphCharacter");
  objc_msgSend(v3, "associatedAppBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v4, "initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:", v5, v6, v7, v8, v9);
  return v10;
}

uint64_t __75__VCVoiceShortcutManagerAccessWrapper_sendAceCommandDictionary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __82__VCVoiceShortcutManagerAccessWrapper_fireTriggerWithIdentifier_force_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "triggerRegistrar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fireTriggerWithIdentifier:force:eventInfo:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), MEMORY[0x1E0C9AA70], *(_QWORD *)(a1 + 48));

}

@end
