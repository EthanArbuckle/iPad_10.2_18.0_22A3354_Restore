@implementation TVPContentKeyRequestParams

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (NSArray)keyFormatVersions
{
  return self->_keyFormatVersions;
}

- (void)setKeyFormatVersions:(id)a3
{
  objc_storeStrong((id *)&self->_keyFormatVersions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFormatVersions, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
