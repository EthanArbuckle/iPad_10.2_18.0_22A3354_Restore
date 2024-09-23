@implementation RMLogItemInternal

- (RMLogItemInternal)initWithTimestamp:(double)a3
{
  RMLogItemInternal *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RMLogItemInternal;
  result = -[RMLogItemInternal init](&v5, sel_init);
  if (result)
    result->fTimestamp = a3;
  return result;
}

@end
