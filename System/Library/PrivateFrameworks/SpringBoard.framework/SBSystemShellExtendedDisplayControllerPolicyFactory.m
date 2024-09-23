@implementation SBSystemShellExtendedDisplayControllerPolicyFactory

- (SBSystemShellExtendedDisplayControllerPolicyFactory)initWithExternalDisplayService:(id)a3 externalDisplayDefaults:(id)a4 appSwitcherDefaults:(id)a5 mousePointerManager:(id)a6 runtimeAvailabilitySettings:(id)a7 sceneManager:(id)a8 windowSceneManager:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SBSystemShellExtendedDisplayControllerPolicyFactory *v21;
  SBSystemShellExtendedDisplayControllerPolicyFactory *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  id v32;
  id v33;
  id v34;
  objc_super v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  obj = a6;
  v18 = a6;
  v32 = a7;
  v19 = a7;
  v33 = a8;
  v34 = a8;
  v20 = a9;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicyFactory.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalDisplayService"));

    if (v16)
    {
LABEL_3:
      if (v17)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicyFactory.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalDisplayDefaults"));

  if (v17)
  {
LABEL_4:
    if (v18)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicyFactory.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appSwitcherDefaults"));

  if (v18)
  {
LABEL_5:
    if (v19)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicyFactory.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runtimeAvailabilitySettings"));

    if (v20)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicyFactory.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mousePointerManager"));

  if (!v19)
    goto LABEL_14;
LABEL_6:
  if (v20)
    goto LABEL_7;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicyFactory.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowSceneManager"));

LABEL_7:
  v36.receiver = self;
  v36.super_class = (Class)SBSystemShellExtendedDisplayControllerPolicyFactory;
  v21 = -[SBSystemShellExtendedDisplayControllerPolicyFactory init](&v36, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_externalDisplayService, a3);
    objc_storeStrong((id *)&v22->_externalDisplayDefaults, a4);
    objc_storeStrong((id *)&v22->_appSwitcherDefaults, a5);
    objc_storeStrong((id *)&v22->_mousePointerManager, obj);
    objc_storeStrong((id *)&v22->_runtimeAvailabilitySettings, v32);
    objc_storeStrong((id *)&v22->_sceneManager, v33);
    objc_storeStrong((id *)&v22->_windowSceneManager, a9);
  }

  return v22;
}

- (id)policyForConnectingDisplay:(id)a3
{
  return -[SBSystemShellExtendedDisplayControllerPolicy initWithExternalDisplayDefaults:appSwitcherDefaults:externalDisplayService:mousePointerManager:runtimeAvailabilitySettings:sceneManager:windowSceneManager:]([SBSystemShellExtendedDisplayControllerPolicy alloc], "initWithExternalDisplayDefaults:appSwitcherDefaults:externalDisplayService:mousePointerManager:runtimeAvailabilitySettings:sceneManager:windowSceneManager:", self->_externalDisplayDefaults, self->_appSwitcherDefaults, self->_externalDisplayService, self->_mousePointerManager, self->_runtimeAvailabilitySettings, self->_sceneManager, self->_windowSceneManager);
}

- (void)transformDisplayConfiguration:(id)a3 forControllersWithBuilder:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "setUniqueIdentifier:", CFSTR("com.apple.springboard.shellui"));
  objc_msgSend(v4, "setUIKitMainLike");
  objc_msgSend(v4, "setCloningSupported:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_runtimeAvailabilitySettings, 0);
  objc_storeStrong((id *)&self->_mousePointerManager, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_externalDisplayDefaults, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
}

@end
