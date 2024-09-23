@implementation AMSBag_iTunesStoreUI

- (AMSBagValue)appleMusicDeviceOfferDeepLink
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BEC8BB8]);
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBagContext:", v3);

  objc_msgSend(v4, "start");
  objc_msgSend(v4, "URLBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      *(_DWORD *)v17 = 138543618;
      *(_QWORD *)&v17[4] = objc_opt_class();
      *(_WORD *)&v17[12] = 2080;
      *(_QWORD *)&v17[14] = "-[AMSBag_iTunesStoreUI appleMusicDeviceOfferDeepLink]";
      v10 = *(id *)&v17[4];
      LODWORD(v16) = 22;
      v15 = v17;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, v17, v16, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      v15 = v9;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v5, "valueForKey:", CFSTR("appleMusicDeviceOfferDeepLink"), v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08070], "frozenBagValueWithKey:value:valueType:", CFSTR("appleMusicDeviceOfferDeepLink"), v12, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSBagValue *)v13;
}

- (AMSBagValue)iCloudDeviceOfferDeepLink
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BEC8BB8]);
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBagContext:", v3);

  objc_msgSend(v4, "start");
  objc_msgSend(v4, "URLBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      *(_DWORD *)v17 = 138543618;
      *(_QWORD *)&v17[4] = objc_opt_class();
      *(_WORD *)&v17[12] = 2080;
      *(_QWORD *)&v17[14] = "-[AMSBag_iTunesStoreUI iCloudDeviceOfferDeepLink]";
      v10 = *(id *)&v17[4];
      LODWORD(v16) = 22;
      v15 = v17;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, v17, v16, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      v15 = v9;
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v5, "valueForKey:", CFSTR("iCloudDeviceOfferDeepLink"), v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08070], "frozenBagValueWithKey:value:valueType:", CFSTR("iCloudDeviceOfferDeepLink"), v12, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSBagValue *)v13;
}

@end
