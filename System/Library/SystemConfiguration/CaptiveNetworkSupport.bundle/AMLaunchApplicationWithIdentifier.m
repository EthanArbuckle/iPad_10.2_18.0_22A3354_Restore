@implementation AMLaunchApplicationWithIdentifier

void ___AMLaunchApplicationWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    mysyslog_get_logger();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_219EF1000, v7, v8, "Failed to launch app %@. Error = %@", (uint8_t *)&v16, 0x16u);
    }

    if (objc_msgSend(v6, "code") == 1)
    {
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDD1398]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && objc_msgSend(v11, "code") == 4)
      {
        mysyslog_get_logger();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v12, v13))
        {
          v14 = *(_QWORD *)(a1 + 48);
          v16 = 138412290;
          v17 = v14;
          _os_log_impl(&dword_219EF1000, v12, v13, "App %@ is uninstalled", (uint8_t *)&v16, 0xCu);
        }

        v15 = 1;
      }
      else
      {
        v15 = 2;
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
