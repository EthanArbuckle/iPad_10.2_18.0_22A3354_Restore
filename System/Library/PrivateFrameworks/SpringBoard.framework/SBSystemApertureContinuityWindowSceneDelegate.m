@implementation SBSystemApertureContinuityWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  UIWindowScene *v26;
  UIWindowScene *v27;
  UIWindowScene *windowScene;
  NSString *debugName;
  UIWindowScene *v30;
  UIWindowScene *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  SEL v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  SBLogContinuityDisplay();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "_sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v40 = v8;
    v41 = 2114;
    v42 = v11;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "<%p>:%{public}@ connected", buf, 0x16u);

  }
  objc_msgSend(v8, "_FBSScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "continuitySessionSceneParticipant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "continuitySession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mainWindowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityWindowSceneDelegate.m"), 43, CFSTR("We don't have an main window scene for the session: %@"), v14);

  }
  objc_msgSend(v15, "systemApertureController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityWindowSceneDelegate.m"), 45, CFSTR("Couldn't find the system aperture controller for the continuity display's main scene <%p>"), v15);

  }
  v37 = a2;
  objc_msgSend(v9, "role");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("SBWindowSceneSessionRoleSystemApertureContinuity"));
  v19 = objc_msgSend(v17, "isEqualToString:", CFSTR("SBWindowSceneSessionRoleSystemApertureContinuityCurtain"));
  if (v18)
  {
    v38 = v9;
    v20 = objc_opt_class();
    v21 = v8;
    if (v20)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    v27 = v22;

    if (!v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("SBSystemApertureContinuityWindowSceneDelegate.m"), 52, CFSTR("systemApertureRole's scene is the wrong type %@"), objc_opt_class());

    }
    objc_storeStrong((id *)&self->_systemApertureContinuityWindowScene, v22);
    windowScene = self->_windowScene;
    self->_windowScene = v27;
    v26 = v27;

    debugName = self->_debugName;
    self->_debugName = (NSString *)CFSTR("systemAperture");

    -[UIWindowScene setAssociatedWindowScene:](v26, "setAssociatedWindowScene:", v15);
    objc_msgSend(v14, "noteSystemApertureSceneConnected:", v26);
    objc_msgSend(v16, "highLevelContinuitySystemApertureWindowSceneDidConnect:", v26);
    objc_msgSend(v14, "noteSystemApertureUIIsReady:", v26);
LABEL_26:
    v9 = v38;
    goto LABEL_27;
  }
  if (v19)
  {
    v38 = v9;
    v23 = objc_opt_class();
    v24 = v8;
    if (v23)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
    }
    else
    {
      v25 = 0;
    }
    v30 = v25;

    if (!v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("SBSystemApertureContinuityWindowSceneDelegate.m"), 63, CFSTR("systemApertureCurtainRole's scene is the wrong type %@"), objc_opt_class());

    }
    objc_storeStrong((id *)&self->_systemApertureContinuityCurtainWindowScene, v25);
    v31 = self->_windowScene;
    self->_windowScene = v30;
    v26 = v30;

    v32 = self->_debugName;
    self->_debugName = (NSString *)CFSTR("systemApertureCurtain");

    -[UIWindowScene setAssociatedWindowScene:](v26, "setAssociatedWindowScene:", v15);
    objc_msgSend(v14, "noteSystemApertureCurtainSceneConnected:", v26);
    objc_msgSend(v16, "superHighLevelContinuityCurtainWindowSceneDidConnect:", v26);
    objc_msgSend(v14, "noteSystemApertureCurtainUIIsReady:", v26);
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene handleFailureInMethod:object:file:lineNumber:description:](v26, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("SBSystemApertureContinuityWindowSceneDelegate.m"), 73, CFSTR("unexpected role for SBSystemApertureContinuityWindowSceneDelegate: %@"), v17);
LABEL_27:

}

- (void)sceneDidDisconnect:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  SBSystemApertureContinuityCurtainWindowScene *v9;
  SBSystemApertureContinuityCurtainWindowScene *v10;
  SBSystemApertureContinuityCurtainWindowScene *v11;
  void *v12;
  void *v13;
  void *systemApertureContinuityWindowScene;
  UIWindowScene *windowScene;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogContinuityDisplay();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v19 = v5;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "<%p>:%{public}@ disconnected", buf, 0x16u);

  }
  v8 = objc_opt_class();
  v9 = (SBSystemApertureContinuityCurtainWindowScene *)v5;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  -[SBAccessoryWindowScene associatedWindowScene](v11, "associatedWindowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityWindowSceneDelegate.m"), 82, CFSTR("We don't have an associated window scene for <%p>:%@"), v9, self->_debugName);

  }
  objc_msgSend(v12, "systemApertureController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityWindowSceneDelegate.m"), 85, CFSTR("Couldn't find the system aperture controller for the continuity display's main scene <%p> for scene <%p>:%@"), v12, v9, self->_debugName);

  }
  if ((SBSystemApertureContinuityCurtainWindowScene *)self->_systemApertureContinuityWindowScene == v9)
  {
    objc_msgSend(v13, "highLevelContinuitySystemApertureWindowSceneDidDisconnect:", v9);
    systemApertureContinuityWindowScene = self->_systemApertureContinuityWindowScene;
    self->_systemApertureContinuityWindowScene = 0;
  }
  else if (self->_systemApertureContinuityCurtainWindowScene == v9)
  {
    objc_msgSend(v13, "superHighLevelContinuityCurtainWindowSceneDidDisconnect:", v9);
    systemApertureContinuityWindowScene = self->_systemApertureContinuityCurtainWindowScene;
    self->_systemApertureContinuityCurtainWindowScene = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    systemApertureContinuityWindowScene = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(systemApertureContinuityWindowScene, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityWindowSceneDelegate.m"), 94, CFSTR("What kind of system aperture scene is this??"));
  }

  windowScene = self->_windowScene;
  self->_windowScene = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureContinuityCurtainWindowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureContinuityWindowScene, 0);
}

@end
