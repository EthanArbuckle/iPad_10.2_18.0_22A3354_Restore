@implementation TSKToolbarTitleView

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKToolbarTitleView;
  -[TSKToolbarTitleView dealloc](&v3, sel_dealloc);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

@end
