@implementation SBSceneLayoutSynchronizeTransitionTransaction

- (SBSceneLayoutSynchronizeTransitionTransaction)initWithDebugName:(id)a3
{
  id v4;
  SBSceneLayoutSynchronizeTransitionTransaction *v5;
  uint64_t v6;
  NSString *debugName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneLayoutSynchronizeTransitionTransaction;
  v5 = -[SBSceneLayoutSynchronizeTransitionTransaction init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    debugName = v5->_debugName;
    v5->_debugName = (NSString *)v6;

    -[SBSceneLayoutSynchronizeTransitionTransaction addMilestone:](v5, "addMilestone:", *MEMORY[0x1E0D22878]);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
}

- (void)synchronize
{
  -[SBSceneLayoutSynchronizeTransitionTransaction satisfyMilestone:](self, "satisfyMilestone:", *MEMORY[0x1E0D22878]);
}

- (SBSceneLayoutSynchronizeTransitionTransaction)init
{
  return -[SBSceneLayoutSynchronizeTransitionTransaction initWithDebugName:](self, "initWithDebugName:", 0);
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (id)_graphNodeDebugName
{
  NSString *debugName;
  objc_super v4;

  debugName = self->_debugName;
  if (debugName)
    return debugName;
  v4.receiver = self;
  v4.super_class = (Class)SBSceneLayoutSynchronizeTransitionTransaction;
  -[SBSceneLayoutSynchronizeTransitionTransaction _graphNodeDebugName](&v4, sel__graphNodeDebugName);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
