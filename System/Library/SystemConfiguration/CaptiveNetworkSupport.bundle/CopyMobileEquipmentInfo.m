@implementation CopyMobileEquipmentInfo

void __CopyMobileEquipmentInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    mysyslog_get_logger();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v7))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_219EF1000, v6, v7, "copyMobileEquipmentInfo failed with error: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    objc_msgSend(a2, "meInfoList");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
