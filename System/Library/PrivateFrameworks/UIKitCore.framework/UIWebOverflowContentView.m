@implementation UIWebOverflowContentView

- (UIWebOverflowContentView)initWithLayer:(id)a3
{
  UIWebOverflowContentView *v5;
  UIWebOverflowContentView *v6;
  objc_super v8;

  objc_msgSend(a3, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)UIWebOverflowContentView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_);
  v6 = v5;
  if (v5)
    -[UIWebOverflowContentView replaceLayer:](v5, "replaceLayer:", a3);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_webLayer = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIWebOverflowContentView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)replaceLayer:(id)a3
{
  -[UIView _replaceLayer:](self, "_replaceLayer:");
  -[UIWebOverflowContentView setWebLayer:](self, "setWebLayer:", a3);
}

- (void)willBeRemoved
{
  -[UIWebOverflowContentView setWebLayer:](self, "setWebLayer:", 0);
}

- (id)superview
{
  CALayer *v2;
  CALayer *v3;

  v2 = -[CALayer superlayer](-[UIView layer](self, "layer"), "superlayer");
  if (!v2)
    return 0;
  v3 = v2;
  while (1)
  {
    if (-[CALayer delegate](v3, "delegate"))
    {
      -[CALayer delegate](v3, "delegate");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
    }
    v3 = -[CALayer superlayer](v3, "superlayer");
    if (!v3)
      return 0;
  }
  return -[CALayer delegate](v3, "delegate");
}

- (void)fixUpViewAfterInsertion
{
  -[UIView _webCustomViewWasAddedAsSubviewOfView:](self, -[UIWebOverflowContentView superview](self, "superview"));
  -[UIView _invalidateSubviewCache](self, "_invalidateSubviewCache");
}

- (void)_setCachedSubviews:(id)a3
{
  NSArray *subviewCache;
  NSArray *v6;

  subviewCache = self->super._subviewCache;
  if (subviewCache != a3)
  {

    if ((*(_QWORD *)&self->super._viewFlags & 0x1000) != 0)
      v6 = 0;
    else
      v6 = (NSArray *)a3;
    self->super._subviewCache = v6;
  }
}

- (CALayer)webLayer
{
  return self->_webLayer;
}

- (void)setWebLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

@end
