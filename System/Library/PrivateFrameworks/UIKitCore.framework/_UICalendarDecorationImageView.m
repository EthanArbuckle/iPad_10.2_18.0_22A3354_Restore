@implementation _UICalendarDecorationImageView

- (_UICalendarDecorationImageView)initWithFrame:(CGRect)a3
{
  _UICalendarDecorationImageView *v3;
  _UICalendarDecorationImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UICalendarDecorationImageView;
  v3 = -[UIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_decorationSize = 1;
    -[_UICalendarDecorationImageView _updateSymbolConfiguration](v3, "_updateSymbolConfiguration");
  }
  return v4;
}

- (void)setDecorationSize:(int64_t)a3
{
  if (self->_decorationSize != a3)
  {
    self->_decorationSize = a3;
    -[_UICalendarDecorationImageView _updateSymbolConfiguration](self, "_updateSymbolConfiguration");
  }
}

- (void)_updateSymbolConfiguration
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[_UICalendarDecorationImageView decorationSize](self, "decorationSize");
  if (v3 < 3)
    v4 = v3 + 1;
  else
    v4 = -1;
  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleCaption2"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self, "setPreferredSymbolConfiguration:", v5);

}

- (int64_t)decorationSize
{
  return self->_decorationSize;
}

@end
