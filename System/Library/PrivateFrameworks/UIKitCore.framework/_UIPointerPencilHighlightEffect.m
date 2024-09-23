@implementation _UIPointerPencilHighlightEffect

- (_UIPointerPencilHighlightEffect)init
{
  _UIPointerPencilHighlightEffect *v2;
  _UIPointerPencilHighlightEffect *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPointerPencilHighlightEffect;
  v2 = -[UIPointerHoverEffect init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIPointerHoverEffect set_tintViewTakesOnPointerShape:](v2, "set_tintViewTakesOnPointerShape:", 1);
    -[UIPointerHoverEffect set_tintViewUsesPointerMaterial:](v3, "set_tintViewUsesPointerMaterial:", 1);
  }
  return v3;
}

- (unint64_t)options
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPointerPencilHighlightEffect;
  return -[UIPointerHoverEffect options](&v3, sel_options) | 0x2000;
}

@end
