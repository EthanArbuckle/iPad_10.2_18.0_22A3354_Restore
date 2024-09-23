@implementation SBNonInteractiveDisplayControllerPolicyFactory

- (SBNonInteractiveDisplayControllerPolicyFactory)initWithFBSceneManager:(id)a3 monitoredWindowScene:(id)a4 applicationController:(id)a5
{
  id v10;
  id v11;
  id v12;
  SBNonInteractiveDisplayControllerPolicyFactory *v13;
  SBNonInteractiveDisplayControllerPolicyFactory *v14;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicyFactory.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("monitoredWindowScene"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicyFactory.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbSceneManager"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicyFactory.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationController"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)SBNonInteractiveDisplayControllerPolicyFactory;
  v13 = -[SBNonInteractiveDisplayControllerPolicyFactory init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fbSceneManager, a3);
    objc_storeStrong((id *)&v14->_monitoredWindowScene, a4);
    objc_storeStrong((id *)&v14->_applicationController, a5);
  }

  return v14;
}

- (id)policyForConnectingDisplay:(id)a3
{
  return -[SBNonInteractiveDisplayControllerPolicy initWithFBSceneManager:monitoredWindowScene:applicationController:]([SBNonInteractiveDisplayControllerPolicy alloc], "initWithFBSceneManager:monitoredWindowScene:applicationController:", self->_fbSceneManager, self->_monitoredWindowScene, self->_applicationController);
}

- (void)transformDisplayConfiguration:(id)a3 forControllersWithBuilder:(id)a4
{
  void *v5;
  int v6;
  const __CFString *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRestrictedAirPlayDisplay");

  if (v6)
    v7 = CFSTR("com.apple.springboard.noninteractive.PA2D");
  else
    v7 = CFSTR("com.apple.springboard.noninteractive");
  objc_msgSend(v8, "setUniqueIdentifier:", v7);
  objc_msgSend(v8, "setCloningSupported:", v6 ^ 1u);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_monitoredWindowScene, 0);
  objc_storeStrong((id *)&self->_fbSceneManager, 0);
}

@end
