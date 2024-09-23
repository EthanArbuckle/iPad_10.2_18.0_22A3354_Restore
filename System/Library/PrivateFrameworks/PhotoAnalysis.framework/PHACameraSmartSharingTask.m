@implementation PHACameraSmartSharingTask

- (NSString)name
{
  return (NSString *)CFSTR("CameraSmartSharing");
}

- (double)period
{
  return 86400.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 0;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  __int16 v15;
  __int16 v16;

  v4 = a3;
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSystemPhotoLibrary");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "workingContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v11 = "PHACameraSmartSharingTask: Task is running on a non system photo library: not running Camera Smart Sharing job";
      v12 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
LABEL_9:

    v8 = 0;
    goto LABEL_10;
  }
  -[PHACameraSmartSharingTask _libraryScopeToUseWithGraphManager:error:](self, "_libraryScopeToUseWithGraphManager:error:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "workingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v11 = "PHACameraSmartSharingTask: Task is running without an active library scope: not running Camera Smart Sharing job";
      v12 = (uint8_t *)&v15;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (id)_libraryScopeToUseWithGraphManager:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  NSString *libraryScopeLocalIdentifier;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHACameraSmartSharingTask libraryScope](self, "libraryScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v6, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSortDescriptors:", v12);

    objc_msgSend(v6, "workingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CD15E0];
    if (!self->_libraryScopeLocalIdentifier)
    {
      v20 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v15, "fetchActiveLibraryScopeWithOptions:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    libraryScopeLocalIdentifier = self->_libraryScopeLocalIdentifier;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &libraryScopeLocalIdentifier, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v15, "fetchLibraryScopesWithLocalIdentifiers:options:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
LABEL_9:
      -[PHACameraSmartSharingTask setLibraryScope:](self, "setLibraryScope:", v19);

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot find library scope for localIdentifier: %@"), self->_libraryScopeLocalIdentifier);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_error_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      if (a4)
        goto LABEL_6;
    }
    else if (a4)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 9, v20);
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

      goto LABEL_9;
    }
    v19 = 0;
    goto LABEL_8;
  }
LABEL_10:
  -[PHACameraSmartSharingTask libraryScope](self, "libraryScope");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  int v51;
  NSObject *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  char v82;
  char v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  void *v89;
  double v90;
  double v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v99;
  __int128 v100;
  void *v101;
  id *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  NSObject *oslog;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  id v128;
  NSObject *v129;
  void *v130;
  id v131;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _QWORD v142[3];
  uint8_t buf[4];
  _BYTE v144[18];
  __int16 v145;
  void *v146;
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v102 = a5;
  if (!objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    objc_msgSend(v8, "workingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    -[PHACameraSmartSharingTask _libraryScopeToUseWithGraphManager:error:](self, "_libraryScopeToUseWithGraphManager:error:", v8, a5);
    v13 = objc_claimAutoreleasedReturnValue();
    oslog = v12;
    v108 = (void *)v13;
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v8, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "librarySpecificFetchOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v109 = v16;
      v110 = objc_alloc_init(MEMORY[0x1E0C97298]);
      v17 = (void *)MEMORY[0x1E0CD17A8];
      v18 = (void *)objc_msgSend(v16, "copy");
      objc_msgSend(v17, "fetchParticipantsInShare:options:", v14, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0x1E0C99000uLL;
      v117 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v137 = 0u;
      v138 = 0u;
      v139 = 0u;
      v140 = 0u;
      v101 = v8;
      v21 = v12;
      v22 = v19;
      v119 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
      if (v119)
      {
        v118 = *(_QWORD *)v138;
        v105 = *MEMORY[0x1E0C966A8];
        v104 = *MEMORY[0x1E0C967C0];
        v103 = *MEMORY[0x1E0C966E8];
        *(_QWORD *)&v23 = 138478339;
        v100 = v23;
        v24 = MEMORY[0x1E0C9AA60];
        v106 = v22;
        v107 = v9;
LABEL_10:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v138 != v118)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v25);
          v27 = (void *)MEMORY[0x1D1798448]();
          if (objc_msgSend(v9, "isCancelledWithProgress:", 0.5))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v144 = 139;
              *(_WORD *)&v144[4] = 2080;
              *(_QWORD *)&v144[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAna"
                                    "lysis/Framework/Storytelling/Tasks/SharedLibraryTasks/PHACameraSmartSharingTask.m";
              _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            if (v102 && !*v102)
            {
              objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
              *v102 = (id)objc_claimAutoreleasedReturnValue();
            }
            objc_autoreleasePoolPop(v27);
            v10 = 0;
            v82 = 0;
            v83 = 1;
            v84 = v22;
            goto LABEL_98;
          }
          if ((objc_msgSend(v26, "isCurrentUser") & 1) != 0)
            goto LABEL_55;
          v28 = objc_alloc_init(*(Class *)(v20 + 3616));
          v120 = v26;
          if (objc_msgSend(v26, "acceptanceStatus") != 2)
          {
            if (!objc_msgSend(v108, "libraryScopeInLocalMode"))
            {
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v49 = v27;
                v50 = v21;
                v51 = objc_msgSend(v120, "acceptanceStatus");
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v144 = v120;
                *(_WORD *)&v144[8] = 1024;
                *(_DWORD *)&v144[10] = v51;
                _os_log_impl(&dword_1CAC16000, v50, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Not scanning for participant:%@ acceptanceStatus:%d", buf, 0x12u);

                v27 = v49;
              }
              goto LABEL_54;
            }
            v29 = v27;
            v30 = v21;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = objc_msgSend(v120, "acceptanceStatus");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v144 = v120;
              *(_WORD *)&v144[8] = 1024;
              *(_DWORD *)&v144[10] = v31;
              _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Allowed scan because of local mode, participant:%@ acceptance status:%d", buf, 0x12u);
            }

            v27 = v29;
            v26 = v120;
          }
          v116 = v27;
          v32 = (void *)MEMORY[0x1E0CD16C0];
          v33 = (void *)objc_msgSend(v109, "copy", v100);
          objc_msgSend(v32, "fetchPersonForShareParticipant:options:", v26, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v34, "count") && os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v144 = v120;
            _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Missing PHPerson for share participant:%@", buf, 0xCu);
          }
          v135 = 0u;
          v136 = 0u;
          v133 = 0u;
          v134 = 0u;
          v35 = v34;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v133, v147, 16);
          v115 = v25;
          if (!v36)
            break;
          v37 = v36;
          v113 = v28;
          v38 = 0;
          v39 = *(_QWORD *)v134;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v134 != v39)
                objc_enumerationMutation(v35);
              v41 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * i);
              objc_msgSend(v41, "linkedContactWithKeysToFetch:", v24);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "identifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "length");

              if (v44)
              {
                objc_msgSend(v42, "identifier");
                v45 = objc_claimAutoreleasedReturnValue();

                v38 = (void *)v45;
              }
              else if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v144 = v120;
                *(_WORD *)&v144[8] = 2112;
                *(_QWORD *)&v144[10] = v41;
                _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Missing contact for for share participant:%@ person:%@", buf, 0x16u);
              }

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v133, v147, 16);
          }
          while (v37);

          v21 = oslog;
          v20 = 0x1E0C99000;
          v28 = v113;
          if (!v38)
            goto LABEL_37;
          objc_msgSend(v113, "addObject:", v38);
LABEL_47:
          v53 = objc_alloc_init(*(Class *)(v20 + 3616));
          objc_msgSend(v120, "phoneNumber");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v54, "length"))
          {
            objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v55);

          }
          v112 = v53;
          v56 = objc_alloc_init(*(Class *)(v20 + 3616));
          objc_msgSend(v120, "emailAddress");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v57, "length"))
            objc_msgSend(v56, "addObject:", v57);
          v58 = objc_alloc(MEMORY[0x1E0CD1490]);
          objc_msgSend(v28, "allObjects");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v54;
          v60 = objc_msgSend(v58, "initWithPhoneNumber:emailAddress:contactIdentifiers:", v54, v57, v59);

          objc_msgSend(v117, "addObject:", v60);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138478083;
            *(_QWORD *)v144 = v60;
            *(_WORD *)&v144[8] = 2112;
            *(_QWORD *)&v144[10] = v120;
            _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Added identify %{private}@ for participant:%@", buf, 0x16u);
          }
          v111 = (void *)v60;
          v61 = objc_alloc(MEMORY[0x1E0C97210]);
          v142[0] = v105;
          v142[1] = v104;
          v142[2] = v103;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 3);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = (void *)objc_msgSend(v61, "initWithKeysToFetch:", v62);

          v64 = (void *)MEMORY[0x1E0C97200];
          objc_msgSend(v28, "allObjects");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "predicateForContactsWithIdentifiers:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setPredicate:", v66);

          v132 = 0;
          v126[0] = MEMORY[0x1E0C809B0];
          v126[1] = 3221225472;
          v126[2] = __72__PHACameraSmartSharingTask_runWithGraphManager_progressReporter_error___block_invoke;
          v126[3] = &unk_1E851F490;
          v127 = v56;
          v128 = v117;
          v129 = v21;
          v130 = v120;
          v131 = v112;
          v67 = v56;
          v68 = v112;
          objc_msgSend(v110, "enumerateContactsWithFetchRequest:error:usingBlock:", v63, &v132, v126);
          v69 = v28;
          v70 = v132;

          v28 = v69;
          v22 = v106;
          v9 = v107;
          v20 = 0x1E0C99000;
          v25 = v115;
          v27 = v116;
LABEL_54:

LABEL_55:
          objc_autoreleasePoolPop(v27);
          if (++v25 == v119)
          {
            v119 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
            if (v119)
              goto LABEL_10;
            goto LABEL_57;
          }
        }

LABEL_37:
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(_QWORD *)v144 = v120;
          _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Unable to retrieve contact for share participant %{private}@, falling back to lookup by email/phone number.", buf, 0xCu);
        }
        objc_msgSend(v120, "emailAddress");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "phoneNumber");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "allContactIDsMatchingEmailAddress:orPhoneNumber:", v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v48, "count"))
        {
          objc_msgSend(v28, "addObjectsFromArray:", v48);
        }
        else
        {
          v52 = v21;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v120, "emailAddress");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "phoneNumber");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v100;
            *(_QWORD *)v144 = v120;
            *(_WORD *)&v144[8] = 2113;
            *(_QWORD *)&v144[10] = v71;
            v145 = 2113;
            v146 = v72;
            _os_log_error_impl(&dword_1CAC16000, v52, OS_LOG_TYPE_ERROR, "PHACameraSmartSharingTask: Unable to retrieve fallback contact IDs for share participant %{private}@ with email %{private}@ or phone number %{private}@", buf, 0x20u);

          }
        }

        v38 = 0;
        goto LABEL_47;
      }
LABEL_57:
      v73 = (void *)MEMORY[0x1E0C9AA60];

      if (!objc_msgSend(v117, "count") && os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v144 = v108;
        _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: No share participants to auto-share with for libraryScope %@", buf, 0xCu);
      }
      objc_msgSend(v101, "homeCircularRegions", v100);
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = (void *)v74;
      if (v74)
        v76 = (void *)v74;
      else
        v76 = v73;
      v77 = v76;

      if (objc_msgSend(v101, "isReady"))
      {
        objc_msgSend(v101, "recentFrequentLocationRegions");
        v78 = objc_claimAutoreleasedReturnValue();
        v79 = (void *)v78;
        if (v78)
          v80 = (void *)v78;
        else
          v80 = v73;
        v81 = v80;

      }
      else
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: graph manager not ready, smart sharing cache will be missing frequent location data", buf, 2u);
        }
        v81 = (id)MEMORY[0x1E0C9AA60];
      }
      v85 = v22;
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      v84 = v77;
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v122, v141, 16);
      if (v86)
      {
        v87 = *(_QWORD *)v123;
        while (2)
        {
          for (j = 0; j != v86; ++j)
          {
            if (*(_QWORD *)v123 != v87)
              objc_enumerationMutation(v84);
            v89 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * j);
            objc_msgSend(v89, "center");
            v91 = v90;
            objc_msgSend(v89, "center");
            if (objc_msgSend(MEMORY[0x1E0D4B1D0], "isLocationShiftRequiredForCoordinate:", v91))
            {
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                *(_QWORD *)v144 = v89;
                _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: locationShiftingRequired needed for location: %{private}@", buf, 0xCu);
              }
              v86 = 1;
              goto LABEL_93;
            }
          }
          v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v122, v141, 16);
          if (v86)
            continue;
          break;
        }
      }
LABEL_93:

      v92 = objc_alloc(MEMORY[0x1E0CD1498]);
      objc_msgSend(v108, "localIdentifier");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "allObjects");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = (void *)objc_msgSend(v92, "initWithLibraryScopeIdentifier:identities:homeLocations:frequentLocations:locationShiftingRequired:", v93, v94, v84, v81, v86);

      v96 = (void *)MEMORY[0x1E0CD1498];
      objc_msgSend(v101, "photoLibrary");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v96, "storeMetadata:forPhotoLibrary:error:", v95, v97, v102);

      if ((v10 & 1) != 0)
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(_QWORD *)v144 = v95;
          _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Successfully generated smart sharing cache: %{private}@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v99 = v102;
        if (v102)
          v99 = *v102;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v144 = v99;
        _os_log_error_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_ERROR, "PHACameraSmartSharingTask: Error writing metadata: %@", buf, 0xCu);
      }

      v83 = 0;
      v82 = 1;
      v22 = v85;
LABEL_98:

      if ((v82 & 1) == 0)
      {
        v10 = 0;
        v8 = v101;
        goto LABEL_108;
      }
      v8 = v101;
      if ((v83 & 1) != 0)
      {
LABEL_101:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v144 = 270;
          *(_WORD *)&v144[4] = 2080;
          *(_QWORD *)&v144[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysi"
                                "s/Framework/Storytelling/Tasks/SharedLibraryTasks/PHACameraSmartSharingTask.m";
          _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        if (v102 && !*v102)
        {
          objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
          v10 = 0;
          *v102 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        goto LABEL_108;
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_ERROR, "PHACameraSmartSharingTask: No existing active scope, not generating cache.", buf, 2u);
      }
      v10 = 0;
    }
    if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0, v100))
      goto LABEL_101;
LABEL_108:

    goto LABEL_109;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v144 = 125;
    *(_WORD *)&v144[4] = 2080;
    *(_QWORD *)&v144[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fram"
                          "ework/Storytelling/Tasks/SharedLibraryTasks/PHACameraSmartSharingTask.m";
    _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  if (a5 && !*a5)
  {
    objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
    v10 = 0;
    *v102 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_109:

  return v10;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHACameraSmartSharingTask timeoutFatal:]", "PHACameraSmartSharingTask.m", 278, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHACameraSmartSharingTask is stuck", v3, 2u);
  }
}

- (NSString)libraryScopeLocalIdentifier
{
  return self->_libraryScopeLocalIdentifier;
}

- (void)setLibraryScopeLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_libraryScopeLocalIdentifier, a3);
}

- (PHLibraryScope)libraryScope
{
  return self->_libraryScope;
}

- (void)setLibraryScope:(id)a3
{
  objc_storeStrong((id *)&self->_libraryScope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryScope, 0);
  objc_storeStrong((id *)&self->_libraryScopeLocalIdentifier, 0);
}

void __72__PHACameraSmartSharingTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  uint64_t v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v36 = a2;
  objc_msgSend(v36, "emailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v46;
    *(_QWORD *)&v5 = 138478083;
    v34 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "value", v34);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9) & 1) == 0)
        {
          v10 = objc_alloc(MEMORY[0x1E0CD1490]);
          objc_msgSend(v36, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v10, "initWithPhoneNumber:emailAddress:contactIdentifiers:", 0, v9, v12);

          objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);
          v14 = *(NSObject **)(a1 + 48);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = v34;
            v53 = v13;
            v54 = 2112;
            v55 = v15;
            _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Added additional identify %{private}@ for participant:%@", buf, 0x16u);
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v6);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v36, "phoneNumbers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v42;
    *(_QWORD *)&v18 = 138478083;
    v35 = v18;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "value", v35);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v23 = *(id *)(a1 + 64);
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v38;
LABEL_19:
          v27 = 0;
          while (1)
          {
            if (*(_QWORD *)v38 != v26)
              objc_enumerationMutation(v23);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v27), "isLikePhoneNumber:", v22) & 1) != 0)
              break;
            if (v25 == ++v27)
            {
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
              if (v25)
                goto LABEL_19;
              goto LABEL_25;
            }
          }
        }
        else
        {
LABEL_25:

          v28 = objc_alloc(MEMORY[0x1E0CD1490]);
          objc_msgSend(v22, "stringValue");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (id)objc_msgSend(v28, "initWithPhoneNumber:emailAddress:contactIdentifiers:", v29, 0, v31);

          objc_msgSend(*(id *)(a1 + 40), "addObject:", v23);
          v32 = *(NSObject **)(a1 + 48);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = *(_QWORD *)(a1 + 56);
            *(_DWORD *)buf = v35;
            v53 = v23;
            v54 = 2112;
            v55 = v33;
            _os_log_impl(&dword_1CAC16000, v32, OS_LOG_TYPE_DEFAULT, "PHACameraSmartSharingTask: Added additional identify %{private}@ for participant:%@", buf, 0x16u);
          }
        }

      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v19);
  }

}

@end
