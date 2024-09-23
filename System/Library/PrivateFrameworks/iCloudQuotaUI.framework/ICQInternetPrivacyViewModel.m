@implementation ICQInternetPrivacyViewModel

- (ICQInternetPrivacyViewModel)init
{
  ICQInternetPrivacyViewModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICQInternetPrivacyViewModel;
  result = -[ICQInternetPrivacyViewModel init](&v3, sel_init);
  if (result)
  {
    result->_status = 7;
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (NSString)proxyUserTierDescription
{
  unint64_t v2;

  v2 = -[ICQInternetPrivacyViewModel proxyUserTier](self, "proxyUserTier");
  if (v2 == 1)
    return (NSString *)CFSTR("Free");
  if (v2 == 2)
    return (NSString *)CFSTR("Subscriber");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%lu)"), v2);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)proxyAccountTypeDescription
{
  unint64_t v2;

  v2 = -[ICQInternetPrivacyViewModel proxyAccountType](self, "proxyAccountType");
  if (v2 == 1)
    return (NSString *)CFSTR("Free");
  if (v2 == 2)
    return (NSString *)CFSTR("Subscriber");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%lu)"), v2);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)statusDescription
{
  unint64_t v2;

  v2 = -[ICQInternetPrivacyViewModel status](self, "status");
  if (v2 - 1 > 7)
    return (NSString *)CFSTR("None");
  else
    return &off_24E3F55E0[v2 - 1]->isa;
}

- (unint64_t)_statusForSubscriber
{
  if (self->_paused)
    return 8;
  if (-[ICQInternetPrivacyViewModel isEnabled](self, "isEnabled"))
    return 1;
  return 2;
}

- (void)setEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v4 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BE6B748];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  if (v4)
    v8 = 2;
  else
    v8 = 1;
  v10[2] = __53__ICQInternetPrivacyViewModel_setEnabled_completion___block_invoke;
  v10[3] = &unk_24E3F5408;
  v12 = v4;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "setUserTier:queue:completionHandler:", v8, MEMORY[0x24BDAC9B8], v10);

}

void __53__ICQInternetPrivacyViewModel_setEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 48))
      v5 = CFSTR("NO");
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Set internet privacy enabled status: %@ error: %@", (uint8_t *)&v7, 0x16u);
  }

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsEnabled:", *(unsigned __int8 *)(a1 + 48));
    if (*(_BYTE *)(a1 + 48))
      v6 = 1;
    else
      v6 = 2;
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)enableSafari:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BE6B748];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__ICQInternetPrivacyViewModel_enableSafari___block_invoke;
  v6[3] = &unk_24E3F5430;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "setTrafficState:proxyTraffic:queue:completionHandler:", 12, 12, MEMORY[0x24BDAC9B8], v6);

}

void __44__ICQInternetPrivacyViewModel_enableSafari___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Turned on Safari for Porcupine with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pausePrivateRelayUntilTomorrow:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BE6B748];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__ICQInternetPrivacyViewModel_pausePrivateRelayUntilTomorrow___block_invoke;
  v6[3] = &unk_24E3F5430;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "setFreeUserTierUntilTomorrow:completionHandler:", MEMORY[0x24BDAC9B8], v6);

}

void __62__ICQInternetPrivacyViewModel_pausePrivateRelayUntilTomorrow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Set free user tier until tomorrow. error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableDNS:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BE6B748];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__ICQInternetPrivacyViewModel_enableDNS___block_invoke;
  v6[3] = &unk_24E3F5430;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "setTrafficState:proxyTraffic:queue:completionHandler:", 128, 128, MEMORY[0x24BDAC9B8], v6);

}

void __41__ICQInternetPrivacyViewModel_enableDNS___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Turned on DNS for Porcupine with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableWifi:(BOOL)a3 onNetworkName:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BE6B748];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__ICQInternetPrivacyViewModel_enableWifi_onNetworkName_completion___block_invoke;
  v12[3] = &unk_24E3F5408;
  v15 = v6;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "reportWiFiNetworkStatus:networkName:queue:completionHandler:", v6, v11, MEMORY[0x24BDAC9B8], v12);

}

void __67__ICQInternetPrivacyViewModel_enableWifi_onNetworkName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Porcupine on WiFi named %@ is enabled: %@ error: %@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)enableCellular:(BOOL)a3 onNetworkName:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v6 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BE6B748];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__ICQInternetPrivacyViewModel_enableCellular_onNetworkName_completion___block_invoke;
    v13[3] = &unk_24E3F5408;
    v14 = v7;
    v16 = v6;
    v15 = v8;
    objc_msgSend(v9, "reportCellularNetworkStatus:networkName:queue:completionHandler:", v6, v14, MEMORY[0x24BDAC9B8], v13);

    v10 = v14;
  }
  else
  {
    ICQCreateErrorWithMessage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = 0;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "Porcupine on cellular named %@ error: %@", buf, 0x16u);

    }
    (*((void (**)(id, void *))v8 + 2))(v8, v10);
  }

}

void __71__ICQInternetPrivacyViewModel_enableCellular_onNetworkName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Porcupine on cellular named %@ is enabled: %@ error: %@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchBannerModels:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__ICQInternetPrivacyViewModel_fetchBannerModels___block_invoke;
  v6[3] = &unk_24E3F5480;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICQInternetPrivacyViewModel _refreshOverallStatusWithCompletion:](self, "_refreshOverallStatusWithCompletion:", v6);

}

void __49__ICQInternetPrivacyViewModel_fetchBannerModels___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "proxyAccountType") == 2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __49__ICQInternetPrivacyViewModel_fetchBannerModels___block_invoke_2;
    v3[3] = &unk_24E3F5458;
    v2 = *(void **)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v2;
    objc_msgSend(v4, "_fetchBannerModelsForPaidTier:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __49__ICQInternetPrivacyViewModel_fetchBannerModels___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "updateStatusStringForBannerModels:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_fetchBannerModelsForPaidTier:(id)a3
{
  NSObject *v3;
  const __CFString *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  ICQInternetPrivacyBannerModel *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  ICQInternetPrivacyViewModel *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  ICQInternetPrivacyBannerModel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  ICQInternetPrivacyBannerModel *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  ICQInternetPrivacyBannerModel *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  ICQInternetPrivacyBannerModel *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  ICQInternetPrivacyBannerModel *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  ICQInternetPrivacyBannerModel *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  ICQInternetPrivacyBannerModel *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  NSObject *v104;
  NSObject *v105;
  int v106;
  __CFString *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  ICQInternetPrivacyBannerModel *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  NSObject *v119;
  void *v120;
  uint64_t v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void (**v126)(id, void *);
  id obj;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD block[4];
  id v133;
  id v134;
  ICQInternetPrivacyViewModel *v135;
  id v136;
  void (**v137)(id, void *);
  _QWORD v138[4];
  id v139;
  NSObject *v140;
  uint64_t *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  id v151;
  uint8_t buf[4];
  uint64_t v153;
  __int16 v154;
  uint64_t v155;
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  v126 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = 0;
  v147 = &v146;
  v148 = 0x3032000000;
  v149 = __Block_byref_object_copy__10;
  v150 = __Block_byref_object_dispose__10;
  v151 = 0;
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_serviceIsLimited)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v153 = (uint64_t)v4;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "_serviceIsLimited %@", buf, 0xCu);
  }

  if (-[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus") == 6)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Porcupine not available due to unsupported region", buf, 2u);
    }

    -[ICQInternetPrivacyViewModel country](self, "country");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_REGION_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = [ICQInternetPrivacyBannerModel alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_REGION_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v13, "initWithTitle:message:buttonTitle:status:networkName:", v15, v10, v12, 64, 0);
    v17 = (void *)v147[5];
    v147[5] = v16;

    self->_status = 6;
    objc_msgSend(v128, "addObject:", v147[5]);
    v18 = (void *)objc_msgSend(v128, "copy");
    v126[2](v126, v18);
LABEL_10:

    goto LABEL_27;
  }
  v19 = self;
  if (self->_serviceIsLimited)
  {
    v20 = -[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus");
    v19 = self;
    if (v20)
    {
      _ICQGetLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v21, OS_LOG_TYPE_DEFAULT, "Porcupine is enabled in current region but not supported in user's account locale.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
      v12 = objc_claimAutoreleasedReturnValue();

      v23 = [ICQInternetPrivacyBannerModel alloc];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SUPPORTED_REGION_LIMITED_ACCOUNT_TITLE"), &stru_24E400750, CFSTR("Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SUPPORTED_REGION_LIMITED_ACCOUNT_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v23, "initWithTitle:message:buttonTitle:status:networkName:", v25, v27, v12, 4096, 0);
      v29 = (void *)v147[5];
      v147[5] = v28;

      self->_status = 1;
      objc_msgSend(v128, "addObject:", v147[5]);
      v6 = (id)objc_msgSend(v128, "copy");
      v126[2](v126, v6);
      goto LABEL_27;
    }
  }
  if (-[PrivacyProxyServiceStatus serviceStatus](v19->_proxyServiceStatus, "serviceStatus") == 5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v12 = objc_claimAutoreleasedReturnValue();

    v31 = [ICQInternetPrivacyBannerModel alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SYSTEM_INCOMPATIBLE_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SYSTEM_INCOMPATIBLE_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v31, "initWithTitle:message:buttonTitle:status:networkName:", v33, v35, v12, 512, 0);
    v37 = (void *)v147[5];
    v147[5] = v36;

    self->_status = 5;
    objc_msgSend(v128, "addObject:", v147[5]);
    v6 = (id)objc_msgSend(v128, "copy");
    v126[2](v126, v6);
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  if (-[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus") == 3)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "userInterfaceIdiom") == 1;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_FRAUD_IPAD_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    else
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_FRAUD_IPHONE_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    v12 = objc_claimAutoreleasedReturnValue();

    v49 = [ICQInternetPrivacyBannerModel alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_FRAUD_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v49, "initWithTitle:message:buttonTitle:status:networkName:", v51, v12, 0, 1024, 0);
    v53 = (void *)v147[5];
    v147[5] = v52;

    self->_status = 5;
    objc_msgSend(v128, "addObject:", v147[5]);
    v6 = (id)objc_msgSend(v128, "copy");
    v126[2](v126, v6);
    goto LABEL_27;
  }
  if (-[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus") == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_OPEN_SYSTEM_STATUS_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v12 = objc_claimAutoreleasedReturnValue();

    v42 = [ICQInternetPrivacyBannerModel alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_OUTAGE_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_OUTAGE_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v42, "initWithTitle:message:buttonTitle:status:networkName:", v44, v46, v12, 2048, 0);
    v48 = (void *)v147[5];
    v147[5] = v47;

    self->_status = 5;
    objc_msgSend(v128, "addObject:", v147[5]);
    v6 = (id)objc_msgSend(v128, "copy");
    v126[2](v126, v6);
    goto LABEL_27;
  }
  if (-[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus") != 7)
  {
    if (-[ICQInternetPrivacyViewModel proxyUserTier](self, "proxyUserTier") == 1)
    {
      _ICQGetLogSystem();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v54, OS_LOG_TYPE_DEFAULT, "Free tier detected: skipping network statuses", buf, 2u);
      }

      v12 = objc_msgSend(v128, "copy");
      v126[2](v126, v12);
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v55 = objc_claimAutoreleasedReturnValue();
    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    -[PrivacyProxyServiceStatus networkStatuses](self->_proxyServiceStatus, "networkStatuses");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
    v124 = (void *)v55;
    if (!v57)
      goto LABEL_85;
    v129 = *(_QWORD *)v143;
    obj = v56;
LABEL_36:
    v130 = v57;
    v58 = 0;
    while (1)
    {
      if (*(_QWORD *)v143 != v129)
        objc_enumerationMutation(obj);
      v59 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v58);
      _ICQGetLogSystem();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = -[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus");
        v62 = objc_msgSend(v59, "networkStatus");
        *(_DWORD *)buf = 134218240;
        v153 = v61;
        v154 = 2048;
        v155 = v62;
        _os_log_impl(&dword_21F2CC000, v60, OS_LOG_TYPE_DEFAULT, "Overall service status: %lu, network status: %lu", buf, 0x16u);
      }

      if (objc_msgSend(v59, "networkType") != 2)
        break;
      _ICQGetLogSystem();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v59, "networkName");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v153 = (uint64_t)v64;
        _os_log_impl(&dword_21F2CC000, v63, OS_LOG_TYPE_DEFAULT, "Found cellular network name: %@", buf, 0xCu);

      }
      objc_msgSend(v59, "networkName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQInternetPrivacyViewModel setCellularName:](self, "setCellularName:", v65);

      if (objc_msgSend(v59, "networkStatus") == 2
        && -[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus") == 1)
      {
        _ICQGetLogSystem();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F2CC000, v66, OS_LOG_TYPE_DEFAULT, "Current cellular network does not support Porcupine", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_CELLULAR_ON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        v69 = [ICQInternetPrivacyBannerModel alloc];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_CELLULAR_ON_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_USE_WITHOUT_PRIVATE_RELAY_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "networkName");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v69, "initWithTitle:message:buttonTitle:status:networkName:", v68, v71, v73, 4, v74);
        v76 = (void *)v147[5];
        v147[5] = v75;

        objc_msgSend(v125, "addObject:", v147[5]);
LABEL_57:
        v93 = 0;
        goto LABEL_63;
      }
      if (objc_msgSend(v59, "networkStatus")
        || -[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus") != 1)
      {
        if (objc_msgSend(v59, "networkStatus") == 1
          && !-[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus"))
        {
          _ICQGetLogSystem();
          v104 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          {
LABEL_81:
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21F2CC000, v104, OS_LOG_TYPE_DEFAULT, "Network status is active, service status is disabled. Don't display banners/buttons.", buf, 2u);
          }
LABEL_82:
          v93 = 0;
          v103 = 0;
          v68 = 0;
LABEL_83:

          goto LABEL_78;
        }
LABEL_77:
        v93 = 0;
        v103 = 0;
        v68 = 0;
        goto LABEL_78;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      _ICQGetLogSystem();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v95, OS_LOG_TYPE_DEFAULT, "Current cellular network is turned off for Porcupine", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_CELLULAR_OFF_TITLE"), &stru_24E400750, CFSTR("Localizable"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v97 = [ICQInternetPrivacyBannerModel alloc];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_CELLULAR_OFF_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "networkName");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v97, "initWithTitle:message:buttonTitle:status:networkName:", v68, v99, v93, 8, v100);
      v102 = (void *)v147[5];
      v147[5] = v101;

      objc_msgSend(v125, "addObject:", v147[5]);
LABEL_63:
      v103 = 0;
LABEL_78:

      if (v130 == ++v58)
      {
        v56 = obj;
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
        if (!v57)
        {
LABEL_85:

          v119 = dispatch_group_create();
          dispatch_group_enter(v119);
          v120 = (void *)MEMORY[0x24BE6B748];
          v121 = MEMORY[0x24BDAC760];
          v138[0] = MEMORY[0x24BDAC760];
          v138[1] = 3221225472;
          v138[2] = __61__ICQInternetPrivacyViewModel__fetchBannerModelsForPaidTier___block_invoke;
          v138[3] = &unk_24E3F54A8;
          v141 = &v146;
          v122 = v124;
          v139 = v122;
          v12 = v119;
          v140 = v12;
          objc_msgSend(v120, "getTrafficState:completionandler:", MEMORY[0x24BDAC9B8], v138);

          block[0] = v121;
          block[1] = 3221225472;
          block[2] = __61__ICQInternetPrivacyViewModel__fetchBannerModelsForPaidTier___block_invoke_124;
          block[3] = &unk_24E3F54D0;
          v133 = v125;
          v134 = v122;
          v135 = self;
          v136 = v128;
          v137 = v126;
          v10 = v122;
          v6 = v125;
          v123 = (void *)MEMORY[0x24BDAC9B8];
          dispatch_group_notify(v12, MEMORY[0x24BDAC9B8], block);

          v18 = v139;
          goto LABEL_10;
        }
        goto LABEL_36;
      }
    }
    if (objc_msgSend(v59, "networkType") != 1)
      goto LABEL_77;
    _ICQGetLogSystem();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v59, "networkName");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v153 = (uint64_t)v78;
      _os_log_impl(&dword_21F2CC000, v77, OS_LOG_TYPE_DEFAULT, "Found WiFi network name: %@", buf, 0xCu);

    }
    objc_msgSend(v59, "networkName");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInternetPrivacyViewModel setWiFiName:](self, "setWiFiName:", v79);

    if (objc_msgSend(v59, "networkStatus") != 2
      || -[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus") != 1)
    {
      if (!objc_msgSend(v59, "networkStatus")
        && -[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus") == 1)
      {
        _ICQGetLogSystem();
        v105 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F2CC000, v105, OS_LOG_TYPE_DEFAULT, "Current Wi-Fi network is turned off for Porcupine", buf, 2u);
        }

        v106 = MGGetBoolAnswer();
        v107 = CFSTR("WIFI");
        if (v106)
          v107 = CFSTR("WLAN");
        v104 = v107;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_%@_OFF_MESSAGE"), v104);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "localizedStringForKey:value:table:", v108, &stru_24E400750, CFSTR("Localizable"));
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        v111 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_NETWORK_OFF_TITLE"), &stru_24E400750, CFSTR("Localizable"));
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "networkName");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "stringWithFormat:", v113, v114);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        v115 = [ICQInternetPrivacyBannerModel alloc];
        objc_msgSend(v59, "networkName");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v115, "initWithTitle:message:buttonTitle:status:networkName:", v68, v103, v93, 2, v116);
        v118 = (void *)v147[5];
        v147[5] = v117;

        objc_msgSend(v125, "addObject:", v147[5]);
        goto LABEL_83;
      }
      if (objc_msgSend(v59, "networkStatus") == 1
        && !-[PrivacyProxyServiceStatus serviceStatus](self->_proxyServiceStatus, "serviceStatus"))
      {
        _ICQGetLogSystem();
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
          goto LABEL_81;
        goto LABEL_82;
      }
      goto LABEL_77;
    }
    _ICQGetLogSystem();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v80, OS_LOG_TYPE_DEFAULT, "Current Wi-Fi network does not support Porcupine", buf, 2u);
    }

    v81 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_NETWORK_ON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "networkName");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "stringWithFormat:", v83, v84, v124);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = [ICQInternetPrivacyBannerModel alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_WIFI_ON_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_USE_WITHOUT_PRIVATE_RELAY_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "networkName");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v85, "initWithTitle:message:buttonTitle:status:networkName:", v68, v87, v89, 1, v90);
    v92 = (void *)v147[5];
    v147[5] = v91;

    objc_msgSend(v125, "addObject:", v147[5]);
    goto LABEL_57;
  }
  -[ICQInternetPrivacyViewModel _addNetworkOutageBannerTo:withCompletion:](self, "_addNetworkOutageBannerTo:withCompletion:", v128, v126);
LABEL_29:
  _Block_object_dispose(&v146, 8);

}

void __61__ICQInternetPrivacyViewModel__fetchBannerModelsForPaidTier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  ICQInternetPrivacyBannerModel *v27;
  id v28;
  ICQInternetPrivacyBannerModel *v29;
  uint8_t v30[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if ((a2 & 0x80) == 0)
  {
    v28 = v5;
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Porcupine DNS is unavailable", buf, 2u);
    }

    v27 = [ICQInternetPrivacyBannerModel alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_DNS_OFF_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_DNS_OFF_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_TURN_ON_DNS_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v27, "initWithTitle:message:buttonTitle:status:networkName:", v9, v11, v13, 32, 0);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v6 = v28;
  }
  if ((a2 & 8) == 0)
  {
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "Porcupine Safari is unavailable", v30, 2u);
    }

    v29 = [ICQInternetPrivacyBannerModel alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SAFARI_OFF_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SAFARI_OFF_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_TURN_ON_SAFARI_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v29, "initWithTitle:message:buttonTitle:status:networkName:", v19, v21, v23, 16, 0);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __61__ICQInternetPrivacyViewModel__fetchBannerModelsForPaidTier___block_invoke_124(uint64_t a1)
{
  id *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v3 >= objc_msgSend(*(id *)(a1 + 40), "count") && objc_msgSend(*v2, "count"))
  {
    v4 = 3;
  }
  else
  {
    v5 = objc_msgSend(*v2, "count");
    if (v5 >= objc_msgSend(*(id *)(a1 + 40), "count"))
      goto LABEL_7;
    v4 = 4;
    v2 = (id *)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 48), "setStatus:", v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*v2, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setIssueOrSuggestionCount:", v6);

LABEL_7:
  v7 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v7 == 2)
    v8 = 32;
  else
    v8 = 40;
  if (v7 == 2)
    v9 = 40;
  else
    v9 = 32;
  objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", *(_QWORD *)(a1 + v8));
  objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", *(_QWORD *)(a1 + v9));
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Banners returned: %@", (uint8_t *)&v14, 0xCu);

  }
  v12 = *(_QWORD *)(a1 + 64);
  v13 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

}

- (void)updateStatusStringForBannerModels:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "status", (_QWORD)v14) == 1)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = CFSTR("INTERNET_PRIVACY_STATUS_MAC_UNSUPPORTED_WIFI");
          goto LABEL_26;
        }
        if (objc_msgSend(v9, "status") == 128)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = CFSTR("INTERNET_PRIVACY_STATUS_MAC_WIFI_OFF");
          goto LABEL_26;
        }
        if (objc_msgSend(v9, "status") == 32)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = CFSTR("INTERNET_PRIVACY_STATUS_MAC_DNS_OFF");
          goto LABEL_26;
        }
        if (objc_msgSend(v9, "status") == 16)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = CFSTR("INTERNET_PRIVACY_STATUS_MAC_SAFARI_OFF");
          goto LABEL_26;
        }
        if (objc_msgSend(v9, "status") == 64)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = CFSTR("INTERNET_PRIVACY_STATUS_MAC_UNAVAILABLE_REGION");
          goto LABEL_26;
        }
        if (objc_msgSend(v9, "status") == 512)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = CFSTR("INTERNET_PRIVACY_STATUS_MAC_UNAVAILABLE_SYSTEM");
          goto LABEL_26;
        }
        if (objc_msgSend(v9, "status") == 1024
          || objc_msgSend(v9, "status") == 2048
          || objc_msgSend(v9, "status") == 0x2000)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = CFSTR("INTERNET_PRIVACY_STATUS_MAC_UNAVAILABLE_FRAUD");
LABEL_26:
          objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24E400750, CFSTR("Localizable"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_27;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v10 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_27:

  -[ICQInternetPrivacyViewModel setStatusStringForPrefPane:](self, "setStatusStringForPrefPane:", v10);
}

- (NSString)statusStringForPrefPane
{
  os_unfair_lock_s *p_lock;
  NSString *v4;
  NSObject *v5;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_statusStringForPrefPane;
  os_unfair_lock_unlock(p_lock);
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Returning status string %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)setStatusStringForPrefPane:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (unint64_t)a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_statusStringForPrefPane;
  objc_storeStrong((id *)&self->_statusStringForPrefPane, a3);
  os_unfair_lock_unlock(&self->_lock);
  if ((objc_msgSend((id)v6, "isEqualToString:", v5) & 1) == 0 && v5 | v6)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Private Relay status string has changed! old status: %@, new status: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v7, "postNotificationName:object:", CFSTR("PorcupineStatusDidChange"), 0);
  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ICQInternetPrivacyViewModel setStatusStringForPrefPane:].cold.1(v7);
  }

}

- (id)country
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyServiceStatus details](self->_proxyServiceStatus, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PrivacyProxyServiceStatus details](self->_proxyServiceStatus, "details");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE6B750]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("-"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDBCAE8];
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayNameForKey:value:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = *MEMORY[0x24BDBCAE8];
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayNameForKey:value:", v12, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)isLocationSharingEnabled:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BE6B748];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__ICQInternetPrivacyViewModel_isLocationSharingEnabled___block_invoke;
  v6[3] = &unk_24E3F54F8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getGeohashSharingPreference:completionHandler:", MEMORY[0x24BDAC9B8], v6);

}

void __56__ICQInternetPrivacyViewModel_isLocationSharingEnabled___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Porcupine location sharing is enabled: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableLocationSharing:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Porcupine should location sharing %@", buf, 0xCu);
  }

  v8 = (void *)MEMORY[0x24BE6B748];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__ICQInternetPrivacyViewModel_enableLocationSharing_completion___block_invoke;
  v10[3] = &unk_24E3F5520;
  v12 = v4;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "setGeohashSharingPreference:queue:completionHandler:", v4, MEMORY[0x24BDAC9B8], v10);

}

void __64__ICQInternetPrivacyViewModel_enableLocationSharing_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 40))
      v5 = CFSTR("NO");
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Set Porcupine location sharing enabled status: %@ error: %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchUserTierWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE6B748];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__ICQInternetPrivacyViewModel__fetchUserTierWithCompletion___block_invoke;
  v7[3] = &unk_24E3F5548;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getUserTierExtended:completionHandler:", MEMORY[0x24BDAC9B8], v7);

}

void __60__ICQInternetPrivacyViewModel__fetchUserTierWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  __CFString *v9;
  const __CFString *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 == 1)
    {
      v9 = CFSTR("Free");
    }
    else if (a2 == 2)
    {
      v9 = CFSTR("Subscriber");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%lu)"), a2);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v10 = CFSTR("NO");
    *(_DWORD *)buf = 136315906;
    v12 = "-[ICQInternetPrivacyViewModel _fetchUserTierWithCompletion:]_block_invoke";
    if ((_DWORD)a3)
      v10 = CFSTR("YES");
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "%s: Got NSP user tier: %@ isPaused: %@, error: %@", buf, 0x2Au);

  }
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPaused:", a3);
    objc_msgSend(*(id *)(a1 + 32), "setProxyUserTier:", a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_fetchAccountTypeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE17DC8];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__ICQInternetPrivacyViewModel__fetchAccountTypeWithCompletion___block_invoke;
  v7[3] = &unk_24E3F5570;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestFeatureWithId:completion:", CFSTR("networking.privacy.subscriber"), v7);

}

void __63__ICQInternetPrivacyViewModel__fetchAccountTypeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(v5, "canUse"))
      v7 = 2;
    else
      v7 = 1;
    objc_msgSend(*(id *)(a1 + 32), "setProxyAccountType:", v7);
  }
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "proxyAccountType");
    if (v9 == 1)
    {
      v10 = CFSTR("Free");
    }
    else if (v9 == 2)
    {
      v10 = CFSTR("Subscriber");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%lu)"), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 136315650;
    v12 = "-[ICQInternetPrivacyViewModel _fetchAccountTypeWithCompletion:]_block_invoke";
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "%s: Got account type: %@, error: %@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_refreshServiceStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE6B748];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__ICQInternetPrivacyViewModel__refreshServiceStatusWithCompletion___block_invoke;
  v7[3] = &unk_24E3F5598;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getServiceStatus:completionHandler:", MEMORY[0x24BDAC9B8], v7);

}

void __67__ICQInternetPrivacyViewModel__refreshServiceStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = objc_msgSend(v5, "serviceStatus");
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "PrivacyProxy serviceStatus: %lu error: %@", (uint8_t *)&v10, 0x16u);
  }

  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "networkStatuses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = (uint64_t)v9;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "PrivacyProxy networkStatuses: %@ error: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setProxyServiceStatus:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_refreshOverallStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__10;
  v23[4] = __Block_byref_object_dispose__10;
  v24 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke;
  v20[3] = &unk_24E3F55C0;
  v22 = v23;
  v7 = v5;
  v21 = v7;
  -[ICQInternetPrivacyViewModel _fetchUserTierWithCompletion:](self, "_fetchUserTierWithCompletion:", v20);
  dispatch_group_enter(v7);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_2;
  v17[3] = &unk_24E3F55C0;
  v19 = v23;
  v8 = v7;
  v18 = v8;
  -[ICQInternetPrivacyViewModel _fetchAccountTypeWithCompletion:](self, "_fetchAccountTypeWithCompletion:", v17);
  dispatch_group_enter(v8);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_3;
  v14[3] = &unk_24E3F55C0;
  v16 = v23;
  v9 = v8;
  v15 = v9;
  -[ICQInternetPrivacyViewModel _refreshServiceStatusWithCompletion:](self, "_refreshServiceStatusWithCompletion:", v14);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_4;
  block[3] = &unk_24E3F3C20;
  v12 = v4;
  v13 = v23;
  block[4] = self;
  v10 = v4;
  dispatch_group_notify(v9, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v23, 8);
}

void __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __67__ICQInternetPrivacyViewModel__refreshOverallStatusWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  unint64_t v6;
  const __CFString *v7;
  int v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "proxyAccountType");
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "proxyUserTier") == 2);
    v4 = objc_msgSend(*(id *)(a1 + 32), "_statusForSubscriber");
    v3 = *(void **)(a1 + 32);
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsEnabled:", 0);
    v3 = *(void **)(a1 + 32);
    v4 = 0;
LABEL_5:
    objc_msgSend(v3, "setStatus:", v4);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "setStatus:", 7);
  objc_msgSend(*(id *)(a1 + 32), "setIsEnabled:", 0);
LABEL_7:
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "status") - 1;
    if (v6 > 7)
      v7 = CFSTR("None");
    else
      v7 = off_24E3F55E0[v6];
    v8 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
    v9 = objc_msgSend(*(id *)(a1 + 32), "proxyAccountType");
    if (v9 == 1)
    {
      v10 = CFSTR("Free");
    }
    else if (v9 == 2)
    {
      v10 = CFSTR("Subscriber");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%lu)"), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v15 = v7;
    v16 = 1024;
    v17 = v8;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Refreshed overall status, got status: %@, enabled: %d, account type: %@, error: %@", buf, 0x26u);

  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Fetched user tier and service information upon ICQInternetPrivacyViewModel initiation.", buf, 2u);
  }

}

- (void)_addNetworkOutageBannerTo:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ICQInternetPrivacyBannerModel *v21;
  void *v22;
  void *v23;
  ICQInternetPrivacyBannerModel *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PrivacyProxyServiceStatus networkStatuses](self->_proxyServiceStatus, "networkStatuses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      if (objc_msgSend(v13, "networkType") == 1)
      {
        objc_msgSend(v13, "networkName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    objc_msgSend(v13, "networkName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_13;
  }
  else
  {
LABEL_10:

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNKOWN_NETWORK_NAME"), &stru_24E400750, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_NETWORK_OUTAGE_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v19, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [ICQInternetPrivacyBannerModel alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_NETWORK_OUTAGE_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ICQInternetPrivacyBannerModel initWithTitle:message:buttonTitle:status:networkName:](v21, "initWithTitle:message:buttonTitle:status:networkName:", v23, v20, 0, 0x2000, 0);

  self->_status = 5;
  objc_msgSend(v6, "addObject:", v24);
  v25 = (void *)objc_msgSend(v6, "copy");
  v7[2](v7, v25);

}

- (NSString)navTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)switchTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)onTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_ON"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)offTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_OFF"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)unavailableTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNAVAILABLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)notSupportedTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_NOT_SUPPORTED_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)issueTitle:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ISSUE_COUNT_FORMAT"), &stru_24E400750, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v9 = v8;

  objc_msgSend(v3, "localizedStringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)suggestionTitle:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_COUNT_FORMAT"), &stru_24E400750, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v9 = v8;

  objc_msgSend(v3, "localizedStringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)learnMoreTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)learnMoreButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)learnMoreLinkTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_LINK_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)upgradeTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UPGRADE_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)waitingTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_WAITING_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)explanationTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_EXPLANATION_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)explanationMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_EXPLANATION_SUBSCRIBED_ON_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)explanationButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SET_UP_MATTERHORN_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)privateRelayPausedTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_PAUSED_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)privateRelayPausedMessage
{
  void *v2;
  __CFString *v3;

  if (-[ICQInternetPrivacyViewModel isPaused](self, "isPaused"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PRIVATE_RELAY_PAUSED_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = &stru_24E400750;
  }
  return (NSString *)v3;
}

- (NSString)incompatibleSitesMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_INCOMPATIBLE_SITES_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)pausedPrivateRelayFooter
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PRIVATE_RELAY_IN_SNOOZE_MODE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)IPAddressLocationTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_IPADDRESS_LOCATION_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)IPAddressLocationSettingsTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_IPADDRESS_LOCATION_SETTINGS_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)IPAddressLocationEnabledTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_IPADDRESS_LOCATION_ENABLED_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)IPAddressLocationDisabledTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_IPADDRESS_LOCATION_DISABLED_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)IPAddressLocationEnabledMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_IPADDRESS_LOCATION_ENABLED_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)IPAddressLocationDisabledMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_IPADDRESS_LOCATION_DISABLED_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)unsupportedTurnOffAlertTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_ALERT_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)unsupportedTurnOffAlertTitleFor:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_WIFI_ALERT_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)unsupportedTurnOffCellularAlertTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_CELLULAR_ALERT_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)unsupportedTurnOffWifiAlertMessage
{
  int v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = MGGetBoolAnswer();
  v3 = CFSTR("WIFI");
  if (v2)
    v3 = CFSTR("WLAN");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = v3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_ALERT_%@_MESSAGE"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_24E400750, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)unsupportedTurnOffCellularAlertMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_ALERT_CELLULAR_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)unsupportedTurnOffAlertOk
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_UNSUPPORTED_TURN_OFF_ALERT_OK"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)unsupportedSwitchOffAlertTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
    v6 = CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_IPAD_TITLE");
  else
    v6 = CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_IPHONE_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24E400750, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)unsupportedWifiSwitchOffAlertMessage
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
    v6 = CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_WIFI_IPAD_MESSAGE");
  else
    v6 = CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_WIFI_IPHONE_MESSAGE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24E400750, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)unsupportedCellularSwitchOffAlertMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_CELLULAR_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)unsupportedSwitchOffNetworkOnly
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_NETWORK_ONLY"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)unsupportedSwitchOffProviderOnly
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_PROVIDER_ONLY"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)unsupportedSwitchOffCompletely
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
    v6 = CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_IPAD_COMPLETELY");
  else
    v6 = CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_IPHONE_COMPLETELY");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24E400750, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)unsupportedSwitchOffCancel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SWITCH_OFF_UNSUPPORTED_ALERT_CANCEL"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)switchOffAlertTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
    v6 = CFSTR("INTERNET_PRIVACY_SWITCH_OFF_IPAD_ALERT_TITLE");
  else
    v6 = CFSTR("INTERNET_PRIVACY_SWITCH_OFF_ALERT_TITLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24E400750, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)switchOffAlertPrefPaneTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SWITCH_OFF_MAC_ALERT_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)switchOffAlertMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SWITCH_OFF_ALERT_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)switchOffAlertTurnOff
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SWITCH_OFF_ALERT_TURN_OFF"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)switchOffAlertPause
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_SWITCH_OFF_ALERT_PAUSE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)switchOffAlertLearnMore
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_BUTTON_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)turnOnSafariAlertTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_TURN_ON_SAFARI_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)turnOnSafariAlertMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_TURN_ON_SAFARI_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)turnOnDNSAlertTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_TURN_ON_DNS_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)turnOnDNSAlertMessage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_TURN_ON_DNS_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)internetPrivacyLearnMoreMessage
{
  int v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = MGGetBoolAnswer();
  v3 = CFSTR("WIFI");
  if (v2)
    v3 = CFSTR("WLAN");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = v3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_%@_NETWORK_BODY"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_24E400750, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)privateRelayStatusText
{
  ICQInternetPrivacyViewModel *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = self;
  switch(self->_status)
  {
    case 0uLL:
      -[ICQInternetPrivacyViewModel upgradeTitle](self, "upgradeTitle");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1uLL:
      -[ICQInternetPrivacyViewModel onTitle](self, "onTitle");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2uLL:
      -[ICQInternetPrivacyViewModel offTitle](self, "offTitle");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3uLL:
      -[ICQInternetPrivacyViewModel issueOrSuggestionCount](self, "issueOrSuggestionCount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQInternetPrivacyViewModel issueTitle:](v2, "issueTitle:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4uLL:
      -[ICQInternetPrivacyViewModel issueOrSuggestionCount](self, "issueOrSuggestionCount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQInternetPrivacyViewModel suggestionTitle:](v2, "suggestionTitle:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v2 = (ICQInternetPrivacyViewModel *)v5;

      return (NSString *)v2;
    case 5uLL:
      -[ICQInternetPrivacyViewModel unavailableTitle](self, "unavailableTitle");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 6uLL:
      -[ICQInternetPrivacyViewModel notSupportedTitle](self, "notSupportedTitle");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 7uLL:
      -[ICQInternetPrivacyViewModel waitingTitle](self, "waitingTitle");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 8uLL:
      -[ICQInternetPrivacyViewModel privateRelayPausedTitle](self, "privateRelayPausedTitle");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v2 = (ICQInternetPrivacyViewModel *)v3;
      break;
    default:
      return (NSString *)v2;
  }
  return (NSString *)v2;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)bannerMessageOnMac
{
  return self->_bannerMessageOnMac;
}

- (NSString)explanationPrefPaneMessage
{
  return self->_explanationPrefPaneMessage;
}

- (NSString)IPAddressLocationMacTitle
{
  return self->_IPAddressLocationMacTitle;
}

- (NSString)porcupineOnTitle
{
  return self->_porcupineOnTitle;
}

- (NSString)porcupineOffTitle
{
  return self->_porcupineOffTitle;
}

- (NSString)porcupineUnavailableTitle
{
  return self->_porcupineUnavailableTitle;
}

- (NSString)porcupinePausedTitle
{
  return self->_porcupinePausedTitle;
}

- (NSString)turnOnPorcupineButtonTitle
{
  return self->_turnOnPorcupineButtonTitle;
}

- (NSString)turnOffButtonTitle
{
  return self->_turnOffButtonTitle;
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (NSArray)bannerModels
{
  return self->_bannerModels;
}

- (unint64_t)proxyUserTier
{
  return self->_proxyUserTier;
}

- (void)setProxyUserTier:(unint64_t)a3
{
  self->_proxyUserTier = a3;
}

- (unint64_t)proxyAccountType
{
  return self->_proxyAccountType;
}

- (void)setProxyAccountType:(unint64_t)a3
{
  self->_proxyAccountType = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (BOOL)serviceIsLimited
{
  return self->_serviceIsLimited;
}

- (void)setServiceIsLimited:(BOOL)a3
{
  self->_serviceIsLimited = a3;
}

- (NSNumber)issueOrSuggestionCount
{
  return self->_issueOrSuggestionCount;
}

- (void)setIssueOrSuggestionCount:(id)a3
{
  objc_storeStrong((id *)&self->_issueOrSuggestionCount, a3);
}

- (NSString)wiFiName
{
  return self->_wiFiName;
}

- (void)setWiFiName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)cellularName
{
  return self->_cellularName;
}

- (void)setCellularName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (PrivacyProxyServiceStatus)proxyServiceStatus
{
  return self->_proxyServiceStatus;
}

- (void)setProxyServiceStatus:(id)a3
{
  objc_storeStrong((id *)&self->_proxyServiceStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyServiceStatus, 0);
  objc_storeStrong((id *)&self->_cellularName, 0);
  objc_storeStrong((id *)&self->_wiFiName, 0);
  objc_storeStrong((id *)&self->_issueOrSuggestionCount, 0);
  objc_storeStrong((id *)&self->_bannerModels, 0);
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_storeStrong((id *)&self->_turnOffButtonTitle, 0);
  objc_storeStrong((id *)&self->_turnOnPorcupineButtonTitle, 0);
  objc_storeStrong((id *)&self->_porcupinePausedTitle, 0);
  objc_storeStrong((id *)&self->_porcupineUnavailableTitle, 0);
  objc_storeStrong((id *)&self->_porcupineOffTitle, 0);
  objc_storeStrong((id *)&self->_porcupineOnTitle, 0);
  objc_storeStrong((id *)&self->_IPAddressLocationMacTitle, 0);
  objc_storeStrong((id *)&self->_explanationPrefPaneMessage, 0);
  objc_storeStrong((id *)&self->_bannerMessageOnMac, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_statusStringForPrefPane, 0);
}

- (void)setStatusStringForPrefPane:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F2CC000, log, OS_LOG_TYPE_DEBUG, "Private Relay status string did not change", v1, 2u);
}

@end
