@implementation _UIDynamicCaretNoContentView

- (_UIDynamicCaretNoContentView)initWithImage:(id)a3
{
  _UIDynamicCaretNoContentView *v3;
  _UIDynamicCaretNoContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDynamicCaretNoContentView;
  v3 = -[UIImageView initWithImage:](&v6, sel_initWithImage_, a3);
  v4 = v3;
  if (v3)
  {
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  }
  return v4;
}

@end
