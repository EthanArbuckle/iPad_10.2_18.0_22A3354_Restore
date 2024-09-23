@implementation SBActionHandler

+ (id)sharedInstance
{
  if (sharedInstance___once_6 != -1)
    dispatch_once(&sharedInstance___once_6, &__block_literal_global_181);
  return (id)sharedInstance___instance_7;
}

uint64_t __33__SBActionHandler_sharedInstance__block_invoke()
{
  SBActionHandler *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBActionHandler);
  v1 = (void *)sharedInstance___instance_7;
  sharedInstance___instance_7 = (uint64_t)v0;

  return kdebug_trace();
}

- (void)handleActions:(id)a3 origin:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v17;
  char v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  char v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  SBActionHandler *v80;
  id v81;
  uint64_t v82;
  uint64_t (**v83)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v84;
  uint64_t v85;
  _QWORD v86[5];
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[5];
  id v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  SBActionHandler *v102;
  void *v103;
  _QWORD v104[6];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  uint64_t v114;
  void *v115;
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  id v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke;
  v112[3] = &unk_1E8EB09C0;
  v12 = v10;
  v113 = v12;
  v13 = (void *)MEMORY[0x1D17E5550](v112);
  v109[0] = v11;
  v109[1] = 3221225472;
  v109[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_2;
  v109[3] = &unk_1E8EB09E8;
  v14 = v9;
  v110 = v14;
  v15 = v13;
  v111 = v15;
  v16 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v109);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v17 = v8;
  v85 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
  if (!v85)
  {

LABEL_79:
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
    goto LABEL_80;
  }
  v73 = v15;
  v18 = 1;
  v84 = *(_QWORD *)v106;
  v76 = *MEMORY[0x1E0CB2938];
  v82 = *MEMORY[0x1E0DAB7B0];
  v74 = *MEMORY[0x1E0DAB7D0];
  v71 = *MEMORY[0x1E0DAB7C8];
  v72 = *MEMORY[0x1E0DAB7C0];
  v70 = *MEMORY[0x1E0DAB7B8];
  v78 = *MEMORY[0x1E0DAB7A8];
  v80 = self;
  v81 = v17;
  v19 = MEMORY[0x1E0C809B0];
  v83 = v16;
  v75 = v14;
  while (2)
  {
    for (i = 0; i != v85; ++i)
    {
      if (*(_QWORD *)v106 != v84)
        objc_enumerationMutation(v17);
      if ((v18 & 1) == 0)
      {

        v15 = v73;
        goto LABEL_80;
      }
      v21 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v104[0] = v19;
        v104[1] = 3221225472;
        v104[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_13;
        v104[3] = &unk_1E8E9E820;
        v104[4] = self;
        v104[5] = v21;
        v18 = ((uint64_t (**)(_QWORD, void *, const __CFString *, _QWORD *))v16)[2](v16, v21, CFSTR("com.apple.backboardd"), v104);
        continue;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v100[0] = v19;
        v100[1] = 3221225472;
        v100[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_2_15;
        v100[3] = &unk_1E8E9E270;
        v101 = v14;
        v102 = self;
        v103 = v21;
        v18 = ((uint64_t (**)(_QWORD, void *, const __CFString *, _QWORD *))v16)[2](v16, v21, CFSTR("com.apple.frontboard.shutdown"), v100);

        continue;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "slot");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isEqualToString:", v82) & 1) != 0)
        {
          objc_msgSend((id)SBApp, "windowSceneManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "activeDisplayWindowScene");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isContinuityDisplayWindowScene");

          v18 = 1;
          if ((v27 & 1) != 0)
          {
            self = v80;
            v17 = v81;
            goto LABEL_69;
          }
          self = v80;
          v17 = v81;
          if (!v23)
            goto LABEL_69;
        }
        else
        {

          if (!v23)
            goto LABEL_68;
        }
        objc_msgSend(v22, "slot");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", v82);

        if (v32)
        {
          if (objc_msgSend(v22, "secureAppType"))
          {
            v19 = MEMORY[0x1E0C809B0];
            v98[0] = MEMORY[0x1E0C809B0];
            v98[1] = 3221225472;
            v98[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_3;
            v98[3] = &unk_1E8E9DED8;
            v33 = v22;
            v99 = v33;
            if (((uint64_t (**)(_QWORD, id, const __CFString *, _QWORD *))v83)[2](v83, v33, CFSTR("com.apple.springboard.lockScreenContentAssertion"), v98))
            {
              v18 = 1;
              v34 = v99;
LABEL_70:

              goto LABEL_71;
            }
            v96[0] = v19;
            v96[1] = 3221225472;
            v96[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_4;
            v96[3] = &unk_1E8E9DED8;
            v97 = v33;
            v41 = ((uint64_t (**)(_QWORD, id, const __CFString *, _QWORD *))v83)[2](v83, v97, CFSTR("com.apple.springboard.secureAppAssertion"), v96);

            v42 = v99;
            goto LABEL_64;
          }
LABEL_50:
          v18 = 1;
          v19 = MEMORY[0x1E0C809B0];
LABEL_71:

          goto LABEL_72;
        }
        objc_msgSend(v22, "slot");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", v74);

        if (v39)
        {
          objc_msgSend(v22, "identifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v40)
            goto LABEL_50;
          v19 = MEMORY[0x1E0C809B0];
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_5;
          v94[3] = &unk_1E8E9DED8;
          v95 = v22;
          v41 = ((uint64_t (**)(_QWORD, id, const __CFString *, _QWORD *))v83)[2](v83, v95, CFSTR("com.apple.springboard.lockScreenContentAssertion"), v94);
          v42 = v95;
LABEL_64:

          if ((v41 & 1) != 0)
          {
            v18 = 1;
            goto LABEL_71;
          }
          v18 = 0;
LABEL_69:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v78, 2, 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D016A8], "responseForError:", v34);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "sendResponse:", v69);

          v19 = MEMORY[0x1E0C809B0];
          goto LABEL_70;
        }
        objc_msgSend(v22, "slot");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v59, "isEqualToString:", v72) & 1) != 0)
          goto LABEL_54;
        objc_msgSend(v22, "slot");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v60, "isEqualToString:", v71))
        {

LABEL_54:
LABEL_55:
          v19 = MEMORY[0x1E0C809B0];
          v92[0] = MEMORY[0x1E0C809B0];
          v92[1] = 3221225472;
          v92[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_6;
          v92[3] = &unk_1E8E9E820;
          v92[4] = self;
          v93 = v22;
          v41 = ((uint64_t (**)(_QWORD, id, const __CFString *, _QWORD *))v83)[2](v83, v93, CFSTR("com.apple.springboard.lockScreenContentAssertion"), v92);
          v42 = v93;
          goto LABEL_64;
        }
        objc_msgSend(v22, "slot");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "isEqualToString:", v70);

        v17 = v81;
        if ((v68 & 1) != 0)
          goto LABEL_55;
LABEL_68:
        v18 = 1;
        goto LABEL_69;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = objc_opt_class();
        v29 = v21;
        if (v28)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v30 = v29;
          else
            v30 = 0;
        }
        else
        {
          v30 = 0;
        }
        v43 = v30;

        objc_msgSend(v43, "persistedIdentifiers");
        v44 = objc_claimAutoreleasedReturnValue();
        v79 = (void *)v44;
        if (v44)
        {
          v45 = (void *)v44;
          v77 = v43;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = 0u;
          v89 = 0u;
          v90 = 0u;
          v91 = 0u;
          v47 = v45;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v88, v120, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v89;
            do
            {
              for (j = 0; j != v49; ++j)
              {
                if (*(_QWORD *)v89 != v50)
                  objc_enumerationMutation(v47);
                v52 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
                +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "existingSceneHandleForPersistenceIdentifier:", v52);
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                if (v54)
                {
                  objc_msgSend(v46, "addObject:", v54);
                }
                else
                {
                  SBLogCommon();
                  v55 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v117 = 0;
                    v118 = 2112;
                    v119 = v29;
                  }

                }
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v88, v120, 16);
            }
            while (v49);
          }

          if (objc_msgSend(v46, "count"))
          {
            v43 = v77;
            SBApplicationSceneEntityDestructionMakeIntent(objc_msgSend(v77, "preferredAnimationType"), objc_msgSend(v77, "destroySceneSession"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v86[0] = MEMORY[0x1E0C809B0];
            v86[1] = 3221225472;
            v86[2] = __51__SBActionHandler_handleActions_origin_withResult___block_invoke_27;
            v86[3] = &unk_1E8EB0A50;
            v86[4] = v29;
            v87 = &__block_literal_global_23_4;
            SBWorkspaceDestroyApplicationSceneHandlesWithIntent(v46, v56, v86);

            v57 = 0;
            v58 = 0;
            v14 = v75;
            v17 = v81;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to retrive SBDeviceApplicationSceneHandle-s from the provided persisted identifiers: %@"), v47);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = 2;
            v14 = v75;
            v17 = v81;
            v43 = v77;
          }

          if (!v57)
            goto LABEL_62;
        }
        else
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 1;
          if (!v57)
          {
LABEL_62:

            v18 = 1;
            self = v80;
            v19 = MEMORY[0x1E0C809B0];
LABEL_72:
            v16 = v83;
            continue;
          }
        }
        SBLogCommon();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v117 = v57;
          _os_log_error_impl(&dword_1D0540000, v61, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        v62 = (void *)MEMORY[0x1E0CB35C8];
        v63 = SBActionHandlerErrorDomain;
        v114 = v76;
        v115 = v57;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "errorWithDomain:code:userInfo:", v63, v58, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        __51__SBActionHandler_handleActions_origin_withResult___block_invoke_7(v66, v29, v65);
        v17 = v81;
        goto LABEL_62;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = objc_msgSend(v21, "locations");
        +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "wallpaperConfigurationManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 1;
        objc_msgSend(v37, "wallpaperDidChangeForVariants:shouldNotify:", v35, 1);

        v16 = v83;
        v19 = MEMORY[0x1E0C809B0];
      }
      else
      {
        v18 = 1;
      }
    }
    v85 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
    if (v85)
      continue;
    break;
  }

  v15 = v73;
  if ((v18 & 1) != 0)
    goto LABEL_79;
LABEL_80:

}

uint64_t __51__SBActionHandler_handleActions_origin_withResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __51__SBActionHandler_handleActions_origin_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(*(id *)(a1 + 32), "hasEntitlement:", v8);
  if ((_DWORD)v10)
  {
    if (v9)
      v9[2](v9);
  }
  else
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Entitlement %{public}@ required for action: %{public}@", (uint8_t *)&v15, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  return v10;
}

uint64_t __51__SBActionHandler_handleActions_origin_withResult___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportAndKillInsecureProcesses:", *(_QWORD *)(a1 + 40));
}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_2_15(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_executeRestartAction:fromProcess:", *(_QWORD *)(a1 + 48), v3);
}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_3(uint64_t a1)
{
  id v2;

  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addLockScreenContentAction:", *(_QWORD *)(a1 + 32));

}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_4(uint64_t a1)
{
  id v2;

  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addLockScreenContentAction:", *(_QWORD *)(a1 + 32));

}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_5(uint64_t a1)
{
  id v2;

  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addLockScreenContentAction:", *(_QWORD *)(a1 + 32));

}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
      if (objc_msgSend(v7, "handlesActionWithClass:", objc_opt_class(), (_QWORD)v8))
      {
        if ((objc_msgSend(v7, "handleAction:forProvider:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32)) & 1) != 0)
          break;
      }
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __51__SBActionHandler_handleActions_origin_withResult___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  if (objc_msgSend(v6, "canSendResponse"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA500]), "initWithInfo:error:", 0, v4);
    objc_msgSend(v6, "sendResponse:", v5);

  }
}

uint64_t __51__SBActionHandler_handleActions_origin_withResult___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addActionHandler:(id)a3
{
  id v4;
  NSHashTable *externalHandlers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    externalHandlers = self->_externalHandlers;
    v8 = v4;
    if (!externalHandlers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_externalHandlers;
      self->_externalHandlers = v6;

      externalHandlers = self->_externalHandlers;
    }
    -[NSHashTable addObject:](externalHandlers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeActionHandler:(id)a3
{
  -[NSHashTable removeObject:](self->_externalHandlers, "removeObject:", a3);
}

- (void)_executeRestartAction:(id)a3 fromProcess:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBRestartTransitionRequest *v8;
  void *v9;
  SBRestartTransitionRequest *v10;
  unsigned int v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  FBSProcessPrettyDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("RestartTransitionRequest-(%@)-reason:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [SBRestartTransitionRequest alloc];
  objc_msgSend(v16, "reason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBRestartTransitionRequest initWithRequester:reason:](v8, "initWithRequester:reason:", v7, v9);

  v11 = objc_msgSend(v16, "options");
  v12 = v11;
  if ((v11 & 1) != 0)
    v13 = 2;
  else
    v13 = (v11 >> 2) & 1;
  -[SBRestartTransitionRequest setRestartType:](v10, "setRestartType:", v13);
  if ((v12 & 2) != 0)
    -[SBRestartTransitionRequest setWantsPersistentSnapshot:](v10, "setWantsPersistentSnapshot:", 1);
  objc_msgSend(v16, "targetURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRestartTransitionRequest setApplicationLaunchURL:](v10, "setApplicationLaunchURL:", v14);

  objc_msgSend((id)SBApp, "restartManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "restartWithTransitionRequest:", v10);

}

- (void)_reportAndKillInsecureProcesses:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  const char *v40;
  SBActionHandler *v41;
  unsigned int v42;
  id v43;
  id obj;
  _QWORD v45[4];
  NSObject *v46;
  NSObject *v47;
  SBActionHandler *v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  id (*v52)(uint64_t);
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  NSObject *v60;
  id v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "secureModeViolations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWorkspace();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v70 = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Received insecure drawing action %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "killsInsecureDrawingApps") & 1) != 0)
  {
    v41 = self;
    v43 = v4;
    v42 = getpid();
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v5;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v64 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v14, "layerNamesByContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (v16)
          {
            objc_msgSend(v14, "layerNamesByContext");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke;
            v59[3] = &unk_1E8EB0A78;
            v60 = v8;
            v61 = v9;
            v62 = v14;
            objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v59);

            v18 = v60;
          }
          else
          {
            objc_msgSend(v14, "processId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v18);
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      }
      while (v11);
    }

    v19 = v8;
    if (-[NSObject count](v8, "count"))
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v20 = v8;
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v56;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v56 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
            v50 = MEMORY[0x1E0C809B0];
            v51 = 3221225472;
            v52 = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_2;
            v53 = &unk_1E8EA2060;
            v54 = v25;
            AnalyticsSendEventLazy();
          }
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
        }
        while (v22);
      }

    }
    if (!objc_msgSend(v9, "count"))
    {
      +[SBDefaults localDefaults](SBDefaults, "localDefaults");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "securityDefaults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "enableLayerBasedViewSecurity");

      if ((v28 & 1) == 0)
      {
        SBLogWorkspace();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v34, OS_LOG_TYPE_DEFAULT, "Disregarding insecure drawing action because only layer-based violations were reported.", buf, 2u);
        }
        v4 = v43;
        goto LABEL_42;
      }
    }
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "securityDefaults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "enableLayerBasedViewSecurity");

    if (v31)
    {
      v32 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(obj, "bs_map:", &__block_literal_global_52_0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setWithArray:", v33);
      v34 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = v9;
    }
    v35 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithObject:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[NSObject isEqualToSet:](v34, "isEqualToSet:", v37);

    if (v38)
    {
      SBLogWorkspace();
      v39 = objc_claimAutoreleasedReturnValue();
      v4 = v43;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v40 = "Disregarding insecure drawing action because only SpringBoard violations were reported.";
LABEL_40:
        _os_log_impl(&dword_1D0540000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 2u);
      }
    }
    else
    {
      v4 = v43;
      if (-[NSObject count](v34, "count"))
      {
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_54;
        v45[3] = &unk_1E8EB0B08;
        v46 = obj;
        v49 = v42;
        v47 = v34;
        v48 = v41;
        -[SBActionHandler _captureRadarAttachmentsWithCompletion:](v41, "_captureRadarAttachmentsWithCompletion:", v45);

        v39 = v46;
      }
      else
      {
        SBLogWorkspace();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v40 = "Disregarding insecure drawing action because no processes were selected for reporting.";
          goto LABEL_40;
        }
      }
    }

LABEL_42:
    goto LABEL_43;
  }
  SBLogWorkspace();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Disregarding insecure drawing actions per configuration settings.", buf, 2u);
  }
LABEL_43:

}

void __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "unionSet:", v6);
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "processId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

id __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("layerName");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_50(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "processId");
}

void __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_54(uint64_t a1, void *a2, int a3)
{
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  char v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  int v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  dispatch_time_t v61;
  void *v62;
  id v63;
  NSObject *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id obj;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  _QWORD block[4];
  id v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  uint8_t v106[128];
  uint8_t buf[4];
  int v108;
  __int16 v109;
  id v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a3)
  {
    SBLogWorkspace();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_69;
    *(_WORD *)buf = 0;
    v6 = "Disregarding insecure drawing actions because attachments are still being gathered for a previous report.";
LABEL_65:
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_69;
  }
  +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasAnyLockState");

  if ((v8 & 1) == 0)
  {
    SBLogWorkspace();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_69;
    *(_WORD *)buf = 0;
    v6 = "Disregarding insecure drawing actions because the UI is not locked.";
    goto LABEL_65;
  }
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v5 = objc_claimAutoreleasedReturnValue();
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = *(id *)(a1 + 32);
  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
  if (!v75)
  {
    v10 = 0;
    v63 = 0;

    goto LABEL_68;
  }
  v62 = v4;
  v9 = 0;
  v63 = 0;
  v10 = 0;
  v74 = *(_QWORD *)v102;
  v11 = a1;
  v64 = v5;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v102 != v74)
        objc_enumerationMutation(obj);
      v76 = v12;
      v13 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v12);
      objc_msgSend(v13, "processId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue");

      if ((int)v15 < 1 || (_DWORD)v15 == *(_DWORD *)(v11 + 56))
        goto LABEL_45;
      v16 = *(void **)(v11 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = objc_msgSend(v16, "containsObject:", v17);

      if (!(_DWORD)v16)
      {
        v11 = a1;
LABEL_45:
        v54 = v76;
        goto LABEL_46;
      }
      -[NSObject processForPID:](v5, "processForPID:", v15);
      v18 = objc_claimAutoreleasedReturnValue();
      v11 = a1;
      v71 = (void *)v18;
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = MEMORY[0x1E0C809B0];
        v99[0] = MEMORY[0x1E0C809B0];
        v99[1] = 3221225472;
        v99[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_57;
        v99[3] = &unk_1E8EA7FD8;
        v22 = v19;
        v100 = v22;
        objc_msgSend(v20, "scenesPassingTest:", v99);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v97[0] = v21;
        v97[1] = 3221225472;
        v97[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_2_59;
        v97[3] = &unk_1E8EA7FD8;
        v23 = v22;
        v98 = v23;
        v67 = v20;
        objc_msgSend(v20, "scenesPassingTest:", v97);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v23;
        objc_msgSend(v23, "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogWorkspace();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v70, "state");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109890;
          v108 = v15;
          v109 = 2114;
          v110 = v24;
          v111 = 2112;
          v112 = v59;
          v113 = 2114;
          v114 = v68;
          _os_log_error_impl(&dword_1D0540000, v25, OS_LOG_TYPE_ERROR, "Killing process with pid %i (bundleID: %{public}@, state: %@, foreground scenes: %{public}@) for view security", buf, 0x26u);

          v11 = a1;
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.springboard.processesKilledForInsecureDrawing.%@"), v24);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        ADClientAddValueForScalarKey();
        if (!v10)
        {
          objc_msgSend(v70, "handle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (id)objc_msgSend(v27, "copy");

          v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v13, "layerNamesByContext");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_62;
          v95[3] = &unk_1E8EB0AE0;
          v30 = v28;
          v96 = v30;
          objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v95);

          if (objc_msgSend(v30, "count"))
          {
            v31 = objc_msgSend(v30, "copy");

            v63 = (id)v31;
          }
          v11 = a1;

        }
        if (objc_msgSend(v70, "isApplicationProcess"))
        {
          v65 = v10;
          +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "lockState");

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Process detected doing insecure drawing while in secure mode | isUILocked:%d"), v33 & 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          v77 = v69;
          v80 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
          if (v80)
          {
            v78 = *(_QWORD *)v92;
            v79 = v24;
            do
            {
              v35 = 0;
              do
              {
                if (*(_QWORD *)v92 != v78)
                  objc_enumerationMutation(v77);
                v36 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v35);
                objc_msgSend(v36, "settings");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "identifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "stringByAppendingFormat:", CFSTR(" \n Scene %@ isOccluded:%d"), v38, objc_msgSend(v37, "isOccluded"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                v81 = v37;
                v82 = v35;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v39, "stringByAppendingFormat:", CFSTR(" isUnderlock:%d"), objc_msgSend(v37, "underLock"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v34 = v39;
                }
                v89 = 0u;
                v90 = 0u;
                v87 = 0u;
                v88 = 0u;
                objc_msgSend(v13, "contextIds");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
                if (v41)
                {
                  v42 = v41;
                  v43 = *(_QWORD *)v88;
                  do
                  {
                    for (i = 0; i != v42; ++i)
                    {
                      if (*(_QWORD *)v88 != v43)
                        objc_enumerationMutation(v40);
                      v45 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
                      v46 = objc_msgSend(v45, "unsignedIntValue");
                      objc_msgSend(v34, "stringByAppendingFormat:", CFSTR(" \n contextId:0x%x"), v46);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v36, "layerManager");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "layerWithContextID:", v46);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v49)
                      {
                        objc_msgSend(v49, "level");
                        objc_msgSend(v47, "stringByAppendingFormat:", CFSTR(" level:%.1f"), v50);
                        v51 = objc_claimAutoreleasedReturnValue();

                        v47 = (void *)v51;
                      }
                      objc_msgSend(v13, "layerNamesByContext");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "objectForKey:", v45);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v53, "count"))
                      {
                        objc_msgSend(v47, "stringByAppendingFormat:", CFSTR("\n   violating layer names:%@"), v53);
                        v34 = (void *)objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        v34 = v47;
                      }

                    }
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v87, v105, 16);
                  }
                  while (v42);
                }

                v35 = v82 + 1;
                v24 = v79;
              }
              while (v82 + 1 != v80);
              v80 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v106, 16);
            }
            while (v80);
          }

          objc_msgSend(v70, "killForReason:andReport:withDescription:", 8, 1, v34);
          v5 = v64;
          v10 = v65;
          v11 = a1;
        }
        else
        {
          kill(v15, 9);
        }

        v9 = 1;
        v54 = v76;
        v56 = v67;
      }
      else
      {
        BSExecutablePathForPID();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "lastPathComponent");
        v56 = (id)objc_claimAutoreleasedReturnValue();

        v57 = kill(v15, 9);
        SBLogWorkspace();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          v108 = v15;
          v109 = 2114;
          v110 = v56;
          v111 = 1024;
          LODWORD(v112) = v57;
          _os_log_error_impl(&dword_1D0540000, v58, OS_LOG_TYPE_ERROR, "Killing unknown process with pid %i for view security: %{public}@ (result: %i)", buf, 0x18u);
        }

        if (v57 == 3)
        {
          v11 = a1;
          v54 = v76;
        }
        else
        {
          v11 = a1;
          v54 = v76;
          if (v56)
          {
            if (v10)
            {
              v9 = 1;
            }
            else
            {
              v56 = v56;
              v9 = 1;
              v10 = v56;
            }
          }
        }
      }

LABEL_46:
      v12 = v54 + 1;
    }
    while (v12 != v75);
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
    v75 = v60;
  }
  while (v60);

  if ((v9 & 1) != 0 && objc_msgSend(*(id *)(v11 + 48), "_shouldPromptForSecureDrawViolations"))
  {
    v61 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_76;
    block[3] = &unk_1E8E9E270;
    v10 = v10;
    v84 = v10;
    v63 = v63;
    v85 = v63;
    v4 = v62;
    v86 = v62;
    dispatch_after(v61, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v4 = v62;
  }
LABEL_68:

LABEL_69:
}

uint64_t __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;

  v3 = a2;
  objc_msgSend(v3, "clientProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    objc_msgSend(v3, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sb_displayIdentityForSceneManagers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCarDisplay");

    v6 = v9 ^ 1u;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_2_59(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "clientProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5
    && (objc_msgSend(v3, "settings"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "sb_displayIdentityForSceneManagers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isCarDisplay"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    objc_msgSend(v3, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isForeground"))
      v9 = objc_msgSend(v11, "isOccluded") ^ 1;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

void __51__SBActionHandler__reportAndKillInsecureProcesses___block_invoke_76(_QWORD *a1)
{
  void *v2;
  SBInsecureDrawingAlertItem *v3;

  v3 = objc_alloc_init(SBInsecureDrawingAlertItem);
  -[SBInsecureDrawingAlertItem setProcessName:](v3, "setProcessName:", a1[4]);
  -[SBInsecureDrawingAlertItem setLayerNames:](v3, "setLayerNames:", a1[5]);
  -[SBDiagnosticRequestAlertItem setRadarAttachments:](v3, "setRadarAttachments:", a1[6]);
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateAlertItem:", v3);

}

- (BOOL)_shouldPromptForSecureDrawViolations
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isInternalInstall"))
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "securityDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "reportSecureDrawViolations");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_captureRadarAttachmentsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  void (**v5)(id, _QWORD, uint64_t);

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  if (-[SBActionHandler _shouldPromptForSecureDrawViolations](self, "_shouldPromptForSecureDrawViolations"))
  {
    if (self->_capturingDisplayDump)
    {
      v4[2](v4, 0, 1);
    }
    else
    {
      self->_capturingDisplayDump = 1;
      v5 = v4;
      BKSDisplayServicesArchiveWithOptionsAndCompletion();

    }
  }
  else if (v4)
  {
    v4[2](v4, 0, 0);
  }

}

void __58__SBActionHandler__captureRadarAttachmentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v20 = v4;
    v18 = a1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "temporaryDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v3;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("secureDrawViolation-%@-%@.caar"), v14, v6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "URLByAppendingPathComponent:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "writeToURL:atomically:", v16, 0))
            objc_msgSend(v20, "addObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    a1 = v18;
    v3 = v19;
    v4 = v20;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SBActionHandler__captureRadarAttachmentsWithCompletion___block_invoke_2;
    block[3] = &unk_1E8E9F1E8;
    v23 = *(id *)(a1 + 40);
    v22 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;

}

uint64_t __58__SBActionHandler__captureRadarAttachmentsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalHandlers, 0);
}

@end
