@implementation TSUDateParserLibrary

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSUDateParserLibrary;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedDateParserLibrary
{
  id result;
  uint64_t v4;
  id v5;
  uint64_t v6;

  result = (id)sharedDateParserLibrary_sSingletonInstance;
  if (!sharedDateParserLibrary_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedDateParserLibrary_sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedDateParserLibrary_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUDateParserLibrary sharedDateParserLibrary]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParserLibrary.m"), 19, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)sharedDateParserLibrary_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUDateParserLibrary allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParserLibrary.m"), 19, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSUDateParserLibrary)init
{
  TSUDateParserLibrary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSUDateParserLibrary;
  v2 = -[TSUDateParserLibrary init](&v4, sel_init);
  if (v2)
  {
    v2->mAvailableDateParsers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->mParserLibraryConditionVariable = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    v2->mNumberOfUses = 0;
    v2->mParsersCreated = 0;
    v2->mMaxPermittedParsers = 1;
  }
  return v2;
}

- (id)checkoutDateParser
{
  id v3;
  uint64_t v4;
  unint64_t mNumberOfUses;
  unint64_t mMaxPermittedParsers;
  unint64_t mParsersCreated;
  double v8;
  float v9;
  unint64_t v10;
  TSUDateParser *v11;
  id v12;

  -[NSCondition lock](self->mParserLibraryConditionVariable, "lock");
  if (!self->mMaxPermittedParsers)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUDateParserLibrary checkoutDateParser]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParserLibrary.m"), 39, CFSTR("can't have no permitted parsers"));
  }
  mNumberOfUses = self->mNumberOfUses;
  if (mNumberOfUses != -1)
  {
    self->mNumberOfUses = mNumberOfUses + 1;
    mMaxPermittedParsers = self->mMaxPermittedParsers;
    if (mMaxPermittedParsers < objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "processorCount"))
    {
      mParsersCreated = self->mParsersCreated;
      if (mParsersCreated == self->mMaxPermittedParsers)
      {
        v8 = sqrtf((float)self->mNumberOfUses) * 0.008;
        v9 = v8;
        v10 = (unint64_t)v9;
        if (v8 <= 1.0)
          v10 = 1;
        if (v10 > mParsersCreated)
          self->mMaxPermittedParsers = v10;
      }
    }
  }
  while (!-[NSMutableArray count](self->mAvailableDateParsers, "count"))
  {
    if (self->mParsersCreated >= self->mMaxPermittedParsers)
    {
      -[NSCondition wait](self->mParserLibraryConditionVariable, "wait");
    }
    else
    {
      v11 = -[TSUDateParser initWithLocale:]([TSUDateParser alloc], "initWithLocale:", 0);
      -[NSMutableArray addObject:](self->mAvailableDateParsers, "addObject:", v11);

      ++self->mParsersCreated;
    }
  }
  v12 = (id)-[NSMutableArray lastObject](self->mAvailableDateParsers, "lastObject");
  -[NSMutableArray removeLastObject](self->mAvailableDateParsers, "removeLastObject");
  -[NSCondition unlock](self->mParserLibraryConditionVariable, "unlock");
  return v12;
}

- (void)returnDateParser:(id)a3
{
  -[NSCondition lock](self->mParserLibraryConditionVariable, "lock");
  -[NSMutableArray addObject:](self->mAvailableDateParsers, "addObject:", a3);
  -[NSCondition signal](self->mParserLibraryConditionVariable, "signal");
  -[NSCondition unlock](self->mParserLibraryConditionVariable, "unlock");
}

@end
