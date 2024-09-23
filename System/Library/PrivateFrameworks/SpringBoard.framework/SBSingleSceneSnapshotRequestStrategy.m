@implementation SBSingleSceneSnapshotRequestStrategy

- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBSceneSnapshotRequest *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestStrategy.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSnapshotRequestStrategy.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

LABEL_3:
  if (objc_msgSend(v10, "isUISubclass"))
  {
    v12 = -[SBSceneSnapshotRequest initWithSize:orientation:userInterfaceStyle:]([SBSceneSnapshotRequest alloc], "initWithSize:orientation:userInterfaceStyle:", 0, 0, 0);
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

@end
