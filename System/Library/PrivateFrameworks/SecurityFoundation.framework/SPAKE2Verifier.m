@implementation SPAKE2Verifier

+ (id)generateCodeWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)SecPasswordCreateWithRandomDigits();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else if (a3)
  {
    *a3 = 0;
  }

  return v5;
}

- (SPAKE2Verifier)initWithSalt:(id)a3 code:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  SPAKE2Verifier *v10;
  SPAKE2Common *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  SPAKE2Verifier *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SPAKE2Verifier;
  v10 = -[SPAKE2Verifier init](&v18, sel_init);
  if (!v10)
    goto LABEL_4;
  v11 = -[SPAKE2Common initWithSalt:code:]([SPAKE2Common alloc], "initWithSalt:code:", v8, v9);
  -[SPAKE2Verifier setCommon:](v10, "setCommon:", v11);

  -[SPAKE2Verifier common](v10, "common");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "generateStateWithError:", a5);

  if (!v13)
    goto LABEL_5;
  -[SPAKE2Verifier common](v10, "common");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "setupVerifier:", a5);

  if (v15)
LABEL_4:
    v16 = v10;
  else
LABEL_5:
    v16 = 0;

  return v16;
}

- (id)getCode
{
  void *v2;
  void *v3;

  -[SPAKE2Verifier common](self, "common");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "code");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getMsg1WithError:(id *)a3
{
  void *v4;
  void *v5;

  -[SPAKE2Verifier common](self, "common");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getMsg1WithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)processMsg1:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SPAKE2Verifier common](self, "common");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "processMsg1:error:", v6, a4);

  return (char)a4;
}

- (id)getMsg2WithError:(id *)a3
{
  void *v4;
  void *v5;

  -[SPAKE2Verifier common](self, "common");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getMsg2WithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)processMsg2:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SPAKE2Verifier common](self, "common");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "processMsg2:error:", v6, a4);

  return (char)a4;
}

- (BOOL)isVerified
{
  void *v2;
  char v3;

  -[SPAKE2Verifier common](self, "common");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVerified");

  return v3;
}

- (id)getKey
{
  void *v2;
  void *v3;

  -[SPAKE2Verifier common](self, "common");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)encryptMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SPAKE2Verifier common](self, "common");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encryptMessage:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)decryptMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SPAKE2Verifier common](self, "common");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decryptMessage:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SPAKE2Common)common
{
  return (SPAKE2Common *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCommon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_common, 0);
}

@end
