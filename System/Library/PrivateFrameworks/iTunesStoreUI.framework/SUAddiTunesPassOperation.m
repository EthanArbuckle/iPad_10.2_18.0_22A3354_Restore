@implementation SUAddiTunesPassOperation

- (SUAddiTunesPassOperation)initWithViewController:(id)a3
{
  id v5;
  SUAddiTunesPassOperation *v6;
  SUAddiTunesPassOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUAddiTunesPassOperation;
  v6 = -[SUAddiTunesPassOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_authenticationContext, a3);

  return v7;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  dispatch_semaphore_t v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  id v36;
  void *v37;
  int v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  void *v46;
  NSObject *v47;
  int v48;
  int v49;
  int v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  int v59;
  int v60;
  id v61;
  void *v62;
  void *v63;
  _QWORD block[4];
  NSObject *v65;
  SUAddiTunesPassOperation *v66;
  id v67;
  id v68;
  int v69;
  id v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ITunesPassSerialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_11:
    v13 = objc_alloc(MEMORY[0x24BEC8BB8]);
    objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v13, "initWithBagContext:", v14);

    objc_msgSend(v6, "start");
    objc_msgSend(v6, "URLBag");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v39 = v38 | 2;
      else
        v39 = v38;
      objc_msgSend(v9, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v39 &= 2u;
      if (!v39)
        goto LABEL_60;
      goto LABEL_35;
    }
    objc_msgSend(v15, "valueForKey:", CFSTR("getAddCreditPassUrl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v12 = v16;
        v17 = objc_alloc_init(MEMORY[0x24BEC8C30]);
        objc_msgSend(MEMORY[0x24BEC8B78], "provider");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDataProvider:", v18);

        -[SUAddiTunesPassOperation authenticationContext](self, "authenticationContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAuthenticationContext:", v19);

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", v12);
        objc_msgSend(v17, "setRequestProperties:", v20);

        v68 = 0;
        -[SUAddiTunesPassOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v17, &v68);
        v21 = v68;
        if (v21)
          goto LABEL_37;
        objc_msgSend(v17, "dataProvider");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "output");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v21 = 0;
        if ((isKindOfClass & 1) == 0)
        {
LABEL_37:
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "shouldLog");
          if (objc_msgSend(v42, "shouldLogToDisk"))
            v43 |= 2u;
          v63 = v42;
          objc_msgSend(v42, "OSLogObject");
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            v43 &= 2u;
          if (v43)
          {
            v44 = (void *)objc_opt_class();
            v69 = 138543618;
            v70 = v44;
            v71 = 2114;
            v58 = v21;
            v72 = v21;
            v45 = v44;
            LODWORD(v55) = 22;
            v46 = (void *)_os_log_send_and_compose_impl();

            if (!v46)
            {
              v21 = v58;
              v32 = v63;
LABEL_59:

              goto LABEL_60;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v46, 4, &v69, v55);
            v27 = objc_claimAutoreleasedReturnValue();
            free(v46);
            v32 = v63;
            SSFileLog();
            v21 = v58;
          }
          else
          {
            v32 = v63;
          }
LABEL_58:

          goto LABEL_59;
        }
        objc_msgSend(v17, "dataProvider");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "output");
        v26 = objc_claimAutoreleasedReturnValue();

        v67 = 0;
        v62 = (void *)v26;
        v27 = objc_msgSend(objc_alloc((Class)ISWeakLinkedClassForString()), "initWithData:error:", v26, &v67);
        v21 = v67;
        if (v27)
        {
          -[SUAddiTunesPassOperation setPresentedPass:](self, "setPresentedPass:", v27);
          v28 = dispatch_semaphore_create(0);
          -[SUAddiTunesPassOperation setSemaphore:](self, "setSemaphore:", v28);

          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __31__SUAddiTunesPassOperation_run__block_invoke;
          block[3] = &unk_24DE7B0F0;
          v65 = v27;
          v66 = self;
          dispatch_async(MEMORY[0x24BDAC9B8], block);
          -[SUAddiTunesPassOperation semaphore](self, "semaphore");
          v29 = objc_claimAutoreleasedReturnValue();
          dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);

          if (-[SUAddiTunesPassOperation addedCard](self, "addedCard"))
          {
            -[SUAddiTunesPassOperation presentedPass](self, "presentedPass");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUAddiTunesPassOperation setPass:](self, "setPass:", v30);

            -[SUAddiTunesPassOperation setSuccess:](self, "setSuccess:", 1);
          }
          v31 = v65;
          v32 = v62;
          goto LABEL_57;
        }
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v47 = objc_claimAutoreleasedReturnValue();
        v59 = -[NSObject shouldLog](v47, "shouldLog");
        v48 = -[NSObject shouldLogToDisk](v47, "shouldLogToDisk");
        v49 = v59 | 2;
        if (!v48)
          v49 = v59;
        v60 = v49;
        v56 = v47;
        -[NSObject OSLogObject](v47, "OSLogObject");
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          v50 = v60;
        else
          v50 = v60 & 2;
        if (v50)
        {
          v61 = v21;
          v51 = (void *)objc_opt_class();
          v69 = 138543362;
          v70 = v51;
          v52 = v51;
          LODWORD(v55) = 12;
          v53 = (void *)_os_log_send_and_compose_impl();

          if (!v53)
          {
            v21 = v61;
            v32 = v62;
            v31 = v56;
            goto LABEL_57;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v53, 4, &v69, v55);
          v54 = objc_claimAutoreleasedReturnValue();
          free(v53);
          v57 = v54;
          v31 = v56;
          SSFileLog();
          v21 = v61;
          v32 = v62;
        }
        else
        {
          v32 = v62;
          v31 = v56;
        }

LABEL_57:
        goto LABEL_58;
      }
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = objc_claimAutoreleasedReturnValue();
    v33 = -[NSObject shouldLog](v12, "shouldLog");
    if (-[NSObject shouldLogToDisk](v12, "shouldLogToDisk"))
      v34 = v33 | 2;
    else
      v34 = v33;
    -[NSObject OSLogObject](v12, "OSLogObject");
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      v34 &= 2u;
    if (v34)
    {
      v69 = 138543362;
      v70 = (id)objc_opt_class();
      v36 = v70;
      LODWORD(v55) = 12;
      v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37)
      {
LABEL_60:

        goto LABEL_61;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v37, 4, &v69, v55);
      v35 = objc_claimAutoreleasedReturnValue();
      free(v37);
      SSFileLog();
    }

    goto LABEL_60;
  }
  v6 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  objc_msgSend(v6, "passWithPassTypeIdentifier:serialNumber:", CFSTR("pass.com.apple.itunes.storecredit"), v5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_11;
  }
  v8 = (void *)v7;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  objc_msgSend(v9, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    v11 &= 2u;
  if (!v11)
    goto LABEL_60;
LABEL_35:
  v69 = 138543362;
  v70 = (id)objc_opt_class();
  v40 = v70;
  LODWORD(v55) = 12;
  v41 = (void *)_os_log_send_and_compose_impl();

  if (v41)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v41, 4, &v69, v55);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v41);
    SSFileLog();
    goto LABEL_60;
  }
LABEL_61:

}

void __31__SUAddiTunesPassOperation_run__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc((Class)ISWeakLinkedClassForString()), "initWithPass:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  int *v22;
  uint64_t v23;
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  -[SUAddiTunesPassOperation presentedPass](self, "presentedPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsPass:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUAddiTunesPassOperation presentedPass](self, "presentedPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setITunesPassSerialNumber:", v11);

    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v12, "saveAccount:error:", v9, &v24);
    v13 = v24;

    if (!v13)
    {
      -[SUAddiTunesPassOperation setAddedCard:](self, "setAddedCard:", 1);
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (v16)
    {
      v18 = (void *)objc_opt_class();
      v25 = 138543618;
      v26 = v18;
      v27 = 2114;
      v28 = v13;
      v19 = v18;
      LODWORD(v23) = 22;
      v22 = &v25;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_12:

LABEL_14:
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v25, v23);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v20);
      v22 = (int *)v17;
      SSFileLog();
    }

    goto LABEL_12;
  }
LABEL_15:
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0, v22);
  -[SUAddiTunesPassOperation semaphore](self, "semaphore");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v21);

}

- (SSAuthenticationContext)authenticationContext
{
  return *(SSAuthenticationContext **)&self->_addedCard;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_addedCard, a3);
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_authenticationContext;
}

- (PKPass)pass
{
  return (PKPass *)self->_viewController;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (BOOL)addedCard
{
  return *(&self->super._success + 1);
}

- (void)setAddedCard:(BOOL)a3
{
  *(&self->super._success + 1) = a3;
}

- (PKPass)presentedPass
{
  return self->_pass;
}

- (void)setPresentedPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)self->_presentedPass;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_presentedPass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedPass, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_addedCard, 0);
}

@end
