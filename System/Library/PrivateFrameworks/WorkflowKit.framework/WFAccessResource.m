@implementation WFAccessResource

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)WFAccessResource;
  -[WFResource dealloc](&v3, sel_dealloc);
}

- (WFAccessResource)initWithDefinition:(id)a3
{
  return -[WFAccessResource initWithDefinition:enableDistributedNotifications:](self, "initWithDefinition:enableDistributedNotifications:", a3, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workflow);
}

- (NSString)resourceName
{
  return 0;
}

- (NSString)username
{
  return 0;
}

- (BOOL)canLogOut
{
  return 0;
}

- (BOOL)logOutAffectsOtherApps
{
  return 1;
}

- (BOOL)supportsMultipleAccounts
{
  return 0;
}

- (WFAccessResource)initWithDefinition:(id)a3 enableDistributedNotifications:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  WFAccessResource *v7;
  WFAccessResource *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  id v15;
  WFAccessResource *v16;
  _QWORD handler[4];
  id v19;
  id location;
  objc_super v21;
  _QWORD v22[3];

  v4 = a4;
  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFAccessResource;
  v7 = -[WFResource initWithDefinition:](&v21, sel_initWithDefinition_, v6);
  v8 = v7;
  if (v7)
  {
    v7->_token = -1;
    if (v4)
    {
      objc_initWeak(&location, v7);
      v22[0] = CFSTR("WFAccessResourceAvailabilityChangedNotification");
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_retainAutorelease(v12);
      v14 = (const char *)objc_msgSend(v13, "UTF8String");
      v15 = MEMORY[0x1E0C80D38];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __70__WFAccessResource_initWithDefinition_enableDistributedNotifications___block_invoke;
      handler[3] = &unk_1E7AF5AF8;
      objc_copyWeak(&v19, &location);
      notify_register_dispatch(v14, &v8->_token, MEMORY[0x1E0C80D38], handler);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    v16 = v8;
  }

  return v8;
}

- (NSString)associatedAppIdentifier
{
  return 0;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFAccessResource associatedAppIdentifier](self, "associatedAppIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAccessResource associatedAppIdentifier](self, "associatedAppIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (WFImage)icon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFAccessResource associatedAppIdentifier](self, "associatedAppIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAccessResource associatedAppIdentifier](self, "associatedAppIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (WFImage *)v7;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  return 0;
}

- (id)localizedProtectedResourceDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  +[WFActionLocalizationContext defaultContext](WFActionLocalizationContext, "defaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAccessResource localizedProtectedResourceDescriptionWithContext:](self, "localizedProtectedResourceDescriptionWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[WFAccessResource name](self, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)setWorkflow:(id)a3
{
  objc_storeWeak((id *)&self->_workflow, a3);
  -[WFResource invalidateAvailability](self, "invalidateAvailability");
}

- (void)refreshAvailabilityWithNotification:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void (**v8)(_QWORD);
  _QWORD aBlock[5];
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  objc_super v21;
  _QWORD block[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v3 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__51624;
  v27 = __Block_byref_object_dispose__51625;
  v28 = 0;
  -[WFResource stateAccessQueue](self, "stateAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke;
  block[3] = &unk_1E7AF5B20;
  block[4] = self;
  block[5] = &v29;
  block[6] = &v23;
  dispatch_sync(v5, block);

  v21.receiver = self;
  v21.super_class = (Class)WFAccessResource;
  -[WFResource refreshAvailabilityWithNotification:](&v21, sel_refreshAvailabilityWithNotification_, v3);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__51624;
  v15 = __Block_byref_object_dispose__51625;
  v16 = 0;
  -[WFResource stateAccessQueue](self, "stateAccessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke_2;
  v10[3] = &unk_1E7AF5B20;
  v10[4] = self;
  v10[5] = &v17;
  v10[6] = &v11;
  dispatch_sync(v7, v10);

  if (*((unsigned __int8 *)v18 + 24) != *((unsigned __int8 *)v30 + 24)
    || (objc_msgSend((id)v12[5], "isEqual:", v24[5]) & 1) == 0 && v12[5] != v24[5])
  {
    aBlock[0] = v6;
    aBlock[1] = 3221225472;
    aBlock[2] = __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke_3;
    aBlock[3] = &unk_1E7AF94B0;
    aBlock[4] = self;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v8[2](v8);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
}

- (void)refreshAvailability
{
  id v3;

  if (-[WFAccessResource status](self, "status") == 4)
  {
    -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", 1, 0);
  }
  else
  {
    -[WFAccessResource availabilityError](self, "availabilityError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", 0, v3);

  }
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "userInterfaceXPCInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "userInterfaceClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 && objc_msgSend(v9, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
    v13[3] = &unk_1E7AF5B70;
    v15 = v7;
    v13[4] = self;
    v14 = v6;
    objc_msgSend(v14, "requestActionInterfacePresentationForActionClassName:classNamesByType:completionHandler:", v12, v10, v13);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

- (void)makeAvailableWithRemoteInterface:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  objc_msgSend(v5, "wfUnsupportedUserInterfaceError");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v6, 0, v7);

}

- (unint64_t)status
{
  return 0;
}

- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v9 = -[WFAccessResource status](self, "status");
  if (v9 == 1)
  {
    -[WFAccessResource makeAvailableWithUserInterface:completionHandler:](self, "makeAvailableWithUserInterface:completionHandler:", v7, v8);
  }
  else if (v9 == 3)
  {
    v8[2](v8, 1, 0);
    v10 = (void *)MEMORY[0x1E0C99E98];
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("app-prefs:%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__WFAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke;
    v17[3] = &unk_1E7AF5B98;
    v17[4] = self;
    v18 = v7;
    objc_msgSend(v16, "openURL:userInterface:completionHandler:", v15, v18, v17);

  }
  else
  {
    v8[2](v8, 0, 0);
  }

}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  -[WFAccessResource localizedProtectedResourceDescription](self, "localizedProtectedResourceDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = CFSTR("Device restrictions prevent Shortcuts from accessing %@.");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    if (a3)
      v6 = CFSTR("Shortcuts does not have access to %@.");
    else
      v6 = CFSTR("Access to %@ is not supported on this device.");
  }
  WFLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  -[WFAccessResource localizedProtectedResourceDescription](self, "localizedProtectedResourceDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = CFSTR("Device restrictions prevent this shortcut from accessing %@.");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    if (a3)
      v6 = CFSTR("In order to answer this question, Shortcuts needs access to %@.");
    else
      v6 = CFSTR("This shortcut requires access to %@, which is not supported on this device.");
  }
  WFLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    return 0;
  if (a3 == 3)
    v3 = CFSTR("Update Privacy Settings");
  else
    v3 = CFSTR("Allow Access");
  WFLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSError)availabilityError
{
  unint64_t v3;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = -[WFAccessResource status](self, "status");
  if (v3 == 4)
    return (NSError *)0;
  v5 = v3;
  v12 = *MEMORY[0x1E0D142B8];
  v13[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[WFAccessResource localizedErrorReasonForStatus:](self, "localizedErrorReasonForStatus:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAccessResource localizedImportErrorReasonForStatus:](self, "localizedImportErrorReasonForStatus:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAccessResource localizedErrorRecoveryOptionsForStatus:](self, "localizedErrorRecoveryOptionsForStatus:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x1E0CB2D68]);
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("WFResourceErrorImportErrorReason"));
  if (v10)
    objc_msgSend(v7, "setObject:forKey:", v10, *MEMORY[0x1E0CB2D78]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ResourceErrorDomain"), 0, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v11;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 userInterface:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v14, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("ResourceErrorDomain")))
  {
    v13 = objc_msgSend(v14, "code");

    if (!v13)
    {
      -[WFAccessResource attemptRecoveryFromErrorWithOptionIndex:userInterface:completionHandler:](self, "attemptRecoveryFromErrorWithOptionIndex:userInterface:completionHandler:", a4, v10, v11);
      goto LABEL_7;
    }
  }
  else
  {

  }
  if (v11)
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
LABEL_7:

}

- (NSString)localizedAttemptRecoveryFromErrorMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Please open Settings > Privacy & Security and grant Shortcuts access to %@."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAccessResource localizedProtectedResourceDescription](self, "localizedProtectedResourceDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (WFWorkflow)workflow
{
  return (WFWorkflow *)objc_loadWeakRetained((id *)&self->_workflow);
}

- (int)token
{
  return self->_token;
}

void __92__WFAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((a2 & 1) == 0)
  {
    v6 = (id)objc_opt_new();
    WFLocalizedString(CFSTR("Update Privacy Settings"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v3);

    objc_msgSend(*(id *)(a1 + 32), "localizedAttemptRecoveryFromErrorMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMessage:", v4);

    objc_msgSend(MEMORY[0x1E0D13DE8], "okButtonWithHandler:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addButton:", v5);

    objc_msgSend(*(id *)(a1 + 40), "presentAlert:", v6);
  }
}

void __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  if (a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
    v5[3] = &unk_1E7AF8548;
    v4 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "makeAvailableWithRemoteInterface:completionHandler:", a2, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_3;
  v9[3] = &unk_1E7AF5B48;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "dismissPresentedContentWithCompletionHandler:", v9);

}

uint64_t __69__WFAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isAvailable");
  objc_msgSend(*(id *)(a1 + 32), "_availabilityError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isAvailable");
  objc_msgSend(*(id *)(a1 + 32), "_availabilityError");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__WFAccessResource_refreshAvailabilityWithNotification___block_invoke_3()
{
  objc_class *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("WFAccessResourceAvailabilityChangedNotification");
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_retainAutorelease(v3);
  notify_post((const char *)objc_msgSend(v4, "UTF8String"));

}

void __70__WFAccessResource_initWithDefinition_enableDistributedNotifications___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshAvailabilityWithNotification");

}

+ (BOOL)isSystemResource
{
  return 0;
}

+ (id)userInterfaceProtocol
{
  return 0;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "userInterfaceProtocol");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)userInterfaceClasses
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
