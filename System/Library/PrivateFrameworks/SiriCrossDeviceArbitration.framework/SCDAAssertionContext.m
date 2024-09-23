@implementation SCDAAssertionContext

- (SCDAAssertionContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _SCDAAssertionContextMutation *);
  SCDAAssertionContext *v5;
  SCDAAssertionContext *v6;
  _SCDAAssertionContextMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *reason;
  void *v11;
  uint64_t v12;
  NSDate *effectiveDate;
  double v14;
  void *v15;
  uint64_t v16;
  NSDictionary *userInfo;
  objc_super v19;

  v4 = (void (**)(id, _SCDAAssertionContextMutation *))a3;
  v19.receiver = self;
  v19.super_class = (Class)SCDAAssertionContext;
  v5 = -[SCDAAssertionContext init](&v19, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SCDAAssertionContextMutation initWithBase:]([_SCDAAssertionContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SCDAAssertionContextMutation isDirty](v7, "isDirty"))
    {
      v6->_timestamp = -[_SCDAAssertionContextMutation getTimestamp](v7, "getTimestamp");
      -[_SCDAAssertionContextMutation getReason](v7, "getReason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      reason = v6->_reason;
      v6->_reason = (NSString *)v9;

      -[_SCDAAssertionContextMutation getEffectiveDate](v7, "getEffectiveDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = (NSDate *)v12;

      -[_SCDAAssertionContextMutation getExpirationDuration](v7, "getExpirationDuration");
      v6->_expirationDuration = v14;
      -[_SCDAAssertionContextMutation getUserInfo](v7, "getUserInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v16;

    }
  }

  return v6;
}

- (SCDAAssertionContext)init
{
  return -[SCDAAssertionContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SCDAAssertionContext)initWithTimestamp:(unint64_t)a3 reason:(id)a4 effectiveDate:(id)a5 expirationDuration:(double)a6 userInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SCDAAssertionContext *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  double v25;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __91__SCDAAssertionContext_initWithTimestamp_reason_effectiveDate_expirationDuration_userInfo___block_invoke;
  v20[3] = &unk_25174A140;
  v21 = v12;
  v22 = v13;
  v25 = a6;
  v23 = v14;
  v24 = a3;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  v18 = -[SCDAAssertionContext initWithBuilder:](self, "initWithBuilder:", v20);

  return v18;
}

- (id)description
{
  return -[SCDAAssertionContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SCDAAssertionContext;
  -[SCDAAssertionContext description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {timestamp = %llu, reason = %@, effectiveDate = %@, expirationDuration = %f, userInfo = %@}"), v5, self->_timestamp, self->_reason, self->_effectiveDate, *(_QWORD *)&self->_expirationDuration, self->_userInfo);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_reason, "hash");
  v6 = v5 ^ -[NSDate hash](self->_effectiveDate, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_expirationDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[NSDictionary hash](self->_userInfo, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SCDAAssertionContext *v4;
  SCDAAssertionContext *v5;
  unint64_t timestamp;
  double expirationDuration;
  double v8;
  BOOL v9;
  NSString *v11;
  NSString *reason;
  NSDate *v13;
  NSDate *effectiveDate;
  NSDictionary *v15;
  NSDictionary *userInfo;

  v4 = (SCDAAssertionContext *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      timestamp = self->_timestamp;
      if (timestamp == -[SCDAAssertionContext timestamp](v5, "timestamp")
        && (expirationDuration = self->_expirationDuration,
            -[SCDAAssertionContext expirationDuration](v5, "expirationDuration"),
            expirationDuration == v8))
      {
        -[SCDAAssertionContext reason](v5, "reason");
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        reason = self->_reason;
        if (reason == v11 || -[NSString isEqual:](reason, "isEqual:", v11))
        {
          -[SCDAAssertionContext effectiveDate](v5, "effectiveDate");
          v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
          effectiveDate = self->_effectiveDate;
          if (effectiveDate == v13 || -[NSDate isEqual:](effectiveDate, "isEqual:", v13))
          {
            -[SCDAAssertionContext userInfo](v5, "userInfo");
            v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            userInfo = self->_userInfo;
            v9 = userInfo == v15 || -[NSDictionary isEqual:](userInfo, "isEqual:", v15);

          }
          else
          {
            v9 = 0;
          }

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (SCDAAssertionContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SCDAAssertionContext *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDAAssertionContext::timestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "unsignedLongLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDAAssertionContext::reason"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDAAssertionContext::effectiveDate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SCDAAssertionContext::expirationDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v22 = (void *)MEMORY[0x24BDBCF20];
  v21 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v21, v8, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v17, CFSTR("SCDAAssertionContext::userInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[SCDAAssertionContext initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:](self, "initWithTimestamp:reason:effectiveDate:expirationDuration:userInfo:", v25, v24, v23, v18, v7);
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  timestamp = self->_timestamp;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("SCDAAssertionContext::timestamp"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_reason, CFSTR("SCDAAssertionContext::reason"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_effectiveDate, CFSTR("SCDAAssertionContext::effectiveDate"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_expirationDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("SCDAAssertionContext::expirationDuration"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_userInfo, CFSTR("SCDAAssertionContext::userInfo"));
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (double)expirationDuration
{
  return self->_expirationDuration;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_effectiveDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

void __91__SCDAAssertionContext_initWithTimestamp_reason_effectiveDate_expirationDuration_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", v3);
  objc_msgSend(v4, "setReason:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setEffectiveDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setExpirationDuration:", *(double *)(a1 + 64));
  objc_msgSend(v4, "setUserInfo:", *(_QWORD *)(a1 + 48));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SCDAAssertionContextMutation *);
  _SCDAAssertionContextMutation *v5;
  SCDAAssertionContext *v6;
  void *v7;
  uint64_t v8;
  NSString *reason;
  void *v10;
  uint64_t v11;
  NSDate *effectiveDate;
  double v13;
  void *v14;
  uint64_t v15;
  NSDictionary *userInfo;

  v4 = (void (**)(id, _SCDAAssertionContextMutation *))a3;
  if (v4)
  {
    v5 = -[_SCDAAssertionContextMutation initWithBase:]([_SCDAAssertionContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SCDAAssertionContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SCDAAssertionContext);
      v6->_timestamp = -[_SCDAAssertionContextMutation getTimestamp](v5, "getTimestamp");
      -[_SCDAAssertionContextMutation getReason](v5, "getReason");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      reason = v6->_reason;
      v6->_reason = (NSString *)v8;

      -[_SCDAAssertionContextMutation getEffectiveDate](v5, "getEffectiveDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = (NSDate *)v11;

      -[_SCDAAssertionContextMutation getExpirationDuration](v5, "getExpirationDuration");
      v6->_expirationDuration = v13;
      -[_SCDAAssertionContextMutation getUserInfo](v5, "getUserInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v15;

    }
    else
    {
      v6 = (SCDAAssertionContext *)-[SCDAAssertionContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (SCDAAssertionContext *)-[SCDAAssertionContext copy](self, "copy");
  }

  return v6;
}

@end
