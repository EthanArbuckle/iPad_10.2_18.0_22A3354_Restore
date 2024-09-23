@implementation PRJyutpingContext

- (PRJyutpingContext)init
{
  PRJyutpingContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRJyutpingContext;
  result = -[PRPinyinContext init](&v3, sel_init);
  if (result)
    result->super._romanization = 1;
  return result;
}

@end
