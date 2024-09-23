@implementation ContentViewStyleManagerBookInfo

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)respectImageSizeClass
{
  return self->_respectImageSizeClass;
}

- (void)setRespectImageSizeClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)respectImageSizeClassIsPrefix
{
  return self->_respectImageSizeClassIsPrefix;
}

- (void)setRespectImageSizeClassIsPrefix:(BOOL)a3
{
  self->_respectImageSizeClassIsPrefix = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_respectImageSizeClass, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
