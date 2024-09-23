@implementation PBFPosterDataStoreEventBuilder

+ (id)extensionsUpdatedFrom:(id)a3 to:(id)a4 supportedRoles:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "count");
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[supportedRoles count] > 0"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder extensionsUpdatedFrom:to:supportedRoles:].cold.1();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC31F0);
  }
  v10 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __74__PBFPosterDataStoreEventBuilder_extensionsUpdatedFrom_to_supportedRoles___block_invoke;
  v40[3] = &unk_1E86F2B30;
  v11 = v9;
  v41 = v11;
  objc_msgSend(v7, "bs_filter:", v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v10;
  v38[1] = 3221225472;
  v38[2] = __74__PBFPosterDataStoreEventBuilder_extensionsUpdatedFrom_to_supportedRoles___block_invoke_2;
  v38[3] = &unk_1E86F2B30;
  v13 = v11;
  v39 = v13;
  objc_msgSend(v8, "bs_filter:", v38);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setEventType:", CFSTR("PBFPosterDataStoreEventTypeExtensionsUpdated"));
  objc_msgSend(v15, "setFromValue:", v12);
  objc_msgSend(v15, "setToValue:", v14);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v20), "posterExtensionBundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "relateProvider:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v18);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = v8;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v26), "posterExtensionBundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "relateProvider:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v24);
  }

  return v15;
}

uint64_t __74__PBFPosterDataStoreEventBuilder_extensionsUpdatedFrom_to_supportedRoles___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "supportedRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "intersectsSet:", v3);

  return v4;
}

uint64_t __74__PBFPosterDataStoreEventBuilder_extensionsUpdatedFrom_to_supportedRoles___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "supportedRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "intersectsSet:", v3);

  return v4;
}

+ (id)descriptorsUpdatedForProvider:(id)a3 role:(id)a4 from:(id)a5 to:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[provider length] > 0"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder descriptorsUpdatedForProvider:role:from:to:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC34A4);
  }
  v24 = v10;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setEventType:", CFSTR("PBFPosterDataStoreEventTypeDescriptorsUpdated"));
  objc_msgSend(v13, "setFromValue:", v11);
  objc_msgSend(v13, "setToValue:", v12);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "_path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "serverIdentity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "provider");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "relateProvider:", v21);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  objc_msgSend(v13, "relateProvider:", v9);
  return v13;
}

+ (id)staticDescriptorsUpdatedForProvider:(id)a3 role:(id)a4 from:(id)a5 to:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[provider length] > 0"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder staticDescriptorsUpdatedForProvider:role:from:to:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC36D0);
  }
  v24 = v10;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setEventType:", CFSTR("PBFPosterDataStoreEventTypeStaticDescriptorsUpdated"));
  objc_msgSend(v13, "setFromValue:", v11);
  objc_msgSend(v13, "setToValue:", v12);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "_path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "serverIdentity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "provider");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "relateProvider:", v21);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  objc_msgSend(v13, "relateProvider:", v9);
  return v13;
}

+ (id)posterUpdatedFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "role");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BSEqualObjects();

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("BSEqualObjects([from role], [to role])"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:].cold.4();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC39D0);
  }
  objc_msgSend(v5, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isServerPosterPath");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[from _path] isServerPosterPath]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:].cold.3();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC3A34);
  }
  objc_msgSend(v6, "_path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isServerPosterPath");

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[to _path] isServerPosterPath]"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:].cold.2();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAC3A98);
  }
  objc_msgSend(v5, "_path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serverIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "posterUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "serverIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "posterUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = BSEqualObjects();

  if ((v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("BSEqualObjects([[[from _path] serverIdentity] posterUUID], [[[to _path] serverIdentity] posterUUID])"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder posterUpdatedFrom:to:].cold.1();
    goto LABEL_17;
  }
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setEventType:", CFSTR("PBFPosterDataStoreEventTypePosterUpdated"));
  objc_msgSend(v21, "setFromValue:", v5);
  objc_msgSend(v21, "setToValue:", v6);
  objc_msgSend(v6, "_path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "serverIdentity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "posterUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "relatePoster:", v24);

  objc_msgSend(v6, "_path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "serverIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "provider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "relateProvider:", v27);

  objc_msgSend(v5, "_path");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "serverIdentity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "posterUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "relatePoster:", v30);

  objc_msgSend(v5, "_path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "serverIdentity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "provider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "relateProvider:", v33);

  return v21;
}

+ (id)posterSelected:(id)a3 previous:(id)a4
{
  id v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id result;
  void *v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isServerPosterPath");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setEventType:", CFSTR("PBFPosterDataStoreEventTypePosterSelected"));
    objc_msgSend(v9, "setFromValue:", v6);
    objc_msgSend(v9, "setToValue:", v5);
    objc_msgSend(v5, "_path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serverIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "posterUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "relatePoster:", v12);

    objc_msgSend(v5, "_path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serverIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "provider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "relateProvider:", v15);

    objc_msgSend(v6, "_path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "isServerPosterPath");

    if ((_DWORD)v14)
    {
      objc_msgSend(v6, "_path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "serverIdentity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "posterUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "relatePoster:", v19);

      objc_msgSend(v6, "_path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "serverIdentity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "provider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "relateProvider:", v22);

    }
    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[to _path] isServerPosterPath]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder posterSelected:previous:].cold.1();
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)posterActivated:(id)a3 previous:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isServerPosterPath");

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[from _path] isServerPosterPath]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[PBFPosterDataStoreEventBuilder posterActivated:previous:].cold.2();
LABEL_12:
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAC3F64);
    }
  }
  objc_msgSend(v5, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isServerPosterPath");

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[to _path] isServerPosterPath]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder posterActivated:previous:].cold.1();
    goto LABEL_12;
  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setEventType:", CFSTR("PBFPosterDataStoreEventTypePosterActivated"));
  objc_msgSend(v12, "setFromValue:", v7);
  objc_msgSend(v12, "setToValue:", v5);
  objc_msgSend(v5, "_path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serverIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "posterUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "relatePoster:", v15);

  objc_msgSend(v5, "_path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "serverIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "provider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "relateProvider:", v18);

  if (v7)
  {
    objc_msgSend(v7, "_path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serverIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "posterUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "relatePoster:", v21);

    objc_msgSend(v7, "_path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "serverIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "provider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "relateProvider:", v24);

  }
  return v12;
}

+ (id)posterDeleted:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id result;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isServerPosterPath");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setEventType:", CFSTR("PBFPosterDataStoreEventTypePosterDeleted"));
    objc_msgSend(v6, "setFromValue:", v3);
    objc_msgSend(v6, "setToValue:", 0);
    objc_msgSend(v3, "_path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relatePoster:", v9);

    objc_msgSend(v3, "_path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serverIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "provider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relateProvider:", v12);

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[poster _path] isServerPosterPath]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder posterDeleted:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)posterAdded:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id result;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isServerPosterPath");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setEventType:", CFSTR("PBFPosterDataStoreEventTypePosterAdded"));
    objc_msgSend(v6, "setFromValue:", 0);
    objc_msgSend(v6, "setToValue:", v3);
    objc_msgSend(v3, "_path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relatePoster:", v9);

    objc_msgSend(v3, "_path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serverIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "provider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relateProvider:", v12);

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[poster _path] isServerPosterPath]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder posterAdded:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)postersReorderedFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setEventType:", CFSTR("PBFPosterDataStoreEventTypePostersReordered"));
  objc_msgSend(v7, "setFromValue:", v5);
  objc_msgSend(v7, "setToValue:", v6);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v13, "_path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "serverIdentity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "posterUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "relatePoster:", v16);

        objc_msgSend(v13, "_path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "serverIdentity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "provider");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "relateProvider:", v19);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v10);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = v6;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(v25, "_path", (_QWORD)v33);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "serverIdentity");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "posterUUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "relatePoster:", v28);

        objc_msgSend(v25, "_path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "serverIdentity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "provider");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "relateProvider:", v31);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v22);
  }

  return v7;
}

+ (id)activeChargerIdentifierDidUpdate:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id result;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (BSEqualStrings())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("BSEqualStrings(activeChargerIdentifier, previousChargerIdentifier) == NO"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterDataStoreEventBuilder activeChargerIdentifierDidUpdate:from:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setEventType:", CFSTR("PBFPosterDataStoreEventTypeActiveChargerIdentifierUpdated"));
    objc_msgSend(v7, "setFromValue:", v6);
    objc_msgSend(v7, "setToValue:", v5);

    return v7;
  }
  return result;
}

+ (id)resetRole:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setEventType:", CFSTR("PBFPosterDataStoreEventTypeRoleCoordinatorReset"));
  objc_msgSend(v4, "setFromValue:", v3);
  objc_msgSend(v4, "setToValue:", v3);

  return v4;
}

- (void)setEventType:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  NSString *eventType;

  v4 = (__CFString *)a3;
  v5 = CFSTR("PBFPosterDataStoreEventTypeUnknown");
  if (v4)
    v5 = v4;
  eventType = self->_eventType;
  self->_eventType = &v5->isa;

}

- (void)relateProvider:(id)a3
{
  id v4;
  NSMutableSet *relatedProviders;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    relatedProviders = self->_relatedProviders;
    v8 = v4;
    if (!relatedProviders)
    {
      v6 = (NSMutableSet *)objc_opt_new();
      v7 = self->_relatedProviders;
      self->_relatedProviders = v6;

      relatedProviders = self->_relatedProviders;
    }
    -[NSMutableSet addObject:](relatedProviders, "addObject:", v8);
    v4 = v8;
  }

}

- (void)unrelateProvider:(id)a3
{
  -[NSMutableSet removeObject:](self->_relatedProviders, "removeObject:", a3);
}

- (void)relatePoster:(id)a3
{
  id v4;
  NSMutableSet *relatedPosters;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    relatedPosters = self->_relatedPosters;
    v8 = v4;
    if (!relatedPosters)
    {
      v6 = (NSMutableSet *)objc_opt_new();
      v7 = self->_relatedPosters;
      self->_relatedPosters = v6;

      relatedPosters = self->_relatedPosters;
    }
    -[NSMutableSet addObject:](relatedPosters, "addObject:", v8);
    v4 = v8;
  }

}

- (void)unrelatePoster:(id)a3
{
  -[NSMutableSet removeObject:](self->_relatedPosters, "removeObject:", a3);
}

- (void)reset
{
  NSMutableSet *relatedProviders;
  NSMutableSet *relatedPosters;
  id toValue;
  id fromValue;

  relatedProviders = self->_relatedProviders;
  self->_relatedProviders = 0;

  relatedPosters = self->_relatedPosters;
  self->_relatedPosters = 0;

  toValue = self->_toValue;
  self->_toValue = 0;

  fromValue = self->_fromValue;
  self->_fromValue = 0;

  -[PBFPosterDataStoreEventBuilder setEventType:](self, "setEventType:", 0);
}

- (id)buildWithError:(id *)a3
{
  PBFPosterDataStoreEvent *v5;
  PBFPosterDataStoreEvent *v6;

  v5 = -[PBFPosterDataStoreEvent initWithType:]([PBFPosterDataStoreEvent alloc], "initWithType:", self->_eventType);
  -[PBFPosterDataStoreEvent setRelatedProviders:](v5, "setRelatedProviders:", self->_relatedProviders);
  -[PBFPosterDataStoreEvent setRelatedPosters:](v5, "setRelatedPosters:", self->_relatedPosters);
  -[PBFPosterDataStoreEvent setUserInfo:](v5, "setUserInfo:", self->_userInfo);
  -[PBFPosterDataStoreEvent setToValue:](v5, "setToValue:", self->_toValue);
  -[PBFPosterDataStoreEvent setFromValue:](v5, "setFromValue:", self->_fromValue);
  if (-[PBFPosterDataStoreEvent isValidWithError:](v5, "isValidWithError:", a3))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (id)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
  objc_storeStrong(&self->_fromValue, a3);
}

- (id)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
  objc_storeStrong(&self->_toValue, a3);
}

- (PBFPosterRoleCoordinatorChange)originatingRoleCoordinatorChange
{
  return self->_originatingRoleCoordinatorChange;
}

- (void)setOriginatingRoleCoordinatorChange:(id)a3
{
  objc_storeStrong((id *)&self->_originatingRoleCoordinatorChange, a3);
}

- (id)revertBlock
{
  return self->_revertBlock;
}

- (void)setRevertBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong(&self->_revertBlock, 0);
  objc_storeStrong((id *)&self->_originatingRoleCoordinatorChange, 0);
  objc_storeStrong(&self->_toValue, 0);
  objc_storeStrong(&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_relatedRoles, 0);
  objc_storeStrong((id *)&self->_relatedPosters, 0);
  objc_storeStrong((id *)&self->_relatedProviders, 0);
}

+ (void)extensionsUpdatedFrom:to:supportedRoles:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)descriptorsUpdatedForProvider:role:from:to:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)staticDescriptorsUpdatedForProvider:role:from:to:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)posterUpdatedFrom:to:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)posterUpdatedFrom:to:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)posterUpdatedFrom:to:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)posterUpdatedFrom:to:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)posterSelected:previous:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)posterActivated:previous:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)posterActivated:previous:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)posterDeleted:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)posterAdded:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)activeChargerIdentifierDidUpdate:from:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
