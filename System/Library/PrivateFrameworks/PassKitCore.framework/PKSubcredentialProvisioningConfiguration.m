@implementation PKSubcredentialProvisioningConfiguration

- (PKSubcredentialProvisioningConfiguration)initWithConfigurationType:(int64_t)a3
{
  PKSubcredentialProvisioningConfiguration *result;

  result = -[PKSubcredentialProvisioningConfiguration init](self, "init");
  if (result)
    result->_configurationType = a3;
  return result;
}

- (id)localDeviceConfiguration
{
  if (self->_configurationType > 1uLL)
    return 0;
  else
    return self;
}

- (id)ownerConfiguration
{
  if (self->_configurationType)
    return 0;
  else
    return self;
}

- (id)remoteDeviceConfiguration
{
  if (self->_configurationType == 2)
    return self;
  else
    return 0;
}

- (id)acceptInvitationConfiguration
{
  if (self->_configurationType == 1)
    return self;
  else
    return 0;
}

- (id)remoteDeviceInvitation
{
  if ((self->_configurationType & 0xFFFFFFFFFFFFFFFELL) == 2)
    return self;
  else
    return 0;
}

- (id)transitionTable
{
  return 0;
}

- (int64_t)startingState
{
  return 0;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

@end
