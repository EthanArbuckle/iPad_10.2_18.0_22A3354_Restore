@implementation RUIImageView

- (void)setImage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RUIImageView;
  -[RUIImageView setImage:](&v5, sel_setImage_);
  -[RUIImageView setHidden:](self, "setHidden:", a3 == 0);
}

@end
