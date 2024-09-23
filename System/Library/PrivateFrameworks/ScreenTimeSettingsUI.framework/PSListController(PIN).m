@implementation PSListController(PIN)

+ (id)st_sharedPINSpecifier
{
  if (st_sharedPINSpecifier_oneTime != -1)
    dispatch_once(&st_sharedPINSpecifier_oneTime, &__block_literal_global_14);
  return (id)st_sharedPINSpecifier_specifier;
}

- (uint64_t)st_shouldShowPINSheetForPINSpecifier
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE75530], "st_sharedPINSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "st_shouldShowPINSheetForSpecifier:", v2);

  return v3;
}

- (BOOL)st_shouldShowPINSheetForSpecifier:()PIN
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  _BOOL8 v16;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75C60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", 0x24DB91010);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", 0x24DB91030);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(a1, "coordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = (v13 & 1) == 0
       && (!v11
        || objc_msgSend(v14, "isPasscodeEnabled")
        && (objc_msgSend(v15, "hasAlreadyEnteredPINForSession") & 1) == 0);

  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

- (void)st_showPINSheetWithCompletion:()PIN
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BE75530];
  v5 = a3;
  objc_msgSend(v4, "st_sharedPINSpecifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "st_showPINSheet:completion:", v6, v5);

}

- (void)st_showPINSheet:()PIN completion:
{
  void *v6;
  id v7;

  v7 = a3;
  if (a4)
  {
    v6 = _Block_copy(a4);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, 0x24DB90C10);

  }
  objc_msgSend(a1, "showPINSheet:", v7);

}

- (uint64_t)st_validatePIN:()PIN forPINController:
{
  id v6;
  id v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", 0x24DB90BF0);
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = ((uint64_t (**)(_QWORD, id, id))v9)[2](v9, v7, v6);
  }
  else
  {
    objc_msgSend(a1, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "validatePIN:", v6);

  }
  return v10;
}

- (void)st_didAcceptEnteredPIN:()PIN
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75C60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(a1, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHasAlreadyEnteredPINForSession:", 1);

  }
}

- (void)st_didCancelEnteringPIN
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(a1, "setShowingSetupController:", 0);
  objc_msgSend(a1, "setPendingURLResourceDictionary:", 0);
  objc_msgSend(a1, "setSpecifierIDPendingPush:", 0);
  objc_msgSend(a1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", 0x24DB91050);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)st_didAcceptRemovePIN
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, val);
  objc_msgSend(val, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__PSListController_PIN__st_didAcceptRemovePIN__block_invoke;
  v3[3] = &unk_24DB87950;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "setPIN:recoveryAltDSID:completionHandler:", 0, 0, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)st_devicePINController:()PIN didAcceptSetPIN:
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  void *v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", 0x24DB90BB0);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    v10 = objc_initWeak(&location, a1);
    objc_msgSend(a1, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPIN:completionHandler:", v7, &__block_literal_global_7);

    objc_destroyWeak(&location);
  }

}

- (void)st_devicePINController:()PIN didAcceptChangedPIN:
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", 0x24DB90BD0);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    v10 = objc_initWeak(&location, a1);
    objc_msgSend(a1, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__PSListController_PIN__st_devicePINController_didAcceptChangedPIN___block_invoke;
    v12[3] = &unk_24DB87950;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v11, "setPIN:completionHandler:", v7, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (void)st_devicePINControllerDidDismissPINPane:()PIN
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(a1, "setShowingSetupController:", 0);
  objc_msgSend(v4, "specifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "success");

  if ((_DWORD)v5)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE75E18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");

    if (v7 == 3)
    {
      if ((objc_msgSend(a1, "handlePendingURL") & 1) == 0)
      {
        if (objc_msgSend(v10, "controllerLoadAction"))
          objc_msgSend(v10, "performControllerLoadAction");
        if (objc_msgSend(v10, "buttonAction"))
          objc_msgSend(v10, "performButtonAction");
      }
    }
    else if (!v7 && objc_msgSend(v10, "controllerLoadAction"))
    {
      objc_msgSend(v10, "performControllerLoadAction");
    }
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", 0x24DB90C10);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v5);
    objc_msgSend(v10, "removePropertyForKey:", 0x24DB90C10);
  }

}

@end
