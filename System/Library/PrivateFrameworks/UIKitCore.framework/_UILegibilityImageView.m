@implementation _UILegibilityImageView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("filters.colorMatrix.inputColorMatrix")) & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)_UILegibilityImageView;
  return -[UIImageView _shouldAnimatePropertyWithKey:](&v6, sel__shouldAnimatePropertyWithKey_, a3);
}

- (void)setImage:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UILegibilityImageView;
  -[UIImageView setImage:](&v3, sel_setImage_, a3);
}

@end
