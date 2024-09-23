@implementation _UIViewWeakCAAnimationDelegate

- (_UIViewWeakCAAnimationDelegate)initWithAnimationDelegate:(id)a3
{
  id v4;
  _UIViewWeakCAAnimationDelegate *v5;
  _UIViewWeakCAAnimationDelegate *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewWeakCAAnimationDelegate;
  v5 = -[_UIViewWeakCAAnimationDelegate init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_animationDelegate, v4);
    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 2;
    else
      v7 = 0;
    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xFD | v7;
  }

  return v6;
}

+ (id)weakAnimationDelegate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAnimationDelegate:", v4);

  return v5;
}

- (void)animationDidStart:(id)a3
{
  CAAnimationDelegate **p_animationDelegate;
  id v4;
  id WeakRetained;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    p_animationDelegate = &self->_animationDelegate;
    v4 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_animationDelegate);
    objc_msgSend(WeakRetained, "animationDidStart:", v4);

  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  CAAnimationDelegate **p_animationDelegate;
  id v6;
  id WeakRetained;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = a4;
    p_animationDelegate = &self->_animationDelegate;
    v6 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_animationDelegate);
    objc_msgSend(WeakRetained, "animationDidStop:finished:", v6, v4);

  }
}

- (CAAnimationDelegate)animationDelegate
{
  return (CAAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationDelegate);
}

@end
