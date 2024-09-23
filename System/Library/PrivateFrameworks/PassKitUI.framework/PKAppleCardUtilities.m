@implementation PKAppleCardUtilities

- (PKAppleCardUtilities)init
{
  PKAppleCardUtilities *v2;
  PKAppleCardUtilities *v3;
  uint64_t v4;
  PKPaymentService *paymentService;
  uint64_t v6;
  PKAccountService *accountService;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKAppleCardUtilities;
  v2 = -[PKAppleCardUtilities init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v2);
    paymentService = v3->_paymentService;
    v3->_paymentService = (PKPaymentService *)v4;

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    accountService = v3->_accountService;
    v3->_accountService = (PKAccountService *)v6;

    -[PKAccountService registerObserver:](v3->_accountService, "registerObserver:", v3);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountService unregisterObserver:](self->_accountService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKAppleCardUtilities;
  -[PKAppleCardUtilities dealloc](&v3, sel_dealloc);
}

- (void)hasAppleCardWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Checking if the current user has apple card", buf, 2u);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PKAppleCardUtilities_hasAppleCardWithCompletion___block_invoke;
    v6[3] = &unk_1E3E61850;
    v6[4] = self;
    v7 = v4;
    -[PKAppleCardUtilities _fetchDataIfNecessaryWithCompletion:](self, "_fetchDataIfNecessaryWithCompletion:", v6);

  }
}

void __51__PKAppleCardUtilities_hasAppleCardWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  os_unfair_lock_s *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void (*v9)(void);
  const char *v10;
  uint8_t *v11;
  uint8_t v12[16];
  uint8_t buf[2];
  __int16 v14;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v4 = *(id *)(v2 + 56);
  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = v3;
  os_unfair_lock_unlock(v5);
  if (!v6)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v10 = "User doesnt have an apple card account";
      v11 = (uint8_t *)&v14;
LABEL_10:
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    }
LABEL_11:

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      v10 = "User doesnt have apple card pass provisioned";
      v11 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v8)
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Current user has apple card", v12, 2u);
  }

  v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_12:
  v9();

}

- (void)appleCardAccountStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Checking the current user's apple card account state", buf, 2u);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__PKAppleCardUtilities_appleCardAccountStateWithCompletion___block_invoke;
    v6[3] = &unk_1E3E61850;
    v6[4] = self;
    v7 = v4;
    -[PKAppleCardUtilities _fetchDataIfNecessaryWithCompletion:](self, "_fetchDataIfNecessaryWithCompletion:", v6);

  }
}

void __60__PKAppleCardUtilities_appleCardAccountStateWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void (*v6)(void);
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (v2)
  {
    v3 = objc_msgSend(v2, "state") - 1;
    if (v3 > 3)
      v4 = 0;
    else
      v4 = qword_19DF15320[v3];
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Current user's apple card account is in state: %@", (uint8_t *)&v9, 0xCu);

    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "User doesnt have an apple card account", (uint8_t *)&v9, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

- (void)appleCardAccessLevelForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Checking apple card access level of user %@", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__PKAppleCardUtilities_appleCardAccessLevelForAltDSID_completion___block_invoke;
    v9[3] = &unk_1E3E65388;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    -[PKAppleCardUtilities _fetchDataIfNecessaryWithCompletion:](self, "_fetchDataIfNecessaryWithCompletion:", v9);

  }
}

void __66__PKAppleCardUtilities_appleCardAccessLevelForAltDSID_completion___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  v2 = *(id *)(a1[4] + 32);
  v3 = *(id *)(a1[4] + 48);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  objc_msgSend(v3, "accountUserWithAltDSID:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[5];
    v20 = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Apple Card account user for altDSID %@ is %@", (uint8_t *)&v20, 0x16u);
  }

  v7 = objc_msgSend(v4, "accessLevel");
  if (!v7)
  {
LABEL_5:
    PKCurrentUserAltDSID();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)a1[5];
    v10 = v8;
    v11 = v9;
    if (v10 == v11)
    {

    }
    else
    {
      v12 = v11;
      if (!v10 || !v11)
      {

        v7 = 0;
LABEL_14:

        goto LABEL_15;
      }
      v13 = -[NSObject isEqualToString:](v10, "isEqualToString:", v11);

      if (!v13)
      {
        v7 = 0;
        goto LABEL_15;
      }
    }
    v7 = objc_msgSend(v2, "accessLevel");
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = a1[5];
      v20 = 138412290;
      v21 = v14;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "altDSID %@ is the current Apple Card user", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
  PKLogFacilityTypeGetObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = a1[5];
    PKAccountAccessLevelToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v16;
    v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Apple Card access level for %@ is %@", (uint8_t *)&v20, 0x16u);

  }
  v18 = 1;
  if (v7 == 2)
    v18 = 2;
  if (v7)
    v19 = v18;
  else
    v19 = 0;
  (*(void (**)(_QWORD, uint64_t))(a1[6] + 16))(a1[6], v19);

}

- (void)appleCardIsSharedWithWithAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Checking apple card is being shared with altDSID %@.", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__PKAppleCardUtilities_appleCardIsSharedWithWithAltDSID_completion___block_invoke;
    v9[3] = &unk_1E3E65388;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    -[PKAppleCardUtilities _fetchDataIfNecessaryWithCompletion:](self, "_fetchDataIfNecessaryWithCompletion:", v9);

  }
}

void __68__PKAppleCardUtilities_appleCardIsSharedWithWithAltDSID_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (!v2)
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v13 = *(_QWORD *)(a1 + 40);
    v18 = 138412290;
    v19 = v13;
    v14 = "Cannot check if apple card is being shared with %@ since there is no account.";
LABEL_13:
    _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 0xCu);
    goto LABEL_14;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v15 = *(_QWORD *)(a1 + 40);
    v18 = 138412290;
    v19 = v15;
    v14 = "Cannot check if apple card is being shared with %@ since there is no pass.";
    goto LABEL_13;
  }
  objc_msgSend(v3, "accountUsers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_activeAccountUserWithAltDSID:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v10 = *(_QWORD *)(a1 + 40);
        v18 = 138412290;
        v19 = v10;
        v11 = "Apple card is being shared with altDSID %@.";
LABEL_17:
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, 0xCu);
      }
    }
    else if (v9)
    {
      v17 = *(_QWORD *)(a1 + 40);
      v18 = 138412290;
      v19 = v17;
      v11 = "Apple card is not being shared with altDSID %@.";
      goto LABEL_17;
    }

    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7 != 0);
    goto LABEL_19;
  }
  PKLogFacilityTypeGetObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 40);
    v18 = 138412290;
    v19 = v16;
    v14 = "Cannot check if apple card is being shared with %@ since there are no account users.";
    goto LABEL_13;
  }
LABEL_14:

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
LABEL_19:

}

- (void)hasSentPendingAppleCardInvitationToUserWithAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Checking if pending sent invitation exists with altDSID %@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__PKAppleCardUtilities_hasSentPendingAppleCardInvitationToUserWithAltDSID_completion___block_invoke;
    v10[3] = &unk_1E3E65388;
    v10[4] = self;
    v11 = v6;
    v12 = v8;
    -[PKAppleCardUtilities _fetchDataIfNecessaryWithCompletion:](self, "_fetchDataIfNecessaryWithCompletion:", v10);

  }
}

void __86__PKAppleCardUtilities_hasSentPendingAppleCardInvitationToUserWithAltDSID_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (!v2)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v11 = *(_QWORD *)(a1 + 40);
    v16 = 138412290;
    v17 = v11;
    v12 = "Cannot check for pending apple card invitations with %@ since there is no account.";
LABEL_13:
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0xCu);
    goto LABEL_14;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v13 = *(_QWORD *)(a1 + 40);
    v16 = 138412290;
    v17 = v13;
    v12 = "Cannot check for pending apple card invitations with %@ since there is no pass.";
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_pendingSentInvitationWithAltDSID:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 40);
        v16 = 138412290;
        v17 = v8;
        v9 = "Apple card has a sent pending invitation with altDSID %@.";
LABEL_17:
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 0xCu);
      }
    }
    else if (v7)
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = 138412290;
      v17 = v15;
      v9 = "Apple card has no sent pending invitation with altDSID %@.";
      goto LABEL_17;
    }

    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5 != 0);
    goto LABEL_19;
  }
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 40);
    v16 = 138412290;
    v17 = v14;
    v12 = "Cannot check for pending apple card invitations with %@ since there are no sent invitations.";
    goto LABEL_13;
  }
LABEL_14:

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
LABEL_19:

}

- (void)appleCardTransactionLimitForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Checking transaction limit for apple card user with altDSID %@", buf, 0xCu);
      }

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __71__PKAppleCardUtilities_appleCardTransactionLimitForAltDSID_completion___block_invoke;
      v10[3] = &unk_1E3E65388;
      v10[4] = self;
      v11 = v6;
      v12 = v8;
      -[PKAppleCardUtilities _fetchDataIfNecessaryWithCompletion:](self, "_fetchDataIfNecessaryWithCompletion:", v10);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
  }

}

void __71__PKAppleCardUtilities_appleCardTransactionLimitForAltDSID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_activeAccountUserWithAltDSID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (!v3)
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v15 = *(_QWORD *)(a1 + 40);
    v21 = 138412290;
    v22 = v15;
    v16 = "Cannot get transaction limit for %@ since there is no account.";
LABEL_22:
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, 0xCu);
    goto LABEL_23;
  }
  if (!v5)
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v17 = *(_QWORD *)(a1 + 40);
    v21 = 138412290;
    v22 = v17;
    v16 = "Cannot get transaction limit for %@ since there is no pass.";
    goto LABEL_22;
  }
  objc_msgSend(v4, "accountUsers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v18 = *(_QWORD *)(a1 + 40);
    v21 = 138412290;
    v22 = v18;
    v16 = "Cannot get transaction limit for %@ since there is no account users.";
    goto LABEL_22;
  }
  if (!v2)
  {
    PKLogFacilityTypeGetObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = 138412290;
      v22 = v20;
      v16 = "Cannot get transaction limit for %@ since there is no account account with that altDSID.";
      goto LABEL_22;
    }
LABEL_23:

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
    goto LABEL_24;
  }
  objc_msgSend(v2, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creditDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currencyCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "transactionSpendLimitAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "transactionSpendLimitEnabled") && v11 && v10)
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v21 = 138412546;
      v22 = v13;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Apple Card transaction limit for %@ is %@.", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 40);
      v21 = 138412290;
      v22 = v19;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Apple Card transaction limit is not enabled for %@.", (uint8_t *)&v21, 0xCu);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_24:

}

- (void)presentAppleCardUserInvitationFlowWithViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Presenting apple card add user flow with presenting view controller %@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__PKAppleCardUtilities_presentAppleCardUserInvitationFlowWithViewController_completion___block_invoke;
    v10[3] = &unk_1E3E61450;
    v10[4] = self;
    v12 = v8;
    v11 = v6;
    -[PKAppleCardUtilities _fetchDataIfNecessaryWithCompletion:](self, "_fetchDataIfNecessaryWithCompletion:", v10);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __88__PKAppleCardUtilities_presentAppleCardUserInvitationFlowWithViewController_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (!v2)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v8 = "Cannot present apple card user invite flow since there is no account.";
    goto LABEL_8;
  }
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__PKAppleCardUtilities_presentAppleCardUserInvitationFlowWithViewController_completion___block_invoke_21;
    v10[3] = &unk_1E3E61590;
    v6 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    +[PKAccountInvitationController presentCreateAccountUserInvitationWithViewController:account:accountUserCollection:familyMemberCollection:context:completion:](PKAccountInvitationController, "presentCreateAccountUserInvitationWithViewController:account:accountUserCollection:familyMemberCollection:context:completion:", v6, v2, v3, v5, 3, v10);

    goto LABEL_11;
  }
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v8 = "Cannot present apple card user invite flow since there is no pass.";
LABEL_8:
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
  }
LABEL_9:

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
LABEL_11:

}

uint64_t __88__PKAppleCardUtilities_presentAppleCardUserInvitationFlowWithViewController_completion___block_invoke_21(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)presentAppleCardSharingDetailsForAltDSID:(id)a3 viewController:(id)a4 completion:(id)a5
{
  -[PKAppleCardUtilities presentAppleCardSharingDetailsForAltDSID:viewController:hideUserDetailHeader:completion:](self, "presentAppleCardSharingDetailsForAltDSID:viewController:hideUserDetailHeader:completion:", a3, a4, 0, a5);
}

- (void)presentAppleCardSharingDetailsForAltDSID:(id)a3 viewController:(id)a4 hideUserDetailHeader:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v10 && v11)
  {
    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Presenting apple card shared user info for altDSID %@ and viewController %@", buf, 0x16u);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __112__PKAppleCardUtilities_presentAppleCardSharingDetailsForAltDSID_viewController_hideUserDetailHeader_completion___block_invoke;
    v14[3] = &unk_1E3E65F40;
    v14[4] = self;
    v15 = v10;
    v17 = v12;
    v18 = a5;
    v16 = v11;
    -[PKAppleCardUtilities _fetchDataIfNecessaryWithCompletion:](self, "_fetchDataIfNecessaryWithCompletion:", v14);

  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

void __112__PKAppleCardUtilities_presentAppleCardSharingDetailsForAltDSID_viewController_hideUserDetailHeader_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKContactAvatarManager *v10;
  id v11;
  PKContactAvatarManager *v12;
  PKAccountUserDetailViewController *v13;
  PKAccountUserDetailViewController *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_activeAccountUserWithAltDSID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  if (!v3)
  {
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v18 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v25 = v18;
    v19 = "Cannot present apple card sharing details for user %@ since there is no account.";
    goto LABEL_13;
  }
  if (!v4)
  {
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v20 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v25 = v20;
    v19 = "Cannot present apple card sharing details for user %@ since there is no pass.";
    goto LABEL_13;
  }
  if (v2)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v7 = objc_alloc(MEMORY[0x1E0D66C60]);
    objc_msgSend(*(id *)(a1 + 32), "_contactKeysToFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithContactStore:keysToFetch:", v6, v8);

    v10 = [PKContactAvatarManager alloc];
    v11 = objc_alloc_init(MEMORY[0x1E0D67100]);
    v12 = -[PKContactAvatarManager initWithContactResolver:paymentDataProvider:](v10, "initWithContactResolver:paymentDataProvider:", v9, v11);

    v13 = [PKAccountUserDetailViewController alloc];
    LOBYTE(v23) = *(_BYTE *)(a1 + 64);
    v14 = -[PKAccountUserDetailViewController initWithPaymentPass:style:account:accountUser:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:](v13, "initWithPaymentPass:style:account:accountUser:familyMemberCollection:avatarManager:contactResolver:hideUserDetailHeader:", v4, 1, v3, v2, v5, v12, v9, v23);
    objc_msgSend(*(id *)(a1 + 48), "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", v14, 1);

    v16 = *(_QWORD *)(a1 + 56);
    if (v16)
      (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, 1);

    goto LABEL_16;
  }
  PKLogFacilityTypeGetObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v25 = v21;
    v19 = "Cannot present apple card sharing details for user %@ since there is no account user.";
LABEL_13:
    _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
  }
LABEL_14:

  v22 = *(_QWORD *)(a1 + 56);
  if (v22)
    (*(void (**)(uint64_t, _QWORD))(v22 + 16))(v22, 0);
LABEL_16:

}

- (void)didUpdateFamilyMembers:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  PKFamilyMemberCollection *v6;
  PKFamilyMemberCollection *familyMemberCollection;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (PKFamilyMemberCollection *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", v5);

  familyMemberCollection = self->_familyMemberCollection;
  self->_familyMemberCollection = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)featureApplicationAdded:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSArray *sentInvitations;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sentInvitations = self->_sentInvitations;
  self->_sentInvitations = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)featureApplicationChanged:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSArray *sentInvitations;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sentInvitations = self->_sentInvitations;
  self->_sentInvitations = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)featureApplicationRemoved:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSArray *sentInvitations;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sentInvitations = self->_sentInvitations;
  self->_sentInvitations = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)accountChanged:(id)a3
{
  void *v4;
  void *v5;
  PKAccount *account;
  PKAccount *v7;
  PKAccount *v8;
  BOOL v9;
  char v10;
  PKAccount *v11;
  id v12;

  v12 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  account = v4;
  v7 = v5;
  if (account == v7)
  {

    goto LABEL_10;
  }
  v8 = v7;
  if (account)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {

LABEL_11:
    goto LABEL_12;
  }
  v10 = -[PKAccount isEqualToString:](account, "isEqualToString:", v7);

  if ((v10 & 1) != 0)
  {
LABEL_10:
    v11 = (PKAccount *)v12;
    account = self->_account;
    self->_account = v11;
    goto LABEL_11;
  }
LABEL_12:
  os_unfair_lock_unlock(&self->_lock);

}

- (void)accountRemoved:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  PKAccount *account;
  PKAccount *v9;
  PKAccount *v10;
  char v11;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  account = v6;
  v9 = v7;
  if (account == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!account || !v9)
    {

      goto LABEL_9;
    }
    v11 = -[PKAccount isEqualToString:](account, "isEqualToString:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_10;
  }
  account = self->_account;
  self->_account = 0;
LABEL_9:

LABEL_10:
  os_unfair_lock_unlock(p_lock);
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6;
  PKAccountUserCollection *userCollection;
  PKAccountUserCollection *v8;
  PKAccountUserCollection *v9;
  int v10;
  PKAccountUserCollection *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  userCollection = (PKAccountUserCollection *)(id)objc_claimAutoreleasedReturnValue();
  v8 = (PKAccountUserCollection *)v6;
  v9 = v8;
  if (userCollection == v8)
  {

  }
  else
  {
    if (!v8 || !userCollection)
    {

      goto LABEL_9;
    }
    v10 = -[PKAccountUserCollection isEqualToString:](userCollection, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_10;
  }
  v11 = (PKAccountUserCollection *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66940]), "initWithAccountUsers:", v12);
  userCollection = self->_userCollection;
  self->_userCollection = v11;
LABEL_9:

LABEL_10:
  os_unfair_lock_unlock(&self->_lock);

}

- (id)_activeAccountUserWithAltDSID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PKAccountUserCollection accountUserWithAltDSID:](self->_userCollection, "accountUserWithAltDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (v6 && (objc_msgSend(v6, "accountState"), (PKAccountStateIsTerminal() & 1) == 0))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (id)_pendingSentInvitationWithAltDSID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSArray *sentInvitations;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sentInvitations = self->_sentInvitations;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PKAppleCardUtilities__pendingSentInvitationWithAltDSID___block_invoke;
  v11[3] = &unk_1E3E65F68;
  v12 = v4;
  v7 = v4;
  -[NSArray pk_firstObjectPassingTest:](sentInvitations, "pk_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v8 && (objc_msgSend(v8, "applicationState"), (PKFeatureApplicationStateIsTerminal() & 1) == 0))
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

uint64_t __58__PKAppleCardUtilities__pendingSentInvitationWithAltDSID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "invitationDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountUserAltDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
      v9 = 0;
    else
      v9 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v9;
}

- (void)_fetchDataIfNecessaryWithCompletion:(id)a3
{
  id v4;
  id v5;
  PKAccount *v6;
  uint64_t v7;
  PKFamilyMemberCollection *v8;
  PKAccountUserCollection *v9;
  void *v10;
  NSArray *v11;
  PKPaymentPass *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  id location[2];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  objc_initWeak(location, self);
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_account;
  os_unfair_lock_unlock(&self->_lock);
  v7 = MEMORY[0x1E0C809B0];
  if (!v6)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke;
    v26[3] = &unk_1E3E65FB8;
    objc_copyWeak(&v27, location);
    v26[4] = self;
    objc_msgSend(v5, "addOperation:", v26);
    objc_destroyWeak(&v27);
  }
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_familyMemberCollection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v8)
  {
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_33;
    v24[3] = &unk_1E3E65FB8;
    objc_copyWeak(&v25, location);
    v24[4] = self;
    objc_msgSend(v5, "addOperation:", v24);
    objc_destroyWeak(&v25);
  }
  os_unfair_lock_lock(&self->_lock);
  v9 = self->_userCollection;
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_36;
    v22[3] = &unk_1E3E65FB8;
    objc_copyWeak(&v23, location);
    v22[4] = self;
    objc_msgSend(v5, "addOperation:", v22);
    objc_destroyWeak(&v23);
  }
  v10 = v4;
  os_unfair_lock_lock(&self->_lock);
  v11 = self->_sentInvitations;
  os_unfair_lock_unlock(&self->_lock);
  if (!v11)
  {
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_39;
    v20[3] = &unk_1E3E65FB8;
    objc_copyWeak(&v21, location);
    v20[4] = self;
    objc_msgSend(v5, "addOperation:", v20);
    objc_destroyWeak(&v21);
  }
  os_unfair_lock_lock(&self->_lock);
  v12 = self->_pass;
  os_unfair_lock_unlock(&self->_lock);
  if (!v12)
  {
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_42;
    v18[3] = &unk_1E3E65FB8;
    objc_copyWeak(&v19, location);
    v18[4] = self;
    objc_msgSend(v5, "addOperation:", v18);
    objc_destroyWeak(&v19);
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_47;
  v16[3] = &unk_1E3E66078;
  v14 = v10;
  v17 = v14;
  v15 = (id)objc_msgSend(v5, "evaluateWithInput:completion:", v13, v16);

  objc_destroyWeak(location);
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 16);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2;
    v11[3] = &unk_1E3E65F90;
    v11[4] = v9;
    v13 = v7;
    v12 = v6;
    objc_msgSend(v10, "defaultAccountForFeature:completion:", 2, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities acount: %@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_33(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_34;
    v11[3] = &unk_1E3E65FE0;
    v11[4] = v9;
    v13 = v7;
    v12 = v6;
    objc_msgSend(v10, "familyMembersWithCompletion:", v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_34(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities family members: %@", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_36(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 16);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_37;
    v12[3] = &unk_1E3E66008;
    v12[4] = v10;
    v14 = v7;
    v13 = v6;
    objc_msgSend(v11, "accountUsersForAccountWithIdentifier:completion:", v9, v12);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_37(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66940]), "initWithAccountUsers:", v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v4;

  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities users: %@", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_39(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_40;
    v12[3] = &unk_1E3E65FE0;
    v12[4] = v10;
    v14 = v7;
    v13 = v6;
    objc_msgSend(v11, "featureApplicationsForAccountIdentifier:completion:", v9, v12);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }

}

uint64_t __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_40(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(v4, "pk_objectsPassingTest:", &__block_literal_global_44);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v6);

  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities sentInvitations: %@", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

BOOL __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "applicationType") == 2 && objc_msgSend(v2, "feature") == 2;

  return v3;
}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_42(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "associatedPassUniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_44;
    v13[3] = &unk_1E3E66050;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v10;
    v16 = v7;
    v15 = v6;
    v12 = v10;
    objc_msgSend(v11, "paymentPassWithAssociatedAccountIdentifier:completion:", v9, v13);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_44(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  objc_storeStrong((id *)(a1[4] + 56), a2);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passWithUniqueID:", a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "paymentPass");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
    v9 = *(void **)(v8 + 56);
    *(_QWORD *)(v8 + 56) = v7;

  }
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1[4] + 56);
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "PKAppleCardUtilities pass: %@", (uint8_t *)&v12, 0xCu);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  (*(void (**)(void))(a1[7] + 16))();

}

void __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_47(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_48;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __60__PKAppleCardUtilities__fetchDataIfNecessaryWithCompletion___block_invoke_2_48(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_contactKeysToFetch
{
  void *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v3 = _MergedGlobals_658();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend((Class)off_1ED06C498(), "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend((Class)off_1ED06C4A0(), "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C966A8];
  v11[3] = v7;
  v11[4] = v8;
  v11[5] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentInvitations, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_userCollection, 0);
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end
