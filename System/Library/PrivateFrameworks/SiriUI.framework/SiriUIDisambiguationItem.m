@implementation SiriUIDisambiguationItem

+ (id)disambiguationItem
{
  return objc_alloc_init((Class)a1);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)headingText
{
  return self->_headingText;
}

- (void)setHeadingText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)extraDisambiguationText
{
  return self->_extraDisambiguationText;
}

- (void)setExtraDisambiguationText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)extraDisambiguationSubText
{
  return self->_extraDisambiguationSubText;
}

- (void)setExtraDisambiguationSubText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_NSRange)titleBoldedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_titleBoldedRange.length;
  location = self->_titleBoldedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTitleBoldedRange:(_NSRange)a3
{
  self->_titleBoldedRange = a3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (BOOL)showsFavoriteStar
{
  return self->_showsFavoriteStar;
}

- (void)setShowsFavoriteStar:(BOOL)a3
{
  self->_showsFavoriteStar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_extraDisambiguationSubText, 0);
  objc_storeStrong((id *)&self->_extraDisambiguationText, 0);
  objc_storeStrong((id *)&self->_headingText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
