@implementation UIStoryboardEmbedSegueTemplate

- (UIStoryboardEmbedSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardEmbedSegueTemplate *v5;
  uint64_t v6;
  UIView *containerView;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIStoryboardEmbedSegueTemplate;
  v5 = -[UIStoryboardSegueTemplate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIContainerView"));
    v6 = objc_claimAutoreleasedReturnValue();
    containerView = v5->_containerView;
    v5->_containerView = (UIView *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStoryboardEmbedSegueTemplate;
  v4 = a3;
  -[UIStoryboardSegueTemplate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UIStoryboardEmbedSegueTemplate containerView](self, "containerView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIContainerView"));

}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  UIStoryboardEmbedSegueTemplate *v12;
  id v13[2];
  id location;

  v5 = a3;
  -[UIStoryboardEmbedSegueTemplate containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__UIStoryboardEmbedSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E16E2FF0;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  v11 = v6;
  v12 = self;
  v7 = v6;
  v8 = _Block_copy(aBlock);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  return v8;
}

void __67__UIStoryboardEmbedSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("UIStoryboardEmbedSegueTemplate.m"), 38, CFSTR("containerView is required."));

    v2 = *(void **)(a1 + 32);
  }
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("UIStoryboardEmbedSegueTemplate.m"), 39, CFSTR("There are unexpected subviews in the container view. Perhaps the embed segue has already fired once or a subview was added programmatically?"));

  }
  objc_msgSend(WeakRetained, "sourceViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "destinationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addChildViewController:", v6);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v7);
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  if ((objc_msgSend(v7, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
  {
    _NSDictionaryOfVariableBindings(CFSTR("childView"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[childView]|"), 0, 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConstraints:", v10);

    v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[childView]|"), 0, 0, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraints:", v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v6, "didMoveToParentViewController:", v5);

}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
