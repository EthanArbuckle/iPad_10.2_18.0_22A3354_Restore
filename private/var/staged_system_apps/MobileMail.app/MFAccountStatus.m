@implementation MFAccountStatus

- (MFAccountStatus)initWithAccount:(id)a3 accountStatus:(int64_t)a4 error:(id)a5
{
  id v9;
  id v10;
  MFAccountStatus *v11;
  MFAccountStatus *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MFAccountStatus;
  v11 = -[MFAccountStatus init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a3);
    v12->_status = a4;
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

- (MFAccountStatus)initWithAccount:(id)a3
{
  return -[MFAccountStatus initWithAccount:accountStatus:error:](self, "initWithAccount:accountStatus:error:", a3, 0, 0);
}

- (id)stringForAccountStatusType
{
  unint64_t v2;

  v2 = -[MFAccountStatus status](self, "status");
  if (v2 > 3)
    return 0;
  else
    return *(&off_1005205A0 + v2);
}

- (MFAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (MFError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
