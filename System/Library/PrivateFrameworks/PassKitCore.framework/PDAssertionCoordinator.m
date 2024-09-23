@implementation PDAssertionCoordinator

+ (id)suppressionApplicationRegistry
{
  if (qword_1EE1DB728 != -1)
    dispatch_once(&qword_1EE1DB728, &__block_literal_global_191);
  return (id)_MergedGlobals_7;
}

void __56__PDAssertionCoordinator_suppressionApplicationRegistry__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  PKApplicationRegistry *v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  PKHomeDirectoryPath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("SuppressionApplicationRegistry.archive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = -[PKApplicationRegistry initWithArchiveFileURL:]([PKApplicationRegistry alloc], "initWithArchiveFileURL:", v5);
  v4 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v3;

}

- (PDAssertionCoordinator)initWithConnection:(id)a3
{
  id v4;
  PDAssertionCoordinator *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *assertionsByType;
  NSMutableArray *v8;
  NSMutableArray *pendingAssertionRequests;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *coordinatorSerialQueue;
  PKEntitlementWhitelist *v13;
  PKEntitlementWhitelist *whitelist;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PDAssertionCoordinator;
  v5 = -[PDXPCService initWithConnection:](&v16, sel_initWithConnection_, v4);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assertionsByType = v5->_assertionsByType;
    v5->_assertionsByType = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingAssertionRequests = v5->_pendingAssertionRequests;
    v5->_pendingAssertionRequests = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.passd.assertioncoordinator", v10);
    coordinatorSerialQueue = v5->_coordinatorSerialQueue;
    v5->_coordinatorSerialQueue = (OS_dispatch_queue *)v11;

    v13 = -[PKEntitlementWhitelist initWithConnection:]([PKEntitlementWhitelist alloc], "initWithConnection:", v4);
    whitelist = v5->_whitelist;
    v5->_whitelist = v13;

    v5->_suppressionPermissionState = -1;
    v5->_isForegroundApplication = 1;

  }
  return v5;
}

- (void)acquireAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 reason:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *coordinatorSerialQueue;
  _QWORD block[4];
  id v15;
  id v16;
  PDAssertionCoordinator *v17;
  id v18;
  unint64_t v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    coordinatorSerialQueue = self->_coordinatorSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__PDAssertionCoordinator_acquireAssertionOfType_withIdentifier_reason_handler___block_invoke;
    block[3] = &unk_1E2ACA840;
    v19 = a3;
    v15 = v10;
    v16 = v11;
    v17 = self;
    v18 = v12;
    dispatch_async(coordinatorSerialQueue, block);

  }
}

void __79__PDAssertionCoordinator_acquireAssertionOfType_withIdentifier_reason_handler___block_invoke(uint64_t a1)
{
  PDAssertion *v2;

  v2 = -[PDAssertion initWithType:identifier:reason:]([PDAssertion alloc], "initWithType:identifier:reason:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_addRequestForAssertion:handler:", v2, *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "_processPendingAssertionRequests");

}

- (void)invalidateAssertionOfType:(unint64_t)a3 withIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *coordinatorSerialQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PDAssertionCoordinator_invalidateAssertionOfType_withIdentifier_handler___block_invoke;
  v13[3] = &unk_1E2ABE080;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(coordinatorSerialQueue, v13);

}

void __75__PDAssertionCoordinator_invalidateAssertionOfType_withIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier == %@"), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v9, "removeObject:", v6);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertionCoordinator:didInvalidateAssertion:", *(_QWORD *)(a1 + 32), v6);

  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

- (void)assertionOfType:(unint64_t)a3 withIdentifier:(id)a4 shouldInvalidateWhenBackgrounded:(BOOL)a5
{
  id v8;
  NSObject *coordinatorSerialQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  BOOL v14;

  v8 = a4;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__PDAssertionCoordinator_assertionOfType_withIdentifier_shouldInvalidateWhenBackgrounded___block_invoke;
  v11[3] = &unk_1E2AD8F50;
  v12 = v8;
  v13 = a3;
  v11[4] = self;
  v14 = a5;
  v10 = v8;
  dispatch_async(coordinatorSerialQueue, v11);

}

void __90__PDAssertionCoordinator_assertionOfType_withIdentifier_shouldInvalidateWhenBackgrounded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__PDAssertionCoordinator_assertionOfType_withIdentifier_shouldInvalidateWhenBackgrounded___block_invoke_2;
  v5[3] = &unk_1E2AD8F28;
  v6 = *(id *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __90__PDAssertionCoordinator_assertionOfType_withIdentifier_shouldInvalidateWhenBackgrounded___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  char v11;
  id v12;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v12 = v6;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {

    if (v7 == v9)
    {
LABEL_9:
      objc_msgSend(v12, "setInvalidateWhenBackgrounded:", *(unsigned __int8 *)(a1 + 40));
      *a4 = 1;
    }
  }
  else
  {
    v11 = objc_msgSend(v7, "isEqual:", v8);

    if ((v11 & 1) != 0)
      goto LABEL_9;
  }

}

- (void)assertionOfType:(unint64_t)a3 withIdentifier:(id)a4 isValid:(id)a5
{
  id v8;
  id v9;
  NSObject *coordinatorSerialQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__PDAssertionCoordinator_assertionOfType_withIdentifier_isValid___block_invoke;
  v13[3] = &unk_1E2ABE080;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(coordinatorSerialQueue, v13);

}

void __65__PDAssertionCoordinator_assertionOfType_withIdentifier_isValid___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1[4] + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier == %@"), a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v6 != 0);

}

- (void)hasValidAssertionOfType:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a4;
  -[PDAssertionCoordinator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertionCoordinator:assertionExistsOfType:", self, a3);

  v8[2](v8, v7);
}

- (void)_showAlertForContactlessInterfaceSuppression
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  PDLocalizedAppNameForBundleIDOrPID(self->_bundleIdentifier, -[PDXPCService remoteProcessIdentifier](self, "remoteProcessIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CONTACTLESS_INTERFACE_SUPRESSION_TITLE"), CFSTR("%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C9B800];
  v9[0] = v3;
  v5 = *MEMORY[0x1E0C9B838];
  v8[0] = v4;
  v8[1] = v5;
  PKLocalizedPaymentString(CFSTR("CONTACTLESS_INTERFACE_SUPRESSION_ACCEPT"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKUserNotificationAgent presentNotificationWithParameters:responseHandler:](PKUserNotificationAgent, "presentNotificationWithParameters:responseHandler:", v7, 0);
}

- (void)_acquireContactlessInterfaceSuppressionAssertion:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  int64_t suppressionPermissionState;
  void *v10;
  NSObject *v11;
  NSString *bundleIdentifier;
  int v13;
  NSString *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  suppressionPermissionState = self->_suppressionPermissionState;
  if (suppressionPermissionState == 1)
  {
    -[PDAssertionCoordinator _acquireAssertion:handler:](self, "_acquireAssertion:handler:", v6, v7);
  }
  else if (suppressionPermissionState)
  {
    if (suppressionPermissionState == -1)
    {
      +[PDAssertionCoordinator suppressionApplicationRegistry](PDAssertionCoordinator, "suppressionApplicationRegistry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKEntitlementWhitelist paymentAllAccess](self->_whitelist, "paymentAllAccess")
        || -[PKEntitlementWhitelist paymentPresentation](self->_whitelist, "paymentPresentation")
        || -[PKEntitlementWhitelist passPresentationSuppression](self->_whitelist, "passPresentationSuppression"))
      {
        if ((objc_msgSend(v10, "applicationIsRegisteredWithBundleIdentifier:", self->_bundleIdentifier) & 1) != 0)
        {
LABEL_10:
          self->_suppressionPermissionState = 1;
          -[PDAssertionCoordinator _acquireAssertion:handler:](self, "_acquireAssertion:handler:", v6, v8);
LABEL_17:

          goto LABEL_18;
        }
        if (objc_msgSend(v10, "registerApplicationWithBundleIdentifier:", self->_bundleIdentifier))
        {
          -[PDAssertionCoordinator _showAlertForContactlessInterfaceSuppression](self, "_showAlertForContactlessInterfaceSuppression");
          goto LABEL_10;
        }
      }
      else
      {
        PKLogFacilityTypeGetObject(0);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          bundleIdentifier = self->_bundleIdentifier;
          v13 = 138412546;
          v14 = bundleIdentifier;
          v15 = 1024;
          v16 = -[PDXPCService remoteProcessIdentifier](self, "remoteProcessIdentifier");
          _os_log_error_impl(&dword_18FC92000, v11, OS_LOG_TYPE_ERROR, "Application (%@:%d) is missing entitlement for contactless interface suppression.", (uint8_t *)&v13, 0x12u);
        }

      }
      self->_suppressionPermissionState = 0;
      v8[2](v8, 0);
      goto LABEL_17;
    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }
LABEL_18:

}

- (void)_acquireAssertion:(id)a3 handler:(id)a4
{
  void (**v6)(id, _BOOL8);
  void *v7;
  int v8;
  uint64_t v9;
  NSMutableDictionary *assertionsByType;
  void *v11;
  id v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = (void (**)(id, _BOOL8))a4;
  -[PDAssertionCoordinator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertionCoordinator:canAcquireAssertion:", self, v22);

  if (v8)
  {
    v9 = objc_msgSend(v22, "type");
    assertionsByType = self->_assertionsByType;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](assertionsByType, "objectForKeyedSubscript:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = self->_assertionsByType;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

    }
    v15 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v22, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("identifier == %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "filteredArrayUsingPredicate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19 == 0;
    if (!v19)
    {
      objc_msgSend(v12, "addObject:", v22);
      -[PDAssertionCoordinator delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "assertionCoordinator:didAcquireAssertion:", self, v22);

    }
  }
  else
  {
    v20 = 0;
  }
  v6[2](v6, v20);

}

- (void)_addRequestForAssertion:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  PDAssertionRequest *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PDAssertionRequest initWithAssertion:delegate:resultHandler:]([PDAssertionRequest alloc], "initWithAssertion:delegate:resultHandler:", v7, self, v6);

  -[NSMutableArray addObject:](self->_pendingAssertionRequests, "addObject:", v8);
}

- (void)_cancelPendingAssertionRequest:(id)a3
{
  id v4;
  NSMutableArray *pendingAssertionRequests;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  pendingAssertionRequests = self->_pendingAssertionRequests;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __57__PDAssertionCoordinator__cancelPendingAssertionRequest___block_invoke;
  v10 = &unk_1E2AD8F78;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](pendingAssertionRequests, "enumerateObjectsUsingBlock:", &v7);
  if (v14[3] != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_pendingAssertionRequests, "removeObjectAtIndex:", v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

void __57__PDAssertionCoordinator__cancelPendingAssertionRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void (**v5)(_QWORD, _QWORD);
  id v6;

  if (*(void **)(a1 + 32) == a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    objc_msgSend(a2, "resultHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      v5[2](v5, 0);
      v5 = (void (**)(_QWORD, _QWORD))v6;
    }
    *a4 = 1;

  }
}

- (void)_processPendingAssertionRequests
{
  id v3;
  _QWORD v4[5];

  v3 = (id)-[NSMutableArray copy](self->_pendingAssertionRequests, "copy");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PDAssertionCoordinator__processPendingAssertionRequests__block_invoke;
  v4[3] = &unk_1E2AD8FA0;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

void __58__PDAssertionCoordinator__processPendingAssertionRequests__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  _BYTE *v7;
  BOOL v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");
  objc_msgSend(v9, "resultHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "passPresentationSuppressionFromBackground");
  v7 = *(_BYTE **)(a1 + 32);
  if (v7[88])
    goto LABEL_8;
  if (v4)
    v8 = v4 == 5;
  else
    v8 = 1;
  if (!v8)
    v6 = 1;
  if (v6 == 1)
  {
LABEL_8:
    if (v4 == 5)
      objc_msgSend(v7, "_acquireContactlessInterfaceSuppressionAssertion:handler:", v3, v5);
    else
      objc_msgSend(v7, "_acquireAssertion:handler:", v3, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", v9);
  }

}

- (void)assertionRequestDidTimeout:(id)a3
{
  id v4;
  NSObject *coordinatorSerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PDAssertionCoordinator_assertionRequestDidTimeout___block_invoke;
  v7[3] = &unk_1E2ABE0D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(coordinatorSerialQueue, v7);

}

uint64_t __53__PDAssertionCoordinator_assertionRequestDidTimeout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelPendingAssertionRequest:", *(_QWORD *)(a1 + 40));
}

- (void)invalidateAllAssertions
{
  NSObject *coordinatorSerialQueue;
  _QWORD block[5];

  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_sync(coordinatorSerialQueue, block);
}

void __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)MEMORY[0x19400CFE8]();
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke_2;
  v6[3] = &unk_1E2AD8FF0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  objc_autoreleasePoolPop(v2);
}

void __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke_3;
  v5[3] = &unk_1E2AD8FC8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5);

}

void __49__PDAssertionCoordinator_invalidateAllAssertions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertionCoordinator:didInvalidateAssertion:", *(_QWORD *)(a1 + 32), v4);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
}

- (void)invalidateAssertionsForBackgroundApplicationState
{
  NSObject *coordinatorSerialQueue;
  _QWORD block[5];

  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(coordinatorSerialQueue, block);
}

void __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke_2;
  v5[3] = &unk_1E2AD8FF0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v3 = v2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke_3;
  v13[3] = &unk_1E2AD9018;
  v9 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v12 = v8;
  v15 = v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);

  v10 = objc_msgSend(v12, "count");
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v10)
    objc_msgSend(v11, "setObject:forKey:", v12, v7);
  else
    objc_msgSend(v11, "removeObjectForKey:", v7);

}

void __75__PDAssertionCoordinator_invalidateAssertionsForBackgroundApplicationState__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "invalidateWhenBackgrounded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertionCoordinator:didInvalidateAssertion:", *(_QWORD *)(a1 + 32), v6);

    v4 = *(void **)(a1 + 40);
    objc_msgSend(v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  }

}

- (id)assertionsOfType:(unint64_t)a3
{
  NSObject *coordinatorSerialQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__71;
  v11 = __Block_byref_object_dispose__71;
  v12 = 0;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PDAssertionCoordinator_assertionsOfType___block_invoke;
  block[3] = &unk_1E2AD9040;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(coordinatorSerialQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __43__PDAssertionCoordinator_assertionsOfType___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1[4] + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)hasAssertionsOfType:(unint64_t)a3
{
  NSObject *coordinatorSerialQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PDAssertionCoordinator_hasAssertionsOfType___block_invoke;
  block[3] = &unk_1E2AD9040;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(coordinatorSerialQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __46__PDAssertionCoordinator_hasAssertionsOfType___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1[4] + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "count") != 0;

}

- (void)processPendingAssertionRequests
{
  NSObject *coordinatorSerialQueue;
  _QWORD block[5];

  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PDAssertionCoordinator_processPendingAssertionRequests__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(coordinatorSerialQueue, block);
}

uint64_t __57__PDAssertionCoordinator_processPendingAssertionRequests__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPendingAssertionRequests");
}

- (void)cancelPendingAssertionRequests
{
  NSObject *coordinatorSerialQueue;
  _QWORD block[5];

  coordinatorSerialQueue = self->_coordinatorSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PDAssertionCoordinator_cancelPendingAssertionRequests__block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(coordinatorSerialQueue, block);
}

void __56__PDAssertionCoordinator_cancelPendingAssertionRequests__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_64);

}

void __56__PDAssertionCoordinator_cancelPendingAssertionRequests__block_invoke_2(uint64_t a1, void *a2)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  objc_msgSend(a2, "resultHandler");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, 0);
    v2 = (void (**)(_QWORD, _QWORD))v3;
  }

}

- (NSString)description
{
  id v3;
  const __CFString *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("bundle: %@, "), self->_bundleIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("pid: %d, "), -[PDXPCService remoteProcessIdentifier](self, "remoteProcessIdentifier"));
  if (self->_isForegroundApplication)
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("isForegroundApplication: %@>"), v4);
  v5 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v5;
}

- (PDAssertionCoordinatorDelegate)delegate
{
  return (PDAssertionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (BOOL)isForegroundApplication
{
  return self->_isForegroundApplication;
}

- (void)setIsForegroundApplication:(BOOL)a3
{
  self->_isForegroundApplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingAssertionRequests, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_coordinatorSerialQueue, 0);
  objc_storeStrong((id *)&self->_assertionsByType, 0);
}

@end
