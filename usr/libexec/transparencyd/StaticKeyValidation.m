@implementation StaticKeyValidation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyValidation publicID](self, "publicID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyValidation idsURI](self, "idsURI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<StaticKeyValidation: %@ ids: %@ result: %d>"), v3, v4, -[StaticKeyValidation ktResult](self, "ktResult")));

  return v5;
}

- (KTAccountPublicID)publicID
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPublicID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)idsURI
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdsURI:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)ktResult
{
  return self->_ktResult;
}

- (void)setKtResult:(unint64_t)a3
{
  self->_ktResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsURI, 0);
  objc_storeStrong((id *)&self->_publicID, 0);
}

@end
