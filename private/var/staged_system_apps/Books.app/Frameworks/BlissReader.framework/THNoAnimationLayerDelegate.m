@implementation THNoAnimationLayerDelegate

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___THNoAnimationLayerDelegate;
  return objc_msgSendSuper2(&v3, "allocWithZone:", 0);
}

+ (id)sharedInstance
{
  id result;
  id v4;

  result = (id)qword_543288;
  if (!qword_543288)
  {
    objc_sync_enter(a1);
    if (!qword_543288)
    {
      v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_543288 = (uint64_t)v4;
      if (!v4)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THNoAnimationLayerDelegate sharedInstance]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THNoAnimationLayerDelegate.m"), 16, CFSTR("Couldn't create singleton instance of %@"), a1);
    }
    objc_sync_exit(a1);
    return (id)qword_543288;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THNoAnimationLayerDelegate allocWithZone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THNoAnimationLayerDelegate.m"), 16, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

@end
