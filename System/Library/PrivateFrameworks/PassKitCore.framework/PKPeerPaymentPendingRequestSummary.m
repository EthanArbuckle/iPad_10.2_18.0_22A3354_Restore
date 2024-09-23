@implementation PKPeerPaymentPendingRequestSummary

- (PKPeerPaymentPendingRequestSummary)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentPendingRequestSummary *v5;
  uint64_t v6;
  NSString *requestToken;
  uint64_t v8;
  NSString *status;
  uint64_t v10;
  NSArray *actions;
  void *v12;
  uint64_t v13;
  NSDate *expiryDate;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentPendingRequestSummary;
  v5 = -[PKPeerPaymentPendingRequestSummary init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("requestToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestToken = v5->_requestToken;
    v5->_requestToken = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("status"));
    v8 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSString *)v8;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("actions"));
    v10 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("expiryDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKISO8601DateFromDateStringContainingFractionalSeconds(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v13;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestToken;
  NSString *v6;
  NSString *status;
  NSString *v8;
  NSArray *actions;
  NSArray *v10;
  NSDate *expiryDate;
  NSDate *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  requestToken = self->_requestToken;
  v6 = (NSString *)v4[1];
  if (requestToken && v6)
  {
    if ((-[NSString isEqual:](requestToken, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (requestToken != v6)
  {
    goto LABEL_19;
  }
  status = self->_status;
  v8 = (NSString *)v4[2];
  if (status && v8)
  {
    if ((-[NSString isEqual:](status, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (status != v8)
  {
    goto LABEL_19;
  }
  actions = self->_actions;
  v10 = (NSArray *)v4[3];
  if (!actions || !v10)
  {
    if (actions == v10)
      goto LABEL_15;
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  if ((-[NSArray isEqual:](actions, "isEqual:") & 1) == 0)
    goto LABEL_19;
LABEL_15:
  expiryDate = self->_expiryDate;
  v12 = (NSDate *)v4[4];
  if (expiryDate && v12)
    v13 = -[NSDate isEqual:](expiryDate, "isEqual:");
  else
    v13 = expiryDate == v12;
LABEL_20:

  return v13;
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (NSString)status
{
  return self->_status;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
}

@end
