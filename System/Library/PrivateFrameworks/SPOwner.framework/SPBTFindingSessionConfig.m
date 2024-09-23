@implementation SPBTFindingSessionConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SPBTFindingSessionConfig initWithOptInRawRSSIMeasurement:]([SPBTFindingSessionConfig alloc], "initWithOptInRawRSSIMeasurement:", -[SPBTFindingSessionConfig optInRawRSSIMeasurement](self, "optInRawRSSIMeasurement"));
}

- (SPBTFindingSessionConfig)initWithOptInRawRSSIMeasurement:(BOOL)a3
{
  SPBTFindingSessionConfig *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPBTFindingSessionConfig;
  result = -[SPBTFindingSessionConfig init](&v5, sel_init);
  if (result)
    result->_optInRawRSSIMeasurement = a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_optInRawRSSIMeasurement, CFSTR("optInRawRSSIMeasurement"));
}

- (SPBTFindingSessionConfig)initWithCoder:(id)a3
{
  self->_optInRawRSSIMeasurement = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("optInRawRSSIMeasurement"));
  return self;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: optInRawRSSIMeasurement: %d>"), objc_opt_class(), self, -[SPBTFindingSessionConfig optInRawRSSIMeasurement](self, "optInRawRSSIMeasurement"));
}

- (BOOL)optInRawRSSIMeasurement
{
  return self->_optInRawRSSIMeasurement;
}

@end
