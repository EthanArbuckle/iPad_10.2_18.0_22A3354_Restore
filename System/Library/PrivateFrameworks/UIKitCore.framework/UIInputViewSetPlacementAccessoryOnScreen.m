@implementation UIInputViewSetPlacementAccessoryOnScreen

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UIInputViewSetPlacementAccessoryOnScreen *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "_rootInputWindowController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "placement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "subPlacements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (UIInputViewSetPlacementAccessoryOnScreen *)objc_claimAutoreleasedReturnValue();

  if (v14 == self)
  {
    v17 = v9;
    if (!v17)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(v8, "inputAccessoryView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v8, "inputView");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = (void *)v18;
      else
        v20 = v9;
      v17 = v20;

    }
    if (!v17)
      goto LABEL_16;
  }
  if (!objc_msgSend(v17, "isDescendantOfView:", v10))
  {
LABEL_16:
    v24 = 0;
    goto LABEL_17;
  }
  v21 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(v8, "inputAccessoryView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    v23 = 4;
  else
    v23 = 3;
  objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 4, 0, v17, v23, 1.0, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v24;
}

- (BOOL)showsInputViews
{
  return 1;
}

- (BOOL)accessoryViewWillAppear
{
  return 1;
}

- (BOOL)showsEditItems
{
  return (_os_feature_enabled_impl() & 1) == 0
      && (_os_feature_enabled_impl() & 1) == 0
      && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v4)
  {
    objc_msgSend(v5, "inputAccessoryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "inputAccessoryView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "intrinsicContentSize");
      v12 = v11;

      if (v12 == -1.0)
      {
        objc_msgSend(v6, "inputAccessoryView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        v12 = v14;

      }
      v8 = v8 + v12;
    }
  }
  v15 = *MEMORY[0x1E0C9D538];
  v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);

  v17 = v15;
  v18 = v16;
  v19 = v7;
  v20 = v8;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end
