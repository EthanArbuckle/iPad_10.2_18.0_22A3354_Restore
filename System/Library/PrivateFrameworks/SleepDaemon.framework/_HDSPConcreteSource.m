@implementation _HDSPConcreteSource

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (BOOL)dontNotify
{
  return self->_dontNotify;
}

- (void)setDontNotify:(BOOL)a3
{
  self->_dontNotify = a3;
}

- (BOOL)dontSync
{
  return self->_dontSync;
}

- (void)setDontSync:(BOOL)a3
{
  self->_dontSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

@end
