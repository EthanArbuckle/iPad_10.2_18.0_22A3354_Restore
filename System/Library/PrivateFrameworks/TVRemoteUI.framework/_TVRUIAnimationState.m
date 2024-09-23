@implementation _TVRUIAnimationState

- (_TVRUIAnimationState)initWithIndex:(unint64_t)a3 previousIndex:(unint64_t)a4 toViewController:(id)a5 fromViewController:(id)a6 isInteractive:(BOOL)a7
{
  id v13;
  id v14;
  _TVRUIAnimationState *v15;
  _TVRUIAnimationState *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_TVRUIAnimationState;
  v15 = -[_TVRUIAnimationState init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_index = a3;
    v15->_previousIndex = a4;
    objc_storeStrong((id *)&v15->_toViewController, a5);
    objc_storeStrong((id *)&v16->_fromViewController, a6);
    v16->_isInteractive = a7;
  }

  return v16;
}

+ (_TVRUIAnimationState)animationStateWithIndex:(unint64_t)a3 previousIndex:(unint64_t)a4 toViewController:(id)a5 fromViewController:(id)a6 isInteractive:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIndex:previousIndex:toViewController:fromViewController:isInteractive:", a3, a4, v13, v12, v7);

  return (_TVRUIAnimationState *)v14;
}

- (BOOL)isParticpantViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  BOOL v7;

  v4 = a3;
  -[_TVRUIAnimationState toViewController](self, "toViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v7 = 1;
  }
  else
  {
    -[_TVRUIAnimationState fromViewController](self, "fromViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v4;

  }
  return v7;
}

- (id)viewControllersNoLongerAnimatingForDestinationAnimationState:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, void *);
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __85___TVRUIAnimationState_viewControllersNoLongerAnimatingForDestinationAnimationState___block_invoke;
  v14 = &unk_24DE2D190;
  v5 = v4;
  v15 = v5;
  v16 = &v17;
  v6 = (void (**)(void *, void *))_Block_copy(&v11);
  -[_TVRUIAnimationState fromViewController](self, "fromViewController", v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

  -[_TVRUIAnimationState toViewController](self, "toViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);

  v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)previousIndex
{
  return self->_previousIndex;
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
}

@end
