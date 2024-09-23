@implementation _UINavigationBarTitleRenameTextField

- (_UINavigationBarTitleRenameTextField)initWithSession:(id)a3
{
  id v5;
  _UINavigationBarTitleRenameTextField *v6;
  _UINavigationBarTitleRenameTextField *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UINavigationBarTitleRenameTextField;
  v6 = -[UIView init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](v7, "setText:", v8);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleShortEmphasizedBody"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v7, "setFont:", v9);

    -[UITextField setBorderStyle:](v7, "setBorderStyle:", 3);
    -[UITextField setAdjustsFontForContentSizeCategory:](v7, "setAdjustsFontForContentSizeCategory:", 1);
    +[UIColor clearColor](UIColor, "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField _setBackgroundStrokeColor:](v7, "_setBackgroundStrokeColor:", v10);

    +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField _setBackgroundFillColor:](v7, "_setBackgroundFillColor:", v11);

    -[UITextField _systemBackgroundView](v7, "_systemBackgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHasFlexibleCornerRadius:", 1);

    -[UITextField _systemBackgroundView](v7, "_systemBackgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 8.0);

    -[UITextField setClearButtonMode:](v7, "setClearButtonMode:", 3);
    -[_UINavigationBarTitleRenameTextField setAutocapitalizationType:](v7, "setAutocapitalizationType:", 2);
    -[_UINavigationBarTitleRenameTextField setReturnKeyType:](v7, "setReturnKeyType:", 9);
    -[UITextField setClearingBehavior:](v7, "setClearingBehavior:", 3);
    -[_UINavigationBarTitleRenameTextField _setupIconViewIfNecessary](v7, "_setupIconViewIfNecessary");
  }

  return v7;
}

- (void)_setupIconViewIfNecessary
{
  void *v3;
  void *v4;
  _UIDocumentPropertiesIconView *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *iconHeightConstraint;
  NSLayoutConstraint *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  CGRect v18;

  v17[2] = *MEMORY[0x1E0C80C00];
  -[_UINavigationBarTitleRenameTextField session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[_UIDocumentPropertiesIconView initWithMetadata:]([_UIDocumentPropertiesIconView alloc], "initWithMetadata:", v4);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIDocumentPropertiesIconView setIconInsets:](v5, "setIconInsets:", 1.0, 6.0, 1.0, 1.0);
    -[UITextField setLeftView:](self, "setLeftView:", v5);
    -[UITextField setLeftViewMode:](self, "setLeftViewMode:", 3);
    -[UIView heightAnchor](v5, "heightAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    objc_msgSend(v6, "constraintEqualToConstant:", CGRectGetHeight(v18));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

    iconHeightConstraint = self->_iconHeightConstraint;
    self->_iconHeightConstraint = v7;
    v9 = v7;

    v10 = (void *)MEMORY[0x1E0D156E0];
    -[UIView widthAnchor](v5, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPropertiesIconView iconInsets](v5, "iconInsets");
    v13 = v12 + 24.0;
    -[_UIDocumentPropertiesIconView iconInsets](v5, "iconInsets");
    objc_msgSend(v11, "constraintEqualToConstant:", v13 + v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v15;
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateConstraints:", v16);

  }
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTitleRenameTextField;
  -[UITextField layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[NSLayoutConstraint setConstant:](self->_iconHeightConstraint, "setConstant:", CGRectGetHeight(v4));
}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (BOOL)_shouldEndEditingOnReturn
{
  return 1;
}

- (void)_becomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarTitleRenameTextField;
  -[UITextField _becomeFirstResponder](&v8, sel__becomeFirstResponder);
  -[UITextField text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = objc_msgSend(v3, "length");
  -[_UINavigationBarTitleRenameTextField session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_willBeginRenamingWithText:selectedRange:", v3, &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextField setText:](self, "setText:", v5);
  -[UITextField setSelectionRange:](self, "setSelectionRange:", v6, v7);

}

- (BOOL)canResignFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarTitleRenameTextField;
  if (!-[UITextField canResignFirstResponder](&v9, sel_canResignFirstResponder))
    return 0;
  -[_UINavigationBarTitleRenameTextField session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachedRenamer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UINavigationBarTitleRenameTextField session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "_textFieldShouldEndEditingWithText:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_resignFirstResponder
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarTitleRenameTextField;
  -[UITextField _resignFirstResponder](&v5, sel__resignFirstResponder);
  -[_UINavigationBarTitleRenameTextField session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textFieldDidEndEditingWithText:", v4);

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (!v4)
  {
    -[_UINavigationBarTitleRenameTextField passthroughInteraction](self, "passthroughInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UINavigationBarTitleRenameTextField passthroughInteraction](self, "passthroughInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView removeInteraction:](self, "removeInteraction:", v6);

      -[_UINavigationBarTitleRenameTextField setPassthroughInteraction:](self, "setPassthroughInteraction:", 0);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTitleRenameTextField;
  -[UITextField willMoveToWindow:](&v7, sel_willMoveToWindow_, v4);

}

- (void)didMoveToWindow
{
  void *v3;
  _UIPassthroughScrollInteraction *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarTitleRenameTextField;
  -[UITextField didMoveToWindow](&v5, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(_UIPassthroughScrollInteraction);
    -[_UIPassthroughScrollInteraction setDelegate:](v4, "setDelegate:", self);
    -[UIView addInteraction:](self, "addInteraction:", v4);
    -[_UINavigationBarTitleRenameTextField setPassthroughInteraction:](self, "setPassthroughInteraction:", v4);

  }
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    -[UIView _window](self, "_window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[UIView _window](self, "_window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
  objc_msgSend(v16, "hitTest:withEvent:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && objc_msgSend(v17, "isDescendantOfView:", v13))
    v19 = !-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", v8, x, y);
  else
    LOBYTE(v19) = 0;

  return v19;
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  return -[UIView endEditing:](self, "endEditing:", 0);
}

- (double)horizontalTextInset
{
  CGRect v3;

  -[UITextField textRectForBounds:](self, "textRectForBounds:", 0.0, 0.0, 100.0, 32.0);
  return CGRectGetMinX(v3);
}

- (FBSSceneIdentityToken)_layeringSceneIdentity
{
  return self->_layeringSceneIdentity;
}

- (void)_setLayeringSceneIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_layeringSceneIdentity, a3);
}

- (id)horizontalTextInsetDidChangeCallback
{
  return self->_horizontalTextInsetDidChangeCallback;
}

- (void)setHorizontalTextInsetDidChangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (_UINavigationBarTitleRenamerSession)session
{
  return self->_session;
}

- (NSLayoutConstraint)iconHeightConstraint
{
  return self->_iconHeightConstraint;
}

- (_UIPassthroughScrollInteraction)passthroughInteraction
{
  return self->_passthroughInteraction;
}

- (void)setPassthroughInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_passthroughInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
  objc_storeStrong((id *)&self->_iconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_horizontalTextInsetDidChangeCallback, 0);
  objc_storeStrong((id *)&self->_layeringSceneIdentity, 0);
}

@end
