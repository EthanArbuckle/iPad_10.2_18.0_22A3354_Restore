@implementation _UISceneRenderingEnvironmentClientComponent

- (NSString)systemDisplayIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemDisplayIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isCapturingContentForAdditionalRenderingDestination
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "modern_isCapturingContentForAdditionalRenderingDestination");

  return v4;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  BSInvalidatable *screenCapturingAssertion;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BSInvalidatable *v28;
  BSInvalidatable *v29;
  void *v30;
  id v31;

  v31 = a4;
  objc_msgSend(v31, "settingsDiff");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsProperty:", sel_modern_isCapturingContentForAdditionalRenderingDestination);

  objc_msgSend(v31, "settingsDiff");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsProperty:", sel_displayConfiguration);

  if ((v7 & 1) != 0 || v9)
  {
    objc_msgSend(v31, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[_UISceneRenderingEnvironmentClientComponent isCapturingContentForAdditionalRenderingDestination](self, "isCapturingContentForAdditionalRenderingDestination");
    if (v9)
    {
      objc_msgSend(v31, "previousSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "displayConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v13;
      v20 = v18;
      v21 = v20;
      if (v19 == v20)
      {
        v22 = 0;
      }
      else
      {
        v22 = 1;
        if (v19 && v20)
          v22 = objc_msgSend(v19, "isEqual:", v20) ^ 1;
      }

    }
    else
    {
      v22 = 0;
    }
    if (v22 || ((v7 ^ 1 | v14) & 1) == 0)
    {
      -[BSInvalidatable invalidate](self->_screenCapturingAssertion, "invalidate");
      screenCapturingAssertion = self->_screenCapturingAssertion;
      self->_screenCapturingAssertion = 0;

    }
    if ((v14 & (v22 | v7)) == 1)
    {
      if (self->_screenCapturingAssertion)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneRenderingEnvironmentClientComponent.m"), 65, CFSTR("Unable to take another screen capturing assertion while currently holding one: %@"), self->_screenCapturingAssertion);

      }
      v24 = (void *)MEMORY[0x1E0CB3940];
      -[FBSSceneComponent clientScene](self, "clientScene");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identityToken");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("capturing scene %@"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIScreen _capturingAssertionForReason:]((id *)v13, v27);
      v28 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v29 = self->_screenCapturingAssertion;
      self->_screenCapturingAssertion = v28;

    }
  }

}

- (void)sceneWillInvalidate:(id)a3
{
  BSInvalidatable *screenCapturingAssertion;

  -[BSInvalidatable invalidate](self->_screenCapturingAssertion, "invalidate", a3);
  screenCapturingAssertion = self->_screenCapturingAssertion;
  self->_screenCapturingAssertion = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenCapturingAssertion, 0);
}

@end
