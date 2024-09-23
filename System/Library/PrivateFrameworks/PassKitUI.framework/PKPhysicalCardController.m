@implementation PKPhysicalCardController

- (PKPhysicalCardController)initWithAccountService:(id)a3 paymentPass:(id)a4 account:(id)a5 accountUser:(id)a6 physicalCards:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPhysicalCardController *v17;
  PKPhysicalCardController *v18;
  uint64_t v19;
  NSSet *physicalCards;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PKPhysicalCardController;
  v17 = -[PKPhysicalCardController init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_account, a5);
    objc_storeStrong((id *)&v18->_accountService, a3);
    objc_storeStrong((id *)&v18->_paymentPass, a4);
    objc_storeStrong((id *)&v18->_accountUser, a6);
    v19 = objc_msgSend(v16, "copy");
    physicalCards = v18->_physicalCards;
    v18->_physicalCards = (NSSet *)v19;

    -[PKPhysicalCardController _updatePhysicalCards](v18, "_updatePhysicalCards");
  }

  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPhysicalCardController;
  -[PKPhysicalCardController dealloc](&v4, sel_dealloc);
}

- (void)updateWithAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
  -[PKPhysicalCardController _updatePhysicalCards](self, "_updatePhysicalCards");
}

- (void)updateWithPhysicalCards:(id)a3
{
  NSSet *v4;
  NSSet *physicalCards;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  physicalCards = self->_physicalCards;
  self->_physicalCards = v4;

  -[PKPhysicalCardController _updatePhysicalCards](self, "_updatePhysicalCards");
}

- (BOOL)hasPrimaryPhysicalCard
{
  return self->_primaryPhysicalCard != 0;
}

- (BOOL)canActivatePhysicalCard
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_unactivatedPhysicalCard && -[PKAccount state](self->_account, "state") == 1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[PKPhysicalCard orderActivity](self->_unactivatedPhysicalCard, "orderActivity", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "activity") == 2)
          {

            return -[PKPhysicalCardController _userSupportsActivatingPhysicalCard](self, "_userSupportsActivatingPhysicalCard");
          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }

  }
  return 0;
}

- (BOOL)canRequestNewPhysicalCard
{
  void *v3;
  int v4;

  if (-[PKPhysicalCardController canReplacePhysicalCard](self, "canReplacePhysicalCard"))
    return 0;
  if (self->_unactivatedPhysicalCard)
    return 0;
  if (self->_primaryPhysicalCard)
    return 0;
  if (-[PKAccount state](self->_account, "state") != 1)
    return 0;
  if (-[PKAccountUser accessLevel](self->_accountUser, "accessLevel") == 2
    && (-[PKAccountUser preferences](self->_accountUser, "preferences"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "spendingEnabled"),
        v3,
        !v4))
  {
    return 0;
  }
  else
  {
    return -[PKPhysicalCardController _userSupportsRequestingPhysicalCard](self, "_userSupportsRequestingPhysicalCard");
  }
}

- (BOOL)canReplacePhysicalCard
{
  return (-[PKPhysicalCardController hasPrimaryPhysicalCard](self, "hasPrimaryPhysicalCard")
       || -[PKPhysicalCardController hasExpiredPhysicalCardOnly](self, "hasExpiredPhysicalCardOnly"))
      && !self->_unactivatedPhysicalCard
      && -[PKAccount state](self->_account, "state") == 1
      && -[PKPhysicalCard state](self->_primaryPhysicalCard, "state") != 4
      && -[PKPhysicalCardController _userSupportsRequestingPhysicalCard](self, "_userSupportsRequestingPhysicalCard");
}

- (BOOL)_userSupportsRequestingPhysicalCard
{
  PKAccountUser *accountUser;
  PKAccountUser **p_accountUser;

  p_accountUser = &self->_accountUser;
  accountUser = self->_accountUser;
  if (!accountUser || -[PKAccountUser isCurrentUser](accountUser, "isCurrentUser"))
    p_accountUser = &self->_account;
  return -[PKAccountUser supportsRequestPhysicalCard](*p_accountUser, "supportsRequestPhysicalCard");
}

- (BOOL)_userSupportsActivatingPhysicalCard
{
  PKAccountUser *accountUser;
  PKAccountUser **p_accountUser;

  p_accountUser = &self->_accountUser;
  accountUser = self->_accountUser;
  if (!accountUser || -[PKAccountUser isCurrentUser](accountUser, "isCurrentUser"))
    p_accountUser = &self->_account;
  return -[PKAccountUser supportsPhysicalCardActivation](*p_accountUser, "supportsPhysicalCardActivation");
}

- (BOOL)primaryPhysicalCardEnabled
{
  _BOOL4 v3;

  v3 = -[PKPhysicalCardController hasPrimaryPhysicalCard](self, "hasPrimaryPhysicalCard");
  if (v3)
    LOBYTE(v3) = -[PKPhysicalCard state](self->_primaryPhysicalCard, "state") == 2;
  return v3;
}

- (BOOL)physicalCardBlocked
{
  _BOOL4 v3;

  v3 = -[PKPhysicalCardController hasPrimaryPhysicalCard](self, "hasPrimaryPhysicalCard");
  if (v3)
    LOBYTE(v3) = -[PKPhysicalCard state](self->_primaryPhysicalCard, "state") == 4
              && self->_unactivatedPhysicalCard == 0;
  return v3;
}

- (BOOL)hasExpiredPhysicalCardOnly
{
  return !-[PKPhysicalCardController hasPrimaryPhysicalCard](self, "hasPrimaryPhysicalCard")
      && !self->_unactivatedPhysicalCard
      && self->_expiredPhysicalCard != 0;
}

- (NSDate)primaryPhysicalCardExpirationDate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  -[PKAccount productTimeZone](self->_account, "productTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  -[PKPhysicalCard expirationDateInCalendar:](self->_primaryPhysicalCard, "expirationDateInCalendar:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)replaceFlowViewControllerForReason:(unint64_t)a3 content:(int64_t)a4 currentPhysicalCard:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  PKOrderPhysicalCardController *v12;
  PKAccountService *accountService;
  void *v14;
  PKOrderPhysicalCardController *v15;
  PKOrderPhysicalCardController *v16;
  _QWORD v17[4];
  PKOrderPhysicalCardController *v18;
  PKPhysicalCardController *v19;
  id v20;

  v10 = a6;
  if (v10)
  {
    v11 = a5;
    v12 = [PKOrderPhysicalCardController alloc];
    accountService = self->_accountService;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKOrderPhysicalCardController initWithAccountService:paymentWebService:paymentPass:account:accountUser:orderReason:context:currentPhysicalCard:](v12, "initWithAccountService:paymentWebService:paymentPass:account:accountUser:orderReason:context:currentPhysicalCard:", accountService, v14, self->_paymentPass, self->_account, self->_accountUser, a3, a4, v11);

    -[PKOrderPhysicalCardController setParentFlowController:](v15, "setParentFlowController:", self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke;
    v17[3] = &unk_1E3E69B48;
    v18 = v15;
    v19 = self;
    v20 = v10;
    v16 = v15;
    -[PKOrderPhysicalCardController updateCustomizationOptionsWithCompletion:](v16, "updateCustomizationOptionsWithCompletion:", v17);

  }
}

void __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke_2;
  block[3] = &unk_1E3E65F40;
  v15 = a2;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v14 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke_2(uint64_t a1)
{
  PKOrderPhysicalCardAddressConfirmationViewController *v2;
  id WeakRetained;
  id v4;
  PKOrderPhysicalCardAddressConfirmationViewController *v5;
  _QWORD v6[4];
  PKOrderPhysicalCardAddressConfirmationViewController *v7;
  id v8;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = -[PKOrderPhysicalCardAddressConfirmationViewController initWithOrderPhysicalCardController:]([PKOrderPhysicalCardAddressConfirmationViewController alloc], "initWithOrderPhysicalCardController:", *(_QWORD *)(a1 + 32));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
    -[PKOrderPhysicalCardAddressConfirmationViewController setDelegate:](v2, "setDelegate:", WeakRetained);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke_3;
    v6[3] = &unk_1E3E61338;
    v4 = *(id *)(a1 + 56);
    v7 = v2;
    v8 = v4;
    v5 = v2;
    -[PKOrderPhysicalCardAddressConfirmationViewController preflightWithCompletion:](v5, "preflightWithCompletion:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __102__PKPhysicalCardController_replaceFlowViewControllerForReason_content_currentPhysicalCard_completion___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Failed to preflight: %@", (uint8_t *)&v7, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)orderFlowViewControllerForReason:(unint64_t)a3 content:(int64_t)a4 completion:(id)a5
{
  id v8;
  PKOrderPhysicalCardController *v9;
  PKAccountService *accountService;
  void *v11;
  PKOrderPhysicalCardController *v12;
  PKOrderPhysicalCardController *v13;
  _QWORD v14[4];
  PKOrderPhysicalCardController *v15;
  PKPhysicalCardController *v16;
  id v17;

  v8 = a5;
  if (v8)
  {
    v9 = [PKOrderPhysicalCardController alloc];
    accountService = self->_accountService;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKOrderPhysicalCardController initWithAccountService:paymentWebService:paymentPass:account:accountUser:orderReason:context:currentPhysicalCard:](v9, "initWithAccountService:paymentWebService:paymentPass:account:accountUser:orderReason:context:currentPhysicalCard:", accountService, v11, self->_paymentPass, self->_account, self->_accountUser, a3, a4, 0);

    -[PKOrderPhysicalCardController setParentFlowController:](v12, "setParentFlowController:", self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke;
    v14[3] = &unk_1E3E69B48;
    v15 = v12;
    v16 = self;
    v17 = v8;
    v13 = v12;
    -[PKOrderPhysicalCardController updateCustomizationOptionsWithCompletion:](v13, "updateCustomizationOptionsWithCompletion:", v14);

  }
}

void __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke_2;
  block[3] = &unk_1E3E65F40;
  v15 = a2;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v14 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke_2(uint64_t a1)
{
  PKOrderPhysicalCardViewController *v2;
  id WeakRetained;
  id v4;
  PKOrderPhysicalCardViewController *v5;
  _QWORD v6[4];
  PKOrderPhysicalCardViewController *v7;
  id v8;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = -[PKOrderPhysicalCardViewController initWithController:]([PKOrderPhysicalCardViewController alloc], "initWithController:", *(_QWORD *)(a1 + 32));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
    -[PKOrderPhysicalCardViewController setDelegate:](v2, "setDelegate:", WeakRetained);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke_3;
    v6[3] = &unk_1E3E61338;
    v4 = *(id *)(a1 + 56);
    v7 = v2;
    v8 = v4;
    v5 = v2;
    -[PKOrderPhysicalCardViewController preflightWithCompletion:](v5, "preflightWithCompletion:", v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __80__PKPhysicalCardController_orderFlowViewControllerForReason_content_completion___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Failed to preflight: %@", (uint8_t *)&v7, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)nextViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  PKSetupFlowControllerProtocol *parentFlowController;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  parentFlowController = self->_parentFlowController;
  if (parentFlowController)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__PKPhysicalCardController_nextViewControllerWithCompletion___block_invoke;
    v7[3] = &unk_1E3E6DB80;
    v7[4] = self;
    v8 = v4;
    -[PKSetupFlowControllerProtocol nextViewControllerWithCompletion:](parentFlowController, "nextViewControllerWithCompletion:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __61__PKPhysicalCardController_nextViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

}

- (void)_updatePhysicalCards
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  PKPhysicalCard *unactivatedPhysicalCard;
  id v27;
  PKPhysicalCard *primaryPhysicalCard;
  id v29;
  PKPhysicalCard *expiredPhysicalCard;
  id v31;
  uint64_t v32;
  PKPhysicalCardController *v33;
  void *v34;
  NSSet *obj;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  PKCurrentUserAltDSID();
  v3 = objc_claimAutoreleasedReturnValue();
  -[PKAccountUser altDSID](self->_accountUser, "altDSID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v37 = (void *)v3;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = (void *)v3;
  v36 = v6;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v33 = self;
  obj = self->_physicalCards;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v7)
  {
    v34 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_34;
  }
  v8 = v7;
  v34 = 0;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v39;
  v32 = *MEMORY[0x1E0C996C8];
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v39 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v13, "accountUserAltDSID", v32);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = v37;
      if (v14)
        v16 = (void *)v14;
      v17 = v16;

      if (!v17)
        goto LABEL_17;
      v18 = v17;
      v19 = v36;
      v20 = v19;
      if (v18 == v19)
      {

LABEL_17:
        v22 = objc_msgSend(v13, "state");
        if ((unint64_t)(v22 - 2) >= 3)
        {
          if (v22 == 5)
          {
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v32);
            -[PKAccount productTimeZone](v33->_account, "productTimeZone");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setTimeZone:", v24);

            if (objc_msgSend(v13, "isExpiredInCalendar:", v23))
            {
              v25 = v13;

              v34 = v25;
            }
          }
          else
          {
            if (v22 != 1)
            {
LABEL_26:
              if (v10 && v9 && v34)
              {

                goto LABEL_34;
              }
              goto LABEL_29;
            }
            v23 = v9;
            v9 = v13;
          }
        }
        else
        {
          v23 = v10;
          v10 = v13;
        }

        goto LABEL_26;
      }
      if (!v36)
      {

        goto LABEL_29;
      }
      v21 = objc_msgSend(v18, "isEqualToString:", v19);

      if (v21)
        goto LABEL_17;
LABEL_29:

    }
    v8 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v8)
      continue;
    break;
  }
LABEL_34:

  unactivatedPhysicalCard = v33->_unactivatedPhysicalCard;
  v33->_unactivatedPhysicalCard = (PKPhysicalCard *)v9;
  v27 = v9;

  primaryPhysicalCard = v33->_primaryPhysicalCard;
  v33->_primaryPhysicalCard = (PKPhysicalCard *)v10;
  v29 = v10;

  expiredPhysicalCard = v33->_expiredPhysicalCard;
  v33->_expiredPhysicalCard = (PKPhysicalCard *)v34;
  v31 = v34;

}

- (PKAccount)account
{
  return self->_account;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (PKSetupFlowControllerProtocol)parentFlowController
{
  return self->_parentFlowController;
}

- (void)setParentFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_parentFlowController, a3);
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (PKPhysicalCard)unactivatedPhysicalCard
{
  return self->_unactivatedPhysicalCard;
}

- (PKPhysicalCard)primaryPhysicalCard
{
  return self->_primaryPhysicalCard;
}

- (PKPhysicalCard)expiredPhysicalCard
{
  return self->_expiredPhysicalCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiredPhysicalCard, 0);
  objc_storeStrong((id *)&self->_primaryPhysicalCard, 0);
  objc_storeStrong((id *)&self->_unactivatedPhysicalCard, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_parentFlowController, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end
