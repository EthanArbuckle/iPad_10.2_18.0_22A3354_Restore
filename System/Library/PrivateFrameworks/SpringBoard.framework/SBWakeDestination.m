@implementation SBWakeDestination

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SBSRemoteAlertDefinition)remoteAlertDefinition
{
  return self->_remoteAlertDefinition;
}

- (void)setRemoteAlertDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAlertDefinition, a3);
}

- (SBWakeDestinationHandling)wakeHandler
{
  return self->_wakeHandler;
}

- (void)setWakeHandler:(id)a3
{
  objc_storeStrong((id *)&self->_wakeHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeHandler, 0);
  objc_storeStrong((id *)&self->_remoteAlertDefinition, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
