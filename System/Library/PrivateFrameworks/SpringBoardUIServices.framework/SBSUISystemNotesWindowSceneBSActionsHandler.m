@implementation SBSUISystemNotesWindowSceneBSActionsHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v27 = (id)objc_msgSend(v7, "mutableCopy");
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v25 = v8;
    v11 = v8;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      v26 = *MEMORY[0x1E0D010D0];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_self();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_opt_isKindOfClass();

          if ((v19 & 1) != 0)
          {
            objc_msgSend(v27, "removeObject:", v17);
            objc_msgSend(v11, "delegate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "conformsToProtocol:", &unk_1EE7D2D08)
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v20, "notesSceneDidReceiveCreateNewNoteRequest:", v11);
              objc_msgSend(MEMORY[0x1E0D016A8], "response");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "sendResponse:", v21);
            }
            else
            {
              v22 = (void *)MEMORY[0x1E0D016A8];
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v26, 1, 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "responseForError:", v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "sendResponse:", v23);

            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    v8 = v25;
  }

  return v27;
}

- (id)_launchOptionsFromActions:(id)a3 forFBSScene:(id)a4 uiSceneSession:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  SBSUISystemNotesWindowSceneBSActionsHandler *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v29 = self;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = v9;
  v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v15)
  {
    v18 = 0;
    v24 = v14;
    goto LABEL_14;
  }
  v30 = v12;
  v16 = v11;
  v17 = v10;
  v18 = 0;
  v19 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(_QWORD *)v32 != v19)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;

        v18 = v22;
      }
      else
      {
        objc_msgSend(v13, "addObject:", v21, v29);
      }
    }
    v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v15);

  if (v18)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v23 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "connectionSource"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v25, CFSTR("_SBSUISystemNotesWindowSceneConnectionOptionsSceneConnectionSourceKey"));

    v10 = v17;
    v11 = v16;
    v12 = v30;
LABEL_14:

    goto LABEL_16;
  }
  v15 = 0;
  v10 = v17;
  v11 = v16;
  v12 = v30;
LABEL_16:
  SBLogSystemNotes();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[SBSUISystemNotesWindowSceneBSActionsHandler _launchOptionsFromActions:forFBSScene:uiSceneSession:transitionContext:].cold.1((uint64_t)v29, (uint64_t)v15, v26);

  v27 = objc_alloc_init(MEMORY[0x1E0CEAE98]);
  objc_msgSend(v27, "setLaunchOptionsDictionary:", v15);
  objc_msgSend(v27, "setUnprocessedActions:", v13);

  return v27;
}

- (void)_launchOptionsFromActions:(NSObject *)a3 forFBSScene:uiSceneSession:transitionContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138412546;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a2;
  v5 = v7;
  _os_log_debug_impl(&dword_1A471F000, a3, OS_LOG_TYPE_DEBUG, "[%@] passing launchOptions: %@", (uint8_t *)&v6, 0x16u);

}

@end
