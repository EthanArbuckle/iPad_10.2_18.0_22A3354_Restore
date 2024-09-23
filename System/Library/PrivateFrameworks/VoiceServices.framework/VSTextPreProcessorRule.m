@implementation VSTextPreProcessorRule

- (VSTextPreProcessorRule)initWithDictionaryRepresentation:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VSTextPreProcessorRule *v9;
  char v10;

  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("match"));
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("replace"));
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("case-sensitive"));
  v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("eat-punct"));
  if (objc_msgSend(v5, "length"))
  {
    v9 = -[VSTextPreProcessorRule init](self, "init");
    if (v9)
    {
      v9->_matchPattern = (NSString *)v5;
      v9->_replacement = (NSString *)v6;
      if (v7)
        v10 = objc_msgSend(v7, "BOOLValue");
      else
        v10 = 1;
      v9->_caseSensitive = v10;
      v9->_eatPunctuation = objc_msgSend(v8, "BOOLValue");
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSTextPreProcessorRule;
  -[VSTextPreProcessorRule dealloc](&v3, sel_dealloc);
}

- (id)matchedString:(id)a3 forTokenInRange:(id *)a4
{
  const __CFString *matchPattern;
  NSString *replacement;
  const __CFCharacterSet *Predefined;
  CFIndex v11;
  CFIndex i;
  CFIndex length;
  CFRange v14;
  CFRange v15;

  if (!a3)
    return 0;
  matchPattern = (const __CFString *)self->_matchPattern;
  if (!matchPattern || CFStringCompareWithOptions((CFStringRef)a3, matchPattern, *(CFRange *)a4, !self->_caseSensitive))
    return 0;
  replacement = self->_replacement;
  if (self->_eatPunctuation)
  {
    v14.location = 0;
    v14.length = 0;
    Predefined = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
    v11 = a4->var1 + a4->var0;
    for (i = objc_msgSend(a3, "length", 0) - v11; ; i -= length)
    {
      v15.location = v11;
      v15.length = i;
      if (!CFStringFindCharacterFromSet((CFStringRef)a3, Predefined, v15, 8uLL, &v14))
        break;
      length = v14.length;
      a4->var1 += v14.length;
      v11 += length;
    }
  }
  return replacement;
}

@end
