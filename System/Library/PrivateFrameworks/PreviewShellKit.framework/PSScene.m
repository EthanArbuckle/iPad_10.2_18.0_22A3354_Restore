@implementation PSScene

- (PSScene)initWithScene:(id)a3
{
  id v5;
  PSScene *v6;
  PSScene *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSScene;
  v6 = -[PSScene init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scene, a3);

  return v7;
}

- (NSString)sceneIdentifier
{
  return (NSString *)-[FBScene identifier](self->_scene, "identifier");
}

- (PSSceneSettings)sceneSettings
{
  void *v2;
  uint64_t v3;
  PSSceneSettings *v4;

  -[FBScene settings](self->_scene, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE78880]), "initWithSettings:", v2);

    v2 = (void *)v3;
  }
  v4 = -[PSSceneSettings initWithSettings:]([PSSceneSettings alloc], "initWithSettings:", v2);

  return v4;
}

- (void)updateSceneSettings:(id)a3 with:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "copyResettingInterruptionPolicy");

  -[FBScene updateSettings:withTransitionContext:](self->_scene, "updateSettings:withTransitionContext:", v8, v6);
}

- (FBScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
