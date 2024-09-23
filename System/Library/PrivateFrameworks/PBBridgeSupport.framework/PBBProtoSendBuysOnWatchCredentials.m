@implementation PBBProtoSendBuysOnWatchCredentials

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasPassword
{
  return self->_password != 0;
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
  v8.super_class = (Class)PBBProtoSendBuysOnWatchCredentials;
  -[PBBProtoSendBuysOnWatchCredentials description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoSendBuysOnWatchCredentials dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  username = self->_username;
  if (username)
    objc_msgSend(v3, "setObject:forKey:", username, CFSTR("username"));
  password = self->_password;
  if (password)
    objc_msgSend(v4, "setObject:forKey:", password, CFSTR("password"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoSendBuysOnWatchCredentialsReadFrom((uint64_t)self, (uint64_t)a3);
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

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_username, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_password, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *username;
  NSString *password;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((username = self->_username, !((unint64_t)username | v4[2]))
     || -[NSString isEqual:](username, "isEqual:")))
  {
    password = self->_password;
    if ((unint64_t)password | v4[1])
      v7 = -[NSString isEqual:](password, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_username, "hash");
  return -[NSString hash](self->_password, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[PBBProtoSendBuysOnWatchCredentials setUsername:](self, "setUsername:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[PBBProtoSendBuysOnWatchCredentials setPassword:](self, "setPassword:");
    v4 = v5;
  }

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end
