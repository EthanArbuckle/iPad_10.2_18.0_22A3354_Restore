@implementation CHContactWithReachableDestination

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)reachablePhoneNumber
{
  return self->_reachablePhoneNumber;
}

- (void)setReachablePhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)reachableEmailAddress
{
  return self->_reachableEmailAddress;
}

- (void)setReachableEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)additionalServiceIdentifiers
{
  return self->_additionalServiceIdentifiers;
}

- (void)setAdditionalServiceIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalServiceIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_reachableEmailAddress, 0);
  objc_storeStrong((id *)&self->_reachablePhoneNumber, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
