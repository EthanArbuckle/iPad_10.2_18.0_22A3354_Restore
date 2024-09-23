@implementation KTVerifierResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4
{
  return -[KTVerifierResult initWithUri:application:ktResult:failure:](self, "initWithUri:application:ktResult:failure:", a3, a4, 0, 0);
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 failure:(id)a5
{
  return -[KTVerifierResult initWithUri:application:ktResult:failure:](self, "initWithUri:application:ktResult:failure:", a3, a4, 0, a5);
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5
{
  return -[KTVerifierResult initWithUri:application:ktResult:failure:](self, "initWithUri:application:ktResult:failure:", a3, a4, a5, 0);
}

- (KTVerifierResult)initWithUri:(id)a3 application:(id)a4 ktResult:(unint64_t)a5 failure:(id)a6
{
  id v10;
  id v11;
  id v12;
  KTVerifierResult *v13;
  KTVerifierResult *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)KTVerifierResult;
  v13 = -[KTVerifierResult init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[KTVerifierResult setUri:](v13, "setUri:", v10);
    -[KTVerifierResult setApplication:](v14, "setApplication:", v11);
    -[KTVerifierResult setSucceed:](v14, "setSucceed:", a5);
    -[KTVerifierResult setOptedIn:](v14, "setOptedIn:", 0);
    -[KTVerifierResult setEverOptedIn:](v14, "setEverOptedIn:", 0);
    -[KTVerifierResult setRecentlyOptedIn:](v14, "setRecentlyOptedIn:", 0);
    -[KTVerifierResult setStaticAccountKeyEnforced:](v14, "setStaticAccountKeyEnforced:", 0);
    -[KTVerifierResult setStaticAccountKeyStatus:](v14, "setStaticAccountKeyStatus:", 3);
    -[KTVerifierResult setFailure:](v14, "setFailure:", v12);
    -[KTVerifierResult setUiStatus:](v14, "setUiStatus:", 0);
  }

  return v14;
}

- (id)initUnavailableForUri:(id)a3 application:(id)a4
{
  return -[KTVerifierResult initWithUri:application:ktResult:](self, "initWithUri:application:ktResult:", a3, a4, 2);
}

- (id)initPendingForUri:(id)a3 application:(id)a4
{
  KTVerifierResult *v4;

  v4 = -[KTVerifierResult initWithUri:application:ktResult:](self, "initWithUri:application:ktResult:", a3, a4, 2);
  -[KTVerifierResult setUiStatus:](v4, "setUiStatus:", 3);

  return v4;
}

- (void)updateWithStaticKeyEnforced:(unint64_t)a3 isFailureIgnoredForDate:(BOOL)a4
{
  _BOOL4 v4;
  KTVerifierResult *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  -[KTVerifierResult setStaticAccountKeyStatus:](self, "setStaticAccountKeyStatus:");
  switch(a3)
  {
    case 0uLL:
      -[KTVerifierResult setStaticAccountKeyEnforced:](self, "setStaticAccountKeyEnforced:", 1);
      switch(-[KTVerifierResult uiStatus](self, "uiStatus"))
      {
        case 4uLL:
        case 13uLL:
          v7 = self;
          v8 = 5;
          goto LABEL_22;
        case 6uLL:
          goto LABEL_14;
        case 8uLL:
          goto LABEL_21;
        default:
          goto LABEL_23;
      }
      goto LABEL_23;
    case 1uLL:
      -[KTVerifierResult setStaticAccountKeyEnforced:](self, "setStaticAccountKeyEnforced:", 0);
      switch(-[KTVerifierResult uiStatus](self, "uiStatus"))
      {
        case 5uLL:
          v7 = self;
          v8 = 4;
          goto LABEL_22;
        case 7uLL:
          v7 = self;
          v8 = 6;
          goto LABEL_22;
        case 9uLL:
          v7 = self;
          v8 = 8;
          goto LABEL_22;
        case 13uLL:
          v7 = self;
          v8 = 3;
          goto LABEL_22;
        default:
          goto LABEL_23;
      }
      goto LABEL_23;
    case 2uLL:
      -[KTVerifierResult setStaticAccountKeyEnforced:](self, "setStaticAccountKeyEnforced:", 0);
      v9 = -[KTVerifierResult uiStatus](self, "uiStatus");
      if (v9 <= 0xD)
      {
        if (((1 << v9) & 0x20F9) != 0)
        {
          if (v4)
            goto LABEL_21;
          v7 = self;
          v8 = 13;
          goto LABEL_22;
        }
        if (((1 << v9) & 0x1100) != 0)
          goto LABEL_21;
      }
      goto LABEL_23;
    case 4uLL:
      -[KTVerifierResult setStaticAccountKeyEnforced:](self, "setStaticAccountKeyEnforced:", 0);
      v10 = -[KTVerifierResult uiStatus](self, "uiStatus");
      if (v10 > 0xD)
        goto LABEL_23;
      if (((1 << v10) & 0x30F9) != 0)
      {
        if (!v4)
        {
LABEL_14:
          v7 = self;
          v8 = 7;
          goto LABEL_22;
        }
      }
      else if (v10 != 8)
      {
        goto LABEL_23;
      }
LABEL_21:
      v7 = self;
      v8 = 9;
LABEL_22:
      -[KTVerifierResult setUiStatus:](v7, "setUiStatus:", v8);
LABEL_23:
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_8 != -1)
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_8, &__block_literal_global_8);
      v11 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_8;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        KTStaticKeyPeerValidateResultGetString(a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[KTVerifierResult staticAccountKeyEnforced](self, "staticAccountKeyEnforced");
        KTUIStatusGetString(-[KTVerifierResult uiStatus](self, "uiStatus"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTVerifierResult uri](self, "uri");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138413570;
        v18 = v13;
        v19 = 1024;
        v20 = a3;
        v21 = 1024;
        v22 = v14;
        v23 = 2114;
        v24 = v15;
        v25 = 2160;
        v26 = 1752392040;
        v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_DEFAULT, "updateWithStaticKeyEnforced (%@[%d], %{BOOL}d) updating UIStatus to %{public}@ for uri %{mask.hash}@", (uint8_t *)&v17, 0x36u);

      }
      return;
    default:
      -[KTVerifierResult setStaticAccountKeyEnforced:](self, "setStaticAccountKeyEnforced:", 0);
      goto LABEL_23;
  }
}

void __72__KTVerifierResult_updateWithStaticKeyEnforced_isFailureIgnoredForDate___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_8;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_8 = (uint64_t)v0;

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[KTVerifierResult uri](self, "uri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v4, CFSTR("uri"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTVerifierResult succeed](self, "succeed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v5, CFSTR("succeed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTVerifierResult optedIn](self, "optedIn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v6, CFSTR("optedIn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTVerifierResult everOptedIn](self, "everOptedIn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v7, CFSTR("everOptedIn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTVerifierResult recentlyOptedIn](self, "recentlyOptedIn"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v8, CFSTR("recentlyOptedIn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTVerifierResult staticAccountKeyEnforced](self, "staticAccountKeyEnforced"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v9, CFSTR("accountKeyEnforced"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTVerifierResult staticAccountKeyStatus](self, "staticAccountKeyStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v10, CFSTR("staticKeyStatus"));

  -[KTVerifierResult publicID](self, "publicID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[KTVerifierResult publicID](self, "publicID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v12, CFSTR("accountKey"));

  }
  -[KTVerifierResult loggableDatas](self, "loggableDatas");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[KTVerifierResult loggableDatas](self, "loggableDatas");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v14, CFSTR("loggableDatas"));

  }
  -[KTVerifierResult failure](self, "failure");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[KTVerifierResult failure](self, "failure");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v16, CFSTR("failure"));

  }
  if (-[KTVerifierResult uiStatus](self, "uiStatus"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[KTVerifierResult uiStatus](self, "uiStatus"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v17, CFSTR("uiStatus"));

  }
  -[KTVerifierResult application](self, "application");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[KTVerifierResult application](self, "application");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v19, CFSTR("application"));

  }
}

- (KTVerifierResult)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  KTVerifierResult *v17;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uri"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("succeed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optedIn"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("everOptedIn"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recentlyOptedIn"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKeyEnforced"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("loggableDatas"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setByAddingObjectsFromSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("failure"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uiStatus"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("staticKeyStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[KTVerifierResult initWithUri:application:]([KTVerifierResult alloc], "initWithUri:application:", v4, v5);
  if (v17)
  {
    -[KTVerifierResult setSucceed:](v17, "setSucceed:", objc_msgSend(v19, "unsignedIntegerValue"));
    -[KTVerifierResult setOptedIn:](v17, "setOptedIn:", objc_msgSend(v24, "BOOLValue"));
    -[KTVerifierResult setEverOptedIn:](v17, "setEverOptedIn:", objc_msgSend(v23, "BOOLValue"));
    -[KTVerifierResult setRecentlyOptedIn:](v17, "setRecentlyOptedIn:", objc_msgSend(v22, "BOOLValue"));
    -[KTVerifierResult setStaticAccountKeyEnforced:](v17, "setStaticAccountKeyEnforced:", objc_msgSend(v21, "BOOLValue"));
    -[KTVerifierResult setPublicID:](v17, "setPublicID:", v10);
    -[KTVerifierResult setLoggableDatas:](v17, "setLoggableDatas:", v9);
    -[KTVerifierResult setFailure:](v17, "setFailure:", v14);
    -[KTVerifierResult setUiStatus:](v17, "setUiStatus:", objc_msgSend(v15, "unsignedIntegerValue"));
    -[KTVerifierResult setStaticAccountKeyStatus:](v17, "setStaticAccountKeyStatus:", objc_msgSend(v16, "unsignedIntegerValue"));
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  KTVerifierResult *v5;
  KTVerifierResult *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  _BOOL4 v28;
  unint64_t v30;

  v5 = (KTVerifierResult *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[KTVerifierResult uri](self, "uri");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 || (-[KTVerifierResult uri](v6, "uri"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[KTVerifierResult uri](self, "uri");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTVerifierResult uri](v6, "uri");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v7)
        {

          if (!v10)
            goto LABEL_34;
        }
        else
        {

          if ((v10 & 1) == 0)
            goto LABEL_34;
        }
      }
      -[KTVerifierResult application](self, "application");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[KTVerifierResult application](v6, "application"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[KTVerifierResult application](self, "application");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTVerifierResult application](v6, "application");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (v12)
        {

          if (!v15)
            goto LABEL_34;
        }
        else
        {

          if ((v15 & 1) == 0)
            goto LABEL_34;
        }
      }
      v16 = -[KTVerifierResult succeed](self, "succeed");
      if (v16 != -[KTVerifierResult succeed](v6, "succeed"))
        goto LABEL_34;
      v17 = -[KTVerifierResult optedIn](self, "optedIn");
      if (v17 != -[KTVerifierResult optedIn](v6, "optedIn"))
        goto LABEL_34;
      v18 = -[KTVerifierResult staticAccountKeyEnforced](self, "staticAccountKeyEnforced");
      if (v18 != -[KTVerifierResult staticAccountKeyEnforced](v6, "staticAccountKeyEnforced"))
        goto LABEL_34;
      v19 = -[KTVerifierResult staticAccountKeyStatus](self, "staticAccountKeyStatus");
      if (v19 != -[KTVerifierResult staticAccountKeyStatus](v6, "staticAccountKeyStatus"))
        goto LABEL_34;
      -[KTVerifierResult loggableDatas](self, "loggableDatas");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20
        || (-[KTVerifierResult loggableDatas](v6, "loggableDatas"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[KTVerifierResult loggableDatas](self, "loggableDatas");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTVerifierResult loggableDatas](v6, "loggableDatas");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        if (v20)
        {

          if (!v23)
            goto LABEL_34;
        }
        else
        {

          if ((v23 & 1) == 0)
            goto LABEL_34;
        }
      }
      -[KTVerifierResult publicID](self, "publicID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24
        || (-[KTVerifierResult publicID](v6, "publicID"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[KTVerifierResult publicID](self, "publicID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[KTVerifierResult publicID](v6, "publicID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqual:", v26);

        if (v24)
        {

          if (!v27)
            goto LABEL_34;
        }
        else
        {

          if ((v27 & 1) == 0)
            goto LABEL_34;
        }
      }
      v28 = -[KTVerifierResult everOptedIn](self, "everOptedIn");
      if (v28 == -[KTVerifierResult everOptedIn](v6, "everOptedIn"))
      {
        v30 = -[KTVerifierResult uiStatus](self, "uiStatus");
        v11 = v30 == -[KTVerifierResult uiStatus](v6, "uiStatus");
        goto LABEL_35;
      }
LABEL_34:
      v11 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v11 = 0;
  }
LABEL_36:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD16A8];
  KTResultGetString(-[KTVerifierResult succeed](self, "succeed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  KTUIStatusGetString(-[KTVerifierResult uiStatus](self, "uiStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTVerifierResult uri](self, "uri");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTVerifierResult application](self, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("kt(%@) ui(%@) %@[%@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[KTVerifierResult failure](self, "failure");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[KTVerifierResult failure](self, "failure");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" failure: %@"), v10);

  }
  objc_msgSend(v8, "appendFormat:", CFSTR(" optIn: %d, everOptedIn: %d"), -[KTVerifierResult optedIn](self, "optedIn"), -[KTVerifierResult everOptedIn](self, "everOptedIn"));
  v11 = -[KTVerifierResult staticAccountKeyEnforced](self, "staticAccountKeyEnforced");
  KTStaticKeyPeerValidateResultGetString(-[KTVerifierResult staticAccountKeyStatus](self, "staticAccountKeyStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTVerifierResult publicID](self, "publicID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "publicAccountIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR(" staticKeyEnforced: %d, staticKeyStatus: %@, accountKey:%@ "), v11, v12, v14);

  -[KTVerifierResult loggableDatas](self, "loggableDatas");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR(" loggableDatas:%@"), v15);

  return v8;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTVerifierResult uri](self, "uri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTVerifierResult uri](self, "uri");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("uri"));

  }
  -[KTVerifierResult application](self, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[KTVerifierResult application](self, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("application"));

  }
  KTResultGetString(-[KTVerifierResult succeed](self, "succeed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ktResult"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTVerifierResult optedIn](self, "optedIn"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("optedIn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTVerifierResult everOptedIn](self, "everOptedIn"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("everOptedIn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[KTVerifierResult staticAccountKeyEnforced](self, "staticAccountKeyEnforced"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("staticKeyEnforced"));

  KTUIStatusGetString(-[KTVerifierResult uiStatus](self, "uiStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("uiStatus"));

  KTStaticKeyPeerValidateResultGetString(-[KTVerifierResult staticAccountKeyStatus](self, "staticAccountKeyStatus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("staticKeyStatus"));

  -[KTVerifierResult loggableDatas](self, "loggableDatas");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDBCEB8];
    -[KTVerifierResult loggableDatas](self, "loggableDatas");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[KTVerifierResult loggableDatas](self, "loggableDatas", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v23), "diagnosticsJsonDictionary");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("loggableDatas"));
  }
  -[KTVerifierResult publicID](self, "publicID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[KTVerifierResult publicID](self, "publicID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "publicAccountIdentity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("publicID"));

  }
  -[KTVerifierResult failure](self, "failure");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[KTVerifierResult failure](self, "failure");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("failure"));

  }
  return (NSDictionary *)v3;
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUri:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)succeed
{
  return self->_succeed;
}

- (void)setSucceed:(unint64_t)a3
{
  self->_succeed = a3;
}

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  self->_optedIn = a3;
}

- (BOOL)staticAccountKeyEnforced
{
  return self->_staticAccountKeyEnforced;
}

- (void)setStaticAccountKeyEnforced:(BOOL)a3
{
  self->_staticAccountKeyEnforced = a3;
}

- (unint64_t)staticAccountKeyStatus
{
  return self->_staticAccountKeyStatus;
}

- (void)setStaticAccountKeyStatus:(unint64_t)a3
{
  self->_staticAccountKeyStatus = a3;
}

- (KTAccountPublicID)publicID
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPublicID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)loggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLoggableDatas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)everOptedIn
{
  return self->_everOptedIn;
}

- (void)setEverOptedIn:(BOOL)a3
{
  self->_everOptedIn = a3;
}

- (BOOL)recentlyOptedIn
{
  return self->_recentlyOptedIn;
}

- (void)setRecentlyOptedIn:(BOOL)a3
{
  self->_recentlyOptedIn = a3;
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFailure:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)uiStatus
{
  return self->_uiStatus;
}

- (void)setUiStatus:(unint64_t)a3
{
  self->_uiStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_loggableDatas, 0);
  objc_storeStrong((id *)&self->_publicID, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
