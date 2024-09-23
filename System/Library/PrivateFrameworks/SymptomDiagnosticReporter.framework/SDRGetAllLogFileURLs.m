@implementation SDRGetAllLogFileURLs

void ___SDRGetAllLogFileURLs_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    *(_DWORD *)buf = 134217984;
    v22 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_20675A000, v5, OS_LOG_TYPE_INFO, "SDRDiagnosticReporter - retrieved configuration dictionary with %ld contents", buf, 0xCu);

  }
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("logArchivePath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x24BDBD6D0];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, v9, 0, &v19);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v19;
      v12 = v19;
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v10;

      v15 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v17 = v15;
        v18 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 134217984;
        v22 = v18;
        _os_log_impl(&dword_20675A000, v17, OS_LOG_TYPE_INFO, "SDRDiagnosticReporter - finished enumeration with %ld entries", buf, 0xCu);

      }
      if (v12)
      {
        if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
          ___SDRGetAllLogFileURLs_block_invoke_cold_1();
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v11);
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void ___SDRGetAllLogFileURLs_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20675A000, v0, v1, "SDRDiagnosticReporter - encountered error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
