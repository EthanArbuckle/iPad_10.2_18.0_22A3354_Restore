@implementation SBOverlayUISceneController

+ (id)_setupInfo
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("class");
  v4[0] = objc_opt_class();
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[1] = CFSTR("enabled");
  v3[2] = CFSTR("jobLabel");
  v4[2] = CFSTR("com.apple.UIKit.OverlayUI");
  v4[3] = CFSTR("SBTraitsParticipantRoleOverlayUI");
  v3[3] = CFSTR("traitsRole");
  v3[4] = CFSTR("workspaceID");
  v4[4] = CFSTR("com.apple.SpringBoard.SceneWorkspace.OverlayUI");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)windowSceneDidConnect:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  SBSingleSceneController *v8;
  SBSingleSceneController *subterraneanSceneController;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBOverlayUISceneController;
  v4 = a3;
  -[SBSystemUISceneController windowSceneDidConnect:](&v10, sel_windowSceneDidConnect_, v4);
  v5 = objc_alloc_init(MEMORY[0x1E0CEA948]);
  v6 = objc_alloc_init(MEMORY[0x1E0CEA348]);
  objc_msgSend(v5, "setSpecification:", v6, v10.receiver, v10.super_class);

  -[SBOverlayUISceneController _subterraneanSceneIdentifierForWindowScene:](self, "_subterraneanSceneIdentifierForWindowScene:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v7);

  v8 = -[SBSystemUISceneController _newSceneControllerForWindowScene:sceneRequestOptions:traitsRole:level:](self, "_newSceneControllerForWindowScene:sceneRequestOptions:traitsRole:level:", v4, v5, CFSTR("SBTraitsParticipantRoleSubterraneanOverlayUI"), *MEMORY[0x1E0CEBE28] + -3.0 + -1.0);
  subterraneanSceneController = self->_subterraneanSceneController;
  self->_subterraneanSceneController = v8;

}

- (BOOL)_isAllowedToRecreateSceneOnConnectingWindowScene:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("Subterranean")) ^ 1;

  return v4;
}

- (id)_subterraneanSceneIdentifierForWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SBSystemUISceneController sceneWorkspaceController](self, "sceneWorkspaceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneWorkspaceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "_fbsDisplayIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("SUIS-%@:[%@] - Subterranean"), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subterraneanSceneController, 0);
}

@end
