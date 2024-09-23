@implementation PKAccountFundingSourceVerification

- (PKAccountFundingSourceVerification)initWithDictionary:(id)a3
{
  id v4;
  PKAccountFundingSourceVerification *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *options;
  void *v10;
  PKAccountFundingSourceVerificationAttempt *v11;
  PKAccountFundingSourceVerificationAttempt *pendingAttempt;
  void *v13;
  PKAccountFundingSourceVerificationAttempt *v14;
  PKAccountFundingSourceVerificationAttempt *failedAttempt;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  PKAccountFundingSourceVerificationAction *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAccountFundingSourceVerification;
  v5 = -[PKAccountFundingSourceVerification init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKAccountFundingSourceVerificationStatusFromString(v6);

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("options"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_124);
    v8 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSArray *)v8;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("pendingAttempt"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = -[PKAccountFundingSourceVerificationAttempt initWithDictionary:]([PKAccountFundingSourceVerificationAttempt alloc], "initWithDictionary:", v10);
      pendingAttempt = v5->_pendingAttempt;
      v5->_pendingAttempt = v11;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("failedAttempt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      v14 = -[PKAccountFundingSourceVerificationAttempt initWithDictionary:]([PKAccountFundingSourceVerificationAttempt alloc], "initWithDictionary:", v13);
      failedAttempt = v5->_failedAttempt;
      v5->_failedAttempt = v14;

    }
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("recoveryActions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      v25 = v13;
      v26 = v10;
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v18);
            v23 = -[PKAccountFundingSourceVerificationAction initWithDictionary:]([PKAccountFundingSourceVerificationAction alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22));
            objc_msgSend(v17, "addObject:", v23);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v20);
      }

      -[PKAccountFundingSourceVerification setRecoveryActions:](v5, "setRecoveryActions:", v17);
      v13 = v25;
      v10 = v26;
    }

  }
  return v5;
}

uint64_t __57__PKAccountFundingSourceVerification_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PKApplyVerificationTypeFromString(a2));
}

- (void)setRecoveryActions:(id)a3
{
  NSArray *v4;
  NSArray *recoveryActions;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_127_0);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  recoveryActions = self->_recoveryActions;
  self->_recoveryActions = v4;

}

uint64_t __57__PKAccountFundingSourceVerification_setRecoveryActions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "hash");
  v6 = objc_msgSend(v4, "hash");

  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFundingSourceVerification)initWithCoder:(id)a3
{
  id v4;
  PKAccountFundingSourceVerification *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *options;
  uint64_t v11;
  PKAccountFundingSourceVerificationAttempt *pendingAttempt;
  uint64_t v13;
  PKAccountFundingSourceVerificationAttempt *failedAttempt;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *recoveryActions;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountFundingSourceVerification;
  v5 = -[PKAccountFundingSourceVerification init](&v21, sel_init);
  if (v5)
  {
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("options"));
    v9 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingAttempt"));
    v11 = objc_claimAutoreleasedReturnValue();
    pendingAttempt = v5->_pendingAttempt;
    v5->_pendingAttempt = (PKAccountFundingSourceVerificationAttempt *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("failedAttempt"));
    v13 = objc_claimAutoreleasedReturnValue();
    failedAttempt = v5->_failedAttempt;
    v5->_failedAttempt = (PKAccountFundingSourceVerificationAttempt *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("recoveryActions"));
    v18 = objc_claimAutoreleasedReturnValue();
    recoveryActions = v5->_recoveryActions;
    v5->_recoveryActions = (NSArray *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t status;
  id v5;

  status = self->_status;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pendingAttempt, CFSTR("pendingAttempt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_failedAttempt, CFSTR("failedAttempt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recoveryActions, CFSTR("recoveryActions"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSArray *options;
  NSArray *v6;
  PKAccountFundingSourceVerificationAttempt *pendingAttempt;
  PKAccountFundingSourceVerificationAttempt *v8;
  PKAccountFundingSourceVerificationAttempt *failedAttempt;
  PKAccountFundingSourceVerificationAttempt *v10;
  NSArray *recoveryActions;
  NSArray *v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_22;
  options = self->_options;
  v6 = (NSArray *)v4[2];
  if (options && v6)
  {
    if ((-[NSArray isEqual:](options, "isEqual:") & 1) == 0)
      goto LABEL_22;
  }
  else if (options != v6)
  {
    goto LABEL_22;
  }
  pendingAttempt = self->_pendingAttempt;
  v8 = (PKAccountFundingSourceVerificationAttempt *)v4[3];
  if (pendingAttempt && v8)
  {
    if (!-[PKAccountFundingSourceVerificationAttempt isEqual:](pendingAttempt, "isEqual:"))
      goto LABEL_22;
  }
  else if (pendingAttempt != v8)
  {
    goto LABEL_22;
  }
  failedAttempt = self->_failedAttempt;
  v10 = (PKAccountFundingSourceVerificationAttempt *)v4[4];
  if (failedAttempt && v10)
  {
    if (!-[PKAccountFundingSourceVerificationAttempt isEqual:](failedAttempt, "isEqual:"))
      goto LABEL_22;
  }
  else if (failedAttempt != v10)
  {
    goto LABEL_22;
  }
  recoveryActions = self->_recoveryActions;
  v12 = (NSArray *)v4[5];
  if (!recoveryActions || !v12)
  {
    if (recoveryActions == v12)
      goto LABEL_20;
LABEL_22:
    v13 = 0;
    goto LABEL_23;
  }
  if ((-[NSArray isEqual:](recoveryActions, "isEqual:") & 1) == 0)
    goto LABEL_22;
LABEL_20:
  v13 = self->_status == v4[1];
LABEL_23:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_options);
  objc_msgSend(v3, "safelyAddObject:", self->_pendingAttempt);
  objc_msgSend(v3, "safelyAddObject:", self->_failedAttempt);
  objc_msgSend(v3, "safelyAddObject:", self->_recoveryActions);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_status - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t status;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  status = self->_status;
  if (status > 4)
    v6 = 0;
  else
    v6 = off_1E2AD5990[status];
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR("options: '%@'; "), self->_options);
  objc_msgSend(v4, "appendFormat:", CFSTR("pendingAttempt: '%@'; "), self->_pendingAttempt);
  objc_msgSend(v4, "appendFormat:", CFSTR("failedAttempt: '%@'; "), self->_failedAttempt);
  objc_msgSend(v4, "appendFormat:", CFSTR("recoveryActions: '%@'; "), self->_recoveryActions);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountFundingSourceVerification *v5;
  uint64_t v6;
  NSArray *options;
  PKAccountFundingSourceVerificationAttempt *v8;
  PKAccountFundingSourceVerificationAttempt *pendingAttempt;
  PKAccountFundingSourceVerificationAttempt *v10;
  PKAccountFundingSourceVerificationAttempt *failedAttempt;
  uint64_t v12;
  NSArray *recoveryActions;

  v5 = -[PKAccountFundingSourceVerification init](+[PKAccountFundingSourceVerification allocWithZone:](PKAccountFundingSourceVerification, "allocWithZone:"), "init");
  v5->_status = self->_status;
  v6 = -[NSArray copyWithZone:](self->_options, "copyWithZone:", a3);
  options = v5->_options;
  v5->_options = (NSArray *)v6;

  v8 = -[PKAccountFundingSourceVerificationAttempt copyWithZone:](self->_pendingAttempt, "copyWithZone:", a3);
  pendingAttempt = v5->_pendingAttempt;
  v5->_pendingAttempt = v8;

  v10 = -[PKAccountFundingSourceVerificationAttempt copyWithZone:](self->_failedAttempt, "copyWithZone:", a3);
  failedAttempt = v5->_failedAttempt;
  v5->_failedAttempt = v10;

  v12 = -[NSArray copyWithZone:](self->_recoveryActions, "copyWithZone:", a3);
  recoveryActions = v5->_recoveryActions;
  v5->_recoveryActions = (NSArray *)v12;

  return v5;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKAccountFundingSourceVerificationAttempt)pendingAttempt
{
  return self->_pendingAttempt;
}

- (void)setPendingAttempt:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAttempt, a3);
}

- (PKAccountFundingSourceVerificationAttempt)failedAttempt
{
  return self->_failedAttempt;
}

- (void)setFailedAttempt:(id)a3
{
  objc_storeStrong((id *)&self->_failedAttempt, a3);
}

- (NSArray)recoveryActions
{
  return self->_recoveryActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryActions, 0);
  objc_storeStrong((id *)&self->_failedAttempt, 0);
  objc_storeStrong((id *)&self->_pendingAttempt, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
