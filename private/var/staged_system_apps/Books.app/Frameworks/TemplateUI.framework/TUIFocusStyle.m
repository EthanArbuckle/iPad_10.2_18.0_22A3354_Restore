@implementation TUIFocusStyle

+ (id)defaultFocusStyle
{
  return objc_alloc_init((Class)a1);
}

- (TUIFocusStyle)init
{
  TUIFocusStyle *v2;
  TUIFocusStyle *v3;
  __int128 v4;
  UIColor *color;
  NSString *groupIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIFocusStyle;
  v2 = -[TUIFocusStyle init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v2->_insets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v2->_insets.bottom = v4;
    v2->_effect = 1;
    v2->_cornerRadius = 0.0;
    color = v2->_color;
    v2->_color = 0;
    v2->_continuousCurve = 1;

    groupIdentifier = v3->_groupIdentifier;
    v3->_groupIdentifier = (NSString *)CFSTR("default");

  }
  return v3;
}

- (TUIFocusStyle)initWithOther:(id)a3
{
  id v4;
  TUIFocusStyle *v5;
  TUIFocusStyle *v6;
  __int128 v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIFocusStyle;
  v5 = -[TUIFocusStyle init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    v5->_effect = *((_QWORD *)v4 + 2);
    v7 = *((_OWORD *)v4 + 4);
    *(_OWORD *)&v5->_insets.top = *((_OWORD *)v4 + 3);
    *(_OWORD *)&v5->_insets.bottom = v7;
    v5->_cornerRadius = *((double *)v4 + 3);
    v5->_continuousCurve = *((_BYTE *)v4 + 8);
    objc_storeStrong((id *)&v5->_color, *((id *)v4 + 4));
    objc_storeStrong((id *)&v6->_groupIdentifier, *((id *)v4 + 5));
  }

  return v6;
}

- (TUIFocusStyle)focusStyleWithEffect:(int64_t)a3
{
  TUIFocusStyle *v4;
  TUIFocusStyle *v5;

  v4 = self;
  if (v4->_effect != a3)
  {
    v5 = -[TUIFocusStyle initWithOther:]([TUIFocusStyle alloc], "initWithOther:", v4);

    v5->_effect = a3;
    v4 = v5;
  }
  return v4;
}

- (TUIFocusStyle)focusStyleWithInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  TUIFocusStyle *v7;
  TUIFocusStyle *v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  if (v7->_insets.left != left || v7->_insets.top != top || v7->_insets.right != right || v7->_insets.bottom != bottom)
  {
    v11 = -[TUIFocusStyle initWithOther:]([TUIFocusStyle alloc], "initWithOther:", v7);

    v11->_insets.top = top;
    v11->_insets.left = left;
    v7 = v11;
    v11->_insets.bottom = bottom;
    v11->_insets.right = right;
  }
  return v7;
}

- (TUIFocusStyle)focusStyleWithCornerRadius:(double)a3
{
  TUIFocusStyle *v4;
  TUIFocusStyle *v5;

  v4 = self;
  if (v4->_cornerRadius != a3)
  {
    v5 = -[TUIFocusStyle initWithOther:]([TUIFocusStyle alloc], "initWithOther:", v4);

    v5->_cornerRadius = a3;
    v4 = v5;
  }
  return v4;
}

- (TUIFocusStyle)focusStyleWithContinuousCurve:(BOOL)a3
{
  _BOOL4 v3;
  TUIFocusStyle *v4;
  TUIFocusStyle *v5;

  v3 = a3;
  v4 = self;
  if (v4->_continuousCurve != v3)
  {
    v5 = -[TUIFocusStyle initWithOther:]([TUIFocusStyle alloc], "initWithOther:", v4);

    v5->_continuousCurve = v3;
    v4 = v5;
  }
  return v4;
}

- (TUIFocusStyle)focusStyleWithColor:(id)a3
{
  UIColor *v5;
  TUIFocusStyle *v6;
  UIColor *color;
  TUIFocusStyle *v8;

  v5 = (UIColor *)a3;
  v6 = self;
  color = v6->_color;
  if (color != v5 && (-[UIColor isEqual:](color, "isEqual:", v5) & 1) == 0)
  {
    v8 = -[TUIFocusStyle initWithOther:]([TUIFocusStyle alloc], "initWithOther:", v6);

    objc_storeStrong((id *)&v8->_color, a3);
    v6 = v8;
  }

  return v6;
}

- (TUIFocusStyle)focusStyleWithGroupIdentifier:(id)a3
{
  NSString *v5;
  TUIFocusStyle *v6;
  NSString *groupIdentifier;
  TUIFocusStyle *v8;

  v5 = (NSString *)a3;
  v6 = self;
  groupIdentifier = v6->_groupIdentifier;
  if (groupIdentifier != v5 && !-[NSString isEqualToString:](groupIdentifier, "isEqualToString:", v5))
  {
    v8 = -[TUIFocusStyle initWithOther:]([TUIFocusStyle alloc], "initWithOther:", v6);

    objc_storeStrong((id *)&v8->_groupIdentifier, a3);
    v6 = v8;
  }

  return v6;
}

- (CGRect)erasableBoundsWithBounds:(CGRect)a3
{
  CGFloat v3;
  UIEdgeInsets *p_insets;
  CGFloat *p_left;
  CGFloat *p_bottom;
  CGFloat *p_right;
  CGRect v8;

  v3 = 0.0;
  switch(self->_effect)
  {
    case 1:
    case 3:
      p_insets = &self->_insets;
      p_left = &self->_insets.left;
      p_bottom = &self->_insets.bottom;
      p_right = &self->_insets.right;
      v3 = -3.0;
      break;
    case 2:
    case 4:
      p_insets = &self->_insets;
      p_left = &self->_insets.left;
      p_bottom = &self->_insets.bottom;
      p_right = &self->_insets.right;
      break;
    default:
      p_insets = (UIEdgeInsets *)&UIEdgeInsetsZero;
      p_right = &UIEdgeInsetsZero.right;
      p_bottom = &UIEdgeInsetsZero.bottom;
      p_left = &UIEdgeInsetsZero.left;
      break;
  }
  v8.origin.x = a3.origin.x + *p_left;
  v8.origin.y = a3.origin.y + p_insets->top;
  v8.size.width = a3.size.width - (*p_right + *p_left);
  v8.size.height = a3.size.height - (*p_bottom + p_insets->top);
  return CGRectInset(v8, v3, v3);
}

- (int64_t)effect
{
  return self->_effect;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)continuousCurve
{
  return self->_continuousCurve;
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
