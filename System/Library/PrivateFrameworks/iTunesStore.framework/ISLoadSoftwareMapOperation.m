@implementation ISLoadSoftwareMapOperation

- (void)run
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  ISSoftwareMap *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int *v23;
  int *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (+[ISSoftwareMap currentMapIsValid](ISSoftwareMap, "currentMapIsValid"))
  {
    -[ISOperation setSuccess:](self, "setSuccess:", 1);
  }
  else
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v3)
      v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_INFO))
      v5 &= 2u;
    if (v5)
    {
      v26 = 138412290;
      v27 = objc_opt_class();
      LODWORD(v25) = 12;
      v23 = &v26;
      v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4, &v26, v25);
        free(v7);
        v23 = (int *)v8;
        SSFileLog();
      }
    }
    v9 = objc_alloc_init(ISSoftwareMap);
    v10 = objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
        v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v12 = objc_msgSend(v11, "shouldLog", v23);
      if (objc_msgSend(v11, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_INFO))
        v13 &= 2u;
      if (v13)
      {
        v14 = objc_opt_class();
        v26 = 138412290;
        v27 = v14;
        LODWORD(v25) = 12;
        v24 = &v26;
        v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v26, v25);
          free(v16);
          v24 = (int *)v17;
          SSFileLog();
        }
      }
      +[ISSoftwareMap setCurrentMap:](ISSoftwareMap, "setCurrentMap:", v9, v24);
      -[ISOperation setSuccess:](self, "setSuccess:", 1);

    }
    else
    {
      if (!v10)
        v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v18 = objc_msgSend(v11, "shouldLog", v23);
      if (objc_msgSend(v11, "shouldLogToDisk"))
        v19 = v18 | 2;
      else
        v19 = v18;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v19 &= 2u;
      if (v19)
      {
        v20 = objc_opt_class();
        v26 = 138412290;
        v27 = v20;
        LODWORD(v25) = 12;
        v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          v22 = (void *)v21;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v26, v25);
          free(v22);
          SSFileLog();
        }
      }
    }
  }
}

- (id)uniqueKey
{
  return CFSTR("com.apple.iTunesStore.SoftwareMap");
}

@end
