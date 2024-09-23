@implementation TUIWPTemporaryObjectContext

+ (id)temporaryObjectContext
{
  id v2;
  TUIWPTemporaryObjectContext *v3;

  v2 = objc_alloc_init((Class)TSPTemporaryObjectContextDelegate);
  v3 = -[TUIWPTemporaryObjectContext initWithDelegate:]([TUIWPTemporaryObjectContext alloc], "initWithDelegate:", v2);

  return v3;
}

@end
