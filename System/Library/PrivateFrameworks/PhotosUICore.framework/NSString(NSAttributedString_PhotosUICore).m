@implementation NSString(NSAttributedString_PhotosUICore)

- (id)px_stringConvertedToHTMLString
{
  return +[PXAttributedStringHTMLParser stringByConvertingToHTML:](PXAttributedStringHTMLParser, "stringByConvertingToHTML:", a1);
}

@end
