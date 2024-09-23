@implementation SISensitiveConditionsMessagePolicyResult

- (BOOL)suppressMessage
{
  return self->_suppressMessage;
}

- (void)setSuppressMessage:(BOOL)a3
{
  self->_suppressMessage = a3;
}

@end
