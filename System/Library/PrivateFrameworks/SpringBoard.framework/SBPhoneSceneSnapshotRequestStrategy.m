@implementation SBPhoneSceneSnapshotRequestStrategy

- (id)snapshotRequestsForSceneHandle:(id)a3 settings:(id)a4 snapshotRequestContext:(id)a5
{
  SBSceneSnapshotRequest *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = -[SBSceneSnapshotRequest initWithSize:orientation:userInterfaceStyle:]([SBSceneSnapshotRequest alloc], "initWithSize:orientation:userInterfaceStyle:", 0, 0, 1);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
