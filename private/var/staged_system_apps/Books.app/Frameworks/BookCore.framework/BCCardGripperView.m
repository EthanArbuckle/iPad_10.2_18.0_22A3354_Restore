@implementation BCCardGripperView

+ (BCCardGripperView)cardGripperViewWithStyle:(int64_t)a3
{
  return -[BCCardGripperView initWithFrame:style:]([BCCardGripperView alloc], "initWithFrame:style:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

+ (id)_buttonImageForStyle:(int64_t)a3
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 3, 12.0));
    v4 = CFSTR("xmark");
  }
  else
  {
    if (a3)
    {
      v7 = 0;
      return v7;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 3, 17.0));
    v4 = CFSTR("xmark.circle.fill");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v4, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithTintColor:renderingMode:", v6, 1));

  return v7;
}

- (BCCardGripperView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  BCCardGripperView *v5;
  BCCardGripperView *v6;
  id v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  UIView *v12;
  UIView *button;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[4];

  v30.receiver = self;
  v30.super_class = (Class)BCCardGripperView;
  v5 = -[BCCardGripperView initWithFrame:](&v30, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(v5), "_buttonImageForStyle:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithAlignmentRectInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right));

    v29 = v9;
    objc_msgSend(v9, "size");
    v6->_imageSize.width = v10;
    v6->_imageSize.height = v11;
    v12 = (UIView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v9);
    button = v6->_button;
    v6->_button = v12;

    -[BCCardGripperView addSubview:](v6, "addSubview:", v6->_button);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardGripperView widthAnchor](v6, "widthAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v6->_button, "widthAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v31[0] = v26;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardGripperView heightAnchor](v6, "heightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v6->_button, "heightAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v14));
    v31[1] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v6->_button, "centerXAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardGripperView centerXAnchor](v6, "centerXAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    v31[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v6->_button, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardGripperView centerYAnchor](v6, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    v31[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    v23 = objc_msgSend(objc_alloc((Class)UIPointerInteraction), "initWithDelegate:", v6);
    -[BCCardGripperView addInteraction:](v6, "addInteraction:", v23);

  }
  return v6;
}

- (BCCardGripperView)initWithFrame:(CGRect)a3
{
  return -[BCCardGripperView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double Width;
  double v8;
  double v9;
  double v10;
  double v11;
  char *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint v20;
  CGRect v21;
  CGRect v22;

  y = a3.y;
  x = a3.x;
  -[BCCardGripperView bounds](self, "bounds", a4);
  Width = CGRectGetWidth(v21);
  -[BCCardGripperView imageSize](self, "imageSize");
  v9 = Width / v8;
  v10 = v9 * -16.0;
  v11 = v9 * -20.0;
  v12 = (char *)objc_msgSend(UIApp, "userInterfaceLayoutDirection");
  if (v12 == (_BYTE *)&dword_0 + 1)
    v13 = v10;
  else
    v13 = v11;
  if (v12 == (_BYTE *)&dword_0 + 1)
    v14 = v11;
  else
    v14 = v10;
  -[BCCardGripperView bounds](self, "bounds");
  v22.origin.x = v14 + v15;
  v22.origin.y = v10 + v16;
  v22.size.width = v17 - (v14 + v13);
  v22.size.height = v18 - (v10 + v11);
  v20.x = x;
  v20.y = y;
  return CGRectContainsPoint(v22, v20);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityParentForFindingScrollParent
{
  id v3;
  void *v4;
  id v5;
  objc_super v7;

  v3 = -[BCCardGripperView _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("BCCardSetWideTouchScrollView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)BCCardGripperView;
    v5 = -[BCCardGripperView _accessibilityParentForFindingScrollParent](&v7, "_accessibilityParentForFindingScrollParent");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return v4;
}

- (id)accessibilityLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = IMCommonCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Close"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  return v4;
}

- (id)accessibilityHint
{
  id v2;
  void *v3;
  void *v4;

  v2 = IMCommonCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Double tap to dismiss the popover"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCCardGripperView;
  return UIAccessibilityTraitButton | -[BCCardGripperView accessibilityTraits](&v3, "accessibilityTraits");
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardGripperView accessibilityDelegate](self, "accessibilityDelegate"));
  objc_msgSend(v3, "accessibilityDidActivateGripperView:", self);

  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  -[BCCardGripperView bounds](self, "bounds", a3, a4, a5);
  return +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  -[BCCardGripperView bounds](self, "bounds", a3, a4);
  v7 = fmax(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", (v5 - v7) * 0.5, (v6 - v7) * 0.5, v7, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v8));

  v10 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerLiftEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v11, v9));

  return v12;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_11178;
  v7[3] = &unk_28BCD0;
  v7[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardGripperView actionProvider](self, "actionProvider", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, v7, v4));

  return v5;
}

- (BCCardGripperViewAccessibilityDelegate)accessibilityDelegate
{
  return (BCCardGripperViewAccessibilityDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityDelegate);
}

- (void)setAccessibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityDelegate, a3);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIViewController)menuViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_menuViewController);
}

- (void)setMenuViewController:(id)a3
{
  objc_storeWeak((id *)&self->_menuViewController, a3);
}

- (id)actionProvider
{
  return self->_actionProvider;
}

- (void)setActionProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIView)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_actionProvider, 0);
  objc_destroyWeak((id *)&self->_menuViewController);
  objc_destroyWeak((id *)&self->_accessibilityDelegate);
}

@end
