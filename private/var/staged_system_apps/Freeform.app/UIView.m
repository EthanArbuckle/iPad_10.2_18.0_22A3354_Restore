@implementation UIView

- (BOOL)crl_isPresetRenderingInvalid
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, "crl_isPresetRenderingInvalid");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)crl_prepareForPresetRendering
{
  -[UIView crl_setPresetRenderingInvalid:](self, "crl_setPresetRenderingInvalid:", 0);
}

- (void)crl_setPresetRenderingInvalid:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, "crl_isPresetRenderingInvalid", v4, (void *)1);

}

- (id)crl_constraintsToAllSidesOfItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 1, 0, v4, 1, 1.0, 0.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 2, 0, v4, 2, 1.0, 0.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 3, 0, v4, 3, 1.0, 0.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, v4, 4, 1.0, 0.0));

  v11[0] = v5;
  v11[1] = v6;
  v11[2] = v7;
  v11[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 4));

  return v9;
}

+ (void)crl_animateWithKeyboardNotification:(id)a3 animations:(id)a4
{
  _objc_msgSend(a1, "crl_animateWithKeyboardNotification:options:animations:completion:", a3, 0, a4, 0);
}

+ (void)crl_animateWithKeyboardNotification:(id)a3 animations:(id)a4 completion:(id)a5
{
  _objc_msgSend(a1, "crl_animateWithKeyboardNotification:options:animations:completion:", a3, 0, a4, a5);
}

+ (void)crl_animateWithKeyboardNotification:(id)a3 options:(unint64_t)a4 animations:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", UIKeyboardAnimationCurveUserInfoKey));
  v16 = objc_msgSend(v15, "integerValue");

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A50E0;
  v18[3] = &unk_101233348;
  v19 = v9;
  v20 = v16;
  v17 = v9;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", a4, v18, v10, v14, 0.0);

}

- (CRLiOSWindowWrapper)crl_windowWrapper
{
  return (CRLiOSWindowWrapper *)+[CRLiOSWindowWrapper windowWrapperForView:assert:](CRLiOSWindowWrapper, "windowWrapperForView:assert:", self, 0);
}

- (BOOL)crlaxServesAsContainingParentForOrdering
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415750);
}

- (void)crlaxSetServesAsContainingParentForOrdering:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415750, a3);
}

- (id)crlaxParentFindReplaceController
{
  return __CRLAccessibilityGetAssociatedWeakObject(self, &unk_101415751);
}

- (void)crlaxSetParentFindReplaceController:(id)a3
{
  __CRLAccessibilitySetAssociatedWeakObject(self, &unk_101415751, (uint64_t)a3);
}

- (CGRect)crlaxFrameFromBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  -[UIView convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);
  objc_msgSend(v8, "convertRect:toWindow:", 0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGPoint)crlaxFramePointFromBoundsPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  objc_msgSend(v6, "convertPoint:toWindow:", v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (double)crlaxScreenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screen"));
  objc_msgSend(v3, "scale");
  v5 = v4;

  return v5;
}

+ (BOOL)crlaxView:(id)a3 isDescendantOfView:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  v9 = v7 != 0;
  v10 = v7;
  if (v7 != v6 && v7)
  {
    v10 = v7;
    do
    {
      v11 = v10;
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));

      v9 = v10 != 0;
    }
    while (v10 != v6 && v10);
  }

  return v9;
}

- (UIView)crlaxFirstAccessibleSubview
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  char v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));

  if (v3)
  {
    v16 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("_accessibleSubviews")));
    objc_opt_class(NSArray, v5);
    v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v16);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (v16)
      abort();
    v9 = (void *)v8;

    objc_opt_class(NSArray, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0 && objc_msgSend(v9, "count"))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1003A20D8;
      v14[3] = &unk_101257A90;
      v15 = 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxObjectsPassingTest:", v14));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

    }
    else
    {
      v3 = 0;
    }

  }
  return (UIView *)v3;
}

- (void)crl_activateEqualConstraintsForView:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  v4 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v18[0] = v15;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v18[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v18[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v18[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

@end
