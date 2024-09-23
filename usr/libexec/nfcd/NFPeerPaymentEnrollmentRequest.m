@implementation NFPeerPaymentEnrollmentRequest

- (NFPeerPaymentEnrollmentRequest)initWithDictionary:(id)a3
{
  id v4;
  NFPeerPaymentEnrollmentRequest *v5;
  uint64_t v6;
  NSData *alternateDSID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPeerPaymentEnrollmentRequest;
  v5 = -[NFPeerPaymentEnrollmentRequest init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternateDSID")));
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSData *)v6;

  }
  return v5;
}

- (NFPeerPaymentEnrollmentRequest)initWithCoder:(id)a3
{
  id v4;
  NFPeerPaymentEnrollmentRequest *v5;
  id v6;
  uint64_t v7;
  NSData *alternateDSID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFPeerPaymentEnrollmentRequest;
  v5 = -[NFPeerPaymentEnrollmentRequest init](&v10, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("alternateDSID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSData *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_alternateDSID, CFSTR("alternateDSID"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)alternateDSID
{
  return self->_alternateDSID;
}

- (void)setAlternateDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDSID, 0);
}

@end
