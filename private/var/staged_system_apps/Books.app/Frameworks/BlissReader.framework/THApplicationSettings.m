@implementation THApplicationSettings

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___THApplicationSettings;
  return objc_msgSendSuper2(&v3, "allocWithZone:", 0);
}

+ (id)sharedSettings
{
  id result;
  id v4;

  result = (id)qword_543188;
  if (!qword_543188)
  {
    objc_sync_enter(a1);
    if (!qword_543188)
    {
      v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_543188 = (uint64_t)v4;
      if (!v4)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THApplicationSettings sharedSettings]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplicationSettings.m"), 46, CFSTR("Couldn't create singleton instance of %@"), a1);
    }
    objc_sync_exit(a1);
    return (id)qword_543188;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THApplicationSettings allocWithZone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplicationSettings.m"), 46, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (unint64_t)flowSizeScale
{
  NSUserDefaults *v2;
  id v3;
  unint64_t result;

  v2 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v3 = -[NSUserDefaults objectForKey:](v2, "objectForKey:", kTHApplicationSettingsFlowSizeScale);
  if (!v3)
    return 3;
  result = (unint64_t)objc_msgSend(v3, "unsignedIntegerValue");
  if (result >= 0xB)
    return 11;
  return result;
}

- (void)setFlowSizeScale:(unint64_t)a3
{
  unint64_t v3;
  NSUserDefaults *v4;
  NSNotificationCenter *v5;

  if (a3 >= 0xB)
    v3 = 11;
  else
    v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  -[NSUserDefaults setInteger:forKey:](v4, "setInteger:forKey:", v3, kTHApplicationSettingsFlowSizeScale);
  v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:](v5, "postNotificationName:object:", THFlowFontScaleChangedNotification, 0);
}

- (double)flowFontScale
{
  return dbl_313F18[-[THApplicationSettings flowSizeScale](self, "flowSizeScale")];
}

- (double)flowFontScaleForFontSize:(unint64_t)a3
{
  return dbl_313F18[a3];
}

@end
