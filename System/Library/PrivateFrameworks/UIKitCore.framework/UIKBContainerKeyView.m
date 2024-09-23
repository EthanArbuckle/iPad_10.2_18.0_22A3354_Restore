@implementation UIKBContainerKeyView

- (UIKBContainerKeyView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  UIKBContainerKeyView *v13;
  UIKBContainerKeyView *v14;
  UIKBKeyView *v15;
  uint64_t v16;
  UIKBKeyView *keyView;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UIKBContainerKeyView;
  v13 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    -[UIView setOpaque:](v13, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
    v15 = [UIKBKeyView alloc];
    -[UIView bounds](v14, "bounds");
    v16 = -[UIKBKeyView initWithFrame:keyplane:key:](v15, "initWithFrame:keyplane:key:", v11, v12);
    keyView = v14->_keyView;
    v14->_keyView = (UIKBKeyView *)v16;

    -[UIKBKeyView setContainedInDynamicKey:](v14->_keyView, "setContainedInDynamicKey:", -[UIKBKeyView isDynamicKey](v14, "isDynamicKey"));
    -[UIView addSubview:](v14, "addSubview:", v14->_keyView);
  }

  return v14;
}

- (void)setScreenTraits:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKBContainerKeyView;
  v4 = a3;
  -[UIKBKeyView setScreenTraits:](&v5, sel_setScreenTraits_, v4);
  -[UIKBKeyView setScreenTraits:](self->_keyView, "setScreenTraits:", v4, v5.receiver, v5.super_class);

}

- (BOOL)requiresSublayers
{
  return 0;
}

- (BOOL)hasRendered
{
  return -[UIKBKeyView hasRendered](self->_keyView, "hasRendered");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKBContainerKeyView;
  -[UIView setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[UIView setNeedsDisplay](self->_keyView, "setNeedsDisplay");
}

- (void)updateForKeyplane:(id)a3 key:(id)a4
{
  -[UIKBKeyView updateForKeyplane:key:](self->_keyView, "updateForKeyplane:key:", a3, a4);
}

- (void)dimKeys:(id)a3
{
  -[UIKBKeyView dimKeys:](self->_keyView, "dimKeys:", a3);
}

- (void)changeBackgroundToEnabled
{
  -[UIKBKeyView changeBackgroundToEnabled](self->_keyView, "changeBackgroundToEnabled");
}

- (void)changeBackgroundToActiveIfNecessary
{
  -[UIKBKeyView changeBackgroundToActiveIfNecessary](self->_keyView, "changeBackgroundToActiveIfNecessary");
}

- (void)prepareForDisplay
{
  -[UIKBKeyView prepareForDisplay](self->_keyView, "prepareForDisplay");
}

- (id)layerForRenderFlags:(int64_t)a3
{
  return -[UIKBKeyView layerForRenderFlags:](self->_keyView, "layerForRenderFlags:", a3);
}

- (int64_t)imageOrientationForLayer:(id)a3
{
  return -[UIKBKeyView imageOrientationForLayer:](self->_keyView, "imageOrientationForLayer:", a3);
}

- (id)keyplane
{
  return -[UIKBKeyView keyplane](self->_keyView, "keyplane");
}

- (id)key
{
  return -[UIKBKeyView key](self->_keyView, "key");
}

- (id)contentsKeyView
{
  return self->_keyView;
}

- (CGRect)drawFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKBKeyView drawFrame](self->_keyView, "drawFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDrawFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UIKBKeyView isDynamicKey](self, "isDynamicKey"))
  {
    -[UIKBKeyView drawFrame](self->_keyView, "drawFrame");
    v9.origin.x = x;
    v9.origin.y = y;
    v9.size.width = width;
    v9.size.height = height;
    if (!CGRectEqualToRect(v8, v9))
      -[UIKBKeyView resetRenderedKeyState](self->_keyView, "resetRenderedKeyState");
  }
  -[UIKBKeyView setDrawFrame:](self->_keyView, "setDrawFrame:", x, y, width, height);
}

- (id)renderConfig
{
  return -[UIKBKeyView renderConfig](self->_keyView, "renderConfig");
}

- (void)setRenderConfig:(id)a3
{
  -[UIKBKeyView setRenderConfig:](self->_keyView, "setRenderConfig:", a3);
}

- (id)factory
{
  return -[UIKBKeyView factory](self->_keyView, "factory");
}

- (void)setFactory:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIKBKeyView isDynamicKey](self, "isDynamicKey"))
    -[UIKBKeyView resetRenderedKeyState](self->_keyView, "resetRenderedKeyState");
  -[UIKBKeyView setFactory:](self->_keyView, "setFactory:", v4);

}

- (void)dimContentKeyView:(id)a3
{
  -[UIKBKeyView dimKeys:](self->_keyView, "dimKeys:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyView, 0);
}

@end
