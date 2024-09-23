@implementation _UIFieldEditorSystemInputHost

- (void)dealloc
{
  objc_super v3;

  -[UISystemInputViewController resetContainingResponder](self->_systemInputViewController, "resetContainingResponder");
  v3.receiver = self;
  v3.super_class = (Class)_UIFieldEditorSystemInputHost;
  -[_UIFieldEditorSystemInputHost dealloc](&v3, sel_dealloc);
}

- (void)addFieldEditor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIVisualEffectView *v8;
  void *v9;
  void *v10;
  UIVisualEffectView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UISystemInputViewController *v19;
  UISystemInputViewController *systemInputViewController;
  void *v21;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIFieldEditorHost hostingView](self, "hostingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = objc_msgSend(v5, "_blurEffectStyleForAppearance");
  v8 = [UIVisualEffectView alloc];
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIVibrancyEffect effectForBlurEffect:](UIVibrancyEffect, "effectForBlurEffect:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIVisualEffectView initWithEffect:](v8, "initWithEffect:", v10);

  -[UIView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
  -[UIVisualEffectView _setCornerRadius:](v11, "_setCornerRadius:", 6.0);
  objc_msgSend(v6, "addSubview:", v11);
  objc_storeStrong((id *)&self->_containerView, v6);
  objc_storeStrong((id *)&self->_backgroundEffectView, v11);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", v6, 8, 0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeightConstraint:", v12);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", v6, 7, 0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWidthConstraint:", v13);

  v14 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(v6, "heightConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  objc_msgSend(v6, "widthConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v17);

  -[UIVisualEffectView contentView](v11, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClipsToBounds:", 0);

  v22.receiver = self;
  v22.super_class = (Class)_UIFieldEditorSystemInputHost;
  -[_UIFieldEditorHost addFieldEditor:](&v22, sel_addFieldEditor_, v4);

  +[UISystemInputViewController systemInputViewControllerForResponder:editorView:](UISystemInputViewController, "systemInputViewControllerForResponder:editorView:", v5, v6);
  v19 = (UISystemInputViewController *)objc_claimAutoreleasedReturnValue();
  systemInputViewController = self->_systemInputViewController;
  self->_systemInputViewController = v19;

  -[_UIFieldEditorSystemInputHost _updateFieldEditorBackgroundViewLayoutForcingDefault:](self, "_updateFieldEditorBackgroundViewLayoutForcingDefault:", 1);
  if (self->_systemInputViewController)
  {
    +[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentViewController:animated:completion:", self->_systemInputViewController, -[UISystemInputViewController isAutomaticResponderTransition](self->_systemInputViewController, "isAutomaticResponderTransition") ^ 1, 0);

  }
}

- (void)removeFieldEditor
{
  UISystemInputViewController *systemInputViewController;
  UISystemInputViewController *v4;
  _UIFieldEditorSystemInputHostView *containerView;
  UIVisualEffectView *backgroundEffectView;
  objc_super v7;

  systemInputViewController = self->_systemInputViewController;
  if (systemInputViewController)
  {
    -[UIViewController dismissViewControllerAnimated:completion:](systemInputViewController, "dismissViewControllerAnimated:completion:", -[UISystemInputViewController isAutomaticResponderTransition](self->_systemInputViewController, "isAutomaticResponderTransition") ^ 1, 0);
    -[UISystemInputViewController prepareForRelease](self->_systemInputViewController, "prepareForRelease");
    v4 = self->_systemInputViewController;
    self->_systemInputViewController = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)_UIFieldEditorSystemInputHost;
  -[_UIFieldEditorHost removeFieldEditor](&v7, sel_removeFieldEditor);
  containerView = self->_containerView;
  self->_containerView = 0;

  backgroundEffectView = self->_backgroundEffectView;
  self->_backgroundEffectView = 0;

}

- (void)addPlaceholderLabel:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  _UIFieldEditorSystemInputHostView *containerView;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  unint64_t v33;
  NSObject *v34;
  objc_super v35;
  _QWORD v36[4];
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  containerView = self->_containerView;
  if (has_internal_diagnostics)
  {
    if (containerView)
      goto LABEL_3;
    __UIFaultDebugAssertLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v32, OS_LOG_TYPE_FAULT, "Should have a _backgroundView when adding the placeholder label.", buf, 2u);
    }

  }
  else
  {
    if (containerView)
      goto LABEL_3;
    v33 = addPlaceholderLabel____s_category;
    if (!addPlaceholderLabel____s_category)
    {
      v33 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v33, (unint64_t *)&addPlaceholderLabel____s_category);
    }
    v34 = *(NSObject **)(v33 + 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "Should have a _backgroundView when adding the placeholder label.", buf, 2u);
    }
  }
  if (!self->_containerView)
  {
    v35.receiver = self;
    v35.super_class = (Class)_UIFieldEditorSystemInputHost;
    -[_UIFieldEditorHost addPlaceholderLabel:](&v35, sel_addPlaceholderLabel_, v4);
    goto LABEL_7;
  }
LABEL_3:
  -[_UIFieldEditorHost hostingView](self, "hostingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_containerView, "bounds");
  objc_msgSend(v7, "placeholderRectForBounds:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIView bounds](self->_containerView, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v7, "contentScaleFactor");
  v25 = UIRectCenteredYInRectScale(v9, v11, v13, v15, v17, v19, v21, v23, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  if (-[_UIFieldEditorSystemInputHost _isTV](self, "_isTV"))
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __53___UIFieldEditorSystemInputHost_addPlaceholderLabel___block_invoke;
    v36[3] = &unk_1E16B20D8;
    v37 = v4;
    v38 = v25;
    v39 = v27;
    v40 = v29;
    v41 = v31;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v36);

  }
  else
  {
    objc_msgSend(v4, "setFrame:", v25, v27, v29, v31);
  }
  -[UIView addSubview:](self->_containerView, "addSubview:", v4);

LABEL_7:
}

- (void)layoutIfNeeded
{
  -[_UIFieldEditorSystemInputHost _updateFieldEditorBackgroundViewLayoutForcingDefault:](self, "_updateFieldEditorBackgroundViewLayoutForcingDefault:", 0);
}

- (id)_viewForHostingFieldEditor
{
  return -[UIVisualEffectView contentView](self->_backgroundEffectView, "contentView");
}

- (void)_updateFieldEditorBackgroundViewLayoutForcingDefault:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  id v20;
  void *v21;
  int v22;
  int v23;
  _BOOL4 v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;

  if (self->_systemInputViewController)
  {
    v3 = a3;
    -[_UIFieldEditorHost hostingView](self, "hostingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v5;
    if (v3)
    {
      -[_UIFieldEditorHost hostedFieldEditor](self, "hostedFieldEditor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 600.0;
    }
    else
    {
      v22 = objc_msgSend(v5, "_fieldEditorAttached");
      v21 = v33;
      if (!v22
        || (v23 = objc_msgSend(v33, "_hasContent"), v21 = v33, !v23)
        || (v24 = -[UISystemInputViewController supportsTouchInput](self->_systemInputViewController, "supportsTouchInput"), v21 = v33, !v24))
      {
LABEL_16:

        return;
      }
      -[_UIFieldEditorHost hostedFieldEditor](self, "hostedFieldEditor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v27 = v26;
      objc_msgSend(v25, "overscanCompensationInsets");
      v7 = v27 - (v28 + v29);
      objc_msgSend(v6, "attributedText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "size");
      v32 = v31 + 20.0;
      if (v32 <= v7)
      {
        v7 = v32;
        if (v32 < 600.0)
          v7 = 600.0;
      }

    }
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIView setFrame:](self->_backgroundEffectView, "setFrame:", *MEMORY[0x1E0C9D538], v9, v7, 70.0, v33);
    -[_UIFieldEditorSystemInputHostView widthConstraint](self->_containerView, "widthConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConstant:", v7);

    -[_UIFieldEditorSystemInputHostView heightConstraint](self->_containerView, "heightConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", 70.0);

    v12 = v7 + -20.0;
    objc_msgSend(v6, "attributedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v14;

    objc_msgSend(v34, "selectedTextRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "start");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v34, "baseWritingDirectionForPosition:inDirection:", v17, 0);

    if (v18 != 1 && v15 > v12)
    {
      objc_msgSend(v6, "contentSize");
      v8 = v19 - v12;
      v9 = 0.0;
    }
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __86___UIFieldEditorSystemInputHost__updateFieldEditorBackgroundViewLayoutForcingDefault___block_invoke;
    v35[3] = &unk_1E16BF720;
    v36 = v6;
    v37 = xmmword_18667C9B0;
    v38 = v12;
    v39 = 0x4051800000000000;
    v40 = v8;
    v41 = v9;
    v20 = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v35);

    v21 = v34;
    goto LABEL_16;
  }
}

- (BOOL)_isTV
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_UIFieldEditorHost hostingView](self, "hostingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "userInterfaceIdiom") == 2;
  else
    v4 = 0;

  return v4;
}

- (id)description
{
  return +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, &unk_1E1A93470);
}

- (UISystemInputViewController)_systemInputViewController
{
  return self->_systemInputViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInputViewController, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
