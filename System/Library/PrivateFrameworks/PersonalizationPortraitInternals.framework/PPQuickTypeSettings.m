@implementation PPQuickTypeSettings

+ (BOOL)servantShouldRespondToQuery:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  char v8;
  id *v9;
  void *v10;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPQuickTypeSettings.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("servant"));

  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v9 = (id *)MEMORY[0x1E0D70DD0];
LABEL_12:
    v7 = *v9;
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "bundleIdentifierIsEnabledForDonation:", v7);

    goto LABEL_13;
  }
  if (v6 == objc_opt_class())
  {
    v9 = (id *)MEMORY[0x1E0D70DC0];
    goto LABEL_12;
  }
  if (v6 == objc_opt_class())
  {
    v9 = (id *)MEMORY[0x1E0D70E20];
    goto LABEL_12;
  }
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_fault_impl(&dword_1C392E000, v7, OS_LOG_TYPE_FAULT, "unknown servant passed to servantShouldRespondToQuery: %@", buf, 0xCu);
  }
  v8 = 0;
LABEL_13:

  return v8;
}

@end
