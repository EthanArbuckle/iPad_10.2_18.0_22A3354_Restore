@implementation ICDelegationConsumerServiceSessionRequestInfo

- (ICDelegationConsumerServiceSessionRequestInfo)initWithAccountID:(unint64_t)a3 fairPlaySessionID:(unint64_t)a4
{
  ICDelegationConsumerServiceSessionRequestInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICDelegationConsumerServiceSessionRequestInfo;
  result = -[ICDelegationConsumerServiceSessionRequestInfo init](&v7, sel_init);
  if (result)
  {
    result->_accountID = a3;
    result->_fairPlaySessionID = a4;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_fairPlaySessionID ^ self->_accountID;
}

- (BOOL)isEqual:(id)a3
{
  ICDelegationConsumerServiceSessionRequestInfo *v4;
  BOOL v5;

  v4 = (ICDelegationConsumerServiceSessionRequestInfo *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_accountID == v4->_accountID
      && self->_fairPlaySessionID == v4->_fairPlaySessionID;
  }

  return v5;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

- (unint64_t)fairPlaySessionID
{
  return self->_fairPlaySessionID;
}

@end
