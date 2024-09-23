@implementation SBSystemApertureWindowSceneDelegate

- (id)_associatedWindowSceneForScene:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowSceneForDisplayIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  void *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  SBSystemApertureCurtainWindowScene **p_superHighLevelCurtainWindowScene;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(a4, "role");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SBWindowSceneSessionRoleSystemAperture"));
  v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("SBWindowSceneSessionRoleSystemApertureCurtain"));
  v11 = v10;
  if ((v9 & 1) != 0 || (v10 & 1) != 0)
  {
    if (v9)
    {
LABEL_4:
      v12 = objc_opt_class();
      v13 = v25;
      if (v12)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v15 = v14;

      if (!v15)
        goto LABEL_25;
      if (self->_systemApertureWindowScene)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureWindowSceneDelegate.m"), 49, CFSTR("Only support one of these"));

      }
      objc_storeStrong((id *)&self->_systemApertureWindowScene, v14);
      -[SBSystemApertureWindowSceneDelegate _associatedWindowSceneForScene:](self, "_associatedWindowSceneForScene:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAssociatedWindowScene:", v16);
      objc_msgSend(v16, "systemApertureController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "createHighLevelSystemApertureWindowWithWindowScene:", v15);
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureWindowSceneDelegate.m"), 45, CFSTR("unexpected role for SBSystemApertureWindowSceneDelegate"));

    if (v9)
      goto LABEL_4;
  }
  if (v11)
  {
    v19 = objc_opt_class();
    v20 = v25;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v15 = v21;

    if (!v15)
      goto LABEL_25;
    p_superHighLevelCurtainWindowScene = &self->_superHighLevelCurtainWindowScene;
    if (self->_superHighLevelCurtainWindowScene)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureWindowSceneDelegate.m"), 59, CFSTR("Only support one of these"));

      p_superHighLevelCurtainWindowScene = &self->_superHighLevelCurtainWindowScene;
    }
    objc_storeStrong((id *)p_superHighLevelCurtainWindowScene, v21);
    -[SBSystemApertureWindowSceneDelegate _associatedWindowSceneForScene:](self, "_associatedWindowSceneForScene:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAssociatedWindowScene:", v16);
    objc_msgSend(v16, "systemApertureController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createSuperHighLevelCurtainWithWindowScene:", v15);
    goto LABEL_24;
  }
LABEL_26:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superHighLevelCurtainWindowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureWindowScene, 0);
}

@end
