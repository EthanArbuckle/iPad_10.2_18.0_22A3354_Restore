@implementation UISunScheduleController

void __61___UISunScheduleController__setNextEventTimerToAbsoluteTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _UIUserInterfaceStyleArbiterLogger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    formatAbsoluteTime(*(CFAbsoluteTime *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "SunScheduleController: Timer fired for: %@", (uint8_t *)&v5, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateStatusWithAbsoluteTime:", *(double *)(a1 + 40));

}

@end
