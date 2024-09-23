@implementation TUIElementAnimation

+ (id)supportedAttributes
{
  if (qword_2CB878 != -1)
    dispatch_once(&qword_2CB878, &stru_242460);
  return (id)qword_2CB870;
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (BOOL)resolveAttributes
{
  return 0;
}

+ (BOOL)instantiateChildren
{
  return 0;
}

+ (id)attributesToIgnoreWhenResolvingInvocation
{
  if (qword_2CB888 != -1)
    dispatch_once(&qword_2CB888, &stru_242480);
  return (id)qword_2CB880;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8;
  id v9;

  v9 = a5;
  v8 = a6;
  objc_msgSend(v8, "defineAnimation:closure:", objc_msgSend(v9, "animationDefinitonWithNode:nameAttribute:", a4.var0, 138), objc_msgSend(v9, "closureForNode:", a4.var0));

}

@end
