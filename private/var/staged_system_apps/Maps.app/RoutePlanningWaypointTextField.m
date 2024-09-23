@implementation RoutePlanningWaypointTextField

- (RoutePlanningWaypointTextField)initWithFrame:(CGRect)a3
{
  RoutePlanningWaypointTextField *v3;
  RoutePlanningWaypointTextField *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RoutePlanningWaypointTextField;
  v3 = -[RoutePlanningWaypointTextField initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RoutePlanningWaypointTextField _setSupportsKeyboardNavigationForSuggestions:](v3, "_setSupportsKeyboardNavigationForSuggestions:", 1);
    if (sub_1002A8AA0(v4) == 5)
    {
      v5 = objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", v4, "_hoverGesture:");
      -[RoutePlanningWaypointTextField addGestureRecognizer:](v4, "addGestureRecognizer:", v5);

    }
    else
    {
      -[RoutePlanningWaypointTextField setClearButtonMode:](v4, "setClearButtonMode:", 1);
    }
  }
  return v4;
}

- (void)_hoverGesture:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == (id)1
    && -[RoutePlanningWaypointTextField clearButtonMode](self, "clearButtonMode") != (id)3)
  {
    v4 = 3;
    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "state") == (id)3 || objc_msgSend(v5, "state") == (id)4)
    && -[RoutePlanningWaypointTextField clearButtonMode](self, "clearButtonMode") == (id)3)
  {
    v4 = 0;
LABEL_8:
    -[RoutePlanningWaypointTextField setClearButtonMode:](self, "setClearButtonMode:", v4);
  }

}

- (void)didBeginEditingFromTouch:(BOOL)a3
{
  self->_didBeginEditingFromTouch = a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  self->_isHandlingTouch = 1;
  v6 = a4;
  v7 = a3;
  v8 = -[RoutePlanningWaypointTextField isEditing](self, "isEditing");
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningWaypointTextField;
  -[RoutePlanningWaypointTextField touchesBegan:withEvent:](&v12, "touchesBegan:withEvent:", v7, v6);

  if (sub_1002A8AA0(self) == 5 && v8 && !self->_didBeginEditingFromTouch)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField delegate](self, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "textFieldDidBeginEditing:");

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField delegate](self, "delegate"));
      objc_msgSend(v11, "textFieldDidBeginEditing:", self);

    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningWaypointTextField;
  -[RoutePlanningWaypointTextField touchesEnded:withEvent:](&v5, "touchesEnded:withEvent:", a3, a4);
  self->_isHandlingTouch = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningWaypointTextField;
  -[RoutePlanningWaypointTextField touchesCancelled:withEvent:](&v5, "touchesCancelled:withEvent:", a3, a4);
  self->_isHandlingTouch = 0;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (sub_1002A8AA0(self) == 5)
  {
    sub_1002A8AA0(self);
    v3 = 0.0;
    v4 = 10.0;
    v5 = 0.0;
    v6 = 10.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RoutePlanningWaypointTextField;
    -[RoutePlanningWaypointTextField alignmentRectInsets](&v7, "alignmentRectInsets");
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double MidY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

  if (v9 == (id)1)
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField rightView](self, "rightView"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField leftView](self, "leftView"));
  v11 = v10;
  v12 = CGRectZero.origin.y;
  objc_msgSend(v10, "intrinsicContentSize");
  v14 = v13;
  v16 = v15;
  sub_1002A8AA0(self);
  v17 = x + 10.0;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MidY = CGRectGetMidY(v25);
  v26.origin.x = x + 10.0;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  v19 = CGRectGetHeight(v26);
  if (sub_1002A8AA0(self) == 5)
  {
    sub_1002A8AA0(self);
    v20 = -10.0;
    if (v9 != (id)1)
      v20 = 10.0;
    v17 = v17 + v20;
  }

  v21 = v17;
  v22 = round(MidY + v19 * -0.5);
  v23 = v14;
  v24 = v16;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double MidY;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

  if (v9 == (id)1)
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField leftView](self, "leftView"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField rightView](self, "rightView"));
  v11 = v10;
  v12 = CGRectZero.origin.y;
  objc_msgSend(v10, "intrinsicContentSize");
  v14 = v13;
  v16 = v15;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v17 = CGRectGetMaxX(v26) - v14;
  sub_1002A8AA0(self);
  v18 = v17 + -10.0;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MidY = CGRectGetMidY(v27);
  v28.origin.x = v18;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  v20 = CGRectGetHeight(v28);
  if (sub_1002A8AA0(self) == 5)
  {
    sub_1002A8AA0(self);
    v21 = 10.0;
    if (v9 != (id)1)
      v21 = -10.0;
    v18 = v21 + v18;
  }

  v22 = v18;
  v23 = round(MidY + v20 * -0.5);
  v24 = v14;
  v25 = v16;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (double)_textMinimumLeadingMargin
{
  uint64_t v3;
  double result;

  v3 = sub_1002A8AA0(self);
  result = 0.0;
  if (v3 == 5)
  {
    sub_1002A8AA0(self);
    return 10.0;
  }
  return result;
}

- (double)_textMinimumTrailingMargin
{
  uint64_t v3;
  double result;

  v3 = sub_1002A8AA0(self);
  result = 0.0;
  if (v3 == 5)
  {
    sub_1002A8AA0(self);
    return 10.0;
  }
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double MaxX;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  CGRect v52;
  CGRect v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double rect;
  CGFloat v59;
  double v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  sub_1002A8AA0(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

  v60 = y;
  -[RoutePlanningWaypointTextField leftViewRectForBounds:](self, "leftViewRectForBounds:", x, y, width, height);
  v10 = v61.origin.x;
  v11 = v61.origin.y;
  v12 = v61.size.width;
  v13 = v61.size.height;
  v14 = CGRectGetWidth(v61);
  v15 = 0.0;
  if (v14 > 0.0)
  {
    v62.origin.x = v10;
    v62.origin.y = v11;
    v62.size.width = v12;
    v62.size.height = v13;
    v15 = CGRectGetMaxX(v62) + 8.0;
  }
  v57 = v15;
  -[RoutePlanningWaypointTextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  rect = width;
  v59 = height;
  -[RoutePlanningWaypointTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", x, v60, width, height);
  v51 = v24;
  v54 = v25;
  v55 = v26;
  v56 = v27;
  v63.origin.x = v17;
  v63.origin.y = v19;
  v63.size.width = v21;
  v63.size.height = v23;
  v28 = CGRectGetWidth(v63);
  if (v9 == (id)1)
  {
    v29 = 0.0;
    v30 = 0.0;
    if (v28 > 0.0)
    {
      v64.origin.x = v17;
      v64.origin.y = v19;
      v64.size.width = v21;
      v64.size.height = v23;
      v31 = CGRectGetWidth(v64);
      v65.origin.x = x;
      v65.size.height = v59;
      v65.origin.y = v60;
      v65.size.width = rect;
      v32 = v31 + CGRectGetWidth(v65);
      v66.origin.x = v17;
      v66.origin.y = v19;
      v66.size.width = v21;
      v66.size.height = v23;
      v30 = v32 - CGRectGetMaxX(v66) + 8.0;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField _clearButton](self, "_clearButton", v51, v54, v55, v56));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "superview"));
    v35 = v57;
    if (v34)
      v29 = CGRectGetMaxX(v52) + 8.0;

    if (v57 <= v29)
      v35 = v29;
  }
  else
  {
    v30 = 0.0;
    v36 = 0.0;
    if (v28 > 0.0)
    {
      v67.origin.x = x;
      v67.size.height = v59;
      v67.origin.y = v60;
      v67.size.width = rect;
      MaxX = CGRectGetMaxX(v67);
      v68.origin.x = v17;
      v68.origin.y = v19;
      v68.size.width = v21;
      v68.size.height = v23;
      v36 = MaxX - CGRectGetMinX(v68) + 8.0;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTextField _clearButton](self, "_clearButton", v51, v54, v55, v56));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "superview"));
    v35 = v57;
    if (v39)
    {
      v69.origin.x = x;
      v69.size.height = v59;
      v69.origin.y = v60;
      v69.size.width = rect;
      v40 = CGRectGetMaxX(v69);
      v30 = v40 - CGRectGetMinX(v53) + 8.0;
    }

    if (v36 > v30)
      v30 = v36;
  }
  -[RoutePlanningWaypointTextField _textMinimumLeadingMargin](self, "_textMinimumLeadingMargin");
  v42 = v41;
  -[RoutePlanningWaypointTextField _textMinimumTrailingMargin](self, "_textMinimumTrailingMargin");
  if (v9 == (id)1)
    v44 = v43;
  else
    v44 = v42;
  if (v9 == (id)1)
    v43 = v42;
  if (v35 <= v44)
    v45 = v44;
  else
    v45 = v35;
  if (v30 <= v43)
    v46 = v43;
  else
    v46 = v30;
  v47 = x + v45;
  v48 = v60 + 0.0;
  v49 = rect - (v45 + v46);
  v50 = v59;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[RoutePlanningWaypointTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[RoutePlanningWaypointTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)RoutePlanningWaypointTextField;
  -[RoutePlanningWaypointTextField clearButtonRectForBounds:](&v19, "clearButtonRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v13 = objc_msgSend(v12, "userInterfaceLayoutDirection");

  if (sub_1002A8AA0(self) == 5)
  {
    sub_1002A8AA0(self);
    v14 = -10.0;
    if (v13 == (id)1)
      v14 = 10.0;
    v5 = v5 + v14;
  }
  v15 = v5;
  v16 = v7;
  v17 = v9;
  v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)isHandlingTouch
{
  return self->_isHandlingTouch;
}

@end
