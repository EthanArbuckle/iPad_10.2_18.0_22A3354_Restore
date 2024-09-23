@implementation PBFPosterModelStoreCoordinator

+ (id)createNewStoreCoordinatorWithPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id *v45;
  void *v46;
  char v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  objc_class *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD aBlock[4];
  id v95;
  id v96;
  _QWORD v97[2];
  _BYTE v98[128];
  _QWORD v99[2];
  _QWORD v100[2];
  uint8_t buf[4];
  const char *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "provider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "descriptorIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "role");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v7;
  NSClassFromString(CFSTR("NSString"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v62), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA3FE10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v63), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA3FE74);
  }

  v14 = v9;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v64), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA3FED8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v65), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA3FF3CLL);
  }

  v15 = v10;
  if (v15)
  {
    NSClassFromString(CFSTR("NSString"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.11();
      objc_msgSend(objc_retainAutorelease(v69), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA400CCLL);
    }
  }

  if ((PFPosterRoleIsValid() & 1) != 0)
  {
    v16 = v12;
  }
  else
  {
    PRPosterRoleLookupForExtensionBundleIdentifier(v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PBFLogPosterContents();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v102 = "+[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:]";
      v103 = 2112;
      v104 = v16;
      _os_log_impl(&dword_1CB9FA000, v17, OS_LOG_TYPE_DEFAULT, "[Invalid Role][%{public}s] role was invalid, recovered: %@", buf, 0x16u);
    }

  }
  v18 = v16;
  NSClassFromString(CFSTR("NSString"));
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.3();
    objc_msgSend(objc_retainAutorelease(v66), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA3FFA0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.3();
    objc_msgSend(objc_retainAutorelease(v67), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA40004);
  }

  if ((PFPosterRoleIsValid() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid(role)"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.9();
    objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA40068);
  }
  v19 = (objc_class *)a1;
  v20 = (void *)objc_opt_new();
  objc_msgSend(v5, "identifierURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_providerInfoFileURLForIdentifierURL:", v21);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "pbf_versionsURLForIdentifierURL:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v83 = v5;
  if (!objc_msgSend(v21, "checkResourceIsReachableAndReturnError:", 0))
  {
    v82 = v18;
    v74 = v19;
    v78 = v15;
    v79 = v14;
    v77 = v13;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PBFPosterModelStoreCoordinator_createNewStoreCoordinatorWithPath_error___block_invoke;
    aBlock[3] = &unk_1E86F2540;
    v81 = v20;
    v32 = v20;
    v95 = v32;
    v33 = v21;
    v96 = v33;
    v80 = _Block_copy(aBlock);
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v75 = v33;
    v76 = (void *)v22;
    v97[0] = v33;
    v97[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
    if (v35)
    {
      v36 = v35;
      v26 = 0;
      v37 = *(_QWORD *)v91;
      while (2)
      {
        v38 = 0;
        v39 = v26;
        do
        {
          if (*(_QWORD *)v91 != v37)
            objc_enumerationMutation(v34);
          v40 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v38);
          PFFileProtectionNoneAttributes();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v39;
          LOBYTE(v40) = objc_msgSend(v32, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v40, 1, v41, &v89);
          v26 = v89;

          if ((v40 & 1) == 0)
          {
            if (a4)
              *a4 = objc_retainAutorelease(v26);
            v42 = v80;
            (*((void (**)(void *))v80 + 2))(v80);
            v28 = 0;
            v31 = v83;
            v13 = v77;
            v30 = v78;
            v14 = v79;
            v29 = v76;
            goto LABEL_66;
          }
          ++v38;
          v39 = v26;
        }
        while (v36 != v38);
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
        if (v36)
          continue;
        break;
      }
    }
    else
    {
      v26 = 0;
    }

    v30 = v78;
    if (v78)
    {
      v43 = (void *)MEMORY[0x1E0C99E98];
      v31 = v83;
      objc_msgSend(v83, "identity");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "pbf_descriptorIdentifierURLForType:identifierURL:", objc_msgSend(v44, "type"), v75);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v79;
      v45 = a4;
      if (!objc_msgSend(v78, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[descriptorIdentifier length] > 0"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.8();
        objc_msgSend(objc_retainAutorelease(v71), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1CBA4018CLL);
      }
      objc_msgSend(v78, "dataUsingEncoding:", 4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v26;
      v47 = objc_msgSend(v46, "writeToURL:options:error:", v34, 268435457, &v88);
      v48 = v88;

      if ((v47 & 1) == 0)
      {
        v26 = v48;
        if (a4)
          *a4 = objc_retainAutorelease(v48);
        v42 = v80;
        (*((void (**)(void *))v80 + 2))(v80);

        v28 = 0;
        v29 = v76;
        v13 = v77;
        goto LABEL_66;
      }

      v49 = v48;
    }
    else
    {
      v49 = v26;
      v31 = v83;
      v45 = a4;
      v14 = v79;
    }
    v50 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v31, "identity");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "pbf_roleIdentifierURLForType:identifierURL:", objc_msgSend(v51, "type"), v75);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v82, "dataUsingEncoding:", 4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v52, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[roleIdentifierData length] > 0"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.4();
      objc_msgSend(objc_retainAutorelease(v70), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA4012CLL);
    }
    v87 = v49;
    v53 = objc_msgSend(v52, "writeToURL:options:error:", v34, 268435457, &v87);
    v26 = v87;

    if ((v53 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "bs_secureDataFromObject:", MEMORY[0x1E0C9AA70]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v26;
      v55 = objc_msgSend(v54, "writeToURL:options:error:", v85, 268435457, &v86);
      v73 = v86;

      v72 = v54;
      if ((v55 & 1) != 0)
      {
        v13 = v77;
        v56 = (void *)objc_msgSend([v74 alloc], "initWithProvider:identifierURL:posterUUID:", v77, v75, v14);
        v57 = v56;
        if (v56)
          objc_msgSend(v56, "checkEnvironmentConsistency");
        else
          objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3329, 0);
        v26 = (id)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v26);
          PBFLogPosterContents();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.5();

          (*((void (**)(void))v80 + 2))();
          v28 = 0;
        }
        else
        {
          v28 = v57;
        }

        v14 = v79;
        v29 = v76;
      }
      else
      {
        if (v45)
          *v45 = objc_retainAutorelease(v73);
        PBFLogPosterContents();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.6();

        (*((void (**)(void *))v80 + 2))(v80);
        v28 = 0;
        v29 = v76;
        v13 = v77;
        v26 = v73;
      }

    }
    else
    {
      if (v45)
        *v45 = objc_retainAutorelease(v26);
      PBFLogPosterContents();
      v58 = objc_claimAutoreleasedReturnValue();
      v13 = v77;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.7();

      (*((void (**)(void))v80 + 2))();
      v28 = 0;
      v29 = v76;
    }

    v42 = v80;
LABEL_66:

    v27 = v95;
    goto LABEL_67;
  }
  v23 = v15;
  v24 = (void *)v22;
  if (a4)
  {
    v81 = v20;
    v82 = v18;
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v99[0] = CFSTR("posterUUID");
    objc_msgSend(MEMORY[0x1E0CB3A28], "pf_nonnullUUIDStringOrSentinel:", v14);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v99[1] = CFSTR("identifierURL");
    v100[0] = v26;
    v100[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3332, v27);
    v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v24;
    v30 = v23;
    v31 = v83;
LABEL_67:

    v20 = v81;
    v18 = v82;
    goto LABEL_68;
  }
  v28 = 0;
  v29 = (void *)v22;
  v30 = v23;
  v31 = v83;
LABEL_68:

  return v28;
}

uint64_t __74__PBFPosterModelStoreCoordinator_createNewStoreCoordinatorWithPath_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
}

+ (int64_t)type
{
  return 0;
}

+ (BOOL)shouldBeExcludedFromBackup
{
  return 0;
}

+ (BOOL)requiresDescriptorIdentifier
{
  return 1;
}

+ (NSString)expectedFileProtection
{
  return (NSString *)(id)*MEMORY[0x1E0C99940];
}

- (PBFPosterModelStoreCoordinator)initWithProvider:(id)a3 identifierURL:(id)a4 posterUUID:(id)a5
{
  return -[PBFPosterModelStoreCoordinator initWithProvider:identifierURL:posterUUID:readonly:](self, "initWithProvider:identifierURL:posterUUID:readonly:", a3, a4, a5, 0);
}

- (PBFPosterModelStoreCoordinator)initWithProvider:(id)a3 identifierURL:(id)a4 posterUUID:(id)a5 readonly:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  PBFPosterModelStoreCoordinator *v13;
  uint64_t v14;
  NSString *extensionIdentifier;
  uint64_t v16;
  NSUUID *posterUUID;
  void *v18;
  uint64_t v19;
  NSURL *providerURL;
  uint64_t v21;
  NSURL *identifierURL;
  PBFPosterModelStoreCoordinator *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PBFPosterModelStoreCoordinator;
  v13 = -[PBFPosterModelStoreCoordinator init](&v25, sel_init);
  if (!v13)
    goto LABEL_3;
  v14 = objc_msgSend(v10, "copy");
  extensionIdentifier = v13->_extensionIdentifier;
  v13->_extensionIdentifier = (NSString *)v14;

  v16 = objc_msgSend(v12, "copy");
  posterUUID = v13->_posterUUID;
  v13->_posterUUID = (NSUUID *)v16;

  objc_msgSend(v11, "URLByDeletingLastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLByDeletingLastPathComponent");
  v19 = objc_claimAutoreleasedReturnValue();
  providerURL = v13->_providerURL;
  v13->_providerURL = (NSURL *)v19;

  v21 = objc_msgSend(v11, "copy");
  identifierURL = v13->_identifierURL;
  v13->_identifierURL = (NSURL *)v21;

  v13->_readonly = a6;
  -[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories:](v13, "_correctPermissionsForInternalDirectories:", 0);
  v23 = 0;
  if (PBFPosterModelStoreCoordinatorSharedInit(v13))
LABEL_3:
    v23 = v13;

  return v23;
}

- (id)checkEnvironmentConsistency
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PBFPosterModelStoreCoordinator_checkEnvironmentConsistency__block_invoke;
  v5[3] = &unk_1E86F2B98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__PBFPosterModelStoreCoordinator_checkEnvironmentConsistency__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_checkEnvironmentConsistency");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)ensureFileSystemIntegrity
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PBFPosterModelStoreCoordinator_ensureFileSystemIntegrity__block_invoke;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  return 0;
}

void __59__PBFPosterModelStoreCoordinator_ensureFileSystemIntegrity__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_fixupResourceValuesWithinURL:synchronous:", 0, 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_accessQueue_snapshotURLs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "expectedSnapshotURLResourceValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessQueue_applyResourceValuesForURLs:expectedResourceValues:synchronous:", v3, v4, 1);

}

+ (NSDictionary)expectedURLResourceValuesForFiles
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_opt_class(), "shouldBeExcludedFromBackup");
  objc_msgSend((id)objc_opt_class(), "expectedFileProtection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = *MEMORY[0x1E0C999D8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = *MEMORY[0x1E0C99938];
  v8[0] = v4;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

+ (NSDictionary)expectedURLResourceValuesForDirectories
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "expectedFileProtection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C99938];
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (id)expectedSnapshotURLResourceValues
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C99938];
  v5[0] = *MEMORY[0x1E0C999D8];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0C99940];
  v6[0] = MEMORY[0x1E0C9AAB0];
  v6[1] = v3;
  v5[2] = *MEMORY[0x1E0C99A08];
  v6[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_correctPermissionsForInternalDirectories:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSURL *identifierURL;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char v21;
  id v22;
  unint64_t v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  char v27;
  NSObject *v28;
  char v29;
  unint64_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  unsigned int v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  _BYTE v48[28];
  _QWORD v49[3];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (-[NSURL checkResourceIsReachableAndReturnError:](self->_identifierURL, "checkResourceIsReachableAndReturnError:"))
  {
    v5 = objc_msgSend((id)objc_opt_class(), "type");
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_roleIdentifierURLForType:identifierURL:", v5, self->_identifierURL);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "pbf_descriptorIdentifierURLForType:identifierURL:", v5, self->_identifierURL);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "expectedURLResourceValuesForFiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C999D8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = v9;
    if (v9)
      v39 = objc_msgSend(v9, "BOOLValue");
    else
      v39 = 0;
    objc_msgSend((id)objc_opt_class(), "expectedURLResourceValuesForFiles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C99938]);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)*MEMORY[0x1E0C99940];
    v34 = (void *)v11;
    if (v11)
      v12 = (void *)v11;
    v13 = v12;
    PBFLogPosterContents();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      identifierURL = self->_identifierURL;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v48 = identifierURL;
      _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> securing file system permissions for URLs under: %@", buf, 0xCu);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v49[0] = self->_identifierURL;
    v49[1] = v6;
    v36 = (void *)v7;
    v37 = (void *)v6;
    v49[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v42 = 0;
          v21 = objc_msgSend(v20, "pbf_setFileProtection:error:", v13, &v42, v34, v35);
          v22 = v42;
          v23 = (unint64_t)v22;
          if ((v21 & 1) == 0)
          {
            v24 = objc_msgSend(v22, "pf_isFileNotFoundError");
            PBFLogPosterContents();
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v24)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v48 = v20;
                _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> skipping nonexistent file: %@", buf, 0xCu);
              }
              goto LABEL_39;
            }
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)v48 = v13;
              *(_WORD *)&v48[8] = 2112;
              *(_QWORD *)&v48[10] = v20;
              *(_WORD *)&v48[18] = 2114;
              *(_QWORD *)&v48[20] = v23;
              _os_log_error_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_ERROR, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct file protection (%{public}@) for file %@: %{public}@", buf, 0x20u);
            }

          }
          v41 = 0;
          v27 = objc_msgSend(v20, "pbf_setPurgable:error:", 0, &v41);
          v26 = v41;
          if ((v27 & 1) == 0)
          {
            PBFLogPosterContents();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v48 = v20;
              *(_WORD *)&v48[8] = 2114;
              *(_QWORD *)&v48[10] = v26;
              _os_log_error_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_ERROR, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct file purgable for file %@: %{public}@", buf, 0x16u);
            }

          }
          v40 = 0;
          v29 = objc_msgSend(v20, "pbf_setExcludedFromBackup:error:", v39, &v40);
          v30 = (unint64_t)v40;
          if ((v29 & 1) == 0)
          {
            PBFLogPosterContents();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v48 = v39;
              *(_WORD *)&v48[4] = 2112;
              *(_QWORD *)&v48[6] = v20;
              *(_WORD *)&v48[14] = 2114;
              *(_QWORD *)&v48[16] = v30;
              _os_log_error_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_ERROR, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct exclude-from-backup (%{BOOL}u) for file %@: %{public}@", buf, 0x1Cu);
            }

          }
          if (a3 && (unint64_t)v26 | v30 | v23)
          {
            if (v30)
              v32 = (id)v30;
            else
              v32 = (id)v23;
            if (v26)
              v33 = v26;
            else
              v33 = v32;
            *a3 = objc_retainAutorelease(v33);
          }

LABEL_39:
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v17);
    }

  }
}

- (id)_accessQueue_contentsOfURLWithinStore:(id)a3 resourceKeys:(id)a4 standardizeURLs:(BOOL)a5
{
  void *v5;
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSFileManager *fileManager;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  BOOL v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v6 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v29 = a4;
  v30 = v9;
  if ((objc_msgSend(v9, "isEqual:", self->_identifierURL) & 1) == 0)
  {
    objc_msgSend(v9, "URLByStandardizingPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL URLByStandardizingPath](self->_identifierURL, "URLByStandardizingPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "hasPrefix:", v12);

    if (!v13)
    {
      v25 = 0;
      goto LABEL_21;
    }
  }
  if (!objc_msgSend(v9, "pbf_isDirectory"))
  {
    objc_msgSend(v29, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v9, "resourceValuesForKeys:error:", v26, 0);

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v9);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__1;
  v41 = __Block_byref_object_dispose__1;
  v42 = 0;
  fileManager = self->_fileManager;
  objc_msgSend(v29, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __101__PBFPosterModelStoreCoordinator__accessQueue_contentsOfURLWithinStore_resourceKeys_standardizeURLs___block_invoke;
  v35[3] = &unk_1E86F4200;
  v35[4] = &v37;
  v36 = v6;
  -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](fileManager, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, v15, 16, v35);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (!v18)
    goto LABEL_18;
  v19 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v32 != v19)
        objc_enumerationMutation(v17);
      v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      v22 = (void *)v38[5];
      if (!v22)
      {
        v23 = objc_opt_new();
        v24 = (void *)v38[5];
        v38[5] = v23;

        v22 = (void *)v38[5];
        if (!v6)
          goto LABEL_14;
LABEL_13:
        objc_msgSend(v21, "URLByStandardizingPath");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v5;
        goto LABEL_14;
      }
      if (v6)
        goto LABEL_13;
LABEL_14:
      objc_msgSend(v22, "addObject:", v21);
      if (v6)

    }
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  }
  while (v18);
LABEL_18:

  v25 = (id)v38[5];
  _Block_object_dispose(&v37, 8);

LABEL_21:
  return v25;
}

uint64_t __101__PBFPosterModelStoreCoordinator__accessQueue_contentsOfURLWithinStore_resourceKeys_standardizeURLs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v7)
  {
    v8 = objc_opt_new();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v5, "URLByStandardizingPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  else
  {
    objc_msgSend(v7, "addObject:", v5);
  }

  return 0;
}

- (void)invalidate
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PBFPosterModelStoreCoordinator_invalidate__block_invoke;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __44__PBFPosterModelStoreCoordinator_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_invalidate");
}

- (NSString)role
{
  void *v4;
  NSObject *v5;
  NSString *role;
  int v7;
  const char *v8;
  __int16 v9;
  NSString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (PFPosterRoleIsValid())
    return self->_role;
  PRPosterRoleLookupForExtensionBundleIdentifier(self->_extensionIdentifier, self->_descriptorIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    role = self->_role;
    v7 = 136315650;
    v8 = "-[PBFPosterModelStoreCoordinator role]";
    v9 = 2112;
    v10 = role;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "%s> invalid role: %@ – returning: %@", (uint8_t *)&v7, 0x20u);
  }

  return (NSString *)v4;
}

- (id)identityOfLatestVersion
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PBFPosterModelStoreCoordinator_identityOfLatestVersion__block_invoke;
  v5[3] = &unk_1E86F2B98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__PBFPosterModelStoreCoordinator_identityOfLatestVersion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_identityOfLatestVersion");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)identityForVersion:(unint64_t)a3 supplement:(unint64_t)a4
{
  NSObject *accessQueue;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PBFPosterModelStoreCoordinator_identityForVersion_supplement___block_invoke;
  v7[3] = &unk_1E86F4228;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(accessQueue, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __64__PBFPosterModelStoreCoordinator_identityForVersion_supplement___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(void **)(a1[4] + 104);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v9 = *(void **)(a1[4] + 112);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[7]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[5] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

- (id)pathForVersion:(unint64_t)a3 supplement:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[PBFPosterModelStoreCoordinator identityForVersion:supplement:](self, "identityForVersion:supplement:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PBFPosterModelStoreCoordinator pathForIdentity:](self, "pathForIdentity:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pathForIdentity:(id)a3
{
  if (!a3)
    return 0;
  -[PBFPosterModelStoreCoordinator _posterPathForIdentity:](self, "_posterPathForIdentity:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allPosterPaths
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PBFPosterModelStoreCoordinator_allPosterPaths__block_invoke;
  v5[3] = &unk_1E86F2B98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__PBFPosterModelStoreCoordinator_allPosterPaths__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_allPosterPaths");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)providerInfo
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PBFPosterModelStoreCoordinator_providerInfo__block_invoke;
  v5[3] = &unk_1E86F2B98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __46__PBFPosterModelStoreCoordinator_providerInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_providerInfoWithError:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PBFPosterModelStoreCoordinator providerInfo](self, "providerInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  v20 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EFA072E0);
    v9 = v20;
    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(NSSecureCoding)]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterModelStoreCoordinator setObject:forKeyedSubscript:].cold.3();
LABEL_20:
      objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA41F94);
    }
  }

  v11 = v7;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator setObject:forKeyedSubscript:].cold.1();
    goto LABEL_20;
  }
  v12 = v11;
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EF9E4A98) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(NSCopying)]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator setObject:forKeyedSubscript:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA41FF8);
  }

  -[PBFPosterModelStoreCoordinator providerInfo](self, "providerInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_opt_new();
  v17 = v16;

  if (v20)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, v12);
  else
    objc_msgSend(v17, "removeObjectForKey:", v12);
  -[PBFPosterModelStoreCoordinator setProviderInfo:](self, "setProviderInfo:", v17);

}

- (void)setProviderInfo:(id)a3
{
  -[PBFPosterModelStoreCoordinator setProviderInfo:error:](self, "setProviderInfo:error:", a3, 0);
}

- (BOOL)setProviderInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *accessQueue;
  uint64_t *v10;
  void *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = v6;
  if (self->_readonly)
  {
    v8 = 0;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__1;
    v20 = __Block_byref_object_dispose__1;
    v21 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PBFPosterModelStoreCoordinator_setProviderInfo_error___block_invoke;
    block[3] = &unk_1E86F4250;
    block[4] = self;
    v14 = v6;
    v15 = &v16;
    dispatch_sync(accessQueue, block);
    v10 = v17;
    if (a4)
    {
      v11 = (void *)v17[5];
      if (v11)
      {
        *a4 = objc_retainAutorelease(v11);
        v10 = v17;
      }
    }
    v8 = v10[5] == 0;

    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

void __56__PBFPosterModelStoreCoordinator_setProviderInfo_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id *v3;
  id obj;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "_accessQueue_writeProviderInfo:error:", v1, &obj);
  objc_storeStrong(v3, obj);
}

- (id)_posterPathForIdentity:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PBFPosterModelStoreCoordinator__posterPathForIdentity___block_invoke;
  block[3] = &unk_1E86F4278;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__PBFPosterModelStoreCoordinator__posterPathForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_posterPathForIdentity:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessQueue_posterPathForIdentity:(id)a3
{
  id v4;
  NSURL *v5;
  NSMutableDictionary *accessQueue_stagedPosterIdentityBySupplementByVersion;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = self->_providerURL;
  accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](accessQueue_stagedPosterIdentityBySupplementByVersion, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "supplement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    __providerURLForOptions(1, self->_providerURL, v4);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (NSURL *)v11;
  }
  objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", v5, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)pathOfLatestVersion
{
  void *v3;
  void *v4;

  -[PBFPosterModelStoreCoordinator identityOfLatestVersion](self, "identityOfLatestVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterModelStoreCoordinator pathForIdentity:](self, "pathForIdentity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasKnownVersions
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PBFPosterModelStoreCoordinator_hasKnownVersions__block_invoke;
  v5[3] = &unk_1E86F2B98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__PBFPosterModelStoreCoordinator_hasKnownVersions__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)reapEverythingExceptLatestVersion
{
  NSObject *accessQueue;
  _QWORD block[5];

  if (!self->_readonly)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke;
    block[3] = &unk_1E86F2518;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

void __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[6];

  __knownVersions(*(void **)(*(_QWORD *)(a1 + 32) + 104));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  __knownVersions(*(void **)(*(_QWORD *)(a1 + 32) + 112));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    objc_msgSend(v4, "addIndexes:", v2);
  if (objc_msgSend(v4, "count"))
  {
    v3 = objc_msgSend(v4, "lastIndex");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke_2;
    v5[3] = &unk_1E86F42C8;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v3;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v5);
  }

}

void __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[8];

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __knownVersions(v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "count");
  if (objc_msgSend(v9, "count"))
  {
    v7 = objc_msgSend(v9, "lastIndex");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke_3;
    v10[3] = &unk_1E86F42A0;
    v8 = *(_QWORD *)(a1 + 32);
    v10[6] = *(_QWORD *)(a1 + 40);
    v10[7] = v7;
    v10[4] = v8;
    v10[5] = a2;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v10);
  }

}

uint64_t __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 40) != *(_QWORD *)(result + 48) || *(_QWORD *)(result + 56) != a2)
    return objc_msgSend(*(id *)(result + 32), "_accessQueue_removeSupplement:forVersion:error:", a2);
  return result;
}

- (void)reapSnapshots
{
  NSObject *accessQueue;
  _QWORD block[5];

  if (!self->_readonly)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PBFPosterModelStoreCoordinator_reapSnapshots__block_invoke;
    block[3] = &unk_1E86F2518;
    block[4] = self;
    dispatch_sync(accessQueue, block);
  }
}

void __47__PBFPosterModelStoreCoordinator_reapSnapshots__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_snapshotURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeAllObjects");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
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
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBFLogReaper();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v16 = v8;
          _os_log_impl(&dword_1CB9FA000, v9, OS_LOG_TYPE_INFO, "REAPING SNAPSHOT URL %{public}@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeItemAtURL:error:", v8, 0);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

}

- (id)reapSnapshotsMatchingURLs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *accessQueue;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (self->_readonly)
  {
    v6 = 0;
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    v17 = (id)objc_msgSend(v4, "mutableCopy");
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PBFPosterModelStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke;
    block[3] = &unk_1E86F4318;
    block[4] = self;
    v11 = &v12;
    v10 = v5;
    dispatch_sync(accessQueue, block);
    v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void __60__PBFPosterModelStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v2 = (void *)objc_opt_new();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PBFPosterModelStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke_2;
  v5[3] = &unk_1E86F42F0;
  v8 = *(_QWORD *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = v2;
  v4 = v2;
  objc_msgSend(v3, "_accessQueue_enumerateSnapshotCoordinators:", v5);

}

void __60__PBFPosterModelStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v7, "removeSnapshotsAtURLs:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minusSet:", v4);

  objc_msgSend(v7, "snapshotURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (NSSet)snapshotURLs
{
  NSObject *accessQueue;
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (self->_readonly)
    return (NSSet *)0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PBFPosterModelStoreCoordinator_snapshotURLs__block_invoke;
  v5[3] = &unk_1E86F2B98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v4 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v4;
}

void __46__PBFPosterModelStoreCoordinator_snapshotURLs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_snapshotURLs");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessQueue_snapshotURLs
{
  void *v3;
  NSFileManager *fileManager;
  NSURL *identifierURL;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  fileManager = self->_fileManager;
  identifierURL = self->_identifierURL;
  v6 = *MEMORY[0x1E0C99968];
  v27[0] = *MEMORY[0x1E0C99968];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __59__PBFPosterModelStoreCoordinator__accessQueue_snapshotURLs__block_invoke;
  v25[3] = &unk_1E86F4340;
  v25[4] = self;
  -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](fileManager, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", identifierURL, v7, 20, v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    v13 = *MEMORY[0x1E0C99978];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
        v20 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v20, v6, 0);
        v16 = v20;
        if (objc_msgSend(v16, "isEqualToString:", v13)
          && objc_msgSend(v15, "pbf_isPosterSnapshot"))
        {
          objc_msgSend(v15, "URLByStandardizingPath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v17);

        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_msgSend(v3, "copy");
  return v18;
}

uint64_t __59__PBFPosterModelStoreCoordinator__accessQueue_snapshotURLs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  PBFLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __59__PBFPosterModelStoreCoordinator__accessQueue_snapshotURLs__block_invoke_cold_1(a1, (uint64_t)v4, v5);

  return 1;
}

- (id)addNewVersionWithContents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *accessQueue;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = v6;
  if (self->_readonly)
  {
    v8 = 0;
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__1;
    v27 = __Block_byref_object_dispose__1;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    v22 = 0;
    accessQueue = self->_accessQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__PBFPosterModelStoreCoordinator_addNewVersionWithContents_error___block_invoke;
    v13[3] = &unk_1E86F4368;
    v15 = &v23;
    v13[4] = self;
    v14 = v6;
    v16 = &v17;
    dispatch_sync(accessQueue, v13);
    v10 = (void *)v18[5];
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      PBFLogPosterContents();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PBFPosterModelStoreCoordinator addNewVersionWithContents:error:].cold.1();

    }
    v8 = (id)v24[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

  }
  return v8;
}

void __66__PBFPosterModelStoreCoordinator_addNewVersionWithContents_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "_accessQueue_setupNewVersionWithOptions:contents:error:", 0, v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)addNewSupplementWithError:(id *)a3
{
  NSObject *accessQueue;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if (self->_readonly)
    return 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PBFPosterModelStoreCoordinator_addNewSupplementWithError___block_invoke;
  block[3] = &unk_1E86F4390;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(accessQueue, block);
  v6 = (void *)v11[5];
  if (v6)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    PBFLogPosterContents();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator addNewSupplementWithError:].cold.1();

  }
  v8 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __60__PBFPosterModelStoreCoordinator_addNewSupplementWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "_accessQueue_setupNewSupplementWithOptions:error:", 0, &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v3, obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)stageNewVersionWithContents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *accessQueue;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = v6;
  if (self->_readonly)
  {
    v8 = 0;
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__1;
    v27 = __Block_byref_object_dispose__1;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    v22 = 0;
    accessQueue = self->_accessQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__PBFPosterModelStoreCoordinator_stageNewVersionWithContents_error___block_invoke;
    v13[3] = &unk_1E86F4368;
    v15 = &v23;
    v13[4] = self;
    v14 = v6;
    v16 = &v17;
    dispatch_sync(accessQueue, v13);
    v10 = (void *)v18[5];
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      PBFLogPosterContents();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[PBFPosterModelStoreCoordinator stageNewVersionWithContents:error:].cold.1();

    }
    v8 = (id)v24[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

  }
  return v8;
}

void __68__PBFPosterModelStoreCoordinator_stageNewVersionWithContents_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = (id *)(*(_QWORD *)(a1[7] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "_accessQueue_setupNewVersionWithOptions:contents:error:", 1, v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)stageNewSupplementWithError:(id *)a3
{
  NSObject *accessQueue;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if (self->_readonly)
    return 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PBFPosterModelStoreCoordinator_stageNewSupplementWithError___block_invoke;
  block[3] = &unk_1E86F4390;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(accessQueue, block);
  v6 = (void *)v11[5];
  if (v6)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    PBFLogPosterContents();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator stageNewSupplementWithError:].cold.1();

  }
  v8 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __62__PBFPosterModelStoreCoordinator_stageNewSupplementWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  objc_msgSend(v2, "_accessQueue_setupNewSupplementWithOptions:error:", 1, &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v3, obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)abortStaged
{
  NSObject *accessQueue;
  _QWORD block[5];

  if (!self->_readonly)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PBFPosterModelStoreCoordinator_abortStaged__block_invoke;
    block[3] = &unk_1E86F2518;
    block[4] = self;
    dispatch_sync(accessQueue, block);
  }
}

uint64_t __45__PBFPosterModelStoreCoordinator_abortStaged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PBFPosterModelStoreCoordinator_abortStaged__block_invoke_2;
  v5[3] = &unk_1E86F43B8;
  v5[4] = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeAllObjects");
}

void __45__PBFPosterModelStoreCoordinator_abortStaged__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "keyEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "_accessQueue_removeSupplement:forVersion:error:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "unsignedLongLongValue"), objc_msgSend(v5, "unsignedLongLongValue"), 0);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)commitStagedWithError:(id *)a3
{
  BOOL v3;
  NSFileManager *v6;
  NSObject *accessQueue;
  NSFileManager *v8;
  void *v9;
  _QWORD v11[5];
  NSFileManager *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  if (self->_readonly)
    return 0;
  v6 = self->_fileManager;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  accessQueue = self->_accessQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke;
  v11[3] = &unk_1E86F4408;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  v14 = &v21;
  dispatch_sync(accessQueue, v11);
  if (a3)
  {
    v9 = (void *)v16[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v3 = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v3;
}

void __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(v4 + 112);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke_2;
  v26[3] = &unk_1E86F43E0;
  v26[4] = v4;
  v7 = v2;
  v27 = v7;
  v8 = v3;
  v28 = v8;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v29 = v9;
  v30 = v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v26);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v11 = v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 112);
    v25[0] = v5;
    v25[1] = 3221225472;
    v25[2] = __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke_3;
    v25[3] = &unk_1E86F43B8;
    v25[4] = v12;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v25);
    v11 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", (_QWORD)v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeItemAtURL:error:", v19, 0);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v16);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeAllObjects");
}

void __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  int v17;
  char v18;
  int v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v29 = a3;
  objc_msgSend(v29, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        objc_msgSend(v29, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        __providerURLForOptions(1, *(void **)(*(_QWORD *)(a1 + 32) + 48), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        __providerURLForOptions(0, *(void **)(*(_QWORD *)(a1 + 32) + 48), v6);
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", v7, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)v8;
        objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", v8, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "supplementURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "supplementURL");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "instanceURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "instanceURL");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
        v30 = (void *)v13;
        LOBYTE(v13) = objc_msgSend((id)v13, "checkResourceIsReachableAndReturnError:", 0);
        v14 = objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0);
        if ((v13 & 1) == 0)
        {
          if (v14)
          {
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v31);
            v15 = *(void **)(a1 + 56);
            v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v34 = *(id *)(v16 + 40);
            v17 = objc_msgSend(v15, "moveItemAtURL:toURL:error:", v12, v30, &v34);
            objc_storeStrong((id *)(v16 + 40), v34);
            if (!v17)
              goto LABEL_21;
          }
        }
        v18 = objc_msgSend(v32, "checkResourceIsReachableAndReturnError:", 0);
        v19 = objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", 0);
        if ((v18 & 1) == 0)
        {
          if (v19)
          {
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v32);
            v20 = *(void **)(a1 + 56);
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v33 = *(id *)(v21 + 40);
            v22 = objc_msgSend(v20, "moveItemAtURL:toURL:error:", v11, v32, &v33);
            objc_storeStrong((id *)(v21 + 40), v33);
            if (!v22)
            {
LABEL_21:
              *a4 = 1;

              goto LABEL_22;
            }
          }
        }
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadFocusConfigurationForPath:error:", v9, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(MEMORY[0x1E0D7FB50], "storeFocusConfigurationForPath:focusConfiguration:error:", v10, v23, 0);
        else
          objc_msgSend(MEMORY[0x1E0D7FB50], "removeFocusConfigurationForPath:error:", v10, 0);
        objc_msgSend(MEMORY[0x1E0D7FB50], "loadSuggestionMetadataForPath:error:", v9, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(MEMORY[0x1E0D7FB50], "storeSuggestionMetadataForPath:suggestionMetadata:error:", v10, v24, 0);
        else
          objc_msgSend(MEMORY[0x1E0D7FB50], "removeSuggestionMetadataForPath:error:", v10, 0);

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v28)
        continue;
      break;
    }
  }
LABEL_22:

}

void __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);
  }
  else
  {
    v9 = objc_msgSend(v6, "mutableCopy");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v9, v10);
    v6 = (id)v9;
  }

}

- (void)removeSupplement:(unint64_t)a3 forVersion:(unint64_t)a4 error:(id *)a5
{
  NSObject *accessQueue;
  void *v7;
  NSObject *v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (!self->_readonly)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__1;
    v14 = __Block_byref_object_dispose__1;
    v15 = 0;
    accessQueue = self->_accessQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__PBFPosterModelStoreCoordinator_removeSupplement_forVersion_error___block_invoke;
    v9[3] = &unk_1E86F4430;
    v9[6] = a3;
    v9[7] = a4;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(accessQueue, v9);
    v7 = (void *)v11[5];
    if (v7)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v7);
      PBFLogPosterContents();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PBFPosterModelStoreCoordinator removeSupplement:forVersion:error:].cold.1();

    }
    _Block_object_dispose(&v10, 8);

  }
}

void __68__PBFPosterModelStoreCoordinator_removeSupplement_forVersion_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id *v4;
  id obj;

  v1 = a1[6];
  v2 = a1[7];
  v3 = (void *)a1[4];
  v4 = (id *)(*(_QWORD *)(a1[5] + 8) + 40);
  obj = 0;
  objc_msgSend(v3, "_accessQueue_removeSupplement:forVersion:error:", v1, v2, &obj);
  objc_storeStrong(v4, obj);
}

- (id)pbf_posterSnapshotCoordinatorForIdentity:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PBFPosterModelStoreCoordinator_pbf_posterSnapshotCoordinatorForIdentity___block_invoke;
  block[3] = &unk_1E86F4278;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __75__PBFPosterModelStoreCoordinator_pbf_posterSnapshotCoordinatorForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_posterSnapshotCoordinatorForIdentity:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)pbf_enumerateSnapshotCoordinators:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PBFPosterModelStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke;
  block[3] = &unk_1E86F4458;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

uint64_t __68__PBFPosterModelStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_enumerateSnapshotCoordinators:", *(_QWORD *)(a1 + 40));
}

- (void)_accessQueue_enumerateSnapshotCoordinators:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PBFPosterModelStoreCoordinator _accessQueue_allPosterPaths](self, "_accessQueue_allPosterPaths", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "identity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterModelStoreCoordinator _accessQueue_posterSnapshotCoordinatorForIdentity:](self, "_accessQueue_posterSnapshotCoordinatorForIdentity:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v11, v10, &v16);

      LODWORD(v11) = v16;
      if ((_DWORD)v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_accessQueue_posterSnapshotCoordinatorForIdentity:(id)a3
{
  id v4;
  NSMapTable *accessQueue_identityToPosterSnapshotCoordinator;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;
  PBFPosterSnapshotCoordinator *v9;
  void *v10;
  PBFPosterSnapshotCoordinator *v11;

  v4 = a3;
  accessQueue_identityToPosterSnapshotCoordinator = self->_accessQueue_identityToPosterSnapshotCoordinator;
  if (!accessQueue_identityToPosterSnapshotCoordinator)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_accessQueue_identityToPosterSnapshotCoordinator;
    self->_accessQueue_identityToPosterSnapshotCoordinator = v6;

    accessQueue_identityToPosterSnapshotCoordinator = self->_accessQueue_identityToPosterSnapshotCoordinator;
  }
  -[NSMapTable objectForKey:](accessQueue_identityToPosterSnapshotCoordinator, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    -[PBFPosterModelStoreCoordinator _accessQueue_posterPathForIdentity:](self, "_accessQueue_posterPathForIdentity:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[PBFPosterSnapshotCoordinator initWithPath:]([PBFPosterSnapshotCoordinator alloc], "initWithPath:", v10);
      -[NSMapTable setObject:forKey:](self->_accessQueue_identityToPosterSnapshotCoordinator, "setObject:forKey:", v11, v4);
      v9 = v11;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)_accessQueue_checkEnvironmentConsistency
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSString *extensionIdentifier;
  objc_class *v8;
  NSString *v9;
  NSURL *v10;
  NSURL *v11;
  NSURL *v12;
  NSURL *v13;
  NSUUID *v14;
  NSString *v15;
  NSURL *v16;
  NSURL *v17;
  NSURL *v18;
  NSURL *v19;
  NSUUID *v20;
  NSString *v21;
  BOOL v22;
  NSUUID *v23;
  NSUUID *v24;
  BOOL v25;
  NSUUID *v26;
  id v27;
  NSUUID *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSString *v32;
  objc_class *v33;
  NSString *v34;
  NSObject *v35;
  NSObject *v36;
  NSString *v37;
  objc_class *v38;
  NSString *v39;
  NSUUID *v40;
  NSObject *v41;
  NSObject *v42;
  NSString *v43;
  objc_class *v44;
  NSString *v45;
  NSUUID *v46;
  NSUUID *v47;
  NSUUID *v48;
  NSObject *v49;
  NSObject *v50;
  NSString *v51;
  objc_class *v52;
  NSString *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  NSString *v71;
  NSObject *v72;
  void *v73;
  NSString *v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  PBFPosterModelStoreCoordinator *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  id v89;
  id v90;
  BOOL v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  uint64_t v96;
  NSMutableDictionary *accessQueue_posterIdentityBySupplementByVersion;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  NSObject *v102;
  NSString *v103;
  NSObject *v104;
  void *v105;
  NSObject *v106;
  NSObject *v107;
  NSString *v108;
  objc_class *v109;
  NSString *v110;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  NSUUID *v124;
  void *v125;
  os_signpost_id_t spid;
  NSURL *v127;
  unint64_t v128;
  NSURL *v129;
  NSURL *v130;
  NSURL *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  id obj;
  NSString *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  NSString *v141;
  NSUUID *v142;
  void *v143;
  void *v144;
  NSFileManager *v145;
  uint64_t v146;
  id v147;
  _QWORD v148[5];
  id v149;
  _QWORD v150[4];
  id v151;
  id v152;
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  id v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  NSUUID *v164;
  id v165;
  NSUUID *v166;
  id v167;
  uint8_t buf[4];
  const char *v169;
  __int16 v170;
  NSString *v171;
  __int16 v172;
  NSUUID *v173;
  __int16 v174;
  uint64_t v175;
  __int16 v176;
  uint64_t v177;
  __int16 v178;
  uint64_t v179;
  __int16 v180;
  void *v181;
  _BYTE v182[128];
  _BYTE v183[128];
  uint64_t v184;

  v184 = *MEMORY[0x1E0C80C00];
  PBFLogPosterContents();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  PBFLogPosterContents();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  spid = v4;
  v128 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    extensionIdentifier = self->_extensionIdentifier;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v169 = (const char *)extensionIdentifier;
    v170 = 2114;
    v171 = v9;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@",
      buf,
      0x16u);

  }
  v10 = self->_providerInfoURL;
  v11 = self->_containerVersionsURL;
  v12 = self->_identifierURL;
  v13 = self->_providerURL;
  v14 = self->_posterUUID;
  v15 = self->_extensionIdentifier;
  v145 = self->_fileManager;
  v16 = v13;
  NSClassFromString(CFSTR("NSURL"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.1();
    objc_msgSend(objc_retainAutorelease(v112), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45804);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.1();
    objc_msgSend(objc_retainAutorelease(v113), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45868);
  }
  v127 = v16;

  v17 = v10;
  NSClassFromString(CFSTR("NSURL"));
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.2();
    objc_msgSend(objc_retainAutorelease(v114), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA458CCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.2();
    objc_msgSend(objc_retainAutorelease(v115), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45930);
  }
  v129 = v17;

  v18 = v11;
  NSClassFromString(CFSTR("NSURL"));
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.3();
    objc_msgSend(objc_retainAutorelease(v116), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45994);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.3();
    objc_msgSend(objc_retainAutorelease(v117), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA459F8);
  }
  v130 = v18;

  v19 = v12;
  NSClassFromString(CFSTR("NSURL"));
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.4();
    objc_msgSend(objc_retainAutorelease(v118), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45A5CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.4();
    objc_msgSend(objc_retainAutorelease(v119), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45AC0);
  }
  v131 = v19;

  v20 = v14;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.5();
    objc_msgSend(objc_retainAutorelease(v120), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45B24);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.5();
    objc_msgSend(objc_retainAutorelease(v121), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45B88);
  }
  v142 = v20;

  v21 = v15;
  NSClassFromString(CFSTR("NSString"));
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.6();
    objc_msgSend(objc_retainAutorelease(v122), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45BECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.6();
    objc_msgSend(objc_retainAutorelease(v123), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA45C50);
  }
  v141 = v21;

  v167 = 0;
  v22 = -[NSURL checkResourceIsReachableAndReturnError:](v131, "checkResourceIsReachableAndReturnError:", &v167);
  v23 = (NSUUID *)v167;
  v24 = v23;
  if (v22)
  {
    v166 = v23;
    v25 = -[NSURL checkResourceIsReachableAndReturnError:](v130, "checkResourceIsReachableAndReturnError:", &v166);
    v26 = v166;

    if (v25)
    {
      if (-[NSURL checkResourceIsReachableAndReturnError:](v129, "checkResourceIsReachableAndReturnError:", 0))
      {
        v165 = 0;
        v27 = -[PBFPosterModelStoreCoordinator _accessQueue_providerInfoWithError:](self, "_accessQueue_providerInfoWithError:", &v165);
        v28 = (NSUUID *)v165;
        if (v28)
        {
          PBFLogPosterContents();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.7();

          PBFLogPosterContents();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            v32 = self->_extensionIdentifier;
            v33 = (objc_class *)objc_opt_class();
            NSStringFromClass(v33);
            v34 = (NSString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v169 = (const char *)v32;
            v170 = 2114;
            v171 = v34;
            v172 = 2114;
            v173 = v28;
            _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v31, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
              buf,
              0x20u);

          }
        }

      }
      else
      {
        -[PBFPosterModelStoreCoordinator _accessQueue_writeProviderInfo:error:](self, "_accessQueue_writeProviderInfo:error:", MEMORY[0x1E0C9AA70], 0);
      }
      v164 = v26;
      -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](v145, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v130, 0, 1, &v164);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v164;

      v124 = v48;
      if (v48)
      {
        PBFLogPosterContents();
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v49;
        if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          v51 = self->_extensionIdentifier;
          v52 = (objc_class *)objc_opt_class();
          NSStringFromClass(v52);
          v53 = (NSString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v169 = (const char *)v51;
          v170 = 2114;
          v171 = v53;
          v172 = 2114;
          v173 = v124;
          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v50, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
            buf,
            0x20u);

        }
        v46 = v124;
        v47 = v124;
LABEL_102:

        goto LABEL_103;
      }
      if (_accessQueue_checkEnvironmentConsistency___once != -1)
        dispatch_once(&_accessQueue_checkEnvironmentConsistency___once, &__block_literal_global_4);
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = 0u;
      v161 = 0u;
      v162 = 0u;
      v163 = 0u;
      obj = v125;
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v183, 16);
      if (!v54)
      {
LABEL_98:

        __knownVersions(self->_accessQueue_posterIdentityBySupplementByVersion);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "removeIndexes:", v132);
        v148[0] = MEMORY[0x1E0C809B0];
        v148[1] = 3221225472;
        v148[2] = __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke_77;
        v148[3] = &unk_1E86F44C0;
        v148[4] = self;
        objc_msgSend(v105, "enumerateIndexesUsingBlock:", v148);
        -[NSMutableDictionary removeAllObjects](self->_accessQueue_stagedPosterIdentityBySupplementByVersion, "removeAllObjects");
        PBFLogPosterContents();
        v106 = objc_claimAutoreleasedReturnValue();
        v107 = v106;
        if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
        {
          v108 = self->_extensionIdentifier;
          v109 = (objc_class *)objc_opt_class();
          NSStringFromClass(v109);
          v110 = (NSString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v169 = (const char *)v108;
          v170 = 2114;
          v171 = v110;
          v172 = 2114;
          v173 = 0;
          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v107, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
            buf,
            0x20u);

        }
        v47 = 0;
        v46 = 0;
        goto LABEL_102;
      }
      v55 = v54;
      v56 = *(_QWORD *)v161;
      v133 = *(_QWORD *)v161;
      while (1)
      {
        v57 = 0;
        v134 = v55;
        do
        {
          if (*(_QWORD *)v161 != v56)
            objc_enumerationMutation(obj);
          v58 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v57);
          objc_msgSend(v58, "lastPathComponent");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)_accessQueue_checkEnvironmentConsistency_numberFormatter, "numberFromString:", v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "unsignedLongLongValue");

          v62 = (void *)_accessQueue_checkEnvironmentConsistency_numberFormatter;
          v63 = v61;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v61);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "stringFromNumber:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v59, "isEqualToString:", v65);

          if (!v66)
            goto LABEL_154;
          objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathSupplementContainerURLForInstanceURL:", v58);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = v67;
          if ((objc_msgSend(v67, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
          {
            PBFLogPosterContents();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
              v170 = 2112;
              v171 = v141;
              v172 = 2112;
              v173 = v142;
              v174 = 2048;
              v175 = v63;
              _os_log_impl(&dword_1CB9FA000, v68, OS_LOG_TYPE_DEFAULT, "%s> creating migration supplement for provider=%@ uuid=%@ version=%llu", buf, 0x2Au);
            }

            objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathSupplementURLForInstanceURL:supplement:", v58, 0);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            PFFileProtectionNoneAttributes();
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v159 = 0;
            -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v145, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v69, 1, v70, &v159);
            v71 = (NSString *)v159;

            if (v71)
            {
              PBFLogPosterContents();
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
                v170 = 2112;
                v171 = v71;
                _os_log_error_impl(&dword_1CB9FA000, v72, OS_LOG_TYPE_ERROR, "%s> error creating migration supplement: %@", buf, 0x16u);
              }

            }
            v67 = v140;
          }
          v138 = v59;
          v139 = v57;
          v158 = 0;
          -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](v145, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v67, 0, 1, &v158);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (NSString *)v158;
          if (v74)
          {
            PBFLogPosterContents();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
              v170 = 2112;
              v171 = v74;
              _os_log_error_impl(&dword_1CB9FA000, v75, OS_LOG_TYPE_ERROR, "%s> error fetching supplements from filesystem: %@", buf, 0x16u);
            }

          }
          v136 = v74;
          v137 = v58;
          v146 = v63;
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v154 = 0u;
          v155 = 0u;
          v156 = 0u;
          v157 = 0u;
          v147 = v73;
          v76 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v154, v182, 16);
          if (v76)
          {
            v77 = v76;
            v78 = *(_QWORD *)v155;
            do
            {
              for (i = 0; i != v77; ++i)
              {
                v80 = self;
                if (*(_QWORD *)v155 != v78)
                  objc_enumerationMutation(v147);
                v81 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * i);
                objc_msgSend(v81, "lastPathComponent");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)_accessQueue_checkEnvironmentConsistency_numberFormatter, "numberFromString:", v82);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = objc_msgSend(v83, "unsignedLongLongValue");

                v85 = (void *)_accessQueue_checkEnvironmentConsistency_numberFormatter;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v84);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "stringFromNumber:", v86);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = objc_msgSend(v82, "isEqualToString:", v87);

                if (v88)
                {
                  v153 = 0;
                  self = v80;
                  -[PBFPosterModelStoreCoordinator _accessQueue_fetchIdentityForVersion:supplement:error:](v80, "_accessQueue_fetchIdentityForVersion:supplement:error:", v146, v84, &v153);
                  v89 = (id)objc_claimAutoreleasedReturnValue();
                  v90 = v153;
                  if (v89)
                    v91 = v90 == 0;
                  else
                    v91 = 0;
                  if (v91)
                  {
                    objc_msgSend(v144, "addIndex:", v84);
                    goto LABEL_83;
                  }
                  v92 = v90;
                  PBFLogPosterContents();
                  v93 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend((id)objc_opt_class(), "type");
                    NSStringFromPFServerPosterType();
                    v143 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 136316674;
                    v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
                    v170 = 2112;
                    v171 = v141;
                    v172 = 2112;
                    v173 = v142;
                    v174 = 2112;
                    v175 = (uint64_t)v143;
                    v176 = 2048;
                    v177 = v146;
                    v178 = 2048;
                    v179 = v84;
                    v180 = 2112;
                    v181 = v92;
                    _os_log_error_impl(&dword_1CB9FA000, v93, OS_LOG_TYPE_ERROR, "%s> error loading supplement from filesystem: provider=%@ uuid=%@ type=%@ version=%llu supplement=%llu : error=%@", buf, 0x48u);

                  }
                }
                self = v80;
                if (v80->_readonly)
                  goto LABEL_84;
                PBFLogReaper();
                v94 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v169 = (const char *)v81;
                  _os_log_impl(&dword_1CB9FA000, v94, OS_LOG_TYPE_DEFAULT, "REAPING %{public}@", buf, 0xCu);
                }

                v152 = 0;
                -[NSFileManager removeItemAtURL:error:](v145, "removeItemAtURL:error:", v81, &v152);
                v89 = v152;
                if (v89)
                {
                  PBFLogPosterContents();
                  v95 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
                    v170 = 2112;
                    v171 = (NSString *)v89;
                    _os_log_error_impl(&dword_1CB9FA000, v95, OS_LOG_TYPE_ERROR, "%s> error removing invalid supplement: %@", buf, 0x16u);
                  }

                }
LABEL_83:

LABEL_84:
              }
              v77 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v154, v182, 16);
            }
            while (v77);
          }

          v96 = objc_msgSend(v144, "count");
          accessQueue_posterIdentityBySupplementByVersion = self->_accessQueue_posterIdentityBySupplementByVersion;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v146);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](accessQueue_posterIdentityBySupplementByVersion, "objectForKey:", v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          __knownVersions(v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "removeIndexes:", v144);
          v150[0] = MEMORY[0x1E0C809B0];
          v150[1] = 3221225472;
          v150[2] = __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke_76;
          v150[3] = &unk_1E86F44C0;
          v151 = v99;
          v101 = v99;
          objc_msgSend(v100, "enumerateIndexesUsingBlock:", v150);

          v56 = v133;
          v55 = v134;
          v59 = v138;
          v57 = v139;
          v58 = v137;
          if (v96)
          {
            objc_msgSend(v132, "addIndex:", v146);
          }
          else
          {
LABEL_154:
            if (!self->_readonly)
            {
              PBFLogReaper();
              v102 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v169 = (const char *)v58;
                _os_log_impl(&dword_1CB9FA000, v102, OS_LOG_TYPE_DEFAULT, "REAPING instance %{public}@", buf, 0xCu);
              }

              v149 = 0;
              -[NSFileManager removeItemAtURL:error:](v145, "removeItemAtURL:error:", v58, &v149);
              v103 = (NSString *)v149;
              if (v103)
              {
                PBFLogPosterContents();
                v104 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
                  v170 = 2112;
                  v171 = v103;
                  _os_log_error_impl(&dword_1CB9FA000, v104, OS_LOG_TYPE_ERROR, "%s> error removing invalid version: %@", buf, 0x16u);
                }

              }
            }
          }

          ++v57;
        }
        while (v57 != v55);
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v183, 16);
        if (!v55)
          goto LABEL_98;
      }
    }
    PBFLogPosterContents();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      v43 = self->_extensionIdentifier;
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v169 = (const char *)v43;
      v170 = 2114;
      v171 = v45;
      v172 = 2114;
      v173 = v26;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v42, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
        buf,
        0x20u);

    }
    v40 = v26;
  }
  else
  {
    PBFLogPosterContents();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      v37 = self->_extensionIdentifier;
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v169 = (const char *)v37;
      v170 = 2114;
      v171 = v39;
      v172 = 2114;
      v173 = v24;
      _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v36, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
        buf,
        0x20u);

    }
    v40 = v24;
  }
  v46 = v40;
  v47 = v40;
LABEL_103:

  return v47;
}

void __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_accessQueue_checkEnvironmentConsistency_numberFormatter;
  _accessQueue_checkEnvironmentConsistency_numberFormatter = (uint64_t)v0;

  v2 = (void *)_accessQueue_checkEnvironmentConsistency_numberFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

void __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke_76(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

void __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke_77(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

- (id)_accessQueue_providerInfoWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", self->_providerInfoURL, 1, a3);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v8, v4, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;

    if (a3 && v10)
    {
      v10 = objc_retainAutorelease(v10);
      *a3 = v10;
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }

  return v9;
}

- (void)_accessQueue_writeProviderInfo:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;

  if (!self->_readonly)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "writeToURL:options:error:", self->_providerInfoURL, 268435457, a4);
      v6 = v7;
    }

  }
}

- (void)_accessQueue_invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMapTable *accessQueue_identityToPosterSnapshotCoordinator;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_accessQueue_identityToPosterSnapshotCoordinator, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeAllSnapshots");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMapTable removeAllObjects](self->_accessQueue_identityToPosterSnapshotCoordinator, "removeAllObjects");
  accessQueue_identityToPosterSnapshotCoordinator = self->_accessQueue_identityToPosterSnapshotCoordinator;
  self->_accessQueue_identityToPosterSnapshotCoordinator = 0;

}

- (id)_accessQueue_allPosterPaths
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  PBFPosterModelStoreCoordinator *v13;

  v3 = (void *)objc_opt_new();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __61__PBFPosterModelStoreCoordinator__accessQueue_allPosterPaths__block_invoke;
  v11 = &unk_1E86F4510;
  v4 = v3;
  v12 = v4;
  v13 = self;
  v5 = _Block_copy(&v8);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_accessQueue_posterIdentityBySupplementByVersion, "enumerateKeysAndObjectsUsingBlock:", v5, v8, v9, v10, v11);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_accessQueue_stagedPosterIdentityBySupplementByVersion, "enumerateKeysAndObjectsUsingBlock:", v5);
  v6 = v4;

  return v6;
}

void __61__PBFPosterModelStoreCoordinator__accessQueue_allPosterPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PBFPosterModelStoreCoordinator__accessQueue_allPosterPaths__block_invoke_2;
  v7[3] = &unk_1E86F44E8;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __61__PBFPosterModelStoreCoordinator__accessQueue_allPosterPaths__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_accessQueue_posterPathForIdentity:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeAddObject:", v2);

}

- (id)_accessQueue_identityOfLatestVersion
{
  void *v3;
  void *v4;
  NSMutableDictionary *accessQueue_posterIdentityBySupplementByVersion;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *accessQueue_stagedPosterIdentityBySupplementByVersion;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  __knownVersions(self->_accessQueue_posterIdentityBySupplementByVersion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    accessQueue_posterIdentityBySupplementByVersion = self->_accessQueue_posterIdentityBySupplementByVersion;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "lastIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](accessQueue_posterIdentityBySupplementByVersion, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    __knownVersions(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "lastIndex"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  __knownVersions(self->_accessQueue_stagedPosterIdentityBySupplementByVersion);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "lastIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](accessQueue_stagedPosterIdentityBySupplementByVersion, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    __knownVersions(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "lastIndex"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v19;
    }

  }
  return v11;
}

- (id)_accessQueue_setupNewVersionWithOptions:(unint64_t)a3 contents:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  NSMutableDictionary *accessQueue_stagedPosterIdentityBySupplementByVersion;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[PBFPosterModelStoreCoordinator _accessQueue_identityOfLatestVersion](self, "_accessQueue_identityOfLatestVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    -[PBFPosterModelStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](self, "_accessQueue_buildIdentityForVersion:supplement:", objc_msgSend(v9, "version") + 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isNewerVersionOfIdentity:", v10) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nextIdentity=%@ must be a newer form of latestIdentity=%@"), v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterModelStoreCoordinator _accessQueue_setupNewVersionWithOptions:contents:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA46474);
    }
  }
  else
  {
    -[PBFPosterModelStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](self, "_accessQueue_buildIdentityForVersion:supplement:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __providerURLForOptions(a3, self->_providerURL, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v15 = -[PBFPosterModelStoreCoordinator _accessQueue_configureFileSystemForNewContents:atPath:error:](self, "_accessQueue_configureFileSystemForNewContents:atPath:error:", v8, v14, &v27);
  v16 = v27;
  v17 = v16;
  if (v15)
  {
    if (a3 == 1)
    {
      accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
    }
    else
    {
      if (a3)
      {
LABEL_18:
        v21 = v11;
        goto LABEL_19;
      }
      accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_posterIdentityBySupplementByVersion;
    }
    v22 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "supplement"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryWithObject:forKey:", v11, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "version"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](accessQueue_stagedPosterIdentityBySupplementByVersion, "setObject:forKey:", v24, v25);

    goto LABEL_18;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v16);
  objc_msgSend(v14, "instanceURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PBFLogReaper();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v19;
    _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "REAPING failed contents %{public}@", buf, 0xCu);
  }

  -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v19, 0);
  v21 = 0;
LABEL_19:

  return v21;
}

- (BOOL)_accessQueue_configureFileSystemForNewContents:(id)a3 atPath:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSFileManager *fileManager;
  void *v12;
  id v13;
  NSFileManager *v14;
  _BOOL4 v15;
  id v16;
  NSFileManager *v17;
  void *v18;
  void *v19;
  NSFileManager *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSFileManager *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  BOOL v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  NSFileManager *v42;
  void *v43;
  _BOOL4 v44;
  id v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  id v50;
  void *v51;
  BOOL v52;
  void *v53;
  uint64_t v54;
  uint64_t v56;
  NSFileManager *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  NSFileManager *v61;
  void *v62;
  BOOL v63;
  id v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  void *context;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[5];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  id v112;
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v75 = a4;
  context = (void *)MEMORY[0x1D17A3580]();
  v7 = (void *)MEMORY[0x1E0D7F8D0];
  -[PBFPosterModelStoreCoordinator role](self, "role");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "temporaryPathForRole:", v8);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v75, "identity");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v76, "contentsURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pf_posterPathInstanceURLForVersionsURL:version:", v10, objc_msgSend(v73, "version"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  fileManager = self->_fileManager;
  PFFileProtectionNoneAttributes();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0;
  LODWORD(fileManager) = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](fileManager, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v74, 1, v12, &v96);
  v72 = v96;

  if (!(_DWORD)fileManager)
  {
    if (v72)
    {
      v103 = *MEMORY[0x1E0CB3388];
      v104 = v72;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v13);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathContentsURLForInstanceURL:", v74);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = self->_fileManager;
  if (!v71)
  {
    PFFileProtectionNoneAttributes();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0;
    v32 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, v31, &v81);
    v68 = v81;

    if (v32)
    {
      v30 = 0;
      v33 = 1;
      goto LABEL_38;
    }
    if (v68)
    {
      v107 = *MEMORY[0x1E0CB3388];
      v108 = v68;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v35);
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  v95 = 0;
  v15 = -[NSFileManager copyItemAtURL:toURL:error:](v14, "copyItemAtURL:toURL:error:", v71, v13, &v95);
  v16 = v95;
  v68 = v16;
  if (!v15)
  {
    if (v16)
    {
      v109 = *MEMORY[0x1E0CB3388];
      v110 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v34, v68);
    v37 = objc_claimAutoreleasedReturnValue();
LABEL_33:
    v30 = (id)v37;
    goto LABEL_36;
  }
  v17 = self->_fileManager;
  PFFileProtectionNoneAttributes();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0;
  LODWORD(v17) = -[NSFileManager setAttributes:ofItemAtPath:error:](v17, "setAttributes:ofItemAtPath:error:", v18, v19, &v94);
  v67 = v94;

  if ((_DWORD)v17)
  {
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__1;
    v92 = __Block_byref_object_dispose__1;
    v93 = 0;
    v20 = self->_fileManager;
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __94__PBFPosterModelStoreCoordinator__accessQueue_configureFileSystemForNewContents_atPath_error___block_invoke;
    v87[3] = &unk_1E86F4538;
    v87[4] = &v88;
    -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](v20, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v13, MEMORY[0x1E0C9AA60], 0, v87);
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v113, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v84;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v84 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          v26 = self->_fileManager;
          PFFileProtectionNoneAttributes();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0;
          LOBYTE(v25) = -[NSFileManager setAttributes:ofItemAtPath:error:](v26, "setAttributes:ofItemAtPath:error:", v27, v28, &v82);
          v29 = v82;

          if ((v25 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, 0);
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = (void *)v89[5];
            v89[5] = v38;

            goto LABEL_29;
          }

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v113, 16);
        if (v22)
          continue;
        break;
      }
    }
LABEL_29:

    v30 = (id)v89[5];
    if (v30)
    {
      v40 = v30;
      v33 = 0;
    }
    else
    {
      v33 = 1;
    }

    _Block_object_dispose(&v88, 8);
    goto LABEL_37;
  }
  if (v67)
  {
    v111 = *MEMORY[0x1E0CB3388];
    v112 = v67;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v36, v67, v68);
  v30 = (id)objc_claimAutoreleasedReturnValue();

LABEL_36:
  v33 = 0;
LABEL_37:

LABEL_38:
  if (!v33)
  {
LABEL_42:
    v47 = 0;
LABEL_43:

    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathSupplementURLForInstanceURL:supplement:", v74, objc_msgSend(v73, "supplement"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = self->_fileManager;
  PFFileProtectionNoneAttributes();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  v44 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v42, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v41, 1, v43, &v80);
  v45 = v80;

  if (!v44)
  {
    if (v45)
    {
      v105 = *MEMORY[0x1E0CB3388];
      v106 = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v46, v67);
    v56 = objc_claimAutoreleasedReturnValue();

    v30 = (id)v56;
  }

  if (v44)
  {
    v57 = self->_fileManager;
    objc_msgSend(v75, "versionsURL");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    PFFileProtectionNoneAttributes();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    v60 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v57, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v58, 1, v59, &v79);
    v13 = v79;

    if (v60)
    {
      v61 = self->_fileManager;
      objc_msgSend(v75, "instanceURL");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0;
      v63 = -[NSFileManager moveItemAtURL:toURL:error:](v61, "moveItemAtURL:toURL:error:", v74, v62, &v78);
      v64 = v78;

      if (v63)
      {
        v47 = 1;
LABEL_73:

        goto LABEL_43;
      }
      if (v64)
      {
        v101 = *MEMORY[0x1E0CB3388];
        v102 = v64;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v65 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v65, v67);
      v66 = objc_claimAutoreleasedReturnValue();

      v30 = (id)v66;
    }
    else
    {
      if (v13)
      {
        v99 = *MEMORY[0x1E0CB3388];
        v100 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v64 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v64 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v64, v67);
      v65 = v30;
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }

    v47 = 0;
    goto LABEL_73;
  }
  v47 = 0;
LABEL_44:
  objc_msgSend(v76, "invalidate", v67);

  objc_autoreleasePoolPop(context);
  if (v47)
  {
    objc_msgSend(v75, "instanceURL");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0;
    v49 = objc_msgSend(v48, "checkResourceIsReachableAndReturnError:", &v77);
    v50 = v77;

    if (v49)
    {
      objc_msgSend(v75, "instanceURL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterModelStoreCoordinator _accessQueue_fixupResourceValuesWithinURL:synchronous:](self, "_accessQueue_fixupResourceValuesWithinURL:synchronous:", v51, 1);

      v52 = 1;
      goto LABEL_54;
    }
    if (v50)
    {
      v97 = *MEMORY[0x1E0CB3388];
      v98 = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v53 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v53);
    v54 = objc_claimAutoreleasedReturnValue();

    v30 = (id)v54;
  }
  if (a5)
  {
    v30 = objc_retainAutorelease(v30);
    v52 = 0;
    *a5 = v30;
  }
  else
  {
    v52 = 0;
  }
LABEL_54:

  return v52;
}

uint64_t __94__PBFPosterModelStoreCoordinator__accessQueue_configureFileSystemForNewContents_atPath_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = *MEMORY[0x1E0CB3388];
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return 0;
}

- (id)_accessQueue_setupNewSupplementWithOptions:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSFileManager *fileManager;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSFileManager *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  -[PBFPosterModelStoreCoordinator _accessQueue_identityOfLatestVersion](self, "_accessQueue_identityOfLatestVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    -[PBFPosterModelStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](self, "_accessQueue_buildIdentityForVersion:supplement:", objc_msgSend(v7, "version"), objc_msgSend(v7, "supplement") + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isNewerVersionOfIdentity:", v8) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nextIdentity=%@ must be a newer form of latestIdentity=%@"), v9, v8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterModelStoreCoordinator _accessQueue_setupNewSupplementWithOptions:error:].cold.2();
      objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBA47500);
    }
    __providerURLForOptions(a3, self->_providerURL, v9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 112;
    if (!a3)
      v11 = 104;
    v12 = *(id *)((char *)&self->super.isa + v11);
    fileManager = self->_fileManager;
    objc_msgSend(v10, "supplementURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PFFileProtectionNoneAttributes();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v16 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](fileManager, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, v15, &v33);
    v17 = v33;

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "version"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v19 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "version"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v19, v20);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "supplement"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKey:", v9, v21);

      objc_msgSend(v10, "supplementURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterModelStoreCoordinator _accessQueue_fixupResourceValuesWithinURL:synchronous:](self, "_accessQueue_fixupResourceValuesWithinURL:synchronous:", v22, 1);

      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("posterIdentityBySupplement should be guaranteed nonnull here : identity=%@ _posterIdentityBySupplementByVersion=%@"), v9, v12);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[PBFPosterModelStoreCoordinator _accessQueue_setupNewSupplementWithOptions:error:].cold.1();
        objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1CBA4755CLL);
      }
      v23 = v9;
    }
    else
    {
      if (a4)
      {
        if (v17)
        {
          v36 = *MEMORY[0x1E0CB3388];
          v37 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v25);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v10, "supplementURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PBFLogReaper();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v19;
        _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "REAPING supplementURL %{public}@", buf, 0xCu);
      }

      v27 = self->_fileManager;
      objc_msgSend(v10, "supplementURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSFileManager removeItemAtURL:error:](v27, "removeItemAtURL:error:", v28, 0);

      v23 = 0;
    }

    goto LABEL_22;
  }
  if (a4)
  {
    v38 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to find latest identity of %@"), self->_posterUUID);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3329, v9);
    v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  v23 = 0;
LABEL_23:

  return v23;
}

- (void)_accessQueue_removeSupplement:(unint64_t)a3 forVersion:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8;
  void *v9;
  NSMutableDictionary *accessQueue_posterIdentityBySupplementByVersion;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSFileManager *fileManager;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *accessQueue_stagedPosterIdentityBySupplementByVersion;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSFileManager *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  NSFileManager *v39;
  id v40;
  void *v41;
  NSObject *v42;
  NSMutableDictionary *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  NSFileManager *v47;
  id v48;
  void *v49;
  NSObject *v50;
  NSMutableDictionary *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  -[PBFPosterModelStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](self, "_accessQueue_buildIdentityForVersion:supplement:", a4, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_accessQueue_identityToPosterSnapshotCoordinator, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllSnapshots");

  v53 = (void *)v8;
  -[NSMapTable removeObjectForKey:](self->_accessQueue_identityToPosterSnapshotCoordinator, "removeObjectForKey:", v8);
  objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:", self->_providerURL, objc_msgSend((id)objc_opt_class(), "type"), self->_posterUUID, a4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  accessQueue_posterIdentityBySupplementByVersion = self->_accessQueue_posterIdentityBySupplementByVersion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](accessQueue_posterIdentityBySupplementByVersion, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathSupplementURLForInstanceURL:supplement:", v56, a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PBFLogReaper();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v15;
        _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_DEFAULT, "REAPING supplementURL %{public}@", buf, 0xCu);
      }

      fileManager = self->_fileManager;
      v60 = 0;
      -[NSFileManager removeItemAtURL:error:](fileManager, "removeItemAtURL:error:", v15, &v60);
      v18 = v60;
      v19 = v18;
      if (v18)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v18);
        PBFLogPosterContents();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[PBFPosterModelStoreCoordinator _accessQueue_removeSupplement:forVersion:error:].cold.3();

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v21);

  }
  v22 = (void *)MEMORY[0x1E0C99E98];
  -[PBFPosterModelStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](self, "_accessQueue_buildIdentityForVersion:supplement:", a4, a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  __stagedProviderURLForIdentity(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:", v24, objc_msgSend((id)objc_opt_class(), "type"), self->_posterUUID, a4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](accessQueue_stagedPosterIdentityBySupplementByVersion, "objectForKey:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKey:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathSupplementURLForInstanceURL:supplement:", v55, a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PBFLogReaper();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v30;
        _os_log_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_DEFAULT, "REAPING supplementURL %{public}@", buf, 0xCu);
      }

      v32 = self->_fileManager;
      v59 = 0;
      -[NSFileManager removeItemAtURL:error:](v32, "removeItemAtURL:error:", v30, &v59);
      v33 = v59;
      v34 = v33;
      if (v33)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v33);
        PBFLogPosterContents();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[PBFPosterModelStoreCoordinator _accessQueue_removeSupplement:forVersion:error:].cold.3();

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v36);

  }
  v37 = objc_msgSend(v12, "count");
  if (v14 && !v37)
  {
    PBFLogReaper();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v56;
      _os_log_impl(&dword_1CB9FA000, v38, OS_LOG_TYPE_DEFAULT, "REAPING instanceURL %{public}@", buf, 0xCu);
    }

    v39 = self->_fileManager;
    v58 = 0;
    -[NSFileManager removeItemAtURL:error:](v39, "removeItemAtURL:error:", v56, &v58);
    v40 = v58;
    v41 = v40;
    if (v40)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v40);
      PBFLogPosterContents();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[PBFPosterModelStoreCoordinator _accessQueue_removeSupplement:forVersion:error:].cold.1();

    }
    v43 = self->_accessQueue_posterIdentityBySupplementByVersion;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v43, "removeObjectForKey:", v44);

  }
  v45 = objc_msgSend(v27, "count");
  if (v29 && !v45)
  {
    PBFLogReaper();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v55;
      _os_log_impl(&dword_1CB9FA000, v46, OS_LOG_TYPE_DEFAULT, "REAPING stagedInstanceURL %{public}@", buf, 0xCu);
    }

    v47 = self->_fileManager;
    v57 = 0;
    -[NSFileManager removeItemAtURL:error:](v47, "removeItemAtURL:error:", v55, &v57);
    v48 = v57;
    v49 = v48;
    if (v48)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v48);
      PBFLogPosterContents();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[PBFPosterModelStoreCoordinator _accessQueue_removeSupplement:forVersion:error:].cold.1();

    }
    v51 = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v51, "removeObjectForKey:", v52);

  }
}

- (id)_accessQueue_buildIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4
{
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id result;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  PBFPosterModelStoreCoordinator *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Please implement in your subclass."), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("PBFPosterModelStoreCoordinator.m");
    v19 = 1024;
    v20 = 1431;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_accessQueue_purgeSnapshotCache
{
  -[PBFPosterModelStoreCoordinator _accessQueue_enumerateSnapshotCoordinators:](self, "_accessQueue_enumerateSnapshotCoordinators:", &__block_literal_global_92);
}

uint64_t __65__PBFPosterModelStoreCoordinator__accessQueue_purgeSnapshotCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (void)purgeSnapshotCache
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PBFPosterModelStoreCoordinator_purgeSnapshotCache__block_invoke;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __52__PBFPosterModelStoreCoordinator_purgeSnapshotCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_purgeSnapshotCache");
}

- (void)_accessQueue_fixupResourceValuesWithinURL:(id)a3 synchronous:(BOOL)a4
{
  _BOOL4 v4;
  NSURL *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  NSUUID *v12;
  NSString *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t spid;
  id v37;
  id v38;
  void *v39;
  unint64_t v40;
  void *v41;
  NSUUID *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint8_t v55[128];
  uint8_t buf[4];
  NSString *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  NSUUID *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  NSURL *v65;
  uint64_t v66;

  v4 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v6 = (NSURL *)a3;
  if (!self->_readonly)
  {
    objc_msgSend((id)objc_opt_class(), "expectedURLResourceValuesForFiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "expectedURLResourceValuesForDirectories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
    {
      v45 = v4;
      if (!v6)
        v6 = self->_identifierURL;
      objc_msgSend((id)objc_opt_class(), "type");
      NSStringFromPFServerPosterType();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = self->_posterUUID;
      v13 = self->_extensionIdentifier;
      PBFLogPosterContents();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_signpost_id_generate(v14);

      PBFLogPosterContents();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      spid = v15;
      v40 = v15 - 1;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_DWORD *)buf = 138544386;
        v57 = v13;
        v58 = 2114;
        v59 = v11;
        v60 = 2114;
        v61 = v12;
        v62 = 2114;
        v63 = v9;
        v64 = 2114;
        v65 = v6;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "gather resources for fixupResourceValues", "extension: %{public}@; class: %{public}@; posterUUID %{public}@; type %{public}@; URL: %{public}@",
          buf,
          0x34u);
      }
      v42 = v12;
      v43 = (void *)v11;
      v44 = (void *)v9;

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *MEMORY[0x1E0C99968]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v19);

      objc_msgSend(v8, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObjectsFromArray:", v20);

      v21 = (void *)MEMORY[0x1E0CB3880];
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __88__PBFPosterModelStoreCoordinator__accessQueue_fixupResourceValuesWithinURL_synchronous___block_invoke;
      v52[3] = &unk_1E86F45A0;
      v46 = v8;
      v38 = v8;
      v53 = v38;
      v47 = v7;
      v37 = v7;
      v54 = v37;
      objc_msgSend(v21, "predicateWithBlock:", v52);
      v22 = objc_claimAutoreleasedReturnValue();
      v41 = v18;
      -[PBFPosterModelStoreCoordinator _accessQueue_contentsOfURLWithinStore:resourceKeys:standardizeURLs:](self, "_accessQueue_contentsOfURLWithinStore:resourceKeys:standardizeURLs:", v6, v18, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)v22;
      objc_msgSend(v23, "filteredOrderedSetUsingPredicate:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      if (v26)
      {
        v27 = v26;
        v28 = 0;
        v29 = 0;
        v30 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v49 != v30)
              objc_enumerationMutation(v25);
            v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            if (objc_msgSend(v32, "pbf_isDirectory"))
            {
              if (v29)
              {
                v33 = v29;
              }
              else
              {
                v33 = (void *)objc_opt_new();
                v29 = v33;
              }
            }
            else if (v28)
            {
              v33 = v28;
            }
            else
            {
              v33 = (void *)objc_opt_new();
              v28 = v33;
            }
            objc_msgSend(v33, "addObject:", v32);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        }
        while (v27);
      }
      else
      {
        v28 = 0;
        v29 = 0;
      }

      PBFLogPosterContents();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_DWORD *)buf = 138544386;
        v57 = v13;
        v58 = 2114;
        v59 = (uint64_t)v43;
        v60 = 2114;
        v61 = v42;
        v62 = 2114;
        v63 = (uint64_t)v44;
        v64 = 2114;
        v65 = v6;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v35, OS_SIGNPOST_INTERVAL_END, spid, "gather resources for fixupResourceValues", "extension: %{public}@; class: %{public}@; posterUUID %{public}@; type %{public}@; URL: %{public}@",
          buf,
          0x34u);
      }

      -[PBFPosterModelStoreCoordinator _accessQueue_applyResourceValuesForURLs:expectedResourceValues:synchronous:](self, "_accessQueue_applyResourceValuesForURLs:expectedResourceValues:synchronous:", v28, v37, v45);
      -[PBFPosterModelStoreCoordinator _accessQueue_applyResourceValuesForURLs:expectedResourceValues:synchronous:](self, "_accessQueue_applyResourceValuesForURLs:expectedResourceValues:synchronous:", v29, v38, v45);

      v8 = v46;
      v7 = v47;
    }

  }
}

uint64_t __88__PBFPosterModelStoreCoordinator__accessQueue_fixupResourceValuesWithinURL_synchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v3 = a2;
  if ((objc_msgSend(v3, "pbf_isPosterSnapshot") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = objc_msgSend(v3, "pbf_isDirectory");
    v6 = 40;
    if (v5)
      v6 = 32;
    v4 = objc_msgSend(v3, "pbf_URLConformsToExpectedResourceValues:error:", *(_QWORD *)(a1 + v6), 0) ^ 1;
  }

  return v4;
}

- (void)_accessQueue_applyResourceValuesForURLs:(id)a3 expectedResourceValues:(id)a4 synchronous:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  NSUUID *v13;
  NSString *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  id v17;
  NSUUID *v18;
  id v19;
  NSString *v20;
  void (**v21)(_QWORD);
  void *v22;
  _QWORD aBlock[4];
  NSString *v24;
  id v25;
  NSUUID *v26;
  id v27;
  id v28;
  id v29;
  os_signpost_id_t v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "type");
    NSStringFromPFServerPosterType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_posterUUID;
    v14 = self->_extensionIdentifier;
    PBFLogPosterContents();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_generate(v15);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__PBFPosterModelStoreCoordinator__accessQueue_applyResourceValuesForURLs_expectedResourceValues_synchronous___block_invoke;
    aBlock[3] = &unk_1E86F45C8;
    v30 = v16;
    v24 = v14;
    v25 = v12;
    v26 = v13;
    v27 = v10;
    v28 = v8;
    v29 = v9;
    v17 = v10;
    v18 = v13;
    v19 = v12;
    v20 = v14;
    v21 = (void (**)(_QWORD))_Block_copy(aBlock);
    v22 = v21;
    if (v5)
      v21[2](v21);
    else
      PBFDispatchAsyncWithString(CFSTR("FixupResourceValues"), QOS_CLASS_BACKGROUND, v21);

  }
}

void __109__PBFPosterModelStoreCoordinator__accessQueue_applyResourceValuesForURLs_expectedResourceValues_synchronous___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  PBFLogPosterContents();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 80);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    v38 = v5;
    v39 = 2114;
    v40 = v6;
    v41 = 2114;
    v42 = v7;
    v43 = 2114;
    v44 = v8;
    v45 = 2114;
    v46 = v9;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "fixupResourceValues", "extension: %{public}@; class: %{public}@; posterUUID %{public}@; type %{public}@; URLs: %{public}@",
      buf,
      0x34u);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = *(id *)(a1 + 64);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v33;
    *(_QWORD *)&v12 = 138412546;
    v30 = v12;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
        v17 = *(_QWORD *)(a1 + 72);
        v31 = 0;
        v18 = objc_msgSend(v16, "setResourceValues:error:", v17, &v31, v30);
        v19 = v31;
        PBFLogPosterContents();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v18)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v16;
            _os_log_debug_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_DEBUG, "Corrected resource values for %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v30;
          v38 = v16;
          v39 = 2114;
          v40 = v19;
          _os_log_error_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_ERROR, "Failed to correct resource values for %@: %{public}@", buf, 0x16u);
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v13);
  }

  PBFLogPosterContents();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = *(_QWORD *)(a1 + 80);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    v25 = *(void **)(a1 + 32);
    v26 = *(void **)(a1 + 40);
    v27 = *(_QWORD *)(a1 + 48);
    v28 = *(_QWORD *)(a1 + 56);
    v29 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    v38 = v25;
    v39 = 2114;
    v40 = v26;
    v41 = 2114;
    v42 = v27;
    v43 = 2114;
    v44 = v28;
    v45 = 2114;
    v46 = v29;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v23, OS_SIGNPOST_INTERVAL_END, v24, "fixupResourceValues", "extension: %{public}@; class: %{public}@; posterUUID %{public}@; type %{public}@; URLs: %{public}@",
      buf,
      0x34u);
  }

}

- (id)_accessQueue_fetchIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *accessQueue_posterIdentityBySupplementByVersion;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:", self->_providerURL, objc_msgSend((id)objc_opt_class(), "type"), self->_posterUUID, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathContentsURLForInstanceURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", a5))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "pf_posterPathSupplementURLForInstanceURL:supplement:", v9, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", a5))
    {
      accessQueue_posterIdentityBySupplementByVersion = self->_accessQueue_posterIdentityBySupplementByVersion;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](accessQueue_posterIdentityBySupplementByVersion, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = self->_accessQueue_posterIdentityBySupplementByVersion;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v14, v16);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[PBFPosterModelStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](self, "_accessQueue_buildIdentityForVersion:supplement:", a3, a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v18, v19);

      }
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSURL)identifierURL
{
  return self->_identifierURL;
}

- (NSUUID)posterUUID
{
  return self->_posterUUID;
}

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue_identityToPosterSnapshotCoordinator, 0);
  objc_storeStrong((id *)&self->_accessQueue_stagedPosterIdentityBySupplementByVersion, 0);
  objc_storeStrong((id *)&self->_accessQueue_posterIdentityBySupplementByVersion, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_posterUUID, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_transientInternalInfoURL, 0);
  objc_storeStrong((id *)&self->_providerURL, 0);
  objc_storeStrong((id *)&self->_identifierURL, 0);
  objc_storeStrong((id *)&self->_containerVersionsURL, 0);
  objc_storeStrong((id *)&self->_providerInfoURL, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.2()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.3()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.4()
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

+ (void)createNewStoreCoordinatorWithPath:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "storeCoordinator %s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "writeToProvider %s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.8()
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

+ (void)createNewStoreCoordinatorWithPath:error:.cold.9()
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

+ (void)createNewStoreCoordinatorWithPath:error:.cold.11()
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

- (void)setObject:forKeyedSubscript:.cold.1()
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setObject:forKeyedSubscript:.cold.3()
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

void __59__PBFPosterModelStoreCoordinator__accessQueue_snapshotURLs__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "_accessQueue_snapshotURLs %{public}@ encountered an error: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_7();
}

- (void)addNewVersionWithContents:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)addNewSupplementWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)stageNewVersionWithContents:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)stageNewSupplementWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)removeSupplement:forVersion:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_accessQueue_checkEnvironmentConsistency
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_0(&dword_1CB9FA000, v0, v1, "%s> error unarchiving provider info: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_accessQueue_setupNewVersionWithOptions:contents:error:.cold.1()
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

- (void)_accessQueue_setupNewSupplementWithOptions:error:.cold.1()
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

- (void)_accessQueue_setupNewSupplementWithOptions:error:.cold.2()
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

- (void)_accessQueue_removeSupplement:forVersion:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_0(&dword_1CB9FA000, v0, v1, "%s> error removing version %llu: %@", v2);
  OUTLINED_FUNCTION_19_0();
}

- (void)_accessQueue_removeSupplement:forVersion:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_0(&dword_1CB9FA000, v0, v1, "%s> error removing supplement=%llu : %@", v2);
  OUTLINED_FUNCTION_19_0();
}

@end
