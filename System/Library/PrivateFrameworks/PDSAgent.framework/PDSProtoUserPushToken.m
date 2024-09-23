@implementation PDSProtoUserPushToken

- (BOOL)hasUserAuth
{
  return self->_userAuth != 0;
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
  v8.super_class = (Class)PDSProtoUserPushToken;
  -[PDSProtoUserPushToken description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSProtoUserPushToken dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *userId;
  PDSProtoUserAuth *userAuth;
  void *v7;
  NSString *pushToken;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  userId = self->_userId;
  if (userId)
    objc_msgSend(v3, "setObject:forKey:", userId, CFSTR("user_id"));
  userAuth = self->_userAuth;
  if (userAuth)
  {
    -[PDSProtoUserAuth dictionaryRepresentation](userAuth, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("user_auth"));

  }
  pushToken = self->_pushToken;
  if (pushToken)
    objc_msgSend(v4, "setObject:forKey:", pushToken, CFSTR("push_token"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PDSProtoUserPushTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_userId)
    -[PDSProtoUserPushToken writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_userAuth)
    PBDataWriterWriteSubmessage();
  if (!self->_pushToken)
    -[PDSProtoUserPushToken writeTo:].cold.2();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setUserId:", self->_userId);
  if (self->_userAuth)
    objc_msgSend(v4, "setUserAuth:");
  objc_msgSend(v4, "setPushToken:", self->_pushToken);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[PDSProtoUserAuth copyWithZone:](self->_userAuth, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_pushToken, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *userId;
  PDSProtoUserAuth *userAuth;
  NSString *pushToken;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((userId = self->_userId, !((unint64_t)userId | v4[3]))
     || -[NSString isEqual:](userId, "isEqual:"))
    && ((userAuth = self->_userAuth, !((unint64_t)userAuth | v4[2]))
     || -[PDSProtoUserAuth isEqual:](userAuth, "isEqual:")))
  {
    pushToken = self->_pushToken;
    if ((unint64_t)pushToken | v4[1])
      v8 = -[NSString isEqual:](pushToken, "isEqual:");
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
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_userId, "hash");
  v4 = -[PDSProtoUserAuth hash](self->_userAuth, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_pushToken, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PDSProtoUserAuth *userAuth;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[PDSProtoUserPushToken setUserId:](self, "setUserId:");
    v4 = v7;
  }
  userAuth = self->_userAuth;
  v6 = v4[2];
  if (userAuth)
  {
    if (!v6)
      goto LABEL_9;
    -[PDSProtoUserAuth mergeFrom:](userAuth, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[PDSProtoUserPushToken setUserAuth:](self, "setUserAuth:");
  }
  v4 = v7;
LABEL_9:
  if (v4[1])
  {
    -[PDSProtoUserPushToken setPushToken:](self, "setPushToken:");
    v4 = v7;
  }

}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (PDSProtoUserAuth)userAuth
{
  return self->_userAuth;
}

- (void)setUserAuth:(id)a3
{
  objc_storeStrong((id *)&self->_userAuth, a3);
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_userAuth, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[PDSProtoUserPushToken writeTo:]", "PDSProtoUserPushToken.m", 112, "nil != self->_userId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[PDSProtoUserPushToken writeTo:]", "PDSProtoUserPushToken.m", 124, "nil != self->_pushToken");
}

@end
