@implementation _UIViewControllerKeyboardAnimationStyle

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

+ (_UIViewControllerKeyboardAnimationStyle)animationStyleWithContext:(id)a3 useCustomTransition:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  _UIViewControllerKeyboardAnimationStyle *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;

  v4 = a4;
  v5 = a3;
  v6 = -[_UIViewControllerKeyboardAnimationStyle initWithContext:]([_UIViewControllerKeyboardAnimationStyle alloc], "initWithContext:", v5);
  -[UIInputViewAnimationStyle setAnimated:](v6, "setAnimated:", objc_msgSend(v5, "isAnimated"));
  objc_msgSend(v5, "_animator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionDuration:", v5);
  -[UIInputViewAnimationStyle setDuration:](v6, "setDuration:");

  -[UIInputViewAnimationStyle setExtraOptions:](v6, "setExtraOptions:", 96);
  objc_msgSend(v5, "_animator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "_animator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_allowKeyboardToAnimateAlongside:", v5);

  }
  else
  {
    v10 = objc_msgSend(v5, "isInteractive");
  }

  if (v10)
    v11 = 196608;
  else
    v11 = 458752;
  -[UIInputViewAnimationStyle setExtraOptions:](v6, "setExtraOptions:", -[UIInputViewAnimationStyle extraOptions](v6, "extraOptions") | v11);
  -[_UIViewControllerKeyboardAnimationStyle setDisableAlongsideView:](v6, "setDisableAlongsideView:", v10 ^ 1u);
  -[_UIViewControllerKeyboardAnimationStyle setAllowCustomTransition:](v6, "setAllowCustomTransition:", v4);
  -[UIInputViewAnimationStyleDirectional setOutDirection:](v6, "setOutDirection:", 0);
  if (v4)
  {
    objc_msgSend(v5, "_animator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(v5, "_animator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "transition");

      -[UIInputViewAnimationStyleDirectional setOutDirection:](v6, "setOutDirection:", +[UIViewController _keyboardDirectionForTransition:](UIViewController, "_keyboardDirectionForTransition:", v15));
    }
  }

  return v6;
}

- (void)setDisableAlongsideView:(BOOL)a3
{
  self->_allowCustomTransition = a3;
}

- (void)setAllowCustomTransition:(BOOL)a3
{
  *(&self->_allowCustomTransition + 1) = a3;
}

- (_UIViewControllerKeyboardAnimationStyle)initWithContext:(id)a3
{
  id v5;
  _UIViewControllerKeyboardAnimationStyle *v6;
  _UIViewControllerKeyboardAnimationStyle *v7;
  _UIViewControllerKeyboardAnimationStyleInfo *v8;
  void *v9;
  void *v10;
  _UIViewControllerKeyboardAnimationStyleInfo *v11;
  void *v12;
  _QWORD v14[4];
  _UIViewControllerKeyboardAnimationStyleInfo *v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
  v6 = -[_UIViewControllerKeyboardAnimationStyle init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = objc_alloc_init(_UIViewControllerKeyboardAnimationStyleInfo);
    objc_storeStrong((id *)&v7->_info, v8);
    *(&v7->_allowCustomTransition + 1) = 1;
    -[_UIViewControllerKeyboardAnimationStyle context](v7, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_willCompleteHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewControllerKeyboardAnimationStyleInfo setPreviousCompleteHandler:](v7->_info, "setPreviousCompleteHandler:", v10);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59___UIViewControllerKeyboardAnimationStyle_initWithContext___block_invoke;
    v14[3] = &unk_1E16C2C08;
    v15 = v8;
    v11 = v8;
    -[_UIViewControllerKeyboardAnimationStyle context](v7, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setWillCompleteHandler:", v14);

  }
  return v7;
}

- (_UIViewControllerTransitionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (BOOL)isAnimationCompleted
{
  void *v2;
  char v3;

  -[_UIViewControllerKeyboardAnimationStyle info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnimationCompleting");

  return v3;
}

- (void)launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v7 = a7;
  v15 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (-[UIInputViewAnimationStyle animated](self, "animated"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __111___UIViewControllerKeyboardAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke;
    v16[3] = &unk_1E16C2C30;
    v16[4] = self;
    v18 = v15;
    v19 = v12;
    v20 = v13;
    v17 = v14;
    v21 = v7;
    +[UIView _performWithAnimation:](UIView, "_performWithAnimation:", v16);

  }
  else
  {
    -[_UIViewControllerKeyboardAnimationStyle _launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:](self, "_launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:", v15, v12, v13, v14, v7);
  }

}

- (void)_launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7
{
  _BOOL8 v7;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_super v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  void (**v28)(_QWORD);

  v7 = a7;
  v12 = (void (**)(_QWORD))a3;
  v13 = (void (**)(_QWORD))a4;
  v14 = a5;
  v15 = a6;
  -[_UIViewControllerKeyboardAnimationStyle info](self, "info");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIsAnimationCompleting:", 0);

  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      goto LABEL_6;
    if (-[_UIViewControllerKeyboardAnimationStyle disableAlongsideView](self, "disableAlongsideView"))
      goto LABEL_6;
    if (!-[UIInputViewAnimationStyle animated](self, "animated"))
      goto LABEL_6;
    -[_UIViewControllerKeyboardAnimationStyle context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_auxContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transitioningView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __112___UIViewControllerKeyboardAnimationStyle__launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke;
    v26[3] = &unk_1E16C2C58;
    v27 = v12;
    v28 = v13;
    v24[0] = v22;
    v24[1] = 3221225472;
    v24[2] = __112___UIViewControllerKeyboardAnimationStyle__launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke_2;
    v24[3] = &unk_1E16BF798;
    v24[4] = self;
    v25 = v14;
    LOBYTE(v22) = objc_msgSend(v20, "animateAlongsideTransitionInView:animation:completion:", v21, v26, v24);

    if ((v22 & 1) == 0)
    {
LABEL_6:
      v23.receiver = self;
      v23.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
      -[UIInputViewAnimationStyle launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:](&v23, sel_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition_, v12, v13, v14, v15, v7);
    }
  }
  else
  {
    v12[2](v12);
    v13[2](v13);
    (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
  }

}

- (BOOL)canDismissWithScrollView
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
  v4 = -[UIInputViewAnimationStyleDirectional copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[_UIViewControllerKeyboardAnimationStyle context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v5;

  objc_storeStrong((id *)v4 + 9, self->_info);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
  if (-[UIInputViewAnimationStyleDirectional isEqual:](&v9, sel_isEqual_, v4))
  {
    -[_UIViewControllerKeyboardAnimationStyle context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (-[_UIViewControllerKeyboardAnimationStyle allowCustomTransition](self, "allowCustomTransition")
    && (-[_UIViewControllerKeyboardAnimationStyle context](self, "context"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "_animator"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    -[_UIViewControllerKeyboardAnimationStyle context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInputViewAnimationControllerViewController controllerWithContext:](UIInputViewAnimationControllerViewController, "controllerWithContext:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIViewControllerKeyboardAnimationStyle;
    -[UIInputViewAnimationStyleDirectional controllerForStartPlacement:endPlacement:](&v14, sel_controllerForStartPlacement_endPlacement_, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (BOOL)canTakeSnapshot
{
  return 1;
}

- (BOOL)disableAlongsideView
{
  return self->_allowCustomTransition;
}

- (_UIViewControllerKeyboardAnimationStyleInfo)info
{
  return self->_info;
}

- (BOOL)allowCustomTransition
{
  return *(&self->_allowCustomTransition + 1);
}

@end
