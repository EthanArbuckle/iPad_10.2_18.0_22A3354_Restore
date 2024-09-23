@implementation _UIFBSSceneSubstrate

- (void)attachContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_sceneLayerTable, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23098]), "initWithCAContext:", v6);
    -[NSMapTable setObject:forKey:](self->_sceneLayerTable, "setObject:forKey:", v4, v6);
  }
  -[_UIContextBinderSubstrate scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachLayer:", v4);

}

- (void)detachContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMapTable objectForKey:](self->_sceneLayerTable, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIContextBinderSubstrate scene](self, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detachLayer:", v4);

    -[NSMapTable removeObjectForKey:](self->_sceneLayerTable, "removeObjectForKey:", v6);
  }

}

- (_UIFBSSceneSubstrate)initWithScene:(id)a3
{
  _UIFBSSceneSubstrate *v3;
  uint64_t v4;
  NSMapTable *sceneLayerTable;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFBSSceneSubstrate;
  v3 = -[_UIContextBinderSubstrate initWithScene:](&v7, sel_initWithScene_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    sceneLayerTable = v3->_sceneLayerTable;
    v3->_sceneLayerTable = (NSMapTable *)v4;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneLayerTable, 0);
}

@end
