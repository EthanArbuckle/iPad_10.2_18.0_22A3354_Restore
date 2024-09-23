@implementation UIInputViewSetPlacementAssistantOnScreen

+ (id)placementForDraggingAssistant
{
  id result;

  result = (id)objc_msgSend(a1, "placement");
  *((_BYTE *)result + 56) = 1;
  return result;
}

- (id)subPlacements
{
  void *v3;
  void *v4;
  void *v5;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSetPlacementAssistantOnScreen subPlacementsForInputViewSet:](self, "subPlacementsForInputViewSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)subPlacementsForInputViewSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIInputViewSetPlacementAccessoryOnScreen *cachedSecondaryPlacement;
  UIInputViewSetPlacementAccessoryOnScreen *v9;
  UIInputViewSetPlacementAccessoryOnScreen *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualModeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "shouldShowWithinAppWindow") & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v4, "inputAccessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
  if (!cachedSecondaryPlacement)
  {
    +[UIInputViewSetPlacement placement](UIInputViewSetPlacementAccessoryOnScreen, "placement");
    v9 = (UIInputViewSetPlacementAccessoryOnScreen *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cachedSecondaryPlacement;
    self->_cachedSecondaryPlacement = v9;

    cachedSecondaryPlacement = self->_cachedSecondaryPlacement;
  }
  v13[0] = cachedSecondaryPlacement;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v11;
}

- (unint64_t)indexForPurpose:(unint64_t)a3
{
  unint64_t v3;
  void *v4;

  v3 = 0;
  if ((uint64_t)a3 > 99)
  {
    if (a3 == 100 || a3 == 102)
      return v3;
    if (a3 == 101)
    {
LABEL_8:
      -[UIInputViewSetPlacementAssistantOnScreen subPlacements](self, "subPlacements");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v4 != 0;

      return v3;
    }
    return 1;
  }
  if (a3 > 4)
    return 1;
  if (((1 << a3) & 0xD) == 0)
    goto LABEL_8;
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)infoWithPoint:(CGPoint)a3 isCompact:(BOOL)a4 frame:(CGRect)a5 position:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  CGPoint v19;
  _QWORD v20[4];
  _QWORD v21[5];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v21[4] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("Origin");
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v19, "{CGPoint=dd}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v20[1] = CFSTR("IsCompact");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  v20[2] = 0x1E174E720;
  *(CGFloat *)v18 = x;
  *(CGFloat *)&v18[1] = y;
  *(CGFloat *)&v18[2] = width;
  *(CGFloat *)&v18[3] = height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v18, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  v20[3] = 0x1E174E740;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  -[UIInputViewSetPlacementAssistantOnScreen isFloatingAssistantView](self, "isFloatingAssistantView");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isInputViewPlaceholder"))
  {
    v20.receiver = self;
    v20.super_class = (Class)UIInputViewSetPlacementAssistantOnScreen;
    -[UIInputViewSetPlacement verticalConstraintForInputViewSet:hostView:containerView:](&v20, sel_verticalConstraintForInputViewSet_hostView_containerView_, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "inputAssistantView");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12
      && (v13 = (void *)v12,
          objc_msgSend(v8, "inputAssistantView"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isDescendantOfView:", v10),
          v14,
          v13,
          v15))
    {
      objc_msgSend(v10, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputAssistantView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSetPlacementAssistantOnScreen verticalOffset](self, "verticalOffset");
      objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (double)verticalOffset
{
  _BOOL4 v2;
  double result;

  v2 = -[UIInputViewSetPlacementAssistantOnScreen isFloatingAssistantView](self, "isFloatingAssistantView");
  result = *(double *)&UIFloatingAssistantBottomMargin;
  if (!v2)
    return 0.0;
  return result;
}

- (BOOL)isFloatingAssistantView
{
  int v2;

  if (+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled")
    || (_os_feature_enabled_impl() & 1) != 0
    || (v2 = _os_feature_enabled_impl()) != 0)
  {
    LOBYTE(v2) = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  return v2;
}

- (BOOL)showsInputViews
{
  return 1;
}

- (BOOL)showsInputOrAssistantViews
{
  return 1;
}

- (BOOL)showsEditItems
{
  return !-[UIInputViewSetPlacementAssistantOnScreen isFloatingAssistantView](self, "isFloatingAssistantView");
}

- (BOOL)inputViewWillAppear
{
  return 1;
}

- (double)inputAssistantViewHeightForInputViewSet:(id)a3
{
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacementAssistantOnScreen;
  -[UIInputViewSetPlacement inputAssistantViewHeightForInputViewSet:](&v8, sel_inputAssistantViewHeightForInputViewSet_, a3);
  v4 = v3;
  if (v3 > 0.0 && !+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
      || (v5 = +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton"), v6 = 14.0, v5))
    {
      v6 = 0.0;
    }
    return v4 + v6;
  }
  return v4;
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "inputAssistantView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[UIInputViewSetPlacementAssistantOnScreen inputAssistantViewHeightForInputViewSet:](self, "inputAssistantViewHeightForInputViewSet:", v6);
  v15 = v14;
  if (v4)
  {
    objc_msgSend(v6, "inputAccessoryView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v6, "inputAccessoryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intrinsicContentSize");
      v19 = v18;

      if (v19 == -1.0)
      {
        objc_msgSend(v6, "inputAccessoryView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "frame");
        v19 = v21;

      }
      v15 = v15 + v19;
    }
  }
  if (-[UIInputViewSetPlacementAssistantOnScreen isFloatingAssistantView](self, "isFloatingAssistantView"))
  {
    if (UIInputAssistantViewIsHidden())
    {
      v13 = 0.0;
      v9 = -1.0;
    }
    v11 = 1.0;
  }

  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (UIEdgeInsets)inputAccessoryViewPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isInteractive
{
  return self->isInteractive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPlacements, 0);
  objc_storeStrong((id *)&self->_cachedSecondaryPlacement, 0);
}

@end
