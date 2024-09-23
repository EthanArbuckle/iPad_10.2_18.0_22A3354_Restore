@implementation TXRDefaultBufferAllocator

+ (id)newBufferWithLength:(unint64_t)a3
{
  return -[TXRDefaultBuffer initWithLength:]([TXRDefaultBuffer alloc], "initWithLength:", a3);
}

- (id)newBufferWithLength:(unint64_t)a3
{
  return -[TXRDefaultBuffer initWithLength:]([TXRDefaultBuffer alloc], "initWithLength:", a3);
}

@end
