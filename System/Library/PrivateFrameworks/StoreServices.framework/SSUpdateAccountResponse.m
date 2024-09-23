@implementation SSUpdateAccountResponse

- (SSUpdateAccountResponse)initWithUpdatedAccount:(id)a3 credentialSource:(unint64_t)a4
{
  id v7;
  SSUpdateAccountResponse *v8;
  SSUpdateAccountResponse *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSUpdateAccountResponse;
  v8 = -[SSUpdateAccountResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_credentialSource = a4;
    objc_storeStrong((id *)&v8->_updatedAccount, a3);
  }

  return v9;
}

- (unint64_t)credentialSource
{
  return self->_credentialSource;
}

- (SSAccount)updatedAccount
{
  return self->_updatedAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAccount, 0);
}

@end
