@implementation NSMutableString

- (void)crl_indentBy:(unint64_t)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(CFSTR("          "), "mutableCopy");
  v7 = v5;
  while ((unint64_t)objc_msgSend(v5, "length") < a3)
  {
    objc_msgSend(v7, "appendString:", v7);
    v5 = v7;
  }
  objc_msgSend(v7, "deleteCharactersInRange:", a3, (char *)objc_msgSend(v7, "length") - a3);
  -[NSMutableString insertString:atIndex:](self, "insertString:atIndex:", v7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@"), v7));
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](self, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), v6, 0, 0, -[NSMutableString length](self, "length"));

}

- (void)crl_appendCharacter:(unsigned __int16)a3
{
  UniChar chars;

  chars = a3;
  CFStringAppendCharacters((CFMutableStringRef)self, &chars, 1);
}

- (void)crl_insertCharacter:(unsigned __int16)a3 atIndex:(unint64_t)a4
{
  id v6;

  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%C"), a3);
  -[NSMutableString insertString:atIndex:](self, "insertString:atIndex:", v6, a4);

}

- (void)crl_appendSeparator:(id)a3 format:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  if (-[NSMutableString length](self, "length"))
    -[NSMutableString appendString:](self, "appendString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString crl_stringWithFormat:arguments:](NSString, "crl_stringWithFormat:arguments:", v7, &v9));
  -[NSMutableString appendString:](self, "appendString:", v8);

}

@end
