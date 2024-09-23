@implementation HAPSecuritySessionDelegateAdditionalDerivedKeyTuple

+ (id)new
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unavailable"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)init
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unavailable"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (HAPSecuritySessionDelegateAdditionalDerivedKeyTuple)initWithName:(id)a3 saltData:(id)a4 infoData:(id)a5
{
  id v8;
  id v9;
  id v10;
  HAPSecuritySessionDelegateAdditionalDerivedKeyTuple *v11;
  NSString *v12;
  NSString *name;
  NSData *v14;
  NSData *saltData;
  NSData *v16;
  NSData *infoData;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HAPSecuritySessionDelegateAdditionalDerivedKeyTuple;
  v11 = -[HAPSecuritySessionDelegateAdditionalDerivedKeyTuple init](&v19, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = v12;

    v14 = (NSData *)objc_msgSend(v9, "copy");
    saltData = v11->_saltData;
    v11->_saltData = v14;

    v16 = (NSData *)objc_msgSend(v10, "copy");
    infoData = v11->_infoData;
    v11->_infoData = v16;

  }
  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)saltData
{
  return self->_saltData;
}

- (NSData)infoData
{
  return self->_infoData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoData, 0);
  objc_storeStrong((id *)&self->_saltData, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
