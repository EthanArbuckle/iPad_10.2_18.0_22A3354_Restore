@implementation TPSEncryptedIdentityClient

- (id)encryptedIdentityInfoForSubscriptionContext:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0;
  -[TPSEncryptedIdentityClient encryptedIdentityInfoForSubscriptionContext:type:error:](self, "encryptedIdentityInfoForSubscriptionContext:type:error:", v6, a4, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    TPSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "tps_stringWithTPSEncryptedIdentityType:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v8;
      _os_log_error_impl(&dword_1DB4B7000, v10, OS_LOG_TYPE_ERROR, "Retrieving encrypted identity information of type %@ for subscription context %@ failed with error %@.", buf, 0x20u);

    }
  }

  return v7;
}

- (id)encryptedIdentityInfoForSubscriptionContext:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  -[TPSTelephonyController telephonyClient](self, "telephonyClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "tps_ctStringWithTPSEncryptedIdentityType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "context:getEncryptedIdentity:error:", v8, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
