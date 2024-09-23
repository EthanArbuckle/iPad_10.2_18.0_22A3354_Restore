@implementation SUCardEnrollmentUpsellOperation

- (SUCardEnrollmentUpsellOperation)initWithViewController:(id)a3
{
  id v5;
  SUCardEnrollmentUpsellOperation *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dispatchQueue;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUCardEnrollmentUpsellOperation;
  v6 = -[SUCardEnrollmentUpsellOperation init](&v10, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.AppleMediaServices.SUCardEnrollmentUpsellOperation.dispatch", 0);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v6;
}

- (BOOL)didSucceed
{
  return -[SUCardEnrollmentUpsellOperation paymentSetupFeatureState](self, "paymentSetupFeatureState") == 3;
}

- (void)run
{
  void *v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  dispatch_semaphore_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v29;
  int v30;
  NSObject *v31;
  id v32;
  void *v33;
  int v34;
  int v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  int *v47;
  int *v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  _QWORD v52[4];
  id v53;
  SUCardEnrollmentUpsellOperation *v54;
  _QWORD block[5];
  id v56;
  id v57;
  int v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  -[SUCardEnrollmentUpsellOperation _paymentSetupFeature](self, "_paymentSetupFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__SUCardEnrollmentUpsellOperation_run__block_invoke;
    block[3] = &unk_24DE7B0F0;
    block[4] = self;
    v5 = v3;
    v56 = v5;
    dispatch_sync(dispatchQueue, block);
    v6 = objc_alloc_init((Class)ISWeakLinkedClassForString());
    -[SUCardEnrollmentUpsellOperation referrerIdentifier](self, "referrerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReferrerIdentifier:", v7);

    v8 = objc_alloc_init((Class)ISWeakLinkedClassForString());
    objc_msgSend(v8, "setConfiguration:", v6);
    v57 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPaymentSetupFeatures:", v9);

    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v8)
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = objc_msgSend(v11, "shouldLog");
      if (objc_msgSend(v11, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      objc_msgSend(v11, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v13 &= 2u;
      if (v13)
      {
        v15 = (void *)objc_opt_class();
        v58 = 138543362;
        v59 = v15;
        v16 = v15;
        LODWORD(v49) = 12;
        v47 = &v58;
        v17 = (void *)_os_log_send_and_compose_impl();

        if (!v17)
          goto LABEL_14;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v58, v49);
        v14 = objc_claimAutoreleasedReturnValue();
        free(v17);
        v47 = (int *)v14;
        SSFileLog();
      }

LABEL_14:
      v18 = dispatch_semaphore_create(0);
      -[SUCardEnrollmentUpsellOperation setSemaphore:](self, "setSemaphore:", v18);

      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __38__SUCardEnrollmentUpsellOperation_run__block_invoke_10;
      v52[3] = &unk_24DE7B0F0;
      v53 = v8;
      v54 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], v52);
      -[SUCardEnrollmentUpsellOperation semaphore](self, "semaphore");
      v19 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = objc_msgSend(v20, "shouldLog", v47);
      if (objc_msgSend(v20, "shouldLogToDisk"))
        v22 = v21 | 2;
      else
        v22 = v21;
      objc_msgSend(v20, "OSLogObject");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        v22 &= 2u;
      if (v22)
      {
        v24 = (void *)objc_opt_class();
        v58 = 138543362;
        v59 = v24;
        v25 = v24;
        LODWORD(v49) = 12;
        v48 = &v58;
        v26 = (void *)_os_log_send_and_compose_impl();

        if (!v26)
          goto LABEL_25;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v26, 4, &v58, v49);
        v23 = objc_claimAutoreleasedReturnValue();
        free(v26);
        v48 = (int *)v23;
        SSFileLog();
      }

LABEL_25:
      -[SUCardEnrollmentUpsellOperation _paymentSetupFeature](self, "_paymentSetupFeature");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = self->_dispatchQueue;
        v50[0] = MEMORY[0x24BDAC760];
        v50[1] = 3221225472;
        v50[2] = __38__SUCardEnrollmentUpsellOperation_run__block_invoke_12;
        v50[3] = &unk_24DE7B0F0;
        v50[4] = self;
        v51 = v27;
        dispatch_sync(v28, v50);

LABEL_61:
        v11 = v53;
        v5 = v27;
        goto LABEL_62;
      }
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v41 = objc_msgSend(v40, "shouldLog", v48);
      if (objc_msgSend(v40, "shouldLogToDisk"))
        v42 = v41 | 2;
      else
        v42 = v41;
      objc_msgSend(v40, "OSLogObject");
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        v42 &= 2u;
      if (v42)
      {
        v44 = (void *)objc_opt_class();
        v58 = 138543362;
        v59 = v44;
        v45 = v44;
        LODWORD(v49) = 12;
        v46 = (void *)_os_log_send_and_compose_impl();

        if (!v46)
        {
LABEL_60:

          goto LABEL_61;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v46, 4, &v58, v49);
        v43 = objc_claimAutoreleasedReturnValue();
        free(v46);
        SSFileLog();
      }

      goto LABEL_60;
    }
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v35 = v34 | 2;
    else
      v35 = v34;
    objc_msgSend(v11, "OSLogObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      v35 &= 2u;
    if (v35)
    {
      v37 = (void *)objc_opt_class();
      v58 = 138543362;
      v59 = v37;
      v38 = v37;
      LODWORD(v49) = 12;
      v39 = (void *)_os_log_send_and_compose_impl();

      if (!v39)
      {
LABEL_62:

        goto LABEL_63;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v39, 4, &v58, v49);
      v36 = objc_claimAutoreleasedReturnValue();
      free(v39);
      SSFileLog();
    }

    goto LABEL_62;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v30 = v29 | 2;
  else
    v30 = v29;
  objc_msgSend(v5, "OSLogObject");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    v30 &= 2u;
  if (!v30)
    goto LABEL_37;
  v58 = 138543362;
  v59 = (id)objc_opt_class();
  v32 = v59;
  LODWORD(v49) = 12;
  v33 = (void *)_os_log_send_and_compose_impl();

  if (v33)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v33, 4, &v58, v49);
    v31 = objc_claimAutoreleasedReturnValue();
    free(v33);
    SSFileLog();
LABEL_37:

  }
LABEL_63:

}

uint64_t __38__SUCardEnrollmentUpsellOperation_run__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t result;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  v6 = (void *)objc_opt_class();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = *(void **)(a1 + 40);
  v9 = v6;
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "state"));
  v13 = 138543618;
  v14 = v6;
  v15 = 2114;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v13, v12);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog();
LABEL_11:

  }
  result = objc_msgSend(*(id *)(a1 + 40), "state");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = result;
  return result;
}

void __38__SUCardEnrollmentUpsellOperation_run__block_invoke_10(uint64_t a1)
{
  void *v2;
  SUPaymentSetupViewController *v3;

  v3 = -[SUPaymentSetupViewController initWithPaymentSetupRequest:]([SUPaymentSetupViewController alloc], "initWithPaymentSetupRequest:", *(_QWORD *)(a1 + 32));
  -[SUPaymentSetupViewController setDelegate:](v3, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", v3, 0, &__block_literal_global_13);

}

void __38__SUCardEnrollmentUpsellOperation_run__block_invoke_2()
{
  void *v0;
  int v1;
  int v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;
  _WORD v7[8];

  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v1 = objc_msgSend(v0, "shouldLog");
  if (objc_msgSend(v0, "shouldLogToDisk"))
    v2 = v1 | 2;
  else
    v2 = v1;
  objc_msgSend(v0, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    v4 = v2;
  else
    v4 = v2 & 2;
  if (!v4)
    goto LABEL_12;
  v7[0] = 0;
  LODWORD(v6) = 2;
  v5 = (void *)_os_log_send_and_compose_impl();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4, v7, v6);
    v3 = objc_claimAutoreleasedReturnValue();
    free(v5);
    SSFileLog();
LABEL_12:

  }
}

uint64_t __38__SUCardEnrollmentUpsellOperation_run__block_invoke_12(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t result;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  v6 = (void *)objc_opt_class();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = *(void **)(a1 + 40);
  v9 = v6;
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "state"));
  v13 = 138543618;
  v14 = v6;
  v15 = 2114;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v13, v12);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog();
LABEL_11:

  }
  result = objc_msgSend(*(id *)(a1 + 40), "state");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = result;
  return result;
}

- (id)_paymentSetupFeature
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE08318]);
  -[SUCardEnrollmentUpsellOperation referrerIdentifier](self, "referrerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentifier:", v4);

  objc_msgSend(v5, "performPaymentSetupFeatureLookup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "resultWithError:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      v13 = (void *)objc_opt_class();
      v19 = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v8;
      v14 = v13;
      LODWORD(v17) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v19, v17);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (void)paymentSetupViewControllerDidDismiss
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  LODWORD(v11) = 138543362;
  *(_QWORD *)((char *)&v11 + 4) = objc_opt_class();
  v7 = *(id *)((char *)&v11 + 4);
  LODWORD(v10) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v11, v10, v11);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_11:

  }
  -[SUCardEnrollmentUpsellOperation semaphore](self, "semaphore");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v9);

}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (int64_t)paymentSetupFeatureState
{
  return self->_paymentSetupFeatureState;
}

- (void)setPaymentSetupFeatureState:(int64_t)a3
{
  self->_paymentSetupFeatureState = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
