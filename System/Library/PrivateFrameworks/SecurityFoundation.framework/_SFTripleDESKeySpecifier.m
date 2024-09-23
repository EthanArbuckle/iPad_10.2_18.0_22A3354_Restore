@implementation _SFTripleDESKeySpecifier

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

- (int64_t)keyLengthInBytes
{
  return 21;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tripleDESKeySpecifierInternal, 0);
}

@end
