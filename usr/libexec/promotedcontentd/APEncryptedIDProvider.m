@implementation APEncryptedIDProvider

- (id)encryptedIDsForIDAccountPrivate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  APEncryptedID *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APEncryptedIDProvider currentEncryptedIDs](self, "currentEncryptedIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unencryptedIAdID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iAdID"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v9 = v5;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APEncryptedIDProvider oldEncryptedIDs](self, "oldEncryptedIDs"));
    v11 = v10;
    if (v10
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "unencryptedIAdID")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iAdID")),
          v14 = objc_msgSend(v12, "isEqual:", v13),
          v13,
          v12,
          v14))
    {
      v9 = v11;
    }
    else
    {
      v9 = -[APEncryptedID initWithIDAccountPrivate:]([APEncryptedID alloc], "initWithIDAccountPrivate:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[APEncryptedIDProvider oldEncryptedIDs](self, "oldEncryptedIDs"));

      if (!v15)
        -[APEncryptedIDProvider setOldEncryptedIDs:](self, "setOldEncryptedIDs:", v9);
    }

  }
  return v9;
}

- (APEncryptedID)currentEncryptedIDs
{
  return (APEncryptedID *)objc_getProperty(self, a2, 8, 1);
}

+ (id)provider
{
  if (qword_100269728 != -1)
    dispatch_once(&qword_100269728, &stru_100214668);
  return (id)qword_100269720;
}

- (APEncryptedIDProvider)init
{
  APEncryptedIDProvider *v2;
  APEncryptedIDProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APEncryptedIDProvider;
  v2 = -[APEncryptedIDProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[APEncryptedIDProvider _encryptIDs](v2, "_encryptIDs");
  return v3;
}

- (void)userAccountChanged
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APEncryptedIDProvider currentEncryptedIDs](self, "currentEncryptedIDs"));
  -[APEncryptedIDProvider setOldEncryptedIDs:](self, "setOldEncryptedIDs:", v3);

  -[APEncryptedIDProvider _encryptIDs](self, "_encryptIDs");
}

- (void)_encryptIDs
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  APEncryptedID *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider userAccount](APIDAccountProvider, "userAccount"));
  if (!v3)
  {
    v4 = APLogForCategory(21);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "User Account is nil", v7, 2u);
    }

  }
  v6 = -[APEncryptedID initWithIDAccountPrivate:]([APEncryptedID alloc], "initWithIDAccountPrivate:", v3);
  -[APEncryptedIDProvider setCurrentEncryptedIDs:](self, "setCurrentEncryptedIDs:", v6);

}

- (void)setCurrentEncryptedIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (APEncryptedID)oldEncryptedIDs
{
  return (APEncryptedID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOldEncryptedIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldEncryptedIDs, 0);
  objc_storeStrong((id *)&self->_currentEncryptedIDs, 0);
}

@end
