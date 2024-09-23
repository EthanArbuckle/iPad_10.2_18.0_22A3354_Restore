@implementation SBSUIHomeScreenIconStyleSceneClientComponent

- (void)setScene:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBSUIHomeScreenIconStyleSceneClientComponent;
  -[FBSSceneComponent setScene:](&v6, sel_setScene_, v4);
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE7D26A8))
    -[SBSUIHomeScreenIconStyleSceneClientComponent updateStyleTraitForSettings:inScene:](self, "updateStyleTraitForSettings:inScene:", v5, v4);

}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "settingsDiff");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsProperty:", sel_iconStyleConfiguration);

  if (v8)
  {
    objc_msgSend(v6, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIHomeScreenIconStyleSceneClientComponent updateStyleTraitForSettings:inScene:](self, "updateStyleTraitForSettings:inScene:", v9, v10);

  }
}

- (void)updateStyleTraitForSettings:(id)a3 inScene:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  objc_msgSend(a3, "iconStyleConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAC20], "_sceneForFBSScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "traitOverrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v7, "setObject:forTrait:", v9, v8);
  else
    objc_msgSend(v7, "removeTrait:", v8);

}

@end
