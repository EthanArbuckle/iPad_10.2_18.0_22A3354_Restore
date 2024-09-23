@implementation SBSystemShellExtendedDisplayResolver

- (SBSystemShellExtendedDisplayResolver)initWithRootDisplay:(id)a3
{
  id v6;
  SBSystemShellExtendedDisplayResolver *v7;
  SBSystemShellExtendedDisplayResolver *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if ((objc_msgSend(v6, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayResolver.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootDisplayIdentity isRootIdentity]"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBSystemShellExtendedDisplayResolver;
  v7 = -[SBSystemShellExtendedDisplayResolver init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_rootDisplayIdentity, a3);

  return v8;
}

- (FBSDisplayIdentity)rootDisplayIdentity
{
  return self->_rootDisplayIdentity;
}

- (int64_t)displayWindowingMode
{
  return 1;
}

- (BOOL)isWindowingModeAvailable
{
  return 1;
}

- (SBDisplayWindowingModeResolverDelegate)delegate
{
  return (SBDisplayWindowingModeResolverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootDisplayIdentity, 0);
}

@end
