@implementation PKPeerPaymentQuoteDynamicFraudContent

+ (id)dynamicFraudContentWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

- (PKPeerPaymentQuoteDynamicFraudContent)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentQuoteDynamicFraudContent *v5;
  uint64_t v6;
  NSString *header;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;
  NSString *message;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  NSString *defaultButtonTitle;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  NSString *otherButtonTitle;
  uint64_t v20;
  NSString *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentQuoteDynamicFraudContent;
  v5 = -[PKPeerPaymentQuoteDynamicFraudContent init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("header"));
    v6 = objc_claimAutoreleasedReturnValue();
    header = v5->_header;
    v5->_header = (NSString *)v6;

    if (!v5->_header)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_RISK_LEVEL_TITLE"), 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_header;
      v5->_header = (NSString *)v8;

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("message"));
    v10 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v10;

    if (!v5->_message)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_RISK_LEVEL_MESSAGE"), 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_message;
      v5->_message = (NSString *)v12;

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("defaultButtonTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    defaultButtonTitle = v5->_defaultButtonTitle;
    v5->_defaultButtonTitle = (NSString *)v14;

    if (!v5->_defaultButtonTitle)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_RISK_LEVEL_ACTION_CANCEL"), 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v5->_defaultButtonTitle;
      v5->_defaultButtonTitle = (NSString *)v16;

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("otherButtonTitle"));
    v18 = objc_claimAutoreleasedReturnValue();
    otherButtonTitle = v5->_otherButtonTitle;
    v5->_otherButtonTitle = (NSString *)v18;

    if (!v5->_otherButtonTitle)
    {
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_CONFIRM_RISK_LEVEL_ACTION_CONTINUE"), 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v5->_otherButtonTitle;
      v5->_otherButtonTitle = (NSString *)v20;

    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentQuoteDynamicFraudContent)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentQuoteDynamicFraudContent *v5;
  uint64_t v6;
  NSString *header;
  uint64_t v8;
  NSString *message;
  uint64_t v10;
  NSString *defaultButtonTitle;
  uint64_t v12;
  NSString *otherButtonTitle;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentQuoteDynamicFraudContent;
  v5 = -[PKPeerPaymentQuoteDynamicFraudContent init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("header"));
    v6 = objc_claimAutoreleasedReturnValue();
    header = v5->_header;
    v5->_header = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v8 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultButtonTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    defaultButtonTitle = v5->_defaultButtonTitle;
    v5->_defaultButtonTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otherButtonTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    otherButtonTitle = v5->_otherButtonTitle;
    v5->_otherButtonTitle = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *header;
  id v5;

  header = self->_header;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", header, CFSTR("header"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultButtonTitle, CFSTR("defaultButtonTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otherButtonTitle, CFSTR("otherButtonTitle"));

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("header: '%@'; "), self->_header);
  objc_msgSend(v3, "appendFormat:", CFSTR("message: '%@'; "), self->_message);
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultButtonTitle: '%@'; "), self->_defaultButtonTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR("otherButtonTitle: '%@'; "), self->_otherButtonTitle);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *header;
  NSString *v6;
  NSString *message;
  NSString *v8;
  NSString *defaultButtonTitle;
  NSString *v10;
  NSString *otherButtonTitle;
  NSString *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  header = self->_header;
  v6 = (NSString *)v4[1];
  if (header && v6)
  {
    if ((-[NSString isEqual:](header, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (header != v6)
  {
    goto LABEL_19;
  }
  message = self->_message;
  v8 = (NSString *)v4[2];
  if (message && v8)
  {
    if ((-[NSString isEqual:](message, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (message != v8)
  {
    goto LABEL_19;
  }
  defaultButtonTitle = self->_defaultButtonTitle;
  v10 = (NSString *)v4[3];
  if (!defaultButtonTitle || !v10)
  {
    if (defaultButtonTitle == v10)
      goto LABEL_15;
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  if ((-[NSString isEqual:](defaultButtonTitle, "isEqual:") & 1) == 0)
    goto LABEL_19;
LABEL_15:
  otherButtonTitle = self->_otherButtonTitle;
  v12 = (NSString *)v4[4];
  if (otherButtonTitle && v12)
    v13 = -[NSString isEqual:](otherButtonTitle, "isEqual:");
  else
    v13 = otherButtonTitle == v12;
LABEL_20:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_header);
  objc_msgSend(v3, "safelyAddObject:", self->_message);
  objc_msgSend(v3, "safelyAddObject:", self->_defaultButtonTitle);
  objc_msgSend(v3, "safelyAddObject:", self->_otherButtonTitle);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)header
{
  return self->_header;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (NSString)otherButtonTitle
{
  return self->_otherButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
