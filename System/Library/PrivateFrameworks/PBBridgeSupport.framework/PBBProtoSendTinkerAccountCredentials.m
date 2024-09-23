@implementation PBBProtoSendTinkerAccountCredentials

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasPassword
{
  return self->_password != 0;
}

- (BOOL)hasAcceptedTermsData
{
  return self->_acceptedTermsData != 0;
}

- (BOOL)hasPairingParentAltDSID
{
  return self->_pairingParentAltDSID != 0;
}

- (BOOL)hasPairingParentAppleID
{
  return self->_pairingParentAppleID != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoSendTinkerAccountCredentials;
  -[PBBProtoSendTinkerAccountCredentials description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoSendTinkerAccountCredentials dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *username;
  NSString *password;
  NSData *acceptedTermsData;
  NSString *pairingParentAltDSID;
  NSString *pairingParentAppleID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  username = self->_username;
  if (username)
    objc_msgSend(v3, "setObject:forKey:", username, CFSTR("username"));
  password = self->_password;
  if (password)
    objc_msgSend(v4, "setObject:forKey:", password, CFSTR("password"));
  acceptedTermsData = self->_acceptedTermsData;
  if (acceptedTermsData)
    objc_msgSend(v4, "setObject:forKey:", acceptedTermsData, CFSTR("acceptedTermsData"));
  pairingParentAltDSID = self->_pairingParentAltDSID;
  if (pairingParentAltDSID)
    objc_msgSend(v4, "setObject:forKey:", pairingParentAltDSID, CFSTR("pairingParentAltDSID"));
  pairingParentAppleID = self->_pairingParentAppleID;
  if (pairingParentAppleID)
    objc_msgSend(v4, "setObject:forKey:", pairingParentAppleID, CFSTR("pairingParentAppleID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoSendTinkerAccountCredentialsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_password)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_acceptedTermsData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_pairingParentAltDSID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_pairingParentAppleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_username)
  {
    objc_msgSend(v4, "setUsername:");
    v4 = v5;
  }
  if (self->_password)
  {
    objc_msgSend(v5, "setPassword:");
    v4 = v5;
  }
  if (self->_acceptedTermsData)
  {
    objc_msgSend(v5, "setAcceptedTermsData:");
    v4 = v5;
  }
  if (self->_pairingParentAltDSID)
  {
    objc_msgSend(v5, "setPairingParentAltDSID:");
    v4 = v5;
  }
  if (self->_pairingParentAppleID)
  {
    objc_msgSend(v5, "setPairingParentAppleID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_username, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSString copyWithZone:](self->_password, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSData copyWithZone:](self->_acceptedTermsData, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_pairingParentAltDSID, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[NSString copyWithZone:](self->_pairingParentAppleID, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *username;
  NSString *password;
  NSData *acceptedTermsData;
  NSString *pairingParentAltDSID;
  NSString *pairingParentAppleID;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((username = self->_username, !((unint64_t)username | v4[5]))
     || -[NSString isEqual:](username, "isEqual:"))
    && ((password = self->_password, !((unint64_t)password | v4[4]))
     || -[NSString isEqual:](password, "isEqual:"))
    && ((acceptedTermsData = self->_acceptedTermsData, !((unint64_t)acceptedTermsData | v4[1]))
     || -[NSData isEqual:](acceptedTermsData, "isEqual:"))
    && ((pairingParentAltDSID = self->_pairingParentAltDSID, !((unint64_t)pairingParentAltDSID | v4[2]))
     || -[NSString isEqual:](pairingParentAltDSID, "isEqual:")))
  {
    pairingParentAppleID = self->_pairingParentAppleID;
    if ((unint64_t)pairingParentAppleID | v4[3])
      v10 = -[NSString isEqual:](pairingParentAppleID, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_username, "hash");
  v4 = -[NSString hash](self->_password, "hash") ^ v3;
  v5 = -[NSData hash](self->_acceptedTermsData, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_pairingParentAltDSID, "hash");
  return v6 ^ -[NSString hash](self->_pairingParentAppleID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[5])
    -[PBBProtoSendTinkerAccountCredentials setUsername:](self, "setUsername:");
  if (v4[4])
    -[PBBProtoSendTinkerAccountCredentials setPassword:](self, "setPassword:");
  if (v4[1])
    -[PBBProtoSendTinkerAccountCredentials setAcceptedTermsData:](self, "setAcceptedTermsData:");
  if (v4[2])
    -[PBBProtoSendTinkerAccountCredentials setPairingParentAltDSID:](self, "setPairingParentAltDSID:");
  if (v4[3])
    -[PBBProtoSendTinkerAccountCredentials setPairingParentAppleID:](self, "setPairingParentAppleID:");

}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSData)acceptedTermsData
{
  return self->_acceptedTermsData;
}

- (void)setAcceptedTermsData:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedTermsData, a3);
}

- (NSString)pairingParentAltDSID
{
  return self->_pairingParentAltDSID;
}

- (void)setPairingParentAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_pairingParentAltDSID, a3);
}

- (NSString)pairingParentAppleID
{
  return self->_pairingParentAppleID;
}

- (void)setPairingParentAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_pairingParentAppleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairingParentAppleID, 0);
  objc_storeStrong((id *)&self->_pairingParentAltDSID, 0);
  objc_storeStrong((id *)&self->_acceptedTermsData, 0);
}

@end
