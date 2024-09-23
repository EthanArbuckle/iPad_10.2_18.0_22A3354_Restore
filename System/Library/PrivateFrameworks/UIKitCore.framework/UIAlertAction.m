@implementation UIAlertAction

+ (id)_actionWithTitle:(id)a3 descriptiveText:(id)a4 image:(id)a5 style:(int64_t)a6 handler:(id)a7 shouldDismissHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v25;
  void *v26;
  const __CFString *v27;

  v15 = a3;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIUserInterfaceIdiom(objc_msgSend(v20, "userInterfaceIdiom"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = CFSTR("UIAlertActionStyleDefault");
    if (a6 == 1)
      v27 = CFSTR("UIAlertActionStyleCancel");
    if (a6 == 2)
      v27 = CFSTR("UIAlertActionStyleDestructive");
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIAlertAction.m"), 42, CFSTR("Actions added to UIAlertController of style %@ must have a title when running in %@"), v27, v21);

  }
  v22 = objc_alloc_init((Class)objc_opt_class());
  if ((unint64_t)objc_msgSend(v15, "length") >= 0x3E8)
  {
    objc_msgSend(v15, "substringToIndex:", 999);
    v23 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v23;
  }
  objc_msgSend(v22, "setTitle:", v15);
  objc_msgSend(v22, "_setDescriptiveText:", v19);

  objc_msgSend(v22, "_setTitleTextAlignment:", 1);
  objc_msgSend(v22, "setImage:", v18);

  objc_msgSend(v22, "setStyle:", a6);
  objc_msgSend(v22, "setHandler:", v17);

  objc_msgSend(v22, "setShouldDismissHandler:", v16);
  objc_msgSend(v22, "setEnabled:", 1);
  objc_msgSend(v22, "_setChecked:", 0);
  objc_msgSend(v22, "_setIsPreferred:", 0);

  return v22;
}

+ (id)_actionWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 handler:(id)a6 shouldDismissHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend((id)objc_opt_class(), "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v14, 0, v13, a5, v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_actionWithContentViewController:(id)a3 style:(int64_t)a4
{
  return (id)objc_msgSend(a1, "_actionWithContentViewController:style:handler:", a3, a4, 0);
}

+ (id)_actionWithContentViewController:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v9, "_setContentViewController:", v8);

  objc_msgSend(v9, "setStyle:", a4);
  objc_msgSend(v9, "setEnabled:", 1);
  objc_msgSend(v9, "_setChecked:", 0);
  objc_msgSend(v9, "_setIsPreferred:", 0);
  objc_msgSend(v9, "setHandler:", v7);

  return v9;
}

+ (UIAlertAction)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void *)handler
{
  void *v7;
  NSString *v8;
  void *v9;

  v7 = handler;
  v8 = title;
  objc_msgSend((id)objc_opt_class(), "_actionWithTitle:image:style:handler:shouldDismissHandler:", v8, 0, style, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIAlertAction *)v9;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  void *v5;
  NSString *v6;
  NSString *title;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v10 = a3;
  if ((unint64_t)objc_msgSend(v10, "length") < 0x3E8)
  {
    v5 = v10;
  }
  else
  {
    objc_msgSend(v10, "substringToIndex:", 999);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v4;
  }
  v11 = v5;
  if ((objc_msgSend(v5, "isEqualToString:", self->_title) & 1) == 0)
  {
    v6 = (NSString *)objc_msgSend(v11, "copy");
    title = self->_title;
    self->_title = v6;

    -[UIAlertAction _interfaceActionRepresentation](self, "_interfaceActionRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_action:changedToTitle:", self, self->_title);

    -[UIAlertAction _representer](self, "_representer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_action:changedToTitle:", self, self->_title);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIAlertAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "setStyle:", -[UIAlertAction style](self, "style"));
  -[UIAlertAction handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandler:", v6);

  objc_msgSend(v4, "setEnabled:", -[UIAlertAction isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "_setIsPreferred:", -[UIAlertAction _isPreferred](self, "_isPreferred"));
  -[UIAlertAction simpleHandler](self, "simpleHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSimpleHandler:", v7);

  -[UIAlertAction shouldDismissHandler](self, "shouldDismissHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldDismissHandler:", v8);

  objc_msgSend(v4, "_setChecked:", -[UIAlertAction _isChecked](self, "_isChecked"));
  -[UIAlertAction _descriptiveText](self, "_descriptiveText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setDescriptiveText:", v9);

  objc_msgSend(v4, "_setTitleTextAlignment:", -[UIAlertAction _titleTextAlignment](self, "_titleTextAlignment"));
  -[UIAlertAction image](self, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v10);

  -[UIAlertAction _imageTintColor](self, "_imageTintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setImageTintColor:", v11);

  -[UIAlertAction _titleTextColor](self, "_titleTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setTitleTextColor:", v12);

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UIAlertAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertAction _descriptiveText](self, "_descriptiveText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertAction image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p Title = \"%@\" Descriptive = \"%@\" Image = %p>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)_titleTextAlignment
{
  return self->_titleTextAlignment;
}

- (void)_setTitleTextAlignment:(int64_t)a3
{
  void *v4;
  id v5;

  self->_titleTextAlignment = a3;
  -[UIAlertAction _interfaceActionRepresentation](self, "_interfaceActionRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_action:changedToTitleTextAlignment:", self, self->_titleTextAlignment);

  -[UIAlertAction _representer](self, "_representer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_action:changedToTitleTextAlignment:", self, self->_titleTextAlignment);

}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = enabled;
  self->_enabled = enabled;
  -[UIAlertAction _interfaceActionRepresentation](self, "_interfaceActionRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_action:changedToEnabled:", self, v3);

  -[UIAlertAction _representer](self, "_representer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_action:changedToEnabled:", self, self->_titleTextAlignment != 0);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_setChecked:(BOOL)a3
{
  void *v4;
  id v5;

  self->_checked = a3;
  -[UIAlertAction _interfaceActionRepresentation](self, "_interfaceActionRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_action:changedToChecked:", self, self->_checked);

  -[UIAlertAction _representer](self, "_representer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_action:changedToChecked:", self, self->_checked);

}

- (BOOL)_isChecked
{
  return self->_checked;
}

- (void)_setIsPreferred:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isPreferred != a3)
  {
    self->_isPreferred = a3;
    -[UIAlertAction _interfaceActionRepresentation](self, "_interfaceActionRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_action:changedToBePreferred:", self, self->_isPreferred);

    -[UIAlertAction _representer](self, "_representer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_action:changedToBePreferred:", self, self->_isPreferred);

  }
}

- (BOOL)_isPreferred
{
  return self->_isPreferred;
}

- (void)_setImageTintColor:(id)a3
{
  void *v5;
  void *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  if (self->_imageTintColor != v7)
  {
    objc_storeStrong((id *)&self->_imageTintColor, a3);
    -[UIAlertAction _interfaceActionRepresentation](self, "_interfaceActionRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_action:updatedImageTintColor:", self, v7);

    -[UIAlertAction _representer](self, "_representer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_action:updatedImageTintColor:", self, v7);

  }
}

- (id)_imageTintColor
{
  return self->_imageTintColor;
}

- (void)_setTitleTextColor:(id)a3
{
  void *v5;
  void *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  if (self->_titleTextColor != v7)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    -[UIAlertAction _interfaceActionRepresentation](self, "_interfaceActionRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_action:updatedTitleTextColor:", self, v7);

    -[UIAlertAction _representer](self, "_representer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_action:updatedTitleTextColor:", self, v7);

  }
}

- (id)_titleTextColor
{
  return self->_titleTextColor;
}

- (void)_willAddContentViewController
{
  void *v3;
  id v4;

  -[UIAlertAction _contentViewController](self, "_contentViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAlertAction _alertController](self, "_alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willMoveToParentViewController:", v3);
  objc_msgSend(v3, "addChildViewController:", v4);

}

- (void)_didAddContentViewController
{
  void *v3;
  id v4;

  -[UIAlertAction _contentViewController](self, "_contentViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIAlertAction _alertController](self, "_alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didMoveToParentViewController:", v3);

}

- (void)_setKeyCommandInput:(id)a3 modifierFlags:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    -[UIAlertAction _setKeyCommandInput:](self, "_setKeyCommandInput:", v7);
    -[UIAlertAction _setKeyCommandModifierFlags:](self, "_setKeyCommandModifierFlags:", a4);
    -[UIAlertAction _alertController](self, "_alertController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_action:changedToKeyCommandWithInput:modifierFlags:", self, v7, a4);

  }
}

- (NSString)title
{
  return self->_title;
}

- (UIAlertActionStyle)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)simpleHandler
{
  return self->_simpleHandler;
}

- (void)setSimpleHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (id)shouldDismissHandler
{
  return self->_shouldDismissHandler;
}

- (void)setShouldDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)_descriptiveText
{
  return self->__descriptiveText;
}

- (void)_setDescriptiveText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIViewController)_contentViewController
{
  return self->_contentViewController;
}

- (void)_setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (NSString)_keyCommandInput
{
  return self->_keyCommandInput;
}

- (void)_setKeyCommandInput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)_keyCommandModifierFlags
{
  return self->_keyCommandModifierFlags;
}

- (void)_setKeyCommandModifierFlags:(int64_t)a3
{
  self->_keyCommandModifierFlags = a3;
}

- (_UIAlertActionMutablePropertyObservering)_interfaceActionRepresentation
{
  return self->__interfaceActionRepresentation;
}

- (void)_setInterfaceActionRepresentation:(id)a3
{
  self->__interfaceActionRepresentation = (_UIAlertActionMutablePropertyObservering *)a3;
}

- (UIAlertController)_alertController
{
  return self->__alertController;
}

- (void)_setAlertController:(id)a3
{
  self->__alertController = (UIAlertController *)a3;
}

- (_UIAlertActionViewRepresentation)_representer
{
  return self->__representer;
}

- (void)_setRepresenter:(id)a3
{
  self->__representer = (_UIAlertActionViewRepresentation *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommandInput, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->__descriptiveText, 0);
  objc_storeStrong(&self->_shouldDismissHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_simpleHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
