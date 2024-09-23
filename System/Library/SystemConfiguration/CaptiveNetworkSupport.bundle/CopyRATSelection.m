@implementation CopyRATSelection

void __CopyRATSelection_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    mysyslog_get_logger();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_219EF1000, v9, v10, "getRatSelection failed with error: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
