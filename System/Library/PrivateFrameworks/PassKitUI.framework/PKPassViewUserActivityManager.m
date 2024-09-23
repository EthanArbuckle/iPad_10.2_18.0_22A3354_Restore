@implementation PKPassViewUserActivityManager

+ (id)sharedInstance
{
  if (_MergedGlobals_676 != -1)
    dispatch_once(&_MergedGlobals_676, &__block_literal_global_104);
  return (id)qword_1ED06C740;
}

void __47__PKPassViewUserActivityManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PKPassViewUserActivityManager _init]([PKPassViewUserActivityManager alloc], "_init");
  v1 = (void *)qword_1ED06C740;
  qword_1ED06C740 = (uint64_t)v0;

}

- (PKPassViewUserActivityManager)init
{

  return 0;
}

- (id)_init
{
  PKPassViewUserActivityManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassViewUserActivityManager;
  v2 = -[PKPassViewUserActivityManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.passkit.passviewuseractivitymanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "registerObserver:", v2);

    v2->_isForegroundActive = BYTE1(v6) & 1;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PKUIForegroundActiveArbiter sharedInstance](PKUIForegroundActiveArbiter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKPassViewUserActivityManager;
  -[PKPassViewUserActivityManager dealloc](&v4, sel_dealloc);
}

- (void)startedViewingPass:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (PKRunningInRemoteContext() & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke;
    block[3] = &unk_1E3E61400;
    block[4] = self;
    v8 = v5;
    v9 = v4;
    dispatch_async(queue, block);

  }
}

void __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "PKPassViewUserActivityManager: startedViewingPass - %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_currentUserActivityPassUniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v4) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_endedViewingPass");
    v5 = *(_QWORD **)(a1 + 32);
    if (!v5[1])
    {
      if (objc_msgSend(v5, "_shouldDonateActivity:", *(_QWORD *)(a1 + 48)))
      {
        v6 = objc_alloc(MEMORY[0x1E0CA5920]);
        v7 = (void *)objc_msgSend(v6, "initWithActivityType:", *MEMORY[0x1E0D6BC68]);
        objc_msgSend(*(id *)(a1 + 32), "_displayNameForPass:", *(_QWORD *)(a1 + 48));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_passViewTemplateNameForPass:", *(_QWORD *)(a1 + 48));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKCoreLocalizedString(CFSTR("PASS_VIEW_USER_ACTIVITY_TITLE"), CFSTR("%@%@"), v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTitle:", v10);

        objc_msgSend(v7, "setEligibleForSearch:", 1);
        objc_msgSend(v7, "setEligibleForHandoff:", 0);
        v11 = *(_QWORD *)(a1 + 40);
        v18 = *MEMORY[0x1E0D6BC60];
        v19 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setUserInfo:", v12);

        objc_msgSend(v7, "setEligibleForPrediction:", 1);
        v13 = (void *)MEMORY[0x1E0D66C80];
        v14 = *(_QWORD *)(a1 + 48);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke_19;
        v16[3] = &unk_1E3E6D5F0;
        v16[4] = *(_QWORD *)(a1 + 32);
        v17 = v7;
        v15 = v7;
        objc_msgSend(v13, "searchableItemForPass:completion:", v14, v16);

      }
    }

  }
}

void __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke_2;
  block[3] = &unk_1E3E61400;
  v10 = v3;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  dispatch_async(v5, block);

}

void __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "attributeSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRelatedUniqueIdentifier:", v2);

  objc_msgSend(*(id *)(a1 + 40), "setContentAttributeSet:", v3);
  objc_msgSend(*(id *)(a1 + 40), "becomeCurrent");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 8), *(id *)(a1 + 40));

}

- (void)endedViewingPass
{
  NSObject *queue;
  _QWORD block[5];

  if ((PKRunningInRemoteContext() & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PKPassViewUserActivityManager_endedViewingPass__block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __49__PKPassViewUserActivityManager_endedViewingPass__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endedViewingPass");
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  NSObject *queue;
  _QWORD v5[5];
  $96EE1C12479E9B303E9C2794B92A11A2 v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__PKPassViewUserActivityManager_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke;
  v5[3] = &unk_1E3E64930;
  v5[4] = self;
  v6 = a4;
  dispatch_async(queue, v5);
}

uint64_t __88__PKPassViewUserActivityManager_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = *(_BYTE *)(result + 41);
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_endedViewingPass");
  return result;
}

- (void)_endedViewingPass
{
  NSObject *v3;
  void *v4;
  NSUserActivity *currentUserActivity;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_currentUserActivity)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPassViewUserActivityManager _currentUserActivityPassUniqueID](self, "_currentUserActivityPassUniqueID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "PKPassViewUserActivityManager: endedViewingPass - %@", (uint8_t *)&v6, 0xCu);

    }
    -[NSUserActivity resignCurrent](self->_currentUserActivity, "resignCurrent");
    currentUserActivity = self->_currentUserActivity;
    self->_currentUserActivity = 0;

  }
}

- (id)_currentUserActivityPassUniqueID
{
  NSUserActivity *currentUserActivity;
  void *v3;
  void *v4;

  currentUserActivity = self->_currentUserActivity;
  if (currentUserActivity)
  {
    -[NSUserActivity userInfo](currentUserActivity, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D6BC60]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_shouldDonateActivity:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[PKPassViewUserActivityManager _displayNameForPass:](self, "_displayNameForPass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v4, "style");
    if (v6 <= 7)
      LODWORD(v5) = (0xE2u >> v6) & 1;
    else
      LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (id)_displayNameForPass:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "notificationCenterTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !objc_msgSend(v5, "length"))
  {

    v5 = 0;
  }
  return v5;
}

- (id)_passViewTemplateNameForPass:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "style") - 2;
    v6 = CFSTR("PASS_VIEW_USER_ACTIVITY_TEMPLATE_NAME_NON_PAYMENT_BOARDING_PASS");
    switch(v5)
    {
      case 0:
      case 7:
        v6 = CFSTR("PASS_VIEW_USER_ACTIVITY_TEMPLATE_NAME_NON_PAYMENT_TICKET");
        goto LABEL_10;
      case 2:
        goto LABEL_10;
      case 4:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "isAppleCardPass") & 1) != 0)
        {
          v7 = &stru_1E3E7D690;
        }
        else
        {
          v6 = CFSTR("PASS_VIEW_USER_ACTIVITY_TEMPLATE_NAME_PAYMENT_PASS");
LABEL_10:
          PKCoreLocalizedString(&v6->isa);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
      default:
        v6 = CFSTR("PASS_VIEW_USER_ACTIVITY_TEMPLATE_NAME_NON_PAYMENT_PASS");
        goto LABEL_10;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentUserActivity, 0);
}

@end
