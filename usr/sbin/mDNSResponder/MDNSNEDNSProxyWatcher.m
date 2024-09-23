@implementation MDNSNEDNSProxyWatcher

- (void)configurationChanged:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _mdns_ne_dns_proxy_state_watch_log();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuration changed", v5, 2u);
  }

  if (configurationChanged__s_once != -1)
    dispatch_once(&configurationChanged__s_once, &__block_literal_global_2162);
  dispatch_source_merge_data((dispatch_source_t)configurationChanged__s_loader, 1uLL);
}

- (void)dnsProxyStatusDidChange:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  id v12;

  v3 = a3;
  v4 = _mdns_ne_dns_proxy_state_watch_log();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DNS proxy status changed for manager -- address: %p", buf, 0xCu);
  }

  v6 = _mdns_ne_dns_proxy_state_watch_queue();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__MDNSNEDNSProxyWatcher_dnsProxyStatusDidChange___block_invoke;
  block[3] = &unk_10013D018;
  v10 = v3;
  v8 = v3;
  dispatch_async(v7, block);

}

void __49__MDNSNEDNSProxyWatcher_dnsProxyStatusDidChange___block_invoke(uint64_t a1)
{
  _mdns_ne_dns_proxy_state_watch_fetch_manager_status(*(void **)(a1 + 32));
}

void __46__MDNSNEDNSProxyWatcher_configurationChanged___block_invoke(id a1)
{
  id v1;
  NSObject *v2;
  dispatch_source_t v3;
  void *v4;

  v1 = _mdns_ne_dns_proxy_state_watch_queue();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v2);
  v4 = (void *)configurationChanged__s_loader;
  configurationChanged__s_loader = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)configurationChanged__s_loader, &__block_literal_global_1);
  dispatch_activate((dispatch_object_t)configurationChanged__s_loader);
}

@end
