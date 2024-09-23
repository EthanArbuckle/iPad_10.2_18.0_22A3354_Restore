@implementation SPBeaconIndex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconIndex)initWithSequence:(unsigned __int8)a3 index:(unint64_t)a4
{
  SPBeaconIndex *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPBeaconIndex;
  result = -[SPBeaconIndex init](&v7, sel_init);
  if (result)
  {
    result->_sequence = a3;
    result->_index = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SPBeaconIndex initWithSequence:index:]([SPBeaconIndex alloc], "initWithSequence:index:", self->_sequence, self->_index);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sequence;
  id v5;

  sequence = self->_sequence;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sequence, CFSTR("sequence"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_index, CFSTR("index"));

}

- (SPBeaconIndex)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  self->_sequence = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sequence"));
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("index"));

  self->_index = v5;
  return self;
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned __int8)a3
{
  self->_sequence = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end
