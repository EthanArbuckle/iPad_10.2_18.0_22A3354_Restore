@implementation UMUserSwitchContext

+ (id)contextWithSetupData:(id)a3 shortLivedToken:(id)a4 secondaryActionRequired:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void **v9;
  const char *v10;
  void **v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  SEL v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void **)objc_opt_new();
  v11 = v9;
  if (v9)
  {
    objc_msgSend_setSetupData_(v9, v10, (uint64_t)v7);
    objc_msgSend_setShortLivedToken_(v11, v12, (uint64_t)v8);
    objc_msgSend_setSecondaryActionRequired_(v11, v13, v5);
    if (sub_18FAED900())
    {
      objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryForKey_(v16, v17, (uint64_t)CFSTR("UMSwitchEnvironmentsByServicesForUser"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_nonatomic_copy(v11, v19, v18, 32);

      sub_18FAEA1C0();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v11[4], v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE99B4((uint64_t)UMLogMessage, CFSTR("Environments by services: \n%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      sub_18FAE964C((uint64_t)v20, v30);

    }
  }

  return v11;
}

- (id)description
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  sub_18FB05EB0((uint64_t *)self, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSData)setupData
{
  return self->_setupData;
}

- (void)setSetupData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)shortLivedToken
{
  return self->_shortLivedToken;
}

- (void)setShortLivedToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)secondaryActionRequired
{
  return self->_secondaryActionRequired;
}

- (void)setSecondaryActionRequired:(BOOL)a3
{
  self->_secondaryActionRequired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentsByServices, 0);
  objc_storeStrong((id *)&self->_shortLivedToken, 0);
  objc_storeStrong((id *)&self->_setupData, 0);
}

@end
