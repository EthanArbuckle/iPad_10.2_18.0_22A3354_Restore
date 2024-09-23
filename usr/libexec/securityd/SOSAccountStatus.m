@implementation SOSAccountStatus

- (id)init:(int)a3 error:(id)a4
{
  id v7;
  SOSAccountStatus *v8;
  SOSAccountStatus *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SOSAccountStatus;
  v8 = -[SOSAccountStatus init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  char isKindOfClass;
  unsigned __int8 v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = objc_opt_class(SOSAccountStatus);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);
  v8 = 0;
  if (v5 && (isKindOfClass & 1) != 0)
  {
    v9 = v5;
    v10 = -[SOSAccountStatus status](self, "status");
    if (v10 != objc_msgSend(v9, "status"))
    {
      v8 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountStatus error](self, "error"));
    if (v11 || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"))) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountStatus error](self, "error"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
      v8 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v8 = 1;
    }

    goto LABEL_11;
  }
LABEL_13:

  return v8;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = SOSCCGetStatusDescription(-[SOSAccountStatus status](self, "status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountStatus error](self, "error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<SOSStatus: %@ (%@)>"), v3, v4));

  return v5;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
