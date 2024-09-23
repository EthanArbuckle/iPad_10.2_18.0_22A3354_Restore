@implementation SISensitiveConditionsSet

- (SISensitiveConditionsSet)init
{
  return -[SISensitiveConditionsSet initWithBitMask:](self, "initWithBitMask:", 0);
}

- (SISensitiveConditionsSet)initWithBitMask:(unint64_t)a3
{
  SISensitiveConditionsSet *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SISensitiveConditionsSet;
  result = -[SISensitiveConditionsSet init](&v5, sel_init);
  if (result)
    result->_bitmask = a3;
  return result;
}

- (void)removeConditions:(id)a3
{
  self->_bitmask &= ~*((_QWORD *)a3 + 1);
}

- (void)addDeviceSensitivityState:(int)a3
{
  self->_bitmask |= 1 << a3;
}

- (void)removeDeviceSensitivityState:(int)a3
{
  self->_bitmask &= ~(1 << a3);
}

- (BOOL)isDeviceSensitivityStateSet:(int)a3
{
  return ((1 << a3) & ~self->_bitmask) == 0;
}

- (BOOL)isEmpty
{
  return self->_bitmask == 0;
}

- (BOOL)intersectsWith:(id)a3
{
  return (*((_QWORD *)a3 + 1) & self->_bitmask) != 0;
}

- (BOOL)isEqualToConditionsSet:(id)a3
{
  return self->_bitmask == *((_QWORD *)a3 + 1);
}

- (id)unionSetWith:(id)a3
{
  return -[SISensitiveConditionsSet initWithBitMask:]([SISensitiveConditionsSet alloc], "initWithBitMask:", *((_QWORD *)a3 + 1) | self->_bitmask);
}

- (id)differenceSetFrom:(id)a3
{
  return -[SISensitiveConditionsSet initWithBitMask:]([SISensitiveConditionsSet alloc], "initWithBitMask:", self->_bitmask & ~*((_QWORD *)a3 + 1));
}

- (id)intersectionSetWith:(id)a3
{
  return -[SISensitiveConditionsSet initWithBitMask:]([SISensitiveConditionsSet alloc], "initWithBitMask:", *((_QWORD *)a3 + 1) & self->_bitmask);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SISensitiveConditionsSet initWithBitMask:]([SISensitiveConditionsSet alloc], "initWithBitMask:", self->_bitmask);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SISensitiveConditionsSet isEqualToConditionsSet:](self, "isEqualToConditionsSet:", v4);

  return v5;
}

- (unint64_t)hash
{
  return self->_bitmask;
}

+ (id)fromDeviceSensitivityState:(int)a3
{
  return -[SISensitiveConditionsSet initWithBitMask:]([SISensitiveConditionsSet alloc], "initWithBitMask:", 1 << a3);
}

@end
