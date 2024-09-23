@implementation PKShareCapabilityRowItem

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  self->_sectionIdentifier = (NSString *)a3;
}

- (unint64_t)capability
{
  return self->_capability;
}

- (void)setCapability:(unint64_t)a3
{
  self->_capability = a3;
}

- (PKPassEntitlementCapabilitySet)capabilitySet
{
  return self->_capabilitySet;
}

- (void)setCapabilitySet:(id)a3
{
  objc_storeStrong((id *)&self->_capabilitySet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitySet, 0);
}

@end
