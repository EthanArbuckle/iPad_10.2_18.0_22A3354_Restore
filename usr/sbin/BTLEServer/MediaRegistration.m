@implementation MediaRegistration

- (NSString)lastKnownAttributeValue
{
  return self->_lastKnownAttributeValue;
}

- (void)setLastKnownAttributeValue:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownAttributeValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownAttributeValue, 0);
}

@end
