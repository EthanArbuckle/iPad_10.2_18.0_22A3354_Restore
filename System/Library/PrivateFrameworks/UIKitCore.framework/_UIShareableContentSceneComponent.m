@implementation _UIShareableContentSceneComponent

- (id)_actionRespondersForScene:(id)a3
{
  _UIShareableContentSceneActionHandler *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(_UIShareableContentSceneActionHandler);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_UIShareableContentSceneComponent)initWithScene:(id)a3
{
  id v4;
  _UIShareableContentSceneComponent *v5;
  _UIShareableContentSceneComponent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIShareableContentSceneComponent;
  v5 = -[_UIShareableContentSceneComponent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scene, v4);

  return v6;
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
