@implementation _UIKeyboardAnimatorAnimationStyleController

- (_UIKeyboardAnimatorAnimationStyleController)initWithAnimator:(id)a3
{
  id v5;
  _UIKeyboardAnimatorAnimationStyleController *v6;
  _UIKeyboardAnimatorAnimationStyleController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardAnimatorAnimationStyleController;
  v6 = -[_UIKeyboardAnimatorAnimationStyleController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_animator, a3);

  return v7;
}

- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIKeyboardAnimatorAnimationStyleControllerContext *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_UIKeyboardAnimatorAnimationStyleControllerContext initWithHost:startPlacement:endPlacement:]([_UIKeyboardAnimatorAnimationStyleControllerContext alloc], "initWithHost:startPlacement:endPlacement:", v10, v9, v8);

  -[_UIKeyboardAnimator prepareForAnimationWithState:](self->_animator, "prepareForAnimationWithState:", v11);
  return v11;
}

- (void)performAnimationWithHost:(id)a3 context:(id)a4
{
  -[_UIKeyboardAnimator runAnimationWithState:](self->_animator, "runAnimationWithState:", a4);
}

- (void)completeAnimationWithHost:(id)a3 context:(id)a4
{
  _UIKeyboardAnimator *animator;
  id v5;

  animator = self->_animator;
  v5 = a4;
  -[_UIKeyboardAnimator completeAnimationWithState:](animator, "completeAnimationWithState:", v5);
  objc_msgSend(v5, "complete");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animator, 0);
}

@end
