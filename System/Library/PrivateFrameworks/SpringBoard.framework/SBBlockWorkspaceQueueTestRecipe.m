@implementation SBBlockWorkspaceQueueTestRecipe

- (id)title
{
  return CFSTR("Block workspace queue for 2 seconds");
}

- (void)handleVolumeIncrease
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D229C0]), "initWithReason:", CFSTR("Test Recipe"));
  -[SBBlockWorkspaceQueueTestRecipe queueLock](self, "queueLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relinquish");

  -[SBBlockWorkspaceQueueTestRecipe setQueueLock:](self, "setQueueLock:", v6);
  -[SBBlockWorkspaceQueueTestRecipe blockTimer](self, "blockTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_blockTimerDidFire_, 0, 0, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBlockWorkspaceQueueTestRecipe setBlockTimer:](self, "setBlockTimer:", v5);

}

- (void)blockTimerDidFire:(id)a3
{
  void *v4;
  void *v5;

  -[SBBlockWorkspaceQueueTestRecipe queueLock](self, "queueLock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relinquish");

  -[SBBlockWorkspaceQueueTestRecipe setQueueLock:](self, "setQueueLock:", 0);
  -[SBBlockWorkspaceQueueTestRecipe blockTimer](self, "blockTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[SBBlockWorkspaceQueueTestRecipe setBlockTimer:](self, "setBlockTimer:", 0);
}

- (void)handleVolumeDecrease
{
  id v2;

  -[SBBlockWorkspaceQueueTestRecipe blockTimer](self, "blockTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fire");

}

- (NSTimer)blockTimer
{
  return self->_blockTimer;
}

- (void)setBlockTimer:(id)a3
{
  objc_storeStrong((id *)&self->_blockTimer, a3);
}

- (FBWorkspaceEventQueueLock)queueLock
{
  return self->_queueLock;
}

- (void)setQueueLock:(id)a3
{
  objc_storeStrong((id *)&self->_queueLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueLock, 0);
  objc_storeStrong((id *)&self->_blockTimer, 0);
}

@end
