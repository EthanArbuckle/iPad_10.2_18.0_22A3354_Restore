@implementation THWAdornmentCloseButton

- (THWAdornmentCloseButton)initWithFrame:(CGRect)a3 theme:(int)a4
{
  uint64_t v4;
  double height;
  double width;
  double y;
  double x;
  THWAdornmentCloseButton *v9;
  THWAdornmentCloseButton *v10;
  objc_super v12;

  v4 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)THWAdornmentCloseButton;
  v9 = -[THWAdornmentCloseButton initWithFrame:](&v12, "initWithFrame:");
  v10 = v9;
  if (v9)
    -[THWAdornmentCloseButton p_initWithFrame:theme:](v9, "p_initWithFrame:theme:", v4, x, y, width, height);
  return v10;
}

- (THWAdornmentCloseButton)initWithFrame:(CGRect)a3
{
  return -[THWAdornmentCloseButton initWithFrame:theme:](self, "initWithFrame:theme:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (THWAdornmentCloseButton)init
{
  return -[THWAdornmentCloseButton initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
}

- (THWAdornmentCloseButton)initWithCoder:(id)a3
{
  THWAdornmentCloseButton *v3;
  THWAdornmentCloseButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWAdornmentCloseButton;
  v3 = -[THWAdornmentCloseButton initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[THWAdornmentCloseButton frame](v3, "frame");
    -[THWAdornmentCloseButton p_initWithFrame:theme:](v4, "p_initWithFrame:theme:", 0);
  }
  return v4;
}

- (void)p_initWithFrame:(CGRect)a3 theme:(int)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;

  y = a3.origin.y;
  x = a3.origin.x;
  -[THWAdornmentCloseButton p_initializeTheme:](self, "p_initializeTheme:", *(_QWORD *)&a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[THWAdornmentCloseButton buttonSize](self, "buttonSize");
  v8 = v7;
  -[THWAdornmentCloseButton buttonSize](self, "buttonSize");
  -[THWAdornmentCloseButton setFrame:](self, "setFrame:", x, y, v8, v9);
  -[THWAdornmentCloseButton updateImage](self, "updateImage");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWAdornmentCloseButton;
  -[THWAdornmentCloseButton dealloc](&v3, "dealloc");
}

- (void)setTheme:(int)a3
{
  if (self->_theme != a3)
  {
    self->_theme = a3;
    -[THWAdornmentCloseButton p_initializeTheme:](self, "p_initializeTheme:");
    -[THWAdornmentCloseButton updateImage](self, "updateImage");
  }
}

- (void)updateImage
{
  -[THWAdornmentCloseButton setImage:forState:](self, "setImage:forState:", -[THWAdornmentCloseButton closeButtonImage](self, "closeButtonImage"), 0);
  -[THWAdornmentCloseButton setImage:forState:](self, "setImage:forState:", -[THWAdornmentCloseButton closeButtonImage](self, "closeButtonImage"), 2);
  if (-[THWAdornmentCloseButton closeButtonAlternateImage](self, "closeButtonAlternateImage"))
    -[THWAdornmentCloseButton setImage:forState:](self, "setImage:forState:", -[THWAdornmentCloseButton closeButtonAlternateImage](self, "closeButtonAlternateImage"), 1);
}

- (void)p_initializeTheme:(int)a3
{
  const __CFString *v4;

  if (a3)
    v4 = CFSTR("ib_media_close-N");
  else
    v4 = CFSTR("ib_media_close_white-N");
  -[THWAdornmentCloseButton setCloseButtonImage:](self, "setCloseButtonImage:", +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", v4));
  -[THWAdornmentCloseButton setCloseButtonTitle:](self, "setCloseButtonTitle:", 0);
  -[THWAdornmentCloseButton setCloseButtonAlternateTitle:](self, "setCloseButtonAlternateTitle:", 0);
  -[THWAdornmentCloseButton setButtonSize:](self, "setButtonSize:", 44.0, 44.0);
}

- (int)theme
{
  return self->_theme;
}

- (UIImage)closeButtonImage
{
  return self->_closeButtonImage;
}

- (void)setCloseButtonImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (UIImage)closeButtonAlternateImage
{
  return self->_closeButtonAlternateImage;
}

- (void)setCloseButtonAlternateImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSAttributedString)closeButtonTitle
{
  return self->_closeButtonTitle;
}

- (void)setCloseButtonTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSAttributedString)closeButtonAlternateTitle
{
  return self->_closeButtonAlternateTitle;
}

- (void)setCloseButtonAlternateTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CGSize)buttonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_buttonSize.width;
  height = self->_buttonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setButtonSize:(CGSize)a3
{
  self->_buttonSize = a3;
}

@end
