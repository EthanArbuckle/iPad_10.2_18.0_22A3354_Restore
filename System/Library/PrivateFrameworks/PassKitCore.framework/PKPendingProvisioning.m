@implementation PKPendingProvisioning

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPendingProvisioning;
  return -[PKPendingProvisioning init](&v3, sel_init);
}

- (PKPendingProvisioning)initWithUniqueIdentifier:(id)a3 status:(int64_t)a4
{
  id v6;
  PKPendingProvisioning *v7;
  uint64_t v8;
  NSString *uniqueIdentifier;
  uint64_t v10;
  NSDate *createdAt;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPendingProvisioning;
  v7 = -[PKPendingProvisioning init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v8;

    v7->_status = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    createdAt = v7->_createdAt;
    v7->_createdAt = (NSDate *)v10;

    v7->_shouldAutoProvision = 0;
  }

  return v7;
}

- (id)type
{
  return CFSTR("Unknown");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPendingProvisioning type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("type: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("id: '%@'; "), self->_uniqueIdentifier);
  v8 = self->_status - 1;
  if (v8 > 4)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2AC8B88[v8];
  objc_msgSend(v6, "appendFormat:", CFSTR("status: '%@'; "), v9);
  objc_msgSend(v6, "appendFormat:", CFSTR("provisioningAttemptCounter: '%lu'; "), self->_provisioningAttemptCounter);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setCanRetryProvisioning:(BOOL)a3
{
  self->_provisioningAttemptCounter = a3 - 1;
}

- (BOOL)representsCredential:(id)a3
{
  return 0;
}

- (BOOL)representsPass:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSString *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)v5[2];
    v7 = self->_uniqueIdentifier;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v10)
        goto LABEL_16;
    }
    -[PKPendingProvisioning type](self, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v13 = v12;
    v9 = v13;
    if (v7 == v13)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 0;
      if (v7 && v13)
        LOBYTE(v10) = -[NSString isEqualToString:](v7, "isEqualToString:", v13);
    }

    goto LABEL_15;
  }
  LOBYTE(v10) = 0;
LABEL_17:

  return v10;
}

- (id)credential
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingProvisioning)initWithCoder:(id)a3
{
  id v4;
  PKPendingProvisioning *v5;
  uint64_t v6;
  NSString *uniqueIdentifier;
  void *v8;
  uint64_t v9;
  NSDate *createdAt;
  uint64_t v11;
  PKSecureElementProvisioningState *provisioningState;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPendingProvisioning;
  v5 = -[PKPendingProvisioning init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKPendingProvisioningStatusFromString(v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdAt_timeIntervalSince1970"));
    v9 = objc_claimAutoreleasedReturnValue();
    createdAt = v5->_createdAt;
    v5->_createdAt = (NSDate *)v9;

    v5->_shouldAutoProvision = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAutoProvision"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningState"));
    v11 = objc_claimAutoreleasedReturnValue();
    provisioningState = v5->_provisioningState;
    v5->_provisioningState = (PKSecureElementProvisioningState *)v11;

    v5->_provisioningAttemptCounter = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("provisioningAttemptCounter"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueIdentifier;
  unint64_t v5;
  const __CFString *v6;
  id v7;

  uniqueIdentifier = self->_uniqueIdentifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  v5 = self->_status - 1;
  if (v5 > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC8B88[v5];
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("status"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_createdAt, CFSTR("createdAt_timeIntervalSince1970"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_shouldAutoProvision, CFSTR("shouldAutoProvision"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_provisioningState, CFSTR("provisioningState"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_provisioningAttemptCounter, CFSTR("provisioningAttemptCounter"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  -[PKPendingProvisioning _copyIntoPendingProvision:](self, "_copyIntoPendingProvision:", v4);
  return v4;
}

- (void)_copyIntoPendingProvision:(id)a3
{
  NSString *uniqueIdentifier;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  uniqueIdentifier = self->_uniqueIdentifier;
  v5 = a3;
  v6 = -[NSString copy](uniqueIdentifier, "copy");
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[3] = self->_status;
  v8 = -[NSDate copy](self->_createdAt, "copy");
  v9 = (void *)v5[4];
  v5[4] = v8;

  *((_BYTE *)v5 + 8) = self->_shouldAutoProvision;
  v5[5] = self->_provisioningAttemptCounter;
  v10 = -[PKSecureElementProvisioningState createDivergentState](self->_provisioningState, "createDivergentState");
  v11 = (id)v5[6];
  v5[6] = v10;

}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(id)a3
{
  objc_storeStrong((id *)&self->_createdAt, a3);
}

- (BOOL)shouldAutoProvision
{
  return self->_shouldAutoProvision;
}

- (void)setShouldAutoProvision:(BOOL)a3
{
  self->_shouldAutoProvision = a3;
}

- (unint64_t)provisioningAttemptCounter
{
  return self->_provisioningAttemptCounter;
}

- (void)setProvisioningAttemptCounter:(unint64_t)a3
{
  self->_provisioningAttemptCounter = a3;
}

- (PKSecureElementProvisioningState)provisioningState
{
  return self->_provisioningState;
}

- (void)setProvisioningState:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningState, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
