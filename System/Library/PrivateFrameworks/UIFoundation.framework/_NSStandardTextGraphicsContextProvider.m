@implementation _NSStandardTextGraphicsContextProvider

+ (Class)colorClassForApplicationFrameworkContext:(int64_t)a3
{
  uint64_t (**v3)(void);

  v3 = getUIColorClass;
  if (a3 != 1)
    v3 = (uint64_t (**)(void))&getNSColorClass_1;
  return (Class)(*v3)();
}

+ (id)graphicsContextForApplicationFrameworkContext:(int64_t)a3
{
  return +[_NSUIKitTextGraphicsContext sharedContext](_NSUIKitTextGraphicsContext, "sharedContext", a3);
}

@end
