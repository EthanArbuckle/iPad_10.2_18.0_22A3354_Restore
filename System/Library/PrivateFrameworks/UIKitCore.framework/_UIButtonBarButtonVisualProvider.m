@implementation _UIButtonBarButtonVisualProvider

- (UIEdgeInsets)buttonAlignmentRectInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)buttonIntrinsicContentSize:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -1.0;
  v4 = -1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)buttonEnabledState:(id)a3 forRequestedState:(BOOL)a4
{
  return a4;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();

  return v4 == v5;
}

- (Class)buttonBarButtonClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (id)visualProviderForIdiom:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)_MergedGlobals_23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_barButtonItem);
}

- (id)buttonSpringLoadedInteractionBehavior
{
  return 0;
}

+ (void)registerPlatformVisualProviderClass:(Class)a3 forIdiom:(int64_t)a4
{
  void *v6;
  id v7;

  if (qword_1ECD7B6F8 != -1)
    dispatch_once(&qword_1ECD7B6F8, &__block_literal_global_48);
  v6 = (void *)_MergedGlobals_23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, v7);

}

- (Class)buttonControlClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (_UIButtonBarButton)button
{
  return self->_button;
}

- (BOOL)supportsBackButtons
{
  return 0;
}

- (UIView)backIndicatorView
{
  return 0;
}

- (UIView)contentView
{
  return 0;
}

- (BOOL)backButtonConstraintsActive
{
  return 0;
}

- (BOOL)backButtonMaskEnabled
{
  return 0;
}

- (BOOL)buttonSelectionState:(id)a3 forRequestedState:(BOOL)a4
{
  return a4;
}

- (BOOL)buttonHighlitedState:(id)a3 forRequestedState:(BOOL)a4
{
  return a4;
}

- (BOOL)buttonHeldState:(id)a3 forRequestedState:(BOOL)a4
{
  return a4;
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarButton.m"), 167, CFSTR("Failure attempting to configure a view for a UIBarButtonItem from visual style %@"), self);

}

- (void)buttonLayoutSubviews:(id)a3 baseImplementation:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (CGSize)buttonBackgroundSize:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a3, "bounds");
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGSize)buttonImageViewSize:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIView)alignmentViewForStaticNavBarButtonLeading
{
  return 0;
}

- (UIView)alignmentViewForStaticNavBarButtonTrailing
{
  return 0;
}

- (id)pointerPreviewParameters
{
  return (id)objc_opt_new();
}

- (CGPoint)pointerPreviewCenter
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[UIView bounds](self->_button, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v8 = MidX;
  result.y = MidY;
  result.x = v8;
  return result;
}

- (BOOL)shouldSuppressPointerSpecularFilter
{
  return 0;
}

- (id)pointerShapeInContainer:(id)a3
{
  _UIButtonBarButton *button;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  button = self->_button;
  v4 = a3;
  -[UIView bounds](button, "bounds");
  -[UIView convertRect:toView:](button, "convertRect:toView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v6, v8, v10, v12);
}

- (id)matchingPointerShapeForView:(id)a3 rect:(CGRect)a4 inContainer:(id)a5
{
  objc_msgSend(a3, "convertRect:toView:", a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
}

- (BOOL)shouldLift
{
  return 0;
}

- (id)focusEffect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  -[_UIButtonBarButtonVisualProvider pointerShapeInContainer:](self, "pointerShapeInContainer:", self->_button);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "cornerRadius");
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIFocusHaloEffect effectWithPath:](UIFocusHaloEffect, "effectWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)buttonContextMenuInteractionConfiguration
{
  return 0;
}

- (id)buttonContextMenuTargetedPreview
{
  return 0;
}

- (id)buttonContextMenuStyleFromDefaultStyle:(id)a3
{
  return a3;
}

- (CGPoint)menuAnchorPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UIView bounds](self->_button, "bounds");
  v4 = v3 + v2 * 0.5;
  v7 = v6 + v5 * 0.5;
  result.y = v7;
  result.x = v4;
  return result;
}

- (BOOL)canUpdateMenuInPlace
{
  return 0;
}

- (id)buttonSpringLoadedInteractionEffect
{
  return 0;
}

- (id)symbolImageView
{
  return 0;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
