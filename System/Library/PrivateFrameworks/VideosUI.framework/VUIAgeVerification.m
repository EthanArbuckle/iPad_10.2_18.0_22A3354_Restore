@implementation VUIAgeVerification

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_52);
  return (id)sharedInstance_sharedInstance_5;
}

void __36__VUIAgeVerification_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = v0;

}

- (void)configureAgeVerification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::setting preflightConfigDictionary %@", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v4, "vui_numberForKey:", CFSTR("isAgeVerificationEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAgeVerification setIsAgeVerificationEnabled:](self, "setIsAgeVerificationEnabled:", objc_msgSend(v7, "BOOLValue"));
  objc_msgSend(v4, "vui_numberForKey:", CFSTR("minTvRatingRequiringAgeVerification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[VUIAgeVerification setMinTvRatingRequiringAgeVerification:](self, "setMinTvRatingRequiringAgeVerification:", v8);
  objc_msgSend(v4, "vui_numberForKey:", CFSTR("minMovieRatingRequiringAgeVerification"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[VUIAgeVerification setMinMovieRatingRequiringAgeVerification:](self, "setMinMovieRatingRequiringAgeVerification:", v9);

}

- (void)performAgeGateVerificationWithRatingValue:(id)a3 ratingDomain:(id)a4 completion:(id)a5
{
  id v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  VUIAgeVerification *v38;
  id v39;
  void *v40;
  _QWORD aBlock[4];
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = COERCE_DOUBLE(a4);
  v10 = a5;
  VUIDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v44 = v8;
    v45 = 2112;
    v46 = v9;
    _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::Checking content with rating:%@ for ratingDomain:%@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAgeVerification notificationToken](self, "notificationToken");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:", v13);

  LOBYTE(v13) = objc_msgSend(*(id *)&v9, "isEqualToString:", *MEMORY[0x1E0DB1A38]);
  v14 = objc_msgSend(v8, "intValue");
  if ((v13 & 1) != 0)
    -[VUIAgeVerification minTvRatingRequiringAgeVerification](self, "minTvRatingRequiringAgeVerification");
  else
    -[VUIAgeVerification minMovieRatingRequiringAgeVerification](self, "minMovieRatingRequiringAgeVerification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  if (v8 && v14 >= v16)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ams_activeiTunesAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E0CFD778]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSince1970");
    v24 = v23;

    VUIDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v44 = v24;
      v45 = 2048;
      v46 = v21 / 1000.0;
      _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::Content is restricted - checking if user needs age verification. Timestamp = %f , AMSAccountFlagAgeVerificationExpiration = %f", buf, 0x16u);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke;
    aBlock[3] = &unk_1E9F9A268;
    v42 = v10;
    v26 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc(MEMORY[0x1E0CFDDD0]);
    +[VUIPreflightManager defaultPreflightManager](VUIPreflightManager, "defaultPreflightManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "presentingController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v28, "initWithAccount:bag:options:viewController:", v18, v27, MEMORY[0x1E0C9AA70], v30);

    objc_msgSend(v31, "isVerificationNeeded");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4;
    v36[3] = &unk_1E9F9CAF8;
    v38 = self;
    v39 = v26;
    v37 = v31;
    v40 = v24;
    v33 = v31;
    v34 = v26;
    objc_msgSend(v32, "addFinishBlock:", v36);

  }
  else
  {
    VUIDefaultLogObject();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v35, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::content not restricted", buf, 2u);
    }

    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke(uint64_t a1, char a2, int a3)
{
  dispatch_time_t v5;
  id *v6;
  _QWORD v7[2];
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  char v11;
  _QWORD block[4];
  id v13;
  char v14;

  if (a3)
  {
    v5 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_2;
    block[3] = &unk_1E9F9BE68;
    v6 = &v13;
    v13 = *(id *)(a1 + 32);
    v14 = a2;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v8 = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_3;
    v9 = &unk_1E9F9BE68;
    v6 = &v10;
    v10 = *(id *)(a1 + 32);
    v11 = a2;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v7[0], 3221225472))
      v8((uint64_t)v7);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v7);
  }

}

uint64_t __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4_cold_2((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    v14 = objc_msgSend(a2, "requiredType");
    VUIDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = v14;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::AMSUIAgeVerificationTask isVerificationNeeded: resultType=%lu", buf, 0xCu);
    }

    if (v14)
    {
      if (v14 == 1)
      {
        v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
        goto LABEL_6;
      }
      if ((v14 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "performTask");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_13;
        v25[3] = &unk_1E9F9CAD0;
        v17 = *(id *)(a1 + 48);
        v25[4] = *(_QWORD *)(a1 + 40);
        v26 = v17;
        v27 = *(_QWORD *)(a1 + 56);
        v28 = v14;
        objc_msgSend(v16, "addFinishBlock:", v25);

        goto LABEL_7;
      }
      VUIDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4_cold_1(v14, v18, v19, v20, v21, v22, v23, v24);

    }
  }
  v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_6:
  v13();
LABEL_7:

}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_13(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_13_cold_2((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

LABEL_5:
    v13 = *(void (**)(void))(a1[5] + 16);
LABEL_6:
    v13();
    goto LABEL_7;
  }
  v14 = objc_msgSend(a2, "successType");
  VUIDefaultLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = v14;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::AMSUIAgeVerificationTask performTask: successType=%lu", buf, 0xCu);
  }

  if (!v14)
    goto LABEL_5;
  if ((v14 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v13 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_6;
  }
  VUIDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14 != 2)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_13_cold_1((uint64_t)a1, v17, v24, v25, v26, v27, v28, v29);

    goto LABEL_5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::starting verification flow, adding observer for ACDAccountStoreDidChangeNotification", buf, 2u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C8F1C0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_15;
  v30[3] = &unk_1E9F9CAA8;
  v30[5] = a1[6];
  v30[4] = a1[4];
  objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", v19, 0, v20, v30);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = a1[4];
  v23 = *(void **)(v22 + 32);
  *(_QWORD *)(v22 + 32) = v21;

LABEL_7:
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  double v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "ams_accountFlagValueForAccountFlag:", *MEMORY[0x1E0CFD778]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5 / 1000.0;

  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::received ACDAccountStoreDidChangeNotification during age verification - rechecking AMSAccountFlagAgeVerificationExpiration=%f", (uint8_t *)&v11, 0xCu);
  }

  v8 = *(double *)(a1 + 40);
  VUIDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6 <= v8)
  {
    if (v10)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::user is still not age-verified", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIAgeVerificationManager::user is now age-verified. Use will need to retry playback", (uint8_t *)&v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObserver:](v9, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  }

}

- (BOOL)isAgeVerificationEnabled
{
  return self->_isAgeVerificationEnabled;
}

- (void)setIsAgeVerificationEnabled:(BOOL)a3
{
  self->_isAgeVerificationEnabled = a3;
}

- (NSNumber)minTvRatingRequiringAgeVerification
{
  return self->_minTvRatingRequiringAgeVerification;
}

- (void)setMinTvRatingRequiringAgeVerification:(id)a3
{
  objc_storeStrong((id *)&self->_minTvRatingRequiringAgeVerification, a3);
}

- (NSNumber)minMovieRatingRequiringAgeVerification
{
  return self->_minMovieRatingRequiringAgeVerification;
}

- (void)setMinMovieRatingRequiringAgeVerification:(id)a3
{
  objc_storeStrong((id *)&self->_minMovieRatingRequiringAgeVerification, a3);
}

- (id)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
  objc_storeStrong(&self->_notificationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_minMovieRatingRequiringAgeVerification, 0);
  objc_storeStrong((id *)&self->_minTvRatingRequiringAgeVerification, 0);
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "VUIAgeVerificationManager::Unknown resultType returned %lul", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_9();
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_4_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "VUIAgeVerificationManager::Error returned in AMSUIAgeVerificationTask isVerificationNeeded: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_9();
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_13_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "VUIAgeVerificationManager::Unknown successType returned %lul", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4_9();
}

void __88__VUIAgeVerification_performAgeGateVerificationWithRatingValue_ratingDomain_completion___block_invoke_13_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "VUIAgeVerificationManager::AMSUIAgeVerificationTask performTask: error= %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_9();
}

@end
