@implementation PKPeerPaymentAdditionalPushTopics

- (PKPeerPaymentAdditionalPushTopics)initWithDictionary:(id)a3
{
  id v4;
  PKPeerPaymentAdditionalPushTopics *v5;
  uint64_t v6;
  NSString *preferences;
  uint64_t v8;
  NSString *associatedAccounts;
  uint64_t v10;
  NSString *requests;
  uint64_t v12;
  NSString *endpoint;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentAdditionalPushTopics;
  v5 = -[PKPeerPaymentAdditionalPushTopics init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("preferences"));
    v6 = objc_claimAutoreleasedReturnValue();
    preferences = v5->_preferences;
    v5->_preferences = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("associatedAccounts"));
    v8 = objc_claimAutoreleasedReturnValue();
    associatedAccounts = v5->_associatedAccounts;
    v5->_associatedAccounts = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("requests"));
    v10 = objc_claimAutoreleasedReturnValue();
    requests = v5->_requests;
    v5->_requests = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("endpoint"));
    v12 = objc_claimAutoreleasedReturnValue();
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSString *)v12;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *preferences;
  NSString *v6;
  NSString *associatedAccounts;
  NSString *v8;
  NSString *requests;
  NSString *v10;
  NSString *endpoint;
  NSString *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  preferences = self->_preferences;
  v6 = (NSString *)v4[1];
  if (preferences && v6)
  {
    if ((-[NSString isEqual:](preferences, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (preferences != v6)
  {
    goto LABEL_19;
  }
  associatedAccounts = self->_associatedAccounts;
  v8 = (NSString *)v4[2];
  if (associatedAccounts && v8)
  {
    if ((-[NSString isEqual:](associatedAccounts, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (associatedAccounts != v8)
  {
    goto LABEL_19;
  }
  requests = self->_requests;
  v10 = (NSString *)v4[3];
  if (!requests || !v10)
  {
    if (requests == v10)
      goto LABEL_15;
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  if ((-[NSString isEqual:](requests, "isEqual:") & 1) == 0)
    goto LABEL_19;
LABEL_15:
  endpoint = self->_endpoint;
  v12 = (NSString *)v4[4];
  if (endpoint && v12)
    v13 = -[NSString isEqual:](endpoint, "isEqual:");
  else
    v13 = endpoint == v12;
LABEL_20:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_preferences);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedAccounts);
  objc_msgSend(v3, "safelyAddObject:", self->_requests);
  objc_msgSend(v3, "safelyAddObject:", self->_endpoint);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("preferences: '%@'; "), self->_preferences);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedAccounts: '%@'; "), self->_associatedAccounts);
  objc_msgSend(v3, "appendFormat:", CFSTR("requests: '%@'; "), self->_requests);
  objc_msgSend(v3, "appendFormat:", CFSTR("endpoint: '%@'; "), self->_endpoint);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentAdditionalPushTopics *v5;
  uint64_t v6;
  NSString *preferences;
  uint64_t v8;
  NSString *associatedAccounts;
  uint64_t v10;
  NSString *requests;
  uint64_t v12;
  NSString *endpoint;

  v5 = -[PKPeerPaymentAdditionalPushTopics init](+[PKPeerPaymentAdditionalPushTopics allocWithZone:](PKPeerPaymentAdditionalPushTopics, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_preferences, "copyWithZone:", a3);
  preferences = v5->_preferences;
  v5->_preferences = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_associatedAccounts, "copyWithZone:", a3);
  associatedAccounts = v5->_associatedAccounts;
  v5->_associatedAccounts = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_requests, "copyWithZone:", a3);
  requests = v5->_requests;
  v5->_requests = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_endpoint, "copyWithZone:", a3);
  endpoint = v5->_endpoint;
  v5->_endpoint = (NSString *)v12;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAdditionalPushTopics)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentAdditionalPushTopics *v5;
  uint64_t v6;
  NSString *preferences;
  uint64_t v8;
  NSString *associatedAccounts;
  uint64_t v10;
  NSString *requests;
  uint64_t v12;
  NSString *endpoint;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentAdditionalPushTopics;
  v5 = -[PKPeerPaymentAdditionalPushTopics init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferences"));
    v6 = objc_claimAutoreleasedReturnValue();
    preferences = v5->_preferences;
    v5->_preferences = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedAccounts"));
    v8 = objc_claimAutoreleasedReturnValue();
    associatedAccounts = v5->_associatedAccounts;
    v5->_associatedAccounts = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requests"));
    v10 = objc_claimAutoreleasedReturnValue();
    requests = v5->_requests;
    v5->_requests = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v12 = objc_claimAutoreleasedReturnValue();
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *preferences;
  id v5;

  preferences = self->_preferences;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", preferences, CFSTR("preferences"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedAccounts, CFSTR("associatedAccounts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requests, CFSTR("requests"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endpoint, CFSTR("endpoint"));

}

- (NSString)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)associatedAccounts
{
  return self->_associatedAccounts;
}

- (void)setAssociatedAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_associatedAccounts, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
