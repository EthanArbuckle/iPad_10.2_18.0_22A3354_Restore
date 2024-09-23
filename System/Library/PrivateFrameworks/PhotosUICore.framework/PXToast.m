@implementation PXToast

- (PXToast)initWithConfiguration:(id)a3
{
  id v5;
  PXToast *v6;
  PXToast *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXToast;
  v6 = -[PXToast init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(v5, "bottomMargin");
    -[PXToast setBottomMargin:](v7, "setBottomMargin:");
  }

  return v7;
}

- (void)setIsShown:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  if (self->_isShown != a3)
  {
    self->_isShown = a3;
    v4 = (void *)_activeToasts;
    if (a3)
    {
      if (!_activeToasts)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)_activeToasts;
        _activeToasts = v5;

        v4 = (void *)_activeToasts;
      }
      objc_msgSend(v4, "addObject:", self);
    }
    else
    {
      objc_msgSend((id)_activeToasts, "removeObject:", self);
    }
  }
}

- (void)_present
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  PXToastDefaultContentView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  double v32;
  void *v33;
  NSObject *v34;
  double v35;
  double v36;
  dispatch_time_t v37;
  void *v38;
  _QWORD block[4];
  id v40;
  id location;
  _QWORD v42[4];
  NSObject *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[2];
  _QWORD v49[3];
  CGRect v50;

  v49[1] = *MEMORY[0x1E0C80C00];
  if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0 && !-[PXToast isShown](self, "isShown"))
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_firstKeyWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXToastConfiguration sourceView](self->_configuration, "sourceView");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = v4;
    v8 = v7;

    if (v8)
    {
      v38 = v4;
      -[PXToast setIsShown:](self, "setIsShown:", 1);
      -[PXToastConfiguration contentView](self->_configuration, "contentView");
      v9 = (PXToastDefaultContentView *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        v9 = -[PXToastDefaultContentView initWithToastConfiguration:]([PXToastDefaultContentView alloc], "initWithToastConfiguration:", self->_configuration);
      -[PXToast setView:](self, "setView:", v9);
      objc_msgSend(v8, "addSubview:", v9);
      objc_msgSend(v8, "bringSubviewToFront:", v9);
      -[PXToastDefaultContentView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v10 = (void *)MEMORY[0x1E0CB3718];
      -[PXToastDefaultContentView widthAnchor](v9, "widthAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      objc_msgSend(v11, "constraintLessThanOrEqualToConstant:", CGRectGetWidth(v50) + -20.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activateConstraints:", v13);

      if (-[PXToastConfiguration canSwipeToDismiss](self->_configuration, "canSwipeToDismiss"))
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D10]), "initWithTarget:action:", self, sel__handleSwipe_);
        objc_msgSend(v14, "setDirection:", 8);
        -[PXToastDefaultContentView addGestureRecognizer:](v9, "addGestureRecognizer:", v14);

      }
      -[PXToastDefaultContentView bottomAnchor](v9, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXToast bottomMargin](self, "bottomMargin");
      objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXToastDefaultContentView topAnchor](v9, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 0.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB3718];
      -[PXToastDefaultContentView centerXAnchor](v9, "centerXAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centerXAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v25;
      v48[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "activateConstraints:", v26);

      objc_msgSend(v8, "layoutIfNeeded");
      v27 = (void *)MEMORY[0x1E0DC3F10];
      v28 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __19__PXToast__present__block_invoke;
      v44[3] = &unk_1E51457C8;
      v29 = v21;
      v45 = v29;
      v30 = v18;
      v46 = v30;
      v47 = v8;
      objc_msgSend(v27, "animateWithDuration:delay:options:animations:completion:", 0x20000, v44, 0, 0.5, 0.0);
      -[PXToastDefaultContentView layer](v9, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = 0;
      objc_msgSend(v31, "setOpacity:", v32);

      v33 = (void *)MEMORY[0x1E0DC3F10];
      v42[0] = v28;
      v42[1] = 3221225472;
      v42[2] = __19__PXToast__present__block_invoke_2;
      v42[3] = &unk_1E5149198;
      v34 = v9;
      v43 = v34;
      objc_msgSend(v33, "animateWithDuration:delay:options:animations:completion:", 0x10000, v42, 0, 0.2, 0.3);
      -[PXToast setOnscreenConstraint:](self, "setOnscreenConstraint:", v30);
      -[PXToast setOffscreenConstraint:](self, "setOffscreenConstraint:", v29);
      -[PXToastConfiguration autoDismissalDelay](self->_configuration, "autoDismissalDelay");
      if (v35 > 0.0)
      {
        v36 = v35;
        objc_initWeak(&location, self);
        v37 = dispatch_time(0, (uint64_t)(v36 * 1000000000.0));
        block[0] = v28;
        block[1] = 3221225472;
        block[2] = __19__PXToast__present__block_invoke_3;
        block[3] = &unk_1E5148D30;
        objc_copyWeak(&v40, &location);
        dispatch_after(v37, MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(&v40);
        objc_destroyWeak(&location);
      }

      v4 = v38;
    }
    else
    {
      PXAssertGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location) = 0;
        _os_log_error_impl(&dword_1A6789000, v34, OS_LOG_TYPE_ERROR, "No view to present toast, is there no window active?", (uint8_t *)&location, 2u);
      }
    }

  }
}

- (void)setBottomMargin:(double)a3
{
  double v3;
  id v4;

  if (self->_bottomMargin != a3)
  {
    self->_bottomMargin = a3;
    v3 = -a3;
    -[PXToast onscreenConstraint](self, "onscreenConstraint");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstant:", v3);

  }
}

- (void)dismissAnimated:(BOOL)a3
{
  -[PXToast _dismissAnimated:completionHandler:](self, "_dismissAnimated:completionHandler:", a3, &__block_literal_global_84795);
}

- (void)dismissAnimated:(BOOL)a3 afterDelay:(double)a4
{
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PXToast_dismissAnimated_afterDelay___block_invoke;
  block[3] = &unk_1E5145760;
  objc_copyWeak(&v8, &location);
  v9 = a3;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_dismissAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(_QWORD);
  id v21;
  _QWORD v22[5];
  id v23;
  id location;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[PXToast view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXToastConfiguration setContentView:](self->_configuration, "setContentView:", 0);
  objc_msgSend(v7, "window");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v4 && v8)
  {
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __46__PXToast__dismissAnimated_completionHandler___block_invoke;
    v22[3] = &unk_1E5148D08;
    v22[4] = self;
    v23 = v9;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __46__PXToast__dismissAnimated_completionHandler___block_invoke_2;
    v18[3] = &unk_1E51236B0;
    v12 = v7;
    v19 = v12;
    v20 = v6;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", 0x10000, v22, v18, 0.5, 0.0);
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1.0;
    objc_msgSend(v13, "setOpacity:", v14);

    v15 = (void *)MEMORY[0x1E0DC3F10];
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __46__PXToast__dismissAnimated_completionHandler___block_invoke_3;
    v16[3] = &unk_1E5149198;
    v17 = v12;
    objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 0x20000, v16, 0, 0.2, 0.0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v7, "removeFromSuperview");
    -[PXToast setIsShown:](self, "setIsShown:", 0);
    v6[2](v6);
  }

}

- (void)_handleSwipe:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[PXToast dismissAnimated:](self, "dismissAnimated:", 1);
}

- (NSLayoutConstraint)onscreenConstraint
{
  return self->_onscreenConstraint;
}

- (void)setOnscreenConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_onscreenConstraint, a3);
}

- (NSLayoutConstraint)offscreenConstraint
{
  return self->_offscreenConstraint;
}

- (void)setOffscreenConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_offscreenConstraint, a3);
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (BOOL)isShown
{
  return self->_isShown;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_offscreenConstraint, 0);
  objc_storeStrong((id *)&self->_onscreenConstraint, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __46__PXToast__dismissAnimated_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "offscreenConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActive:", 1);

  objc_msgSend(*(id *)(a1 + 32), "onscreenConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);

  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

void __46__PXToast__dismissAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setIsShown:", 0);

}

void __46__PXToast__dismissAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 0;
  objc_msgSend(v2, "setOpacity:", v1);

}

void __38__PXToast_dismissAnimated_afterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissAnimated:completionHandler:", *(unsigned __int8 *)(a1 + 40), &__block_literal_global_10_84794);

}

uint64_t __19__PXToast__present__block_invoke(id *a1)
{
  objc_msgSend(a1[4], "setActive:", 0);
  objc_msgSend(a1[5], "setActive:", 1);
  return objc_msgSend(a1[6], "layoutIfNeeded");
}

void __19__PXToast__present__block_invoke_2(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 1.0;
  objc_msgSend(v2, "setOpacity:", v1);

}

void __19__PXToast__present__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissAnimated:", 1);

}

+ (id)show:(id)a3
{
  void (**v4)(id, PXToastConfiguration *);
  PXToastConfiguration *v5;
  void *v6;

  v4 = (void (**)(id, PXToastConfiguration *))a3;
  v5 = objc_alloc_init(PXToastConfiguration);
  v4[2](v4, v5);

  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:", v5);
  objc_msgSend(v6, "_present");

  return v6;
}

@end
