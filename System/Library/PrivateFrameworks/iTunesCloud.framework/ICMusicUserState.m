@implementation ICMusicUserState

- (ICMusicUserProfile)userProfile
{
  return self->_userProfile;
}

- (ICMusicUserState)initWithBlock:(id)a3
{
  void (**v4)(id, ICMusicUserState *);
  ICMusicUserState *v5;
  objc_super v7;

  v4 = (void (**)(id, ICMusicUserState *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICMusicUserState;
  v5 = -[ICMusicUserState init](&v7, sel_init);
  if (v5)
  {
    v4[2](v4, v5);
    v5->_frozen = 1;
  }

  return v5;
}

- (id)copyWithBlock:(id)a3
{
  id v4;
  ICMusicUserState *v5;
  id v6;
  ICMusicUserState *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = [ICMusicUserState alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__ICMusicUserState_copyWithBlock___block_invoke;
  v9[3] = &unk_1E438D1F8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = -[ICMusicUserState initWithBlock:](v5, "initWithBlock:", v9);

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMusicUserState carrierBundleDeviceID](self, "carrierBundleDeviceID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("carrierBundleDeviceID"));

  -[ICMusicUserState libraryAuthTokenStatus](self, "libraryAuthTokenStatus");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("libraryAuthTokenStatus"));

  -[ICMusicUserState subscriptionStatus](self, "subscriptionStatus");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("subscriptionStatus"));

  -[ICMusicUserState lightweightSubscriptionStatus](self, "lightweightSubscriptionStatus");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("lightweightSubscriptionStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ICMusicUserState cloudLibrarySyncStatus](self, "cloudLibrarySyncStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("cloudLibrarySyncStatus"));

  if (-[ICMusicUserState usesListeningHistory](self, "usesListeningHistory"))
    v17 = MEMORY[0x1E0C9AAB0];
  else
    v17 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("usesListeningHistory"));
  -[ICMusicUserState userProfile](self, "userProfile");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("userProfile"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p [%@]>"), objc_opt_class(), self, v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (BOOL)isEqual:(id)a3
{
  ICMusicUserState *v4;
  ICMusicUserState *v5;
  id v6;
  id v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  id v15;
  id v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  id v33;
  id v34;
  void *v35;
  int v36;
  int64_t v37;
  _BOOL4 v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v4 = (ICMusicUserState *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ICMusicUserState carrierBundleDeviceID](self, "carrierBundleDeviceID");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMusicUserState carrierBundleDeviceID](v5, "carrierBundleDeviceID");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          LOBYTE(v9) = 0;
LABEL_42:

          goto LABEL_43;
        }
      }
      -[ICMusicUserState libraryAuthTokenStatus](self, "libraryAuthTokenStatus");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "token");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "token");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMusicUserState libraryAuthTokenStatus](v5, "libraryAuthTokenStatus");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "token");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "token");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 == v13)
      {

      }
      else
      {
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (!v14)
        {
          LOBYTE(v9) = 0;
LABEL_41:

          goto LABEL_42;
        }
      }
      v53 = v11;
      -[ICMusicUserState subscriptionStatus](self, "subscriptionStatus");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMusicUserState subscriptionStatus](v5, "subscriptionStatus");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v56 = v15;
      v52 = v10;
      if (v15 == v16)
      {

      }
      else
      {
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (!v17)
        {
          LOBYTE(v9) = 0;
          v10 = v52;
LABEL_40:

          v11 = v53;
          goto LABEL_41;
        }
      }
      -[ICMusicUserState lightweightSubscriptionStatus](self, "lightweightSubscriptionStatus");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMusicUserState lightweightSubscriptionStatus](v5, "lightweightSubscriptionStatus");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v50 = v19;
      v51 = v18;
      if (v18 == v19)
      {

      }
      else
      {
        v20 = v19;
        v21 = objc_msgSend(v18, "isEqual:", v19);

        if (!v21)
        {
          LOBYTE(v9) = 0;
          v10 = v52;
LABEL_39:

          goto LABEL_40;
        }
      }
      -[ICMusicUserState cookies](self, "cookies");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "xpab");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMusicUserState cookies](v5, "cookies");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "xpab");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v49 = v22;
      v46 = v24;
      v47 = v23;
      if (v23 == v24)
      {

      }
      else
      {
        v25 = v24;
        v26 = v23;
        v27 = v25;
        v28 = objc_msgSend(v26, "isEqual:", v25);

        if (!v28)
        {
          LOBYTE(v9) = 0;
          v10 = v52;
LABEL_38:

          goto LABEL_39;
        }
      }
      -[ICMusicUserState cookies](self, "cookies");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "itfe");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMusicUserState cookies](v5, "cookies");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "itfe");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v45 = v29;
      v42 = v30;
      if (v29 == v30)
      {

      }
      else
      {
        v31 = v30;
        v32 = objc_msgSend(v29, "isEqual:", v30);

        if (!v32)
        {
          LOBYTE(v9) = 0;
          v10 = v52;
LABEL_37:

          goto LABEL_38;
        }
      }
      -[ICMusicUserState userProfile](self, "userProfile");
      v33 = (id)objc_claimAutoreleasedReturnValue();
      -[ICMusicUserState userProfile](v5, "userProfile");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v34;
      v41 = v33;
      if (v33 == v34)
      {

      }
      else
      {
        v35 = v34;
        v36 = objc_msgSend(v33, "isEqual:", v34);

        if (!v36)
          goto LABEL_35;
      }
      v37 = -[ICMusicUserState cloudLibrarySyncStatus](self, "cloudLibrarySyncStatus");
      if (v37 == -[ICMusicUserState cloudLibrarySyncStatus](v5, "cloudLibrarySyncStatus"))
      {
        v38 = -[ICMusicUserState usesListeningHistory](self, "usesListeningHistory");
        v9 = v38 ^ -[ICMusicUserState usesListeningHistory](v5, "usesListeningHistory") ^ 1;
LABEL_36:
        v10 = v52;

        goto LABEL_37;
      }
LABEL_35:
      LOBYTE(v9) = 0;
      goto LABEL_36;
    }
    LOBYTE(v9) = 0;
  }
LABEL_43:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *carrierBundleDeviceID;
  id v5;

  carrierBundleDeviceID = self->_carrierBundleDeviceID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", carrierBundleDeviceID, CFSTR("carrierBundleDeviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_libraryAuthTokenStatus, CFSTR("libraryAuthTokenStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subscriptionStatus, CFSTR("subscriptionStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lightweightSubscriptionStatus, CFSTR("lightweightSubscriptionStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cloudLibrarySyncStatus, CFSTR("cloudLibrarySyncStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usesListeningHistory, CFSTR("usesListeningHistory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cookies, CFSTR("cookies"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userProfile, CFSTR("userProfile"));

}

- (ICMusicUserState)initWithCoder:(id)a3
{
  id v4;
  ICMusicUserState *v5;
  uint64_t v6;
  NSString *carrierBundleDeviceID;
  uint64_t v8;
  ICMusicLibraryAuthTokenStatus *libraryAuthTokenStatus;
  uint64_t v10;
  ICMusicSubscriptionStatus *subscriptionStatus;
  uint64_t v12;
  ICLightweightMusicSubscriptionStatus *lightweightSubscriptionStatus;
  uint64_t v14;
  ICMusicUserStateCookies *cookies;
  uint64_t v16;
  ICMusicUserProfile *userProfile;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICMusicUserState;
  v5 = -[ICMusicUserState init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierBundleDeviceID"));
    v6 = objc_claimAutoreleasedReturnValue();
    carrierBundleDeviceID = v5->_carrierBundleDeviceID;
    v5->_carrierBundleDeviceID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryAuthTokenStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    libraryAuthTokenStatus = v5->_libraryAuthTokenStatus;
    v5->_libraryAuthTokenStatus = (ICMusicLibraryAuthTokenStatus *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subscriptionStatus"));
    v10 = objc_claimAutoreleasedReturnValue();
    subscriptionStatus = v5->_subscriptionStatus;
    v5->_subscriptionStatus = (ICMusicSubscriptionStatus *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightweightSubscriptionStatus"));
    v12 = objc_claimAutoreleasedReturnValue();
    lightweightSubscriptionStatus = v5->_lightweightSubscriptionStatus;
    v5->_lightweightSubscriptionStatus = (ICLightweightMusicSubscriptionStatus *)v12;

    v5->_cloudLibrarySyncStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cloudLibrarySyncStatus"));
    v5->_usesListeningHistory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesListeningHistory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cookies"));
    v14 = objc_claimAutoreleasedReturnValue();
    cookies = v5->_cookies;
    v5->_cookies = (ICMusicUserStateCookies *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userProfile"));
    v16 = objc_claimAutoreleasedReturnValue();
    userProfile = v5->_userProfile;
    v5->_userProfile = (ICMusicUserProfile *)v16;

  }
  return v5;
}

- (void)setCarrierBundleDeviceID:(id)a3
{
  id v5;
  NSString *v6;
  NSString *carrierBundleDeviceID;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserState.m"), 145, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (NSString *)objc_msgSend(v5, "copy");
  carrierBundleDeviceID = self->_carrierBundleDeviceID;
  self->_carrierBundleDeviceID = v6;

}

- (void)setLibraryAuthTokenStatus:(id)a3
{
  id v5;
  ICMusicLibraryAuthTokenStatus *v6;
  ICMusicLibraryAuthTokenStatus *libraryAuthTokenStatus;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserState.m"), 150, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (ICMusicLibraryAuthTokenStatus *)objc_msgSend(v5, "copy");
  libraryAuthTokenStatus = self->_libraryAuthTokenStatus;
  self->_libraryAuthTokenStatus = v6;

}

- (void)setSubscriptionStatus:(id)a3
{
  id v5;
  ICMusicSubscriptionStatus *v6;
  ICMusicSubscriptionStatus *subscriptionStatus;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserState.m"), 155, CFSTR("Attempt to mutate after being initialized."));

    v5 = v9;
  }
  v6 = (ICMusicSubscriptionStatus *)objc_msgSend(v5, "copy");
  subscriptionStatus = self->_subscriptionStatus;
  self->_subscriptionStatus = v6;

}

- (void)setCloudLibrarySyncStatus:(int64_t)a3
{
  void *v6;

  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserState.m"), 160, CFSTR("Attempt to mutate after being initialized."));

  }
  self->_cloudLibrarySyncStatus = a3;
}

- (void)setUsesListeningHistory:(BOOL)a3
{
  void *v6;

  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserState.m"), 165, CFSTR("Attempt to mutate after being initialized."));

  }
  self->_usesListeningHistory = a3;
}

- (void)setCookies:(id)a3
{
  ICMusicUserStateCookies *v5;
  ICMusicUserStateCookies *cookies;
  void *v7;

  v5 = (ICMusicUserStateCookies *)a3;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserState.m"), 170, CFSTR("Attempt to mutate after being initialized."));

  }
  cookies = self->_cookies;
  self->_cookies = v5;

}

- (void)setLightweightSubscriptionStatus:(id)a3
{
  ICLightweightMusicSubscriptionStatus *v5;
  ICLightweightMusicSubscriptionStatus *lightweightSubscriptionStatus;
  void *v7;

  v5 = (ICLightweightMusicSubscriptionStatus *)a3;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserState.m"), 175, CFSTR("Attempt to mutate after being initialized."));

  }
  lightweightSubscriptionStatus = self->_lightweightSubscriptionStatus;
  self->_lightweightSubscriptionStatus = v5;

}

- (void)setUserProfile:(id)a3
{
  ICMusicUserProfile *v5;
  ICMusicUserProfile *userProfile;
  void *v7;

  v5 = (ICMusicUserProfile *)a3;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicUserState.m"), 180, CFSTR("Attempt to mutate after being initialized."));

  }
  userProfile = self->_userProfile;
  self->_userProfile = v5;

}

- (ICDelegateToken)delegateToken
{
  return self->_delegateToken;
}

- (BOOL)isDelegated
{
  return self->_isDelegated;
}

- (NSString)carrierBundleDeviceID
{
  return self->_carrierBundleDeviceID;
}

- (ICMusicLibraryAuthTokenStatus)libraryAuthTokenStatus
{
  return self->_libraryAuthTokenStatus;
}

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (ICLightweightMusicSubscriptionStatus)lightweightSubscriptionStatus
{
  return self->_lightweightSubscriptionStatus;
}

- (int64_t)cloudLibrarySyncStatus
{
  return self->_cloudLibrarySyncStatus;
}

- (BOOL)usesListeningHistory
{
  return self->_usesListeningHistory;
}

- (ICMusicUserStateCookies)cookies
{
  return self->_cookies;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfile, 0);
  objc_storeStrong((id *)&self->_cookies, 0);
  objc_storeStrong((id *)&self->_lightweightSubscriptionStatus, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
  objc_storeStrong((id *)&self->_libraryAuthTokenStatus, 0);
  objc_storeStrong((id *)&self->_carrierBundleDeviceID, 0);
  objc_storeStrong((id *)&self->_delegateToken, 0);
}

void __34__ICMusicUserState_copyWithBlock___block_invoke(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 3, *(id *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = a2;
  objc_storeStrong(v4 + 4, *(id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_storeStrong(v4 + 5, *(id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_storeStrong(v4 + 6, *(id *)(*(_QWORD *)(a1 + 32) + 48));
  v4[7] = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  *((_BYTE *)v4 + 9) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9);
  objc_storeStrong(v4 + 8, *(id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_storeStrong(v4 + 9, *(id *)(*(_QWORD *)(a1 + 32) + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (int64_t)groupSessionCapableStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedSharedControlsCapability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = -1;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
