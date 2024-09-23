@implementation MDNSNEDNSProxyWatcher

- (void)configurationChanged:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _mdns_ne_dns_proxy_state_watch_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22983F000, v3, OS_LOG_TYPE_DEFAULT, "Configuration changed", v4, 2u);
  }

  if (configurationChanged__s_once != -1)
    dispatch_once(&configurationChanged__s_once, &__block_literal_global_927);
  dispatch_source_merge_data((dispatch_source_t)configurationChanged__s_loader, 1uLL);
}

- (void)dnsProxyStatusDidChange:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _mdns_ne_dns_proxy_state_watch_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = v3;
    _os_log_impl(&dword_22983F000, v4, OS_LOG_TYPE_DEFAULT, "DNS proxy status changed for manager -- address: %p", buf, 0xCu);
  }

  _mdns_ne_dns_proxy_state_watch_queue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__MDNSNEDNSProxyWatcher_dnsProxyStatusDidChange___block_invoke;
  block[3] = &unk_24F2868F8;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

void __49__MDNSNEDNSProxyWatcher_dnsProxyStatusDidChange___block_invoke(uint64_t a1)
{
  _mdns_ne_dns_proxy_state_watch_fetch_manager_status(*(void **)(a1 + 32));
}

void __46__MDNSNEDNSProxyWatcher_configurationChanged___block_invoke()
{
  NSObject *v0;
  dispatch_source_t v1;
  void *v2;

  _mdns_ne_dns_proxy_state_watch_queue();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, v0);
  v2 = (void *)configurationChanged__s_loader;
  configurationChanged__s_loader = (uint64_t)v1;

  dispatch_source_set_event_handler((dispatch_source_t)configurationChanged__s_loader, &__block_literal_global_1);
  dispatch_activate((dispatch_object_t)configurationChanged__s_loader);
}

uint64_t __46__MDNSNEDNSProxyWatcher_configurationChanged___block_invoke_2()
{
  NSObject *v0;
  uint8_t v2[16];

  _mdns_ne_dns_proxy_state_watch_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22983F000, v0, OS_LOG_TYPE_INFO, "Loading new manager array", v2, 2u);
  }

  return unk_255A728AC(&off_255A73280, "loadAllFromPreferencesWithCompletionHandler:", &__block_literal_global_14);
}

@end
