@implementation HVMutableContentState

- (void)setLevelOfService:(unsigned __int8)a3
{
  self->super._levelOfService = a3;
}

- (void)setConsumers:(id)a3
{
  NSSet *v4;
  NSSet *consumers;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  consumers = self->super._consumers;
  self->super._consumers = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HVContentState initWithConsumers:levelOfService:]([HVContentState alloc], "initWithConsumers:levelOfService:", self->super._consumers, self->super._levelOfService);
}

@end
