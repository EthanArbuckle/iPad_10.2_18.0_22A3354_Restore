@implementation _UIMutableCanvasDefinition

- (_UIMutableCanvasDefinition)initWithRepresentation:(id)a3
{
  id v5;
  id *v6;
  _UIMutableCanvasDefinition *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIMutableCanvasDefinition;
  v6 = -[UISceneSession _init](&v9, sel__init);
  v7 = (_UIMutableCanvasDefinition *)v6;
  if (v6)
    objc_storeStrong(v6 + 8, a3);

  return v7;
}

- (void)setCanvasSubclass:(Class)a3
{
  id v5;

  -[UISceneSession configuration](self->_sceneSession, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSceneClass:", a3);
  -[UISceneSession _updateConfiguration:](self->_sceneSession, "_updateConfiguration:", v5);

}

- (void)setDelegateClass:(Class)a3
{
  id v5;

  -[UISceneSession configuration](self->_sceneSession, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegateClass:", a3);
  -[UISceneSession _updateConfiguration:](self->_sceneSession, "_updateConfiguration:", v5);

}

- (void)setUserInfo:(id)a3
{
  -[UISceneSession setUserInfo:](self->_sceneSession, "setUserInfo:", a3);
}

- (id)representedCanvas
{
  return -[UISceneSession scene](self->_sceneSession, "scene");
}

- (int64_t)systemType
{
  void *v2;
  int64_t v3;

  -[UISceneSession role](self->_sceneSession, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _UICanvasCanvasSystemTypeFromFrameType(v2);

  return v3;
}

- (Class)canvasSubclass
{
  void *v2;
  void *v3;

  -[UISceneSession configuration](self->_sceneSession, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (Class)delegateClass
{
  void *v2;
  void *v3;

  -[UISceneSession configuration](self->_sceneSession, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (id)scene
{
  return -[UISceneSession scene](self->_sceneSession, "scene");
}

- (id)role
{
  return -[UISceneSession role](self->_sceneSession, "role");
}

- (id)configuration
{
  return -[UISceneSession configuration](self->_sceneSession, "configuration");
}

- (id)persistentIdentifier
{
  return -[UISceneSession persistentIdentifier](self->_sceneSession, "persistentIdentifier");
}

- (id)stateRestorationActivity
{
  return -[UISceneSession stateRestorationActivity](self->_sceneSession, "stateRestorationActivity");
}

- (id)userInfo
{
  return -[UISceneSession userInfo](self->_sceneSession, "userInfo");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self->_sceneSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSession, 0);
}

@end
