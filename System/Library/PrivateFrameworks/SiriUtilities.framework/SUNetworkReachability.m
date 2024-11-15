@implementation SUNetworkReachability

- (SUNetworkReachability)init
{
  SUNetworkReachability *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  os_log_t v6;
  OS_os_log *logger;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUNetworkReachability;
  v2 = -[SUNetworkReachability init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("NetworkReachability", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = os_log_create("com.apple.siri.sirikit", "Utilities");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v6;

  }
  return v2;
}

- (unint64_t)reachabilityState
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SUNetworkReachability_reachabilityState__block_invoke;
  v5[3] = &unk_1E7CD5E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__SUNetworkReachability_reachabilityState__block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (nwi_state_copy())
  {
    if (nwi_state_get_first_ifstate() && (nwi_ifstate_get_flags() & 4) != 0)
    {
      LODWORD(v2) = 1;
    }
    else if (nwi_state_get_first_ifstate())
    {
      v2 = ((unint64_t)nwi_ifstate_get_flags() >> 2) & 1;
    }
    else
    {
      LODWORD(v2) = 0;
    }
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if ((_DWORD)v2)
        v5 = CFSTR("YES");
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1C2F2D000, v4, OS_LOG_TYPE_INFO, "Network is available: %@", (uint8_t *)&v10, 0xCu);
    }
    if ((v2 & 1) != 0)
    {
      v6 = 2;
    }
    else
    {
      if (nwi_state_get_reachability_flags())
        v7 = 1;
      else
        v7 = nwi_state_get_reachability_flags() != 0;
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = CFSTR("NO");
        if (v7)
          v9 = CFSTR("YES");
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1C2F2D000, v8, OS_LOG_TYPE_INFO, "Network has reachability: %@", (uint8_t *)&v10, 0xCu);
      }
      v6 = 1;
      if (v7)
        v6 = 2;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
    nwi_state_release();
  }
  else
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1C2F2D000, v3, OS_LOG_TYPE_INFO, "Network state API returned null; returning unknown",
        (uint8_t *)&v10,
        2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
