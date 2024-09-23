@implementation _UIDragAnimatingWrapper

- (_UIDragAnimatingWrapper)initWithPropertyAnimator:(id)a3
{
  id v5;
  _UIDragAnimatingWrapper *v6;
  _UIDragAnimatingWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDragAnimatingWrapper;
  v6 = -[_UIDragAnimatingWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_animator, a3);

  return v7;
}

- (void)addAnimations:(id)a3
{
  -[UIViewPropertyAnimator addAnimations:](self->_animator, "addAnimations:", a3);
}

- (void)addCompletion:(id)a3
{
  -[UIViewPropertyAnimator addCompletion:](self->_animator, "addCompletion:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animator, 0);
}

@end
