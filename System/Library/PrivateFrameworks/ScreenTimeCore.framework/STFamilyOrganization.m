@implementation STFamilyOrganization

+ (id)fetchWithContext:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  __int128 buf;
  void (*v80)(uint64_t, void *);
  void *v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  objc_msgSend(a1, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "execute:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_8:
    v16 = 0;
    goto LABEL_48;
  }
  v8 = _os_feature_enabled_impl();
  v9 = objc_msgSend(v7, "count");
  if (!v8)
  {
    if (v9 < 2)
    {
LABEL_47:
      objc_msgSend(v7, "firstObject", v55, v56, v57, v58);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
    +[STLog persistence](STLog, "persistence");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      +[STFamilyOrganization fetchWithContext:error:].cold.2();

    v68 = 0;
    +[STCoreUser fetchLocalUserInContext:error:](STCoreUser, "fetchLocalUserInContext:error:", v59, &v68);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v68;
    if (!v18)
    {
      +[STLog persistence](STLog, "persistence");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        +[STFamilyOrganization fetchWithContext:error:].cold.1();

    }
    objc_msgSend(v18, "familySettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "organization");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[STLog persistence](STLog, "persistence");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D22E7000, v23, OS_LOG_TYPE_DEFAULT, "Preserving family organization associated with the local user's family settings.", (uint8_t *)&buf, 2u);
      }

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v25 = v7;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (!v26)
        goto LABEL_46;
      v27 = v26;
      v55 = v19;
      v56 = v18;
      v57 = v7;
      v58 = v6;
      v28 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v65 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if (v30 != v22)
          {
            v31 = v30;
            v32 = v59;
            +[STLog persistence](STLog, "persistence");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v31;
              _os_log_error_impl(&dword_1D22E7000, v33, OS_LOG_TYPE_ERROR, "Deleting extraneous family organization: %{public}@", (uint8_t *)&buf, 0xCu);
            }

            objc_msgSend(v31, "settings");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v80 = __deleteExtraneousFamilyOrganizationAndChildObjects_block_invoke;
            v81 = &unk_1E93713D8;
            v82 = v32;
            v35 = v32;
            objc_msgSend(v34, "enumerateObjectsUsingBlock:", &buf);

            objc_msgSend(v35, "deleteObject:", v31);
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v27);
    }
    else
    {
      if (v24)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D22E7000, v23, OS_LOG_TYPE_DEFAULT, "Preserving first family organization returned from fetch request.", (uint8_t *)&buf, 2u);
      }

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, objc_msgSend(v7, "count") - 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectsAtIndexes:", v38);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      v39 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (!v39)
        goto LABEL_46;
      v40 = v39;
      v55 = v19;
      v56 = v18;
      v57 = v7;
      v58 = v6;
      v41 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v61 != v41)
            objc_enumerationMutation(v25);
          v43 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * j);
          v44 = v59;
          +[STLog persistence](STLog, "persistence");
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v43;
            _os_log_error_impl(&dword_1D22E7000, v45, OS_LOG_TYPE_ERROR, "Deleting extraneous family organization: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          objc_msgSend(v43, "settings");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v80 = __deleteExtraneousFamilyOrganizationAndChildObjects_block_invoke;
          v81 = &unk_1E93713D8;
          v82 = v44;
          v47 = v44;
          objc_msgSend(v46, "enumerateObjectsUsingBlock:", &buf);

          objc_msgSend(v47, "deleteObject:", v43);
        }
        v40 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v40);
    }
    v7 = v57;
    v6 = v58;
    v19 = v55;
    v18 = v56;
LABEL_46:

    goto LABEL_47;
  }
  if (v9 >= 2)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2D50];
      v77 = *MEMORY[0x1E0CB2D50];
      v78 = CFSTR("There must be one and only one Family Organization object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 506, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v75 = v11;
        v76 = CFSTR("There must be one and only one Family Organization object.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 506, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    goto LABEL_8;
  }
  objc_msgSend(v7, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v36;
  if (v36)
  {
    v37 = v36;
  }
  else if (a4)
  {
    v49 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    v73 = *MEMORY[0x1E0CB2D50];
    v74 = CFSTR("There must be one Family Organization.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 507, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      v53 = (void *)MEMORY[0x1E0CB35C8];
      v71 = v50;
      v72 = CFSTR("There must be one Family Organization.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 507, v54);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

LABEL_48:
  return v16;
}

+ (id)fetchOrCreateFamilyOrganizationWithContext:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  STFamilyOrganization *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  uint8_t v55[128];
  __int128 buf;
  void (*v57)(uint64_t, void *);
  void *v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  objc_msgSend(a1, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "execute:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v28 = 0;
    goto LABEL_40;
  }
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    +[STLog persistence](STLog, "persistence");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[STFamilyOrganization fetchWithContext:error:].cold.2();

    v53 = 0;
    +[STCoreUser fetchLocalUserInContext:error:](STCoreUser, "fetchLocalUserInContext:error:", v44, &v53);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v53;
    if (!v10)
    {
      +[STLog persistence](STLog, "persistence");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[STFamilyOrganization fetchWithContext:error:].cold.1();

    }
    objc_msgSend(v10, "familySettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "organization");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[STLog persistence](STLog, "persistence");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D22E7000, v15, OS_LOG_TYPE_DEFAULT, "Preserving family organization associated with the local user's family settings.", (uint8_t *)&buf, 2u);
      }

      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v17 = v8;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (!v18)
        goto LABEL_37;
      v19 = v18;
      v40 = v11;
      v41 = v10;
      v42 = v8;
      v43 = v6;
      v20 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (v22 != v14)
          {
            v23 = v22;
            v24 = v44;
            +[STLog persistence](STLog, "persistence");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v23;
              _os_log_error_impl(&dword_1D22E7000, v25, OS_LOG_TYPE_ERROR, "Deleting extraneous family organization: %{public}@", (uint8_t *)&buf, 0xCu);
            }

            objc_msgSend(v23, "settings");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v57 = __deleteExtraneousFamilyOrganizationAndChildObjects_block_invoke;
            v58 = &unk_1E93713D8;
            v59 = v24;
            v27 = v24;
            objc_msgSend(v26, "enumerateObjectsUsingBlock:", &buf);

            objc_msgSend(v27, "deleteObject:", v23);
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v19);
    }
    else
    {
      if (v16)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D22E7000, v15, OS_LOG_TYPE_DEFAULT, "Preserving first family organization returned from fetch request.", (uint8_t *)&buf, 2u);
      }

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, objc_msgSend(v8, "count") - 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectsAtIndexes:", v29);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      v30 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (!v30)
        goto LABEL_37;
      v31 = v30;
      v40 = v11;
      v41 = v10;
      v42 = v8;
      v43 = v6;
      v32 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(v17);
          v34 = *(id *)(*((_QWORD *)&v45 + 1) + 8 * j);
          v35 = v44;
          +[STLog persistence](STLog, "persistence");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v34;
            _os_log_error_impl(&dword_1D22E7000, v36, OS_LOG_TYPE_ERROR, "Deleting extraneous family organization: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          objc_msgSend(v34, "settings");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v57 = __deleteExtraneousFamilyOrganizationAndChildObjects_block_invoke;
          v58 = &unk_1E93713D8;
          v59 = v35;
          v38 = v35;
          objc_msgSend(v37, "enumerateObjectsUsingBlock:", &buf);

          objc_msgSend(v38, "deleteObject:", v34);
        }
        v31 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v31);
    }
    v8 = v42;
    v6 = v43;
    v11 = v40;
    v10 = v41;
LABEL_37:

  }
  objc_msgSend(v8, "firstObject", v40, v41, v42, v43);
  v28 = (STFamilyOrganization *)objc_claimAutoreleasedReturnValue();
  if (!v28)
    v28 = -[STFamilyOrganization initWithContext:]([STFamilyOrganization alloc], "initWithContext:", v44);
LABEL_40:

  return v28;
}

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STFamilyOrganization;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)validateForUpdate:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STFamilyOrganization;
  return -[STFamilyOrganization validateForUpdate:](&v4, sel_validateForUpdate_, a3);
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STFamilyOrganization;
  v5 = -[STFamilyOrganization validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
    LOBYTE(v5) = -[STFamilyOrganization _validateNumberOfObjects:](self, "_validateNumberOfObjects:", a3);
  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STFamilyOrganization;
  v5 = -[STFamilyOrganization validateForDelete:](&v7, sel_validateForDelete_);
  if (v5)
    LOBYTE(v5) = -[STFamilyOrganization _validateNumberOfObjects:](self, "_validateNumberOfObjects:", a3);
  return v5;
}

- (BOOL)_validateNumberOfObjects:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  +[STFamilyOrganization fetchRequest](STFamilyOrganization, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "execute:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_6:
    LOBYTE(a3) = 0;
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    LOBYTE(a3) = 1;
    goto LABEL_8;
  }
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("There must be one and only one Family Organization object.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 506, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v14 = v8;
      v15 = CFSTR("There must be one and only one Family Organization object.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("STErrorDomain"), 506, v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
LABEL_8:

  return (char)a3;
}

+ (NSString)serializableClassName
{
  return (NSString *)CFSTR("RMFamilyOrganization");
}

+ (void)fetchWithContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "Failed to fetch local user: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchWithContext:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_1D22E7000, v0, v1, "More than 1 family organizations found: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
