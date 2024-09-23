@implementation OITSUWeakReference

+ (id)weakReferenceWithObject:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:", a3);
}

- (OITSUWeakReference)initWithObject:(id)a3
{
  OITSUWeakReference *v4;
  OITSUWeakReference *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)OITSUWeakReference;
    v4 = -[OITSUWeakReference init](&v7, sel_init);
    v5 = v4;
    if (v4)
      objc_storeWeak(&v4->mObject, a3);
  }
  else
  {

    return 0;
  }
  return v5;
}

- (OITSUWeakReference)init
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUWeakReference init]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUWeakReference.m"), 37, 0, "Do not call method");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[OITSUWeakReference init]"), 0));
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->mObject, 0);
  v3.receiver = self;
  v3.super_class = (Class)OITSUWeakReference;
  -[OITSUWeakReference dealloc](&v3, sel_dealloc);
}

- (id)object
{
  return objc_loadWeak(&self->mObject);
}

@end
