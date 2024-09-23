@implementation NSCharacterSet

+ (id)pauseCharacterSet
{
  return +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(";,"));
}

+ (id)starAndOctothorpeCharacterSet
{
  return +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("*#"));
}

@end
