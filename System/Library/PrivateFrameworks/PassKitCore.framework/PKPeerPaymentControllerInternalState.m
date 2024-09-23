@implementation PKPeerPaymentControllerInternalState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentControllerInternalState)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentControllerInternalState *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *senderPhoneOrEmail;
  uint64_t v10;
  NSString *recipientPhoneOrEmail;
  uint64_t v12;
  PKPeerPaymentRecipient *recipient;
  uint64_t v14;
  NSString *recipientDisplayName;
  uint64_t v16;
  PKPeerPaymentRequestToken *requestToken;
  uint64_t v18;
  PKPeerPaymentQuote *quote;
  uint64_t v20;
  PKAuthorizedPeerPaymentQuote *authorizedQuote;
  uint64_t v22;
  PKPeerPaymentPerformResponse *performQuoteResponse;
  uint64_t v24;
  PKPeerPaymentQuoteCertificatesResponse *quoteCertificatesResponse;
  uint64_t v26;
  NSString *accountNumber;
  uint64_t v28;
  NSString *routingNumber;
  uint64_t v30;
  NSString *accountName;
  uint64_t v32;
  PKPeerPaymentQuoteRequest *quoteRequest;
  uint64_t v34;
  NSString *recurringPaymentIdentifier;
  uint64_t v36;
  NSDate *startDate;
  uint64_t v38;
  NSDecimalNumber *threshold;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKPeerPaymentControllerInternalState;
  v5 = -[PKPeerPaymentControllerInternalState init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->state = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->mode = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderPhoneOrEmail"));
    v8 = objc_claimAutoreleasedReturnValue();
    senderPhoneOrEmail = v5->senderPhoneOrEmail;
    v5->senderPhoneOrEmail = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientPhoneOrEmail"));
    v10 = objc_claimAutoreleasedReturnValue();
    recipientPhoneOrEmail = v5->recipientPhoneOrEmail;
    v5->recipientPhoneOrEmail = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipient"));
    v12 = objc_claimAutoreleasedReturnValue();
    recipient = v5->recipient;
    v5->recipient = (PKPeerPaymentRecipient *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientDisplayName"));
    v14 = objc_claimAutoreleasedReturnValue();
    recipientDisplayName = v5->recipientDisplayName;
    v5->recipientDisplayName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestToken"));
    v16 = objc_claimAutoreleasedReturnValue();
    requestToken = v5->requestToken;
    v5->requestToken = (PKPeerPaymentRequestToken *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quote"));
    v18 = objc_claimAutoreleasedReturnValue();
    quote = v5->quote;
    v5->quote = (PKPeerPaymentQuote *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizedQuote"));
    v20 = objc_claimAutoreleasedReturnValue();
    authorizedQuote = v5->authorizedQuote;
    v5->authorizedQuote = (PKAuthorizedPeerPaymentQuote *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("performQuoteResponse"));
    v22 = objc_claimAutoreleasedReturnValue();
    performQuoteResponse = v5->performQuoteResponse;
    v5->performQuoteResponse = (PKPeerPaymentPerformResponse *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quoteCertificatesResponse"));
    v24 = objc_claimAutoreleasedReturnValue();
    quoteCertificatesResponse = v5->quoteCertificatesResponse;
    v5->quoteCertificatesResponse = (PKPeerPaymentQuoteCertificatesResponse *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountNumber"));
    v26 = objc_claimAutoreleasedReturnValue();
    accountNumber = v5->accountNumber;
    v5->accountNumber = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("routingNumber"));
    v28 = objc_claimAutoreleasedReturnValue();
    routingNumber = v5->routingNumber;
    v5->routingNumber = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountName"));
    v30 = objc_claimAutoreleasedReturnValue();
    accountName = v5->accountName;
    v5->accountName = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("quoteRequest"));
    v32 = objc_claimAutoreleasedReturnValue();
    quoteRequest = v5->quoteRequest;
    v5->quoteRequest = (PKPeerPaymentQuoteRequest *)v32;

    v5->supportsPreserveCurrentBalance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsPreserveCurrentBalance"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recurringPaymentIdentifier"));
    v34 = objc_claimAutoreleasedReturnValue();
    recurringPaymentIdentifier = v5->recurringPaymentIdentifier;
    v5->recurringPaymentIdentifier = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v36 = objc_claimAutoreleasedReturnValue();
    startDate = v5->startDate;
    v5->startDate = (NSDate *)v36;

    v5->frequency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frequency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threshold"));
    v38 = objc_claimAutoreleasedReturnValue();
    threshold = v5->threshold;
    v5->threshold = (NSDecimalNumber *)v38;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t state;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  state = self->state;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->mode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("mode"));

  objc_msgSend(v8, "encodeObject:forKey:", self->senderPhoneOrEmail, CFSTR("senderPhoneOrEmail"));
  objc_msgSend(v8, "encodeObject:forKey:", self->recipientPhoneOrEmail, CFSTR("recipientPhoneOrEmail"));
  objc_msgSend(v8, "encodeObject:forKey:", self->recipient, CFSTR("recipient"));
  objc_msgSend(v8, "encodeObject:forKey:", self->recipientDisplayName, CFSTR("recipientDisplayName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->requestToken, CFSTR("requestToken"));
  objc_msgSend(v8, "encodeObject:forKey:", self->quote, CFSTR("quote"));
  objc_msgSend(v8, "encodeObject:forKey:", self->authorizedQuote, CFSTR("authorizedQuote"));
  objc_msgSend(v8, "encodeObject:forKey:", self->performQuoteResponse, CFSTR("performQuoteResponse"));
  objc_msgSend(v8, "encodeObject:forKey:", self->quoteCertificatesResponse, CFSTR("quoteCertificatesResponse"));
  objc_msgSend(v8, "encodeObject:forKey:", self->accountNumber, CFSTR("accountNumber"));
  objc_msgSend(v8, "encodeObject:forKey:", self->routingNumber, CFSTR("routingNumber"));
  objc_msgSend(v8, "encodeObject:forKey:", self->accountName, CFSTR("accountName"));
  objc_msgSend(v8, "encodeObject:forKey:", self->quoteRequest, CFSTR("quoteRequest"));
  objc_msgSend(v8, "encodeBool:forKey:", self->supportsPreserveCurrentBalance, CFSTR("supportsPreserveCurrentBalance"));
  objc_msgSend(v8, "encodeObject:forKey:", self->recurringPaymentIdentifier, CFSTR("recurringPaymentIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->startDate, CFSTR("startDate"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->frequency, CFSTR("frequency"));
  objc_msgSend(v8, "encodeObject:forKey:", self->threshold, CFSTR("threshold"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->state);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("state: '%@'; "), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->mode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("mode: '%@'; "), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR("senderPhoneOrEmail: '%@'; "), self->senderPhoneOrEmail);
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientPhoneOrEmail: '%@'; "), self->recipientPhoneOrEmail);
  objc_msgSend(v6, "appendFormat:", CFSTR("recipient: '%@'; "), self->recipient);
  objc_msgSend(v6, "appendFormat:", CFSTR("recipientDisplayName: '%@'; "), self->recipientDisplayName);
  objc_msgSend(v6, "appendFormat:", CFSTR("requestToken: '%@'; "), self->requestToken);
  objc_msgSend(v6, "appendFormat:", CFSTR("quote: '%@'; "), self->quote);
  objc_msgSend(v6, "appendFormat:", CFSTR("authorizedQuote: '%@'; "), self->authorizedQuote);
  objc_msgSend(v6, "appendFormat:", CFSTR("performQuoteResponse: '%@'; "), self->performQuoteResponse);
  objc_msgSend(v6, "appendFormat:", CFSTR("quoteCertificatesResponse: '%@'; "), self->quoteCertificatesResponse);
  objc_msgSend(v6, "appendFormat:", CFSTR("accountNumber: '%@'; "), self->accountNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("routingNumber: '%@'; "), self->routingNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("accountName: '%@'; "), self->accountName);
  objc_msgSend(v6, "appendFormat:", CFSTR("quoteRequest: '%@'; "), self->quoteRequest);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->supportsPreserveCurrentBalance);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("supportsPreserveCurrentBalance: '%@'; "), v9);

  objc_msgSend(v6, "appendFormat:", CFSTR("recurringPaymentIdentifier: '%@'; "), self->recurringPaymentIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("startDate: '%@'; "), self->startDate);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->frequency);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("frequency: '%@'; "), v10);

  objc_msgSend(v6, "appendFormat:", CFSTR("threshold: '%@'; "), self->threshold);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->senderPhoneOrEmail)
    objc_msgSend(v3, "addObject:");
  if (self->recipientPhoneOrEmail)
    objc_msgSend(v4, "addObject:");
  if (self->recipient)
    objc_msgSend(v4, "addObject:");
  if (self->recipientDisplayName)
    objc_msgSend(v4, "addObject:");
  if (self->requestToken)
    objc_msgSend(v4, "addObject:");
  if (self->quote)
    objc_msgSend(v4, "addObject:");
  if (self->authorizedQuote)
    objc_msgSend(v4, "addObject:");
  if (self->performQuoteResponse)
    objc_msgSend(v4, "addObject:");
  if (self->quoteCertificatesResponse)
    objc_msgSend(v4, "addObject:");
  if (self->accountNumber)
    objc_msgSend(v4, "addObject:");
  if (self->routingNumber)
    objc_msgSend(v4, "addObject:");
  if (self->accountName)
    objc_msgSend(v4, "addObject:");
  if (self->quoteRequest)
    objc_msgSend(v4, "addObject:");
  if (self->recurringPaymentIdentifier)
    objc_msgSend(v4, "addObject:");
  if (self->startDate)
    objc_msgSend(v4, "addObject:");
  if (self->threshold)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->state - v5 + 32 * v5;
  v7 = self->mode - v6 + 32 * v6;
  v8 = self->supportsPreserveCurrentBalance - v7 + 32 * v7;
  v9 = self->frequency - v8 + 32 * v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentControllerInternalState *v4;
  PKPeerPaymentControllerInternalState *v5;
  BOOL v6;

  v4 = (PKPeerPaymentControllerInternalState *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentControllerInternalState isEqualToPeerPaymentControllerInternalState:](self, "isEqualToPeerPaymentControllerInternalState:", v5);

  return v6;
}

- (BOOL)isEqualToPeerPaymentControllerInternalState:(id)a3
{
  char *v4;
  _QWORD *v5;
  NSString *senderPhoneOrEmail;
  NSString *v7;
  NSString *recipientPhoneOrEmail;
  NSString *v9;
  PKPeerPaymentRecipient *recipient;
  PKPeerPaymentRecipient *v11;
  NSString *recipientDisplayName;
  NSString *v13;
  PKPeerPaymentRequestToken *requestToken;
  PKPeerPaymentRequestToken *v15;
  PKPeerPaymentQuote *quote;
  PKPeerPaymentQuote *v17;
  PKAuthorizedPeerPaymentQuote *authorizedQuote;
  PKAuthorizedPeerPaymentQuote *v19;
  PKPeerPaymentPerformResponse *performQuoteResponse;
  PKPeerPaymentPerformResponse *v21;
  PKPeerPaymentQuoteCertificatesResponse *quoteCertificatesResponse;
  PKPeerPaymentQuoteCertificatesResponse *v23;
  NSString *accountNumber;
  NSString *v25;
  NSString *routingNumber;
  NSString *v27;
  NSString *accountName;
  NSString *v29;
  PKPeerPaymentQuoteRequest *quoteRequest;
  PKPeerPaymentQuoteRequest *v31;
  NSString *recurringPaymentIdentifier;
  NSString *v33;
  NSDate *startDate;
  NSDate *v35;
  NSDecimalNumber *threshold;
  NSDecimalNumber *v37;
  char v38;

  v4 = (char *)a3;
  v5 = v4;
  if (*(_OWORD *)&self->state != *(_OWORD *)(v4 + 8) || self->supportsPreserveCurrentBalance != v4[88])
    goto LABEL_82;
  senderPhoneOrEmail = self->senderPhoneOrEmail;
  v7 = (NSString *)v5[3];
  if (senderPhoneOrEmail && v7)
  {
    if ((-[NSString isEqual:](senderPhoneOrEmail, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (senderPhoneOrEmail != v7)
  {
    goto LABEL_82;
  }
  recipientPhoneOrEmail = self->recipientPhoneOrEmail;
  v9 = (NSString *)v5[4];
  if (recipientPhoneOrEmail && v9)
  {
    if ((-[NSString isEqual:](recipientPhoneOrEmail, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (recipientPhoneOrEmail != v9)
  {
    goto LABEL_82;
  }
  recipient = self->recipient;
  v11 = (PKPeerPaymentRecipient *)v5[5];
  if (recipient && v11)
  {
    if (!-[PKPeerPaymentRecipient isEqual:](recipient, "isEqual:"))
      goto LABEL_82;
  }
  else if (recipient != v11)
  {
    goto LABEL_82;
  }
  recipientDisplayName = self->recipientDisplayName;
  v13 = (NSString *)v5[6];
  if (recipientDisplayName && v13)
  {
    if ((-[NSString isEqual:](recipientDisplayName, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (recipientDisplayName != v13)
  {
    goto LABEL_82;
  }
  requestToken = self->requestToken;
  v15 = (PKPeerPaymentRequestToken *)v5[7];
  if (requestToken && v15)
  {
    if (!-[PKPeerPaymentRequestToken isEqual:](requestToken, "isEqual:"))
      goto LABEL_82;
  }
  else if (requestToken != v15)
  {
    goto LABEL_82;
  }
  quote = self->quote;
  v17 = (PKPeerPaymentQuote *)v5[8];
  if (quote && v17)
  {
    if (!-[PKPeerPaymentQuote isEqual:](quote, "isEqual:"))
      goto LABEL_82;
  }
  else if (quote != v17)
  {
    goto LABEL_82;
  }
  authorizedQuote = self->authorizedQuote;
  v19 = (PKAuthorizedPeerPaymentQuote *)v5[9];
  if (authorizedQuote && v19)
  {
    if ((-[PKAuthorizedPeerPaymentQuote isEqual:](authorizedQuote, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (authorizedQuote != v19)
  {
    goto LABEL_82;
  }
  performQuoteResponse = self->performQuoteResponse;
  v21 = (PKPeerPaymentPerformResponse *)v5[10];
  if (performQuoteResponse && v21)
  {
    if ((-[PKPeerPaymentPerformResponse isEqual:](performQuoteResponse, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (performQuoteResponse != v21)
  {
    goto LABEL_82;
  }
  quoteCertificatesResponse = self->quoteCertificatesResponse;
  v23 = (PKPeerPaymentQuoteCertificatesResponse *)v5[12];
  if (quoteCertificatesResponse && v23)
  {
    if ((-[PKPeerPaymentQuoteCertificatesResponse isEqual:](quoteCertificatesResponse, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (quoteCertificatesResponse != v23)
  {
    goto LABEL_82;
  }
  accountNumber = self->accountNumber;
  v25 = (NSString *)v5[14];
  if (accountNumber && v25)
  {
    if ((-[NSString isEqual:](accountNumber, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (accountNumber != v25)
  {
    goto LABEL_82;
  }
  routingNumber = self->routingNumber;
  v27 = (NSString *)v5[15];
  if (routingNumber && v27)
  {
    if ((-[NSString isEqual:](routingNumber, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (routingNumber != v27)
  {
    goto LABEL_82;
  }
  accountName = self->accountName;
  v29 = (NSString *)v5[13];
  if (accountName && v29)
  {
    if ((-[NSString isEqual:](accountName, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (accountName != v29)
  {
    goto LABEL_82;
  }
  quoteRequest = self->quoteRequest;
  v31 = (PKPeerPaymentQuoteRequest *)v5[16];
  if (quoteRequest && v31)
  {
    if (!-[PKPeerPaymentQuoteRequest isEqual:](quoteRequest, "isEqual:"))
      goto LABEL_82;
  }
  else if (quoteRequest != v31)
  {
    goto LABEL_82;
  }
  recurringPaymentIdentifier = self->recurringPaymentIdentifier;
  v33 = (NSString *)v5[17];
  if (recurringPaymentIdentifier && v33)
  {
    if ((-[NSString isEqual:](recurringPaymentIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_82;
  }
  else if (recurringPaymentIdentifier != v33)
  {
    goto LABEL_82;
  }
  startDate = self->startDate;
  v35 = (NSDate *)v5[18];
  if (!startDate || !v35)
  {
    if (startDate == v35)
      goto LABEL_78;
LABEL_82:
    v38 = 0;
    goto LABEL_83;
  }
  if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
    goto LABEL_82;
LABEL_78:
  if (self->frequency != v5[19])
    goto LABEL_82;
  threshold = self->threshold;
  v37 = (NSDecimalNumber *)v5[20];
  if (threshold && v37)
    v38 = -[NSDecimalNumber isEqual:](threshold, "isEqual:");
  else
    v38 = threshold == v37;
LABEL_83:

  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->threshold, 0);
  objc_storeStrong((id *)&self->startDate, 0);
  objc_storeStrong((id *)&self->recurringPaymentIdentifier, 0);
  objc_storeStrong((id *)&self->quoteRequest, 0);
  objc_storeStrong((id *)&self->routingNumber, 0);
  objc_storeStrong((id *)&self->accountNumber, 0);
  objc_storeStrong((id *)&self->accountName, 0);
  objc_storeStrong((id *)&self->quoteCertificatesResponse, 0);
  objc_storeStrong((id *)&self->performQuoteResponse, 0);
  objc_storeStrong((id *)&self->authorizedQuote, 0);
  objc_storeStrong((id *)&self->quote, 0);
  objc_storeStrong((id *)&self->requestToken, 0);
  objc_storeStrong((id *)&self->recipientDisplayName, 0);
  objc_storeStrong((id *)&self->recipient, 0);
  objc_storeStrong((id *)&self->recipientPhoneOrEmail, 0);
  objc_storeStrong((id *)&self->senderPhoneOrEmail, 0);
}

@end
