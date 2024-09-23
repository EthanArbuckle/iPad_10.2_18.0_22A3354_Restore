@implementation TVPBumperConfig

- (TVPBumperConfig)init
{
  TVPBumperConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVPBumperConfig;
  result = -[TVPBumperConfig init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_textDwellTime = xmmword_228AB2DE0;
  return result;
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (UIImage)logoImage
{
  return self->_logoImage;
}

- (void)setLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_logoImage, a3);
}

- (NSAttributedString)attributedWarningText
{
  return self->_attributedWarningText;
}

- (void)setAttributedWarningText:(id)a3
{
  objc_storeStrong((id *)&self->_attributedWarningText, a3);
}

- (NSAttributedString)attributedAppleIDText
{
  return self->_attributedAppleIDText;
}

- (void)setAttributedAppleIDText:(id)a3
{
  objc_storeStrong((id *)&self->_attributedAppleIDText, a3);
}

- (double)textDwellTime
{
  return self->_textDwellTime;
}

- (void)setTextDwellTime:(double)a3
{
  self->_textDwellTime = a3;
}

- (double)maxTextWidth
{
  return self->_maxTextWidth;
}

- (void)setMaxTextWidth:(double)a3
{
  self->_maxTextWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedAppleIDText, 0);
  objc_storeStrong((id *)&self->_attributedWarningText, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
}

@end
