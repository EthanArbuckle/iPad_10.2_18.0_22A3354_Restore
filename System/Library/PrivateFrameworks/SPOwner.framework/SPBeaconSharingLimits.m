@implementation SPBeaconSharingLimits

- (int64_t)maxCircleMembers
{
  return self->_maxCircleMembers;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconSharingLimits)initWithCoder:(id)a3
{
  self->_maxCircleMembers = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("maxCircleMembers"));
  return self;
}

- (SPBeaconSharingLimits)initWithMaxCircleMembers:(int64_t)a3
{
  SPBeaconSharingLimits *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPBeaconSharingLimits;
  result = -[SPBeaconSharingLimits init](&v5, sel_init);
  if (result)
    result->_maxCircleMembers = a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_maxCircleMembers, CFSTR("maxCircleMembers"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SPBeaconSharingLimits initWithMaxCircleMembers:]([SPBeaconSharingLimits alloc], "initWithMaxCircleMembers:", -[SPBeaconSharingLimits maxCircleMembers](self, "maxCircleMembers"));
}

- (void)setMaxCircleMembers:(int64_t)a3
{
  self->_maxCircleMembers = a3;
}

@end
