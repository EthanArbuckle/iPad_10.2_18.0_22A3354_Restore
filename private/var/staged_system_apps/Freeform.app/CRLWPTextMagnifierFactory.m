@implementation CRLWPTextMagnifierFactory

+ (id)textMagnfier
{
  unsigned int v2;
  __objc2_class **v3;

  v2 = +[CRLWPTextMagnifierFactory shouldUseModernMagnifiers](CRLWPTextMagnifierFactory, "shouldUseModernMagnifiers");
  v3 = off_101229A70;
  if (!v2)
    v3 = off_101229A58;
  return (id)objc_opt_new(*v3);
}

+ (BOOL)shouldUseModernMagnifiers
{
  return 1;
}

@end
