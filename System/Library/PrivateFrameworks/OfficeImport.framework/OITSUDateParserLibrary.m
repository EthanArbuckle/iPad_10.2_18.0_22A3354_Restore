@implementation OITSUDateParserLibrary

- (OITSUDateParserLibrary)initWithLocale:(id)a3
{
  OITSUDateParserLibrary *v4;
  OITSUDateParserLibrary *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OITSUDateParserLibrary;
  v4 = -[OITSUDateParserLibrary init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mLocale = (OITSULocale *)a3;
    v4->mAvailableDateParsers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5->mParserLibraryConditionVariable = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    v5->mNumberOfUses = 0;
    v5->mParsersCreated = 0;
    v5->mMaxPermittedParsers = 1;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUDateParserLibrary;
  -[OITSUDateParserLibrary dealloc](&v3, sel_dealloc);
}

- (id)checkoutDateParser
{
  uint64_t v3;
  unint64_t mNumberOfUses;
  unint64_t mMaxPermittedParsers;
  unint64_t mParsersCreated;
  double v7;
  float v8;
  void *v9;
  OITSUDateParser *v10;
  id v11;

  -[NSCondition lock](self->mParserLibraryConditionVariable, "lock");
  if (!self->mMaxPermittedParsers)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUDateParserLibrary checkoutDateParser]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParserLibrary.m"), 47, 0, "can't have no permitted parsers");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
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
        v7 = sqrtf((float)self->mNumberOfUses) * 0.008;
        if (v7 < 1.0)
          v7 = 1.0;
        v8 = v7;
        if (mParsersCreated < (unint64_t)v8)
          self->mMaxPermittedParsers = (unint64_t)v8;
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
      v9 = (void *)MEMORY[0x22E2DDB58]();
      v10 = -[OITSUDateParser initWithLocale:]([OITSUDateParser alloc], "initWithLocale:", self->mLocale);
      -[NSMutableArray addObject:](self->mAvailableDateParsers, "addObject:", v10);

      objc_autoreleasePoolPop(v9);
      ++self->mParsersCreated;
    }
  }
  v11 = (id)-[NSMutableArray lastObject](self->mAvailableDateParsers, "lastObject");
  -[NSMutableArray removeLastObject](self->mAvailableDateParsers, "removeLastObject");
  -[NSCondition unlock](self->mParserLibraryConditionVariable, "unlock");
  return v11;
}

- (void)returnDateParser:(id)a3
{
  -[NSCondition lock](self->mParserLibraryConditionVariable, "lock");
  -[NSMutableArray addObject:](self->mAvailableDateParsers, "addObject:", a3);
  -[NSCondition signal](self->mParserLibraryConditionVariable, "signal");
  -[NSCondition unlock](self->mParserLibraryConditionVariable, "unlock");
}

- (void)prepareDateParserInBackground
{
  NSObject *global_queue;
  _QWORD block[5];

  if (!self->mParsersCreated)
  {
    global_queue = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__OITSUDateParserLibrary_prepareDateParserInBackground__block_invoke;
    block[3] = &unk_24F39A608;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
}

uint64_t __55__OITSUDateParserLibrary_prepareDateParserInBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "returnDateParser:", objc_msgSend(*(id *)(a1 + 32), "checkoutDateParser"));
}

@end
