@implementation _PASLanguageDetectionNLLanguageIdentifierWrapper

- (void)dealloc
{
  objc_super v3;

  if (self->_languageIdentifier)
    NLLanguageIdentifierRelease();
  v3.receiver = self;
  v3.super_class = (Class)_PASLanguageDetectionNLLanguageIdentifierWrapper;
  -[_PASLanguageDetectionNLLanguageIdentifierWrapper dealloc](&v3, sel_dealloc);
}

@end
