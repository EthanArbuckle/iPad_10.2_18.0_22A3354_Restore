@implementation WebUndefined

+ (WebUndefined)allocWithZone:(_NSZone *)a3
{
  id v3;
  const void *v4;
  objc_super v6;

  if ((_MergedGlobals_299 & 1) != 0)
  {
    v3 = (id)qword_1ECE86C10;
    if (qword_1ECE86C10)
      return (WebUndefined *)v3;
  }
  else
  {
    qword_1ECE86C10 = 0;
    _MergedGlobals_299 = 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WebUndefined;
  v3 = objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  v4 = (const void *)qword_1ECE86C10;
  qword_1ECE86C10 = (uint64_t)v3;
  if (v4)
  {
    CFRelease(v4);
    v3 = (id)qword_1ECE86C10;
  }
  return (WebUndefined *)v3;
}

- (id)description
{
  return CFSTR("undefined");
}

- (unint64_t)retainCount
{
  return -1;
}

+ (WebUndefined)undefined
{
  return (WebUndefined *)(id)CFMakeCollectable(objc_alloc_init(WebUndefined));
}

@end
