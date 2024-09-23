@implementation SFCollaborationPerformerContext

- (BOOL)requiresParticipants
{
  return self->_requiresParticipants;
}

- (void)setRequiresParticipants:(BOOL)a3
{
  self->_requiresParticipants = a3;
}

- (double)deviceScreenScale
{
  return self->_deviceScreenScale;
}

- (void)setDeviceScreenScale:(double)a3
{
  self->_deviceScreenScale = a3;
}

@end
