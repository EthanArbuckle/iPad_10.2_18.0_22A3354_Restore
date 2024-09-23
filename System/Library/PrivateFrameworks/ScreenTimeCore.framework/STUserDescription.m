@implementation STUserDescription

- (STUserDescription)initWithGivenName:(id)a3 familyName:(id)a4 userDSID:(id)a5 userAltDSID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  STUserDescription *v14;
  uint64_t v15;
  NSString *givenName;
  uint64_t v17;
  NSString *familyName;
  uint64_t v19;
  NSNumber *userDSID;
  uint64_t v21;
  NSString *userAltDSID;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)STUserDescription;
  v14 = -[STUserDescription init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    givenName = v14->_givenName;
    v14->_givenName = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    familyName = v14->_familyName;
    v14->_familyName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    userDSID = v14->_userDSID;
    v14->_userDSID = (NSNumber *)v19;

    v21 = objc_msgSend(v13, "copy");
    userAltDSID = v14->_userAltDSID;
    v14->_userAltDSID = (NSString *)v21;

  }
  return v14;
}

+ (id)currentUser
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  STUserDescription *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    +[STLog utility](STLog, "utility");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D22E7000, v12, OS_LOG_TYPE_INFO, "No Apple Account", (uint8_t *)&v15, 2u);
    }

    v5 = 0;
    v6 = 0;
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "aa_firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "aa_personID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v8, "longLongValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "aa_altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[STLog utility](STLog, "utility");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1D22E7000, v11, OS_LOG_TYPE_INFO, "Account DSID %@: %@ %@", (uint8_t *)&v15, 0x20u);
  }

  if (!v9)
LABEL_9:
    v9 = &unk_1E938DA48;
  v13 = -[STUserDescription initWithGivenName:familyName:userDSID:userAltDSID:]([STUserDescription alloc], "initWithGivenName:familyName:userDSID:userAltDSID:", v5, v6, v9, v10);

  return v13;
}

+ (void)currentUserWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__STUserDescription_currentUserWithCompletion___block_invoke;
  v6[3] = &unk_1E9371E58;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "aa_primaryAppleAccountWithCompletion:", v6);

}

void __47__STUserDescription_currentUserWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  STUserDescription *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    +[STLog utility](STLog, "utility");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1D22E7000, v14, OS_LOG_TYPE_INFO, "No Apple Account", (uint8_t *)&v16, 2u);
    }

    v7 = 0;
    v8 = 0;
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "aa_firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "aa_personID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "aa_altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[STLog utility](STLog, "utility");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v16 = 138412802;
    v17 = v11;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1D22E7000, v13, OS_LOG_TYPE_INFO, "Account DSID %@: %@ %@", (uint8_t *)&v16, 0x20u);
  }

  if (!v11)
LABEL_9:
    v11 = &unk_1E938DA48;
  v15 = -[STUserDescription initWithGivenName:familyName:userDSID:userAltDSID:]([STUserDescription alloc], "initWithGivenName:familyName:userDSID:userAltDSID:", v7, v8, v11, v12);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (NSString)userAltDSID
{
  return self->_userAltDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAltDSID, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

@end
