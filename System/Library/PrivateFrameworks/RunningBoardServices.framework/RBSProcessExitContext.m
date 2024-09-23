@implementation RBSProcessExitContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminationContext, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (int64_t)type
{
  return self->_type;
}

+ (id)exitContextForNamespace:(unsigned int)a3 code:(unint64_t)a4 wait4Status:(int)a5
{
  return -[RBSProcessExitContext _initWithNamespace:code:wait4Status:]((id *)[RBSProcessExitContext alloc], *(uint64_t *)&a3, a4, a5);
}

- (id)_initWithNamespace:(uint64_t)a3 code:(int)a4 wait4Status:
{
  void *v6;
  void *v7;
  id *v8;

  if (!a1)
    return 0;
  +[RBSProcessExitStatus statusWithDomain:code:](RBSProcessExitStatus, "statusWithDomain:code:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RBSProcessExitContext _initWithStatus:legacyCode:timestamp:context:](a1, v6, a4, v7, 0);

  return v8;
}

- (id)copyWithTimestamp:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = -[RBSProcessExitContext _initWithStatus:legacyCode:timestamp:context:]((id *)[RBSProcessExitContext alloc], self->_status, self->_legacyCode, v4, self->_terminationContext);

  return v5;
}

- (id)_initWithStatus:(int)a3 legacyCode:(void *)a4 timestamp:(void *)a5 context:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  objc_super v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)RBSProcessExitContext;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      if (!objc_msgSend(v9, "domain"))
      {
        v13 = objc_msgSend(v9, "code");
        if (a3)
        {
          if (!v13 && (a3 & 0x7F) != 0 && (a3 & 0x7F) != 0x7F)
          {
            rbs_process_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              v19 = a3;
              _os_log_impl(&dword_190CD6000, v14, OS_LOG_TYPE_DEFAULT, "Modern status reporting system failed (signal detected), translating $d into 2,%d", buf, 8u);
            }

            +[RBSProcessExitStatus statusWithDomain:code:](RBSProcessExitStatus, "statusWithDomain:code:", 2, a3 & 0x7F);
            v15 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v15;
          }
        }
      }
      objc_storeStrong(a1 + 4, v9);
      if (objc_msgSend(a1[4], "isValid"))
      {
        v12 = 2;
      }
      else
      {
        if (!objc_msgSend(a1[4], "_isVoluntary"))
        {
          a1[3] = 0;
          goto LABEL_17;
        }
        v12 = 1;
      }
      a1[3] = (id)v12;
LABEL_17:
      *((_DWORD *)a1 + 2) = a3;
      objc_storeStrong(a1 + 2, a4);
      objc_storeStrong(a1 + 5, a5);
    }
  }

  return a1;
}

- (RBSProcessExitStatus)status
{
  RBSProcessExitStatus *status;

  if (-[RBSProcessExitStatus isValid](self->_status, "isValid"))
    status = self->_status;
  else
    status = 0;
  return status;
}

- (id)copyWithStatus:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = -[RBSProcessExitContext _initWithStatus:legacyCode:timestamp:context:]((id *)[RBSProcessExitContext alloc], v4, 0, self->_timestamp, self->_terminationContext);

  return v5;
}

- (id)copyWithTerminationContext:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = -[RBSProcessExitContext _initWithStatus:legacyCode:timestamp:context:]((id *)[RBSProcessExitContext alloc], self->_status, self->_legacyCode, self->_timestamp, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessExitContext *v4;
  uint64_t v5;
  RBSProcessExitStatus *status;
  RBSProcessExitStatus *v7;
  char v8;
  RBSTerminateContext *terminationContext;
  RBSTerminateContext *v10;

  v4 = (RBSProcessExitContext *)a3;
  if (self == v4)
    goto LABEL_15;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class() || self->_legacyCode != v4->_legacyCode || self->_type != v4->_type)
    goto LABEL_14;
  status = self->_status;
  v7 = v4->_status;
  if (status != v7)
  {
    v8 = 0;
    if (!status || !v7)
      goto LABEL_16;
    if (!-[RBSProcessExitStatus isEqual:](status, "isEqual:"))
      goto LABEL_14;
  }
  if (!RBSXPCEqualDates(self->_timestamp, v4->_timestamp))
  {
LABEL_14:
    v8 = 0;
    goto LABEL_16;
  }
  terminationContext = self->_terminationContext;
  v10 = v4->_terminationContext;
  if (terminationContext == v10)
  {
LABEL_15:
    v8 = 1;
    goto LABEL_16;
  }
  v8 = 0;
  if (terminationContext && v10)
    v8 = -[RBSTerminateContext isEqual:](terminationContext, "isEqual:");
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  return -[RBSProcessExitStatus hash](self->_status, "hash");
}

- (NSString)description
{
  int64_t type;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  type = self->_type;
  if (type == 1)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "initWithFormat:", CFSTR("<%@| voluntary>"), v5);
LABEL_6:
    v7 = (void *)v9;
    goto LABEL_7;
  }
  if (type != 2)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "initWithFormat:", CFSTR("<%@| unknown>"), v5);
    goto LABEL_6;
  }
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSProcessExitStatus description](self->_status, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@| specific, status:%@>"), v5, v6);

LABEL_7:
  return (NSString *)v7;
}

- (NSString)debugDescription
{
  int64_t type;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  RBSTerminateContext *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  RBSTerminateContext *terminationContext;
  uint64_t v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  RBSTerminateContext *v19;

  type = self->_type;
  if (type == 1)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "description");
    v12 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v12;
    v13 = CFSTR(", terminationContext");
    terminationContext = self->_terminationContext;
    if (!terminationContext)
    {
      v13 = &stru_1E2D183D0;
      terminationContext = (RBSTerminateContext *)&stru_1E2D183D0;
    }
    v15 = objc_msgSend(v11, "initWithFormat:", CFSTR("<%@| voluntary%@%@>"), v12, v13, terminationContext);
    goto LABEL_12;
  }
  if (type != 2)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend((id)objc_opt_class(), "description");
    v17 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v17;
    v18 = CFSTR(", terminationContext");
    v19 = self->_terminationContext;
    if (!v19)
    {
      v18 = &stru_1E2D183D0;
      v19 = (RBSTerminateContext *)&stru_1E2D183D0;
    }
    v15 = objc_msgSend(v16, "initWithFormat:", CFSTR("<%@| unknown%@%@>"), v17, v18, v19);
LABEL_12:
    v10 = (void *)v15;
    goto LABEL_13;
  }
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSProcessExitStatus description](self->_status, "description");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR(" terminationContext");
  v9 = self->_terminationContext;
  if (!v9)
  {
    v8 = &stru_1E2D183D0;
    v9 = (RBSTerminateContext *)&stru_1E2D183D0;
  }
  v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@| specific, status:%@%@%@>"), v5, v6, v8, v9);

LABEL_13:
  return (NSString *)v10;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", type, CFSTR("_type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_status, CFSTR("_status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("_timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_terminationContext, CFSTR("_terminationContext"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_legacyCode, CFSTR("_legacyCode"));

}

- (RBSProcessExitContext)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessExitContext *v5;
  uint64_t v6;
  RBSProcessExitStatus *status;
  uint64_t v8;
  RBSTerminateContext *terminationContext;
  uint64_t v10;
  NSDate *timestamp;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSProcessExitContext;
  v5 = -[RBSProcessExitContext init](&v13, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_status"));
    v6 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (RBSProcessExitStatus *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_terminationContext"));
    v8 = objc_claimAutoreleasedReturnValue();
    terminationContext = v5->_terminationContext;
    v5->_terminationContext = (RBSTerminateContext *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timestamp"));
    v10 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v10;

    v5->_legacyCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_legacyCode"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", type, CFSTR("_type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("_timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_status, CFSTR("_status"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_legacyCode, CFSTR("_legacyCode"));

}

- (RBSProcessExitContext)initWithCoder:(id)a3
{
  id v4;
  RBSProcessExitContext *v5;
  uint64_t v6;
  RBSProcessExitStatus *status;
  uint64_t v8;
  NSDate *timestamp;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSProcessExitContext;
  v5 = -[RBSProcessExitContext init](&v11, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_status"));
    v6 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (RBSProcessExitStatus *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    v5->_legacyCode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_legacyCode"));
  }

  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int)legacyCode
{
  return self->_legacyCode;
}

- (RBSTerminateContext)terminationContext
{
  return self->_terminationContext;
}

@end
