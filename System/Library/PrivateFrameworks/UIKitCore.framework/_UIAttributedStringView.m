@implementation _UIAttributedStringView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIAttributedStringView)initWithFrame:(CGRect)a3
{
  _UIAttributedStringView *v3;
  _UIAttributedStringView *v4;
  CALayer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAttributedStringView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    v5 = -[UIView layer](v4, "layer");
    -[CALayer setContentsGravity:](v5, "setContentsGravity:", *MEMORY[0x1E0CD2FA8]);
    -[CALayer setAlignmentMode:](v5, "setAlignmentMode:", *MEMORY[0x1E0CD28F0]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v4, sel__updateContentsScale_, CFSTR("UITextSelectionDidZoom"), 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter _uiRemoveObserver:names:]((void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), self, &unk_1E1A95480);

  v3.receiver = self;
  v3.super_class = (Class)_UIAttributedStringView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;
  CGRect v5;

  v5 = CGRectIntegral(a3);
  v4.receiver = self;
  v4.super_class = (Class)_UIAttributedStringView;
  -[UIView setFrame:](&v4, sel_setFrame_, v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (void)_updateContentsScale:(id)a3
{
  id v5;
  CALayer *v6;

  v5 = -[UIView _scroller](self, "_scroller");
  if ((id)objc_msgSend(a3, "object") == v5)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v6 = -[UIView layer](self, "layer");
    objc_msgSend(v5, "zoomScale");
    -[CALayer setContentsScale:](v6, "setContentsScale:");
  }
}

- (void)didMoveToSuperview
{
  id v3;
  void *v4;
  CALayer *v5;

  v3 = -[UIView _scroller](self, "_scroller");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v5 = -[UIView layer](self, "layer");
    objc_msgSend(v4, "zoomScale");
    -[CALayer setContentsScale:](v5, "setContentsScale:");
  }
}

- (void)setString:(id)a3
{
  id v5;

  v5 = a3;

  self->_string = (NSAttributedString *)a3;
  -[CALayer setString:](-[UIView layer](self, "layer"), "setString:", self->_string);
}

- (void)setTextRotationAngle:(double)a3
{
  CALayer *v4;
  CGAffineTransform v5;

  v4 = -[UIView layer](self, "layer");
  CGAffineTransformMakeRotation(&v5, a3);
  -[CALayer setAffineTransform:](v4, "setAffineTransform:", &v5);
}

@end
