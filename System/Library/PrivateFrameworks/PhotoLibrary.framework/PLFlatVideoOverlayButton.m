@implementation PLFlatVideoOverlayButton

- (PLFlatVideoOverlayButton)initWithStyle:(int64_t)a3
{
  PLFlatVideoOverlayButton *v4;
  PLFlatVideoOverlayButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLFlatVideoOverlayButton;
  v4 = -[PLFlatVideoOverlayButton initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    -[PLFlatVideoOverlayButton setImage:forState:](v4, "setImage:forState:", -[PLFlatVideoOverlayButton _normalButtonImage](v4, "_normalButtonImage"), 0);
    -[PLFlatVideoOverlayButton setImage:forState:](v5, "setImage:forState:", -[PLFlatVideoOverlayButton _highlightedButtonImage](v5, "_highlightedButtonImage"), 1);
    -[PLFlatVideoOverlayButton sizeToFit](v5, "sizeToFit");
    -[PLFlatVideoOverlayButton setDeliversTouchesForGesturesToSuperview:](v5, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[PLFlatVideoOverlayButton addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", v5, sel__handleTap_, 64);
  }
  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  self->_target = a3;
  self->_action = a4;
}

- (void)_handleTap:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_target, "performSelector:withObject:", self->_action, self);
}

- (id)_normalButtonImage
{
  pl_dispatch_once();
  return (id)_normalButtonImage_image;
}

- (id)_highlightedButtonImage
{
  pl_dispatch_once();
  return (id)_highlightedButtonImage_image;
}

- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat width;
  CGFloat height;
  CGContext *CurrentContext;
  UIImage *v16;
  CGSize v18;
  CGRect v19;

  v8 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("PLVideoOverlayBackgroundMask"), v8);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", CFSTR("PLVideoOverlayGlyphMask"), v8);
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v9, "size");
  width = v18.width;
  height = v18.height;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetGrayFillColor(CurrentContext, a3, a4);
  v19.origin.x = v11;
  v19.origin.y = v12;
  v19.size.width = width;
  v19.size.height = height;
  CGContextFillRect(CurrentContext, v19);
  objc_msgSend(v9, "drawAtPoint:blendMode:alpha:", 23, v11, v12, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 23, v11, v12, 1.0);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 0, v11, v12, a5);
  v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v16;
}

uint64_t __51__PLFlatVideoOverlayButton__highlightedButtonImage__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_createOverlayImageWithBackgroundWhite:backgroundAlpha:glyphAlpha:", 0.959999979, 0.959999979, 0.5);
  _highlightedButtonImage_image = result;
  return result;
}

uint64_t __46__PLFlatVideoOverlayButton__normalButtonImage__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_createOverlayImageWithBackgroundWhite:backgroundAlpha:glyphAlpha:", 0.959999979, 0.959999979, 0.300000012);
  _normalButtonImage_image = result;
  return result;
}

@end
