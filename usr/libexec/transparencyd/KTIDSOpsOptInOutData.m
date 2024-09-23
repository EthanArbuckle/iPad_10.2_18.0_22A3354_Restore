@implementation KTIDSOpsOptInOutData

- (id)description
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSOpsOptInOutData optInStatus](self, "optInStatus"));
  v4 = objc_msgSend(v3, "BOOLValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSOpsOptInOutData publicAccountKey](self, "publicAccountKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTIDSOpsOptInOutData: %d publicKey: %@>"), v4, v6));

  return v7;
}

- (NSData)publicAccountKey
{
  return self->_publicAccountKey;
}

- (void)setPublicAccountKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicAccountKey, a3);
}

- (NSNumber)optInStatus
{
  return self->_optInStatus;
}

- (void)setOptInStatus:(id)a3
{
  objc_storeStrong((id *)&self->_optInStatus, a3);
}

- (NSString)ktApplication
{
  return self->_ktApplication;
}

- (void)setKtApplication:(id)a3
{
  objc_storeStrong((id *)&self->_ktApplication, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktApplication, 0);
  objc_storeStrong((id *)&self->_optInStatus, 0);
  objc_storeStrong((id *)&self->_publicAccountKey, 0);
}

@end
