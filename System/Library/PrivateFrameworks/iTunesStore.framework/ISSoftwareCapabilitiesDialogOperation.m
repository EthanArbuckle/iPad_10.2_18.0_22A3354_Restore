@implementation ISSoftwareCapabilitiesDialogOperation

- (ISSoftwareCapabilitiesDialogOperation)initWithRequiredCapabilities:(id)a3 mismatches:(id)a4
{
  ISSoftwareCapabilitiesDialogOperation *v7;

  __ISRecordSPIClassUsage(self);
  v7 = -[ISOperation init](self, "init");
  if (v7)
  {
    v7->_mismatches = (NSDictionary *)objc_msgSend(a4, "copy");
    v7->_requiredCapabilities = (id)objc_msgSend(a3, "copy");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISSoftwareCapabilitiesDialogOperation;
  -[ISSoftwareCapabilitiesDialogOperation dealloc](&v3, sel_dealloc);
}

- (NSDictionary)mismatches
{
  return self->_mismatches;
}

- (id)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)run
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  ISStoreURLOperation *v36;
  NSDictionary *obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  int v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  -[ISOperation loadURLBagWithContext:returningError:](self, "loadURLBagWithContext:returningError:", v3, 0);
  v4 = objc_msgSend((id)objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "URLBagForContext:", v3), "urlForKey:", CFSTR("p2-capabilities-dialog"));
  if (v4)
  {
    v35 = v4;
    v36 = objc_alloc_init(ISStoreURLOperation);
    -[ISURLOperation setDataProvider:](v36, "setDataProvider:", +[ISDataProvider provider](ISProtocolDataProvider, "provider"));
    v5 = -[ISSoftwareCapabilitiesDialogOperation requiredCapabilities](self, "requiredCapabilities");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = -[ISSoftwareCapabilitiesDialogOperation mismatches](self, "mismatches");
    v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      v11 = 1;
      v12 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          v15 = (void *)objc_msgSend(v6, "objectForKey:", v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v15, "BOOLValue") & 1) == 0)
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("vCap%ld"), v12++);
          else
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("cap%ld"), v11++);
          objc_msgSend(v7, "setObject:forKey:", v14, v16);

        }
        v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v9);
    }
    v17 = objc_alloc_init(MEMORY[0x24BEB1F30]);
    objc_msgSend(v17, "setCachePolicy:", 1);
    objc_msgSend(v17, "setRequestParameters:", v7);
    objc_msgSend(v17, "setURL:", v35);
    -[ISURLOperation setRequestProperties:](v36, "setRequestProperties:", v17);

    v38 = 0;
    if (-[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v36, &v38))
    {
      -[ISOperation setSuccess:](self, "setSuccess:", 1);
    }
    else
    {
      v25 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
      if (!v25)
        v25 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v26 = objc_msgSend(v25, "shouldLog");
      if (objc_msgSend(v25, "shouldLogToDisk"))
        v27 = v26 | 2;
      else
        v27 = v26;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v25, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v28 = v27;
      else
        v28 = v27 & 2;
      if (v28)
      {
        v29 = objc_opt_class();
        v44 = 138412290;
        v45 = v29;
        LODWORD(v34) = 12;
        v33 = &v44;
        v30 = _os_log_send_and_compose_impl();
        if (v30)
        {
          v31 = (void *)v30;
          v32 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v30, 4, &v44, v34);
          free(v31);
          v33 = (int *)v32;
          SSFileLog();
        }
      }
      -[ISSoftwareCapabilitiesDialogOperation _postDefaultDialog](self, "_postDefaultDialog", v33);
      -[ISOperation setError:](self, "setError:", v38);
    }

  }
  else
  {
    v18 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v18)
      v18 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v19 = objc_msgSend(v18, "shouldLog");
    if (objc_msgSend(v18, "shouldLogToDisk"))
      v20 = v19 | 2;
    else
      v20 = v19;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v18, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v21 = v20;
    else
      v21 = v20 & 2;
    if (v21)
    {
      v44 = 138412290;
      v45 = objc_opt_class();
      LODWORD(v34) = 12;
      v33 = &v44;
      v22 = _os_log_send_and_compose_impl();
      if (v22)
      {
        v23 = (void *)v22;
        v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v22, 4, &v44, v34);
        free(v23);
        v33 = (int *)v24;
        SSFileLog();
      }
    }
    -[ISSoftwareCapabilitiesDialogOperation _postDefaultDialog](self, "_postDefaultDialog", v33);
    -[ISOperation setSuccess:](self, "setSuccess:", 1);
  }
}

- (void)_postDefaultDialog
{
  int v2;
  const __CFString *v3;
  const __CFString *v4;
  id v5;
  id v6;

  v6 = (id)MGCopyAnswer();
  v2 = objc_msgSend(v6, "intValue");
  v3 = CFSTR("HARDWARE_INCOMPATIBLE_ERROR_BODY_IPHONE");
  if (v2 == 3)
    v3 = CFSTR("HARDWARE_INCOMPATIBLE_ERROR_BODY_IPAD");
  if (v2 == 2)
    v4 = CFSTR("HARDWARE_INCOMPATIBLE_ERROR_BODY_IPOD");
  else
    v4 = v3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v4, &stru_24C441158, 0);
  v5 = +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("HARDWARE_INCOMPATIBLE_ERROR_TITLE"), &stru_24C441158, 0);
  objc_msgSend(v5, "addOperation:", +[ISDialogOperation operationWithError:](ISDialogOperation, "operationWithError:", SSError()));

}

@end
