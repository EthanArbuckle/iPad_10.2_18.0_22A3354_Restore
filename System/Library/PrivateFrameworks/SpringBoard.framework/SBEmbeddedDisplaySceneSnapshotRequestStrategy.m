@implementation SBEmbeddedDisplaySceneSnapshotRequestStrategy

- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  uint64_t v25;
  SBSceneSnapshotRequest *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestStrategy.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

    if (v11)
      goto LABEL_4;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestStrategy.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

  if (!v10)
    goto LABEL_25;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestStrategy.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotRequestContext"));

LABEL_4:
  v12 = objc_msgSend(v11, "sceneDisplayWindowManagementStyle");
  objc_msgSend(v11, "sceneDisplayLayoutStateTransitionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fromLayoutState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sceneDisplayLayoutStateTransitionContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toLayoutState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v9, "application");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isMedusaCapable");

    if ((v18 & 1) != 0)
    {
      v19 = (void *)objc_opt_new();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __112__SBEmbeddedDisplaySceneSnapshotRequestStrategy_snapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke;
      v38[3] = &unk_1E8EBC928;
      v20 = v19;
      v39 = v20;
      v21 = MEMORY[0x1D17E5550](v38);
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))v21;
      if (v12 >= 2)
      {
        if (v12 == 2)
        {
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v21 + 16))(v21, 0, 0);
          v22[2](v22, 1, 1);
          v22[2](v22, 3, 4);
        }
      }
      else
      {
        objc_msgSend(v9, "sceneIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "elementWithIdentifier:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "layoutRole");

        if (v25 == 3)
        {
          v22[2](v22, 5, 4);
        }
        else if (v25 == 4)
        {
          v22[2](v22, 6, 4);
        }
        else
        {
          objc_msgSend(v14, "appLayout");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appLayout");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v36, "allItems");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setWithArray:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)v29;
          LOBYTE(v29) = objc_msgSend((id)v29, "containsAnyItemFromSet:", v32);

          if ((v29 & 1) != 0 || objc_msgSend(v36, "configuration") == 1)
          {
            v22[2](v22, 3, 4);
            v22[2](v22, 4, 0);
          }
          else
          {
            v22[2](v22, 4, 4);
            v22[2](v22, 3, 4);
          }

        }
      }
      v26 = (SBSceneSnapshotRequest *)v20;

      v27 = v26;
    }
    else
    {
      v26 = -[SBSceneSnapshotRequest initWithSize:orientation:userInterfaceStyle:]([SBSceneSnapshotRequest alloc], "initWithSize:orientation:userInterfaceStyle:", 0, 0, 1);
      v40[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    SBLogSceneSnapshots();
    v26 = (SBSceneSnapshotRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v26->super, OS_LOG_TYPE_ERROR))
      -[SBEmbeddedDisplaySceneSnapshotRequestStrategy snapshotRequestsForSceneHandle:settings:snapshotRequestContext:].cold.1((uint64_t)self, v9, &v26->super);
    v27 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v27;
}

void __112__SBEmbeddedDisplaySceneSnapshotRequestStrategy_snapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SBSceneSnapshotRequest *v4;

  v4 = -[SBSceneSnapshotRequest initWithSize:orientation:userInterfaceStyle:]([SBSceneSnapshotRequest alloc], "initWithSize:orientation:userInterfaceStyle:", a2, a3, 1);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (void)snapshotRequestsForSceneHandle:(uint64_t)a1 settings:(void *)a2 snapshotRequestContext:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] ERROR: Need fromLayoutState", (uint8_t *)&v6, 0x16u);

}

@end
