@implementation PMSignInWithAppleController

- (void)leaveGroupWithContext:(id)a3 completion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BE0ADE0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "leaveGroupWithContext:completion:", v7, v6);

}

- (void)deleteAllItemsFromDepartedGroupWithContext:(id)a3 completion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BE0ADE0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "deleteAllItemsFromDepartedGroupWithContext:completion:", v7, v6);

}

- (void)participantRemovedWithContext:(id)a3 participantID:(id)a4 completion:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (objc_class *)MEMORY[0x24BE0ADE0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  objc_msgSend(v11, "participantRemovedWithContext:participantID:completion:", v10, v9, v8);

}

- (void)performHealthCheckInBackground
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAuthKitAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "altDSIDForAccount:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0ADE8]), "initWithAltDSID:", v7);
    v6 = objc_alloc_init(MEMORY[0x24BE0ADE0]);
    objc_msgSend(v6, "performHealthCheckWithContext:completion:", v5, &__block_literal_global_0);

  }
}

void __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke_cold_2((uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke_cold_1(v5);
  }

}

- (void)fetchAppIconForBundleID:(id)a3 iconSize:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  height = a4.height;
  width = a4.width;
  v8 = (void *)MEMORY[0x24BE0ADA0];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appIconForBundleID:size:completion:", v10, v11, v9);

}

- (void)cancelAppIconRequestBundleID:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE0ADA0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelAppIconRequestForBundleID:completion:", v7, v6);

}

void __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_243521000, log, OS_LOG_TYPE_DEBUG, "Sign in with Apple health check completed.", v1, 2u);
}

void __61__PMSignInWithAppleController_performHealthCheckInBackground__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_243521000, a2, OS_LOG_TYPE_ERROR, "Sign in with Apple health check failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
