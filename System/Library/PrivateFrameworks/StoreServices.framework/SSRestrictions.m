@implementation SSRestrictions

+ (void)shouldDisplayExplicitRestrictionAlertOfType:(int64_t)a3 completionBlock:(id)a4
{
  void *v7;
  NSObject *global_queue;
  _QWORD block[7];

  v7 = (void *)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  if (objc_msgSend(v7, "effectiveRestrictedBoolValueForSetting:", *MEMORY[0x1E0D46FF8]) == 2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__SSRestrictions_shouldDisplayExplicitRestrictionAlertOfType_completionBlock___block_invoke;
    block[3] = &unk_1E47BB5D8;
    block[5] = a4;
    block[6] = a3;
    block[4] = a1;
    dispatch_async(global_queue, block);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  }
}

+ (id)setOfActiveRestrictionUUIDs
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if (objc_msgSend(a1, "_isExplicitContentDisallowedInCurrentStoreFront"))
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.itunesstored.ExplicitPreferenceRestriction"));
  return v3;
}

+ (void)isExplicitContentRestrictedByDefaultInCurrentStoreFront:(id)a3
{
  SSURLBag *v4;
  _QWORD v5[5];

  v4 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__SSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke;
  v5[3] = &unk_1E47BB5B0;
  v5[4] = a3;
  -[SSURLBag loadValueForKey:completionBlock:](v4, "loadValueForKey:completionBlock:", CFSTR("ExplicitOffAndPreferencesEnabled"), v5);
}

uint64_t __74__SSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a2, "BOOLValue");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)isExplicitContentDisallowedInCurrentStoreFront:(id)a3
{
  SSURLBag *v4;
  _QWORD v5[5];

  v4 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__SSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke;
  v5[3] = &unk_1E47BB5B0;
  v5[4] = a3;
  -[SSURLBag loadValueForKey:completionBlock:](v4, "loadValueForKey:completionBlock:", CFSTR("ExplicitOffAndPreferencesDisabled"), v5);
}

uint64_t __65__SSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a2, "BOOLValue");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isActiveAccountAllowedToUpdateRestrictions
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  if ((objc_msgSend(v2, "isSettingLockedDownByRestrictions:", *MEMORY[0x1E0D46FF8]) & 1) != 0)
    return 0;
  else
    return objc_msgSend(MEMORY[0x1E0CFDA50], "isRunningInStoreDemoMode") ^ 1;
}

+ (void)isRestrictionsPasscodeSet:(id)a3
{
  NSObject *global_queue;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SSRestrictions_isRestrictionsPasscodeSet___block_invoke;
  v6[3] = &unk_1E47B8EB8;
  v6[4] = a1;
  v6[5] = a3;
  dispatch_async(global_queue, v6);
}

uint64_t __44__SSRestrictions_isRestrictionsPasscodeSet___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_calculateIsRestrictionsPasscodeSet"), 0);
}

+ (void)setAllowExplicitContent
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  objc_msgSend(v2, "setBoolValue:forSetting:", 1, *MEMORY[0x1E0D46FF8]);
}

uint64_t __78__SSRestrictions_shouldDisplayExplicitRestrictionAlertOfType_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v6;
  _BOOL4 v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "_isExplicitContentDisallowedInCurrentStoreFront") & 1) == 0)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = __UserDefaultsKeyForExplicitRestrictionAlertType(*(_QWORD *)(a1 + 48));
    v4 = v3;
    switch(*(_QWORD *)(a1 + 48))
    {
      case 0:
        v6 = +[SSRestrictions isActiveAccountAllowedToUpdateRestrictions](SSRestrictions, "isActiveAccountAllowedToUpdateRestrictions");
        if (v4)
          v7 = v6;
        else
          v7 = 0;
        if (v7 && objc_msgSend(v2, "integerForKey:", v4) <= 0)
          goto LABEL_13;
        break;
      case 1:
        if (v3 && objc_msgSend(v2, "integerForKey:", v3) <= 2)
        {
LABEL_13:
          if ((objc_msgSend(*(id *)(a1 + 32), "_calculateIsRestrictionsPasscodeSet") & 1) == 0)
            objc_msgSend(*(id *)(a1 + 32), "_isExplicitContentRestrictedByDefaultInCurrentStoreFront");
        }
        break;
      default:
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)didDisplayExplicitRestrictionAlertOfType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = __UserDefaultsKeyForExplicitRestrictionAlertType(a3);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v5, "integerForKey:", v4) + 1, v4);
  }
}

+ (BOOL)_calculateIsRestrictionsPasscodeSet
{
  uint64_t v2;

  v2 = SSVPreferencesFramework();
  return objc_msgSend(SSVWeakLinkedClassForString(CFSTR("PSRestrictionsPasscodeController"), v2), "settingEnabled");
}

+ (BOOL)_isExplicitContentRestrictedByDefaultInCurrentStoreFront
{
  SSURLBag *v2;
  id v3;

  v2 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0));
  v3 = -[SSURLBag valueForKey:error:](v2, "valueForKey:error:", CFSTR("ExplicitOffAndPreferencesEnabled"), 0);
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      LOBYTE(v3) = objc_msgSend(v3, "BOOLValue");
    else
      LOBYTE(v3) = 0;
  }

  return (char)v3;
}

+ (BOOL)_isExplicitContentDisallowedInCurrentStoreFront
{
  SSURLBag *v2;
  id v3;

  v2 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0));
  v3 = -[SSURLBag valueForKey:error:](v2, "valueForKey:error:", CFSTR("ExplicitOffAndPreferencesDisabled"), 0);
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      LOBYTE(v3) = objc_msgSend(v3, "BOOLValue");
    else
      LOBYTE(v3) = 0;
  }

  return (char)v3;
}

@end
