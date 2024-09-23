@implementation _UIInputViewSetPlacementDragToDismiss

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)placementWithOffset:(double)a3 dismissKeyboardOnly:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;

  v4 = a4;
  objc_msgSend(a1, "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOffset:", a3);
  objc_msgSend(v6, "setDismissKeyboardOnly:", v4);
  return v6;
}

- (_UIInputViewSetPlacementDragToDismiss)initWithCoder:(id)a3
{
  id v4;
  _UIInputViewSetPlacementDragToDismiss *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIInputViewSetPlacementDragToDismiss;
  v5 = -[UIInputViewSetPlacement initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("Offset"));
    v5->_offset = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double offset;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIInputViewSetPlacementDragToDismiss;
  v4 = a3;
  -[UIInputViewSetPlacement encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  offset = self->_offset;
  *(float *)&offset = offset;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("Offset"), offset, v6.receiver, v6.super_class);

}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  objc_super v29;

  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_UIInputViewSetPlacementDragToDismiss;
  -[UIInputViewSetPlacement verticalConstraintForInputViewSet:hostView:containerView:](&v29, sel_verticalConstraintForInputViewSet_hostView_containerView_, v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intersectionHeightForWindowScene:", 0);
  v12 = v11;
  v13 = 0.0;
  v14 = 0.0;
  if (!-[_UIInputViewSetPlacementDragToDismiss dismissKeyboardOnly](self, "dismissKeyboardOnly"))
  {
    objc_msgSend(v10, "heightForRemoteIAVPlaceholderIfNecessary");
    v14 = v15;
  }
  objc_msgSend(v8, "inputView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v8, "inputView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v13 = v18;

  }
  objc_msgSend(v8, "inputAssistantView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0.0;
  v21 = 0.0;
  if (v19)
  {
    objc_msgSend(v8, "inputAssistantView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v21 = v23;

  }
  if (!-[_UIInputViewSetPlacementDragToDismiss dismissKeyboardOnly](self, "dismissKeyboardOnly"))
  {
    objc_msgSend(v8, "inputAccessoryView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v8, "inputAccessoryView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v20 = v26;

    }
  }
  -[_UIInputViewSetPlacementDragToDismiss offset](self, "offset");
  objc_msgSend(v9, "setConstant:", v27 - (v13 + v21 + v20 - (v12 + v14)));

  return v9;
}

- (BOOL)isInteractive
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIInputViewSetPlacementDragToDismiss;
  if (-[UIInputViewSetPlacement isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_offset == v4[6];
  else
    v5 = 0;

  return v5;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

- (BOOL)dismissKeyboardOnly
{
  return self->_dismissKeyboardOnly;
}

- (void)setDismissKeyboardOnly:(BOOL)a3
{
  self->_dismissKeyboardOnly = a3;
}

@end
