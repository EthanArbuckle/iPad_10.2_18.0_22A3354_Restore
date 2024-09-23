@implementation ICAgeVerificationState

+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "ageVerificationStateNotRequiredForUserIdentity:withTreatment:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3 withTreatment:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "ageVerificationStateNotRequiredForUserIdentity:withTreatment:verificationURL:", v5, a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3 withTreatment:(int64_t)a4 verificationURL:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  v9 = -[ICAgeVerificationState _initWithUserIdentity:status:treatment:verificationURL:error:]([ICAgeVerificationState alloc], "_initWithUserIdentity:status:treatment:verificationURL:error:", v8, 1, a4, v7, 0);

  return v9;
}

- (id)_initWithUserIdentity:(id)a3 status:(int64_t)a4 treatment:(int64_t)a5 verificationURL:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  ICAgeVerificationState *v15;
  uint64_t v16;
  ICUserIdentity *userIdentity;
  ICAgeVerifier *ageVerifier;
  uint64_t v19;
  NSURL *verificationURL;
  uint64_t v21;
  NSError *error;
  objc_super v24;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ICAgeVerificationState;
  v15 = -[ICAgeVerificationState init](&v24, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    userIdentity = v15->_userIdentity;
    v15->_userIdentity = (ICUserIdentity *)v16;

    v15->_status = a4;
    ageVerifier = v15->_ageVerifier;
    v15->_ageVerifier = 0;

    v15->_treatment = a5;
    v19 = objc_msgSend(v13, "copy");
    verificationURL = v15->_verificationURL;
    v15->_verificationURL = (NSURL *)v19;

    v21 = objc_msgSend(v14, "copy");
    error = v15->_error;
    v15->_error = (NSError *)v21;

  }
  return v15;
}

- (void)saveToUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[ICAgeVerificationState userIdentity](self, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "DSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAgeVerificationState userIdentity](self, "userIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "DSIDForUserIdentity:outError:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_msgSend(CFSTR("NoDSID"), "copy");
    v20 = v10;

  }
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastKnownUserAgeVerificationState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = v13;
  if (v13)
    v15 = v13;
  else
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = v15;

  -[ICAgeVerificationState _dictionaryRepresentationWithDSID:](self, "_dictionaryRepresentationWithDSID:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v20);

  v18 = (void *)objc_msgSend(v16, "copy");
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLastKnownUserAgeVerificationState:", v18);

}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  ICAgeVerificationState *v5;
  ICAgeVerificationState *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v5 = (ICAgeVerificationState *)a3;
  if (v5 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[ICAgeVerificationState ageVerifier](v6, "ageVerifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7
        && (v8 = (void *)v7,
            -[ICAgeVerificationState ageVerifier](self, "ageVerifier"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9))
      {
        v10 = -[ICAgeVerificationState treatment](v6, "treatment");
        if (v10 == -[ICAgeVerificationState treatment](self, "treatment"))
        {
          -[ICAgeVerificationState ageVerifier](v6, "ageVerifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "isEqual:", v12))
          {
            v16 = 0;
LABEL_29:

            goto LABEL_30;
          }
          -[ICAgeVerificationState verificationURL](v6, "verificationURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAgeVerificationState verificationURL](self, "verificationURL");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 != v3)
          {
            -[ICAgeVerificationState verificationURL](v6, "verificationURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICAgeVerificationState verificationURL](self, "verificationURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v14, "isEqual:", v15))
            {
              v16 = 0;
LABEL_27:

LABEL_28:
              goto LABEL_29;
            }
            v36 = v15;
            v37 = v14;
          }
          -[ICAgeVerificationState error](v6, "error");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAgeVerificationState error](self, "error");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v21 == (void *)v22)
          {

            v16 = 1;
            v27 = v13 == v3;
          }
          else
          {
            v23 = (void *)v22;
            -[ICAgeVerificationState error](v6, "error");
            v35 = v3;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICAgeVerificationState error](self, "error");
            v25 = v13;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v24, "isEqual:", v26);

            v13 = v25;
            v3 = v35;

            v27 = v25 == v35;
          }
          v15 = v36;
          v14 = v37;
          if (v27)
            goto LABEL_28;
          goto LABEL_27;
        }
      }
      else
      {
        -[ICAgeVerificationState ageVerifier](v6, "ageVerifier");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v11 = (void *)v17;
          v16 = 0;
LABEL_30:

          goto LABEL_31;
        }
        -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v19 = -[ICAgeVerificationState status](v6, "status");
          if (v19 == -[ICAgeVerificationState status](self, "status"))
          {
            v20 = -[ICAgeVerificationState treatment](v6, "treatment");
            if (v20 == -[ICAgeVerificationState treatment](self, "treatment"))
            {
              -[ICAgeVerificationState verificationURL](v6, "verificationURL");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICAgeVerificationState verificationURL](self, "verificationURL");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v11 != v12)
              {
                -[ICAgeVerificationState verificationURL](v6, "verificationURL");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICAgeVerificationState verificationURL](self, "verificationURL");
                v3 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v13, "isEqual:", v3))
                {
                  v16 = 0;
                  goto LABEL_28;
                }
                v37 = v13;
              }
              -[ICAgeVerificationState error](v6, "error");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICAgeVerificationState error](self, "error");
              v30 = objc_claimAutoreleasedReturnValue();
              if (v29 == (void *)v30)
              {

                v16 = 1;
              }
              else
              {
                v31 = (void *)v30;
                -[ICAgeVerificationState error](v6, "error");
                v32 = v3;
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICAgeVerificationState error](self, "error");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v33, "isEqual:", v34);

                v3 = v32;
              }
              v13 = v37;
              if (v11 == v12)
                goto LABEL_29;
              goto LABEL_28;
            }
          }
        }
      }
      v16 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v16 = 0;
  }
LABEL_32:

  return v16;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  unint64_t v5;
  const __CFString *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ICAgeVerificationState isExplicitContentAllowed](self, "isExplicitContentAllowed");
  v5 = -[ICAgeVerificationState status](self, "status") - 1;
  if (v5 > 2)
    v6 = CFSTR("Age verification status unknown");
  else
    v6 = off_1E438C5B8[v5];
  v7 = -[ICAgeVerificationState treatment](self, "treatment");
  -[ICAgeVerificationState verificationURL](self, "verificationURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAgeVerificationState error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ICAgeVerificationState %p - explicit content allowed: %u - status: %@ - treatment: %ld - url: %@ - verifier: %@ - error: %@"), self, v4, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isExplicitContentAllowed
{
  return (-[ICAgeVerificationState status](self, "status") & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v5[3] = -[ICAgeVerificationState treatment](self, "treatment");
    -[ICAgeVerificationState verificationURL](self, "verificationURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[4];
    v5[4] = v7;

    -[ICAgeVerificationState error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[5];
    v5[5] = v10;

    -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = (void *)v5[6];
    v5[6] = v13;

    -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      v5[1] = -[ICAgeVerificationState status](self, "status");
  }
  return v5;
}

- (int64_t)status
{
  void *v4;
  void *v5;
  void *v6;
  int64_t *p_status;
  int64_t result;

  -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "runAgeVerification");

    -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_status = objc_msgSend(v6, "status");
    p_status = &self->_status;
LABEL_3:

    return *p_status;
  }
  p_status = &self->_status;
  result = self->_status;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICAgeVerificationState.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_status != ICAgeVerificationStatusUnknown"));
    goto LABEL_3;
  }
  return result;
}

- (ICAgeVerifier)ageVerifier
{
  return self->_ageVerifier;
}

- (NSError)error
{
  return self->_error;
}

- (id)_dictionaryRepresentationWithDSID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("ICAgeVerificationStateKeyDSID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ICAgeVerificationState status](self, "status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("ICAgeVerificationStateKeyStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ICAgeVerificationState treatment](self, "treatment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("ICAgeVerificationStateKeyTreatment"));

  -[ICAgeVerificationState verificationURL](self, "verificationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ICAgeVerificationState verificationURL](self, "verificationURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("ICAgeVerificationStateKeyVerificationURL"));

  }
  -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "verificationExpirationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "verificationExpirationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("ICAgeVerificationStateKeyAgeVerifierExpirationDate"));

  }
  v17 = (void *)objc_msgSend(v6, "copy");

  return v17;
}

- (NSURL)verificationURL
{
  return self->_verificationURL;
}

- (int64_t)treatment
{
  return self->_treatment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageVerifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_verificationURL, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (ICAgeVerificationState)initWithUserIdentity:(id)a3 ageVerifier:(id)a4 treatment:(int64_t)a5 verificationURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  ICAgeVerificationState *v13;
  uint64_t v14;
  ICUserIdentity *userIdentity;
  uint64_t v16;
  NSURL *verificationURL;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICAgeVerificationState;
  v13 = -[ICAgeVerificationState init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    userIdentity = v13->_userIdentity;
    v13->_userIdentity = (ICUserIdentity *)v14;

    v13->_status = 0;
    objc_storeStrong((id *)&v13->_ageVerifier, a4);
    v13->_treatment = a5;
    v16 = objc_msgSend(v12, "copy");
    verificationURL = v13->_verificationURL;
    v13->_verificationURL = (NSURL *)v16;

  }
  return v13;
}

- (BOOL)isDynamic
{
  void *v2;
  BOOL v3;

  -[ICAgeVerificationState ageVerifier](self, "ageVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)ageVerificationStateNotRequiredForUserIdentity:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ICAgeVerificationState _initWithUserIdentity:status:treatment:verificationURL:error:]([ICAgeVerificationState alloc], "_initWithUserIdentity:status:treatment:verificationURL:error:", v6, 1, 0, 0, v5);

  return v7;
}

+ (id)cachedStateForDSID:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastKnownUserAgeVerificationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = v4;
  else
    v8 = CFSTR("NoDSID");
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationState - cachedStateForDSID: - Reading state from disk - DSID=%@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(a1, "_stateFromDictionaryRepresentation:DSID:", v9, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v4 && -[__CFString integerValue](v4, "integerValue") >= 1)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationState - cachedStateForDSID: - Creating default state [No cache found] - DSID=%@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[__CFString integerValue](v4, "integerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ageVerificationStateNotRequiredForUserIdentity:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationState - cachedStateForDSID: - No cached state [Unactionable DSID] - DSID=%@", (uint8_t *)&v17, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

+ (id)_stateFromDictionaryRepresentation:(id)a3 DSID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  ICAgeVerifier *v27;
  void *v28;
  ICAgeVerifier *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyDSID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ICAgeVerificationState.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dictionaryRepresentation[ICAgeVerificationStateKeyDSID] isKindOfClass:[NSString class]]"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ICAgeVerificationState.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dictionaryRepresentation[ICAgeVerificationStateKeyStatus] isKindOfClass:[NSNumber class]]"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyTreatment"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ICAgeVerificationState.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dictionaryRepresentation[ICAgeVerificationStateKeyTreatment] isKindOfClass:[NSNumber class]]"));

  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyVerificationURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyVerificationURL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ICAgeVerificationState.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dictionaryRepresentation[ICAgeVerificationStateKeyVerificationURL] isKindOfClass:[NSString class]] || !dictionaryRepresentation[ICAgeVerificationStateKeyVerificationURL]"));
  }

LABEL_11:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyAgeVerifierExpirationDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyAgeVerifierExpirationDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ICAgeVerificationState.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dictionaryRepresentation[ICAgeVerificationStateKeyAgeVerifierExpirationDate] isKindOfClass:[NSDate class]] || !dictionaryRepresentation[ICAgeVerificationStateKeyAgeVerifierExpirationDate]"));
  }

LABEL_15:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyTreatment"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyVerificationURL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyVerificationURL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyAgeVerifierExpirationDate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = objc_opt_isKindOfClass();

  if ((v26 & 1) != 0)
  {
    v27 = [ICAgeVerifier alloc];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyAgeVerifierExpirationDate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[ICAgeVerifier initWithExpirationDate:](v27, "initWithExpirationDate:", v28);

  }
  else
  {
    v29 = 0;
  }
  v30 = (void *)objc_msgSend(CFSTR("NoDSID"), "copy");
  if ((objc_msgSend(v8, "isEqualToString:", v30) & 1) != 0)
  {
    v31 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "integerValue"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v29)
  {
    v33 = objc_msgSend(objc_alloc((Class)a1), "initWithUserIdentity:ageVerifier:treatment:verificationURL:", v31, v29, v20, v24);
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ICAgeVerificationStateKeyStatus"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "integerValue");

    v33 = objc_msgSend(objc_alloc((Class)a1), "_initWithUserIdentity:status:treatment:verificationURL:error:", v31, v35, v20, v24, 0);
  }
  v36 = (void *)v33;

  return v36;
}

@end
