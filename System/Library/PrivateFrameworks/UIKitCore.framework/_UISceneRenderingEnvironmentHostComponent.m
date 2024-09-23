@implementation _UISceneRenderingEnvironmentHostComponent

- (void)setScene:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISceneRenderingEnvironmentHostComponent;
  -[FBSSceneComponent setScene:](&v4, sel_setScene_, a3);
  -[_UISceneRenderingEnvironmentHostComponent setIsCapturingContentForAdditionalRenderingDestination:](self, "setIsCapturingContentForAdditionalRenderingDestination:", 0);
  -[_UISceneRenderingEnvironmentHostComponent setSystemDisplayIdentifier:](self, "setSystemDisplayIdentifier:", 0);
}

- (void)setIsCapturingContentForAdditionalRenderingDestination:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100___UISceneRenderingEnvironmentHostComponent_setIsCapturingContentForAdditionalRenderingDestination___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  v6 = a3;
  objc_msgSend(v4, "updateSettings:", v5);

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

- (void)setSystemDisplayIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72___UISceneRenderingEnvironmentHostComponent_setSystemDisplayIdentifier___block_invoke;
  v7[3] = &unk_1E16E05B8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateSettings:", v7);

}

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

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  objc_msgSend(v9, "settingsDiff");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsProperty:", sel_isCapturingContentForAdditionalRenderingDestination);

  if (v6)
  {
    objc_msgSend(v9, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCapturingContentForAdditionalRenderingDestination");

    -[_UISceneRenderingEnvironmentHostComponent setIsCapturingContentForAdditionalRenderingDestination:](self, "setIsCapturingContentForAdditionalRenderingDestination:", v8);
  }

}

@end
