@implementation SXTemporaryObjectContext

+ (id)temporaryObjectContext
{
  id v2;
  SXTemporaryObjectContext *v3;

  v2 = objc_alloc_init(MEMORY[0x24BEB3AE0]);
  v3 = -[TSPObjectContext initWithDelegate:]([SXTemporaryObjectContext alloc], "initWithDelegate:", v2);

  return v3;
}

@end
