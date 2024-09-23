@implementation VCVoiceShortcutManager

- (void)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4 accessSpecifier:(id)a5
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 515, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v11)
      goto LABEL_4;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 514, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcutSuggestions"));

  if (!v10)
    goto LABEL_18;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 516, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

LABEL_4:
  if ((objc_msgSend(v11, "allowWriteAccessToSuggestionsWithBundleIdentifier:", v10) & 1) != 0)
  {
    -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v12, "databaseWithError:", &v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;

    if (v13)
    {
      VCOSTransactionWithName((uint64_t)CFSTR("setVoiceShortcutSuggestions"));
      v15 = objc_claimAutoreleasedReturnValue();
      v22 = v14;
      v16 = objc_msgSend(v13, "setShortcutSuggestions:forAppWithBundleIdentifier:error:", v9, v10, &v22);
      v17 = v22;

      if ((v16 & 1) == 0)
      {
        getWFGeneralLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v25 = "-[VCVoiceShortcutManager setShortcutSuggestions:forAppWithBundleIdentifier:accessSpecifier:]";
          v26 = 2112;
          v27 = v17;
          _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_ERROR, "%s Unable to set shortcut suggestions. %@", buf, 0x16u);
        }

      }
    }
    else
    {
      getWFGeneralLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[VCVoiceShortcutManager setShortcutSuggestions:forAppWithBundleIdentifier:accessSpecifier:]";
        v26 = 2112;
        v27 = v14;
        _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get the database. %@", buf, 0x16u);
      }
      v17 = v14;
    }

  }
  else
  {
    getWFGeneralLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "-[VCVoiceShortcutManager setShortcutSuggestions:forAppWithBundleIdentifier:accessSpecifier:]";
      v26 = 2114;
      v27 = v10;
      v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_ERROR, "%s Unauthorized write attempt for suggestions for bundleID (%{public}@) using accessSpecifier (%{public}@)", buf, 0x20u);
    }
  }

}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (VCVoiceShortcutManager)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4 appShortcutsUpdater:(id)a5 contextualActionSyncService:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  VCVoiceShortcutManager *v16;
  VCVoiceShortcutManager *v17;
  VCVoiceShortcutManager *v18;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

  }
  v21.receiver = self;
  v21.super_class = (Class)VCVoiceShortcutManager;
  v16 = -[VCVoiceShortcutManager init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_databaseProvider, a3);
    objc_storeStrong((id *)&v17->_appShortcutsUpdater, a5);
    objc_storeStrong((id *)&v17->_contextualActionSyncService, a6);
    objc_msgSend(v13, "addObserver:selector:name:", v17, sel_applicationWasUnregistered_, CFSTR("ApplicationUnregistered"));
    v18 = v17;
  }

  return v17;
}

- (WFDatabase)database
{
  void *v2;
  void *v3;

  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFDatabase *)v3;
}

- (void)getNumberOfVoiceShortcutsWithAccessSpecifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFGeneralLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[VCVoiceShortcutManager getNumberOfVoiceShortcutsWithAccessSpecifier:completion:]";
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEBUG, "%s Get number of voice shortcuts", buf, 0xCu);
  }

  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v11, "databaseWithError:", &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;

  if (v12)
  {
    if (objc_msgSend(v7, "allowUnrestrictedAccess"))
    {
      objc_msgSend(v12, "sortedVisibleWorkflowsByName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "associatedAppBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sortedVisibleWorkflowsWithAssociatedAppBundleIdentifier:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v16 = objc_msgSend(v14, "count");
    objc_msgSend(v14, "fetchError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v9)[2](v9, v16, v17);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v13);
  }

}

- (void)getVoiceShortcutWithIdentifier:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v11)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("voiceShortcutIdentifier"));

  if (!v10)
    goto LABEL_14;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  getWFGeneralLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[VCVoiceShortcutManager getVoiceShortcutWithIdentifier:accessSpecifier:completion:]";
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEBUG, "%s Get VoiceShortcut with id (%@)", buf, 0x16u);
  }

  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v13, "databaseWithError:", &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;

  if (v14)
  {
    VCOSTransactionWithName((uint64_t)CFSTR("getVoiceShortcutsWithIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "referenceForWorkflowID:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_msgSend(v10, "allowReadAccessToShortcutsLibrary");
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __84__VCVoiceShortcutManager_getVoiceShortcutWithIdentifier_accessSpecifier_completion___block_invoke;
      v23[3] = &unk_1E7AA5758;
      v26 = v11;
      v24 = v9;
      v25 = v16;
      VCVoiceShortcutFromWorkflow(v17, v14, 1, v18, v23);

      v19 = v26;
    }
    else
    {
      VCNotFoundError(v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v19);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v15);
  }

}

- (void)getVoiceShortcutWithPhrase:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v11)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phrase"));

  if (!v10)
    goto LABEL_14;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  getWFGeneralLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[VCVoiceShortcutManager getVoiceShortcutWithPhrase:accessSpecifier:completion:]";
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEBUG, "%s Get VoiceShortcut with phrase (%@)", buf, 0x16u);
  }

  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v13, "databaseWithError:", &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v27;

  if (v14)
  {
    VCOSTransactionWithName((uint64_t)CFSTR("getVoiceShortcutWithPhrase"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueVisibleReferenceForWorkflowName:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_msgSend(v10, "allowReadAccessToShortcutsLibrary");
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __80__VCVoiceShortcutManager_getVoiceShortcutWithPhrase_accessSpecifier_completion___block_invoke;
      v23[3] = &unk_1E7AA5758;
      v26 = v11;
      v24 = v9;
      v25 = v16;
      VCVoiceShortcutFromWorkflow(v17, v14, 1, v18, v23);

      v19 = v26;
    }
    else
    {
      VCNotFoundByPhraseError(v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v19);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v15);
  }

}

- (void)getVoiceShortcutsWithAccessSpecifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFGeneralLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[VCVoiceShortcutManager getVoiceShortcutsWithAccessSpecifier:completion:]";
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEBUG, "%s Get all VoiceShortcuts", buf, 0xCu);
  }

  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v11, "databaseWithError:", &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v24;

  if (v12)
  {
    VCOSTransactionWithName((uint64_t)CFSTR("getVoiceShortcutsWithAccessSpecifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "allowUnrestrictedAccess");
    v23 = v13;
    VCWorkflowReferencesForAccessSpecifier(v12, v7, &v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v23;

    if (v17)
    {
      ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v17);
    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __74__VCVoiceShortcutManager_getVoiceShortcutsWithAccessSpecifier_completion___block_invoke;
      v20[3] = &unk_1E7AA6820;
      v22 = v9;
      v21 = v14;
      VCVoiceShortcutsFromWorkflows(v16, v12, v15 ^ 1, (uint64_t)v20);

    }
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v13);
    v17 = v13;
  }

}

- (void)getVoiceShortcutsForAppsWithBundleIdentifiers:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v11)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifiers"));

  if (!v10)
    goto LABEL_14;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  getWFGeneralLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[VCVoiceShortcutManager getVoiceShortcutsForAppsWithBundleIdentifiers:accessSpecifier:completion:]";
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEBUG, "%s Get VoiceShortcuts for apps with bundle IDs = %@", buf, 0x16u);
  }

  if (objc_msgSend(v9, "count"))
  {
    -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v13, "databaseWithError:", &v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v27;

    if (v14)
    {
      VCOSTransactionWithName((uint64_t)CFSTR("getVoiceShortcutsForAppsWithBundleIdentifiers"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke;
      v25[3] = &unk_1E7AA5780;
      v26 = v14;
      v22[0] = v17;
      v22[1] = 3221225472;
      v22[2] = __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke_3;
      v22[3] = &unk_1E7AA6820;
      v23 = v16;
      v24 = v11;
      v18 = v16;
      objc_msgSend(v9, "if_flatMapAsynchronously:completionHandler:", v25, v22);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v15);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1007, CFSTR("bundleIdentifiers are needed"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v15);
  }

}

- (void)getInactiveAppsWithAccessSpecifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFGeneralLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[VCVoiceShortcutManager getInactiveAppsWithAccessSpecifier:completion:]";
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEBUG, "%s Get inactive apps", buf, 0xCu);
  }

  if ((objc_msgSend(v7, "allowUnrestrictedAccess") & 1) != 0)
  {
    -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v11, "databaseWithError:", &v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v34;

    if (v12)
    {
      VCOSTransactionWithName((uint64_t)CFSTR("getInactiveAppsWithAccessSpecifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v13;
      VCWorkflowReferencesForAccessSpecifier(v12, v7, &v33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v33;

      v16 = (void *)objc_opt_new();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v30;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v30 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v21), "associatedAppBundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(v16, "addObject:", v22);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        }
        while (v19);
      }

      objc_msgSend(v16, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      VCInactiveAppsFromList();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v9)[2](v9, v24, v15);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v13);
      v15 = v13;
    }

  }
  else
  {
    getWFGeneralLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[VCVoiceShortcutManager getInactiveAppsWithAccessSpecifier:completion:]";
      v38 = 2114;
      v39 = v7;
      _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_ERROR, "%s Unauthorized attempt to access voice shortcut apps using accessSpecifier (%{public}@)", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Unauthorized attempt to access voice shortcut enabled apps using accessSpecifier %@"), v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v15);
  }

}

- (void)addVoiceShortcut:(id)a3 phrase:(id)a4 accessSpecifier:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD aBlock[4];
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcut"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

LABEL_3:
  if ((objc_msgSend(v13, "allowWriteAccessToVoiceShortcuts") & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__VCVoiceShortcutManager_addVoiceShortcut_phrase_accessSpecifier_completion___block_invoke;
    aBlock[3] = &unk_1E7AA73F8;
    v47 = v14;
    v15 = _Block_copy(aBlock);
    -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v16, "databaseWithError:", &v45);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v45;

    if (v17)
    {
      VCOSTransactionWithName((uint64_t)CFSTR("addVoiceShortcut:phrase:"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      v20 = -[VCVoiceShortcutManager isPhraseUsable:inDatabase:error:](self, "isPhraseUsable:inDatabase:error:", v12, v17, &v44);
      v21 = v44;
      if (v20)
      {
        v41 = v12;
        objc_msgSend(MEMORY[0x1E0DD9C18], "sharedRegistry");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v18;
        objc_msgSend(v22, "createActionWithShortcut:error:", v11, &v43);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v43;

        if (v23)
        {
          v38 = v21;
          v39 = v19;
          v24 = objc_alloc_init(MEMORY[0x1E0DD9EF8]);
          objc_msgSend(v24, "setWorkflowTypes:", MEMORY[0x1E0C9AA60]);
          objc_msgSend(v24, "record");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setName:", v41);

          objc_msgSend(v24, "addAction:", v23);
          objc_msgSend(v24, "record");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addWatchWorkflowTypeIfEligible");

          v27 = objc_alloc(MEMORY[0x1E0DD9F00]);
          objc_msgSend(v24, "record");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v27, "initWithRecord:", v28);

          v42 = v40;
          objc_msgSend(v17, "createWorkflowWithOptions:error:", v29, &v42);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v42;

          if (v30)
            VCVoiceShortcutFromWorkflow(v30, v17, 1, 0, v15);
          else
            (*((void (**)(void *, _QWORD, id))v15 + 2))(v15, 0, v18);

          v21 = v38;
          v19 = v39;
        }
        else
        {
          v18 = v40;
          (*((void (**)(void *, _QWORD, id))v15 + 2))(v15, 0, v40);
        }

        v12 = v41;
      }
      else
      {
        (*((void (**)(void *, _QWORD, id))v15 + 2))(v15, 0, v21);
      }

    }
    else
    {
      (*((void (**)(void *, _QWORD, id))v15 + 2))(v15, 0, v18);
    }

    v34 = v47;
  }
  else
  {
    getWFGeneralLogObject();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "_associatedAppBundleIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v49 = "-[VCVoiceShortcutManager addVoiceShortcut:phrase:accessSpecifier:completion:]";
      v50 = 2114;
      v51 = v32;
      v52 = 2114;
      v53 = v13;
      _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_ERROR, "%s Unauthorized add attempt for voice shortcut with bundleID (%{public}@) using accessSpecifier (%{public}@)", buf, 0x20u);

    }
    v33 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v11, "_associatedAppBundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Unauthorized add attempt for voice shortcut with bundleID (%@) using accessSpecifier (%@)"), v34, v13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v35);

  }
}

- (void)updateVoiceShortcutWithIdentifier:(id)a3 phrase:(id)a4 shortcut:(id)a5 accessSpecifier:(id)a6 completion:(id)a7
{
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(void *, _QWORD, id);
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  VCVoiceShortcutManager *v36;
  _BOOL4 v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  void (**v43)(void *, _QWORD, id);
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD aBlock[4];
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (unint64_t)a4;
  v15 = (unint64_t)a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v16)
      goto LABEL_3;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v17)
      goto LABEL_4;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("voiceShortcutIdentifier"));

  if (!v16)
    goto LABEL_33;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outerCompletionHandler"));

LABEL_4:
  if (!(v14 | v15))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 327, CFSTR("Pass at least one parameter to update"));

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VCVoiceShortcutManager_updateVoiceShortcutWithIdentifier_phrase_shortcut_accessSpecifier_completion___block_invoke;
  aBlock[3] = &unk_1E7AA73F8;
  v18 = v17;
  v49 = v18;
  v19 = (void (**)(void *, _QWORD, id))_Block_copy(aBlock);
  getWFGeneralLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "-[VCVoiceShortcutManager updateVoiceShortcutWithIdentifier:phrase:shortcut:accessSpecifier:completion:]";
    v52 = 2112;
    v53 = v13;
    _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_DEBUG, "%s Updating VoiceShortcut with id (%@)", buf, 0x16u);
  }

  if ((objc_msgSend(v16, "allowWriteAccessToVoiceShortcuts") & 1) != 0)
  {
    -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    objc_msgSend(v21, "databaseWithError:", &v47);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v47;

    if (!v22)
    {
      v19[2](v19, 0, v23);
LABEL_30:

      goto LABEL_31;
    }
    VCOSTransactionWithName((uint64_t)CFSTR("updateVoiceShortcutWithIdentifier:phrase:"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "referenceForWorkflowID:", v13);
    v25 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v25;
    if (!v25)
    {
      VCNotFoundError(v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, v26);
LABEL_29:

      goto LABEL_30;
    }
    v36 = self;
    v39 = v24;
    v46 = v23;
    objc_msgSend(MEMORY[0x1E0DD9EF8], "workflowWithReference:database:error:", v25, v22, &v46);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v46;

    if (v26)
    {
      if (v14)
      {
        v45 = v27;
        v37 = -[VCVoiceShortcutManager isPhraseUsable:inDatabase:error:](v36, "isPhraseUsable:inDatabase:error:", v14, v22, &v45);
        v23 = v45;

        if (!v37)
        {
          v19[2](v19, 0, v23);
          goto LABEL_28;
        }
        objc_msgSend(v26, "setName:", v14);
      }
      else
      {
        v23 = v27;
      }
      v24 = v39;
      if (!v15)
      {
LABEL_25:
        objc_msgSend(v26, "save");
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __103__VCVoiceShortcutManager_updateVoiceShortcutWithIdentifier_phrase_shortcut_accessSpecifier_completion___block_invoke_169;
        v41[3] = &unk_1E7AA57A8;
        v43 = v19;
        v42 = v24;
        VCVoiceShortcutFromWorkflow(v40, v22, 1, 0, v41);

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0DD9C18], "sharedRegistry");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v23;
      objc_msgSend(v29, "createActionWithShortcut:error:", v15, &v44);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v44;

      if (v35)
      {
        objc_msgSend(v26, "actions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeActions:", v30);

        objc_msgSend(v26, "addAction:", v35);
        v23 = v38;
        v24 = v39;
        goto LABEL_25;
      }
      v23 = v38;
      v19[2](v19, 0, v38);
    }
    else
    {
      v19[2](v19, 0, v27);
      v23 = v27;
    }
LABEL_28:
    v24 = v39;
    goto LABEL_29;
  }
  getWFGeneralLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "-[VCVoiceShortcutManager updateVoiceShortcutWithIdentifier:phrase:shortcut:accessSpecifier:completion:]";
    v52 = 2114;
    v53 = v16;
    _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_ERROR, "%s Unauthorized update attempt for voice shortcut using accessSpecifier (%{public}@)", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Unauthorized update attempt for voice shortcut using accessSpecifier (%@)"), v16);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v19[2](v19, 0, v23);
LABEL_31:

}

- (void)deleteVoiceShortcutWithIdentifier:(id)a3 name:(id)a4 accessSpecifier:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  void (**v19)(void *, _QWORD, id);
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD aBlock[4];
  const __CFString *v33;
  __CFString *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))v14;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outerCompletionHandler"));

LABEL_3:
  getWFGeneralLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[VCVoiceShortcutManager deleteVoiceShortcutWithIdentifier:name:accessSpecifier:completion:]";
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_DEBUG, "%s Deleting VoiceShortcut with id (%@)", buf, 0x16u);
  }

  if ((objc_msgSend(v13, "allowWriteAccessToVoiceShortcuts") & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__VCVoiceShortcutManager_deleteVoiceShortcutWithIdentifier_name_accessSpecifier_completion___block_invoke;
    aBlock[3] = &unk_1E7AA57D0;
    v17 = (const __CFString *)v11;
    v33 = v17;
    v18 = (const __CFString *)v12;
    v34 = (__CFString *)v18;
    v35 = v15;
    v19 = (void (**)(void *, _QWORD, id))_Block_copy(aBlock);
    -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v20, "databaseWithError:", &v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v31;

    if (!v21)
    {
      v19[2](v19, 0, v22);
LABEL_24:

      v25 = (void *)v33;
      goto LABEL_25;
    }
    VCOSTransactionWithName((uint64_t)CFSTR("deleteVoiceShortcut"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v21, "referenceForWorkflowID:", v17);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v18)
        goto LABEL_17;
      objc_msgSend(v21, "uniqueVisibleReferenceForWorkflowName:", v18);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v23;
    if (v23)
    {
      objc_msgSend(v21, "deleteReference:error:", v23, 0);
      v19[2](v19, 1, 0);
LABEL_23:

      goto LABEL_24;
    }
LABEL_17:
    if (v18)
      v27 = v18;
    else
      v27 = v17;
    if (!v27)
      v27 = CFSTR("unknown");
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1002, CFSTR("Voice shortcut with identifier or name (%@) does not exist"), v27, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, 0, v26);
    goto LABEL_23;
  }
  getWFGeneralLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[VCVoiceShortcutManager deleteVoiceShortcutWithIdentifier:name:accessSpecifier:completion:]";
    v38 = 2114;
    v39 = v13;
    _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_ERROR, "%s Unauthorized delete attempt for voice shortcut using accessSpecifier (%{public}@)", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Unauthorized update attempt for voice shortcut using accessSpecifier (%@)"), v13);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v25);
LABEL_25:

}

- (BOOL)phraseHasHomeKitConflict:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD v11[4];
  id v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  -[VCVoiceShortcutManager homeManager](self, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__VCVoiceShortcutManager_phraseHasHomeKitConflict___block_invoke;
  v11[3] = &unk_1E7AA57F8;
  v14 = &v15;
  v7 = v4;
  v12 = v7;
  v8 = v5;
  v13 = v8;
  objc_msgSend(v6, "checkName:inHome:withValidationOptions:completionHandler:", v7, 0, 10, v11);

  v9 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v8, v9);
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

- (BOOL)isPhraseUsable:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  NSObject *v8;
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
  _BYTE buf[24];
  void *v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "visibleReferencesForWorkflowName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[VCVoiceShortcutManager isPhraseUsable:inDatabase:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v25 = v10;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEBUG, "%s Found a local voice shortcut (%@) with the same phrase (%@).", buf, 0x20u);

    }
    objc_msgSend(v7, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = v7;
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Phrase (%@) is already associated with a voice shortcut."), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *MEMORY[0x1E0DC8038];
    *(_QWORD *)buf = v11;
    v17 = *MEMORY[0x1E0DC8040];
    v26[0] = v16;
    v26[1] = v17;
    objc_msgSend(v13, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf[8] = v18;
    v26[2] = *MEMORY[0x1E0DC8030];
    objc_msgSend(v13, "associatedAppBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)*MEMORY[0x1E0DC7FD8];
    if (v19)
      v20 = v19;
    *(_QWORD *)&buf[16] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v26, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:extraUserInfo:reason:", 1008, v21, CFSTR("%@"), v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = objc_retainAutorelease(v22);

  }
  return v7 == 0;
}

- (HMHomeManager)homeManager
{
  HMHomeManager *homeManager;
  void *v4;
  objc_class *v5;
  HMHomeManager *v6;
  HMHomeManager *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  homeManager = self->_homeManager;
  if (!homeManager)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getHMHomeManagerClass_softClass;
    v13 = getHMHomeManagerClass_softClass;
    if (!getHMHomeManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getHMHomeManagerClass_block_invoke;
      v9[3] = &unk_1E7AA8030;
      v9[4] = &v10;
      __getHMHomeManagerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (HMHomeManager *)objc_msgSend([v5 alloc], "initWithOptions:", 0);
    v7 = self->_homeManager;
    self->_homeManager = v6;

    homeManager = self->_homeManager;
  }
  return homeManager;
}

- (void)drawGlyphs:(id)a3 withBackgroundColorValues:(id)a4 padding:(double)a5 rounded:(BOOL)a6 intoContext:(id)a7
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  float v19;
  double v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;

  v13 = a4;
  v14 = a7;
  v15 = a3;
  v16 = objc_msgSend(v15, "count");
  v17 = objc_msgSend(v13, "count");
  if (v13 && v16 != v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 486, CFSTR("Background color values and glyph character arrays should be equal in size, or background color values should be nil."));

  }
  v18 = objc_alloc_init(MEMORY[0x1E0DC7E48]);
  objc_msgSend(v14, "singleImageSize");
  v19 = a5;
  v26[1] = 3221225472;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[2] = __91__VCVoiceShortcutManager_drawGlyphs_withBackgroundColorValues_padding_rounded_intoContext___block_invoke;
  v26[3] = &unk_1E7AA5848;
  v27 = v13;
  v28 = v18;
  v34 = a6;
  v29 = v14;
  v30 = floorf(v19);
  v31 = v30;
  v32 = v20 - v30 * 2.0;
  v33 = v21 - v30 * 2.0;
  v22 = v14;
  v23 = v18;
  v25 = v13;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v26);

}

- (void)getShortcutSuggestionsForAppWithBundleIdentifier:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v11)
      goto LABEL_4;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 542, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  if (!v10)
    goto LABEL_12;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 544, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  if ((objc_msgSend(v10, "allowReadAccessToSuggestionsWithBundleIdentifier:", v9) & 1) != 0)
  {
    -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v12, "databaseWithError:", &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v22;

    if (v13)
    {
      v21 = v14;
      objc_msgSend(v13, "shortcutSuggestionsForAppWithBundleIdentifier:shortcutAvailability:error:", v9, 0, &v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;

      v11[2](v11, v15, v16);
      v14 = v16;
    }
    else
    {
      v11[2](v11, 0, v14);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v17);

  }
}

- (void)getShortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 561, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 562, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  if ((objc_msgSend(v9, "allowReadAccessToSuggestionsWithBundleIdentifier:", 0) & 1) != 0)
  {
    -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v12, "databaseWithError:", &v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;

    if (v13)
    {
      v20 = v14;
      objc_msgSend(v13, "shortcutSuggestionsForAllAppsWithLimit:shortcutAvailability:error:", a3, 0, &v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v20;

      ((void (**)(_QWORD, void *, id))v11)[2](v11, v15, v16);
      v14 = v16;
    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v14);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Access was denied"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v17);

  }
}

- (void)deleteStaleSuggestions
{
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = -[VCVoiceShortcutManager lsDatabaseChangedSinceLastCheck](self, "lsDatabaseChangedSinceLastCheck");
  getWFGeneralLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[VCVoiceShortcutManager deleteStaleSuggestions]";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEBUG, "%s LS database has changed since last check. Checking for stale suggestions.", buf, 0xCu);
    }

    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    VCOSTransactionWithName((uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC7928], "accessSpecifierUnrestricted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__VCVoiceShortcutManager_deleteStaleSuggestions__block_invoke;
    v10[3] = &unk_1E7AA5870;
    v10[4] = self;
    v11 = v8;
    v5 = v8;
    -[VCVoiceShortcutManager getInactiveAppsWithAccessSpecifier:completion:](self, "getInactiveAppsWithAccessSpecifier:completion:", v9, v10);

  }
  else if (v6)
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[VCVoiceShortcutManager deleteStaleSuggestions]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEBUG, "%s LS database has not changed since last check. No stale suggestions to delete.", buf, 0xCu);
  }

}

- (void)deleteSuggestionsFromApps:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[VCVoiceShortcutManager database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteShortcutSuggestionsFromApps:", v4);

  -[VCVoiceShortcutManager updateLSDatabaseAnchors](self, "updateLSDatabaseAnchors");
}

- (BOOL)lsDatabaseChangedSinceLastCheck
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  BOOL v6;
  char v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  char v13;
  void *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  objc_msgSend(v2, "getKnowledgeUUID:andSequenceNumber:", &v17, &v16);
  v3 = v17;
  v4 = v16;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[VCVoiceShortcutManager lsDatabaseChangedSinceLastCheck]";
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to fetch LS database state.", buf, 0xCu);
    }
    v7 = 1;
  }
  else
  {
    +[VCUserDefaults sharedUserDefaults](VCUserDefaults, "sharedUserDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringForKey:](v8, "stringForKey:", CFSTR("VCLSDatabaseUUIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("VCLSDataSequenceKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v3, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v14))
        v13 = objc_msgSend(v11, "isEqualToNumber:", v5);
      else
        v13 = 0;

    }
    v7 = v13 ^ 1;

  }
  return v7;
}

- (void)updateLSDatabaseAnchors
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  objc_msgSend(v2, "getKnowledgeUUID:andSequenceNumber:", &v10, &v9);
  v3 = v10;
  v4 = v9;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[VCVoiceShortcutManager updateLSDatabaseAnchors]";
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Unable to fetch LS database state.", buf, 0xCu);
    }
  }
  else
  {
    +[VCUserDefaults sharedUserDefaults](VCUserDefaults, "sharedUserDefaults");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v8, CFSTR("VCLSDatabaseUUIDKey"));

    -[NSObject setObject:forKey:](v7, "setObject:forKey:", v5, CFSTR("VCLSDataSequenceKey"));
  }

}

- (void)getResultsForQuery:(id)a3 resultClass:(Class)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a5;
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v10, "databaseWithError:", &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v25;

  if (v11)
  {
    VCOSTransactionWithName((uint64_t)CFSTR("com.apple.shortcuts.fetch"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "sortedWorkflowsWithQuery:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "descriptors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __68__VCVoiceShortcutManager_getResultsForQuery_resultClass_completion___block_invoke;
      v21[3] = &unk_1E7AA7980;
      v24 = v9;
      v22 = v14;
      v23 = v13;
      v17 = v14;
      -[objc_class getObjectsFromReferences:databaseProvider:completion:](a4, "getObjectsFromReferences:databaseProvider:completion:", v15, v16, v21);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "sortedVisibleFolders");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "descriptors");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "state");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, void *, _QWORD))v9 + 2))(v9, v19, v20, 0);

      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
      }
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, v12);
  }

}

- (void)getValueForDescriptor:(id)a3 resultClass:(Class)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, _QWORD, void *);
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v10, "databaseWithError:", &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;

  if (v11)
  {
    if (objc_msgSend(v8, "objectType"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1001, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v13);

    }
    else
    {
      objc_msgSend(v8, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "referenceForWorkflowID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v22[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __71__VCVoiceShortcutManager_getValueForDescriptor_resultClass_completion___block_invoke;
        v19[3] = &unk_1E7AA6FA8;
        v20 = v9;
        -[objc_class getObjectsFromReferences:databaseProvider:completion:](a4, "getObjectsFromReferences:databaseProvider:completion:", v16, v17, v19);

        v18 = v20;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1002, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, 0, v18);
      }

    }
  }
  else
  {
    v9[2](v9, 0, v12);
  }

}

- (void)requestDataMigrationWithCompletion:(id)a3
{
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 723, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  getWFGeneralLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[VCVoiceShortcutManager requestDataMigrationWithCompletion:]";
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Data migration requested", buf, 0xCu);
  }

  VCOSTransactionWithName((uint64_t)CFSTR("voiceShortcutManager.sync.vocabulary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 1, 0);
  objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DC8018];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v9, 0);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__VCVoiceShortcutManager_requestDataMigrationWithCompletion___block_invoke;
  v11[3] = &unk_1E7AA5898;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0DD9D70], "migrateWebClipsIfNeededWithDatabaseAccessor:", v11);
  -[VCVoiceShortcutManager requestShortcutsSpotlightFullReindex](self, "requestShortcutsSpotlightFullReindex");

}

- (void)createShortcutWithRecordData:(id)a3 name:(id)a4 shortcutSource:(id)a5 accessSpecifier:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    if (v16)
      goto LABEL_3;
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 757, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessSpecifier"));

    if (v17)
      goto LABEL_4;
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 756, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowRecordData"));

  if (!v16)
    goto LABEL_37;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 758, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  if ((objc_msgSend(v16, "allowShortcutImport") & 1) != 0)
  {
    -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v18, "databaseWithError:", &v42);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v42;

    if (v19)
    {
      VCOSTransactionWithName((uint64_t)CFSTR("createShortcutWithRecord"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      getWFGeneralLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
        _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_DEBUG, "%s Deserializing workflow record from data", buf, 0xCu);
      }

      v41 = 0;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9F08]), "initWithFileData:name:error:", v13, v14, &v41);
      v23 = v41;
      v24 = v23;
      if (v22)
      {
        v40 = v23;
        objc_msgSend(v22, "recordRepresentationWithError:", &v40);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v40;

        if (v25)
        {
          if (v15)
            objc_msgSend(v25, "setSource:", v15);
          objc_msgSend(v25, "addWatchWorkflowTypeIfEligible");
          getWFGeneralLogObject();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
            v45 = 2112;
            v46 = v25;
            _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_DEBUG, "%s Creating new shortcut from record (%@)", buf, 0x16u);
          }

          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9F00]), "initWithRecord:", v25);
          objc_msgSend(v19, "createWorkflowWithOptions:nameCollisionBehavior:error:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v20;

          getWFGeneralLogObject();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v27)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
              v45 = 2112;
              v46 = v27;
              _os_log_impl(&dword_1C146A000, v29, OS_LOG_TYPE_DEBUG, "%s Successfully added shortcut: %@", buf, 0x16u);
            }

            VCVoiceShortcutFromWorkflow(v27, v19, 0, 1, v17);
            v20 = v37;
          }
          else
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
              v45 = 2112;
              v46 = v37;
              _os_log_impl(&dword_1C146A000, v29, OS_LOG_TYPE_ERROR, "%s Error adding VoiceShortcut: %@", buf, 0x16u);
            }

            v20 = v37;
            (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v37);
          }

          v24 = v38;
        }
        else
        {
          getWFGeneralLogObject();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
            v45 = 2112;
            v46 = v38;
            _os_log_impl(&dword_1C146A000, v32, OS_LOG_TYPE_ERROR, "%s Error creating workflow record: %@", buf, 0x16u);
          }

          v24 = v38;
          (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v38);
        }

      }
      else
      {
        getWFGeneralLogObject();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
          v45 = 2112;
          v46 = v24;
          _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_ERROR, "%s Error creating workflow file: %@", buf, 0x16u);
        }

        (*((void (**)(id, _QWORD, void *))v17 + 2))(v17, 0, v24);
      }

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v20);
    }

  }
  else
  {
    getWFGeneralLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
      v45 = 2114;
      v46 = v16;
      _os_log_impl(&dword_1C146A000, v30, OS_LOG_TYPE_ERROR, "%s Unauthorized add attempt for shared shortcut with record using accessSpecifier (%{public}@)", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1011, CFSTR("Unauthorized add attempt for shared shortcut with recordusing accessSpecifier (%@)"), v16);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v20);
  }

}

- (void)logHomescreenFastPathRunEventForShortcutWithWebClip:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutManager.m"), 844, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata"));

  }
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v6, "databaseWithError:", &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;

  if (v7)
  {
    objc_msgSend(v5, "shortcutIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("source"), CFSTR("galleryIdentifier"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v9, 0);
    v27 = v8;
    objc_msgSend(v7, "recordWithDescriptor:properties:error:", v11, v10, &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;

    if (v12)
    {
      WFHomescreenFastPathRunShortcutEvent(v5, v12, CFSTR("RunShortcutStart"));
      v24 = objc_claimAutoreleasedReturnValue();
      WFHomescreenFastPathRunShortcutEvent(v5, v12, (void *)*MEMORY[0x1E0DD9FA0]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      WFHomescreenFastPathRunActionEvent(v5, v12, CFSTR("RunActionStart"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      WFHomescreenFastPathRunActionEvent(v5, v12, CFSTR("RunActionFinish"));
      v26 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject track](v24, "track");
      objc_msgSend(v14, "track");
      objc_msgSend(v12, "name");
      v16 = v11;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueVisibleReferenceForWorkflowName:", v17);
      v18 = v9;
      v19 = v13;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v7, "logRunOfWorkflow:withSource:triggerID:", v20, *MEMORY[0x1E0DC8468], 0);

      v13 = v19;
      v9 = v18;

      v11 = v16;
      v22 = v24;
      objc_msgSend(v15, "track");
      objc_msgSend(v25, "track");

      v10 = v26;
    }
    else
    {
      getWFGeneralLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[VCVoiceShortcutManager logHomescreenFastPathRunEventForShortcutWithWebClip:]";
        v31 = 2112;
        v32 = v11;
        v33 = 2112;
        v34 = v13;
        _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_ERROR, "%s Unable to log homescreen run event because there was no record that matched the descriptor: %@, error: %@", buf, 0x20u);
      }
    }

  }
  else
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[VCVoiceShortcutManager logHomescreenFastPathRunEventForShortcutWithWebClip:]";
      v31 = 2112;
      v32 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Unable to log homescreen run event because database initialization failed: %@", buf, 0x16u);
    }
    v13 = v8;
  }

}

- (void)setPerWorkflowStateData:(id)a3 forSmartPromptWithActionUUID:(id)a4 reference:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v11, "databaseWithError:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  v15 = v13;
  objc_msgSend(v12, "saveSmartPromptStateData:actionUUID:reference:error:", v10, v9, v8, &v15);

  v14 = v15;
}

- (void)getSiriAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "databaseWithError:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  v13 = v10;
  v11 = objc_msgSend(v9, "isSiriEnabledForAutoShortcutsWithBundleIdentifier:error:", v7, &v13);

  v12 = v13;
  v6[2](v6, v11, v12);

}

- (void)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, id);
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v8 = (void (**)(id, id))a5;
  v9 = a4;
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "databaseWithError:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  v14 = v12;
  objc_msgSend(v11, "setSiriAutoShortcutsEnablement:forBundleIdentifier:source:error:", v6, v9, 0, &v14);

  v13 = v14;
  v8[2](v8, v13);

}

- (void)updateAppShortcutsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[VCVoiceShortcutManager appShortcutsUpdater](self, "appShortcutsUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__VCVoiceShortcutManager_updateAppShortcutsWithCompletion___block_invoke;
  v7[3] = &unk_1E7AA8398;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateWithCompletion:", v7);

}

- (void)serializedParametersForAppEntityIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "databaseWithError:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  v13 = v10;
  objc_msgSend(v9, "serializedParametersForIdentifier:error:", v7, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  v6[2](v6, v11, v12);

}

- (void)storeSerializedParameters:(id)a3 forAppEntityIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 completion:(id)a7
{
  void (**v12)(id, id);
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v12 = (void (**)(id, id))a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v16, "databaseWithError:", &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;

  v20 = v18;
  objc_msgSend(v17, "storeSerializedParameters:forIdentifier:queryName:badgeType:error:", v15, v14, v13, a6, &v20);

  v19 = v20;
  v12[2](v12, v19);

}

- (void)removeAllSerializedParametersForQueryName:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v8, "databaseWithError:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  v12 = v10;
  objc_msgSend(v9, "removeAllSerializedParametersForQueryName:error:", v7, &v12);

  v11 = v12;
  v6[2](v6, v11);

}

- (void)applicationWasUnregistered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  NSObject *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "userInfo");
      v9 = objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[VCVoiceShortcutManager applicationWasUnregistered:]";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEBUG, "%s Ignoring placeholder uninstall event: (%@)", (uint8_t *)&v14, 0x16u);
LABEL_8:

    }
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    VCInactiveAppsFromList();
    v8 = objc_claimAutoreleasedReturnValue();

    if (!-[NSObject count](v8, "count"))
    {
      getWFGeneralLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "name");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[VCVoiceShortcutManager applicationWasUnregistered:]";
        v16 = 2112;
        v17 = v12;
        v18 = 2112;
        v19 = v13;
        _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Received (%@) launch event, but no bundle identifiers were supplied. Exiting. UserInfo: (%@)", (uint8_t *)&v14, 0x20u);

      }
      goto LABEL_8;
    }
    -[VCVoiceShortcutManager deleteSuggestionsFromApps:](self, "deleteSuggestionsFromApps:", v8);
  }

}

- (void)badgeTypeForEntityIdentifier:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[VCVoiceShortcutManager databaseProvider](self, "databaseProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v7, "serializedParametersForIdentifier:error:", v9, a4);
}

- (void)archiveAction:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForKey:", CFSTR("name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v9, "parameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __70__VCVoiceShortcutManager_archiveAction_withActionMetadata_completion___block_invoke;
  v35[3] = &unk_1E7AA58C0;
  v18 = v15;
  v36 = v18;
  v19 = v16;
  v37 = v19;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v35);

  -[VCVoiceShortcutManager actionWithSerializedParameters:actionMetadata:](self, "actionWithSerializedParameters:actionMetadata:", v19, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v33 = v12;
    v21 = (void *)MEMORY[0x1E0C99E08];
    v38 = CFSTR("SerializedParameters");
    objc_msgSend(v20, "serializedParameters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dictionaryWithDictionary:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("ClientVersion"));
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToMemory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "open");
    v34 = 0;
    v28 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v24, v27, 200, 0, &v34);
    v29 = v34;
    objc_msgSend(v27, "close");
    if (v28 <= 0)
    {
      getWFAppIntentsLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[VCVoiceShortcutManager archiveAction:withActionMetadata:completion:]";
        _os_log_impl(&dword_1C146A000, v32, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to convert action to data", buf, 0xCu);
      }

      VCVoiceShortcutClientArchingError(CFSTR("Failed to archive App Intent"), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v30);
    }
    else
    {
      objc_msgSend(v27, "propertyForKey:", *MEMORY[0x1E0C99868]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v8)[2](v8, v30, 0);
    }

    v12 = v33;
  }
  else
  {
    getWFAppIntentsLogObject();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[VCVoiceShortcutManager archiveAction:withActionMetadata:completion:]";
      _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to convert to LinkAction", buf, 0xCu);
    }

    VCVoiceShortcutClientArchingError(CFSTR("Failed to archive App Intent"), 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v29);
  }

}

- (void)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[4];
  void (**v26)(id, _QWORD, void *);
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = (objc_class *)MEMORY[0x1E0C99DB0];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithData:", v11);

  objc_msgSend(v12, "open");
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v12, 0, 0, &v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v27;
  objc_msgSend(v12, "close");
  if (v13)
  {
    v15 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v17, "objectForKey:", CFSTR("SerializedParameters"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      getWFAppIntentsLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[VCVoiceShortcutManager unarchiveActionFromData:withActionMetadata:completion:]";
        _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Unrecognized data format", buf, 0xCu);
      }

      VCVoiceShortcutClientArchingError(CFSTR("Failed to unarchive App Intent"), v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v20);

    }
    -[VCVoiceShortcutManager actionWithSerializedParameters:actionMetadata:](self, "actionWithSerializedParameters:actionMetadata:", v18, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __80__VCVoiceShortcutManager_unarchiveActionFromData_withActionMetadata_completion___block_invoke;
      v25[3] = &unk_1E7AA58E8;
      v26 = v9;
      objc_msgSend(v21, "getLinkActionForArchivingFallingBackToDefaultValue:completionHandler:", 0, v25);
      v22 = v26;
    }
    else
    {
      getWFAppIntentsLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[VCVoiceShortcutManager unarchiveActionFromData:withActionMetadata:completion:]";
        _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to convert to LinkAction", buf, 0xCu);
      }

      VCVoiceShortcutClientArchingError(CFSTR("Failed to unarchive App Intent"), v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v22);
    }

  }
  else
  {
    getWFAppIntentsLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[VCVoiceShortcutManager unarchiveActionFromData:withActionMetadata:completion:]";
      _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to convert incoming data", buf, 0xCu);
    }

    v9[2](v9, 0, v14);
  }

}

- (id)actionWithSerializedParameters:(id)a3 actionMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "effectiveBundleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "if_firstObjectPassingTest:", &__block_literal_global);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bundleIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_4;
  v12 = objc_alloc(MEMORY[0x1E0CA5848]);
  objc_msgSend(v7, "effectiveBundleIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v16 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:error:", v15, &v25);
  v11 = v25;

  if (v16)
  {
    objc_msgSend(v16, "if_containingAppRecord");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v18;
LABEL_4:
    objc_msgSend(v7, "identifier");
    v19 = objc_claimAutoreleasedReturnValue();
    -[VCVoiceShortcutManager actionWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:](self, "actionWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", v11, v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  getWFAppIntentsLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "effectiveBundleIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v27 = "-[VCVoiceShortcutManager actionWithSerializedParameters:actionMetadata:]";
    v28 = 2114;
    v29 = v24;
    _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Unable to find the bundle record for %{public}@", buf, 0x16u);

  }
  v20 = 0;
LABEL_5:

  return v20;
}

- (id)actionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameters:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DD9D98];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringByAppendingString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9C20]), "initWithActionIdentifier:serializedParameters:", v13, v8);
  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createActionsForRequests:", v15);

  objc_msgSend(v14, "result");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  objc_msgSend(v18, "initializeParametersIfNecessary");
  return v18;
}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameterStates:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, _QWORD))a6;
  getWFAppIntentsLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v19 = 136315906;
    v20 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:serializedParameterStates:completion:]";
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_INFO, "%s Creating an app intent representation for %@ (%@) from serialized parameters: %@", (uint8_t *)&v19, 0x2Au);
  }

  -[VCVoiceShortcutManager actionWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:](self, "actionWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "linkActionWithSerializedParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v17, 0);
  }
  else
  {
    getWFAppIntentsLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:serializedParameterStates:completion:]";
      _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed to create a LinkAction", (uint8_t *)&v19, 0xCu);
    }

    VCVoiceShortcutClientArchingError(CFSTR("Failed to create LinkAction"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v13)[2](v13, 0, v17);
  }

}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 expandingParameterName:(id)a5 limit:(int64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, void *, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  void (**v49)(id, void *, void *, _QWORD);
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  uint8_t buf[4];
  const char *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, void *, _QWORD))a7;
  -[VCVoiceShortcutManager actionWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:](self, "actionWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", v11, v12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "linkActionWithSerializedParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0DD9D98], "sharedProvider");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "actionMetadataByAppBundleIdentifier:actionIdentifier:", v11, v12);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "parameters");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke;
      v53[3] = &unk_1E7AA5950;
      v19 = v13;
      v54 = v19;
      objc_msgSend(v18, "if_firstObjectPassingTest:", v53);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v20, "valueType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "wf_enumValueType");
        v22 = objc_claimAutoreleasedReturnValue();

        v43 = v20;
        objc_msgSend(v20, "valueType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "wf_entityValueType");
        v24 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v22;
        if (v22 | v24)
        {
          if (v22)
          {
            v42 = v24;
            objc_msgSend((id)v22, "enumerationIdentifier");
            v26 = (void *)v22;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "enumMetadataByAppBundleIdentifier:enumIdentifier:", v11, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              objc_msgSend(v28, "cases");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v50[0] = MEMORY[0x1E0C809B0];
              v50[1] = 3221225472;
              v50[2] = __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_259;
              v50[3] = &unk_1E7AA5978;
              v41 = v26;
              v51 = v26;
              v52 = v19;
              objc_msgSend(v29, "if_map:", v50);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              getWFAppIntentsLogObject();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v56 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParamet"
                      "erName:limit:completion:]";
                _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action with expanded requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
              }

              v14[2](v14, v17, v30, 0);
              v25 = v41;
            }
            else
            {
              v28 = 0;
              getWFAppIntentsLogObject();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v56 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParamet"
                      "erName:limit:completion:]";
                _os_log_impl(&dword_1C146A000, v39, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but could not expand requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
              }

              v14[2](v14, v17, 0, 0);
              v25 = v26;
            }
            v24 = v42;

          }
          else if (v24)
          {
            objc_msgSend((id)v24, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "entityMetadataByAppBundleIdentifier:entityIdentifier:", v11, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend(v16, "parameterForKey:", v19);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v46[0] = MEMORY[0x1E0C809B0];
              v46[1] = 3221225472;
              v46[2] = __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_263;
              v46[3] = &unk_1E7AA59C8;
              v49 = v14;
              v47 = v17;
              v48 = v19;
              objc_msgSend(v16, "loadPossibleStatesForEnumeration:searchTerm:completionHandler:", v38, 0, v46);

            }
            else
            {
              getWFAppIntentsLogObject();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v56 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParamet"
                      "erName:limit:completion:]";
                _os_log_impl(&dword_1C146A000, v40, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but could not expand requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
              }

              v14[2](v14, v17, 0, 0);
            }
            v25 = 0;

          }
        }
        else
        {
          getWFAppIntentsLogObject();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v56 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterNa"
                  "me:limit:completion:]";
            _os_log_impl(&dword_1C146A000, v35, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but requested expanding parameter does not support expanding. Returning the generated link action", buf, 0xCu);
          }

          v14[2](v14, v17, 0, 0);
        }

        v20 = v43;
      }
      else
      {
        getWFAppIntentsLogObject();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v56 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName"
                ":limit:completion:]";
          _os_log_impl(&dword_1C146A000, v34, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
        }

        v14[2](v14, v17, 0, 0);
      }

    }
    else
    {
      getWFAppIntentsLogObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:l"
              "imit:completion:]";
        _os_log_impl(&dword_1C146A000, v33, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action without expanding parameter succeed. Returning the generated link action", buf, 0xCu);
      }

      v14[2](v14, v17, 0, 0);
    }
  }
  else
  {
    getWFAppIntentsLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v56 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:limit:completion:]";
      _os_log_impl(&dword_1C146A000, v32, OS_LOG_TYPE_DEFAULT, "%s Failed to create a WFLinkAction", buf, 0xCu);
    }

    VCVoiceShortcutClientArchingError(CFSTR("Failed to create LinkAction"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *, void *))v14)[2](v14, 0, 0, v17);
  }

}

- (void)getMigratedAppIntentWithINIntent:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, id, _QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6[2](v6, v7, 0);
    v8 = v7;
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0DD9D98], "sharedProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "launchId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_className");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "customIntentMigratedActionIdentifierWithLaunchId:className:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0DD9C20]);
      v14 = (void *)objc_msgSend(v13, "initWithActionIdentifier:serializedParameters:", v12, MEMORY[0x1E0C9AA70]);
      v38[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createActionsForRequests:", v15);

      v35 = v14;
      objc_msgSend(v14, "result");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v12;
      v37 = v9;
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v22 = v17;

      objc_msgSend(v22, "serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:", v7, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "copyWithSerializedParameters:", v23);

      v25 = objc_alloc(MEMORY[0x1E0CBD738]);
      objc_msgSend(v24, "fullyQualifiedLinkActionIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "linkActionWithSerializedParameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "metadata");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v25, "initWithAppBundleIdentifier:linkAction:linkActionMetadata:", v27, v28, v29);

      objc_msgSend(v24, "metadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "effectiveBundleIdentifiers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "array");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "if_firstObjectPassingTest:", &__block_literal_global_271);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bundleIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setExtensionBundleId:", v34);

      v6[2](v6, v8, 0);
      v12 = v36;
      v9 = v37;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v7, "_className");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "launchId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "vc_voiceShortcutErrorWithCode:reason:", 11000, CFSTR("Unable to find an app intent matching %@ for %@"), v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(id, id, void *))v6)[2](v6, 0, v21);
      v8 = 0;
    }

  }
}

- (void)getSerializedParametersForLinkAction:(id)a3 actionMetadata:(id)a4 completion:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  WFLinkActionSerializedParametersForLNAction();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a5 + 2))(v6, v7, 0);

}

- (void)triggerFullContextualActionReindexWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VCVoiceShortcutManager contextualActionSyncService](self, "contextualActionSyncService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reindexAllSearchableItemsWithCompletion:", v4);

}

- (WFTopHitsAppShortcutsUpdater)appShortcutsUpdater
{
  return self->_appShortcutsUpdater;
}

- (void)setAppShortcutsUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_appShortcutsUpdater, a3);
}

- (WFContextualActionSpotlightSyncService)contextualActionSyncService
{
  return self->_contextualActionSyncService;
}

- (void)setContextualActionSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_contextualActionSyncService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualActionSyncService, 0);
  objc_storeStrong((id *)&self->_appShortcutsUpdater, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

BOOL __70__VCVoiceShortcutManager_getMigratedAppIntentWithINIntent_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

uint64_t __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_259(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0D43E30];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "displayRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithValue:valueType:displayRepresentation:", v6, v7, v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D43DA0]), "initWithIdentifier:value:", *(_QWORD *)(a1 + 40), v9);

  return v10;
}

void __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_263(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "allItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_264;
    v7[3] = &unk_1E7AA59A0;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v3, "if_map:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    getWFAppIntentsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:lim"
            "it:completion:]_block_invoke_2";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action with expanded requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    getWFAppIntentsLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:lim"
            "it:completion:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but could not expand requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

id __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_264(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D43DA0]);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:value:", v5, v6);

  return v7;
}

BOOL __72__VCVoiceShortcutManager_actionWithSerializedParameters_actionMetadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 0;
}

void __80__VCVoiceShortcutManager_unarchiveActionFromData_withActionMetadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = a3;
    getWFAppIntentsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[VCVoiceShortcutManager unarchiveActionFromData:withActionMetadata:completion:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to process LinkAction", (uint8_t *)&v9, 0xCu);
    }

    VCVoiceShortcutClientArchingError(CFSTR("Failed to unarchive App Intent"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__VCVoiceShortcutManager_archiveAction_withActionMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v14 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "valueType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wf_parameterDefinitionWithParameterMetadata:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parameterStateFromLinkValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serializedRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 40);
    objc_msgSend(v14, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  }
}

uint64_t __59__VCVoiceShortcutManager_updateAppShortcutsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __61__VCVoiceShortcutManager_requestDataMigrationWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "databaseProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v1, "databaseWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;

  if (!v2)
  {
    getWFGeneralLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[VCVoiceShortcutManager requestDataMigrationWithCompletion:]_block_invoke";
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Error opening database for web clip migration: %{public}@", buf, 0x16u);
    }

  }
  return v2;
}

void __71__VCVoiceShortcutManager_getValueForDescriptor_resultClass_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(a2, "firstObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32));
  }
}

void __68__VCVoiceShortcutManager_getResultsForQuery_resultClass_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v6 + 16))(v6, v8, v7, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v6 + 16))(v6, 0, 0, a3);
  }

}

void __48__VCVoiceShortcutManager_deleteStaleSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315394;
        v14 = "-[VCVoiceShortcutManager deleteStaleSuggestions]_block_invoke";
        v15 = 2114;
        v16 = v6;
        v9 = "%s Error deleting suggested shortcuts (%{public}@)";
        v10 = v8;
        v11 = OS_LOG_TYPE_ERROR;
        v12 = 22;
LABEL_8:
        _os_log_impl(&dword_1C146A000, v10, v11, v9, (uint8_t *)&v13, v12);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "-[VCVoiceShortcutManager deleteStaleSuggestions]_block_invoke";
      v9 = "%s No stale shortcut suggestions found.";
      v10 = v8;
      v11 = OS_LOG_TYPE_INFO;
      v12 = 12;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "deleteSuggestionsFromApps:", v5);
LABEL_10:

}

void __91__VCVoiceShortcutManager_drawGlyphs_withBackgroundColorValues_padding_rounded_intoContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unsigned __int16 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;

  v15 = a2;
  v5 = (void *)MEMORY[0x1C3BAFA00]();
  v6 = objc_msgSend(v15, "integerValue");
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E38]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", v9, v6, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E40]), "initWithIcon:drawerContext:", v10, *(_QWORD *)(a1 + 40));
  objc_msgSend(v11, "setDrawBackground:", v9 != 0);
  objc_msgSend(v11, "setRounded:", *(unsigned __int8 *)(a1 + 88));
  v12 = *(void **)(a1 + 48);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__VCVoiceShortcutManager_drawGlyphs_withBackgroundColorValues_padding_rounded_intoContext___block_invoke_2;
  v16[3] = &unk_1E7AA5820;
  v17 = v12;
  v18 = v11;
  v13 = *(_OWORD *)(a1 + 72);
  v19 = *(_OWORD *)(a1 + 56);
  v20 = v13;
  v14 = v11;
  objc_msgSend(v17, "accessBitmapContextForImageAtIndex:accessBlock:", a3, v16);

  objc_autoreleasePoolPop(v5);
}

void __91__VCVoiceShortcutManager_drawGlyphs_withBackgroundColorValues_padding_rounded_intoContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;

  v4 = objc_alloc(MEMORY[0x1E0DC79D0]);
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v5 = (id)objc_msgSend(v4, "initWithCGContext:scale:", a2);
  objc_msgSend(*(id *)(a1 + 40), "drawInContext:inRect:", v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

void __51__VCVoiceShortcutManager_phraseHasHomeKitConflict___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  BOOL v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BYTE buf[24];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v10 = (id *)getHMErrorDomainSymbolLoc_ptr;
  v20 = getHMErrorDomainSymbolLoc_ptr;
  if (!getHMErrorDomainSymbolLoc_ptr)
  {
    v11 = HomeKitLibrary();
    v10 = (id *)dlsym(v11, "HMErrorDomain");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v10;
    getHMErrorDomainSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(buf, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getHMErrorDomain(void)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("VCVoiceShortcutManager.m"), 53, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v12 = *v10;
  if (objc_msgSend(v9, "isEqualToString:", v12))
  {
    if (objc_msgSend(v8, "code") == 31)
    {

LABEL_13:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 ^ 1;
      goto LABEL_17;
    }
    v13 = objc_msgSend(v8, "code") == 95;
  }
  else
  {
    v13 = 0;
  }

  if (v8)
    v14 = v13;
  else
    v14 = 1;
  if ((v14 & 1) != 0)
    goto LABEL_13;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  getWFGeneralLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[VCVoiceShortcutManager phraseHasHomeKitConflict:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v20 = (uint64_t)v8;
    _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Encountered an error checking conflicting Home scene names for phrase (%@). Assuming no conflict. Error: (%@)", buf, 0x20u);
  }

LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __92__VCVoiceShortcutManager_deleteVoiceShortcutWithIdentifier_name_accessSpecifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  getWFGeneralLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)a1[4];
      v9 = a1[5];
      v15 = 136315650;
      v16 = "-[VCVoiceShortcutManager deleteVoiceShortcutWithIdentifier:name:accessSpecifier:completion:]_block_invoke";
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v10 = "%s Successfully deleted VoiceShortcut with identifier=%@, name=%@";
      v11 = v7;
      v12 = OS_LOG_TYPE_DEBUG;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315394;
    v16 = "-[VCVoiceShortcutManager deleteVoiceShortcutWithIdentifier:name:accessSpecifier:completion:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v10 = "%s Error deleting VoiceShortcut: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 22;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(a1[6] + 16))(a1[6], a2, v5, v14);
}

void __103__VCVoiceShortcutManager_updateVoiceShortcutWithIdentifier_phrase_shortcut_accessSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFGeneralLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315394;
      v14 = "-[VCVoiceShortcutManager updateVoiceShortcutWithIdentifier:phrase:shortcut:accessSpecifier:completion:]_block_invoke";
      v15 = 2112;
      v16 = v5;
      v9 = "%s Successfully updated VoiceShortcut %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v10, v11, v9, (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315394;
    v14 = "-[VCVoiceShortcutManager updateVoiceShortcutWithIdentifier:phrase:shortcut:accessSpecifier:completion:]_block_invoke";
    v15 = 2112;
    v16 = v6;
    v9 = "%s Error updating VoiceShortcut: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5, v6, v12);
}

uint64_t __103__VCVoiceShortcutManager_updateVoiceShortcutWithIdentifier_phrase_shortcut_accessSpecifier_completion___block_invoke_169(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__VCVoiceShortcutManager_addVoiceShortcut_phrase_accessSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFGeneralLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315394;
      v14 = "-[VCVoiceShortcutManager addVoiceShortcut:phrase:accessSpecifier:completion:]_block_invoke";
      v15 = 2112;
      v16 = v5;
      v9 = "%s Successfully created %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v10, v11, v9, (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315394;
    v14 = "-[VCVoiceShortcutManager addVoiceShortcut:phrase:accessSpecifier:completion:]_block_invoke";
    v15 = 2112;
    v16 = v6;
    v9 = "%s Error creating VoiceShortcut: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5, v6, v12);
}

void __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "sortedVisibleWorkflowsWithAssociatedAppBundleIdentifier:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke_2;
  v11[3] = &unk_1E7AA6FA8;
  v12 = v6;
  v10 = v6;
  VCVoiceShortcutsFromWorkflows(v8, v9, 0, (uint64_t)v11);

}

uint64_t __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__VCVoiceShortcutManager_getVoiceShortcutsWithAccessSpecifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__VCVoiceShortcutManager_getVoiceShortcutWithPhrase_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (a3)
  {
    VCNotFoundByPhraseError(*(void **)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48));
  }
}

void __84__VCVoiceShortcutManager_getVoiceShortcutWithIdentifier_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 48);
  if (a3)
  {
    VCNotFoundError(*(void **)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 48));
  }
}

@end
