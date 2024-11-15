@implementation _UIVisibilityPropagationView

- (void)dealloc
{
  _UIVisibilityPropagationInteraction *interaction;
  objc_super v4;

  interaction = self->_interaction;
  if (interaction)
  {
    os_unfair_lock_lock(&interaction->_visibilityLock);
    interaction->_visibilityLock_invalidated = 1;
    -[_UIVisibilityPropagationInteraction _visibilityLock_didMoveToWindow:]((uint64_t)interaction, 0);
    os_unfair_lock_unlock(&interaction->_visibilityLock);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIVisibilityPropagationView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (_UIVisibilityPropagationView)initWithFrame:(CGRect)a3
{
  _UIVisibilityPropagationView *v3;
  _UIVisibilityPropagationInteraction *v4;
  _UIVisibilityPropagationInteraction *interaction;
  objc_super v7;
  objc_super v8;

  v7.receiver = self;
  v7.super_class = (Class)_UIVisibilityPropagationView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [_UIVisibilityPropagationInteraction alloc];
    if (v4)
    {
      v8.receiver = v4;
      v8.super_class = (Class)_UIVisibilityPropagationInteraction;
      v4 = -[UIView init](&v8, sel_init);
      if (v4)
        *(_QWORD *)&v4->_visibilityLock._os_unfair_lock_opaque = 0;
    }
    interaction = v3->_interaction;
    v3->_interaction = v4;

    -[UIView addInteraction:](v3, "addInteraction:", v3->_interaction);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
}

- (_UIVisibilityPropagationView)initWithCoder:(id)a3
{
  _UIVisibilityPropagationView *v3;
  _UIVisibilityPropagationInteraction *v4;
  _UIVisibilityPropagationInteraction *interaction;
  objc_super v7;
  objc_super v8;

  v7.receiver = self;
  v7.super_class = (Class)_UIVisibilityPropagationView;
  v3 = -[UIView initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v3)
  {
    v4 = [_UIVisibilityPropagationInteraction alloc];
    if (v4)
    {
      v8.receiver = v4;
      v8.super_class = (Class)_UIVisibilityPropagationInteraction;
      v4 = -[UIView init](&v8, sel_init);
      if (v4)
        *(_QWORD *)&v4->_visibilityLock._os_unfair_lock_opaque = 0;
    }
    interaction = v3->_interaction;
    v3->_interaction = v4;

    -[UIView addInteraction:](v3, "addInteraction:", v3->_interaction);
  }
  return v3;
}

@end
