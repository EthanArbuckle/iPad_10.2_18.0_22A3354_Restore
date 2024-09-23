@implementation QWORD))

void ___mdns_dns_service_manager_probe_discovered_service_block_invoke_2(uint64_t a1, int a2, sec_trust_t trust, void (**a4)(_QWORD, _QWORD))
{
  __SecTrust *v6;
  void *v7;
  OSStatus v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v6 = sec_trust_copy_ref(trust);
  v7 = _Block_copy(a4);
  if (_mdns_dns_service_queue_s_once != -1)
    dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000;
  v11[2] = ___mdns_dns_service_manager_probe_discovered_service_block_invoke_3;
  v11[3] = &unk_10013B0F8;
  v12 = *(_OWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v11[4] = v7;
  v8 = SecTrustEvaluateAsyncWithError(v6, (dispatch_queue_t)_mdns_dns_service_queue_s_queue, v11);
  if (v6)
    CFRelease(v6);
  if (v8)
  {
    if (_mdns_dns_service_log_s_once != -1)
      dispatch_once(&_mdns_dns_service_log_s_once, &__block_literal_global_62);
    v9 = _mdns_dns_service_log_s_log;
    if (os_log_type_enabled((os_log_t)_mdns_dns_service_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315394;
      v15 = v10;
      v16 = 2048;
      v17 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to start aynchronous trust evaluation -- provider name: %s, error: %{mdns:err}ld", buf, 0x16u);
    }
    a4[2](a4, 0);
    if (v7)
      _Block_release(v7);
  }
}

@end
