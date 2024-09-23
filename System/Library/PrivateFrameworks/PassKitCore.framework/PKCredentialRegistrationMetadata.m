@implementation PKCredentialRegistrationMetadata

- (PKCredentialRegistrationMetadata)initWithProductType:(int64_t)a3
{
  PKCredentialRegistrationMetadata *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCredentialRegistrationMetadata;
  result = -[PKCredentialRegistrationMetadata init](&v5, sel_init);
  if (result)
    result->_productType = a3;
  return result;
}

- (int64_t)productType
{
  return self->_productType;
}

@end
