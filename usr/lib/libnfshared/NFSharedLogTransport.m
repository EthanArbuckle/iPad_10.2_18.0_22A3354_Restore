@implementation NFSharedLogTransport

os_log_t __NFSharedLogTransport_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  os_log_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  qword_1ECFF6A98 = (uint64_t)dispatch_queue_create("com.apple.stockholm.NCILog", v1);
  qword_1ECFF6AA0 = (uint64_t)os_log_create("com.apple.nfc", "nci.primary.stream");
  result = os_log_create("com.apple.nfc", "nci.secondary.stream");
  qword_1ECFF6AA8 = (uint64_t)result;
  return result;
}

void __NFSharedLogTransport_block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
    v2 = &qword_1ECFF6AA0;
  else
    v2 = &qword_1ECFF6AA8;
  v3 = *v2;
  if (os_log_type_enabled((os_log_t)*v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 136446722;
    v8 = v4;
    v9 = 1040;
    v10 = v5;
    v11 = 2098;
    v12 = v6;
    _os_log_impl(&dword_1C34DB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s %{public,stockholm:NCI}.*P", (uint8_t *)&v7, 0x1Cu);
  }
}

@end
