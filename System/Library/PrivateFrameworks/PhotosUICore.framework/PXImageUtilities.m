@implementation PXImageUtilities

+ (BOOL)symbolIsEmbeddedGlyph:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("spatial"));
}

@end
