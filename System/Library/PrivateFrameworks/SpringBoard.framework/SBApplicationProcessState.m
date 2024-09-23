@implementation SBApplicationProcessState

- (BOOL)isForeground
{
  return -[FBProcessState isForeground](self->_processState, "isForeground");
}

- (int)pid
{
  return -[FBProcessState pid](self->_processState, "pid");
}

- (BOOL)isRunning
{
  return -[FBProcessState isRunning](self->_processState, "isRunning");
}

- (NSString)description
{
  return (NSString *)-[SBApplicationProcessState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBApplicationProcessState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_initWithProcess:(id)a3 stateSnapshot:(id)a4
{
  id v7;
  id v8;
  SBApplicationProcessState *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBApplicationProcessState;
  v9 = -[SBApplicationProcessState init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_process, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", -[SBApplicationProcessState pid](self, "pid"), CFSTR("pid"));
  -[SBApplicationProcessState taskState](self, "taskState");
  NSStringFromFBProcessTaskState();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("taskState"));

  -[SBApplicationProcessState visibility](self, "visibility");
  NSStringFromFBProcessVisibility();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("visibility"));

  return v3;
}

- (int64_t)visibility
{
  return -[FBProcessState visibility](self->_processState, "visibility");
}

- (int64_t)taskState
{
  return -[FBProcessState taskState](self->_processState, "taskState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processState, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (BOOL)isBeingDebugged
{
  FBApplicationProcess *v2;
  char v3;

  v2 = self->_process;
  if (-[FBApplicationProcess isApplicationProcess](v2, "isApplicationProcess"))
    v3 = -[FBApplicationProcess isBeingDebugged](v2, "isBeingDebugged");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SBApplicationProcessState *v4;
  char v5;

  v4 = (SBApplicationProcessState *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[FBProcessState isEqual:](self->_processState, "isEqual:", v4->_processState);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[FBProcessState hash](self->_processState, "hash");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBApplicationProcessState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
