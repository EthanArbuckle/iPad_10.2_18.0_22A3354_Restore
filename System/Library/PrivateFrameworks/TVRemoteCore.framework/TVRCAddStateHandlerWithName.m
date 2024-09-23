@implementation TVRCAddStateHandlerWithName

_DWORD *___TVRCAddStateHandlerWithName_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  _DWORD *v7;
  id v8;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v2, 100, 0, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v4)
  {
    _TVRCGeneralLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v12 = v6;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Error serializing state data for \"%s\": %@", buf, 0x16u);
    }

    v7 = 0;
  }
  else
  {
    v7 = malloc_type_calloc(1uLL, objc_msgSend(v3, "length") + 200, 0xFE35CA7BuLL);
    if (v7)
    {
      __strlcpy_chk();
      *v7 = 1;
      v7[1] = objc_msgSend(v3, "length");
      v8 = objc_retainAutorelease(v3);
      memcpy(v7 + 50, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
    }
  }

  return v7;
}

@end
