@implementation _UIAlertControllerActionViewInterfaceAction

+ (id)actionWithAlertControllerActionView:(id)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____UIAlertControllerActionViewInterfaceAction;
  objc_msgSendSuper2(&v5, sel_actionWithCustomContentView_handler_, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_initializeStateFromUnderlyingAlertAction");
  return v3;
}

- (void)_initializeStateFromUnderlyingAlertAction
{
  UIAlertAction *v3;
  UIAlertAction *underlyingAlertAction;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UIAlertControllerActionViewInterfaceAction alertControllerActionView](self, "alertControllerActionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action");
  v3 = (UIAlertAction *)objc_claimAutoreleasedReturnValue();
  underlyingAlertAction = self->_underlyingAlertAction;
  self->_underlyingAlertAction = v3;

  -[UIAlertAction _setInterfaceActionRepresentation:](self->_underlyingAlertAction, "_setInterfaceActionRepresentation:", self);
  -[UIInterfaceAction setEnabled:](self, "setEnabled:", -[UIAlertAction isEnabled](self->_underlyingAlertAction, "isEnabled"));
  -[UIAlertAction title](self->_underlyingAlertAction, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceAction setTitle:](self, "setTitle:", v5);

  -[UIInterfaceAction setTitleAlignment:](self, "setTitleAlignment:", -[UIAlertAction _titleTextAlignment](self->_underlyingAlertAction, "_titleTextAlignment"));
  -[UIAlertAction _titleTextColor](self->_underlyingAlertAction, "_titleTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceAction _setTitleTextColor:](self, "_setTitleTextColor:", v6);

  -[UIAlertAction _imageTintColor](self->_underlyingAlertAction, "_imageTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceAction _setImageTintColor:](self, "_setImageTintColor:", v7);

  -[UIInterfaceAction _setIsPreferred:](self, "_setIsPreferred:", -[UIAlertAction _isPreferred](self->_underlyingAlertAction, "_isPreferred"));
  objc_msgSend(v8, "underlyingInterfaceActionRepresentationDidChange");
  self->_valid = 1;

}

- (void)invalidate
{
  _UIAlertControllerActionViewInterfaceAction *v3;
  UIAlertAction *underlyingAlertAction;
  id v5;

  self->_valid = 0;
  -[_UIAlertControllerActionViewInterfaceAction underlyingAlertAction](self, "underlyingAlertAction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_interfaceActionRepresentation");
  v3 = (_UIAlertControllerActionViewInterfaceAction *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    objc_msgSend(v5, "_setInterfaceActionRepresentation:", 0);
  underlyingAlertAction = self->_underlyingAlertAction;
  self->_underlyingAlertAction = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[_UIAlertControllerActionViewInterfaceAction invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerActionViewInterfaceAction;
  -[_UIAlertControllerActionViewInterfaceAction dealloc](&v3, sel_dealloc);
}

- (id)classificationTitle
{
  void *v2;
  void *v3;

  -[_UIAlertControllerActionViewInterfaceAction underlyingAlertAction](self, "underlyingAlertAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_descriptiveText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)leadingImage
{
  void *v2;
  void *v3;

  -[_UIAlertControllerActionViewInterfaceAction underlyingAlertAction](self, "underlyingAlertAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_typeForDeterminingViewRepresentation
{
  return 100;
}

- (int64_t)type
{
  void *v2;
  uint64_t v3;

  -[_UIAlertControllerActionViewInterfaceAction underlyingAlertAction](self, "underlyingAlertAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 == 2);
}

- (void)_action:(id)a3 changedToTitle:(id)a4
{
  -[UIInterfaceAction setTitle:](self, "setTitle:", a4);
}

- (void)_action:(id)a3 changedToTitleTextAlignment:(int64_t)a4
{
  -[UIInterfaceAction setTitleAlignment:](self, "setTitleAlignment:", a4);
}

- (void)_action:(id)a3 changedToEnabled:(BOOL)a4
{
  -[UIInterfaceAction setEnabled:](self, "setEnabled:", a4);
}

- (void)_action:(id)a3 changedToBePreferred:(BOOL)a4
{
  -[UIInterfaceAction _setIsPreferred:](self, "_setIsPreferred:", a4);
}

- (void)_action:(id)a3 updatedImageTintColor:(id)a4
{
  -[UIInterfaceAction _setImageTintColor:](self, "_setImageTintColor:", a4);
}

- (void)_action:(id)a3 updatedTitleTextColor:(id)a4
{
  -[UIInterfaceAction _setTitleTextColor:](self, "_setTitleTextColor:", a4);
}

- (UIAlertAction)underlyingAlertAction
{
  return self->_underlyingAlertAction;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAlertAction, 0);
}

@end
