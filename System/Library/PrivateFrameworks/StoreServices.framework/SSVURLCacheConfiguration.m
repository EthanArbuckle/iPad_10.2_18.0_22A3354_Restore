@implementation SSVURLCacheConfiguration

- (void)setSupportsProcessSharing:(BOOL)a3
{
  self->_supportsProcessSharing = a3;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)supportsProcessSharing
{
  return self->_supportsProcessSharing;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
