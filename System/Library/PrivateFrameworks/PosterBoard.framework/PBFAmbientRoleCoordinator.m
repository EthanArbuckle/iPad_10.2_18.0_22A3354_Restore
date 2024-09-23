@implementation PBFAmbientRoleCoordinator

- (PBFAmbientRoleCoordinator)initWithStorage:(id)a3 modelCoordinatorProvider:(id)a4 providers:(id)a5
{
  uint64_t v8;
  objc_super v10;

  v8 = *MEMORY[0x1E0D7FC00];
  v10.receiver = self;
  v10.super_class = (Class)PBFAmbientRoleCoordinator;
  return -[PBFPosterRoleCoordinator initWithRole:storage:modelCoordinatorProvider:providers:](&v10, sel_initWithRole_storage_modelCoordinatorProvider_providers_, v8, a3, a4, a5);
}

- (id)determineActivePosterConfigurationForStorage:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v6);
  else
    -[PBFPosterRoleCoordinator posterCollection](self, "posterCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterRoleCoordinator role](self, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pbf_activeChargerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pbf_currentActivePosterForRole:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v8, "orderedPosters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __82__PBFAmbientRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke;
    v25 = &unk_1E86F3C40;
    v15 = v8;
    v26 = v15;
    v16 = v10;
    v27 = v16;
    objc_msgSend(v14, "bs_firstObjectPassingTest:", &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      if (v12)
      {
        v18 = v12;
      }
      else
      {
        objc_msgSend(v15, "selectedPoster", v22, v23, v24, v25, v26);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v18;
      PBFLogRoleCoordinator();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v16;
        v30 = 2114;
        v31 = v17;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "No existing configuration tied to charger identifier %{public}@, selecting the active configuration %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    if (v11)
    {
      v19 = v11;
    }
    else
    {
      objc_msgSend(v8, "selectedPoster");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v19;
  }

  return v17;
}

uint64_t __82__PBFAmbientRoleCoordinator_determineActivePosterConfigurationForStorage_context___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "attributeForPoster:ofType:", a2, *MEMORY[0x1E0D7FC10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAssociatedWithChargerIdentifier:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (BOOL)synchronizeFileSystemAttributesForStorage:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  char v36;
  BOOL v37;
  id *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  void *v44;
  void *v45;
  void *v46;
  PBFAmbientRoleCoordinator *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)PBFAmbientRoleCoordinator;
  if (-[PBFPosterRoleCoordinator synchronizeFileSystemAttributesForStorage:error:](&v57, sel_synchronizeFileSystemAttributesForStorage_error_, v6, a4))
  {
    -[PBFPosterRoleCoordinator role](self, "role");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    PBFLogRoleCoordinator();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v59 = v42;
      _os_log_impl(&dword_1CB9FA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] synchronizeFileSystemAttributesForStorage", buf, 0xCu);
    }

    -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v8, "orderedPosters");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v50)
    {
      v49 = *(_QWORD *)v54;
      v51 = (void *)*MEMORY[0x1E0D7FC10];
      v52 = (void *)*MEMORY[0x1E0D7FC18];
      v39 = a4;
      v40 = v6;
      v47 = self;
      v48 = v8;
      while (2)
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v54 != v49)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v10, "pbf_posterProvider");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "supportedAttributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "attributesForPoster:ofTypes:", v10, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "objectForKeyedSubscript:", v51);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            -[PBFAmbientRoleCoordinator defaultAttribute:forNewPosterFromProvider:](self, "defaultAttribute:forNewPosterFromProvider:", v51, v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = _PBFPosterRoleCoordinatorSynchronizeAttribute(v10, v51, 0, 0, v15, 0, v6, a4);

            if (!v16)
              goto LABEL_29;
          }
          objc_msgSend(v8, "configuredPropertiesForPoster:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "ambientConfiguration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "objectForKey:", v52);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqual:", CFSTR("com.apple.ambient.AmbientUI.InfographPoster"))
            || objc_msgSend(v18, "supportedDataLayout") == 2 && objc_msgSend(v19, "supportedDataLayout") == 2)
          {
            PBFLogRoleCoordinator();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v59 = v42;
              v60 = 2114;
              v61 = v10;
              _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Synchronizing Ambient configuration for poster %{public}@", buf, 0x16u);
            }

            v21 = _PBFPosterRoleCoordinatorSynchronizeAttribute(v10, v52, v18, v19, 0, 0, v6, a4);
            v22 = 0;
            v23 = v19;
            v24 = 0;
            if (!v21)
              goto LABEL_28;
          }
          else
          {
            v46 = v19;
            -[PBFAmbientRoleCoordinator defaultAttribute:forNewPosterFromProvider:](self, "defaultAttribute:forNewPosterFromProvider:", v52, v11);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "_path");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "serverIdentity");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "descriptorIdentifier");
            v27 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v41, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v11, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "dynamicDescriptorStoreCoordinatorForIdentifier:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            v44 = v28;
            v45 = (void *)v27;
            if (v29)
            {
              v31 = v29;
            }
            else
            {
              objc_msgSend(v28, "staticDescriptorStoreCoordinatorForIdentifier:", v27);
              v31 = (id)objc_claimAutoreleasedReturnValue();
            }
            v32 = v31;

            v33 = (void *)MEMORY[0x1E0D7FB50];
            objc_msgSend(v32, "pathOfLatestVersion");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "loadAmbientConfigurationForPath:error:", v34, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            PBFLogRoleCoordinator();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v59 = v42;
              v60 = 2114;
              v61 = v10;
              _os_log_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to fix Ambient configuration for poster %{public}@", buf, 0x16u);
            }

            v6 = v40;
            v36 = _PBFPosterRoleCoordinatorSynchronizeAttribute(v10, v52, 0, 0, v22, v24, v40, v39);

            a4 = v39;
            v23 = v46;
            if ((v36 & 1) == 0)
            {
LABEL_28:

              v8 = v48;
LABEL_29:

              v37 = 0;
              goto LABEL_30;
            }
          }

          self = v47;
          v8 = v48;
        }
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v50)
          continue;
        break;
      }
    }
    v37 = 1;
LABEL_30:

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)defaultAttributesForNewPosterFromProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PBFAmbientRoleCoordinator;
  -[PBFPosterRoleCoordinator defaultAttributesForNewPosterFromProvider:](&v13, sel_defaultAttributesForNewPosterFromProvider_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = *MEMORY[0x1E0D7FC10];
  -[PBFAmbientRoleCoordinator defaultAttribute:forNewPosterFromProvider:](self, "defaultAttribute:forNewPosterFromProvider:", *MEMORY[0x1E0D7FC10], v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
  v9 = *MEMORY[0x1E0D7FC18];
  -[PBFAmbientRoleCoordinator defaultAttribute:forNewPosterFromProvider:](self, "defaultAttribute:forNewPosterFromProvider:", *MEMORY[0x1E0D7FC18], v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v9);
  v11 = (void *)objc_msgSend(v6, "copy");

  return v11;
}

- (id)defaultAttribute:(id)a3 forNewPosterFromProvider:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0D7FC18]))
  {
    if ((objc_msgSend(v6, "isEqual:", CFSTR("com.apple.ambient.AmbientUI.InfographPoster")) & 1) != 0)
    {
      v7 = 2;
    }
    else if ((objc_msgSend(v6, "isEqual:", CFSTR("com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider")) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend(v6, "isEqual:", CFSTR("com.apple.ClockPoster.ClockPosterExtension")))
    {
      v7 = 3;
    }
    else
    {
      v7 = 0;
    }
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAA8]), "initWithSupportedDataLayout:", v7);
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0D7FC10]))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D7FAA0]);
LABEL_13:
    v9 = v8;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

+ (id)supportedAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PBFAmbientRoleCoordinator_supportedAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedAttributes_onceToken_1 != -1)
    dispatch_once(&supportedAttributes_onceToken_1, block);
  return (id)supportedAttributes_supportedAttributes_1;
}

void __48__PBFAmbientRoleCoordinator_supportedAttributes__block_invoke(uint64_t a1)
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
  v8.super_class = (Class)&OBJC_METACLASS___PBFAmbientRoleCoordinator;
  objc_msgSendSuper2(&v8, sel_supportedAttributes);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  objc_msgSend(v5, "addObject:", *MEMORY[0x1E0D7FC18]);
  objc_msgSend(v5, "addObject:", *MEMORY[0x1E0D7FC10]);
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)supportedAttributes_supportedAttributes_1;
  supportedAttributes_supportedAttributes_1 = v6;

}

+ (id)subscribedEvents
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PBFAmbientRoleCoordinator_subscribedEvents__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (subscribedEvents_onceToken_0 != -1)
    dispatch_once(&subscribedEvents_onceToken_0, block);
  return (id)subscribedEvents_subscribedEvents_0;
}

void __45__PBFAmbientRoleCoordinator_subscribedEvents__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v1 = (void *)MEMORY[0x1E0C99E20];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___PBFAmbientRoleCoordinator;
  objc_msgSendSuper2(&v6, sel_subscribedEvents);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", CFSTR("PBFPosterDataStoreEventTypeDescriptorsUpdated"));
  objc_msgSend(v3, "addObject:", CFSTR("PBFPosterDataStoreEventTypeStaticDescriptorsUpdated"));
  objc_msgSend(v3, "addObject:", CFSTR("PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated"));
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)subscribedEvents_subscribedEvents_0;
  subscribedEvents_subscribedEvents_0 = v4;

}

- (BOOL)validateEventIsRelevant:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PBFAmbientRoleCoordinator;
  if (-[PBFPosterRoleCoordinator validateEventIsRelevant:](&v31, sel_validateEventIsRelevant_, v4))
  {
    objc_msgSend(v4, "eventType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", CFSTR("PBFPosterDataStoreEventTypeDescriptorsUpdated")) & 1) == 0
      && !objc_msgSend(v5, "isEqual:", CFSTR("PBFPosterDataStoreEventTypeStaticDescriptorsUpdated")))
    {
      v21 = 1;
      goto LABEL_25;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v4, "fromValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
LABEL_6:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v10), "role");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterRoleCoordinator role](self, "role");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
          if (v8)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v4, "toValue", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (!v14)
      {
        v21 = 1;
        goto LABEL_23;
      }
      v15 = v14;
      v16 = *(_QWORD *)v24;
LABEL_14:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "role");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterRoleCoordinator role](self, "role");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          v21 = 1;
          if (v15)
            goto LABEL_14;
          goto LABEL_23;
        }
      }
    }
    v21 = 0;
LABEL_23:

LABEL_25:
    goto LABEL_26;
  }
  v21 = 0;
LABEL_26:

  return v21;
}

- (BOOL)notifyEventWasReceived:(id)a3 changes:(id *)a4 storage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  PBFAmbientRoleCoordinator *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  __CFString *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  char v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  NSObject *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t k;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t m;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t n;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t ii;
  void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t jj;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v150;
  void *v151;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  id v168;
  void *v169;
  PBFAmbientRoleCoordinator *v170;
  void *v171;
  id v172;
  void *v173;
  uint64_t v174;
  void *v175;
  id v176;
  uint64_t v177;
  void *v178;
  id obj;
  id obja;
  objc_super v181;
  uint64_t v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  _QWORD v199[4];
  id v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  id v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[5];
  uint8_t v226[128];
  uint8_t buf[4];
  void *v228;
  uint64_t v229;
  const __CFString *v230;
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  uint64_t v235;

  v235 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v153 = v9;
  if (!-[PBFAmbientRoleCoordinator validateEventIsRelevant:](self, "validateEventIsRelevant:", v8))
  {
    LOBYTE(v13) = 0;
    goto LABEL_141;
  }
  -[PBFPosterRoleCoordinator role](self, "role");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  if (v9)
  {
    v12 = v9;
  }
  else
  {
    -[PBFPosterRoleCoordinator storage](self, "storage");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v12;
  if (objc_msgSend(v10, "isEqual:", CFSTR("PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated")))
  {
    +[PBFPosterRoleCoordinatorChange refreshRoleCoordinator:](PBFPosterRoleCoordinatorChange, "refreshRoleCoordinator:", v173);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v15);

    v172 = 0;
    v13 = 1;
    goto LABEL_134;
  }
  if ((objc_msgSend(v10, "isEqual:", CFSTR("PBFPosterDataStoreEventTypeDescriptorsUpdated")) & 1) == 0
    && !objc_msgSend(v10, "isEqual:", CFSTR("PBFPosterDataStoreEventTypeStaticDescriptorsUpdated")))
  {
    v172 = 0;
LABEL_94:
    v181.receiver = self;
    v181.super_class = (Class)PBFAmbientRoleCoordinator;
    v182 = 0;
    v13 = -[PBFPosterRoleCoordinator notifyEventWasReceived:changes:storage:](&v181, sel_notifyEventWasReceived_changes_storage_, v8, &v182, v14);
    if (v13)
      objc_msgSend(v11, "addObjectsFromArray:", v182);
    goto LABEL_134;
  }
  -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v14);
  v172 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqual:", CFSTR("PBFPosterDataStoreEventTypeDescriptorsUpdated")))
    v16 = 1;
  else
    v16 = 2;
  objc_msgSend(v8, "relatedProviders");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anyObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "relatedProviders");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self;
  v21 = v8;
  v22 = objc_msgSend(v19, "count");

  v170 = v20;
  if (v22 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[event relatedProviders] count] == 1"));
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFAmbientRoleCoordinator notifyEventWasReceived:changes:storage:].cold.1(a2, (uint64_t)v20, (uint64_t)v150);
    objc_msgSend(objc_retainAutorelease(v150), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC8314);
  }
  -[PBFAmbientRoleCoordinator defaultAttributesForNewPosterFromProvider:](v20, "defaultAttributesForNewPosterFromProvider:", v18);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v21;
  objc_msgSend(v21, "toValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v10;
  v155 = v14;
  v165 = v18;
  if (objc_msgSend(v18, "isEqual:", CFSTR("com.apple.PosterTester.SamplePoster")))
  {
    -[PBFPosterRoleCoordinator modelCoordinatorProvider](v20, "modelCoordinatorProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "providerForExtensionIdentifier:", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "posterExtensionInfoPlist");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "pbf_supportsGallery");

    if ((v27 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringArrayForKey:", CFSTR("ShowSamplePoster"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "containsObject:", v18);

      if ((v30 & 1) == 0)
      {

        v23 = (void *)MEMORY[0x1E0C9AA60];
      }
    }

  }
  v156 = v11;
  v158 = (void *)objc_opt_new();
  v164 = (void *)objc_opt_new();
  v166 = (void *)objc_opt_new();
  v218 = 0u;
  v219 = 0u;
  v220 = 0u;
  v221 = 0u;
  v31 = v23;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v218, v234, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v219;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v219 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * i);
        objc_msgSend(v36, "_path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "serverIdentity");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "type");

        if (v39 == v16)
        {
          objc_msgSend(v36, "_path");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "descriptorIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            objc_msgSend(v164, "setObject:forKeyedSubscript:", v36, v41);

        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v218, v234, 16);
    }
    while (v33);
  }

  v216 = 0u;
  v217 = 0u;
  v214 = 0u;
  v215 = 0u;
  objc_msgSend(v172, "orderedPosters");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v214, v233, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v215;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v215 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * j);
        objc_msgSend(v47, "pbf_posterProvider");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "isEqual:", v18);

        if (v49)
        {
          objc_msgSend(v47, "_path");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "descriptorIdentifier");
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v51
            || (objc_msgSend(v47, "pbf_posterProvider"),
                v52 = (void *)objc_claimAutoreleasedReturnValue(),
                v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.ambient.AmbientUI.InfographPoster")),
                v52,
                v51 = CFSTR("InfographPoster"),
                v53))
          {
            objc_msgSend(v164, "objectForKeyedSubscript:", v51);
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            if (v54)
            {
              objc_msgSend(v166, "objectForKey:", v51);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v55)
              {
                v55 = (void *)objc_opt_new();
                objc_msgSend(v166, "setObject:forKeyedSubscript:", v55, v51);
              }
              objc_msgSend(v55, "addObject:", v47);

            }
            else
            {
              objc_msgSend(v158, "addObject:", v47);
            }

          }
        }
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v214, v233, 16);
    }
    while (v44);
  }

  v163 = (void *)objc_opt_new();
  v169 = (void *)objc_opt_new();
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v213 = 0u;
  v56 = v31;
  self = v170;
  v11 = v156;
  v10 = v157;
  v14 = v155;
  v160 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v210, v232, 16);
  if (!v160)
  {
LABEL_87:

    goto LABEL_96;
  }
  v159 = *(_QWORD *)v211;
  v167 = *MEMORY[0x1E0D7FC18];
  v168 = v56;
LABEL_48:
  v57 = 0;
  while (1)
  {
    if (*(_QWORD *)v211 != v159)
      objc_enumerationMutation(v56);
    v161 = v57;
    v58 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * v57);
    objc_msgSend(v58, "_path");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "descriptorIdentifier");
    v60 = objc_claimAutoreleasedReturnValue();

    v162 = (void *)v60;
    objc_msgSend(v166, "objectForKeyedSubscript:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v61;
    if (objc_msgSend(v61, "count"))
    {
      v208 = 0u;
      v209 = 0u;
      v206 = 0u;
      v207 = 0u;
      v62 = v61;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v206, v231, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v207;
        v175 = v58;
        v176 = v62;
        v174 = *(_QWORD *)v207;
        do
        {
          v66 = 0;
          v177 = v64;
          do
          {
            if (*(_QWORD *)v207 != v65)
              objc_enumerationMutation(v62);
            v67 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * v66);
            objc_msgSend(v67, "loadAmbientConfigurationWithError:", 0);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v68, "creationBehavior"))
            {
              objc_msgSend(v58, "ambientConfiguration");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "displayNameLocalizationKey");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "displayNameLocalizationKey");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = BSEqualStrings();

              v73 = objc_msgSend(v69, "isEqualToAmbientConfiguration:", v68);
              v74 = v73;
              if (!v72 || (v73 & 1) == 0)
              {
                objc_msgSend(v67, "loadConfiguredPropertiesWithError:", 0);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                obj = (id)objc_msgSend(v75, "mutableCopy");

                objc_msgSend((id)objc_opt_class(), "supportedAttributes");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v172, "attributesForPoster:ofTypes:", v67, v76);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = (void *)objc_msgSend(v77, "mutableCopy");
                v79 = v78;
                if (v78)
                  v80 = v78;
                else
                  v80 = (id)objc_opt_new();
                v178 = v80;

                if ((v72 & 1) == 0)
                {
                  v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FB38]), "initWithDisplayNameLocalizationKey:", v70);
                  objc_msgSend(obj, "setOtherMetadata:", v81);

                }
                if ((v74 & 1) == 0)
                {
                  objc_msgSend(obj, "setAmbientConfiguration:", v69);
                  objc_msgSend(v178, "setObject:forKeyedSubscript:", v69, v167);
                }
                objc_msgSend(MEMORY[0x1E0D7F8D0], "temporaryPathForRole:", v173);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "_path");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "copyContentsOfPath:error:", v83, 0);

                v84 = objc_alloc(MEMORY[0x1E0D7FA60]);
                objc_msgSend(v67, "pbf_posterUUID");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "_path");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "serverIdentity");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = (void *)objc_msgSend(v84, "initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:", v82, v85, v87, obj, v178);

                objc_msgSend(v88, "trackTemporaryState:", v82);
                objc_msgSend(v169, "addObject:", v88);

                self = v170;
                v61 = v171;
                v56 = v168;
              }

              v58 = v175;
              v62 = v176;
              v65 = v174;
              v64 = v177;
            }

            ++v66;
          }
          while (v64 != v66);
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v206, v231, 16);
        }
        while (v64);
        v11 = v156;
        v10 = v157;
        v14 = v155;
      }
      goto LABEL_85;
    }
    objc_msgSend(v58, "ambientConfiguration");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v89;
    if (v89)
    {
      v62 = v89;
    }
    else
    {
      objc_msgSend(v154, "objectForKeyedSubscript:", v167);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v91;
      if (v91)
        v93 = v91;
      else
        v93 = (id)objc_opt_new();
      v62 = v93;

      v61 = v171;
    }

    if (objc_msgSend(v62, "creationBehavior"))
    {
      PBFLogRoleCoordinator();
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v228 = v58;
        _os_log_impl(&dword_1CB9FA000, v94, OS_LOG_TYPE_DEFAULT, "Skipping descriptor '%{public}@'; creation behavior is to not auto-create",
          buf,
          0xCu);
      }
      goto LABEL_84;
    }
    v205 = 0;
    -[PBFAmbientRoleCoordinator _ambientIncomingPosterConfigurationForDescriptor:referenceIncomingPosterConfiguration:error:](self, "_ambientIncomingPosterConfigurationForDescriptor:referenceIncomingPosterConfiguration:error:", v58, 0, &v205);
    v94 = objc_claimAutoreleasedReturnValue();
    v95 = v205;
    v96 = v95;
    if (v95 || !v94)
      break;
    objc_msgSend(v163, "setObject:forKeyedSubscript:", v94, v162);
    v61 = v171;
LABEL_84:

LABEL_85:
    v57 = v161 + 1;
    if (v161 + 1 == v160)
    {
      v160 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v210, v232, 16);
      if (v160)
        goto LABEL_48;
      goto LABEL_87;
    }
  }
  if (v95)
  {
    v97 = v95;
  }
  else
  {
    v98 = (void *)MEMORY[0x1E0CB35C8];
    v229 = *MEMORY[0x1E0CB2D68];
    v230 = CFSTR("notifyEventWasReceived; Unable to copy descriptor into new configuration; bailing descriptor update.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v230, &v229, 1);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "pbf_generalErrorWithCode:userInfo:", 0, v99);
    v97 = (id)objc_claimAutoreleasedReturnValue();

    self = v170;
  }

  if (v97)
  {

    v8 = v151;
    goto LABEL_94;
  }
LABEL_96:
  v100 = (void *)objc_opt_new();
  objc_msgSend(v56, "sortedArrayUsingComparator:", &__block_literal_global_38);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  v203 = 0u;
  v204 = 0u;
  v201 = 0u;
  v202 = 0u;
  obja = v101;
  v102 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v201, v226, 16);
  if (v102)
  {
    v103 = v102;
    v104 = *(_QWORD *)v202;
    do
    {
      for (k = 0; k != v103; ++k)
      {
        if (*(_QWORD *)v202 != v104)
          objc_enumerationMutation(obja);
        objc_msgSend(*(id *)(*((_QWORD *)&v201 + 1) + 8 * k), "_path");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "descriptorIdentifier");
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v166, "objectForKey:", v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v199[0] = MEMORY[0x1E0C809B0];
        v199[1] = 3221225472;
        v199[2] = __68__PBFAmbientRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke_2;
        v199[3] = &unk_1E86F31F8;
        v200 = v172;
        objc_msgSend(v108, "sortUsingComparator:", v199);
        v197 = 0u;
        v198 = 0u;
        v195 = 0u;
        v196 = 0u;
        v109 = v108;
        v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v195, v225, 16);
        if (v110)
        {
          v111 = v110;
          v112 = *(_QWORD *)v196;
          do
          {
            for (m = 0; m != v111; ++m)
            {
              if (*(_QWORD *)v196 != v112)
                objc_enumerationMutation(v109);
              objc_msgSend(*(id *)(*((_QWORD *)&v195 + 1) + 8 * m), "pbf_posterUUID");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "addObject:", v114);

            }
            v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v195, v225, 16);
          }
          while (v111);
        }

        objc_msgSend(v163, "objectForKey:", v107);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v115;
        if (v115)
        {
          objc_msgSend(v115, "destinationUUID");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "addObject:", v117);

        }
      }
      v103 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v201, v226, 16);
    }
    while (v103);
  }

  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  v118 = v158;
  v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v191, v224, 16);
  v11 = v156;
  if (v119)
  {
    v120 = v119;
    v121 = *(_QWORD *)v192;
    do
    {
      for (n = 0; n != v120; ++n)
      {
        if (*(_QWORD *)v192 != v121)
          objc_enumerationMutation(v118);
        objc_msgSend(*(id *)(*((_QWORD *)&v191 + 1) + 8 * n), "pbf_posterUUID");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFPosterRoleCoordinatorChange removePosterFromRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "removePosterFromRole:matchingUUID:", v173, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "addObject:", v124);

      }
      v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v191, v224, 16);
    }
    while (v120);
  }

  v190 = 0u;
  v188 = 0u;
  v189 = 0u;
  v187 = 0u;
  objc_msgSend(v163, "objectEnumerator");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v187, v223, 16);
  if (v126)
  {
    v127 = v126;
    v128 = *(_QWORD *)v188;
    do
    {
      for (ii = 0; ii != v127; ++ii)
      {
        if (*(_QWORD *)v188 != v128)
          objc_enumerationMutation(v125);
        +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v173, *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * ii));
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "addObject:", v130);

      }
      v127 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v187, v223, 16);
    }
    while (v127);
  }

  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v131 = v169;
  v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v183, v222, 16);
  if (v132)
  {
    v133 = v132;
    v134 = *(_QWORD *)v184;
    do
    {
      for (jj = 0; jj != v133; ++jj)
      {
        if (*(_QWORD *)v184 != v134)
          objc_enumerationMutation(v131);
        +[PBFPosterRoleCoordinatorChange updatePosterWithinRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "updatePosterWithinRole:incomingPoster:", v173, *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * jj));
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "addObject:", v136);

      }
      v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v183, v222, 16);
    }
    while (v133);
  }

  -[PBFAmbientRoleCoordinator _sortedPosterUUIDsByExtensionIdentifierFromStorage:](v170, "_sortedPosterUUIDsByExtensionIdentifierFromStorage:", v155);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = (void *)objc_msgSend(v137, "mutableCopy");

  v139 = (void *)objc_msgSend(v100, "copy");
  objc_msgSend(v138, "setObject:forKeyedSubscript:", v139, v165);

  -[PBFAmbientRoleCoordinator sortedPosterUUIDsUsingSortedPosterUUIDsByExtensionIdentifier:](v170, "sortedPosterUUIDsUsingSortedPosterUUIDsByExtensionIdentifier:", v138);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterRoleCoordinatorChange reorderPostersForRole:sortedPosterUUIDs:](PBFPosterRoleCoordinatorChange, "reorderPostersForRole:sortedPosterUUIDs:", v173, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "addObject:", v141);

  self = v170;
  v14 = v155;

  v13 = 1;
  v8 = v151;
  v10 = v157;
LABEL_134:
  v142 = v8;
  v143 = objc_msgSend(v11, "count");
  if (a4 && v143)
    *a4 = (id)objc_msgSend(v11, "copy");
  v144 = objc_opt_class();
  -[PBFPosterRoleCoordinator role](self, "role");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  if (v172)
  {
    v146 = (void *)v144;
    v8 = v142;
    objc_msgSend(v146, "dumpResultsForEvent:role:posterCollection:changes:eventWasHandled:", v142, v145, v172, v11, v13);
  }
  else
  {
    -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v14);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = (void *)v144;
    v8 = v142;
    objc_msgSend(v148, "dumpResultsForEvent:role:posterCollection:changes:eventWasHandled:", v142, v145, v147, v11, v13);

  }
LABEL_141:

  return v13;
}

uint64_t __68__PBFAmbientRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "ambientConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "displayOrder");

  objc_msgSend(v4, "ambientConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "displayOrder");
  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

uint64_t __68__PBFAmbientRoleCoordinator_notifyEventWasReceived_changes_storage___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  uint64_t v19;

  v5 = *(void **)(a1 + 32);
  v6 = *MEMORY[0x1E0D7FC48];
  v7 = a3;
  objc_msgSend(v5, "attributeForPoster:ofType:", a2, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attributeForPoster:ofType:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v9, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  if (v13)
    v18 = v17 == 0;
  else
    v18 = 1;
  if (v18)
  {
    if (v13)
      v19 = -1;
    else
      v19 = v17 != 0;
  }
  else
  {
    v19 = objc_msgSend(v17, "compare:", v13);
  }

  return v19;
}

- (BOOL)finalizeChangesWithChangeHandler:(id)a3 outEvents:(id *)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  id v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  id v98;
  NSObject *v99;
  id v100;
  id v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id obj;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD v123[5];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  char v131;
  objc_super v132;
  uint64_t v133;
  const __CFString *v134;
  _BYTE v135[128];
  uint64_t v136;
  const __CFString *v137;
  _BYTE v138[128];
  uint64_t v139;
  const __CFString *v140;
  uint8_t buf[4];
  void *v142;
  __int16 v143;
  uint64_t v144;
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v132.receiver = self;
  v132.super_class = (Class)PBFAmbientRoleCoordinator;
  v98 = a3;
  v91 = a5;
  if (!-[PBFPosterRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:](&v132, sel_finalizeChangesWithChangeHandler_outEvents_error_))
  {
    v16 = 0;
    goto LABEL_109;
  }
  v128 = 0;
  v129 = &v128;
  v130 = 0x2020000000;
  v131 = 0;
  -[PBFPosterRoleCoordinator role](self, "role");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterRoleCoordinator role](self, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "sortedPosterUUIDsForRole:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v106 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v105 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v146, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v125 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * i);
        -[PBFPosterRoleCoordinator posterWithUUID:extensionIdentifier:](self, "posterWithUUID:extensionIdentifier:", v13, CFSTR("com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v9, "setObject:forKey:", v14, v13);
        }
        else
        {
          -[PBFPosterRoleCoordinator posterWithUUID:extensionIdentifier:](self, "posterWithUUID:extensionIdentifier:", v13, CFSTR("com.apple.ambient.AmbientUI.InfographPoster"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v106, "setObject:forKey:", v14, v13);
          }
          else
          {
            -[PBFPosterRoleCoordinator posterWithUUID:extensionIdentifier:](self, "posterWithUUID:extensionIdentifier:", v13, CFSTR("com.apple.ClockPoster.ClockPosterExtension"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v105, "setObject:forKey:", v14, v13);
          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v146, 16);
    }
    while (v10);
  }

  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __78__PBFAmbientRoleCoordinator_finalizeChangesWithChangeHandler_outEvents_error___block_invoke;
  v123[3] = &unk_1E86F70C0;
  v123[4] = &v128;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v123);
  if (!*((_BYTE *)v129 + 24) && objc_msgSend(v9, "count"))
  {
    PBFLogRoleCoordinator();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "All photo posters are hidden!", buf, 2u);
    }

    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v18 = obj;
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v119, v145, 16);
    if (!v19)
      goto LABEL_35;
    v102 = *(_QWORD *)v120;
    v99 = v18;
LABEL_25:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v120 != v102)
        objc_enumerationMutation(v99);
      v21 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * v20);
      objc_msgSend(v9, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "loadConfiguredPropertiesWithError:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v24, "mutableCopy");

        objc_msgSend(v25, "ambientConfiguration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "mutableCopy");

        objc_msgSend(v27, "setHidden:", 0);
        objc_msgSend(v25, "setAmbientConfiguration:", v27);
        +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:forPosterWithinRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "updateConfiguredProperties:forPosterWithinRole:matchingUUID:", v25, v96, v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = 0;
        v29 = -[PBFAmbientRoleCoordinator _executeChange:storage:outEvents:error:](self, "_executeChange:storage:outEvents:error:", v28, v98, a4, &v118);
        v30 = v118;

        if (v29)
        {
          PBFLogRoleCoordinator();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v142 = v23;
            _os_log_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEFAULT, "All photo posters are hidden so choosing to unhide poster: %@{public}", buf, 0xCu);
          }

          v15 = v99;
          goto LABEL_42;
        }
        PBFLogRoleCoordinator();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v142 = v23;
          v143 = 2114;
          v144 = (uint64_t)v30;
          _os_log_error_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_ERROR, "failed to unhide poster %{public}@: %{public}@", buf, 0x16u);
        }

      }
      if (v19 == ++v20)
      {
        v18 = v99;
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v119, v145, 16);
        if (!v19)
        {
LABEL_35:

          PBFLogRoleCoordinator();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            -[PBFAmbientRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.3(v32);

          if (v91)
          {
            v33 = (void *)MEMORY[0x1E0CB35C8];
            v139 = *MEMORY[0x1E0CB2D68];
            v140 = CFSTR("Photos posters are all hidden and no poster could be found to un-hide");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
            v34 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), -3341, v34);
            v16 = 0;
            *v91 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_107;
          }
          v16 = 0;
          goto LABEL_108;
        }
        goto LABEL_25;
      }
    }
  }
  if (!objc_msgSend(v9, "count"))
  {
    PBFLogRoleCoordinator();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "No photo posters found; not checking for hidden",
        buf,
        2u);
    }
LABEL_42:

  }
  if (!objc_msgSend(v106, "count"))
  {
    PBFLogRoleCoordinator();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB9FA000, v37, OS_LOG_TYPE_DEFAULT, "No Infograph posters found; skipping bad ambient configuration state check",
        buf,
        2u);
    }
LABEL_66:

    if (objc_msgSend(v105, "count"))
    {
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      objc_msgSend(v105, "allValues");
      v95 = objc_claimAutoreleasedReturnValue();
      v56 = -[NSObject countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v109, v135, 16);
      v34 = v95;
      if (v56)
      {
        v92 = *(_QWORD *)v110;
LABEL_69:
        v94 = v56;
        v57 = 0;
        while (1)
        {
          if (*(_QWORD *)v110 != v92)
            objc_enumerationMutation(v95);
          v58 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v57);
          PBFLogRoleCoordinator();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v142 = v58;
            _os_log_impl(&dword_1CB9FA000, v59, OS_LOG_TYPE_DEFAULT, "Checking %{public}@ for bad ambient configuration.. ", buf, 0xCu);
          }

          v60 = objc_alloc(MEMORY[0x1E0D7FAF0]);
          objc_msgSend(v58, "_path");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (void *)objc_msgSend(v60, "_initWithPath:", v61);

          if (!v62)
            goto LABEL_89;
          objc_msgSend(v58, "loadConfiguredPropertiesWithError:", 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)objc_msgSend(v63, "mutableCopy");
          v65 = v64;
          if (v64)
          {
            v104 = v64;
          }
          else
          {
            v66 = (void *)MEMORY[0x1E0D7FB40];
            -[PBFPosterRoleCoordinator role](self, "role");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "defaultConfiguredPropertiesForRole:", v67);
            v104 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v62, "displayNameLocalizationKey");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "otherMetadata");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "displayNameLocalizationKey");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v68, "isEqual:", v70);

          if ((v71 & 1) == 0)
          {
            v72 = objc_alloc(MEMORY[0x1E0D7FB38]);
            objc_msgSend(v62, "displayNameLocalizationKey");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = (void *)objc_msgSend(v72, "initWithDisplayNameLocalizationKey:", v73);
            objc_msgSend(v104, "setOtherMetadata:", v74);

          }
          objc_msgSend(v62, "ambientConfiguration");
          v101 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "loadAmbientConfigurationWithError:", 0);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v101, "editingBehavior");
          if (v76 != objc_msgSend(v75, "editingBehavior"))
            break;
          if ((v71 & 1) == 0)
            goto LABEL_84;
LABEL_88:

LABEL_89:
          if (v94 == ++v57)
          {
            v56 = -[NSObject countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v109, v135, 16);
            v16 = 1;
            if (v56)
              goto LABEL_69;
            goto LABEL_106;
          }
        }
        v77 = (void *)objc_msgSend(v75, "mutableCopy");
        objc_msgSend(v77, "setEditingBehavior:", objc_msgSend(v101, "editingBehavior"));
        v78 = (void *)objc_msgSend(v77, "copy");
        objc_msgSend(v104, "setAmbientConfiguration:", v78);

LABEL_84:
        objc_msgSend(v58, "pbf_posterUUID");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:forPosterWithinRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "updateConfiguredProperties:forPosterWithinRole:matchingUUID:", v104, v96, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = 0;
        v81 = -[PBFAmbientRoleCoordinator _executeChange:storage:outEvents:error:](self, "_executeChange:storage:outEvents:error:", v80, v98, a4, &v108);
        v82 = v108;

        if (!v81)
        {
          PBFLogRoleCoordinator();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            -[PBFAmbientRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.1();

          if (v91)
          {
            v88 = (void *)MEMORY[0x1E0CB35C8];
            v133 = *MEMORY[0x1E0CB2D68];
            v134 = CFSTR("Unable to correct editing behavior for clock poster");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), -3341, v89);
            *v91 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_105;
        }
        PBFLogRoleCoordinator();
        v83 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v142 = v58;
          _os_log_impl(&dword_1CB9FA000, v83, OS_LOG_TYPE_DEFAULT, "Correcting editing behavior for poster %{public}@", buf, 0xCu);
        }

        goto LABEL_88;
      }
    }
    else
    {
      PBFLogRoleCoordinator();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB9FA000, v34, OS_LOG_TYPE_DEFAULT, "No Clock posters found; skipping bad ambient configuration state check",
          buf,
          2u);
      }
    }
    v16 = 1;
    goto LABEL_107;
  }
  v117 = 0u;
  v115 = 0u;
  v116 = 0u;
  v114 = 0u;
  objc_msgSend(v106, "allValues");
  v95 = objc_claimAutoreleasedReturnValue();
  v36 = -[NSObject countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v114, v138, 16);
  v37 = v95;
  if (!v36)
    goto LABEL_66;
  v93 = *(_QWORD *)v115;
LABEL_46:
  v100 = (id)v36;
  v38 = 0;
  while (1)
  {
    if (*(_QWORD *)v115 != v93)
      objc_enumerationMutation(v95);
    v39 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v38);
    PBFLogRoleCoordinator();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v142 = v39;
      _os_log_impl(&dword_1CB9FA000, v40, OS_LOG_TYPE_DEFAULT, "Checking %{public}@ for bad ambient configuration supported data layout state", buf, 0xCu);
    }

    objc_msgSend(v39, "loadAmbientConfigurationWithError:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "supportedDataLayout") == 2)
      goto LABEL_61;
    PBFLogRoleCoordinator();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend(v41, "supportedDataLayout");
      *(_DWORD *)buf = 138543618;
      v142 = v39;
      v143 = 2048;
      v144 = v43;
      _os_log_impl(&dword_1CB9FA000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ has bad supported data layout state: %lu", buf, 0x16u);
    }

    v44 = (void *)objc_msgSend(v41, "mutableCopy");
    objc_msgSend(v44, "setSupportedDataLayout:", 2);
    objc_msgSend(v39, "loadConfiguredPropertiesWithError:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "mutableCopy");
    v47 = v46;
    if (v46)
    {
      v103 = v46;
    }
    else
    {
      v48 = (void *)MEMORY[0x1E0D7FB40];
      -[PBFPosterRoleCoordinator role](self, "role");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "defaultConfiguredPropertiesForRole:", v49);
      v103 = (id)objc_claimAutoreleasedReturnValue();

    }
    v50 = (void *)objc_msgSend(v44, "copy");
    objc_msgSend(v103, "setAmbientConfiguration:", v50);

    objc_msgSend(v39, "pbf_posterUUID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterRoleCoordinatorChange updateConfiguredProperties:forPosterWithinRole:matchingUUID:](PBFPosterRoleCoordinatorChange, "updateConfiguredProperties:forPosterWithinRole:matchingUUID:", v103, v96, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = 0;
    v53 = -[PBFAmbientRoleCoordinator _executeChange:storage:outEvents:error:](self, "_executeChange:storage:outEvents:error:", v52, v98, a4, &v113);
    v54 = v113;

    if (!v53)
      break;
    PBFLogRoleCoordinator();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v142 = v39;
      _os_log_impl(&dword_1CB9FA000, v55, OS_LOG_TYPE_DEFAULT, "correcting ambient widget configuration for poster %{public}@", buf, 0xCu);
    }

LABEL_61:
    if (v100 == (id)++v38)
    {
      v36 = -[NSObject countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v114, v138, 16);
      if (!v36)
      {
        v37 = v95;
        goto LABEL_66;
      }
      goto LABEL_46;
    }
  }
  PBFLogRoleCoordinator();
  v84 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    -[PBFAmbientRoleCoordinator finalizeChangesWithChangeHandler:outEvents:error:].cold.2();

  if (v91)
  {
    v85 = (void *)MEMORY[0x1E0CB35C8];
    v136 = *MEMORY[0x1E0CB2D68];
    v137 = CFSTR("Unable to correct invalid supported data layout type for infograph");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), -3341, v86);
    *v91 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_105:
  v16 = 0;
LABEL_106:
  v34 = v95;
LABEL_107:

LABEL_108:
  _Block_object_dispose(&v128, 8);
LABEL_109:

  return v16;
}

void __78__PBFAmbientRoleCoordinator_finalizeChangesWithChangeHandler_outEvents_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  char v7;

  objc_msgSend(a3, "loadAmbientConfigurationWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hidden");

  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)supportedChangeTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PBFAmbientRoleCoordinator_supportedChangeTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedChangeTypes_onceToken_1 != -1)
    dispatch_once(&supportedChangeTypes_onceToken_1, block);
  return (id)supportedChangeTypes_supportedChangeTypes_1;
}

void __49__PBFAmbientRoleCoordinator_supportedChangeTypes__block_invoke(uint64_t a1)
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
  v8.super_class = (Class)&OBJC_METACLASS___PBFAmbientRoleCoordinator;
  objc_msgSendSuper2(&v8, sel_supportedChangeTypes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  v6 = objc_msgSend(v4, "copy");
  v7 = (void *)supportedChangeTypes_supportedChangeTypes_1;
  supportedChangeTypes_supportedChangeTypes_1 = v6;

}

- (BOOL)_executeChange:(id)a3 storage:(id)a4 outEvents:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  unsigned __int8 v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  char v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  id *v82;
  id *v83;
  void *v84;
  PBFAmbientRoleCoordinator *v85;
  PBFAmbientRoleCoordinator *v86;
  id *v87;
  id *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  objc_super v95;
  _QWORD v96[2];
  _QWORD v97[2];
  const __CFString *v98;
  _QWORD v99[2];

  v99[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "changeType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", CFSTR("PBFPosterRoleCoordinatorChangeTypeAddPoster")))
    goto LABEL_24;
  objc_msgSend(v10, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
LABEL_23:

LABEL_24:
      objc_msgSend(v10, "userInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "userInfo");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID"));
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0D7FC10])
        && ((objc_msgSend(v12, "isEqual:", CFSTR("PBFPosterRoleCoordinatorChangeTypeAssignAttribute")) & 1) != 0
         || objc_msgSend(v12, "isEqual:", CFSTR("PBFPosterRoleCoordinatorChangeTypeRemoveAttribute"))))
      {
        objc_msgSend(v10, "userInfo");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyAttribute"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v11);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[PBFAmbientRoleCoordinator _executeAmbientChargerConfigurationUpdateForPosterUUID:newAmbientChargerConfiguration:currentCollection:storage:error:](self, "_executeAmbientChargerConfigurationUpdateForPosterUUID:newAmbientChargerConfiguration:currentCollection:storage:error:", v40, v42, v43, v11, a6);

      }
      else if ((objc_msgSend(v12, "isEqual:", CFSTR("PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties")) & 1) != 0)
      {
        v90 = v12;
        v94 = v11;
        -[PBFPosterRoleCoordinator buildNewPosterCollectionFromStorage:](self, "buildNewPosterCollectionFromStorage:", v11);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "posterWithUUID:", v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userInfo");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "objectForKey:", CFSTR("PBFPosterRoleCoordinatorChangeUserInfoKeyConfiguredProperties"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40 && v44 && v46)
        {
          v83 = a5;
          v84 = v46;
          objc_msgSend(v44, "_path");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "serverIdentity");
          v48 = objc_claimAutoreleasedReturnValue();

          v86 = self;
          objc_msgSend((id)objc_opt_class(), "supportedAttributes");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "attributesForPoster:ofTypes:", v44, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(v50, "mutableCopy");
          v52 = v51;
          if (v51)
            v53 = v51;
          else
            v53 = (id)objc_opt_new();
          v61 = v53;
          v88 = a6;

          objc_msgSend(v84, "ambientConfiguration");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (v62)
          {
            v63 = *MEMORY[0x1E0D7FC18];
            objc_msgSend(v61, "objectForKey:", *MEMORY[0x1E0D7FC18]);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v62, "isEqual:", v64);

            if ((v65 & 1) == 0)
            {
              objc_msgSend(v61, "setObject:forKeyedSubscript:", v62, v63);
              v66 = *MEMORY[0x1E0D7FC48];
              objc_msgSend(v61, "objectForKeyedSubscript:", *MEMORY[0x1E0D7FC48]);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = v67;
              if (v67)
                v69 = v67;
              else
                v69 = (id)objc_opt_new();
              v70 = v69;

              objc_msgSend(v70, "usageMetadataWithUpdatedLastModifiedDate");
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v61, "setObject:forKeyedSubscript:", v71, v66);
            }
          }
          v72 = objc_alloc(MEMORY[0x1E0D7FA60]);
          objc_msgSend(v44, "_path");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "pbf_posterUUID");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v48;
          v81 = (void *)v48;
          v46 = v84;
          v79 = v61;
          v76 = (void *)objc_msgSend(v72, "initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:", v73, v74, v75, v84, v61);

          v77 = v62;
          v60 = v92;
          v30 = -[PBFPosterRoleCoordinator _ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:](v86, "_ingestIncomingPosterConfiguration:change:currentCollection:storage:outEvents:error:", v76, v10, v92, v94, v83, v88);

        }
        else
        {
          v54 = (void *)MEMORY[0x1E0CB35C8];
          v96[0] = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
          objc_msgSend(v10, "description");
          v55 = objc_claimAutoreleasedReturnValue();
          v56 = (void *)v55;
          v57 = CFSTR("(null change)");
          if (v55)
            v57 = (const __CFString *)v55;
          v96[1] = CFSTR("posterUUIDToUpdate");
          v97[0] = v57;
          v58 = CFSTR("(null uuid)");
          if (v40)
            v58 = v40;
          v97[1] = v58;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 2);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v59);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

          v30 = 0;
          v60 = v92;
        }

        v11 = v94;
        v12 = v90;
      }
      else
      {
        v95.receiver = self;
        v95.super_class = (Class)PBFAmbientRoleCoordinator;
        v30 = -[PBFPosterRoleCoordinator _executeChange:storage:outEvents:error:](&v95, sel__executeChange_storage_outEvents_error_, v10, v11, a5, a6);
      }

      goto LABEL_52;
    }
    objc_msgSend(v14, "sourceIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "provider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "sourceIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "descriptorIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v20, "length"))
    {
LABEL_22:

      goto LABEL_23;
    }
    v85 = self;
    -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = a6;
    objc_msgSend(v21, "pbf_posterExtensionStoreCoordinatorForProviderIdentifier:error:", v18, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = v22;
      v93 = v21;
      objc_msgSend(v22, "dynamicDescriptorStoreCoordinatorForIdentifier:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v82 = a5;
      if (v24)
      {
        v26 = v24;
      }
      else
      {
        objc_msgSend(v23, "staticDescriptorStoreCoordinatorForIdentifier:", v20);
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      v31 = v26;

      objc_msgSend(v31, "pathOfLatestVersion");
      v32 = objc_claimAutoreleasedReturnValue();
      v91 = (void *)v32;
      if (v32)
      {
        v89 = v31;
        v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAF0]), "_initWithPath:", v32);
        -[PBFAmbientRoleCoordinator _ambientIncomingPosterConfigurationForDescriptor:referenceIncomingPosterConfiguration:error:](v85, "_ambientIncomingPosterConfigurationForDescriptor:referenceIncomingPosterConfiguration:error:");
        v33 = objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          -[PBFPosterRoleCoordinator role](v85, "role");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[PBFPosterRoleCoordinatorChange addPosterToRole:incomingPoster:](PBFPosterRoleCoordinatorChange, "addPosterToRole:incomingPoster:", v34, v33);
          v35 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v33;
          v10 = (id)v35;
        }
        else
        {
          v14 = 0;
        }
        v37 = v93;

        v31 = v89;
        v36 = v33 != 0;
      }
      else
      {
        v36 = 1;
        v37 = v93;
      }

      self = v85;
      a6 = v87;
      a5 = v82;
      if (v36)
        goto LABEL_22;
    }
    else
    {

    }
LABEL_41:

    v30 = 0;
LABEL_52:

    goto LABEL_53;
  }
  if (a6)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v98 = CFSTR("PBFPosterRoleCoordinatorErrorUnderylingChangeUserInfoKey");
    objc_msgSend(v10, "description");
    v28 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v28;
    v29 = CFSTR("(null change)");
    if (v28)
      v29 = (const __CFString *)v28;
    v99[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, &v98, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoard.roleCoordinator.errorDomain"), 3, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  v30 = 0;
LABEL_53:

  return v30;
}

- (BOOL)_prepareAttributesForIngestionForPoster:(id)a3 existingAttributes:(id)a4 incomingAttributes:(id)a5 proposedAttributesToDelete:(id *)a6 proposedAttributesToUpdate:(id *)a7 storage:(id)a8 currentCollection:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  BOOL v28;
  id *v30;
  id v31;
  id v33;
  objc_super v34;
  id v35;
  id v36;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = a9;
  v35 = 0;
  v36 = 0;
  v34.receiver = self;
  v34.super_class = (Class)PBFAmbientRoleCoordinator;
  LODWORD(a4) = -[PBFPosterRoleCoordinator _prepareAttributesForIngestionForPoster:existingAttributes:incomingAttributes:proposedAttributesToDelete:proposedAttributesToUpdate:storage:currentCollection:error:](&v34, sel__prepareAttributesForIngestionForPoster_existingAttributes_incomingAttributes_proposedAttributesToDelete_proposedAttributesToUpdate_storage_currentCollection_error_, v15, a4, v16, &v36, &v35, v17, v18, a10);
  v19 = v36;
  v20 = v35;
  v21 = v20;
  if ((_DWORD)a4)
  {
    v30 = a7;
    v31 = v19;
    v22 = (void *)objc_msgSend(v20, "mutableCopy");
    v23 = *MEMORY[0x1E0D7FC18];
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D7FC18]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FAA8]), "initWithSupportedDataLayout:", 3);
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, v23);
    }
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D7FC10]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25
      && (v33 = 0,
          -[PBFAmbientRoleCoordinator _executeAmbientChargerConfigurationUpdateForPosterUUID:newAmbientChargerConfiguration:currentCollection:storage:error:](self, "_executeAmbientChargerConfigurationUpdateForPosterUUID:newAmbientChargerConfiguration:currentCollection:storage:error:", v15, v25, v18, v17, &v33), (v26 = v33) != 0))
    {
      v27 = v26;
      if (a10)
        *a10 = objc_retainAutorelease(v26);

      v28 = 0;
    }
    else
    {
      if (a6)
        *a6 = objc_retainAutorelease(v31);
      if (v30)
        *v30 = (id)objc_msgSend(v22, "copy");
      v28 = 1;
    }

    v19 = v31;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)_executeAmbientChargerConfigurationUpdateForPosterUUID:(id)a3 newAmbientChargerConfiguration:(id)a4 currentCollection:(id)a5 storage:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  id v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  uint64_t v71;
  id v73;
  id obj;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v80;
  void *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v80 = a6;
  objc_msgSend(v12, "posterWithUUID:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "posterWithUUID:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D7FC10];
  objc_msgSend(v12, "attributeForPoster:ofType:", v14, *MEMORY[0x1E0D7FC10]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v16;
  if ((objc_msgSend(v16, "isEqual:", v11) & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    v76 = v15;
    v69 = v13;
    v70 = v10;
    v73 = v12;
    v18 = (void *)objc_opt_new();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    objc_msgSend(v11, "associatedChargerIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
    v75 = v11;
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v95;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v95 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i);
          objc_msgSend(v81, "associatedChargerIdentifiers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "containsObject:", v24))
          {

          }
          else
          {
            objc_msgSend(v11, "associatedChargerIdentifiers");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "containsObject:", v24);

            v11 = v75;
            if (v27)
            {
              objc_msgSend(v18, "addObject:", v24);
              goto LABEL_15;
            }
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_15:

    v92 = 0u;
    v93 = 0u;
    v91 = 0u;
    v90 = 0u;
    v28 = v18;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    v10 = v70;
    v12 = v73;
    v30 = v76;
    if (v29)
    {
      v31 = v29;
      v32 = *(_QWORD *)v91;
      v33 = MEMORY[0x1E0C809B0];
      v68 = v28;
      v65 = *(_QWORD *)v91;
      do
      {
        v34 = 0;
        v66 = v31;
        do
        {
          v35 = v32;
          if (*(_QWORD *)v91 != v32)
            objc_enumerationMutation(v28);
          v71 = v34;
          v36 = v28;
          v37 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v34);
          objc_msgSend(v12, "orderedPosters", v65);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "array");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v87[0] = v33;
          v87[1] = 3221225472;
          v87[2] = __147__PBFAmbientRoleCoordinator__executeAmbientChargerConfigurationUpdateForPosterUUID_newAmbientChargerConfiguration_currentCollection_storage_error___block_invoke;
          v87[3] = &unk_1E86F3C40;
          v77 = v12;
          v78 = v37;
          v88 = v77;
          v89 = v37;
          v28 = v36;
          objc_msgSend(v39, "bs_filter:", v87);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = v35;
          if (objc_msgSend(v40, "count"))
          {
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            v67 = v40;
            obj = v40;
            v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
            if (v41)
            {
              v42 = v41;
              v43 = *(_QWORD *)v84;
              while (2)
              {
                for (j = 0; j != v42; ++j)
                {
                  if (*(_QWORD *)v84 != v43)
                    objc_enumerationMutation(obj);
                  v45 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
                  objc_msgSend(v77, "attributeForPoster:ofType:", v45, v30);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = (void *)objc_msgSend(v46, "mutableCopy");
                  objc_msgSend(v47, "disassociateFromChargerIdentifier:", v78);
                  objc_msgSend(v47, "associatedChargerIdentifiers");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v48, "count");

                  if (!v49)
                  {

                    v47 = 0;
                  }
                  objc_msgSend(v45, "pbf_posterUUID");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PBFPosterRoleCoordinator role](self, "role");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "encodeJSON");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v82 = 0;
                  v53 = objc_msgSend(v80, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v50, v51, v30, v52, &v82);
                  v54 = v82;

                  if ((v53 & 1) == 0)
                  {
                    if (a7)
                      *a7 = objc_retainAutorelease(v54);

                    v17 = 0;
                    v62 = v88;
                    v28 = v68;
                    v61 = v68;
                    v10 = v70;
                    v11 = v75;
                    goto LABEL_43;
                  }

                  v30 = v76;
                }
                v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v98, 16);
                if (v42)
                  continue;
                break;
              }
            }

            v11 = v75;
            v12 = v73;
            v40 = v67;
            v28 = v68;
            v32 = v65;
            v31 = v66;
            v33 = MEMORY[0x1E0C809B0];
          }

          v34 = v71 + 1;
        }
        while (v71 + 1 != v31);
        v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
        v10 = v70;
      }
      while (v31);
    }

    -[PBFPosterRoleCoordinator role](self, "role");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeJSON");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v80, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v10, v55, v30, v56, a7);

    if (v57)
    {
      v58 = *MEMORY[0x1E0D7FC48];
      objc_msgSend(v12, "attributeForPoster:ofType:", v69, *MEMORY[0x1E0D7FC48]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (v59)
      {
        v60 = v59;
        objc_msgSend(v59, "usageMetadataWithUpdatedLastModifiedDate");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v61 = (void *)objc_opt_new();
      }
      -[PBFPosterRoleCoordinator role](self, "role");
      v62 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "encodeJSON");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "mutateAttributeForPoster:roleId:attributeId:attributePayload:error:", v10, v62, v58, v63, 0);

      v17 = 1;
LABEL_43:

      v12 = v73;
    }
    else
    {
      v17 = 1;
    }
    v13 = v69;

  }
  return v17;
}

uint64_t __147__PBFAmbientRoleCoordinator__executeAmbientChargerConfigurationUpdateForPosterUUID_newAmbientChargerConfiguration_currentCollection_storage_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "attributeForPoster:ofType:", a2, *MEMORY[0x1E0D7FC10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAssociatedWithChargerIdentifier:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (id)sortedPosterUUIDsFromStorage:(id)a3
{
  void *v4;
  void *v5;

  -[PBFAmbientRoleCoordinator _sortedPosterUUIDsByExtensionIdentifierFromStorage:](self, "_sortedPosterUUIDsByExtensionIdentifierFromStorage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFAmbientRoleCoordinator sortedPosterUUIDsUsingSortedPosterUUIDsByExtensionIdentifier:](self, "sortedPosterUUIDsUsingSortedPosterUUIDsByExtensionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sortedPosterUUIDsUsingSortedPosterUUIDsByExtensionIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v3 = (void *)objc_msgSend(v39, "mutableCopy");
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  v7 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = objc_msgSend(&unk_1E8741B20, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = CFSTR("com.apple.PosterTester.SamplePoster");
    v11 = *(_QWORD *)v45;
    v37 = v7;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(&unk_1E8741B20);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v12);
        if (!objc_msgSend(v13, "isEqual:", v10))
          goto LABEL_13;
        v14 = v11;
        v15 = v6;
        v16 = v10;
        -[PBFPosterRoleCoordinator modelCoordinatorProvider](self, "modelCoordinatorProvider");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "providerForExtensionIdentifier:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "posterExtensionInfoPlist");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "pbf_supportsGallery");

        if ((v20 & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v21, "stringArrayForKey:", CFSTR("ShowSamplePoster")),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = objc_msgSend(v22, "containsObject:", v13),
              v22,
              v21,
              v23))
        {

          v10 = v16;
          v6 = v15;
          v11 = v14;
          v7 = v37;
LABEL_13:
          objc_msgSend(v39, "objectForKeyedSubscript:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "array");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v24);

          objc_msgSend(v6, "removeObjectForKey:", v13);
          goto LABEL_14;
        }
        v10 = v16;
        v6 = v15;
        v11 = v14;
        v7 = v37;
LABEL_14:

        ++v12;
      }
      while (v9 != v12);
      v25 = objc_msgSend(&unk_1E8741B20, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      v9 = v25;
    }
    while (v25);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v6, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v41 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v39, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "array");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v34);

        objc_msgSend(v6, "removeObjectForKey:", v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v29);
  }

  v35 = (void *)objc_msgSend(v7, "copy");
  return v35;
}

- (id)_sortedPosterUUIDsByExtensionIdentifierFromStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PBFPosterRoleCoordinator role](self, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedPosterUUIDsForRole:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v4, "extensionIdentifierForPosterUUID:error:", v13, 0, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v15 = (void *)objc_opt_new();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);
        }
        objc_msgSend(v15, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

- (void)noteDidResetRoleCoordinator:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PBFLogRoleCoordinator();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PBFPosterRoleCoordinator role](self, "role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1CB9FA000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Populating ambient role coordinator epoch after role reset", (uint8_t *)&v6, 0xCu);

  }
}

- (id)_ambientIncomingPosterConfigurationForDescriptor:(id)a3 referenceIncomingPosterConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v65 = a4;
  -[PBFPosterRoleCoordinator role](self, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "provider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serverIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptorIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FA78], "mutableConfigurationWithRole:", v9);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  v18 = (void *)v16;
  LOBYTE(v16) = objc_msgSend((id)v16, "copyContentsOfPath:error:", v17, &v66);
  v19 = v66;

  if ((v16 & 1) != 0)
  {
    v57 = a5;
    -[PBFAmbientRoleCoordinator defaultAttributesForNewPosterFromProvider:](self, "defaultAttributesForNewPosterFromProvider:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ambientConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v62 = v20;
    v63 = v15;
    v61 = v19;
    if (v21)
    {
      v23 = v21;
      v24 = *MEMORY[0x1E0D7FC18];
      v25 = v18;
    }
    else
    {
      v24 = *MEMORY[0x1E0D7FC18];
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D7FC18]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v25 = v18;
      if (v28)
        v30 = v28;
      else
        v30 = (id)objc_opt_new();
      v34 = v30;

      v20 = v62;
      v23 = v34;
    }
    v64 = v12;

    objc_msgSend(MEMORY[0x1E0D7FAE0], "defaultConfiguredPropertiesForRole:", v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "mutableCopy");

    v37 = (void *)objc_msgSend(v20, "mutableCopy");
    v38 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, v24);

    v60 = v23;
    objc_msgSend(v36, "setAmbientConfiguration:", v23);
    objc_msgSend(v8, "displayNameLocalizationKey");
    v39 = objc_claimAutoreleasedReturnValue();
    v26 = v65;
    if (v39)
      objc_msgSend(v25, "setDisplayNameLocalizationKey:", v39);
    v59 = (void *)v39;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7F8E0], "descriptorIdentityWithProvider:identifier:role:posterUUID:version:", v64, v63, v9, v40, 0);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)v41;
    v58 = v37;
    if (v65)
    {
      v55 = (void *)v41;
      v56 = v9;
      objc_msgSend(v65, "configuredProperties");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v36;
      objc_msgSend(v36, "mergeConfiguredProperties:", v43);
      objc_msgSend(v65, "attributes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "count"))
        objc_msgSend(v37, "addEntriesFromDictionary:", v45);
      objc_msgSend(v65, "_path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v25, "copyContentsOfPath:error:", v46, v57);

      if (!v47)
      {

        v27 = 0;
        v52 = v55;
        v9 = v56;
        v53 = v58;
        goto LABEL_24;
      }
      objc_msgSend(v65, "destinationUUID");
      v48 = objc_claimAutoreleasedReturnValue();

      v40 = (void *)v48;
      v42 = v55;
      v9 = v56;
    }
    else
    {
      v44 = v36;
    }
    v49 = objc_alloc(MEMORY[0x1E0D7FA60]);
    objc_msgSend(v25, "_path");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v42;
    v52 = v42;
    v53 = v58;
    v27 = (void *)objc_msgSend(v49, "initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:", v50, v40, v51, v44, v58);

    objc_msgSend(v27, "trackTemporaryState:", v25);
    v26 = v65;
LABEL_24:

    v15 = v63;
    v12 = v64;
    v19 = v61;
    goto LABEL_25;
  }
  if (a5)
  {
    v26 = v65;
    if (v19)
    {
      v27 = 0;
      *a5 = objc_retainAutorelease(v19);
    }
    else
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v67 = *MEMORY[0x1E0CB2D68];
      v68[0] = CFSTR("_ambientIncomingPosterConfigurationForDescriptor initial copy; Unable to copy descriptor; bailing descriptor update.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 0, v32);
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v33;

      v27 = 0;
    }
    v25 = v18;
  }
  else
  {
    v27 = 0;
    v25 = v18;
    v26 = v65;
  }
LABEL_25:

  return v27;
}

- (void)notifyEventWasReceived:(const char *)a1 changes:(uint64_t)a2 storage:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PBFAmbientRoleCoordinator.m");
  v16 = 1024;
  v17 = 253;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "Failed to correct editing behavior for poster %{public}@: %{public}@");
}

- (void)finalizeChangesWithChangeHandler:outEvents:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "failed to correct widget configuration for poster %{public}@: %{public}@");
}

- (void)finalizeChangesWithChangeHandler:(os_log_t)log outEvents:error:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "All photo posters are hidden and we were unsuccessful in unhiding one.", v1, 2u);
}

@end
