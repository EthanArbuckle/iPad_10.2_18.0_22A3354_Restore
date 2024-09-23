@implementation THCFISplitter

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___THCFISplitter;
  return objc_msgSendSuper2(&v3, "allocWithZone:", 0);
}

+ (id)sharedInstance
{
  id result;
  id v4;

  result = (id)qword_5432A0;
  if (!qword_5432A0)
  {
    objc_sync_enter(a1);
    if (!qword_5432A0)
    {
      v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_5432A0 = (uint64_t)v4;
      if (!v4)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THCFISplitter sharedInstance]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m"), 151, CFSTR("Couldn't create singleton instance of %@"), a1);
    }
    objc_sync_exit(a1);
    return (id)qword_5432A0;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THCFISplitter allocWithZone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationTextLocator.m"), 151, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (THCFISplitter)init
{
  THCFISplitter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THCFISplitter;
  v2 = -[THCFISplitter init](&v4, "init");
  if (v2)
    v2->_regex = (NSRegularExpression *)objc_msgSend(objc_alloc((Class)NSRegularExpression), "initWithPattern:options:error:", CFSTR("\\[([a-zA-Z0-9-]+)\\]"), 0, 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THCFISplitter;
  -[THCFISplitter dealloc](&v3, "dealloc");
}

- (id)storageIDFromCFI:(id)a3
{
  NSTextCheckingResult *v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;

  v4 = -[NSRegularExpression firstMatchInString:options:range:](self->_regex, "firstMatchInString:options:range:", a3, 0, 0, objc_msgSend(a3, "length"));
  if (-[NSTextCheckingResult numberOfRanges](v4, "numberOfRanges") < 2)
    return 0;
  v5 = (char *)-[NSTextCheckingResult rangeAtIndex:](v4, "rangeAtIndex:", 1);
  v7 = v6;
  if (v6 >= 2
    && objc_msgSend(a3, "characterAtIndex:", v5) == 112
    && objc_msgSend(a3, "characterAtIndex:", v5 + 1) - 58 > 0xFFFFFFF5)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a3, "substringWithRange:", v5, v7);
  }
}

@end
