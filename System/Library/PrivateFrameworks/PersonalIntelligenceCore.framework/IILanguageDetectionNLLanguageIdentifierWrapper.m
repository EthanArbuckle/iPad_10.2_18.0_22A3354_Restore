@implementation IILanguageDetectionNLLanguageIdentifierWrapper

- (void)dealloc
{
  objc_super v3;

  if (self->_languageIdentifier)
    NLLanguageIdentifierRelease();
  v3.receiver = self;
  v3.super_class = (Class)IILanguageDetectionNLLanguageIdentifierWrapper;
  -[IILanguageDetectionNLLanguageIdentifierWrapper dealloc](&v3, sel_dealloc);
}

@end
