@implementation CoverSheetSceneAssociation

- (CoverSheetSceneAssociation)initWithMapsScene:(id)a3
{
  id v5;
  CoverSheetSceneAssociation *v6;
  CoverSheetSceneAssociation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CoverSheetSceneAssociation;
  v6 = -[CoverSheetSceneAssociation init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapsScene, a3);

  return v7;
}

- (UIScene)mapsScene
{
  return self->_mapsScene;
}

- (UIScene)lockScreenScene
{
  return self->_lockScreenScene;
}

- (void)setLockScreenScene:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenScene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenScene, 0);
  objc_storeStrong((id *)&self->_mapsScene, 0);
}

@end
