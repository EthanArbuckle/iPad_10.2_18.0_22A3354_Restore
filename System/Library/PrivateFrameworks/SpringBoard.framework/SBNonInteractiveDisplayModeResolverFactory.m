@implementation SBNonInteractiveDisplayModeResolverFactory

- (SBNonInteractiveDisplayModeResolverFactory)initWithApplicationController:(id)a3 userAuthenticationProvider:(id)a4 monitoredWindowScene:(id)a5
{
  id v10;
  id v11;
  id v12;
  SBNonInteractiveDisplayModeResolverFactory *v13;
  SBNonInteractiveDisplayModeResolverFactory *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayModeResolverFactory.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userAuthenticationProvider"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayModeResolverFactory.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationController"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayModeResolverFactory.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("monitoredWindowScene"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)SBNonInteractiveDisplayModeResolverFactory;
  v13 = -[SBNonInteractiveDisplayModeResolverFactory init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_applicationController, a3);
    objc_storeStrong((id *)&v14->_userAuthenticationProvider, a4);
    objc_storeStrong((id *)&v14->_monitoredWindowScene, a5);
  }

  return v14;
}

- (int64_t)displayWindowingMode
{
  return 2;
}

- (id)resolverForPhysicalDisplay:(id)a3
{
  void *v5;
  SBNonInteractiveDisplayModeResolver *v6;
  void *v8;

  objc_msgSend(a3, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayModeResolverFactory.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootDisplayIdentity isRootIdentity]"));

  }
  if (objc_msgSend(v5, "sb_physicalDisplaySupportingNonInteractiveDisplayMode"))
    v6 = -[SBNonInteractiveDisplayModeResolver initWithRootDisplay:applicationController:userAuthenticationProvider:monitoredWindowScene:]([SBNonInteractiveDisplayModeResolver alloc], "initWithRootDisplay:applicationController:userAuthenticationProvider:monitoredWindowScene:", v5, self->_applicationController, self->_userAuthenticationProvider, self->_monitoredWindowScene);
  else
    v6 = 0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredWindowScene, 0);
  objc_storeStrong((id *)&self->_userAuthenticationProvider, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
}

@end
