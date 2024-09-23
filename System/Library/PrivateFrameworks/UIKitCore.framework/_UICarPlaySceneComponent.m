@implementation _UICarPlaySceneComponent

- (_UICarPlaySceneComponent)initWithScene:(id)a3
{
  id v4;
  _UICarPlaySceneComponent *v5;
  _UICarPlaySceneComponent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UICarPlaySceneComponent;
  v5 = -[_UICarPlaySceneComponent init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    -[_UICarPlaySceneComponent _invalidateTraitOverrides](v6, "_invalidateTraitOverrides");
  }

  return v6;
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UITraitCollection)_traitOverrides
{
  void *v2;
  void *v3;

  if (-[_UICarPlaySceneComponent blackWallpaperModeEnabled](self, "blackWallpaperModeEnabled"))
  {
    objc_opt_self();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection traitCollectionWithNSIntegerValue:forTrait:](UITraitCollection, "traitCollectionWithNSIntegerValue:forTrait:", 1, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (UITraitCollection *)v3;
}

- (void)_invalidateTraitOverrides
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(WeakRetained, "_componentDidUpdateTraitOverrides:", self);

}

- (UICarPlayApplicationSceneSettings)carPlaySceneSettings
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "_FBSScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return (UICarPlayApplicationSceneSettings *)v8;
}

- (BOOL)disableFiveRowKeyboards
{
  void *v2;
  char v3;

  -[_UICarPlaySceneComponent carPlaySceneSettings](self, "carPlaySceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableFiveRowKeyboards");

  return v3;
}

- (BOOL)blackWallpaperModeEnabled
{
  void *v2;
  char v3;

  -[_UICarPlaySceneComponent carPlaySceneSettings](self, "carPlaySceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blackWallpaperModeEnabled");

  return v3;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
