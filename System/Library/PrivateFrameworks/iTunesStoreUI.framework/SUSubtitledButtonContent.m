@implementation SUSubtitledButtonContent

- (void)dealloc
{
  objc_super v3;

  self->_subtitle = 0;
  self->_subtitleColor = 0;

  self->_subtitleShadowColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUSubtitledButtonContent;
  -[SUSubtitledButtonContent dealloc](&v3, sel_dealloc);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (void)setSubtitleColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (UIColor)subtitleShadowColor
{
  return self->_subtitleShadowColor;
}

- (void)setSubtitleShadowColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
