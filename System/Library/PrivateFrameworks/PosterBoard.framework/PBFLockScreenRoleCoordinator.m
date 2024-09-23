@implementation PBFLockScreenRoleCoordinator

- (PBFLockScreenRoleCoordinator)initWithStorage:(id)a3 modelCoordinatorProvider:(id)a4 providers:(id)a5
{
  uint64_t v8;
  objc_super v10;

  v8 = *MEMORY[0x1E0D7FC58];
  v10.receiver = self;
  v10.super_class = (Class)PBFLockScreenRoleCoordinator;
  return -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:](&v10, sel_initWithRole_storage_modelCoordinatorProvider_providers_, v8, a3, a4, a5);
}

+ (BOOL)supportsSupplementalUpdates
{
  return 1;
}

- (BOOL)synchronizeFileSystemAttributesForStorage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t i;
  void *v9;
  PBFLockScreenRoleCoordinator *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  BOOL v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PBFLockScreenRoleCoordinator;
  v25 = a4;
  if (-[PBFPosterRoleCoordinator synchronizeFileSystemAttributesForStorage:error:](&v30, sel_synchronizeFileSystemAttributesForStorage_error_, v6, a4))
  {
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v6);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "orderedPosters");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v27;
      v7 = (void *)*MEMORY[0x1E0D7FC28];
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v10 = self;
          objc_msgSend((id)objc_opt_class(), "supportedAttributes");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "attributesForPoster:ofTypes:", v9, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "configuredPropertiesForPoster:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "focusConfiguration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKey:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          PBFLogRoleCoordinator();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            -[PBFPosterRoleCoordinator role](v10, "role");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v32 = v17;
            v33 = 2112;
            v34 = v9;
            v35 = 2112;
            v36 = v14;
            _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Synchronizing configuration for poster %@ with disk focus %@", buf, 0x20u);

          }
          v18 = _PBFPosterRoleCoordinatorSynchronizeAttribute(v9, v7, v14, v15, 0, 0, v6, v25);

          if (!v18)
          {
            v19 = 0;
            goto LABEL_15;
          }
          self = v10;
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
        if (v23)
          continue;
        break;
      }
    }
    v19 = 1;
LABEL_15:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)defaultAttributesForNewPosterFromProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PBFLockScreenRoleCoordinator;
  v4 = a3;
  -[PBFPosterRoleCoordinator defaultAttributesForNewPosterFromProvider:](&v12, sel_defaultAttributesForNewPosterFromProvider_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy", v12.receiver, v12.super_class);

  v7 = (void *)MEMORY[0x1E0D7FB20];
  -[PBFPosterRoleCoordinator role](self, "role");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultHomeScreenConfigurationForProvider:role:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x1E0D7FC30]);
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

- (id)determineActivePosterConfigurationForStorage:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  id v49;
  id v50;
  id v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  uint64_t *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v6);
  else
    -[PBFPosterRoleCoordinator posterCollection](self, "posterCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterRoleCoordinator role](self, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pbf_desiredActiveConfigurationForRole:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__11;
  v64 = __Block_byref_object_dispose__11;
  objc_msgSend(v8, "posterWithUUID:", v10);
  v65 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFPosterRoleCoordinator posterConfigurationsSortedByLastActivatedDate:](self, "posterConfigurationsSortedByLastActivatedDate:", v8);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    PBFLogRoleCoordinator();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[PBFPosterRoleCoordinator role](self, "role");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)v61[5];
      *(_DWORD *)buf = 138543874;
      v67 = v12;
      v68 = 2114;
      v69 = v13;
      v70 = 2114;
      v71 = v10;
      _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: %{public}@/%{public}@ as active poster configuration", buf, 0x20u);

    }
  }
  objc_msgSend(v7, "pbf_activeFocusMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v15 = 1;
  else
    v15 = v14 == 0;
  v16 = !v15;

  if (v16)
  {
    objc_msgSend(v7, "pbf_activeFocusMode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activityUniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __85__PBFLockScreenRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke;
    v56[3] = &unk_1E86F6A20;
    v19 = v8;
    v57 = v19;
    v20 = v18;
    v58 = v20;
    v59 = &v60;
    objc_msgSend(v52, "enumerateObjectsWithOptions:usingBlock:", 2, v56);
    if (v61[5])
    {
      PBFLogRoleCoordinator();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v49 = v20;
        v50 = v6;
        -[PBFPosterRoleCoordinator role](self, "role");
        v51 = (id)objc_claimAutoreleasedReturnValue();
        v22 = (void *)v61[5];
        objc_msgSend(v19, "configuredPropertiesForPoster:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "focusConfiguration");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pbf_activeFocusMode");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "activityUniqueIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v67 = v51;
        v68 = 2112;
        v69 = v22;
        v70 = 2112;
        v71 = v24;
        v72 = 2112;
        v73 = v26;
        _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: %@ with focus configuration: %@ associated with active focus mode identifier: %@ as active poster configuration", buf, 0x2Au);

        v20 = v49;
        v6 = v50;

      }
    }
    else
    {
      PBFLogRoleCoordinator();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v20;
        -[PBFPosterRoleCoordinator role](self, "role");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pbf_activeFocusMode");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "activityUniqueIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v28;
        v68 = 2112;
        v69 = v30;
        _os_log_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: did not find poster associated with active focus mode identifier: %@", buf, 0x16u);

        v20 = v27;
      }
    }

  }
  if (!v61[5])
  {
    objc_msgSend(v8, "selectedPoster");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == 0;

    if (!v32)
    {
      objc_msgSend(v8, "selectedPoster");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v61[5];
      v61[5] = v33;

      PBFLogRoleCoordinator();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        -[PBFPosterRoleCoordinator role](self, "role");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)v61[5];
        *(_DWORD *)buf = 138543618;
        v67 = v36;
        v68 = 2112;
        v69 = v37;
        _os_log_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: using selected poster: %@ as active poster configuration", buf, 0x16u);

      }
      objc_msgSend(v8, "configuredPropertiesForPoster:", v61[5]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "focusConfiguration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        PBFLogRoleCoordinator();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          -[PBFPosterRoleCoordinator role](self, "role");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)v61[5];
          *(_DWORD *)buf = 138543618;
          v67 = v41;
          v68 = 2112;
          v69 = v42;
          _os_log_impl(&dword_1CB9FA000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: selected poster: %@ is still tied to a focus", buf, 0x16u);

        }
      }

    }
  }
  v43 = (void *)v61[5];
  if (!v43)
  {
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __85__PBFLockScreenRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke_5;
    v53[3] = &unk_1E86F6A48;
    v54 = v8;
    v55 = &v60;
    objc_msgSend(v52, "enumerateObjectsWithOptions:usingBlock:", 2, v53);
    PBFLogRoleCoordinator();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      -[PBFPosterRoleCoordinator role](self, "role");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)v61[5];
      *(_DWORD *)buf = 138543618;
      v67 = v45;
      v68 = 2112;
      v69 = v46;
      _os_log_impl(&dword_1CB9FA000, v44, OS_LOG_TYPE_DEFAULT, "[%{public}@] Choosing active poster: using most recently used poster: %@ with no focus as active poster configuration", buf, 0x16u);

    }
    v43 = (void *)v61[5];
  }
  v47 = v43;

  _Block_object_dispose(&v60, 8);
  return v47;
}

void __85__PBFLockScreenRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configuredPropertiesForPoster:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "focusConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "activityUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __85__PBFLockScreenRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configuredPropertiesForPoster:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "focusConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)notifyEventWasReceived:(id)a3 changes:(id *)a4 storage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint64_t v18;

  v8 = a3;
  v9 = a5;
  if (-[PBFPosterRoleCoordinator validateEventIsRelevant:](self, "validateEventIsRelevant:", v8))
  {
    -[PBFPosterRoleCoordinator role](self, "role");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    v17.receiver = self;
    v17.super_class = (Class)PBFLockScreenRoleCoordinator;
    v18 = 0;
    v12 = -[PBFPosterRoleCoordinator notifyEventWasReceived:changes:storage:](&v17, sel_notifyEventWasReceived_changes_storage_, v8, &v18, v9);
    if (v12)
      objc_msgSend(v11, "addObjectsFromArray:", v18);
    v13 = objc_msgSend(v11, "count");
    if (a4 && v13)
      *a4 = (id)objc_msgSend(v11, "copy");
    v14 = (void *)objc_opt_class();
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dumpResultsForEvent:role:posterCollection:changes:eventWasHandled:", v8, v10, v15, v11, v12);

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (id)supportedAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PBFLockScreenRoleCoordinator_supportedAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedAttributes_onceToken_0 != -1)
    dispatch_once(&supportedAttributes_onceToken_0, block);
  return (id)supportedAttributes_supportedAttributes_0;
}

void __51__PBFLockScreenRoleCoordinator_supportedAttributes__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___PBFLockScreenRoleCoordinator;
  objc_msgSendSuper2(&v8, sel_supportedAttributes);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  objc_msgSend(v5, "addObject:", *MEMORY[0x1E0D7FC28]);
  objc_msgSend(v5, "addObject:", *MEMORY[0x1E0D7FC30]);
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)supportedAttributes_supportedAttributes_0;
  supportedAttributes_supportedAttributes_0 = v6;

}

+ (id)supportedChangeTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PBFLockScreenRoleCoordinator_supportedChangeTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedChangeTypes_onceToken_0 != -1)
    dispatch_once(&supportedChangeTypes_onceToken_0, block);
  return (id)supportedChangeTypes_supportedChangeTypes_0;
}

void __52__PBFLockScreenRoleCoordinator_supportedChangeTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E20];
  v9[0] = CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___PBFLockScreenRoleCoordinator;
  objc_msgSendSuper2(&v8, sel_supportedChangeTypes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  v6 = objc_msgSend(v4, "copy");
  v7 = (void *)supportedChangeTypes_supportedChangeTypes_0;
  supportedChangeTypes_supportedChangeTypes_0 = v6;

}

- (BOOL)_executeChange:(id)a3 storage:(id)a4 outEvents:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  uint64_t v31;
  int v32;
  id v33;
  objc_class *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  char v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  uint64_t v62;
  unsigned __int8 v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  int v72;
  void *v73;
  id v74;
  PBFLockScreenRoleCoordinator *v75;
  id v76;
  void *v77;
  void *v78;
  id *v79;
  id *v80;
  void *v81;
  void *v82;
  id v83;
  objc_super v84;
  _QWORD v85[2];
  _QWORD v86[4];

  v86[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "changeType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties"));

  if ((v13 & 1) != 0)
  {
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"));
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "posterWithUUID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyConfiguredProperties"));
    v19 = objc_claimAutoreleasedReturnValue();

    if (v16)
      v20 = v17 == 0;
    else
      v20 = 1;
    v82 = (void *)v19;
    if (v20 || v19 == 0)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v85[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
      objc_msgSend(v10, "description");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = CFSTR("(null change)");
      if (v23)
        v25 = (const __CFString *)v23;
      v85[1] = CFSTR("posterUUIDToUpdate");
      v26 = CFSTR("(null uuid)");
      if (v16)
        v26 = (const __CFString *)v16;
      v86[0] = v25;
      v86[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
      v27 = (void *)v16;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v28);
      v29 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    }
    v78 = (void *)v16;
    v79 = a5;
    objc_msgSend(v17, "_path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "serverIdentity");
    v31 = objc_claimAutoreleasedReturnValue();

    v83 = 0;
    v32 = objc_msgSend(v14, "isPosterConfigurationAnAssociatedPoster:parentPoster:", v17, &v83);
    v33 = v83;
    v80 = a6;
    v81 = (void *)v31;
    v76 = v11;
    v77 = v17;
    v75 = self;
    if (v32)
    {
      v34 = (objc_class *)MEMORY[0x1E0D7FA60];
      v35 = v83;
      v36 = [v34 alloc];
      objc_msgSend(v17, "_path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pbf_posterUUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "pbf_posterUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "supportedAttributes");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v17;
      v42 = v33;
      objc_msgSend(v14, "attributesForPoster:ofTypes:", v41, v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v36, "initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:", v37, v38, v39, v31, v82, v43);
LABEL_38:

      v11 = v76;
      v29 = -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:](v75, "_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:", v24, v10, v14, v76, v79, v80);

      v28 = v81;
      v17 = v77;
      v27 = v78;
LABEL_39:

      goto LABEL_40;
    }
    v74 = v83;
    v44 = v83;
    objc_msgSend((id)objc_opt_class(), "supportedAttributes");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v14;
    objc_msgSend(v14, "attributesForPoster:ofTypes:", v17, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "mutableCopy");
    v48 = v47;
    if (v47)
      v49 = v47;
    else
      v49 = (id)objc_opt_new();
    v50 = v49;

    objc_msgSend(v82, "focusConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v51 = *MEMORY[0x1E0D7FC28];
      objc_msgSend(v50, "objectForKey:", *MEMORY[0x1E0D7FC28]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v38, "isEqual:", v52);

      if ((v53 & 1) != 0)
      {
        v72 = 0;
      }
      else
      {
        objc_msgSend(v50, "setObject:forKeyedSubscript:", v38, v51);
        v72 = 1;
      }
    }
    else
    {
      objc_msgSend(v50, "allKeys");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = *MEMORY[0x1E0D7FC28];
      v72 = objc_msgSend(v54, "containsObject:", *MEMORY[0x1E0D7FC28]);

      objc_msgSend(v50, "removeObjectForKey:", v55);
    }
    objc_msgSend(v82, "homeScreenConfiguration");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      v57 = *MEMORY[0x1E0D7FC30];
      objc_msgSend(v50, "objectForKey:", *MEMORY[0x1E0D7FC30]);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v56, "isEqual:", v58);

      if ((v59 & 1) != 0)
      {
        v60 = v56;
        if (!v72)
        {
LABEL_37:
          v70 = objc_alloc(MEMORY[0x1E0D7FA60]);
          objc_msgSend(v17, "_path");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "pbf_posterUUID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v70, "initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:", v40, v43, v81, v82, v50);
          v37 = v50;
          v14 = v73;
          v42 = v74;
          v39 = v60;
          goto LABEL_38;
        }
      }
      else
      {
        v60 = v56;
        objc_msgSend(v50, "setObject:forKeyedSubscript:", v56, v57);
      }
    }
    else
    {
      v60 = 0;
      objc_msgSend(v50, "allKeys");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = *MEMORY[0x1E0D7FC30];
      v63 = objc_msgSend(v61, "containsObject:", *MEMORY[0x1E0D7FC30]);

      objc_msgSend(v50, "removeObjectForKey:", v62);
      if (((v63 | v72) & 1) == 0)
        goto LABEL_37;
    }
    v64 = *MEMORY[0x1E0D7FC48];
    objc_msgSend(v50, "objectForKeyedSubscript:", *MEMORY[0x1E0D7FC48]);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (v65)
      v67 = v65;
    else
      v67 = (id)objc_opt_new();
    v68 = v67;

    objc_msgSend(v68, "usageMetadataWithUpdatedLastModifiedDate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v50, "setObject:forKeyedSubscript:", v69, v64);
    goto LABEL_37;
  }
  v84.receiver = self;
  v84.super_class = (Class)PBFLockScreenRoleCoordinator;
  v29 = -[PBFPosterRoleCoordinator _executeChange:storage:outEvents:error:](&v84, sel__executeChange_storage_outEvents_error_, v10, v11, a5, a6);
LABEL_40:

  return v29;
}

- (BOOL)_prepareAttributesForIngestionForPoster:(id)a3 existingAttributes:(id)a4 incomingAttributes:(id)a5 proposedAttributesToDelete:(id *)a6 proposedAttributesToUpdate:(id *)a7 storage:(id)a8 currentCollection:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a9;
  v29.receiver = self;
  v29.super_class = (Class)PBFLockScreenRoleCoordinator;
  v18 = -[PBFPosterRoleCoordinator _prepareAttributesForIngestionForPoster:existingAttributes:incomingAttributes:proposedAttributesToDelete:proposedAttributesToUpdate:storage:currentCollection:error:](&v29, sel__prepareAttributesForIngestionForPoster_existingAttributes_incomingAttributes_proposedAttributesToDelete_proposedAttributesToUpdate_storage_currentCollection_error_, v16, a4, a5, a6, a7, a8, v17, a10);
  if (v18 && objc_msgSend(*a6, "containsObject:", *MEMORY[0x1E0D7FC28]))
  {
    objc_msgSend(v17, "posterWithUUID:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0D7FB50];
    objc_msgSend(v19, "_path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "removeFocusConfigurationForPath:error:", v21, a10);

    PBFLogRoleCoordinator();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[PBFPosterRoleCoordinator role](self, "role");
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (a10)
          v27 = (const __CFString *)*a10;
        else
          v27 = CFSTR("[unknown error]");
        *(_DWORD *)buf = 138543874;
        v31 = v25;
        v32 = 2114;
        v33 = v16;
        v34 = 2114;
        v35 = v27;
        _os_log_error_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to remove focus configuration after attribute deletion for poster %{public}@: %{public}@", buf, 0x20u);
        goto LABEL_9;
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[PBFPosterRoleCoordinator role](self, "role");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = (uint64_t)v26;
      v32 = 2114;
      v33 = v16;
      _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed focus configuration after attribute deletion for poster %{public}@", buf, 0x16u);
LABEL_9:

    }
  }

  return v18;
}

@end
