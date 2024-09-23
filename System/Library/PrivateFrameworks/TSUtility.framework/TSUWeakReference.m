@implementation TSUWeakReference

- (TSUWeakReference)initWithObject:(id)a3
{
  TSUWeakReference *v4;
  TSUWeakReference *v5;
  objc_super v7;

  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSUWeakReference;
    v4 = -[TSUWeakReference init](&v7, sel_init);
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

+ (id)weakReferenceWithObject:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:", a3);
}

- (TSUWeakReference)init
{
  id v2;
  uint64_t v3;

  v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUWeakReference init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUWeakReference.m"), 34, CFSTR("Do not call method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSUWeakReference init]"), 0));
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->mObject, 0);
  v3.receiver = self;
  v3.super_class = (Class)TSUWeakReference;
  -[TSUWeakReference dealloc](&v3, sel_dealloc);
}

- (id)object
{
  return objc_loadWeak(&self->mObject);
}

@end
