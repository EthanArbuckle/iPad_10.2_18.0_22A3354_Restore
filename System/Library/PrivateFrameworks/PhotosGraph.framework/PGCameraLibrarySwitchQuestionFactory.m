@implementation PGCameraLibrarySwitchQuestionFactory

+ (BOOL)isSharedLibraryQuestionsEnabledForPhotoLibrary:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_libraryScopeFromPhotoLibrary:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (id)_libraryScopeFromPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v6);

  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] no active scope", (uint8_t *)&v14, 2u);
    }
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "[PGCameraLibrarySwitchQuestionFactory] more than 1 scope configured, using first one: %@", (uint8_t *)&v14, 0xCu);

    }
LABEL_8:

  }
  return v8;
}

- (unsigned)questionType
{
  return 23;
}

- (id)collidingQuestionTypes
{
  return &unk_1E84E99B8;
}

- (int64_t)questionOptions
{
  return 0x200000;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  id v5;
  void (**v6)(void *, _BYTE *, double);
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double Current;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  unsigned __int8 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  int v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  int v40;
  int v41;
  __CFString *v42;
  char v43;
  void *v44;
  double v45;
  int v46;
  __CFString *v47;
  __CFString *v48;
  PGCameraLibrarySwitchQuestion *v49;
  void *v50;
  PGCameraLibrarySwitchQuestion *v51;
  __CFString *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  __CFString *v56;
  __CFString *v57;
  PGCameraLibrarySwitchQuestion *v58;
  void *v59;
  NSObject *v60;
  id v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  __CFString *v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void (**v77)(void *, _BYTE *, double);
  id v78;
  uint64_t v79;
  uint64_t v80;
  void *context;
  uint64_t v82;
  __CFString *v83;
  uint64_t v84;
  void *v85;
  int v87;
  __CFString *v88;
  PGCameraLibrarySwitchQuestionFactory *v89;
  void *v90;
  int v91;
  void *v92;
  _BOOL4 v93;
  _BOOL4 v94;
  __CFString *v95;
  uint64_t v96;
  void *v97;
  __CFString *v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  char v108;
  uint8_t buf[4];
  _BYTE v110[18];
  __int16 v111;
  __CFString *v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void (**)(void *, _BYTE *, double))_Block_copy(v5);
  v7 = 0.0;
  if (!v6 || (v8 = CFAbsoluteTimeGetCurrent(), v8 < 0.01))
  {
LABEL_8:
    -[PGSurveyQuestionFactory workingContext](self, "workingContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend((id)objc_opt_class(), "isSharedLibraryQuestionsEnabledForPhotoLibrary:", v11) & 1) != 0)
    {
      if (a3)
      {
        objc_msgSend((id)objc_opt_class(), "_libraryScopeFromPhotoLibrary:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12)
        {
          v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_104:

          goto LABEL_105;
        }
        objc_msgSend(v12, "uuid");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        -[PGCameraLibrarySwitchQuestionFactory _momentsForQuestions](self, "_momentsForQuestions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");
        if (v16)
        {
          v17 = v16;
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v18 = v15;
          v79 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
          if (v79)
          {
            v19 = 1.0 / (double)v17;
            v20 = *(_QWORD *)v105;
            v21 = 0.0;
            v77 = v6;
            v78 = v5;
            v75 = v13;
            v76 = v11;
            v85 = v14;
            v73 = v18;
            v74 = v15;
            v89 = self;
            v72 = *(_QWORD *)v105;
LABEL_14:
            v22 = 0;
LABEL_15:
            if (*(_QWORD *)v105 != v20)
            {
              v23 = v22;
              objc_enumerationMutation(v18);
              v22 = v23;
            }
            v80 = v22;
            v24 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * v22);
            if (!v6)
              goto LABEL_21;
            Current = CFAbsoluteTimeGetCurrent();
            if (Current - v7 < 0.01)
              goto LABEL_21;
            v108 = 0;
            v6[2](v6, &v108, v21);
            if (!v108)
            {
              v7 = Current;
LABEL_21:
              context = (void *)MEMORY[0x1CAA4EB2C]();
              -[PGCameraLibrarySwitchQuestionFactory _assetsFetchResultFromMoment:](self, "_assetsFetchResultFromMoment:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = 0u;
              v101 = 0u;
              v102 = 0u;
              v103 = 0u;
              v27 = v26;
              v28 = -[__CFString countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
              if (!v28)
              {
                v67 = v27;
                goto LABEL_72;
              }
              v29 = 0;
              v30 = 0;
              v31 = 0;
              v32 = 0;
              v91 = 0;
              v33 = 0;
              v95 = 0;
              v99 = 0;
              v34 = *(_QWORD *)v101;
              v35 = v28;
              v82 = *(_QWORD *)v101;
              v83 = v27;
LABEL_23:
              v36 = 0;
              v84 = v35;
              while (1)
              {
                if (*(_QWORD *)v101 != v34)
                  objc_enumerationMutation(v27);
                v37 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v36);
                if ((objc_msgSend(v37, "isCloudPhotoLibraryAsset", v72) & 1) == 0)
                  break;
LABEL_68:
                if (v35 == ++v36)
                {
                  v35 = -[__CFString countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
                  if (v35)
                    goto LABEL_23;

                  v6 = v77;
                  v5 = v78;
                  v13 = v75;
                  v11 = v76;
                  v67 = v33;
                  v14 = v85;
                  v18 = v73;
                  v15 = v74;
                  self = v89;
LABEL_72:

                  objc_autoreleasePoolPop(context);
                  v21 = v19 + v21;
                  v22 = v80 + 1;
                  v20 = v72;
                  if (v80 + 1 == v79)
                  {
                    v68 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
                    v20 = v72;
                    v79 = v68;
                    if (!v68)
                      goto LABEL_95;
                    goto LABEL_14;
                  }
                  goto LABEL_15;
                }
              }
              v87 = v32;
              v38 = v31;
              objc_msgSend(v37, "libraryScopeProperties");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "suggestedByClientType");
              v94 = v40 == 3;
              v41 = objc_msgSend(v39, "assetRejectedByCamera");
              v93 = v40 == 2;
              if (v40 == -1)
              {
                HIDWORD(v96) = objc_msgSend(v39, "assetManuallyRejectedByUser");
              }
              else
              {
                v96 = 0;
                v42 = CFSTR("auto on");
                if (v40 == 3)
                {
LABEL_41:
                  v98 = v42;
                  objc_msgSend(v37, "creationDate");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "timeIntervalSinceDate:", v97);
                  if (v45 >= 180.0
                    || (v29 & ((v40 & 0xFFFFFFFE) == 2)) != 0
                    || (v30 & (HIDWORD(v96) | v41) & 1) != 0
                    || (v40 == 3 ? (v46 = 1) : (v46 = v41),
                        ((v38 | v87) & v46 & 1) != 0
                     || (v96 & (v91 ^ 1) & 1) != 0
                     || (v91 & (v96 ^ 1)) != 0))
                  {
                    v92 = v44;
                    v47 = CFSTR("none");
                    if (v33)
                      v47 = v33;
                    v48 = v47;
                    v49 = [PGCameraLibrarySwitchQuestion alloc];
                    objc_msgSend(v37, "uuid");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v51 = -[PGCameraLibrarySwitchQuestion initWithAssetUUID:libraryScopeUUID:previousSwitchState:currentSwitchState:](v49, "initWithAssetUUID:libraryScopeUUID:previousSwitchState:currentSwitchState:", v50, v90, v48, v98);

                    v14 = v85;
                    if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](v89, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v51, v85))
                    {
                      v52 = v33;
                      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v53, "loggingConnection");
                      v54 = objc_claimAutoreleasedReturnValue();

                      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v37, "uuid");
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        *(_QWORD *)v110 = v55;
                        *(_WORD *)&v110[8] = 2112;
                        *(_QWORD *)&v110[10] = v48;
                        v111 = 2112;
                        v112 = v98;
                        _os_log_impl(&dword_1CA237000, v54, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] question for asset %@, camera library switch state: %@ -> %@", buf, 0x20u);

                      }
                      objc_msgSend(v85, "addObject:", v51);
                      v33 = v52;
                      if (objc_msgSend(v85, "count") >= a3)
                        goto LABEL_94;
                    }
                    if (v99)
                    {
                      v56 = CFSTR("none");
                      if (v95)
                        v56 = v95;
                      v57 = v56;
                      v58 = -[PGCameraLibrarySwitchQuestion initWithAssetUUID:libraryScopeUUID:previousSwitchState:currentSwitchState:]([PGCameraLibrarySwitchQuestion alloc], "initWithAssetUUID:libraryScopeUUID:previousSwitchState:currentSwitchState:", v99, v90, v57, v48);
                      if (-[PGSurveyQuestionFactory shouldAddQuestion:toAlreadyGeneratedQuestions:](v89, "shouldAddQuestion:toAlreadyGeneratedQuestions:", v58, v85))
                      {
                        v88 = v33;
                        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v59, "loggingConnection");
                        v60 = objc_claimAutoreleasedReturnValue();

                        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412802;
                          *(_QWORD *)v110 = v99;
                          *(_WORD *)&v110[8] = 2112;
                          *(_QWORD *)&v110[10] = v57;
                          v111 = 2112;
                          v112 = v48;
                          _os_log_impl(&dword_1CA237000, v60, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] question for previous asset %@, camera library switch state: %@ -> %@", buf, 0x20u);
                        }

                        v14 = v85;
                        objc_msgSend(v85, "addObject:", v58);
                        v33 = v88;
                        if (objc_msgSend(v85, "count") >= a3)
                        {

LABEL_94:
                          objc_autoreleasePoolPop(context);
                          v6 = v77;
                          v5 = v78;
                          v13 = v75;
                          v11 = v76;
                          v18 = v73;
                          v15 = v74;
                          goto LABEL_95;
                        }
                      }

                    }
                    v44 = v92;
                  }
                  v61 = v44;

                  v62 = CFSTR("none");
                  if (v33)
                    v62 = v33;
                  v63 = v62;

                  v64 = v98;
                  v65 = v33;
                  v33 = v64;

                  objc_msgSend(v37, "uuid");
                  v66 = objc_claimAutoreleasedReturnValue();

                  v97 = v61;
                  v29 = v41;
                  v31 = v93;
                  v30 = v94;
                  v32 = HIDWORD(v96);
                  v91 = v96;
                  v95 = v63;
                  v99 = (void *)v66;
                  v34 = v82;
                  v27 = v83;
                  v35 = v84;
                  goto LABEL_68;
                }
              }
              if (v40 == 2)
                v43 = 1;
              else
                v43 = v41;
              v42 = CFSTR("user on");
              if (v41)
                v42 = CFSTR("auto off");
              if ((v43 & 1) != 0)
              {
                LODWORD(v96) = 0;
              }
              else
              {
                v42 = CFSTR("default off");
                if (HIDWORD(v96))
                  v42 = CFSTR("user off");
                LODWORD(v96) = HIDWORD(v96) ^ 1;
              }
              goto LABEL_41;
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v110 = 78;
              *(_WORD *)&v110[4] = 2080;
              *(_QWORD *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_101;
          }
LABEL_95:

          if (!v6 || CFAbsoluteTimeGetCurrent() - v7 < 0.01 || (v108 = 0, v6[2](v6, &v108, 1.0), !v108))
          {
            objc_msgSend(v14, "allObjects", v72);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_103;
          }
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_101:
            v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_103:

            goto LABEL_104;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v110 = 179;
          *(_WORD *)&v110[4] = 2080;
          *(_QWORD *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
          v70 = MEMORY[0x1E0C81028];
        }
        else
        {
          if (!v6)
            goto LABEL_101;
          if (CFAbsoluteTimeGetCurrent() - v7 < 0.01)
            goto LABEL_101;
          v108 = 0;
          v6[2](v6, &v108, 1.0);
          if (!v108 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_101;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v110 = 69;
          *(_WORD *)&v110[4] = 2080;
          *(_QWORD *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
          v70 = MEMORY[0x1E0C81028];
        }
        _os_log_impl(&dword_1CA237000, v70, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_101;
      }
      if (!v6
        || CFAbsoluteTimeGetCurrent() - v7 < 0.01
        || (v108 = 0, v6[2](v6, &v108, 1.0), !v108)
        || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_86:
        v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_105:

        goto LABEL_106;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v110 = 54;
      *(_WORD *)&v110[4] = 2080;
      *(_QWORD *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
      v69 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (!v6)
        goto LABEL_86;
      if (CFAbsoluteTimeGetCurrent() - v7 < 0.01)
        goto LABEL_86;
      v108 = 0;
      v6[2](v6, &v108, 1.0);
      if (!v108 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_86;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v110 = 49;
      *(_WORD *)&v110[4] = 2080;
      *(_QWORD *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
      v69 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v69, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    goto LABEL_86;
  }
  v108 = 0;
  v6[2](v6, &v108, 0.0);
  if (!v108)
  {
    v7 = v8;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v110 = 45;
    *(_WORD *)&v110[4] = 2080;
    *(_QWORD *)&v110[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Questions/Survey/SharedLibrary/PGCameraLibrarySwitchQuestionFactory.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
LABEL_106:

  return v9;
}

- (id)_momentsForQuestions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
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
  _QWORD v25[2];
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NSObject *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_libraryScopeFromPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSortDescriptors:", v7);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %i) != 0"), CFSTR("libraryScopeShareState"), 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInternalPredicate:", v8);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInLibraryScope:options:", v4, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "creationDate");
      v11 = objc_claimAutoreleasedReturnValue();

      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "loggingConnection");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "localIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v14;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] getting moments from active scope: %@, first smart share date: %@", buf, 0x16u);

      }
      objc_msgSend(v3, "librarySpecificFetchOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0CD19C0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFetchPropertySets:", v16);

      objc_msgSend(v15, "setFetchLimit:", 100);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v17;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSortDescriptors:", v19);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("endDate >= %@"), v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPredicate:", v20);

      objc_msgSend(v15, "setWantsIncrementalChangeDetails:", 0);
      objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentsWithOptions:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "localIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v23;
        _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[PGCameraLibrarySwitchQuestionFactory] no smart sharing assets in library scope: %@", buf, 0xCu);

      }
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_assetsFetchResultFromMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGSurveyQuestionFactory workingContext](self, "workingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  v11 = *MEMORY[0x1E0CD19D8];
  v16[0] = *MEMORY[0x1E0CD1960];
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFetchPropertySets:", v12);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K== %d"), CFSTR("additionalAttributes.importedBy"), 1, CFSTR("additionalAttributes.importedBy"), 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInternalPredicate:", v13);

  objc_msgSend(v7, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v4, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
