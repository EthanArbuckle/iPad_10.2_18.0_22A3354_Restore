@implementation RMEnrollmentController

+ (NSURL)userDefaultsEnrollmentURL
{
  return +[RMFeatureOverrides bootstrapURL](RMFeatureOverrides, "bootstrapURL");
}

+ (id)synchronousEnrollmentControllerForManagementEnrollmentType:(int64_t)a3 scope:(int64_t)a4
{
  RMEnrollmentController *v4;

  v4 = -[RMEnrollmentController initWithEnrollmentType:scope:]([RMEnrollmentController alloc], "initWithEnrollmentType:scope:", a3, a4);
  -[RMEnrollmentController setSynchronous:](v4, "setSynchronous:", 1);
  return v4;
}

- (RMEnrollmentController)initWithEnrollmentType:(int64_t)a3 scope:(int64_t)a4
{
  RMEnrollmentController *v6;
  uint64_t v7;
  NSMutableDictionary *connectionByServiceName;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RMEnrollmentController;
  v6 = -[RMEnrollmentController init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    connectionByServiceName = v6->_connectionByServiceName;
    v6->_connectionByServiceName = (NSMutableDictionary *)v7;

    v6->_enrollmentType = a3;
    v6->_scope = a4;
  }
  return v6;
}

- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "Starting device channel enrollment for %{public}@", buf, 0xCu);
  }

  if (-[RMEnrollmentController _isDeviceOrSupervisedEnrollment](self, "_isDeviceOrSupervisedEnrollment"))
  {
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke;
    v18[3] = &unk_24D967BD0;
    v10 = v6;
    v19 = v10;
    v11 = v7;
    v20 = v11;
    -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_13;
    v15[3] = &unk_24D967BF8;
    v16 = v10;
    v17 = v11;
    objc_msgSend(v12, "enrollDeviceChannelWithURI:completionHandler:", v16, v15);

    v13 = v19;
  }
  else
  {
    +[RMErrorUtilities createInternalError](RMErrorUtilities, "createInternalError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[RMEnrollmentController enrollDeviceChannelWithURI:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);
  }

}

void __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_13_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "Device channel enrollment for %{public}@ succeeded with identifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(id, _QWORD, void *);
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "Starting user channel enrollment for account %{public}@", buf, 0xCu);
  }

  if (-[RMEnrollmentController enrollmentType](self, "enrollmentType"))
  {
    +[RMErrorUtilities createInternalError](RMErrorUtilities, "createInternalError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RMEnrollmentController enrollUserChannelWithAccountIdentifier:completionHandler:].cold.1();

    v7[2](v7, 0, v9);
  }
  else
  {
    v11 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke;
    v18[3] = &unk_24D967BD0;
    v12 = v6;
    v19 = v12;
    v13 = v7;
    v20 = v13;
    -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_15;
    v15[3] = &unk_24D967BF8;
    v16 = v12;
    v17 = v13;
    objc_msgSend(v14, "enrollUserChannelWithAccountIdentifier:completionHandler:", v16, v15);

    v9 = v19;
  }

}

void __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_15_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "User channel enrollment for account %{public}@ succeeded with channel identifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v12;
    _os_log_impl(&dword_21885E000, v16, OS_LOG_TYPE_DEFAULT, "Starting DDM enrollment for %{public}@", buf, 0xCu);
  }

  if (-[RMEnrollmentController enrollmentType](self, "enrollmentType") == a3)
  {
    v17 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke;
    v26[3] = &unk_24D967BD0;
    v18 = v12;
    v27 = v18;
    v19 = v15;
    v28 = v19;
    -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_16;
    v23[3] = &unk_24D967BF8;
    v24 = v18;
    v25 = v19;
    objc_msgSend(v20, "enrollViaMDMWithEnrollmentType:uri:accountIdentifier:personaIdentifier:completionHandler:", a3, v24, v13, v14, v23);

    v21 = v27;
  }
  else
  {
    +[RMErrorUtilities createInternalError](RMErrorUtilities, "createInternalError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[RMEnrollmentController enrollViaMDMWithEnrollmentType:uri:accountIdentifier:personaIdentifier:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v21);
  }

}

void __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_16_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "DDM channel enrollment for %{public}@ succeeded with identifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (void)unenrollDeviceChannelWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "Unenrolling device channel", v11, 2u);
  }

  if (-[RMEnrollmentController _isDeviceOrSupervisedEnrollment](self, "_isDeviceOrSupervisedEnrollment"))
  {
    -[RMEnrollmentController _unenrollIdentifier:completionHandler:](self, "_unenrollIdentifier:completionHandler:", v6, v7);
  }
  else
  {
    +[RMErrorUtilities createInternalError](RMErrorUtilities, "createInternalError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RMEnrollmentController enrollDeviceChannelWithURI:completionHandler:].cold.1();

    v7[2](v7, v9);
  }

}

- (void)unenrollUserChannelWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "Unenrolling user channel", v11, 2u);
  }

  if (-[RMEnrollmentController enrollmentType](self, "enrollmentType"))
  {
    +[RMErrorUtilities createInternalError](RMErrorUtilities, "createInternalError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RMEnrollmentController enrollUserChannelWithAccountIdentifier:completionHandler:].cold.1();

    v7[2](v7, v9);
  }
  else
  {
    -[RMEnrollmentController _unenrollIdentifier:completionHandler:](self, "_unenrollIdentifier:completionHandler:", v6, v7);
  }

}

- (void)unenrollViaMDMWithEnrollmentType:(int64_t)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21885E000, v10, OS_LOG_TYPE_DEFAULT, "Unenrolling DDM channel", v13, 2u);
  }

  if (-[RMEnrollmentController enrollmentType](self, "enrollmentType") == a3)
  {
    -[RMEnrollmentController _unenrollIdentifier:completionHandler:](self, "_unenrollIdentifier:completionHandler:", v8, v9);
  }
  else
  {
    +[RMErrorUtilities createInternalError](RMErrorUtilities, "createInternalError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[RMEnrollmentController enrollViaMDMWithEnrollmentType:uri:accountIdentifier:personaIdentifier:completionHandler:].cold.1();

    v9[2](v9, v11);
  }

}

- (void)_unenrollIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_24D967BD0;
  v9 = v6;
  v18 = v9;
  v10 = v7;
  v19 = v10;
  -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_17;
  v14[3] = &unk_24D967C20;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "unenrollWithIdentifier:completionHandler:", v13, v14);

}

void __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void (*v7)(void);
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_17_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_21885E000, v6, OS_LOG_TYPE_DEFAULT, "Unenrolled from %{public}@", (uint8_t *)&v9, 0xCu);
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21885E000, v5, OS_LOG_TYPE_DEFAULT, "Checking device channel enrollment", buf, 2u);
  }

  if (-[RMEnrollmentController _isDeviceOrSupervisedEnrollment](self, "_isDeviceOrSupervisedEnrollment"))
  {
    v6 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke;
    v13[3] = &unk_24D967C48;
    v7 = v4;
    v14 = v7;
    -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_19;
    v11[3] = &unk_24D967C70;
    v12 = v7;
    objc_msgSend(v8, "deviceChannelEnrollmentExistsWithCompletionHandler:", v11);

    v9 = v14;
  }
  else
  {
    +[RMErrorUtilities createInternalError](RMErrorUtilities, "createInternalError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[RMEnrollmentController enrollDeviceChannelWithURI:completionHandler:].cold.1();

    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);
  }

}

void __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void (*v8)(void);
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_19_cold_1();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_21885E000, v7, OS_LOG_TYPE_DEFAULT, "Device channel enrollment check result: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "Syncing management channel", buf, 2u);
  }

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24D967C48;
  v10 = v6;
  v16 = v10;
  -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_21;
  v13[3] = &unk_24D967C48;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "syncWithIdentifier:completionHandler:", v7, v13);

}

void __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_21_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21885E000, v5, OS_LOG_TYPE_DEFAULT, "Synced management channel", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21885E000, v11, OS_LOG_TYPE_DEFAULT, "Updating management channel with push message", buf, 2u);
  }

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke;
  v18[3] = &unk_24D967C48;
  v13 = v8;
  v19 = v13;
  -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_22;
  v16[3] = &unk_24D967C48;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "updateWithIdentifier:pushMessage:completionHandler:", v10, v9, v16);

}

void __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_22_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21885E000, v5, OS_LOG_TYPE_DEFAULT, "Updated management channel with push message", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21885E000, v11, OS_LOG_TYPE_DEFAULT, "Updating management channel with tokens response", buf, 2u);
  }

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke;
  v18[3] = &unk_24D967C48;
  v13 = v8;
  v19 = v13;
  -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_23;
  v16[3] = &unk_24D967C48;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "updateWithIdentifier:tokensResponse:completionHandler:", v10, v9, v16);

}

void __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(void);
  uint8_t v7[16];

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_23_cold_1();

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21885E000, v5, OS_LOG_TYPE_DEFAULT, "Updated management channel with tokens response", v7, 2u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "Finding management channel via account identifier", buf, 2u);
  }

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_24D967C48;
  v10 = v6;
  v16 = v10;
  -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_24;
  v13[3] = &unk_24D967C98;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "managementChannelWithAccountIdentifier:completionHandler:", v7, v13);

}

void __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v8)
        goto LABEL_10;
      v12 = 138543362;
      v13 = v5;
      v9 = "Found management channel: %{public}@";
      v10 = v7;
      v11 = 12;
    }
    else
    {
      if (!v8)
        goto LABEL_10;
      LOWORD(v12) = 0;
      v9 = "Did not find management channel";
      v10 = v7;
      v11 = 2;
    }
    _os_log_impl(&dword_21885E000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    goto LABEL_10;
  }
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_24_cold_1();
LABEL_10:

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5);
}

- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21885E000, v8, OS_LOG_TYPE_DEFAULT, "Finding management channel via enrollment URL", buf, 2u);
  }

  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__RMEnrollmentController_managementChannelWithEnrollmentURL_completionHandler___block_invoke;
  v15[3] = &unk_24D967C48;
  v10 = v6;
  v16 = v10;
  -[RMEnrollmentController _scopedProxyWithErrorHandler:](self, "_scopedProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __79__RMEnrollmentController_managementChannelWithEnrollmentURL_completionHandler___block_invoke_26;
  v13[3] = &unk_24D967C98;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "managementChannelWithEnrollmentURL:completionHandler:", v7, v13);

}

void __79__RMEnrollmentController_managementChannelWithEnrollmentURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__RMEnrollmentController_managementChannelWithEnrollmentURL_completionHandler___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v8)
        goto LABEL_10;
      v12 = 138543362;
      v13 = v5;
      v9 = "Found management channel: %{public}@";
      v10 = v7;
      v11 = 12;
    }
    else
    {
      if (!v8)
        goto LABEL_10;
      LOWORD(v12) = 0;
      v9 = "Did not find management channel";
      v10 = v7;
      v11 = 2;
    }
    _os_log_impl(&dword_21885E000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v11);
    goto LABEL_10;
  }
  +[RMLog enrollmentController](RMLog, "enrollmentController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_24_cold_1();
LABEL_10:

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5);
}

- (id)_scopedProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[RMEnrollmentController scope](self, "scope") == 1)
    -[RMEnrollmentController _daemonProxyWithErrorHandler:](self, "_daemonProxyWithErrorHandler:", v4);
  else
    -[RMEnrollmentController _agentProxyWithErrorHandler:](self, "_agentProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_daemonProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RMEnrollmentController _daemonConnection](self, "_daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RMEnrollmentController isSynchronous](self, "isSynchronous"))
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  else
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_daemonConnection
{
  NSMutableDictionary *v3;
  id v4;

  v3 = self->_connectionByServiceName;
  objc_sync_enter(v3);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_connectionByServiceName, "objectForKeyedSubscript:", CFSTR("com.apple.remotemanagementd"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = +[RMXPCProxy newDaemonConnection](RMXPCProxy, "newDaemonConnection");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectionByServiceName, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.remotemanagementd"));
    objc_msgSend(v4, "resume");
  }
  objc_sync_exit(v3);

  return v4;
}

- (id)_agentProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RMEnrollmentController _agentConnection](self, "_agentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RMEnrollmentController isSynchronous](self, "isSynchronous"))
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  else
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_agentConnection
{
  NSMutableDictionary *v3;
  id v4;

  v3 = self->_connectionByServiceName;
  objc_sync_enter(v3);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_connectionByServiceName, "objectForKeyedSubscript:", CFSTR("com.apple.RemoteManagementAgent"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = +[RMXPCProxy newAgentConnection](RMXPCProxy, "newAgentConnection");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_connectionByServiceName, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.RemoteManagementAgent"));
    objc_msgSend(v4, "resume");
  }
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)_isDeviceOrSupervisedEnrollment
{
  int64_t v3;

  v3 = -[RMEnrollmentController enrollmentType](self, "enrollmentType");
  if (v3 != 1)
    LOBYTE(v3) = -[RMEnrollmentController enrollmentType](self, "enrollmentType") == 3;
  return v3;
}

- (void)discoverEnrollmentURLForUserIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("@"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 2)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 2)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      if (v13)
        v14 = v13;
      else
        v14 = 8443;
      v9 = (void *)v11;
    }
    else
    {
      v14 = 8443;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __83__RMEnrollmentController_discoverEnrollmentURLForUserIdentifier_completionHandler___block_invoke;
    v17[3] = &unk_24D967CC0;
    v18 = v7;
    -[RMEnrollmentController _discoverEnrollmentURLForDomain:port:completionHandler:](self, "_discoverEnrollmentURLForDomain:port:completionHandler:", v9, v16, v17);

  }
  else
  {
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RMEnrollmentController discoverEnrollmentURLForUserIdentifier:completionHandler:].cold.1();

    +[RMErrorUtilities createServiceDiscoveryInvalidUserIdentifierWithReason:](RMErrorUtilities, "createServiceDiscoveryInvalidUserIdentifierWithReason:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);
  }

}

uint64_t __83__RMEnrollmentController_discoverEnrollmentURLForUserIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_discoverEnrollmentURLForDomain:(id)a3 port:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = (id)objc_opt_new();
  objc_msgSend(v12, "setScheme:", CFSTR("https"));
  objc_msgSend(v12, "setHost:", v10);

  objc_msgSend(v12, "setPort:", v9);
  objc_msgSend(v12, "setPath:", CFSTR("/.well-known/com.apple.remotemanagement"));
  objc_msgSend(v12, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMEnrollmentController _enrollmentURLFromWellKnownURL:completionHandler:](self, "_enrollmentURLFromWellKnownURL:completionHandler:", v11, v8);

}

- (void)_enrollmentURLFromWellKnownURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke;
  v14 = &unk_24D967CE8;
  v15 = v5;
  v16 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "dataTaskWithURL:completionHandler:", v9, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "resume", v11, v12, v13, v14);
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_4();

    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "localizedDescription");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[RMErrorUtilities createServiceDiscoveryWellKnownFailedWithReason:](RMErrorUtilities, "createServiceDiscoveryWellKnownFailedWithReason:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v13);
  }
  else if (v7 && v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x24BE7EC40], "loadData:serializationType:error:", v7, 1, &v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v25;
    if (v13)
    {
      objc_msgSend(v13, "responseServers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "responseBaseURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v18, 0);
      }
      else
      {
        +[RMLog enrollmentController](RMLog, "enrollmentController");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_3();

        v24 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid well-known servers response for %@: no servers: %@"), *(_QWORD *)(a1 + 32), v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[RMErrorUtilities createServiceDiscoveryWellKnownInvalidWithReason:](RMErrorUtilities, "createServiceDiscoveryWellKnownInvalidWithReason:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v18);
      }

    }
    else
    {
      +[RMLog enrollmentController](RMLog, "enrollmentController");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_2();

      v22 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid well-known response for %@: JSON error: %@"), *(_QWORD *)(a1 + 32), v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[RMErrorUtilities createServiceDiscoveryWellKnownInvalidWithReason:](RMErrorUtilities, "createServiceDiscoveryWellKnownInvalidWithReason:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v16);
    }

  }
  else
  {
    +[RMLog enrollmentController](RMLog, "enrollmentController");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_1();

    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid well-known response for %@: %@"), *(_QWORD *)(a1 + 32), v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    +[RMErrorUtilities createServiceDiscoveryWellKnownInvalidWithReason:](RMErrorUtilities, "createServiceDiscoveryWellKnownInvalidWithReason:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v13);
  }

}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (int64_t)enrollmentType
{
  return self->_enrollmentType;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionByServiceName, 0);
}

- (void)enrollDeviceChannelWithURI:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_21885E000, v0, v1, "Enrollment controller not initialized for device channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Failed XPC connection while starting device channel enrollment for %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __71__RMEnrollmentController_enrollDeviceChannelWithURI_completionHandler___block_invoke_13_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Failed device channel enrollment for %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)enrollUserChannelWithAccountIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_21885E000, v0, v1, "Enrollment controller not initialized for user channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Failed XPC connection while starting user channel enrollment for account %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __83__RMEnrollmentController_enrollUserChannelWithAccountIdentifier_completionHandler___block_invoke_15_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Failed user channel enrollment for account %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)enrollViaMDMWithEnrollmentType:uri:accountIdentifier:personaIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_21885E000, v0, v1, "Enrollment controller not initialized for specified enrollment type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Failed XPC connection while starting DDM channel enrollment for %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __115__RMEnrollmentController_enrollViaMDMWithEnrollmentType_uri_accountIdentifier_personaIdentifier_completionHandler___block_invoke_16_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Failed DDM channel enrollment for %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Failed XPC connection while unenrolling from %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __64__RMEnrollmentController__unenrollIdentifier_completionHandler___block_invoke_17_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Failed to unenroll from %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed XPC connection while checking device channel enrollment: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__RMEnrollmentController_deviceChannelEnrollmentExistsWithCompletionHandler___block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed device channel enrollment check: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed XPC connection while sync'ing: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __63__RMEnrollmentController_syncWithIdentifier_completionHandler___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to sync management channel: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed XPC connection while updating with push message: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__RMEnrollmentController_updateWithIdentifier_pushMessage_completionHandler___block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to update management channel with push message: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed XPC connection while updating with tokens response: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__RMEnrollmentController_updateWithIdentifier_tokensResponse_completionHandler___block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to update management channel with tokens response: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed XPC connection while finding management channel: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __83__RMEnrollmentController_managementChannelWithAccountIdentifier_completionHandler___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to find management channel: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)discoverEnrollmentURLForUserIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "User identifier is wrong format for discovery: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Invalid well-known response for %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Invalid well-known response for %{public}@: JSON error: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Invalid well-known servers response for %{public}@: no servers: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __75__RMEnrollmentController__enrollmentURLFromWellKnownURL_completionHandler___block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_21885E000, v0, v1, "Well-known request for %{public}@ failed: %{public}@");
  OUTLINED_FUNCTION_1();
}

@end
