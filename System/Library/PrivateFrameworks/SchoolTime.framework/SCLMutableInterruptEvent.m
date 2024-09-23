@implementation SCLMutableInterruptEvent

- (void)setType:(unint64_t)a3
{
  self->super._type = a3;
}

- (void)setUrgency:(unint64_t)a3
{
  self->super._urgency = a3;
}

- (void)setSender:(id)a3
{
  SCLContact *v4;
  SCLContact *sender;

  v4 = (SCLContact *)objc_msgSend(a3, "copy");
  sender = self->super._sender;
  self->super._sender = v4;

}

- (void)setShouldAlwaysInterrupt:(BOOL)a3
{
  self->super._urgency = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SCLInterruptEvent _initWithEvent:]([SCLInterruptEvent alloc], "_initWithEvent:", self);
}

@end
