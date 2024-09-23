@implementation PDSProtoUserPushTokenRegResponse

- (BOOL)hasMessage
{
  return self->_message != 0;
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
  v8.super_class = (Class)PDSProtoUserPushTokenRegResponse;
  -[PDSProtoUserPushTokenRegResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSProtoUserPushTokenRegResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PDSProtoUserPushToken *userPushToken;
  void *v5;
  void *v6;
  NSString *message;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  userPushToken = self->_userPushToken;
  if (userPushToken)
  {
    -[PDSProtoUserPushToken dictionaryRepresentation](userPushToken, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_push_token"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_status);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("status"));

  message = self->_message;
  if (message)
    objc_msgSend(v3, "setObject:forKey:", message, CFSTR("message"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoUserPushTokenRegResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_userPushToken)
    -[PDSProtoUserPushTokenRegResponse writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  if (self->_message)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _DWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "setUserPushToken:", self->_userPushToken);
  v4 = v5;
  v5[4] = self->_status;
  if (self->_message)
  {
    objc_msgSend(v5, "setMessage:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PDSProtoUserPushToken copyWithZone:](self->_userPushToken, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 16) = self->_status;
  v8 = -[NSString copyWithZone:](self->_message, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PDSProtoUserPushToken *userPushToken;
  NSString *message;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((userPushToken = self->_userPushToken, !((unint64_t)userPushToken | v4[3]))
     || -[PDSProtoUserPushToken isEqual:](userPushToken, "isEqual:"))
    && self->_status == *((_DWORD *)v4 + 4))
  {
    message = self->_message;
    if ((unint64_t)message | v4[1])
      v7 = -[NSString isEqual:](message, "isEqual:");
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
  unint64_t v3;
  uint64_t v4;

  v3 = -[PDSProtoUserPushToken hash](self->_userPushToken, "hash");
  v4 = 2654435761 * self->_status;
  return v4 ^ v3 ^ -[NSString hash](self->_message, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PDSProtoUserPushToken *userPushToken;
  uint64_t v6;
  id v7;

  v4 = a3;
  userPushToken = self->_userPushToken;
  v6 = *((_QWORD *)v4 + 3);
  v7 = v4;
  if (userPushToken)
  {
    if (!v6)
      goto LABEL_7;
    -[PDSProtoUserPushToken mergeFrom:](userPushToken, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PDSProtoUserPushTokenRegResponse setUserPushToken:](self, "setUserPushToken:");
  }
  v4 = v7;
LABEL_7:
  self->_status = *((_DWORD *)v4 + 4);
  if (*((_QWORD *)v4 + 1))
  {
    -[PDSProtoUserPushTokenRegResponse setMessage:](self, "setMessage:");
    v4 = v7;
  }

}

- (PDSProtoUserPushToken)userPushToken
{
  return self->_userPushToken;
}

- (void)setUserPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_userPushToken, a3);
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPushToken, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[PDSProtoUserPushTokenRegResponse writeTo:]", "PDSProtoUserPushTokenRegResponse.m", 108, "self->_userPushToken != nil");
}

@end
