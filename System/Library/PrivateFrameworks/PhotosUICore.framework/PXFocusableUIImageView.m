@implementation PXFocusableUIImageView

- (PXFocusableUIImageView)initWithFrame:(CGRect)a3
{
  PXFocusableUIImageView *v3;
  PXFocusableUIImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXFocusableUIImageView;
  v3 = -[PXFocusableUIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_allowsFocus = 1;
    -[PXFocusableUIImageView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
  }
  return v4;
}

- (PXFocusableUIImageView)initWithCoder:(id)a3
{
  PXFocusableUIImageView *v3;
  PXFocusableUIImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXFocusableUIImageView;
  v3 = -[PXFocusableUIImageView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_allowsFocus = 1;
    -[PXFocusableUIImageView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
  }
  return v4;
}

- (BOOL)_isEligibleForFocusInteraction
{
  void *v3;
  _BOOL4 v4;

  if (-[PXFocusableUIImageView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
  {
    -[PXFocusableUIImageView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = !-[PXFocusableUIImageView reusable](self, "reusable");
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)canBecomeFocused
{
  return self->_allowsFocus;
}

- (id)focusEffect
{
  void *v3;
  void *v4;

  if (-[PXFocusableUIImageView drawsFocusRing](self, "drawsFocusRing"))
  {
    v3 = (void *)MEMORY[0x1E0DC37D8];
    -[PXFocusableUIImageView bounds](self, "bounds");
    objc_msgSend(v3, "effectWithRect:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPosition:", 2);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (BOOL)drawsFocusRing
{
  return self->_drawsFocusRing;
}

- (void)setDrawsFocusRing:(BOOL)a3
{
  self->_drawsFocusRing = a3;
}

- (BOOL)reusable
{
  return self->_reusable;
}

- (void)setReusable:(BOOL)a3
{
  self->_reusable = a3;
}

@end
