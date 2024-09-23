@implementation PKIssuerBindingData

- (PKIssuerBindingData)initWithCoder:(id)a3
{
  id v4;
  PKIssuerBindingData *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  NSData *createdKeyHash;
  uint64_t v10;
  NSData *signedData;
  uint64_t v12;
  NSURL *callbackURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKIssuerBindingData;
  v5 = -[PKIssuerBindingData init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdKeyHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdKeyHash = v5->_createdKeyHash;
    v5->_createdKeyHash = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedData"));
    v10 = objc_claimAutoreleasedReturnValue();
    signedData = v5->_signedData;
    v5->_signedData = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callbackURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    callbackURL = v5->_callbackURL;
    v5->_callbackURL = (NSURL *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdKeyHash, CFSTR("createdKeyHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signedData, CFSTR("signedData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_callbackURL, CFSTR("callbackURL"));

}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("sessionIdentifier: %@; "), self->_sessionIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("createdKeyHash: %@; "), self->_createdKeyHash);
  objc_msgSend(v3, "appendFormat:", CFSTR("signedData: %@; "), self->_signedData);
  -[NSURL description](self->_callbackURL, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("callbackURL: %@; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  PKIssuerBindingData *v4;
  PKIssuerBindingData *v5;
  BOOL v6;

  v4 = (PKIssuerBindingData *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKIssuerBindingData isEqualToIssuerBindingData:](self, "isEqualToIssuerBindingData:", v5);

  return v6;
}

- (BOOL)isEqualToIssuerBindingData:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSData *createdKeyHash;
  NSData *v12;
  NSData *signedData;
  NSData *v14;
  NSURL *callbackURL;
  NSURL *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_21;
  v6 = (void *)v4[1];
  v7 = self->_sessionIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_21;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_21;
  }
  createdKeyHash = self->_createdKeyHash;
  v12 = (NSData *)v5[2];
  if (createdKeyHash && v12)
  {
    if ((-[NSData isEqual:](createdKeyHash, "isEqual:") & 1) == 0)
      goto LABEL_21;
  }
  else if (createdKeyHash != v12)
  {
    goto LABEL_21;
  }
  signedData = self->_signedData;
  v14 = (NSData *)v5[3];
  if (!signedData || !v14)
  {
    if (signedData == v14)
      goto LABEL_17;
LABEL_21:
    v17 = 0;
    goto LABEL_22;
  }
  if ((-[NSData isEqual:](signedData, "isEqual:") & 1) == 0)
    goto LABEL_21;
LABEL_17:
  callbackURL = self->_callbackURL;
  v16 = (NSURL *)v5[4];
  if (callbackURL && v16)
    v17 = -[NSURL isEqual:](callbackURL, "isEqual:");
  else
    v17 = callbackURL == v16;
LABEL_22:

  return v17;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_sessionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_createdKeyHash);
  objc_msgSend(v3, "safelyAddObject:", self->_signedData);
  objc_msgSend(v3, "safelyAddObject:", self->_callbackURL);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)createdKeyHash
{
  return self->_createdKeyHash;
}

- (void)setCreatedKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)callbackURL
{
  return self->_callbackURL;
}

- (void)setCallbackURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackURL, 0);
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_createdKeyHash, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
