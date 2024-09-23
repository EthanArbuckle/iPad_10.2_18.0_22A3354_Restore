@implementation PKPendingProvisioningChange

- (PKPendingProvisioningChange)init
{

  return 0;
}

- (PKPendingProvisioningChange)initWithType:(unint64_t)a3 pendingProvisioning:(id)a4
{
  id v7;
  PKPendingProvisioningChange *v8;
  PKPendingProvisioningChange *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPendingProvisioningChange;
  v8 = -[PKPendingProvisioningChange init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_pendingProvisioning, a4);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t type;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  type = self->_type;
  if (type > 3)
    v8 = &stru_1E2ADF4C0;
  else
    v8 = off_1E2AC9C20[type];
  objc_msgSend(v6, "appendFormat:", CFSTR("type: '%@'; "), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR("pending: '%@'; "), self->_pendingProvisioning);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPendingProvisioningChange)initWithCoder:(id)a3
{
  id v4;
  PKPendingProvisioningChange *v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  PKPendingProvisioning *pendingProvisioning;
  __CFString *v26;
  __CFString *v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  int v31;
  void *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PKPendingProvisioningChange;
  v5 = -[PKPendingProvisioningChange init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v32 = v4;
    if (v6 != CFSTR("addition"))
    {
      if (v6)
      {
        v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("addition"));

        if ((v8 & 1) != 0)
          goto LABEL_5;
        v10 = v7;
        if (v10 != CFSTR("update"))
        {
          v11 = v10;
          v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("update"));

          if ((v12 & 1) == 0)
          {
            v26 = v11;
            if (v26 == CFSTR("removeSuccess")
              || (v27 = v26,
                  v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("removeSuccess")),
                  v27,
                  (v28 & 1) != 0))
            {
              v9 = 2;
              goto LABEL_9;
            }
            v29 = v27;
            if (v29 == CFSTR("removeFailure")
              || (v30 = v29,
                  v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("removeFailure")),
                  v30,
                  v31))
            {
              v9 = 3;
              goto LABEL_9;
            }
          }
        }
      }
      v9 = 1;
      goto LABEL_9;
    }
LABEL_5:
    v9 = 0;
LABEL_9:

    v5->_type = v9;
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = (void *)objc_msgSend(v13, "initWithObjects:", v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v4 = v32;
    objc_msgSend(v32, "decodeObjectOfClasses:forKey:", v22, CFSTR("pendingProvisioning"));
    v23 = objc_claimAutoreleasedReturnValue();
    pendingProvisioning = v5->_pendingProvisioning;
    v5->_pendingProvisioning = (PKPendingProvisioning *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  const __CFString *v5;
  id v6;

  type = self->_type;
  if (type > 3)
    v5 = &stru_1E2ADF4C0;
  else
    v5 = off_1E2AC9C20[type];
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("type"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_pendingProvisioning, CFSTR("pendingProvisioning"));

}

- (unint64_t)type
{
  return self->_type;
}

- (PKPendingProvisioning)pendingProvisioning
{
  return self->_pendingProvisioning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingProvisioning, 0);
}

@end
