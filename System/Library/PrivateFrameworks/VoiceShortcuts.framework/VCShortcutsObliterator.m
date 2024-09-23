@implementation VCShortcutsObliterator

- (VCShortcutsObliterator)initWithTriggerRegistrar:(id)a3 syncDataHandlers:(id)a4
{
  id v8;
  id v9;
  VCShortcutsObliterator *v10;
  VCShortcutsObliterator *v11;
  VCShortcutsObliterator *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCShortcutsObliterator.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncDataHandlers"));

  }
  v15.receiver = self;
  v15.super_class = (Class)VCShortcutsObliterator;
  v10 = -[VCShortcutsObliterator init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_triggerRegistrar, a3);
    objc_storeStrong((id *)&v11->_syncDataHandlers, a4);
    v12 = v11;
  }

  return v11;
}

- (void)obliterate:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  id *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  _QWORD v53[3];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  getWFObliteratorLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Starting obliterator", buf, 0xCu);
  }
  v39 = a3;

  getWFObliteratorLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Unregistering triggers...", buf, 0xCu);
  }

  -[VCShortcutsObliterator triggerRegistrar](self, "triggerRegistrar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterAllTriggers");

  getWFObliteratorLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_INFO, "%s Deleting keychain...", buf, 0xCu);
  }

  v46 = 0;
  v9 = -[VCShortcutsObliterator deleteKeychainItemsWithError:](self, "deleteKeychainItemsWithError:", &v46);
  v10 = v46;
  v11 = 0;
  if (!v9)
  {
    getWFObliteratorLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[VCShortcutsObliterator obliterate:]";
      v49 = 2114;
      v50 = v10;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_FAULT, "%s Deleting keychain failed with error: %{public}@", buf, 0x16u);
    }

    if (v10)
      v11 = v10;
    else
      v11 = 0;
  }
  getWFObliteratorLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_INFO, "%s Deleting app groups...", buf, 0xCu);
  }
  v38 = v10;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v14 = *MEMORY[0x1E0D14350];
  v53[0] = *MEMORY[0x1E0D142E8];
  v53[1] = v14;
  v53[2] = *MEMORY[0x1E0D14358];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        v21 = v18;
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v41 = v18;
        v23 = -[VCShortcutsObliterator deleteAppGroupWithIdentifier:error:](self, "deleteAppGroupWithIdentifier:error:", v22, &v41, v38);
        v18 = v41;

        if (!v23)
        {
          getWFObliteratorLogObject();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315650;
            v48 = "-[VCShortcutsObliterator obliterate:]";
            v49 = 2112;
            v50 = v22;
            v51 = 2114;
            v52 = v18;
            _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_FAULT, "%s Deleting the %@ app group failed with error: %{public}@", buf, 0x20u);
          }

          if (v18)
          {
            v25 = v18;

            v11 = v25;
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }

  getWFObliteratorLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_INFO, "%s Clearing user defaults...", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removePersistentDomainForName:", *MEMORY[0x1E0DC8010]);

  getWFObliteratorLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_INFO, "%s Clearing Siri Vocab...", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CBDCE8], "sharedVocabulary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_opt_new();
  objc_msgSend(v29, "setVocabularyStrings:ofType:", v30, 50000);

  getWFObliteratorLogObject();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C146A000, v31, OS_LOG_TYPE_INFO, "%s Deleting data vault...", buf, 0xCu);
  }

  v40 = 0;
  v32 = -[VCShortcutsObliterator deleteDataVaultWithError:](self, "deleteDataVaultWithError:", &v40);
  v33 = v40;
  if (!v32)
  {
    getWFObliteratorLogObject();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[VCShortcutsObliterator obliterate:]";
      v49 = 2114;
      v50 = v33;
      _os_log_impl(&dword_1C146A000, v34, OS_LOG_TYPE_FAULT, "%s Deleting data vault failed with error: %{public}@", buf, 0x16u);
    }

    if (v33)
    {
      v35 = v33;

      v11 = v35;
    }
  }
  getWFObliteratorLogObject();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C146A000, v36, OS_LOG_TYPE_INFO, "%s Resetting watch sync...", buf, 0xCu);
  }

  -[VCShortcutsObliterator resetWatchSync](self, "resetWatchSync");
  getWFObliteratorLogObject();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VCShortcutsObliterator obliterate:]";
    _os_log_impl(&dword_1C146A000, v37, OS_LOG_TYPE_INFO, "%s Finished obliterating", buf, 0xCu);
  }

  if (v39)
    *v39 = objc_retainAutorelease(v11);

}

- (BOOL)deleteKeychainItemsWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  OSStatus v7;
  OSStatus v8;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6898];
  v15[0] = *MEMORY[0x1E0CD6C98];
  v15[1] = v4;
  v5 = *MEMORY[0x1E0D14360];
  v16[0] = *MEMORY[0x1E0CD6CA8];
  v16[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = SecItemDelete(v6);
  v8 = v7;
  if (v7 != -25300 && v7 != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a3)
      *a3 = objc_retainAutorelease(v10);

  }
  if (v8)
    v12 = v8 == -25300;
  else
    v12 = 1;
  v13 = v12;

  return v13;
}

- (BOOL)deleteAppGroupWithIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCShortcutsObliterator.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v8 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "UTF8String");
  container_create_or_lookup_for_current_user();
  v9 = v8;
  v18 = v9;
  v10 = container_delete();
  v11 = v10 == 21 || v10 == 1;
  if (v10 != 1 && v10 != 21)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Moving %@'s app group container out of its live location failed with error: %llu"), v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("VCShortcutsObliteratorErrorDomain"), 2, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v15);

  }
  return v11;
}

- (BOOL)deleteDataVaultWithError:(id *)a3
{
  uint64_t v4;
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DC7FD8];
  v16 = 0;
  v17 = 0;
  v5 = -[VCShortcutsObliterator terminateProcessWithIdentifier:assertion:error:](self, "terminateProcessWithIdentifier:assertion:error:", v4, &v17, &v16);
  v6 = v17;
  v7 = v16;
  v8 = v7;
  if (!v5 && v7)
  {
    getWFObliteratorLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[VCShortcutsObliterator deleteDataVaultWithError:]";
      v20 = 2114;
      v21 = v4;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_FAULT, "%s Terminating %{public}@ failed with error: %{public}@", buf, 0x20u);
    }

    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "wf_shortcutsDirectoryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12 = objc_msgSend(v11, "removeItemAtURL:error:", v10, &v15);
  v13 = v15;

  if (v6)
    objc_msgSend(v6, "invalidate");
  if (objc_msgSend(v13, "vc_isFileNotFound"))
  {

    v13 = 0;
    v12 = 1;
  }
  else if (a3 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    *a3 = v13;
  }

  return v12;
}

- (BOOL)terminateProcessWithIdentifier:(id)a3 assertion:(id *)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v20;
  id *v21;
  id v22;
  id v23;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCShortcutsObliterator.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", CFSTR("VCShortcutsObliterator is terminating Shortcuts processes upon a data obliteration request"));
  objc_msgSend(v12, "setMaximumTerminationResistance:", 40);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithPredicate:context:", v11, v12);
  v22 = 0;
  v23 = 0;
  v14 = objc_msgSend(v13, "execute:error:", &v23, &v22);
  v15 = v23;
  v16 = v22;
  if (a4)
    *a4 = objc_retainAutorelease(v15);
  if ((v14 & 1) == 0)
  {
    objc_msgSend(v16, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D87E40]))
    {
      v21 = a5;
      v18 = objc_msgSend(v16, "code");

      if (v18 != 3)
      {
        a5 = v21;
        if (!v21)
          goto LABEL_11;
        goto LABEL_10;
      }
      v17 = v16;
      v16 = 0;
      a5 = v21;
    }

    if (a5)
    {
LABEL_10:
      v16 = objc_retainAutorelease(v16);
      *a5 = v16;
    }
  }
LABEL_11:

  return v14;
}

- (void)resetWatchSync
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[VCShortcutsObliterator syncDataHandlers](self, "syncDataHandlers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("@distinctUnionOfArrays.services"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = v8;
          else
            v9 = 0;
        }
        else
        {
          v9 = 0;
        }
        v10 = v9;

        objc_msgSend(v10, "requestFullResync");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (WFTriggerRegistrar)triggerRegistrar
{
  return self->_triggerRegistrar;
}

- (NSSet)syncDataHandlers
{
  return self->_syncDataHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDataHandlers, 0);
  objc_storeStrong((id *)&self->_triggerRegistrar, 0);
}

void __61__VCShortcutsObliterator_deleteAppGroupWithIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a2 != 1 && a2 != 21)
  {
    getWFObliteratorLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[VCShortcutsObliterator deleteAppGroupWithIdentifier:error:]_block_invoke";
      v8 = 2114;
      v9 = v5;
      v10 = 2048;
      v11 = a2;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_FAULT, "%s container_delete for app group %{public}@ failed with error: %llu", (uint8_t *)&v6, 0x20u);
    }

  }
}

@end
