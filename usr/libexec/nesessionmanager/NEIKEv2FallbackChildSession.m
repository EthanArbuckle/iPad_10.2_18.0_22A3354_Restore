@implementation NEIKEv2FallbackChildSession

- (id)description
{
  if (self)
    self = (NEIKEv2FallbackChildSession *)objc_getProperty(self, a2, 16, 1);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tunnelInterface, 0);
  objc_storeStrong((id *)&self->_tunnelSession, 0);
  objc_storeStrong((id *)&self->_tunnelName, 0);
}

@end
