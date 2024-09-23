@implementation _CachedFallbackInfo

+ (id)cachedFallbackInfo
{
  if (qword_20F5D0 != -1)
    dispatch_once(&qword_20F5D0, &stru_1C0FC0);
  return (id)qword_20F5C8;
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (void)setFontFamily:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSArray)fallbacks
{
  return self->_fallbacks;
}

- (void)setFallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_fallbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbacks, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_fontFamily, 0);
}

@end
