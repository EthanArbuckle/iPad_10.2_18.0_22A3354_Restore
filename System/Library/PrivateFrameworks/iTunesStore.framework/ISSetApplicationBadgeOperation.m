@implementation ISSetApplicationBadgeOperation

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BYTE v13[24];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[ISSetApplicationBadgeOperation bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISSetApplicationBadgeOperation badgeValue](self, "badgeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      v7 &= 2u;
    if (v7)
    {
      *(_DWORD *)v13 = 138412802;
      *(_QWORD *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2112;
      *(_QWORD *)&v13[14] = v3;
      *(_WORD *)&v13[22] = 2112;
      v14 = v4;
      v9 = *(id *)&v13[4];
      LODWORD(v12) = 32;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        objc_msgSend(MEMORY[0x24BE38508], "sharedService");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBadgeValue:forBundleID:", v4, v3);

        -[ISOperation setSuccess:](self, "setSuccess:", 1);
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, v13, v12, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (id)uniqueKey
{
  return CFSTR("com.apple.iTunesStore.set-app-badge");
}

- (NSString)badgeValue
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setBadgeValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_badgeValue, 0);
}

@end
