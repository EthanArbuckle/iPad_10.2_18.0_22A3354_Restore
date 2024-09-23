@implementation NRDLDDataClassKeychainItems

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  NRDLDKeychainItemSecKey *remotePublicKey;
  NRDLDKeychainItemSecKey *v6;
  id v7;
  NRDLDKeychainItemSecKey *localPrivateKey;
  NRDLDKeychainItemSecKey *v9;
  id v10;
  NRDLDKeychainItemSecKey *dhLocalPrivateKey;
  NRDLDKeychainItemSecKey *v12;
  id v13;
  NRDLDKeychainItemData *sharedSecret;
  NRDLDKeychainItemData *v15;
  id v16;

  v4 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  if (self)
    remotePublicKey = self->_remotePublicKey;
  else
    remotePublicKey = 0;
  v6 = remotePublicKey;
  v7 = -[NRDLDKeychainItemSecKey copy](v6, "copy");
  if (v4)
    objc_storeStrong(v4 + 1, v7);

  if (self)
    localPrivateKey = self->_localPrivateKey;
  else
    localPrivateKey = 0;
  v9 = localPrivateKey;
  v10 = -[NRDLDKeychainItemSecKey copy](v9, "copy");
  if (v4)
    objc_storeStrong(v4 + 2, v10);

  if (self)
    dhLocalPrivateKey = self->_dhLocalPrivateKey;
  else
    dhLocalPrivateKey = 0;
  v12 = dhLocalPrivateKey;
  v13 = -[NRDLDKeychainItemSecKey copy](v12, "copy");
  if (v4)
    objc_storeStrong(v4 + 4, v13);

  if (self)
    sharedSecret = self->_sharedSecret;
  else
    sharedSecret = 0;
  v15 = sharedSecret;
  v16 = -[NRDLDKeychainItemData copy](v15, "copy");
  if (v4)
    objc_storeStrong(v4 + 3, v16);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dhLocalPrivateKey, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_localPrivateKey, 0);
  objc_storeStrong((id *)&self->_remotePublicKey, 0);
}

@end
