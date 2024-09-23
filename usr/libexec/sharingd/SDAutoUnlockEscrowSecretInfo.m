@implementation SDAutoUnlockEscrowSecretInfo

- (BOOL)hasSecret
{
  return self->_secret != 0;
}

- (BOOL)hasPairingID
{
  return self->_pairingID != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockEscrowSecretInfo;
  v3 = -[SDAutoUnlockEscrowSecretInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockEscrowSecretInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *secret;
  NSString *pairingID;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  secret = self->_secret;
  if (secret)
    objc_msgSend(v3, "setObject:forKey:", secret, CFSTR("secret"));
  pairingID = self->_pairingID;
  if (pairingID)
    objc_msgSend(v4, "setObject:forKey:", pairingID, CFSTR("pairingID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockEscrowSecretInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *secret;
  NSString *pairingID;
  id v7;

  v4 = a3;
  secret = self->_secret;
  v7 = v4;
  if (secret)
  {
    PBDataWriterWriteDataField(v4, secret, 1);
    v4 = v7;
  }
  pairingID = self->_pairingID;
  if (pairingID)
  {
    PBDataWriterWriteStringField(v7, pairingID, 2);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_secret)
  {
    objc_msgSend(v4, "setSecret:");
    v4 = v5;
  }
  if (self->_pairingID)
  {
    objc_msgSend(v5, "setPairingID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_secret, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_pairingID, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  NSData *secret;
  NSString *pairingID;
  unsigned __int8 v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((secret = self->_secret, !((unint64_t)secret | v4[2]))
     || -[NSData isEqual:](secret, "isEqual:")))
  {
    pairingID = self->_pairingID;
    if ((unint64_t)pairingID | v4[1])
      v8 = -[NSString isEqual:](pairingID, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSData hash](self->_secret, "hash");
  return -[NSString hash](self->_pairingID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[SDAutoUnlockEscrowSecretInfo setSecret:](self, "setSecret:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[SDAutoUnlockEscrowSecretInfo setPairingID:](self, "setPairingID:");
    v4 = v5;
  }

}

- (NSData)secret
{
  return self->_secret;
}

- (void)setSecret:(id)a3
{
  objc_storeStrong((id *)&self->_secret, a3);
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
  objc_storeStrong((id *)&self->_pairingID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secret, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
}

@end
