@implementation PPLPeopleAppLauncher

+ (id)sharedLauncher
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__PPLPeopleAppLauncher_sharedLauncher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLauncher_onceToken != -1)
    dispatch_once(&sharedLauncher_onceToken, block);
  return (id)sharedLauncher___sharedLauncher;
}

void __38__PPLPeopleAppLauncher_sharedLauncher__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedLauncher___sharedLauncher;
  sharedLauncher___sharedLauncher = (uint64_t)v0;

}

- (PPLPeopleAppLauncher)init
{
  PPLPeopleAppLauncher *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PPLPeopleAppLauncher;
  v2 = -[PPLPeopleAppLauncher init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("people app queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)launchPeopleAppIfNeededWithForegroundPriority:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;

  v3 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke;
  v8[3] = &unk_24D5ED9D8;
  v8[4] = self;
  v9 = a3;
  v5 = (void *)MEMORY[0x2199FF014](v8, a2);
  -[PPLPeopleAppLauncher queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
    dispatch_sync(v6, v5);
  else
    dispatch_async(v6, v5);

}

void __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  NSObject *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint8_t buf[8];
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "peopleAppProcessHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_3;
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 32), "peopleAppProcessHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  if ((v6 & 1) == 0)
  {
LABEL_3:
    PPLPeopleViewServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216B10000, v7, OS_LOG_TYPE_DEFAULT, "people launched via runningboard", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.PeopleViewService"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80BE8], "contextWithIdentity:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExplanation:", CFSTR("people launched via runningboard"));
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x24BE80B40], "grantWithUserInteractivity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v10;
      objc_msgSend(MEMORY[0x24BE80AD0], "attributeWithCompletionPolicy:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v11;
      objc_msgSend(MEMORY[0x24BE80BE0], "grantWithForegroundPriority");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v12;
      v13 = v33;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE80B40], "grantUserInitiated");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v10;
      objc_msgSend(MEMORY[0x24BE80AD0], "attributeWithCompletionPolicy:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v11;
      objc_msgSend(MEMORY[0x24BE80BE0], "grantWithBackgroundPriority");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v12;
      v13 = v32;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributes:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80BF8]), "initWithContext:", v9);
    v16 = v15;
    if (v15)
    {
      v29 = 0;
      v30 = 0;
      v28 = 0;
      v17 = objc_msgSend(v15, "execute:assertion:error:", &v30, &v29, &v28);
      v18 = v30;
      v19 = v29;
      v20 = v28;
      PPLPeopleViewServiceLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if ((v17 & 1) != 0)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_216B10000, v22, OS_LOG_TYPE_DEFAULT, "successfully launched app", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_cold_2((uint64_t)v20, v22);
      }

      objc_msgSend(*(id *)(a1 + 32), "setPeopleAppProcessHandle:", v18);
      objc_msgSend(*(id *)(a1 + 32), "initializationAssertion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "invalidate");

      objc_msgSend(*(id *)(a1 + 32), "setInitializationAssertion:", v19);
      if (!*(_BYTE *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "willLaunchPeopleAppInBackground:", *(_QWORD *)(a1 + 32));

      }
      v25 = dispatch_time(0, 1000000000);
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v26 = objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_11;
      v27[3] = &unk_24D5ED9B0;
      v27[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v25, v26, v27);

    }
    else
    {
      PPLPeopleViewServiceLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_cold_1(v19);
    }

  }
}

uint64_t __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_11(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "initializationAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setInitializationAssertion:", 0);
}

- (PPLPeopleAppLauncherDelegate)delegate
{
  return (PPLPeopleAppLauncherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RBSProcessHandle)peopleAppProcessHandle
{
  return self->_peopleAppProcessHandle;
}

- (void)setPeopleAppProcessHandle:(id)a3
{
  objc_storeStrong((id *)&self->_peopleAppProcessHandle, a3);
}

- (RBSAssertion)initializationAssertion
{
  return self->_initializationAssertion;
}

- (void)setInitializationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_initializationAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationAssertion, 0);
  objc_storeStrong((id *)&self->_peopleAppProcessHandle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_216B10000, log, OS_LOG_TYPE_ERROR, "no launch request", v1, 2u);
}

void __70__PPLPeopleAppLauncher_launchPeopleAppIfNeededWithForegroundPriority___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_216B10000, a2, OS_LOG_TYPE_ERROR, "Failed to launch with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
