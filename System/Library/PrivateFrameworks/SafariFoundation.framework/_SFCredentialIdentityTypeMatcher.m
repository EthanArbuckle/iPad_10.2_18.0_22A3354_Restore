@implementation _SFCredentialIdentityTypeMatcher

+ (id)allTypes
{
  _SFCredentialIdentityTypeMatcher *v2;

  v2 = objc_alloc_init(_SFCredentialIdentityTypeMatcher);
  v2->_matchAllTypes = 1;
  v2->_typeToMatch = 0;
  return v2;
}

+ (id)singleType:(int64_t)a3
{
  _SFCredentialIdentityTypeMatcher *v4;

  v4 = objc_alloc_init(_SFCredentialIdentityTypeMatcher);
  v4->_matchAllTypes = 0;
  v4->_typeToMatch = a3;
  return v4;
}

- (BOOL)matchAllTypes
{
  return self->_matchAllTypes;
}

- (int64_t)typeToMatch
{
  return self->_typeToMatch;
}

@end
