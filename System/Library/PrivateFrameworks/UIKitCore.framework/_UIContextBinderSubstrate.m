@implementation _UIContextBinderSubstrate

- (FBSScene)scene
{
  return self->_scene;
}

- (_UIContextBinderSubstrate)initWithScene:(id)a3
{
  id v5;
  _UIContextBinderSubstrate *v6;
  _UIContextBinderSubstrate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextBinderSubstrate;
  v6 = -[_UIContextBinderSubstrate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scene, a3);

  return v7;
}

- (void)attachContext:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)detachContext:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
