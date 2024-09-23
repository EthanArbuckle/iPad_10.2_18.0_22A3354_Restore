@implementation NetworkTypeOverrideChangedNotification

uint64_t ____NetworkTypeOverrideChangedNotification_block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  if (!v2)
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (v4)
  {
    v9 = 138412290;
    v10 = objc_opt_class();
    LODWORD(v8) = 12;
    v5 = _os_log_send_and_compose_impl();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4, &v9, v8);
      free(v6);
      SSFileLog();
    }
  }
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BEB2C88]);
  return objc_msgSend(*(id *)(a1 + 32), "_reloadNetworkType");
}

@end
