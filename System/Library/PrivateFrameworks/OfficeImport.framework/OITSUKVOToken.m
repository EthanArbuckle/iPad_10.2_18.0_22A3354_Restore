@implementation OITSUKVOToken

- (OITSUKVOToken)init
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUKVOToken init]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSObject_TSUAdditions.m"), 249, 0, "Do not call method");
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[OITSUKVOToken init]"), 0));
}

- (OITSUKVOToken)initWithObserver:(id)a3 target:(id)a4 keyPath:(id)a5 context:(void *)a6
{
  OITSUKVOToken *v10;
  OITSUKVOToken *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OITSUKVOToken;
  v10 = -[OITSUKVOToken init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_observer = a3;
    v10->_target = a4;
    v10->_keyPath = (NSString *)objc_msgSend(a5, "copy");
    v11->_context = a6;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUKVOToken;
  -[OITSUKVOToken dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *context;
  NSObject *observer;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = (void *)TSUDynamicCast(v5, (uint64_t)a3);
    if (v6)
    {
      v7 = v6;
      context = self->_context;
      LOBYTE(v6) = context == (void *)objc_msgSend(v6, "context")
                && (observer = self->_observer, observer == objc_msgSend(v7, "observer"))
                && -[NSString isEqualToString:](self->_keyPath, "isEqualToString:", objc_msgSend(v7, "keyPath"));
    }
  }
  return (char)v6;
}

- (unint64_t)hash
{
  NSObject *observer;

  observer = self->_observer;
  return -[NSString hash](self->_keyPath, "hash") ^ (unint64_t)observer ^ (unint64_t)self->_context;
}

- (NSObject)observer
{
  return self->_observer;
}

- (NSObject)target
{
  return self->_target;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)context
{
  return self->_context;
}

@end
