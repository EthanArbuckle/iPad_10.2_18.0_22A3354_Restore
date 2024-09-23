@implementation THSimpleCFI

- (THSimpleCFI)initWithString:(id)a3
{
  THSimpleCFI *v4;
  THSimpleCFI *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THSimpleCFI;
  v4 = -[THSimpleCFI init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    -[THSimpleCFI setValid:](v4, "setValid:", 0);
    -[THSimpleCFI setOriginalCFIString:](v5, "setOriginalCFIString:", a3);
    -[THSimpleCFI setComponents:](v5, "setComponents:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[THSimpleCFI p_parseFromString:](v5, "p_parseFromString:", a3)));
    -[THSimpleCFI setCfiString:](v5, "setCfiString:", -[NSArray componentsJoinedByString:](-[THSimpleCFI components](v5, "components"), "componentsJoinedByString:", &stru_43D7D8));
  }
  return v5;
}

- (THSimpleCFI)initWithComponents:(id)a3
{
  THSimpleCFI *v4;
  THSimpleCFI *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THSimpleCFI;
  v4 = -[THSimpleCFI init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    -[THSimpleCFI setValid:](v4, "setValid:", 1);
    -[THSimpleCFI setComponents:](v5, "setComponents:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", a3));
    -[THSimpleCFI setCfiString:](v5, "setCfiString:", -[NSArray componentsJoinedByString:](-[THSimpleCFI components](v5, "components"), "componentsJoinedByString:", &stru_43D7D8));
    -[THSimpleCFI setOriginalCFIString:](v5, "setOriginalCFIString:", -[THSimpleCFI description](v5, "description"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THSimpleCFI;
  -[THSimpleCFI dealloc](&v3, "dealloc");
}

- (BOOL)hasParent
{
  NSEnumerator *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[NSArray reverseObjectEnumerator](-[THSimpleCFI components](self, "components", 0), "reverseObjectEnumerator");
  v3 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "isAcceptableLeaf") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v3 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return (char)v3;
}

- (id)parent
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;

  v3 = -[NSArray count](-[THSimpleCFI components](self, "components"), "count");
  if (v3 < 2)
    return 0;
  for (i = v3 - 1; ; --i)
  {
    v5 = i - 1;
    if (objc_msgSend(-[NSArray objectAtIndex:](-[THSimpleCFI components](self, "components"), "objectAtIndex:", i - 1), "isAcceptableLeaf"))break;
    if (v5 <= 0)
      return 0;
  }
  return -[THSimpleCFI initWithComponents:]([THSimpleCFI alloc], "initWithComponents:", -[NSArray subarrayWithRange:](-[THSimpleCFI components](self, "components"), "subarrayWithRange:", 0, i));
}

- (id)p_parseFromString:(id)a3
{
  id v4;
  id v5;
  NSScanner *v6;
  NSCharacterSet *v7;
  NSCharacterSet *v8;
  THSimpleCFIChild *v9;
  signed __int8 v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  NSString *v15;

  v4 = objc_msgSend((id)objc_opt_class(self), "p_transcribeWithoutAssertions:", a3);
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v6 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v4);
  v7 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("/:^~@[],"));
  v8 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("!"));
  v15 = +[NSString string](NSString, "string");
  if (-[NSScanner isAtEnd](v6, "isAtEnd"))
    goto LABEL_27;
  while (1)
  {
    if (-[NSScanner scanCharactersFromSet:intoString:](v6, "scanCharactersFromSet:intoString:", v8, &v15)
      && -[NSString length](v15, "length"))
    {
      v9 = +[THSimpleCFIIndirection indirection](THSimpleCFIIndirection, "indirection");
LABEL_16:
      objc_msgSend(v5, "addObject:", v9);
      goto LABEL_17;
    }
    if (!-[NSScanner scanCharactersFromSet:intoString:](v6, "scanCharactersFromSet:intoString:", v7, &v15)
      || (char *)-[NSString length](v15, "length") != (char *)&dword_0 + 1)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSimpleCFI p_parseFromString:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THSimpleCFI.m"), 175, CFSTR("failed to find expected character during scanning of '%@'"), v4);
      goto LABEL_27;
    }
    v10 = -[NSString characterAtIndex:](v15, "characterAtIndex:", 0);
    v14 = 0;
    v11 = v10;
    if ((int)v11 > 57)
      break;
    if ((_DWORD)v11 != 47)
    {
      if ((_DWORD)v11 == 44)
        goto LABEL_25;
      goto LABEL_26;
    }
    if (-[NSScanner scanInteger:](v6, "scanInteger:", &v14) && (v14 & 0x8000000000000000) == 0)
    {
      v9 = +[THSimpleCFIChild childWithIndex:](THSimpleCFIChild, "childWithIndex:");
      goto LABEL_16;
    }
LABEL_17:
    if (-[NSScanner isAtEnd](v6, "isAtEnd"))
      goto LABEL_27;
  }
  if ((_DWORD)v11 == 58)
  {
    if (!-[NSScanner scanInteger:](v6, "scanInteger:", &v14) || v14 < 0)
      goto LABEL_17;
    v9 = +[THSimpleCFICharacterOffset characterOffsetWithOffset:](THSimpleCFICharacterOffset, "characterOffsetWithOffset:");
    goto LABEL_16;
  }
  v12 = v10 - 64;
  if ((v11 - 64) <= 0x3E)
  {
    if (((1 << v12) & 0x4000000040000001) != 0)
    {
LABEL_25:
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSimpleCFI p_parseFromString:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THSimpleCFI.m"), 156, CFSTR("cfi parsing: refused '%c' because it is complex"), v11);
      goto LABEL_27;
    }
    if (((1 << v12) & 0x28000000) != 0)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSimpleCFI p_parseFromString:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THSimpleCFI.m"), 162, CFSTR("cfi parsing: refused '%c' because we expected to parse core input"), v11);
      goto LABEL_27;
    }
  }
LABEL_26:
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSimpleCFI p_parseFromString:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THSimpleCFI.m"), 167, CFSTR("cfi parsing: unexpected: %c"), v11);
LABEL_27:
  -[THSimpleCFI setValid:](self, "setValid:", -[NSScanner isAtEnd](v6, "isAtEnd"));
  return v5;
}

+ (id)pathStringFromFragment:(id)a3
{
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("#epubcfi("))
    && objc_msgSend(a3, "hasSuffix:", CFSTR(")")))
  {
    return objc_msgSend(a3, "substringWithRange:", 9, (char *)objc_msgSend(a3, "length") - 10);
  }
  else
  {
    return 0;
  }
}

+ (id)fragmentFromPathString:(id)a3
{
  return objc_msgSend(objc_msgSend(CFSTR("#epubcfi("), "stringByAppendingString:", a3), "stringByAppendingString:", CFSTR(")"));
}

+ (id)simpleCFIWithString:(id)a3
{
  return -[THSimpleCFI initWithString:]([THSimpleCFI alloc], "initWithString:", a3);
}

+ (id)p_transcribeWithoutAssertions:(id)a3
{
  NSScanner *v3;
  id v4;
  unsigned int v5;
  uint64_t v7;
  NSString *v8;

  v3 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", a3);
  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v8 = 0;
  if (!-[NSScanner isAtEnd](v3, "isAtEnd", +[NSString string](NSString, "string")))
  {
    do
    {
      v8 = +[NSString string](NSString, "string");
      v5 = -[NSScanner scanUpToString:intoString:](v3, "scanUpToString:intoString:", CFSTR("["), &v8);
      objc_msgSend(v4, "addObject:", v8);
      if (v5 && -[NSScanner scanUpToString:intoString:](v3, "scanUpToString:intoString:", CFSTR("]"), &v7))
        -[NSScanner scanString:intoString:](v3, "scanString:intoString:", CFSTR("]"), &v7);
    }
    while (!-[NSScanner isAtEnd](v3, "isAtEnd"));
  }
  return objc_msgSend(v4, "componentsJoinedByString:", &stru_43D7D8);
}

- (NSString)originalCFIString
{
  return self->originalCFIString;
}

- (void)setOriginalCFIString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSArray)components
{
  return self->mComponents;
}

- (void)setComponents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (NSString)cfiString
{
  return self->cfiString;
}

- (void)setCfiString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
