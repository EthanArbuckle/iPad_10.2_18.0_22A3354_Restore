@implementation SBFCredentialSet

- (SBFCredentialSet)init
{
  return -[SBFCredentialSet initWithSerializedCredentialSet:](self, "initWithSerializedCredentialSet:", 0);
}

- (SBFCredentialSet)initWithSerializedCredentialSet:(id)a3
{
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  _DWORD *v9;
  NSObject *v10;
  SBFCredentialSet *v11;
  int v12;
  int v13;
  NSObject *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBFCredentialSet;
  v6 = -[SBFCredentialSet init](&v16, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_11;
  if (v5)
  {
    *((_BYTE *)v6 + 16) = 0;
    objc_storeStrong((id *)v6 + 3, a3);
    v8 = objc_retainAutorelease(v5);
    v9 = ACMContextCreateWithExternalForm((_OWORD *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
    v7[1] = v9;
    if (!v9)
    {
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SBFCredentialSet initWithSerializedCredentialSet:].cold.2(v10);

      v11 = 0;
      goto LABEL_12;
    }
LABEL_11:
    v11 = v7;
    goto LABEL_12;
  }
  *((_BYTE *)v6 + 16) = 1;
  v12 = ACMContextCreate((uint64_t *)v6 + 1);
  if (!v12)
    goto LABEL_11;
  v13 = v12;
  SBLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SBFCredentialSet initWithSerializedCredentialSet:].cold.1(v13, v14);

  v11 = 0;
  v7[1] = 0;
LABEL_12:

  return v11;
}

- (void)dealloc
{
  __ACMHandle *acmContext;
  objc_super v4;

  acmContext = self->_acmContext;
  if (acmContext)
  {
    ACMContextDelete(acmContext, self->_ownsContext);
    self->_acmContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFCredentialSet;
  -[SBFCredentialSet dealloc](&v4, sel_dealloc);
}

- (id)serializedCredentialSet
{
  NSData *cachedCredentials;
  __ACMHandle *acmContext;
  _QWORD v6[5];

  cachedCredentials = self->_cachedCredentials;
  if (!cachedCredentials)
  {
    acmContext = self->_acmContext;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__SBFCredentialSet_serializedCredentialSet__block_invoke;
    v6[3] = &unk_1E200F310;
    v6[4] = self;
    ACMContextGetExternalForm(acmContext, (uint64_t)v6);
    cachedCredentials = self->_cachedCredentials;
  }
  return cachedCredentials;
}

void __43__SBFCredentialSet_serializedCredentialSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v4;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFCredentialSet serializedCredentialSet](self, "serializedCredentialSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDataObject:", v5);

}

- (SBFCredentialSet)initWithCoder:(id)a3
{
  void *v4;
  SBFCredentialSet *v5;

  objc_msgSend(a3, "decodeDataObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[SBFCredentialSet initWithSerializedCredentialSet:](self, "initWithSerializedCredentialSet:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCredentials, 0);
}

- (void)initWithSerializedCredentialSet:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18AB69000, a2, OS_LOG_TYPE_ERROR, "ACMContextCreate failed: %d", (uint8_t *)v2, 8u);
}

- (void)initWithSerializedCredentialSet:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18AB69000, log, OS_LOG_TYPE_ERROR, "ACMContextCreate failed from credential set.", v1, 2u);
}

@end
