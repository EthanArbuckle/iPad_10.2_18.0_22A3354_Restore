@implementation NSMutableCharacterSet

- (id)crlwp_initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  NSMutableCharacterSet *v6;
  id v7;

  v6 = -[NSMutableCharacterSet init](self, "init");
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithCharacters:length:", a3, a4);
    -[NSMutableCharacterSet addCharactersInString:](v6, "addCharactersInString:", v7);

  }
  return v6;
}

@end
