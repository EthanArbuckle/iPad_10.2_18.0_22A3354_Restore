@implementation _UIEditMenuSceneComponent

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void)dismissCurrentMenu
{
  _UIEditMenuPresentation *activePresentation;

  activePresentation = self->_activePresentation;
  if (activePresentation)
  {
    -[_UIEditMenuPresentation hideMenuWithReason:](activePresentation, "hideMenuWithReason:", 0);
    -[_UIEditMenuSceneComponent removeActivePresentation:](self, "removeActivePresentation:", self->_activePresentation);
  }
  else if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    +[UICalloutBar fadeSharedCalloutBar](UICalloutBar, "fadeSharedCalloutBar");
  }
  else
  {
    +[UICalloutBar hideSharedCalloutBar](UICalloutBar, "hideSharedCalloutBar");
  }
}

+ (id)sceneComponentForView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_editMenuSceneComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_UIEditMenuSceneComponent)initWithScene:(id)a3
{
  id v5;
  _UIEditMenuSceneComponent *v6;
  _UIEditMenuSceneComponent *v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_super v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuSceneComponent.m"), 42, CFSTR("Only UIWindowScene is supported by %@."), v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)_UIEditMenuSceneComponent;
  v6 = -[_UIEditMenuSceneComponent init](&v12, sel_init);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_scene, v5);

  return v7;
}

- (void)setActivePresentation:(id)a3
{
  _UIEditMenuPresentation *v4;
  _UIEditMenuPresentation *activePresentation;
  _UIEditMenuPresentation *v6;

  v4 = (_UIEditMenuPresentation *)a3;
  activePresentation = self->_activePresentation;
  v6 = v4;
  if (activePresentation != v4)
  {
    -[_UIEditMenuPresentation hideMenuWithReason:](activePresentation, "hideMenuWithReason:", 0);
    v6 = self->_activePresentation;
  }
  self->_activePresentation = v4;

}

- (void)removeActivePresentation:(id)a3
{
  _UIEditMenuPresentation *v4;
  _UIEditMenuPresentation *v5;

  v4 = (_UIEditMenuPresentation *)a3;
  if (self->_activePresentation == v4)
  {
    self->_activePresentation = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (BOOL)hasVisibleMenu
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[_UIEditMenuSceneComponent activePresentation](self, "activePresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIEditMenuSceneComponent activePresentation](self, "activePresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayedMenu");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = v5 != 0;

  }
  else
  {
    +[UICalloutBar activeCalloutBar](UICalloutBar, "activeCalloutBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "visible");
  }

  return v6;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (_UIEditMenuPresentation)activePresentation
{
  return self->_activePresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePresentation, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end
