@implementation PKPendingProvisioningReceipt

+ (id)failedReceiptWithPendingProvisioning:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PKPendingProvisioningReceipt _initWithPendingProvisioning:type:passUniqueID:error:]([PKPendingProvisioningReceipt alloc], "_initWithPendingProvisioning:type:passUniqueID:error:", v6, 2, 0, v5);

  return v7;
}

+ (id)successReceiptWithPendingProvisioning:(id)a3 passUniqueID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PKPendingProvisioningReceipt _initWithPendingProvisioning:type:passUniqueID:error:]([PKPendingProvisioningReceipt alloc], "_initWithPendingProvisioning:type:passUniqueID:error:", v6, 1, v5, 0);

  return v7;
}

+ (id)remoteSuccessReceiptWithPendingProvisioning:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKPendingProvisioningReceipt _initWithPendingProvisioning:type:passUniqueID:error:]([PKPendingProvisioningReceipt alloc], "_initWithPendingProvisioning:type:passUniqueID:error:", v3, 1, 0, 0);

  return v4;
}

- (id)_initWithPendingProvisioning:(id)a3 type:(int64_t)a4 passUniqueID:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPendingProvisioningReceipt *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *identifier;
  uint64_t v19;
  PKPendingProvisioning *pendingProvisioning;
  id v21;
  NSString *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKPendingProvisioningReceipt;
  v13 = -[PKPendingProvisioningReceipt init](&v26, sel_init);
  if (v13)
  {
    objc_msgSend(v10, "provisioningState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v10, "uniqueIdentifier");
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    identifier = v13->_identifier;
    v13->_identifier = v17;

    v13->_type = a4;
    objc_storeStrong((id *)&v13->_passUniqueID, a5);
    objc_storeStrong((id *)&v13->_error, a6);
    v13->_createdAt = CFAbsoluteTimeGetCurrent();
    v19 = objc_msgSend(v10, "copy");
    pendingProvisioning = v13->_pendingProvisioning;
    v13->_pendingProvisioning = (PKPendingProvisioning *)v19;

    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    v22 = v13->_identifier;
    -[PKPendingProvisioning uniqueIdentifier](v13->_pendingProvisioning, "uniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("Receipt-%@-%@"), v22, v23);

    -[PKPendingProvisioning setUniqueIdentifier:](v13->_pendingProvisioning, "setUniqueIdentifier:", v24);
    -[PKPendingProvisioning setStatus:](v13->_pendingProvisioning, "setStatus:", 4);

  }
  return v13;
}

- (id)initForDatabase
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPendingProvisioningReceipt;
  return -[PKPendingProvisioningReceipt init](&v3, sel_init);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t type;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("id: '%@'; "), self->_identifier);
  type = self->_type;
  v8 = &stru_1E2ADF4C0;
  if (type == 2)
    v8 = CFSTR("failed");
  if (type == 1)
    v9 = CFSTR("provisioned");
  else
    v9 = v8;
  objc_msgSend(v6, "appendFormat:", CFSTR("type: '%@'; "), v9);
  if (self->_passUniqueID)
    objc_msgSend(v6, "appendFormat:", CFSTR("passUniqueID: '%@'; "), self->_passUniqueID);
  if (self->_error)
    objc_msgSend(v6, "appendFormat:", CFSTR("error: '%@'; "), self->_error);
  objc_msgSend(v6, "appendFormat:", CFSTR("createdAt: '%lu'; "), (unint64_t)self->_createdAt);
  objc_msgSend(v6, "appendFormat:", CFSTR("pending: '%@'; "), self->_pendingProvisioning);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingProvisioningReceipt)initWithCoder:(id)a3
{
  id v4;
  PKPendingProvisioningReceipt *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSString *passUniqueID;
  uint64_t v11;
  NSError *error;
  void *v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  PKPendingProvisioning *pendingProvisioning;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPendingProvisioningReceipt;
  v5 = -[PKPendingProvisioningReceipt init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPendingProvisioningReceiptTypeFromString(v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueID"));
    v9 = objc_claimAutoreleasedReturnValue();
    passUniqueID = v5->_passUniqueID;
    v5->_passUniqueID = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v11 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdAt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v5->_createdAt = v14;

    v15 = objc_alloc(MEMORY[0x1E0C99E60]);
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = (void *)objc_msgSend(v15, "initWithObjects:", v16, v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("pendingProvisioning"));
    v24 = objc_claimAutoreleasedReturnValue();
    pendingProvisioning = v5->_pendingProvisioning;
    v5->_pendingProvisioning = (PKPendingProvisioning *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  int64_t type;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  identifier = self->_identifier;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  type = self->_type;
  v6 = &stru_1E2ADF4C0;
  if (type == 2)
    v6 = CFSTR("failed");
  if (type == 1)
    v7 = CFSTR("provisioned");
  else
    v7 = v6;
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("type"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_passUniqueID, CFSTR("passUniqueID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_createdAt);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("createdAt"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_pendingProvisioning, CFSTR("pendingProvisioning"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(double)a3
{
  self->_createdAt = a3;
}

- (PKPendingProvisioning)pendingProvisioning
{
  return self->_pendingProvisioning;
}

- (void)setPendingProvisioning:(id)a3
{
  objc_storeStrong((id *)&self->_pendingProvisioning, a3);
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueID, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_pendingProvisioning, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
