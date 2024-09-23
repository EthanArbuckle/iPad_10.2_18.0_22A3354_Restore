@implementation SBInputUISceneController

void __50__SBInputUISceneController_focusContextDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  dispatch_time_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  NSObject *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[6];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  int v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  SBLogInputUI();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v70 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Focused scene identity did change to: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "sceneIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "identityToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (!v6)
  {
    v9 = objc_opt_respondsToSelector();
    v10 = *(void **)(a1 + 32);
    if ((v9 & 1) != 0)
    {
      objc_msgSend(v10, "layeringSceneIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogInputUI();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v70 = v11;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Client overrides preferred layering scene identity: %{public}@", buf, 0xCu);
      }

      v13 = objc_msgSend(*(id *)(a1 + 32), "contextID");
      if (v11)
      {
        v14 = v11;
        v7 = v14;
LABEL_13:
        v15 = *(void **)(a1 + 32);
        if (!v15)
          goto LABEL_18;
        if ((_DWORD)v13 || v14)
        {
          if ((objc_msgSend(v15, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176)) & 1) == 0)
          {
            ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 200);
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 176), *(id *)(a1 + 32));
            objc_msgSend(*(id *)(a1 + 40), "_targetSceneForKeyboardFocusContext:", *(_QWORD *)(a1 + 32));
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = *(_QWORD *)(a1 + 40);
            v29 = *(void **)(v28 + 160);
            *(_QWORD *)(v28 + 160) = v27;

            if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 160))
            {
              objc_msgSend((id)SBApp, "windowSceneManager");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "activeDisplayWindowScene");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "_FBSScene");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "identityToken");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "sceneFromIdentityToken:", v34);
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = *(_QWORD *)(a1 + 40);
              v37 = *(void **)(v36 + 160);
              *(_QWORD *)(v36 + 160) = v35;

            }
            if (!(_DWORD)v13)
            {
              v38 = *(_QWORD **)(a1 + 40);
              if (v38[20])
              {
                objc_msgSend(v38, "defaultPresenter");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "hostingWindowForScene:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152));
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "_contextId");

                v67 = 0u;
                v68 = 0u;
                v65 = 0u;
                v66 = 0u;
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "clientSettings");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "layers");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "reverseObjectEnumerator");
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
                if (v45)
                {
                  v46 = v45;
                  v47 = *(_QWORD *)v66;
                  while (2)
                  {
                    for (i = 0; i != v46; ++i)
                    {
                      if (*(_QWORD *)v66 != v47)
                        objc_enumerationMutation(v44);
                      v49 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
                      if (objc_msgSend(v49, "contextID")
                        && objc_msgSend(v49, "contextID") != v41)
                      {
                        v13 = objc_msgSend(v49, "contextID");
                        goto LABEL_36;
                      }
                    }
                    v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
                    if (v46)
                      continue;
                    break;
                  }
                }
                v13 = 0;
LABEL_36:

              }
              else
              {
                v13 = 0;
              }
            }
            SBLogInputUI();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v62 = *(void **)(a1 + 32);
              v63 = *(void **)(*(_QWORD *)(a1 + 40) + 160);
              *(_DWORD *)buf = 138543874;
              v70 = v62;
              v71 = 2114;
              v72 = v63;
              v73 = 1024;
              v74 = v13;
              _os_log_error_impl(&dword_1D0540000, v50, OS_LOG_TYPE_ERROR, "Couldn't find a targetScene for the given focusContext[%{public}@]. Fall back to scene[%{public}@] and contextID[%x] ", buf, 0x1Cu);
            }

            v51 = *(_QWORD **)(a1 + 40);
            v52 = v51[20];
            if (v52)
            {
              objc_msgSend(v51, "_updateDefaultPresenterForTargetScene:contextID:", v52, v13);
              objc_msgSend(*(id *)(a1 + 40), "_currentTraitsPipelineManager");
              v53 = objc_claimAutoreleasedReturnValue();
              v54 = *(_QWORD *)(a1 + 40);
              v55 = *(void **)(v54 + 184);
              *(_QWORD *)(v54 + 184) = v53;

              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "setKeyboardFocusContext:", *(_QWORD *)(a1 + 32));
              SBLogInputUI();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject stringRepresentation](v14, "stringRepresentation");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "identifier");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v70 = v57;
                v71 = 2114;
                v72 = v58;
                _os_log_impl(&dword_1D0540000, v56, OS_LOG_TYPE_DEFAULT, "Target scene for focused identity[%{public}@]: %{public}@", buf, 0x16u);

              }
              v59 = *(_QWORD **)(a1 + 40);
              v60 = (void *)v59[18];
              objc_msgSend(v59, "_currentDisplayConfiguration");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "setTargetDisplayConfiguration:", v61);

              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "setSceneContentVisible:", 1);
            }
            goto LABEL_43;
          }
          if (!*(_QWORD *)(a1 + 32))
          {
LABEL_18:
            v16 = *(_QWORD *)(a1 + 40);
            if (*(_QWORD *)(v16 + 176))
            {
              objc_msgSend(*(id *)(v16 + 216), "invalidate");
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "setSceneContentVisible:", 0);
              v17 = *(_QWORD *)(a1 + 40);
              v18 = *(void **)(v17 + 168);
              *(_QWORD *)(v17 + 168) = 0;

              v19 = *(_QWORD *)(a1 + 40);
              v20 = *(void **)(v19 + 160);
              *(_QWORD *)(v19 + 160) = 0;

              v21 = *(_QWORD *)(a1 + 40);
              v22 = *(void **)(v21 + 176);
              *(_QWORD *)(v21 + 176) = 0;

              v23 = *(_QWORD *)(a1 + 40);
              v24 = *(void **)(v23 + 184);
              *(_QWORD *)(v23 + 184) = 0;

              v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200);
              v26 = dispatch_time(0, 4000000000);
              v64[0] = MEMORY[0x1E0C809B0];
              v64[1] = 3221225472;
              v64[2] = __50__SBInputUISceneController_focusContextDidChange___block_invoke_48;
              v64[3] = &unk_1E8E9DE88;
              v64[4] = *(_QWORD *)(a1 + 40);
              v64[5] = v25;
              dispatch_after(v26, MEMORY[0x1E0C80D38], v64);
            }
          }
        }
LABEL_43:

        goto LABEL_44;
      }
    }
    else
    {
      v13 = objc_msgSend(v10, "contextID");
    }
    objc_msgSend(*(id *)(a1 + 32), "sceneIdentity");
    v14 = objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_13;
  }
  SBLogInputUI();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v70 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Can't focus InputUI on itself: %{public}@. Note: this can happen in case InputUI scene is used for AutoFill purposes, when InputUI is otherwise not used for keyboard hosting ones.", buf, 0xCu);
  }
LABEL_44:

}

- (void)focusContextDidChange:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

- (void)_setupDefaultPresentationForTargetHostingGraph:(id)a3 targetScene:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  SBSystemUISceneDefaultPresenter *v26;
  SBSystemUISceneDefaultPresenter *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInputUISceneController.m"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetScene"));

  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v7, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v46;
LABEL_5:
    v14 = 0;
    v15 = v12;
    while (1)
    {
      if (*(_QWORD *)v46 != v13)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v14);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v12 = v16;
      if ((isKindOfClass & 1) == 0)
        break;

      ++v14;
      v15 = v12;
      if (v11 == v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v11)
          goto LABEL_5;
        v15 = v12;
        v12 = 0;
        break;
      }
    }
  }
  else
  {
    v15 = 0;
    v12 = 0;
  }

  objc_msgSend(v8, "settings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sb_displayConfigurationForSceneManagers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "windowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "targetWindowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if ((objc_msgSend(v20, "isEqual:", v23) & 1) != 0)
        goto LABEL_26;
      -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (id)objc_msgSend(v24, "dismissScene:", self->_inputUIScene);

      v26 = -[SBSystemUISceneDefaultPresenter initWithWindowHostingPresentationOnWindowScene:]([SBSystemUISceneDefaultPresenter alloc], "initWithWindowHostingPresentationOnWindowScene:", v20);
    }
    else
    {
      v44 = v8;
      v29 = v7;
      -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "targetDisplayConfiguration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqual:", v19);

      if ((v32 & 1) != 0)
      {
        v7 = v29;
        v8 = v44;
        goto LABEL_26;
      }
      -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)objc_msgSend(v33, "dismissScene:", self->_inputUIScene);

      v26 = -[SBSystemUISceneDefaultPresenter initWithTargetDisplayConfiguration:]([SBSystemUISceneDefaultPresenter alloc], "initWithTargetDisplayConfiguration:", v19);
      v7 = v29;
      v8 = v44;
    }
    -[SBSystemUISceneController setDefaultPresenter:](self, "setDefaultPresenter:", v26);

  }
  else
  {
    v27 = [SBSystemUISceneDefaultPresenter alloc];
    if (v12)
      v28 = -[SBSystemUISceneDefaultPresenter initWithWindowHostingPresentationOnWindowScene:](v27, "initWithWindowHostingPresentationOnWindowScene:", v20);
    else
      v28 = -[SBSystemUISceneDefaultPresenter initWithTargetDisplayConfiguration:](v27, "initWithTargetDisplayConfiguration:", v19);
    v23 = (void *)v28;
    -[SBSystemUISceneController setDefaultPresenter:](self, "setDefaultPresenter:", v28);
  }
LABEL_26:

  if (v12)
    v35 = v12;
  else
    v35 = v15;
  v36 = v35;
  -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0CB37E8];
  if (v36)
  {
    objc_msgSend(v36, "windowLevel");
    v40 = v39 + 1.1;
  }
  else
  {
    v40 = 1.79769313e308;
  }
  objc_msgSend(v38, "numberWithDouble:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPreferredWindowLevel:", v41);

  SBLogInputUI();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v50 = v7;
    v51 = 2114;
    v52 = v12;
    _os_log_impl(&dword_1D0540000, v42, OS_LOG_TYPE_DEFAULT, "localWindowsGraphForFocusedContextID[%{public}@] targetWindow[%{public}@]", buf, 0x16u);
  }

}

- (id)_currentDisplayConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;

  -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetDisplayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "_sbDisplayConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v6)
    {
      -[FBScene settings](self->_targetScene, "settings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sb_displayConfigurationForSceneManagers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v7 = v6;
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (void)_updateDefaultPresenterForTargetScene:(id)a3 contextID:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *hostingGraphObservationInvalidatable;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInputUISceneController.m"), 353, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetScene"));

    if ((_DWORD)v4)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  if (!(_DWORD)v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0CEA940], "sceneHostingGraph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[BSInvalidatable invalidate](self->_hostingGraphObservationInvalidatable, "invalidate");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__SBInputUISceneController__updateDefaultPresenterForTargetScene_contextID___block_invoke;
  v13[3] = &unk_1E8EA3DC0;
  objc_copyWeak(&v15, &location);
  v14 = v7;
  objc_msgSend(v8, "observeLocalWindowGraphHostingContextID:withHandler:", v4, v13);
  v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  hostingGraphObservationInvalidatable = self->_hostingGraphObservationInvalidatable;
  self->_hostingGraphObservationInvalidatable = v9;

  objc_msgSend(v8, "localWindowGraphHostingContextID:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

LABEL_6:
  -[SBInputUISceneController _setupDefaultPresentationForTargetHostingGraph:targetScene:](self, "_setupDefaultPresentationForTargetHostingGraph:targetScene:", v11, v7);
  -[SBSystemUISceneController _setNeedsPresentersEvaluation](self, "_setNeedsPresentersEvaluation");

}

- (id)_targetSceneForKeyboardFocusContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBKeyboardFocusVisibilityGraphNavigator *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  objc_msgSend(v4, "sceneIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__10;
    v18 = __Block_byref_object_dispose__10;
    objc_msgSend(v5, "stringRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBInputUISceneController _targetSceneForFocusedSceneTokenString:](self, "_targetSceneForFocusedSceneTokenString:", v7);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15[5];
    if (!v8)
    {
      v9 = objc_alloc_init(SBKeyboardFocusVisibilityGraphNavigator);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__SBInputUISceneController__targetSceneForKeyboardFocusContext___block_invoke;
      v13[3] = &unk_1E8EA3D48;
      v13[4] = self;
      v13[5] = &v14;
      -[SBKeyboardFocusVisibilityGraphNavigator reverseEnumerateChainContainingSceneIdentityToken:block:](v9, "reverseEnumerateChainContainingSceneIdentityToken:block:", v6, v13);

      v8 = (void *)v15[5];
      if (!v8)
      {
        SBLogInputUI();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[SBInputUISceneController _targetSceneForKeyboardFocusContext:].cold.1((uint64_t)v4, v10);

        v8 = (void *)v15[5];
      }
    }
    v11 = v8;
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_targetSceneForFocusedSceneTokenString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneFromIdentityTokenStringRepresentation:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sceneFromIdentityTokenStringRepresentation:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend((id)SBApp, "windowSceneManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "connectedWindowScenes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v8;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v9)
        {
          v10 = v9;
          v5 = 0;
          v11 = *(_QWORD *)v25;
          do
          {
            v12 = 0;
            v13 = v5;
            do
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
              +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "_fbsDisplayIdentity");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "sceneManagerForDisplayIdentity:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "externalForegroundApplicationSceneHandles");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              v22[0] = MEMORY[0x1E0C809B0];
              v22[1] = 3221225472;
              v22[2] = __67__SBInputUISceneController__targetSceneForFocusedSceneTokenString___block_invoke;
              v22[3] = &unk_1E8EA3D98;
              v23 = v3;
              objc_msgSend(v18, "bs_firstObjectPassingTest:", v22);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "sceneIfExists");
              v5 = (void *)objc_claimAutoreleasedReturnValue();

              ++v12;
              v13 = v5;
            }
            while (v10 != v12);
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v10);
        }
        else
        {
          v5 = 0;
        }

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_evaluateAvailablePresenters:(id)a3 forSceneControllers:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  SBInputUISceneController *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  FBSSceneIdentityToken *v25;
  FBSSceneIdentityToken *v26;
  void *v27;
  int v28;
  FBSSceneIdentityToken *lastExternallyPresentedSceneToken;
  id v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_targetScene)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v9)
    {
      v10 = v9;
      v30 = v7;
      v31 = v6;
      v11 = 0;
      v12 = *(_QWORD *)v34;
      do
      {
        v13 = v8;
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v13);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v15, "parentSceneIdentityToken");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = self;
          -[FBScene identityToken](self->_targetScene, "identityToken");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v16, "isEqual:", v18);

          if (v19)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              if (objc_msgSend(v15, "isVisibleOnScreen"))
                v20 = v15;
              else
                v20 = v11;
              v21 = v20;

              v11 = v21;
            }
            self = v17;
            objc_msgSend(v32, "addObject:", v15);
          }
          else
          {
            self = v17;
          }
        }
        v8 = v13;
        v10 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v10);

      v7 = v30;
      v6 = v31;
      if (v11)
      {
        v22 = v11;
        v23 = v22;
        goto LABEL_22;
      }
    }
    else
    {

    }
    objc_msgSend(v32, "lastObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      -[FBScene identityToken](self->_targetScene, "identityToken");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqual:", self->_lastExternallyPresentedSceneToken);

      if (v28)
      {
        objc_storeWeak((id *)&self->_currentExternalPresenter, 0);
        v22 = 0;
        v23 = 0;
      }
      else
      {
        lastExternallyPresentedSceneToken = self->_lastExternallyPresentedSceneToken;
        self->_lastExternallyPresentedSceneToken = 0;

        objc_storeWeak((id *)&self->_currentExternalPresenter, 0);
        -[SBSystemUISceneController defaultPresenter](self, "defaultPresenter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
      }
      goto LABEL_23;
    }
    v23 = (void *)v24;
    v22 = 0;
LABEL_22:
    -[FBScene identityToken](self->_targetScene, "identityToken");
    v25 = (FBSSceneIdentityToken *)objc_claimAutoreleasedReturnValue();
    v26 = self->_lastExternallyPresentedSceneToken;
    self->_lastExternallyPresentedSceneToken = v25;

    objc_storeWeak((id *)&self->_currentExternalPresenter, v23);
LABEL_23:
    -[SBSingleSceneController setPresenter:](self->_sceneController, "setPresenter:", v23);

  }
}

- (id)_currentTraitsPipelineManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInputUISceneController _currentDisplayConfiguration](self, "_currentDisplayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitsPipelineManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_setupInfo
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("class");
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_shouldControlInputUIScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  v7[2] = CFSTR("com.apple.InputUI");
  v6[2] = CFSTR("jobLabel");
  v6[3] = CFSTR("traitsRole");
  v7[3] = CFSTR("SBTraitsParticipantRoleInputUI");
  v7[4] = &unk_1E91D0338;
  v6[4] = CFSTR("vendingStrategy");
  v6[5] = CFSTR("workspaceID");
  v7[5] = CFSTR("com.apple.SpringBoard.SceneWorkspace.InputUI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)_shouldControlInputUIScene
{
  int v2;

  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) != 0
    || (v2 = objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUIForAutoFillOnly")) != 0)
  {
    LOBYTE(v2) = objc_opt_respondsToSelector();
  }
  return v2 & 1;
}

- (SBInputUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8
{
  SBInputUISceneController *v8;
  SBInputUISceneController *v9;
  SBInputUISceneController *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBInputUISceneController;
  v8 = -[SBSystemUISceneController initWithSceneWorkspaceIdentifier:clientProcessIdentity:sceneVendingPolicy:traitsRole:jobLabel:level:](&v12, sel_initWithSceneWorkspaceIdentifier_clientProcessIdentity_sceneVendingPolicy_traitsRole_jobLabel_level_, a3, a4, a5, a6, a7, a8);
  v9 = v8;
  if (v8)
  {
    v11 = v8;
    BSDispatchMain();

  }
  return v9;
}

void __128__SBInputUISceneController_initWithSceneWorkspaceIdentifier_clientProcessIdentity_sceneVendingPolicy_traitsRole_jobLabel_level___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__userSwipedToKillFromSwitcher_, CFSTR("SBUserSwipedToKillRecentAppLayoutNotification"), 0);
  objc_msgSend(*(id *)(a1 + 32), "_createInputUIScene");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBInputUISceneController;
  -[SBSystemUISceneController dealloc](&v4, sel_dealloc);
}

- (void)_createInputUIScene
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  SBSingleSceneController *v7;
  void *v8;
  void *v9;
  void *v10;
  SBSingleSceneController *v11;
  SBSingleSceneController *sceneController;
  FBScene *v13;
  FBScene *inputUIScene;
  id v15;

  BSDispatchQueueAssertMain();
  v15 = objc_alloc_init(MEMORY[0x1E0CEA948]);
  v3 = objc_alloc_init(MEMORY[0x1E0CEA348]);
  objc_msgSend(v15, "setSpecification:", v3);

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SBSystemUISceneController jobLabel](self, "jobLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("SystemUIScene-[%@]"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIdentifier:", v6);

  v7 = [SBSingleSceneController alloc];
  -[SBSystemUISceneController sceneWorkspaceController](self, "sceneWorkspaceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemUISceneController clientProcessIdentity](self, "clientProcessIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemUISceneController traitsRole](self, "traitsRole");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBSingleSceneController initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:](v7, "initWithSceneWorkspaceController:sceneRequestOptions:clientIdentity:traitsRole:level:", v8, v15, v9, v10, 1.79769313e308);
  sceneController = self->_sceneController;
  self->_sceneController = v11;

  -[SBSingleSceneController setShouldActivateForDisplayConfiguration:](self->_sceneController, "setShouldActivateForDisplayConfiguration:", 1);
  -[SBSingleSceneController setShouldForegroundForDisplayConfiguration:](self->_sceneController, "setShouldForegroundForDisplayConfiguration:", 1);
  -[SBSingleSceneController setShouldBeKeptActiveWhileForeground:](self->_sceneController, "setShouldBeKeptActiveWhileForeground:", 1);
  -[SBSingleSceneController scene](self->_sceneController, "scene");
  v13 = (FBScene *)objc_claimAutoreleasedReturnValue();
  inputUIScene = self->_inputUIScene;
  self->_inputUIScene = v13;

}

- (BOOL)isVisibleForSpringBoard
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBScene clientHandle](self->_targetScene, "clientHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v3);

  return v6;
}

- (UIWindow)hostingWindow
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class();
  -[SBSingleSceneController presenter](self->_sceneController, "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSingleSceneController scene](self->_sceneController, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostingWindowForScene:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v7;
}

- (void)terminateWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  intptr_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v4 = a3;
  -[SBSystemUISceneController clientProcessIdentity](self, "clientProcessIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstanceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processForIdentity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isRunning"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", v4);
    objc_msgSend(v8, "setReportType:", 0);
    objc_msgSend(v8, "setExceptionDomain:", 10);
    objc_msgSend(v8, "setExceptionCode:", 439025681);
    objc_msgSend(v8, "setMaximumTerminationResistance:", 50);
    LODWORD(v9) = BSPthreadCurrentEffectiveQualityOfService();
    if (v9 <= 0x19)
      v9 = 25;
    else
      v9 = v9;
    dispatch_get_global_queue(v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SBInputUISceneController_terminateWithReason___block_invoke;
    block[3] = &unk_1E8E9E270;
    v13 = v5;
    v14 = v8;
    v15 = v4;
    v11 = v8;
    dispatch_async(v10, block);

  }
}

void __48__SBInputUISceneController_terminateWithReason___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentity:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithPredicate:context:", v2, a1[5]);
  v9 = 0;
  v4 = objc_msgSend(v3, "execute:", &v9);
  v5 = v9;
  SBLogInputUI();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[6];
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ termination succeeded", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __48__SBInputUISceneController_terminateWithReason___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v7);
  }

}

void __50__SBInputUISceneController_focusContextDidChange___block_invoke_48(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(v1 + 200))
  {
    objc_msgSend(*(id *)(v1 + 184), "setKeyboardFocusContext:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setTargetDisplayConfiguration:", 0);
    SBLogInputUI();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "InputUI scene was backgrounded", v4, 2u);
    }

  }
}

void __64__SBInputUISceneController__targetSceneForKeyboardFocusContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "_targetSceneForFocusedSceneTokenString:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

BOOL __67__SBInputUISceneController__targetSceneForFocusedSceneTokenString___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a2, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SBInputUISceneController__targetSceneForFocusedSceneTokenString___block_invoke_2;
  v9[3] = &unk_1E8EA3D70;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

uint64_t __67__SBInputUISceneController__targetSceneForFocusedSceneTokenString___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  if (objc_msgSend(v2, "isKeyboardProxyLayer"))
  {
    objc_msgSend(v2, "keyboardOwner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BSEqualObjects();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __76__SBInputUISceneController__updateDefaultPresenterForTargetScene_contextID___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a2)
  {
    v3 = (id *)(a1 + 40);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "_setupDefaultPresentationForTargetHostingGraph:targetScene:", v4, *(_QWORD *)(a1 + 32));

    objc_msgSend(WeakRetained, "_setNeedsPresentersEvaluation");
  }
}

- (void)_userSwipedToKillFromSwitcher:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  -[SBSystemUISceneController clientProcessIdentity](self, "clientProcessIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstanceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processForIdentity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isRunning"))
  {
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x1E0DAC568];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__SBInputUISceneController__userSwipedToKillFromSwitcher___block_invoke;
    v14[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "userSwipedToKillActionWithTimeoutHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogInputUI();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Sending SBSUIUserSwipedToKillAction", v13, 2u);
    }

    objc_msgSend(v7, "workspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendActions:", v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __58__SBInputUISceneController__userSwipedToKillFromSwitcher___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "terminateWithReason:", CFSTR("SBSUIUserSwipedToKillAction InputUI timeout"));

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBInputUISceneController;
  -[SBSystemUISceneController descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_sceneController, CFSTR("InputUI Scene Controller"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingGraphObservationInvalidatable, 0);
  objc_destroyWeak((id *)&self->_currentExternalPresenter);
  objc_storeStrong((id *)&self->_currentTraitsPipelineManager, 0);
  objc_storeStrong((id *)&self->_focusContext, 0);
  objc_storeStrong((id *)&self->_lastExternallyPresentedSceneToken, 0);
  objc_storeStrong((id *)&self->_targetScene, 0);
  objc_storeStrong((id *)&self->_inputUIScene, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
}

void __48__SBInputUISceneController_terminateWithReason___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "%{public}@ termination failed with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_targetSceneForKeyboardFocusContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Couldn't find a target scene for focused context: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
