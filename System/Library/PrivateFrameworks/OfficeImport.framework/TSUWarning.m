@implementation TSUWarning

+ (id)warningWithMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKind:message:", 0, v4);

  return v5;
}

+ (id)warningWithMessage:(id)a3 affectedObject:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a4);
    a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "warningWithMessage:affectedObjects:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)warningWithMessage:(id)a3 affectedObjects:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "warningWithMessage:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v7, "setAffectedObjects:", v6);

  return v7;
}

+ (id)warningWithKind:(int64_t)a3 message:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKind:message:", a3, v6);

  return v7;
}

- (TSUWarning)initWithKind:(int64_t)a3 message:(id)a4
{
  id v6;
  TSUWarning *v7;
  TSUWarning *v8;
  uint64_t v9;
  NSString *message;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TSUWarning;
  v7 = -[TSUWarning init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_kind = a3;
    v9 = objc_msgSend(v6, "copy");
    message = v8->_message;
    v8->_message = (NSString *)v9;

  }
  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_message, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  void *v8;
  int64_t kind;
  NSString *message;
  NSString *v11;
  NSString *v12;
  char v13;
  NSString *detailMessage;
  NSString *v15;
  NSString *v16;
  NSDictionary *userInfo;
  uint64_t v18;
  void *v19;
  NSDictionary *v20;
  void *v21;

  v6 = a3;
  v7 = objc_opt_class();
  TSUDynamicCast(v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    kind = self->_kind;
    if (kind == objc_msgSend(v8, "kind"))
    {
      message = self->_message;
      objc_msgSend(v8, "message");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (message != v11)
      {
        v12 = self->_message;
        objc_msgSend(v8, "message");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v12, "isEqualToString:", v3))
        {
          v13 = 0;
          goto LABEL_16;
        }
      }
      detailMessage = self->_detailMessage;
      objc_msgSend(v8, "detailMessage");
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (detailMessage == v15
        || (v16 = self->_detailMessage,
            objc_msgSend(v8, "detailMessage"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSString isEqualToString:](v16, "isEqualToString:", v4)))
      {
        userInfo = self->_userInfo;
        objc_msgSend(v8, "userInfo");
        v18 = objc_claimAutoreleasedReturnValue();
        if (userInfo == (NSDictionary *)v18)
        {

          v13 = 1;
        }
        else
        {
          v19 = (void *)v18;
          v20 = self->_userInfo;
          objc_msgSend(v8, "userInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSDictionary isEqualToDictionary:](v20, "isEqualToDictionary:", v21);

        }
        if (detailMessage == v15)
        {
LABEL_15:

          if (message == v11)
          {
LABEL_17:

            goto LABEL_18;
          }
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
        v13 = 0;
      }

      goto LABEL_15;
    }
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (int64_t)severity
{
  return self->_kind != 1;
}

- (id)affectedObjects
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", CFSTR("TSUWarningUserInfoAffectedObjectsKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)setAffectedObjects:(id)a3
{
  NSDictionary *userInfo;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  userInfo = self->_userInfo;
  if (userInfo)
  {
    v6 = a3;
    v7 = (void *)-[NSDictionary mutableCopy](userInfo, "mutableCopy");
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBCED8];
    v9 = a3;
    objc_msgSend(v8, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v7;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, CFSTR("TSUWarningUserInfoAffectedObjectsKey"));

  -[TSUWarning setUserInfo:](self, "setUserInfo:", v10);
}

- (void)addAffectedObjects:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[TSUWarning affectedObjects](self, "affectedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setByAddingObjectsFromSet:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  -[TSUWarning setAffectedObjects:](self, "setAffectedObjects:", v4);

}

+ (id)fontWarningWithMessage:(id)a3 fontNames:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKind:message:", 1, v7);

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v8, "setAffectedObjects:", v6);

  return v8;
}

- (BOOL)isFontWarning
{
  return self->_kind == 1;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)detailMessage
{
  return self->_detailMessage;
}

- (void)setDetailMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_detailMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
