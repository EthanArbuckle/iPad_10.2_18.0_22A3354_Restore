@implementation PKPeerPaymentPendingRequest

- (PKPeerPaymentPendingRequest)initWithRequestToken:(id)a3 requesterAddress:(id)a4 requesteeAddress:(id)a5 currencyAmount:(id)a6 memo:(id)a7 sessionID:(id)a8 requestDate:(id)a9 expiryDate:(id)a10 lastDismissedDate:(id)a11 actions:(id)a12 status:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  PKPeerPaymentPendingRequest *v30;
  uint64_t v31;
  NSString *requestToken;
  uint64_t v33;
  NSString *requesterAddress;
  uint64_t v35;
  NSString *requesteeAddress;
  uint64_t v37;
  PKCurrencyAmount *currencyAmount;
  uint64_t v39;
  NSString *memo;
  uint64_t v41;
  NSDate *requestDate;
  uint64_t v43;
  NSDate *expiryDate;
  uint64_t v45;
  NSDate *lastDismissedDate;
  uint64_t v47;
  NSArray *actions;
  uint64_t v49;
  NSString *status;
  id obj;
  id v54;
  id v55;
  objc_super v56;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v55 = a6;
  v21 = a7;
  obj = a8;
  v22 = a8;
  v23 = v21;
  v54 = v22;
  v24 = v19;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = a12;
  v29 = a13;
  v56.receiver = self;
  v56.super_class = (Class)PKPeerPaymentPendingRequest;
  v30 = -[PKPeerPaymentPendingRequest init](&v56, sel_init);
  if (v30)
  {
    v31 = objc_msgSend(v18, "copy");
    requestToken = v30->_requestToken;
    v30->_requestToken = (NSString *)v31;

    v33 = objc_msgSend(v24, "copy");
    requesterAddress = v30->_requesterAddress;
    v30->_requesterAddress = (NSString *)v33;

    v35 = objc_msgSend(v20, "copy");
    requesteeAddress = v30->_requesteeAddress;
    v30->_requesteeAddress = (NSString *)v35;

    v37 = objc_msgSend(v55, "copy");
    currencyAmount = v30->_currencyAmount;
    v30->_currencyAmount = (PKCurrencyAmount *)v37;

    v39 = objc_msgSend(v23, "copy");
    memo = v30->_memo;
    v30->_memo = (NSString *)v39;

    objc_storeStrong((id *)&v30->_sessionID, obj);
    v41 = objc_msgSend(v25, "copy");
    requestDate = v30->_requestDate;
    v30->_requestDate = (NSDate *)v41;

    v43 = objc_msgSend(v26, "copy");
    expiryDate = v30->_expiryDate;
    v30->_expiryDate = (NSDate *)v43;

    v45 = objc_msgSend(v27, "copy");
    lastDismissedDate = v30->_lastDismissedDate;
    v30->_lastDismissedDate = (NSDate *)v45;

    v47 = objc_msgSend(v28, "copy");
    actions = v30->_actions;
    v30->_actions = (NSArray *)v47;

    v49 = objc_msgSend(v29, "copy");
    status = v30->_status;
    v30->_status = (NSString *)v49;

  }
  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPendingRequest)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentPendingRequest *v5;
  uint64_t v6;
  NSString *requestToken;
  uint64_t v8;
  NSString *requesterAddress;
  uint64_t v10;
  NSString *requesteeAddress;
  uint64_t v12;
  PKCurrencyAmount *currencyAmount;
  uint64_t v14;
  NSString *memo;
  uint64_t v16;
  NSString *sessionID;
  uint64_t v18;
  NSDate *requestDate;
  uint64_t v20;
  NSDate *expiryDate;
  uint64_t v22;
  NSDate *lastDismissedDate;
  uint64_t v24;
  NSArray *actions;
  uint64_t v26;
  NSString *status;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPeerPaymentPendingRequest;
  v5 = -[PKPeerPaymentPendingRequest init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestToken = v5->_requestToken;
    v5->_requestToken = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requesterAddress"));
    v8 = objc_claimAutoreleasedReturnValue();
    requesterAddress = v5->_requesterAddress;
    v5->_requesterAddress = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requesteeAddress"));
    v10 = objc_claimAutoreleasedReturnValue();
    requesteeAddress = v5->_requesteeAddress;
    v5->_requesteeAddress = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("memo"));
    v14 = objc_claimAutoreleasedReturnValue();
    memo = v5->_memo;
    v5->_memo = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
    v16 = objc_claimAutoreleasedReturnValue();
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    requestDate = v5->_requestDate;
    v5->_requestDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiryDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastDismissedDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    lastDismissedDate = v5->_lastDismissedDate;
    v5->_lastDismissedDate = (NSDate *)v22;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("actions"));
    v24 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v26 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSString *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *requestToken;
  id v5;

  requestToken = self->_requestToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestToken, CFSTR("requestToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requesterAddress, CFSTR("requesterAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requesteeAddress, CFSTR("requesteeAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyAmount, CFSTR("currencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_memo, CFSTR("memo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionID, CFSTR("sessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestDate, CFSTR("requestDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiryDate, CFSTR("expiryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastDismissedDate, CFSTR("lastDismissedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_status, CFSTR("status"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("requestToken: '%@'; "), self->_requestToken);
  objc_msgSend(v6, "appendFormat:", CFSTR("requesterAddress: '%@'; "), self->_requesterAddress);
  objc_msgSend(v6, "appendFormat:", CFSTR("requesteeAddress: '%@'; "), self->_requesteeAddress);
  objc_msgSend(v6, "appendFormat:", CFSTR("currencyAmount: '%@'; "), self->_currencyAmount);
  objc_msgSend(v6, "appendFormat:", CFSTR("memo: '%@'; "), self->_memo);
  objc_msgSend(v6, "appendFormat:", CFSTR("sessionID: '%@'; "), self->_sessionID);
  objc_msgSend(v6, "appendFormat:", CFSTR("requestDate: '%@'; "), self->_requestDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("expiryDate: '%@'; "), self->_expiryDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("lastDismissedDate: '%@'; "), self->_lastDismissedDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("actions: '%@'; "), self->_actions);
  objc_msgSend(v6, "appendFormat:", CFSTR("status: '%@'; "), self->_status);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_requestToken)
    objc_msgSend(v3, "addObject:");
  if (self->_requesterAddress)
    objc_msgSend(v4, "addObject:");
  if (self->_requesteeAddress)
    objc_msgSend(v4, "addObject:");
  if (self->_currencyAmount)
    objc_msgSend(v4, "addObject:");
  if (self->_memo)
    objc_msgSend(v4, "addObject:");
  if (self->_sessionID)
    objc_msgSend(v4, "addObject:");
  if (self->_requestDate)
    objc_msgSend(v4, "addObject:");
  if (self->_expiryDate)
    objc_msgSend(v4, "addObject:");
  if (self->_lastDismissedDate)
    objc_msgSend(v4, "addObject:");
  if (self->_actions)
    objc_msgSend(v4, "addObject:");
  if (self->_status)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestToken;
  NSString *v6;
  NSString *requesterAddress;
  NSString *v8;
  NSString *requesteeAddress;
  NSString *v10;
  PKCurrencyAmount *currencyAmount;
  PKCurrencyAmount *v12;
  NSString *memo;
  NSString *v14;
  NSString *sessionID;
  NSString *v16;
  NSDate *requestDate;
  NSDate *v18;
  NSDate *expiryDate;
  NSDate *v20;
  NSDate *lastDismissedDate;
  NSDate *v22;
  NSArray *actions;
  NSArray *v24;
  NSString *status;
  NSString *v26;
  char v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_54;
  requestToken = self->_requestToken;
  v6 = (NSString *)v4[1];
  if (requestToken && v6)
  {
    if ((-[NSString isEqual:](requestToken, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (requestToken != v6)
  {
    goto LABEL_54;
  }
  requesterAddress = self->_requesterAddress;
  v8 = (NSString *)v4[2];
  if (requesterAddress && v8)
  {
    if ((-[NSString isEqual:](requesterAddress, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (requesterAddress != v8)
  {
    goto LABEL_54;
  }
  requesteeAddress = self->_requesteeAddress;
  v10 = (NSString *)v4[3];
  if (requesteeAddress && v10)
  {
    if ((-[NSString isEqual:](requesteeAddress, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (requesteeAddress != v10)
  {
    goto LABEL_54;
  }
  currencyAmount = self->_currencyAmount;
  v12 = (PKCurrencyAmount *)v4[4];
  if (currencyAmount && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
      goto LABEL_54;
  }
  else if (currencyAmount != v12)
  {
    goto LABEL_54;
  }
  memo = self->_memo;
  v14 = (NSString *)v4[5];
  if (memo && v14)
  {
    if ((-[NSString isEqual:](memo, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (memo != v14)
  {
    goto LABEL_54;
  }
  sessionID = self->_sessionID;
  v16 = (NSString *)v4[6];
  if (sessionID && v16)
  {
    if ((-[NSString isEqual:](sessionID, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (sessionID != v16)
  {
    goto LABEL_54;
  }
  requestDate = self->_requestDate;
  v18 = (NSDate *)v4[7];
  if (requestDate && v18)
  {
    if ((-[NSDate isEqual:](requestDate, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (requestDate != v18)
  {
    goto LABEL_54;
  }
  expiryDate = self->_expiryDate;
  v20 = (NSDate *)v4[8];
  if (expiryDate && v20)
  {
    if ((-[NSDate isEqual:](expiryDate, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (expiryDate != v20)
  {
    goto LABEL_54;
  }
  lastDismissedDate = self->_lastDismissedDate;
  v22 = (NSDate *)v4[9];
  if (lastDismissedDate && v22)
  {
    if ((-[NSDate isEqual:](lastDismissedDate, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (lastDismissedDate != v22)
  {
    goto LABEL_54;
  }
  actions = self->_actions;
  v24 = (NSArray *)v4[10];
  if (!actions || !v24)
  {
    if (actions == v24)
      goto LABEL_50;
LABEL_54:
    v27 = 0;
    goto LABEL_55;
  }
  if ((-[NSArray isEqual:](actions, "isEqual:") & 1) == 0)
    goto LABEL_54;
LABEL_50:
  status = self->_status;
  v26 = (NSString *)v4[11];
  if (status && v26)
    v27 = -[NSString isEqual:](status, "isEqual:");
  else
    v27 = status == v26;
LABEL_55:

  return v27;
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_requestToken, a3);
}

- (NSString)requesterAddress
{
  return self->_requesterAddress;
}

- (void)setRequesterAddress:(id)a3
{
  objc_storeStrong((id *)&self->_requesterAddress, a3);
}

- (NSString)requesteeAddress
{
  return self->_requesteeAddress;
}

- (void)setRequesteeAddress:(id)a3
{
  objc_storeStrong((id *)&self->_requesteeAddress, a3);
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (NSString)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
  objc_storeStrong((id *)&self->_memo, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestDate, a3);
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_storeStrong((id *)&self->_expiryDate, a3);
}

- (NSDate)lastDismissedDate
{
  return self->_lastDismissedDate;
}

- (void)setLastDismissedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastDismissedDate, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_lastDismissedDate, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_requesteeAddress, 0);
  objc_storeStrong((id *)&self->_requesterAddress, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
}

@end
