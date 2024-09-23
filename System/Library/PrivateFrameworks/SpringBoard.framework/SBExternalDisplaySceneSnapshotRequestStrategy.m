@implementation SBExternalDisplaySceneSnapshotRequestStrategy

- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestStrategy.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestStrategy.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = (void *)objc_opt_new();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __112__SBExternalDisplaySceneSnapshotRequestStrategy_snapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke;
  v19[3] = &unk_1E8EBC928;
  v13 = v12;
  v20 = v13;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v19);
  v14[2](v14, 0, 0);
  v14[2](v14, 2, 1);
  v14[2](v14, 3, 0);
  v15 = v13;

  return v15;
}

void __112__SBExternalDisplaySceneSnapshotRequestStrategy_snapshotRequestsForSceneHandle_settings_snapshotRequestContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SBSceneSnapshotRequest *v4;

  v4 = -[SBSceneSnapshotRequest initWithSize:orientation:userInterfaceStyle:]([SBSceneSnapshotRequest alloc], "initWithSize:orientation:userInterfaceStyle:", a2, a3, 1);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

@end
