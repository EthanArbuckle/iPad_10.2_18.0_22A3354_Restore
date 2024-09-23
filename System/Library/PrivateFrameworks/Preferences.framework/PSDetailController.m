@implementation PSDetailController

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  +[PSEditingPane defaultBackgroundColor](PSEditingPane, "defaultBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PSDetailController setView:](self, "setView:", v4);
}

- (void)viewDidUnload
{
  PSEditingPane *pane;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSDetailController;
  -[PSDetailController viewDidUnload](&v4, sel_viewDidUnload);
  -[PSEditingPane setDelegate:](self->_pane, "setDelegate:", 0);
  pane = self->_pane;
  self->_pane = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[PSEditingPane setDelegate:](self->_pane, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PSDetailController;
  -[PSDetailController dealloc](&v3, sel_dealloc);
}

- (CGRect)paneFrame
{
  void *editPaneClass;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  editPaneClass = self->super._specifier->editPaneClass;
  if (!editPaneClass)
    editPaneClass = (void *)objc_opt_class();
  -[PSDetailController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(editPaneClass, "preferredHeight");
    if (v13 > 0.0)
      v12 = v13;
  }
  v14 = v6;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSDetailController;
  -[PSDetailController willRotateToInterfaceOrientation:duration:](&v7, sel_willRotateToInterfaceOrientation_duration_);
  -[PSEditingPane willRotateToInterfaceOrientation:duration:](self->_pane, "willRotateToInterfaceOrientation:duration:", a3, a4);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  PSEditingPane *pane;
  uint64_t v9;
  uint64_t v10;
  PSEditingPane *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSDetailController;
  -[PSDetailController willAnimateRotationToInterfaceOrientation:duration:](&v12, sel_willAnimateRotationToInterfaceOrientation_duration_);
  pane = self->_pane;
  -[PSDetailController paneFrame](self, "paneFrame");
  -[PSEditingPane setFrame:](pane, "setFrame:");
  v9 = -[PSEditingPane methodForSelector:](self->_pane, "methodForSelector:", a2);
  v10 = +[PSEditingPane instanceMethodForSelector:](PSEditingPane, "instanceMethodForSelector:", a2);
  v11 = self->_pane;
  if (v9 == v10)
    -[PSEditingPane layoutBelowIfNeeded](v11, "layoutBelowIfNeeded");
  else
    -[PSEditingPane willAnimateRotationToInterfaceOrientation:duration:](v11, "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  -[PSEditingPane didRotateFromInterfaceOrientation:](self->_pane, "didRotateFromInterfaceOrientation:", a3);
}

- (void)setPane:(id)a3
{
  PSEditingPane *v5;
  PSEditingPane **p_pane;
  PSEditingPane *pane;
  PSEditingPane *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PSEditingPane *v14;

  v5 = (PSEditingPane *)a3;
  p_pane = &self->_pane;
  pane = self->_pane;
  v8 = v5;
  v14 = v5;
  if (pane != v5)
  {
    if (pane)
    {
      -[PSEditingPane childViewControllerForHostingViewController](pane, "childViewControllerForHostingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "willMoveToParentViewController:", 0);
        objc_msgSend(v10, "removeFromParentViewController");
      }
      -[PSEditingPane setViewController:](*p_pane, "setViewController:", 0);
      -[PSEditingPane removeFromSuperview](*p_pane, "removeFromSuperview");

    }
    objc_storeStrong((id *)&self->_pane, a3);
    if (*p_pane)
    {
      -[PSEditingPane childViewControllerForHostingViewController](*p_pane, "childViewControllerForHostingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[PSViewController addChildViewController:](self, "addChildViewController:", v11);
        -[PSDetailController view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSubview:", *p_pane);

        objc_msgSend(v11, "didMoveToParentViewController:", self);
      }
      else
      {
        -[PSDetailController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSubview:", *p_pane);

      }
      -[PSEditingPane setViewController:](*p_pane, "setViewController:", self);
      if (-[PSEditingPane shouldInsetContent](*p_pane, "shouldInsetContent"))
        -[PSEditingPane insetContent](*p_pane, "insetContent");

      v8 = *p_pane;
    }
    else
    {
      v8 = 0;
    }
  }
  if (-[PSEditingPane requiresKeyboard](v8, "requiresKeyboard"))
    -[PSEditingPane becomeFirstResponder](*p_pane, "becomeFirstResponder");

}

- (void)viewDidLayoutSubviews
{
  PSEditingPane *pane;
  PSEditingPane *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSDetailController;
  -[PSDetailController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  pane = self->_pane;
  if (pane)
  {
    if (-[PSEditingPane shouldInsetContent](pane, "shouldInsetContent"))
    {
      v4 = self->_pane;
      -[PSDetailController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      -[PSEditingPane layoutInsetContent:](v4, "layoutInsetContent:");

    }
  }
}

- (PSEditingPane)pane
{
  return self->_pane;
}

- (void)loadPane
{
  objc_class *editPaneClass;
  id v4;
  PSSpecifier *specifier;
  void *v6;
  id v7;

  if (!self->_pane)
  {
    editPaneClass = self->super._specifier->editPaneClass;
    if (!editPaneClass)
      editPaneClass = (objc_class *)objc_opt_class();
    v4 = [editPaneClass alloc];
    -[PSDetailController paneFrame](self, "paneFrame");
    v7 = (id)objc_msgSend(v4, "initWithFrame:");
    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setPreferenceSpecifier:", self->super._specifier);
    specifier = self->super._specifier;
    if (specifier->getter)
    {
      -[PSSpecifier performGetter](specifier, "performGetter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPreferenceValue:", v6);

    }
    -[PSDetailController setPane:](self, "setPane:", v7);

  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSDetailController;
  -[PSViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PSSpecifier name](self->super._specifier, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSDetailController setTitle:](self, "setTitle:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSDetailController;
  -[PSViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PSDetailController loadPane](self, "loadPane");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSDetailController;
  -[PSViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PSEditingPane viewDidBecomeVisible](self->_pane, "viewDidBecomeVisible");
}

- (void)saveChanges
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PSDetailController pane](self, "pane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PSDetailController pane](self, "pane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "performSetterWithValue:", v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSDetailController;
  -[PSViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[PSDetailController pane](self, "pane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handlesDoneButton");

  if ((v5 & 1) == 0)
    -[PSDetailController saveChanges](self, "saveChanges");
}

- (void)statusBarWillAnimateByHeight:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  _QWORD v9[9];

  -[PSEditingPane frame](self->_pane, "frame");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PSDetailController_statusBarWillAnimateByHeight___block_invoke;
  v9[3] = &unk_1E4A664C8;
  v9[4] = self;
  v9[5] = v5;
  v9[6] = v6;
  v9[7] = v7;
  *(double *)&v9[8] = v8 + a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v9, 0, 0.35, 0.0);
}

uint64_t __51__PSDetailController_statusBarWillAnimateByHeight___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "layoutIfNeeded");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pane, 0);
}

@end
