@implementation ICAgeVerifier

- (ICAgeVerifier)initWithExpirationDate:(id)a3
{
  id v5;
  ICAgeVerifier *v6;
  ICAgeVerifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAgeVerifier;
  v6 = -[ICAgeVerifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_verificationExpirationDate, a3);

  return v7;
}

- (void)runAgeVerification
{
  void *v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  const char *v9;
  int v10;
  ICAgeVerifier *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[ICAgeVerifier setStatus:](self, "setStatus:", 0);
  -[ICAgeVerifier verificationExpirationDate](self, "verificationExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    -[ICAgeVerifier verificationExpirationDate](self, "verificationExpirationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v4);
    v7 = v6;

    if (v7 >= 0.0)
    {
      -[ICAgeVerifier setStatus:](self, "setStatus:", 3);
      v8 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138543362;
        v11 = self;
        v9 = "%{public}@ - Age verification status is current";
        goto LABEL_9;
      }
    }
    else
    {
      -[ICAgeVerifier setStatus:](self, "setStatus:", 2);
      v8 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138543362;
        v11 = self;
        v9 = "%{public}@ - Age verification status has expired";
LABEL_9:
        _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);
      }
    }

    goto LABEL_11;
  }
  -[ICAgeVerifier setStatus:](self, "setStatus:", 2);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_INFO, "%{public}@ - Provided expiration date is nil", (uint8_t *)&v10, 0xCu);
  }
LABEL_11:

}

- (BOOL)isExplicitContentAllowed
{
  return -[ICAgeVerifier status](self, "status") == 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v5[1] = -[ICAgeVerifier status](self, "status");
    -[ICAgeVerifier verificationExpirationDate](self, "verificationExpirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[2];
    v5[2] = v7;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ICAgeVerifier *v4;
  ICAgeVerifier *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (ICAgeVerifier *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[ICAgeVerifier status](v5, "status");
      if (v6 == -[ICAgeVerifier status](self, "status"))
      {
        -[ICAgeVerifier verificationExpirationDate](v5, "verificationExpirationDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAgeVerifier verificationExpirationDate](self, "verificationExpirationDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          v11 = 1;
        }
        else
        {
          -[ICAgeVerifier verificationExpirationDate](v5, "verificationExpirationDate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAgeVerifier verificationExpirationDate](self, "verificationExpirationDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

        }
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICAgeVerifier verificationExpirationDate](self, "verificationExpirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICAgeVerifier status](self, "status");
  if ((unint64_t)(v5 - 1) > 2)
    v6 = CFSTR("Age verification status unknown");
  else
    v6 = off_1E438C180[v5 - 1];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ICAgeVerifier %p - verificationExpirationDate: %@ - status: %@"), self, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSDate)verificationExpirationDate
{
  return self->_verificationExpirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationExpirationDate, 0);
}

@end
