@implementation SBSAContainerPruningProvider

- (id)preferencesFromContext:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  Class v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  id v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t i;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  const __CFString *v43;
  const __CFString *v44;
  void *v45;
  SBSAContainerPruningProvider *v46;
  objc_super v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    goto LABEL_9;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = NSClassFromString(CFSTR("SBSAContext"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAContainerPruningProvider.m"), 26, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v9 = 0;
  }

  if (v9)
  {
    objc_msgSend(v9, "preferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "containsAnyOfSignals:", 3);
    v16 = objc_msgSend(v9, "flags") & 3;
    v17 = objc_msgSend(v14, "isCollisionImminent");
    v18 = v17;
    if (!v15 || v16 || (v17 & 1) != 0)
    {
      if (!v15)
      {
LABEL_44:

        goto LABEL_45;
      }
      SBLogSystemAperturePreferencesStackPruning();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v42 = objc_msgSend(v9, "queryIteration");
        v43 = &stru_1E8EC7EC0;
        v44 = CFSTR(" Pressing or Resizing,");
        if (!v16)
          v44 = &stru_1E8EC7EC0;
        *(_DWORD *)buf = 134349570;
        v51 = v42;
        v52 = 2112;
        v53 = v44;
        if (v18)
          v43 = CFSTR(" Collision Imminent");
        v54 = 2112;
        v55 = v43;
        _os_log_debug_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEBUG, "[%{public}lu] Deferring pruning because:%@%@", buf, 0x20u);
      }
    }
    else
    {
      v45 = v14;
      v46 = self;
      objc_msgSend(v14, "containerViewDescriptions");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v9, "elementContexts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v9, "minimumNumberOfContainers");
      v23 = objc_msgSend(v21, "count");
      if (v22 <= v23)
        v24 = v23;
      else
        v24 = v22;
      v25 = objc_msgSend(v9, "maximumNumberOfElements");
      if (v24 >= v25)
        v26 = v25;
      else
        v26 = v24;
      if (v26)
      {
        for (i = 0; v26 != i; ++i)
        {
          if (i >= v22)
          {
            if (i >= objc_msgSend(v21, "count"))
              continue;
            objc_msgSend(v21, "objectAtIndexedSubscript:", i);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v29)
              continue;
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = __55__SBSAContainerPruningProvider_preferencesFromContext___block_invoke;
            v48[3] = &unk_1E8EA6A60;
            v49 = v29;
            v28 = v29;
            -[NSObject bs_firstObjectPassingTest:](v19, "bs_firstObjectPassingTest:", v48);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
              objc_msgSend(v20, "addObject:", v30);

          }
          else
          {
            if (i >= -[NSObject count](v19, "count"))
            {
              v28 = 0;
            }
            else
            {
              -[NSObject objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:", i);
              v28 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v20, "addObject:", v28);
          }

        }
      }
      SBLogSystemAperturePreferencesStackPruning();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);

      if (v32)
      {
        objc_msgSend(v9, "containerViewDescriptions");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "bs_compactMap:", &__block_literal_global_139);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "bs_compactMap:", &__block_literal_global_139);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "bs_differenceWithArray:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "count"))
        {
          SBLogSystemAperturePreferencesStackPruning();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            -[SBSAContainerPruningProvider preferencesFromContext:].cold.1(v9, v36, v37);

        }
      }
      v38 = objc_msgSend(v45, "copyByUpdatingContainerViewDescriptions:", v20);

      v39 = objc_msgSend(v9, "copyByUpdatingPreferences:", v38);
      v14 = (void *)v38;
      v9 = (id)v39;
      self = v46;
    }

    goto LABEL_44;
  }
LABEL_45:
  v47.receiver = self;
  v47.super_class = (Class)SBSAContainerPruningProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v47, sel_preferencesFromContext_, v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

uint64_t __55__SBSAContainerPruningProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "associatedSystemApertureElementIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

uint64_t __55__SBSAContainerPruningProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "interfaceElementIdentifier");
}

- (void)preferencesFromContext:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "queryIteration");
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134349314;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "[%{public}lu] Performing pruning and removing container with identifier: %@", (uint8_t *)&v7, 0x16u);

}

@end
