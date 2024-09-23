@implementation TUIMutableTransactionOptions

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUITransactionOptions initWithOther:]([TUITransactionOptions alloc], "initWithOther:", self);
}

@end
