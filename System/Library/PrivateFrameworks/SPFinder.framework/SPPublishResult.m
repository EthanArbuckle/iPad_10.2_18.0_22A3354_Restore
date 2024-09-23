@implementation SPPublishResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPublishResult)initWithRequestUUID:(id)a3 aaaPubKeyHash:(id)a4
{
  id v7;
  id v8;
  SPPublishResult *v9;
  SPPublishResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPPublishResult;
  v9 = -[SPPublishResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestUUID, a3);
    objc_storeStrong((id *)&v10->_aaaPubKeyHash, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *requestUUID;
  id v5;

  requestUUID = self->_requestUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestUUID, CFSTR("requestUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aaaPubKeyHash, CFSTR("aaaPubKeyHash"));

}

- (SPPublishResult)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *requestUUID;
  NSData *v7;
  NSData *aaaPubKeyHash;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestUUID"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  requestUUID = self->_requestUUID;
  self->_requestUUID = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aaaPubKeyHash"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();

  aaaPubKeyHash = self->_aaaPubKeyHash;
  self->_aaaPubKeyHash = v7;

  return self;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)aaaPubKeyHash
{
  return self->_aaaPubKeyHash;
}

- (void)setAaaPubKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaaPubKeyHash, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end
