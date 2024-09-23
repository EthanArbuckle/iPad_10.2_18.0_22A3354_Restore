@implementation AEAAuditToken

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
}

@end
