@implementation SiriPresentationViewController

- (void)deviceScreenEngagementController:(id)a3 didGainAttentionWithEvent:(int64_t)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "now", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriPresentationViewController _setEngagementStatus:forType:](self, "_setEngagementStatus:forType:", v6, a4);

  -[AFUISiriViewController didGainAttentionWithEvent:](self->_siriViewController, "didGainAttentionWithEvent:", a4);
}

- (void)_setEngagementStatus:(id)a3 forType:(int64_t)a4
{
  NSMutableDictionary *deviceEngagementTimeStamps;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;
  void *v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  deviceEngagementTimeStamps = self->_deviceEngagementTimeStamps;
  if (deviceEngagementTimeStamps)
  {
    v8 = deviceEngagementTimeStamps;
    v9 = self->_deviceEngagementTimeStamps;
    self->_deviceEngagementTimeStamps = v8;
    v10 = a3;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBCED8];
    v12 = a3;
    objc_msgSend(v11, "dictionary");
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_deviceEngagementTimeStamps;
    self->_deviceEngagementTimeStamps = v13;
  }

  v14 = self->_deviceEngagementTimeStamps;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", a3, v15);

}

- (void)prewarmOrbViewShaders
{
  id v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((AFDeviceSupportsSystemAssistantExperience() & 1) == 0)
  {
    v2 = objc_alloc(MEMORY[0x24BEA85D8]);
    v3 = (void *)objc_msgSend(v2, "initWithFrame:", 0.0, 0.0, *MEMORY[0x24BE09560], *(double *)(MEMORY[0x24BE09560] + 8));
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SiriPresentationViewController(SUIC) prewarmOrbViewShaders]";
      _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s #orbView Creating temporary orbView for prewarming", buf, 0xCu);
    }
    dispatch_get_global_queue(17, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SiriPresentationViewController_SUIC__prewarmOrbViewShaders__block_invoke;
    block[3] = &unk_24D47A450;
    v8 = v3;
    v6 = v3;
    dispatch_async(v5, block);

  }
}

uint64_t __61__SiriPresentationViewController_SUIC__prewarmOrbViewShaders__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(*(id *)(a1 + 32), "prewarmOrb");
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)prewarmMetalLayers
{
  if (AFDeviceSupportsSystemAssistantExperience())
    -[SiriPresentationViewController _prewarmEdgeLightMetalLayers](self, "_prewarmEdgeLightMetalLayers");
  else
    -[SiriPresentationViewController prewarmOrbViewShaders](self, "prewarmOrbViewShaders");
}

- (void)_prewarmEdgeLightMetalLayers
{
  id *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = (id *)MEMORY[0x24BE08FE0];
  v3 = os_signpost_id_generate((os_log_t)*MEMORY[0x24BE08FE0]);
  v4 = *v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_215D55000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SiriPresentationController+SUIC._prewarmEdgeLightMaskMetalLayers", (const char *)&unk_215D74412, buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BEA85C0], "prewarm");
  objc_msgSend(MEMORY[0x24BEA85D0], "prewarm");
  v6 = *v2;
  v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_215D55000, v7, OS_SIGNPOST_INTERVAL_END, v3, "SiriPresentationController+SUIC._prewarmEdgeLightMaskMetalLayers", (const char *)&unk_215D74412, v8, 2u);
  }

}

- (int64_t)preferredFlamesViewFidelity
{
  if ((MGGetBoolAnswer() & 1) != 0)
    return 0;
  MGGetProductType();
  return 2;
}

- (SiriPresentationViewController)initWithIdentifier:(int64_t)a3
{
  return -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:](self, "initWithIdentifier:hostedPresentationFrame:", a3, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

- (SiriPresentationViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4
{
  return -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:displayConfiguration:](self, "initWithIdentifier:hostedPresentationFrame:displayConfiguration:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (SiriPresentationViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4 displayConfiguration:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  SiriPresentationViewController *v13;
  os_log_t *v14;
  uint64_t v15;
  AFUISiriLanguage *language;
  SiriPresentationStateProvider *v17;
  SiriPresentationStateProvider *presentationStateProvider;
  SASHeadphonesAuthenticationManager *v19;
  SASHeadphonesAuthenticationManager *headphonesAuthenticationManager;
  NSObject *v21;
  SASHeadphonesAuthenticationManager *v22;
  uint64_t v23;
  NSDate *lastAppUpdateTimestamp;
  AFQueue *v25;
  AFQueue *testInputQueue;
  void *v27;
  void *v28;
  __CFNotificationCenter *DistributedCenter;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SiriPresentationViewController *v38;
  void *v39;
  dispatch_queue_t v40;
  OS_dispatch_queue *watchdogQueue;
  NSObject *v42;
  NSObject *v43;
  SASUIDeviceScreenEngagementController *v44;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, void *);
  void *v49;
  SiriPresentationViewController *v50;
  id v51;
  objc_super v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  SASHeadphonesAuthenticationManager *v56;
  uint64_t v57;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v57 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  kdebug_trace();
  v52.receiver = self;
  v52.super_class = (Class)SiriPresentationViewController;
  v13 = -[SiriPresentationViewController init](&v52, sel_init);
  v14 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (v13)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE09528]), "initWithDelegate:", v13);
    language = v13->_language;
    v13->_language = (AFUISiriLanguage *)v15;

    -[SiriPresentationViewController _updateLanguageCode](v13, "_updateLanguageCode");
    v13->_presentationStateProcessingLock._os_unfair_lock_opaque = 0;
    if (a3 == 1 || a3 == 4)
    {
      v17 = -[SiriPresentationStateProvider initWithSiriPresentationIdentifier:delegate:]([SiriPresentationStateProvider alloc], "initWithSiriPresentationIdentifier:delegate:", a3, v13);
      presentationStateProvider = v13->_presentationStateProvider;
      v13->_presentationStateProvider = v17;

      if (((a3 == 1) & _os_feature_enabled_impl()) == 1)
      {
        v19 = (SASHeadphonesAuthenticationManager *)objc_alloc_init(MEMORY[0x24BE907D8]);
        headphonesAuthenticationManager = v13->_headphonesAuthenticationManager;
        v13->_headphonesAuthenticationManager = v19;

        v21 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v13->_headphonesAuthenticationManager;
          *(_DWORD *)buf = 136315394;
          v54 = "-[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:displayConfiguration:]";
          v55 = 2112;
          v56 = v22;
          _os_log_impl(&dword_215D55000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation using 🎧 SASHeadphonesAuthenticationManager: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      _os_feature_enabled_impl();
    }
    -[SiriPresentationViewController setHostedPresentationFrame:](v13, "setHostedPresentationFrame:", x, y, width, height);
    objc_storeStrong((id *)&v13->_displayConfiguration, a5);
    v13->_identifier = a3;
    -[SiriPresentationViewController setLock:](v13, "setLock:", 0);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v23 = objc_claimAutoreleasedReturnValue();
    lastAppUpdateTimestamp = v13->_lastAppUpdateTimestamp;
    v13->_lastAppUpdateTimestamp = (NSDate *)v23;

    -[SiriPresentationViewController _setShouldDeferWake:](v13, "_setShouldDeferWake:", 0);
    v25 = (AFQueue *)objc_alloc_init(MEMORY[0x24BE09280]);
    testInputQueue = v13->_testInputQueue;
    v13->_testInputQueue = v25;

    objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addStateChangeListener:", v13);

    +[SiriPresentationViewController _applicationStateHelper](SiriPresentationViewController, "_applicationStateHelper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationViewController setApplicationStateHelper:](v13, "setApplicationStateHelper:", v28);

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v13, (CFNotificationCallback)_AppDataDidChange, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0, CFNotificationSuspensionBehaviorDrop);
    CFNotificationCenterAddObserver(DistributedCenter, v13, (CFNotificationCallback)_AppDataDidChange, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, CFNotificationSuspensionBehaviorDrop);
    v30 = (void *)MEMORY[0x24BE0FA08];
    objc_msgSend(MEMORY[0x24BE907D0], "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "machServiceIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE907D0], "configuration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "identifierForService:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "endpointForMachName:service:instance:", v32, v34, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0FA00], "connectionWithEndpoint:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationViewController setConnection:](v13, "setConnection:", v36);

    objc_initWeak((id *)buf, v13);
    -[SiriPresentationViewController connection](v13, "connection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = MEMORY[0x24BDAC760];
    v47 = 3221225472;
    v48 = __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke;
    v49 = &unk_24D47A728;
    v38 = v13;
    v50 = v38;
    objc_copyWeak(&v51, (id *)buf);
    objc_msgSend(v37, "configureConnection:", &v46);

    -[SiriPresentationViewController connection](v38, "connection", v46, v47, v48, v49);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activate");

    v40 = dispatch_queue_create("Animation Dismissal watchdog queue", 0);
    watchdogQueue = v38->_watchdogQueue;
    v38->_watchdogQueue = (OS_dispatch_queue *)v40;

    dispatch_get_global_queue(-2, 0);
    v42 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v42, &__block_literal_global_71);

    objc_destroyWeak(&v51);
    objc_destroyWeak((id *)buf);

  }
  v43 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:displayConfiguration:]";
    _os_log_impl(&dword_215D55000, v43, OS_LOG_TYPE_DEFAULT, "%s #userAttention Setting up userAttentionController", buf, 0xCu);
  }
  v44 = -[SASUIDeviceScreenEngagementController initWithSamplingInterval:attentionLostTimeout:]([SASUIDeviceScreenEngagementController alloc], "initWithSamplingInterval:attentionLostTimeout:", 1.0, 5.0);
  -[SASUIDeviceScreenEngagementController setDelegate:](v44, "setDelegate:", v13);
  -[SiriPresentationViewController _setDeviceScreenEngagementController:](v13, "_setDeviceScreenEngagementController:", v44);
  -[SiriPresentationViewController _startDeviceScreenEngagementController](v13, "_startDeviceScreenEngagementController");
  kdebug_trace();

  return v13;
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE907E0], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x24BE907E0], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2;
  v9[3] = &unk_24D47A6C0;
  a1 += 40;
  objc_copyWeak(&v10, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v9);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_1);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_66;
  v7[3] = &unk_24D47A6C0;
  objc_copyWeak(&v8, (id *)a1);
  objc_msgSend(v3, "setActivationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "remoteTarget");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90838]), "initWithSiriPresentationIdentifier:", objc_msgSend(WeakRetained, "identifier"));
    objc_msgSend(v13, "unregisterPresentationIdentifier:", v14);

    objc_msgSend(WeakRetained, "presentationStateProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption:", 1);

  }
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_65(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_65_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend(v2, "activate");

}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_66(uint64_t a1, void *a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 275);
    objc_msgSend(v7, "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90838]), "initWithSiriPresentationIdentifier:", -[os_unfair_lock_s identifier](v4, "identifier"));
    objc_msgSend(v5, "registerPresentationIdentifier:", v6);

    os_unfair_lock_unlock(v4 + 275);
    objc_msgSend(*(id *)&v4[316]._os_unfair_lock_opaque, "beginProvidingPresentationStateUpdates");
  }

}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2_69()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForSiriActiveStatus");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v0);

}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DistributedCenter;
  objc_super v5;

  -[SiriPresentationViewController _invalidateCarSiriButtonHoldToTalkTimer](self, "_invalidateCarSiriButtonHoldToTalkTimer");
  objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeStateChangeListener:", self);

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
  CFNotificationCenterRemoveObserver(DistributedCenter, self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
  -[SiriPresentationViewController _stopDeviceScreenEngagement](self, "_stopDeviceScreenEngagement");
  -[SiriPresentationViewController invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)SiriPresentationViewController;
  -[SiriPresentationViewController dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  kdebug_trace();
  -[SiriPresentationViewController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90838]), "initWithSiriPresentationIdentifier:", -[SiriPresentationViewController identifier](self, "identifier"));
  objc_msgSend(v4, "unregisterPresentationIdentifier:", v5);

  -[SiriPresentationViewController connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SiriPresentationViewController presentationStateProvider](self, "presentationStateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption:", 1);

  if (-[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)dismiss
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:", 0, 1);
  -[SiriPresentationViewController dismissWithOptions:](self, "dismissWithOptions:", v3);

}

- (void)dismissWithOptions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id location;

  v4 = a3;
  kdebug_trace();
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v6, &location);
  SiriUIInvokeOnMainQueue();
  -[SiriPresentationViewController presentationDismissalRequestedWithOptions:](self, "presentationDismissalRequestedWithOptions:", v4, v5, 3221225472, __53__SiriPresentationViewController_dismissWithOptions___block_invoke, &unk_24D47A790);
  os_unfair_lock_unlock(&self->_lock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __53__SiriPresentationViewController_dismissWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "hintGlowAssertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315138;
        v7 = "-[SiriPresentationViewController dismissWithOptions:]_block_invoke";
        _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController transition to activating state for a smoother dismissal", (uint8_t *)&v6, 0xCu);
      }
      objc_msgSend(v2, "setCurrentGlowState:", 1);
      objc_msgSend(v2, "hintGlowAssertion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSystemGlowStyle:", 0);

    }
  }

}

- (BOOL)isEnabled
{
  int v2;
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  v2 = _AXSHomeButtonAssistant();
  objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "siriIsSupported"))
  {
    objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "siriIsEnabled");
    if (v2)
      v6 = v5;
    else
      v6 = 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)hasContentAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  void (**v7)(id, uint64_t);
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, uint64_t);

  y = a3.y;
  x = a3.x;
  v7 = (void (**)(id, uint64_t))a4;
  if (-[SiriPresentationViewController _activeTCCHasContentAtPoint:](self, "_activeTCCHasContentAtPoint:", x, y))
  {
    v7[2](v7, 1);
  }
  else
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__SiriPresentationViewController_hasContentAtPoint_completion___block_invoke;
    v9[3] = &unk_24D47A7B8;
    v10 = v7;
    objc_msgSend(v8, "hasContentAtPoint:completion:", v9, x, y);

  }
}

uint64_t __63__SiriPresentationViewController_hasContentAtPoint_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)notePanBeganAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  y = a3.y;
  x = a3.x;
  -[SiriPresentationViewController siriViewController](self, "siriViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__SiriPresentationViewController_notePanBeganAtPoint___block_invoke;
  v8[3] = &unk_24D47A7E0;
  v9 = v6;
  v7 = v6;
  -[SiriPresentationViewController hasContentAtPoint:completion:](self, "hasContentAtPoint:completion:", v8, x, y);

}

uint64_t __54__SiriPresentationViewController_notePanBeganAtPoint___block_invoke(uint64_t a1, int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didDetectGestureEvent:inRegion:", 0, a2 ^ 1u);
}

- (void)noteTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  y = a3.y;
  x = a3.x;
  -[SiriPresentationViewController siriViewController](self, "siriViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__SiriPresentationViewController_noteTapAtPoint___block_invoke;
  v8[3] = &unk_24D47A7E0;
  v9 = v6;
  v7 = v6;
  -[SiriPresentationViewController hasContentAtPoint:completion:](self, "hasContentAtPoint:completion:", v8, x, y);

}

uint64_t __49__SiriPresentationViewController_noteTapAtPoint___block_invoke(uint64_t a1, int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didDetectGestureEvent:inRegion:", 1, a2 ^ 1u);
}

- (void)animatedAppearanceWithFactory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id v11;
  id v12[5];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
  {
    objc_initWeak(&location, self);
    v12[1] = (id)MEMORY[0x24BDAC760];
    v12[2] = (id)3221225472;
    v12[3] = __75__SiriPresentationViewController_animatedAppearanceWithFactory_completion___block_invoke;
    v12[4] = &unk_24D47A808;
    v8 = &v15;
    objc_copyWeak(&v15, &location);
    v13 = v6;
    v14 = v7;
    SiriUIInvokeOnMainQueue();

    v9 = v13;
LABEL_5:

    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
    goto LABEL_6;
  }
  if (self->_siriSetupViewController)
  {
    objc_initWeak(&location, self);
    v8 = v12;
    objc_copyWeak(v12, &location);
    v10 = v6;
    v11 = v7;
    SiriUIInvokeOnMainQueue();

    v9 = v10;
    goto LABEL_5;
  }
  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_6:

}

void __75__SiriPresentationViewController_animatedAppearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  BOOL v4;
  void *v5;
  int v6;
  id *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 155);
    v4 = v3 == 4 || v3 == 8;
    v7 = (id *)WeakRetained;
    if (v4
      || (objc_msgSend(*((id *)WeakRetained + 164), "currentRequestOptions"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isTypeToSiriRequest"),
          v5,
          v6))
    {
      objc_msgSend(v7, "_requestHomeAffordanceSuppression:", 0);
    }
    else if (v7[155] == (id)7)
    {
      objc_msgSend(v7, "_requestHomeAffordanceSuppression:", 2);
    }
    objc_msgSend(v7[164], "animatedAppearanceWithFactory:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v7;
  }

}

void __75__SiriPresentationViewController_animatedAppearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_requestHomeAffordanceSuppression:", 1);
    objc_msgSend(v3[165], "animatedAppearanceWithFactory:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)animatedDisappearanceWithFactory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v10, &location);
    v8 = v6;
    v9 = v7;
    SiriUIInvokeOnMainQueue();

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __78__SiriPresentationViewController_animatedDisappearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_tearDownSiriEffectsViewController");
    objc_msgSend(v3[164], "animatedDisappearanceWithFactory:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)aggregateLockStateDidChange
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[SiriPresentationViewController aggregateLockStateDidChange]";
    _os_log_impl(&dword_215D55000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (AFUISiriSAEEffectsViewController)siriEffectsViewController
{
  AFUISiriSAEEffectsViewController *siriEffectsViewController;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  AFUISiriSAEEffectsViewController *v14;
  AFUISiriSAEEffectsViewController *v15;

  siriEffectsViewController = self->_siriEffectsViewController;
  if (!siriEffectsViewController)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
      -[SiriPresentationViewController siriEffectsViewController].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    -[SiriPresentationViewController _updateHostedPresentationFrame](self, "_updateHostedPresentationFrame");
    v12 = objc_alloc(MEMORY[0x24BE09530]);
    -[SiriPresentationViewController _viewHostingInstrumentationHandler](self, "_viewHostingInstrumentationHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (AFUISiriSAEEffectsViewController *)objc_msgSend(v12, "initWithInstrumentationHandler:", v13);
    v15 = self->_siriEffectsViewController;
    self->_siriEffectsViewController = v14;

    siriEffectsViewController = self->_siriEffectsViewController;
  }
  return siriEffectsViewController;
}

- (void)didPresentLocationTCC:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *activeTCCs;
  NSMutableSet *v7;
  NSMutableSet *v8;

  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    -[SiriPresentationViewController didPresentLocationTCC:].cold.1(v5);
  activeTCCs = self->_activeTCCs;
  if (!activeTCCs)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v8 = self->_activeTCCs;
    self->_activeTCCs = v7;

    activeTCCs = self->_activeTCCs;
  }
  -[NSMutableSet addObject:](activeTCCs, "addObject:", v4);

}

- (void)didDismissLocationTCC:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    -[SiriPresentationViewController didDismissLocationTCC:].cold.1(v5);
  -[NSMutableSet removeObject:](self->_activeTCCs, "removeObject:", v4);

}

- (BOOL)_activeTCCHasContentAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = -[NSMutableSet count](self->_activeTCCs, "count");
  if (v6)
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "coordinateSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_activeTCCs);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "alertController", (_QWORD)v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v11, x, y);
          objc_msgSend(v17, "hitTest:withEvent:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            LOBYTE(v13) = 1;
            goto LABEL_12;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v13) = 0;
  }
  v19 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    -[SiriPresentationViewController _activeTCCHasContentAtPoint:].cold.1(v13, v6, v19);
  return v13;
}

- (void)ping
{
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SiriPresentationViewController ping]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #pingpong received ping", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v4, (id *)buf);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak((id *)buf);
}

void __38__SiriPresentationViewController_ping__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriPresentationViewController ping]_block_invoke";
    _os_log_impl(&dword_215D55000, v2, OS_LOG_TYPE_DEFAULT, "%s #pingpong on main thread", (uint8_t *)&v4, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setupPongTimer");

}

- (BOOL)presentationisIdleAndQuiet
{
  return self->_isIdleAndQuiet;
}

- (void)activateHintGlow
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __50__SiriPresentationViewController_activateHintGlow__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject **v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 32), "_canShowHintGlow"))
  {
    v3 = (NSObject **)MEMORY[0x24BE08FB0];
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SiriPresentationViewController activateHintGlow]_block_invoke";
      _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController can activate hint glow", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "siriPresentationControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = *v3;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[SiriPresentationViewController activateHintGlow]_block_invoke";
        _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController will setup shockwave with button invocation", buf, 0xCu);
      }
      objc_msgSend(WeakRetained, "setCurrentEffectsViewPresentationState:", 1);
      objc_msgSend(WeakRetained, "siriEffectsViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __50__SiriPresentationViewController_activateHintGlow__block_invoke_88;
      v8[3] = &unk_24D47A858;
      v8[4] = WeakRetained;
      objc_msgSend(v5, "siriPresentation:requestsPresentationOfEffectsViewController:withHandler:", WeakRetained, v7, v8);

    }
  }

}

void __50__SiriPresentationViewController_activateHintGlow__block_invoke_88(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = (os_log_t *)MEMORY[0x24BE08FB0];
    v8 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "siriEffectsViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "siriEffectsViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v25 = "-[SiriPresentationViewController activateHintGlow]_block_invoke";
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_215D55000, v10, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController presented effects VC: %@ success, effect's view's window: %@. Now request hint glow activating", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setCurrentEffectsViewPresentationState:", 2);
    objc_msgSend(MEMORY[0x24BEB0A70], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __50__SiriPresentationViewController_activateHintGlow__block_invoke_90;
    v23[3] = &unk_24D47A830;
    v23[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v15, "requestSystemGlowEffectWithInitialStyle:completion:", 0, v23);

    v16 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(a1 + 32);
      v18 = v16;
      objc_msgSend(v17, "siriEffectsViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = "-[SiriPresentationViewController activateHintGlow]_block_invoke_3";
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_215D55000, v18, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController setup effects VC: %@ with button invocation.", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "siriEffectsViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setupShockwaveIsButtonInvocation:", 1);

    v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[SiriPresentationViewController activateHintGlow]_block_invoke";
      _os_log_impl(&dword_215D55000, v21, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController start shockwave hint state", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "siriEffectsViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "startShockWaveHintState");

  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentEffectsViewPresentationState:", 0);
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __50__SiriPresentationViewController_activateHintGlow__block_invoke_88_cold_1();
  }

}

void __50__SiriPresentationViewController_activateHintGlow__block_invoke_90(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  SiriUIInvokeOnMainQueue();

}

uint64_t __50__SiriPresentationViewController_activateHintGlow__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentGlowState:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setHintGlowAssertion:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_canShowHintGlow
{
  _BOOL4 v3;

  v3 = -[SiriPresentationViewController _isSpringBoardMainScreenPresentation](self, "_isSpringBoardMainScreenPresentation");
  if (v3)
    LOBYTE(v3) = -[SiriPresentationViewController currentEffectsViewPresentationState](self, "currentEffectsViewPresentationState") == 0;
  return v3;
}

- (void)cancelActivatedHintGlow
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __57__SiriPresentationViewController_cancelActivatedHintGlow__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315138;
      v4 = "-[SiriPresentationViewController cancelActivatedHintGlow]_block_invoke";
      _os_log_impl(&dword_215D55000, v2, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController cancel hint glow activation", (uint8_t *)&v3, 0xCu);
    }
    objc_msgSend(WeakRetained, "_invalidateHintGlowAssertion");
    objc_msgSend(WeakRetained, "_tearDownSiriEffectsViewController");
  }

}

- (void)presentationRequestedWithPresentationOptions:(id)a3 requestOptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  kdebug_trace();
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  v8 = v6;
  v9 = v7;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __94__SiriPresentationViewController_presentationRequestedWithPresentationOptions_requestOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (objc_msgSend(WeakRetained, "_shouldProceedPresentingSiriViewController"))
    {
      objc_msgSend(v6, "_presentationRequestedWithPresentationOptions:requestOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v6, "_invalidateHintGlowAssertion");
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.siri.activation"), 1, &unk_24D47F380);
      objc_msgSend(v6, "connection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "remoteTarget");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "failedToPresentSiriWithError:", v3);

    }
    WeakRetained = v6;
  }

}

- (double)hintGlowPresentedDelayIntervalInMs
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.siri.internal"));
  objc_msgSend(v2, "valueForKey:", CFSTR("HintGlowPresentedDelayInMs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 15.0;
  }

  return v5;
}

- (void)_invalidateHintGlowAssertion
{
  SBSHardwareButtonSystemGlowStyleControlling *hintGlowAssertion;

  if (self->_currentGlowState != 2)
  {
    self->_currentGlowState = 0;
    -[SBSHardwareButtonSystemGlowStyleControlling invalidate](self->_hintGlowAssertion, "invalidate");
    hintGlowAssertion = self->_hintGlowAssertion;
    self->_hintGlowAssertion = 0;

  }
}

- (BOOL)_isSpringBoardMainScreenPresentation
{
  return -[SiriPresentationViewController identifier](self, "identifier") == 1;
}

- (void)_presentationRequestedWithPresentationOptions:(id)a3 requestOptions:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  kdebug_trace();
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[SiriPresentationViewController _presentationRequestedWithPresentationOptions:requestOptions:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation presentationRequestedWithPresentationOptions:%@ requestOptions:%@", (uint8_t *)&v15, 0x20u);
  }
  v10 = objc_msgSend(v6, "wakeScreen") ^ 1;
  v11 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[SiriPresentationViewController _presentationRequestedWithPresentationOptions:requestOptions:]";
    v17 = 1024;
    LODWORD(v18) = v10;
    _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation Setting screen off during activation: %{BOOL}i", (uint8_t *)&v15, 0x12u);
  }
  -[SiriPresentationViewController _setScreenOffDuringActivation:](self, "_setScreenOffDuringActivation:", v10);
  -[SiriPresentationViewController setCurrentLockState:](self, "setCurrentLockState:", objc_msgSend(v7, "currentLockState"));
  -[SiriPresentationViewController _processIncomingRequestOptionsForTestingPayload:](self, "_processIncomingRequestOptionsForTestingPayload:", v7);
  v12 = -[SiriPresentationViewController _shouldShowSetupViewController](self, "_shouldShowSetupViewController");
  v13 = *v8;
  v14 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = 136315138;
      v16 = "-[SiriPresentationViewController _presentationRequestedWithPresentationOptions:requestOptions:]";
      _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation showing setup view controller", (uint8_t *)&v15, 0xCu);
    }
    -[SiriPresentationViewController _showSetupViewControllerIfNecessary](self, "_showSetupViewControllerIfNecessary");
  }
  else
  {
    if (v14)
    {
      v15 = 136315138;
      v16 = "-[SiriPresentationViewController _presentationRequestedWithPresentationOptions:requestOptions:]";
      _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation presenting Siri view controller and effects", (uint8_t *)&v15, 0xCu);
    }
    -[SiriPresentationViewController _removeSetupViewControllerIfNecessary](self, "_removeSetupViewControllerIfNecessary");
    -[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:](self, "_presentSiriViewControllerWithPresentationOptions:requestOptions:", v6, v7);
    -[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:](self, "_presentSiriEffectsWithRequestOptions:", v7);
  }
  kdebug_trace();

}

- (void)_presentSiriEffectsWithRequestOptions:(id)a3
{
  id v4;
  uint64_t v5;
  os_log_t *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  int64_t v21;
  double v22;
  dispatch_time_t v23;
  _QWORD block[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[SiriPresentationViewController _canPresentSiriEffectsViewControllerWithRequestOptions:](self, "_canPresentSiriEffectsViewControllerWithRequestOptions:", v4))
  {
    v5 = objc_msgSend(v4, "requestSource");
    v6 = (os_log_t *)MEMORY[0x24BE08FB0];
    v7 = (void *)*MEMORY[0x24BE08FB0];
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
    if (v5 == 2)
    {
      if (v8)
      {
        v9 = v7;
        *(_DWORD *)buf = 136315394;
        v27 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]";
        v28 = 2048;
        v29 = -[SiriPresentationViewController currentEffectsViewPresentationState](self, "currentEffectsViewPresentationState");
        _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController #activation will present siri effects VC, current view presentation state: %ld", buf, 0x16u);

      }
      v10 = -[SiriPresentationViewController currentEffectsViewPresentationState](self, "currentEffectsViewPresentationState");
      v11 = *v6;
      v12 = os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]";
          _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController #activation transition to animating state for effects VC", buf, 0xCu);
        }
        -[SiriPresentationViewController siriEffectsViewController](self, "siriEffectsViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "transitionToAnimatingState");

      }
      else
      {
        if (v12)
        {
          *(_DWORD *)buf = 136315138;
          v27 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]";
          _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController #activation transition to animating state for effects VC", buf, 0xCu);
        }
        -[SiriPresentationViewController _requestPresentationOfEffectsVCForButtonInvocation:](self, "_requestPresentationOfEffectsVCForButtonInvocation:", 1);
      }
    }
    else
    {
      if (v8)
      {
        v14 = v7;
        -[SiriPresentationViewController siriEffectsViewController](self, "siriEffectsViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriPresentationViewController siriEffectsViewController](self, "siriEffectsViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "window");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v27 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]";
        v28 = 2112;
        v29 = (int64_t)v15;
        v30 = 2112;
        v31 = v18;
        v32 = 2048;
        v33 = -[SiriPresentationViewController currentEffectsViewPresentationState](self, "currentEffectsViewPresentationState");
        _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController #activation will play shockwave directly, effectsVC: %@, window: %@, currentEffectsViewPresentationState = %ld", buf, 0x2Au);

      }
      -[SiriPresentationViewController _requestPresentationOfEffectsVCForButtonInvocation:](self, "_requestPresentationOfEffectsVCForButtonInvocation:", 0);
    }
    v19 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      -[SiriPresentationViewController hintGlowPresentedDelayIntervalInMs](self, "hintGlowPresentedDelayIntervalInMs");
      *(_DWORD *)buf = 136315394;
      v27 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]";
      v28 = 2048;
      v29 = v21;
      _os_log_impl(&dword_215D55000, v20, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController delaying %lf ms for hint glow presented state.", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    -[SiriPresentationViewController hintGlowPresentedDelayIntervalInMs](self, "hintGlowPresentedDelayIntervalInMs");
    v23 = dispatch_time(0, (uint64_t)(v22 / 1000.0 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke;
    block[3] = &unk_24D47A790;
    objc_copyWeak(&v25, (id *)buf);
    dispatch_after(v23, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

}

void __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[161];
    v4 = *MEMORY[0x24BE08FB0];
    v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)buf = 136315138;
        v9 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]_block_invoke_3";
        _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController transition to glow presented from activating state", buf, 0xCu);
      }
      *((_QWORD *)v2 + 162) = 2;
      objc_msgSend(*((id *)v2 + 161), "setSystemGlowStyle:", 1);
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 136315138;
        v9 = "-[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:]_block_invoke";
        _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController transition to hint glow presented directly because Siri is already presented", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BEB0A70], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke_100;
      v7[3] = &unk_24D47A830;
      v7[4] = v2;
      objc_msgSend(v6, "requestSystemGlowEffectWithInitialStyle:completion:", 1, v7);

    }
  }

}

void __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke_100(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  SiriUIInvokeOnMainQueue();

}

uint64_t __72__SiriPresentationViewController__presentSiriEffectsWithRequestOptions___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentGlowState:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "setHintGlowAssertion:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_canPresentSiriEffectsViewControllerWithRequestOptions:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (!-[SiriPresentationViewController _isSpringBoardMainScreenPresentation](self, "_isSpringBoardMainScreenPresentation")|| (objc_msgSend(v4, "isForUIFree") & 1) != 0|| (objc_msgSend(v4, "isTypeToSiriRequest") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = AFDeviceSupportsSystemAssistantExperience();
  }

  return v5;
}

- (void)_requestPresentationOfEffectsVCForButtonInvocation:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  id location;

  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[SiriPresentationViewController setCurrentEffectsViewPresentationState:](self, "setCurrentEffectsViewPresentationState:", 1);
    -[SiriPresentationViewController siriEffectsViewController](self, "siriEffectsViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __85__SiriPresentationViewController__requestPresentationOfEffectsVCForButtonInvocation___block_invoke;
    v7[3] = &unk_24D47A8A8;
    objc_copyWeak(&v8, &location);
    v9 = a3;
    objc_msgSend(v5, "siriPresentation:requestsPresentationOfEffectsViewController:withHandler:", self, v6, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __85__SiriPresentationViewController__requestPresentationOfEffectsVCForButtonInvocation___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "setCurrentEffectsViewPresentationState:", 2);
      v8 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(unsigned __int8 *)(a1 + 40);
        v14 = 136315394;
        v15 = "-[SiriPresentationViewController _requestPresentationOfEffectsVCForButtonInvocation:]_block_invoke";
        v16 = 1024;
        v17 = v9;
        _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController play the shockwave but skip hint state, isButtonInvocation: %d.", (uint8_t *)&v14, 0x12u);
      }
      objc_msgSend(v7, "siriViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "siriEffectsViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEdgeLightViewProvider:", v11);

      objc_msgSend(v7, "siriEffectsViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setupShockwaveIsButtonInvocation:", *(unsigned __int8 *)(a1 + 40));

      objc_msgSend(v7, "siriEffectsViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "playShockWaveSkipHintState");

    }
    else if (v5)
    {
      objc_msgSend(WeakRetained, "setCurrentEffectsViewPresentationState:", 0);
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __85__SiriPresentationViewController__requestPresentationOfEffectsVCForButtonInvocation___block_invoke_cold_1();
    }
  }

}

- (void)_tearDownSiriEffectsViewController
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id location;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[SiriPresentationViewController _isSpringBoardMainScreenPresentation](self, "_isSpringBoardMainScreenPresentation");
  -[AFUISiriSAEEffectsViewController view](self->_siriEffectsViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 0;
  else
    v6 = -[SiriPresentationViewController currentEffectsViewPresentationState](self, "currentEffectsViewPresentationState") == 0;

  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SiriPresentationViewController _tearDownSiriEffectsViewController]";
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #SiriPresentationViewController called _tearDownSiriEffectsViewController", buf, 0xCu);
  }
  if (v6 || !v3)
  {
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[SiriPresentationViewController _tearDownSiriEffectsViewController]";
      _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s #SiriPresentationViewController don't need to request dismiss of effects VC and set siriEffectsVC to nil", buf, 0xCu);
    }
    -[SiriPresentationViewController setSiriEffectsViewController:](self, "setSiriEffectsViewController:", 0);
  }
  else
  {
    -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, self);
      v11 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[SiriPresentationViewController _tearDownSiriEffectsViewController]";
        _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s #SiriPresentationViewController perform tear down of effects VC", buf, 0xCu);
      }
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke;
      v12[3] = &unk_24D47A8D0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v10, "siriPresentation:requestsDismissalOfEffectsViewControllerWithHandler:", self, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
}

void __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  os_log_t *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (os_log_t *)MEMORY[0x24BE08FB0];
    if (v4 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke_cold_1();
    v7 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[SiriPresentationViewController _tearDownSiriEffectsViewController]_block_invoke";
      _os_log_impl(&dword_215D55000, v7, OS_LOG_TYPE_DEFAULT, "%s #SiriPresentationViewController setting siriEffectsVC to nil after dismissal of effects window", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(WeakRetained, "setCurrentEffectsViewPresentationState:", 0);
    objc_msgSend(WeakRetained, "setSiriEffectsViewController:", 0);
  }

}

- (BOOL)_shouldShowSetupViewController
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantIsEnabled") ^ 1;

  return v3;
}

- (void)wakeScreenAfterActivationWithReason:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[SiriPresentationViewController _wasScreenOffDuringActivation](self, "_wasScreenOffDuringActivation");
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v20 = "-[SiriPresentationViewController wakeScreenAfterActivationWithReason:]";
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_215D55000, v7, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Wake Screen was requested when _wasScreenOffDuringActivation was %@ and _shouldDeferOSiriActWake was %@", buf, 0x20u);

  }
  if (-[SiriPresentationViewController _wasScreenOffDuringActivation](self, "_wasScreenOffDuringActivation"))
  {
    -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_254E174C0);

    if (v11)
    {
      -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[SiriPresentationViewController wakeScreenAfterActivationWithReason:]";
        _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Asking presentationControllerDelegate to wake screen", buf, 0xCu);
      }
      objc_msgSend(v12, "screenWakeRequested");
      -[SiriPresentationViewController _analytics](self, "_analytics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("reason");
      v18 = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logEventWithType:context:", 1930, v15);

    }
  }
  else
  {
    v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[SiriPresentationViewController wakeScreenAfterActivationWithReason:]";
      _os_log_impl(&dword_215D55000, v16, OS_LOG_TYPE_DEFAULT, "%s #SiriPocketStateManager: Tried to turn the screen on but it wasn't kept off at activation.", buf, 0xCu);
    }
  }

}

- (void)deviceWonMyriadElection
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriPresentationViewController deviceWonMyriadElection]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Device won myriad Election, hiding VoiceActivationMAskView", (uint8_t *)&v4, 0xCu);
  }
  -[AFUISiriViewController hideVoiceActivationMaskViewIfNecessary](self->_siriViewController, "hideVoiceActivationMaskViewIfNecessary");
}

- (void)activationDeterminedShouldDeferWake:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SiriPresentationViewController _setShouldDeferWake:](self, "_setShouldDeferWake:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "BOOLValue");
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[SiriPresentationViewController activationDeterminedShouldDeferWake:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Pocket determined should cancel screen wake - %@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)_updateHostedPresentationFrame
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  int v4[6];
  CGRect v5;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "hostedPresentationFrame");
  NSStringFromCGRect(v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_215D55000, v1, v3, "%s PresentationViewController created without specifying a presentation frame, falling back to %@", (uint8_t *)v4);

  OUTLINED_FUNCTION_5();
}

- (void)_presentSiriViewControllerWithPresentationOptions:(id)a3 requestOptions:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  os_log_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  _BOOL8 v21;
  uint64_t v22;
  id v23;
  void *v24;
  int v25;
  NSObject *v26;
  AFUISiriViewController *siriViewController;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id location;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  kdebug_trace();
  -[SiriPresentationViewController _prepareSiriViewControllerWithRequestOptions:](self, "_prepareSiriViewControllerWithRequestOptions:", v7);
  if (objc_msgSend(v7, "isForUIFree"))
  {
    v8 = (os_log_t *)MEMORY[0x24BE08FB0];
    v9 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v7, "uiPresentationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v37 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
      v38 = 2112;
      v39 = (uint64_t)v11;
      _os_log_impl(&dword_215D55000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation Not requesting presentation for %@, handling request directly", buf, 0x16u);

    }
    v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)MEMORY[0x24BDD17F0];
      v14 = v12;
      objc_msgSend(v13, "currentThread");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "qualityOfService");
      *(_DWORD *)buf = 136315394;
      v37 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
      v38 = 2048;
      v39 = v16;
      _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);

    }
    os_unfair_lock_lock(&self->_presentationStateProcessingLock);
    v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
      _os_log_impl(&dword_215D55000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock successfully locked", buf, 0xCu);
    }
    -[SiriPresentationViewController setPresentationState:](self, "setPresentationState:", 3);
    os_unfair_lock_unlock(&self->_presentationStateProcessingLock);
    v18 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
      _os_log_impl(&dword_215D55000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock unlocked", buf, 0xCu);
    }
    v19 = objc_msgSend(v7, "requestSource");
    v21 = v19 == 40 || v19 == 37;
    -[SiriPresentationViewController _updateAnnouncementRequestsPermittedWhilePresentationActive:](self, "_updateAnnouncementRequestsPermittedWhilePresentationActive:", v21);
    -[SiriPresentationViewController _showPresentationAndActivateWithRequestOptions:](self, "_showPresentationAndActivateWithRequestOptions:", v7);
    -[SiriPresentationViewController _presentationRequestedHandlerWithRequestOptions:](self, "_presentationRequestedHandlerWithRequestOptions:", v7);
  }
  else
  {
    objc_initWeak(&location, self);
    v22 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke;
    v32[3] = &unk_24D47A920;
    objc_copyWeak(&v34, &location);
    v23 = v7;
    v33 = v23;
    -[SiriPresentationViewController _requestPresentationWithOptions:completion:](self, "_requestPresentationWithOptions:completion:", v6, v32);
    objc_msgSend(v23, "requestInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "requiresUserInteraction");

    if (v25 && (objc_msgSend(v23, "currentLockState") & 2) != 0)
    {
      v26 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]";
        _os_log_impl(&dword_215D55000, v26, OS_LOG_TYPE_DEFAULT, "%s #activation Device is locked during handoff; presenting passcode unlock screen.",
          buf,
          0xCu);
      }
      objc_initWeak((id *)buf, self);
      siriViewController = self->_siriViewController;
      objc_msgSend(v23, "requestInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v22;
      v29[1] = 3221225472;
      v29[2] = __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke_198;
      v29[3] = &unk_24D47A948;
      objc_copyWeak(&v31, (id *)buf);
      v30 = v23;
      -[AFUISiriViewController showPasscodeUnlockScreenForRequest:unlockCompletion:](siriViewController, "showPasscodeUnlockScreenForRequest:unlockCompletion:", v28, v29);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[SiriPresentationViewController _showPresentationAndActivateWithRequestOptions:](self, "_showPresentationAndActivateWithRequestOptions:", v23);
    }

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  kdebug_trace();

}

void __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;

  v5 = a3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v5;
  v9 = a2;
  v7 = *(id *)(a1 + 32);
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v8);
}

void __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_7;
  if (!*((_BYTE *)WeakRetained + 1094))
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]_block_invoke_2";
      _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Waking screen", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(v3, "wakeScreenAfterActivationWithReason:", CFSTR("MyriadUI"));
  }
  if (!*(_QWORD *)(a1 + 32) && *(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "_presentationRequestedHandlerWithRequestOptions:", *(_QWORD *)(a1 + 40));
  }
  else
  {
LABEL_7:
    objc_msgSend(v3, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v6, "failedToPresentSiriWithError:");
    }
    else
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.siri.activation"), 1, &unk_24D47F3A8);
      objc_msgSend(v7, "failedToPresentSiriWithError:", v8);

    }
  }

}

void __99__SiriPresentationViewController__presentSiriViewControllerWithPresentationOptions_requestOptions___block_invoke_198(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = *MEMORY[0x24BE08FB0];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v6)
      {
        v8 = 136315394;
        v9 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]_block_invoke";
        v10 = 2048;
        v11 = a2;
        _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation Device unlock aborted with result = %ld", (uint8_t *)&v8, 0x16u);
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 1, 14);
      objc_msgSend(WeakRetained, "dismissWithOptions:", v7);

    }
    else
    {
      if (v6)
      {
        v8 = 136315138;
        v9 = "-[SiriPresentationViewController _presentSiriViewControllerWithPresentationOptions:requestOptions:]_block_invoke";
        _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation Device is now unlocked; proceeding with the handoff request.",
          (uint8_t *)&v8,
          0xCu);
      }
      objc_msgSend(WeakRetained, "_showPresentationAndActivateWithRequestOptions:", *(_QWORD *)(a1 + 32));
    }
  }

}

- (void)_startDeviceScreenEngagementController
{
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = _os_feature_enabled_impl();
  v4 = *MEMORY[0x24BE08FB0];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[SiriPresentationViewController _startDeviceScreenEngagementController]";
      _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s #userAttention Starting device screen engagement", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    -[SiriPresentationViewController _deviceScreenEngagementController](self, "_deviceScreenEngagementController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC9B8];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__SiriPresentationViewController__startDeviceScreenEngagementController__block_invoke;
    v8[3] = &unk_24D47A970;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v6, "startIfNeededForTypes:completionQueue:completion:", 10, MEMORY[0x24BDAC9B8], v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else if (v5)
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SiriPresentationViewController _startDeviceScreenEngagementController]";
    _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s #modes Response framework is not enabled.", buf, 0xCu);
  }
}

void __72__SiriPresentationViewController__startDeviceScreenEngagementController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __72__SiriPresentationViewController__startDeviceScreenEngagementController__block_invoke_cold_1(a1, v4, (uint64_t)v3);
  }

}

- (void)_stopDeviceScreenEngagement
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136315650;
  v5 = "-[SiriPresentationViewController _stopDeviceScreenEngagement]";
  v6 = 2114;
  v7 = v3;
  v8 = 2114;
  v9 = a2;
  OUTLINED_FUNCTION_9(&dword_215D55000, a3, (uint64_t)a3, "%s #userAttention Failed to stop device screen engagement: %{public}@, error: %{public}@", (uint8_t *)&v4);
}

- (void)deviceScreenEngagementController:(id)a3 didLoseAttentionWithEvent:(int64_t)a4
{
  -[AFUISiriViewController didLoseAttentionWithEvent:](self->_siriViewController, "didLoseAttentionWithEvent:", a4);
}

- (void)_requestPresentationWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SiriPresentationViewController _updateAnnouncementRequestsPermittedWhilePresentationActive:](self, "_updateAnnouncementRequestsPermittedWhilePresentationActive:", 0);
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x24BDD17F0];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]";
    v27 = 2048;
    v28 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->_presentationStateProcessingLock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]";
    _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock successfully locked", buf, 0xCu);
  }
  -[SiriPresentationViewController setPresentationState:](self, "setPresentationState:", 1);
  os_unfair_lock_unlock(&self->_presentationStateProcessingLock);
  v14 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]";
    _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy self->_presentationStateProcessingLock unlocked", buf, 0xCu);
  }
  v15 = objc_alloc(MEMORY[0x24BE907F0]);
  v16 = objc_msgSend(v6, "requestSource");
  -[SiriPresentationViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithRequestSource:uiPresentationIdentifier:", v16, v17);

  -[SiriPresentationViewController siriViewController](self, "siriViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "siriWillBePresented:", objc_msgSend(v18, "requestSource"));
  objc_initWeak((id *)buf, self);
  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__SiriPresentationViewController__requestPresentationWithOptions_completion___block_invoke;
  v22[3] = &unk_24D47A998;
  objc_copyWeak(&v24, (id *)buf);
  v22[4] = self;
  v21 = v7;
  v23 = v21;
  objc_msgSend(v20, "siriPresentation:requestsPresentationWithOptions:withHandler:", self, v6, v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

void __77__SiriPresentationViewController__requestPresentationWithOptions_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  os_unfair_lock_s *WeakRetained;
  os_log_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = (os_log_t *)MEMORY[0x24BE08FB0];
    v8 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x24BDD17F0];
      v10 = v8;
      objc_msgSend(v9, "currentThread");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315394;
      v19 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]_block_invoke";
      v20 = 2048;
      v21 = objc_msgSend(v11, "qualityOfService");
      _os_log_impl(&dword_215D55000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock about to lock with qos: %zd", (uint8_t *)&v18, 0x16u);

    }
    os_unfair_lock_lock(WeakRetained + 266);
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]_block_invoke";
      _os_log_impl(&dword_215D55000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock successfully locked", (uint8_t *)&v18, 0xCu);
    }
    if (v5 || !a2)
    {
      -[os_unfair_lock_s setPresentationState:](WeakRetained, "setPresentationState:", 6);
      os_unfair_lock_unlock(WeakRetained + 266);
      v14 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]_block_invoke";
        _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock unlocked", (uint8_t *)&v18, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "_uiPresentationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.siri.Compact"));

      if (v16)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:", 0, 0, 11, 59);
        -[os_unfair_lock_s dismissWithOptions:](WeakRetained, "dismissWithOptions:", v17);

      }
    }
    else
    {
      -[os_unfair_lock_s setPresentationState:](WeakRetained, "setPresentationState:", 2);
      os_unfair_lock_unlock(WeakRetained + 266);
      v13 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[SiriPresentationViewController _requestPresentationWithOptions:completion:]_block_invoke";
        _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock unlocked", (uint8_t *)&v18, 0xCu);
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_updateAnnouncementRequestsPermittedWhilePresentationActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnnouncementRequestsPermittedWhilePresentationActive:", v3);

  }
}

- (id)_createPresentationPropertiesWithRequestOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "requestSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x24BE094F0]);

  objc_msgSend(v3, "requestInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "activationEvent");
  if (v7 == 9 || v7 == 6)
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE094F8]);
  return v4;
}

- (void)_showPresentationAndActivateWithRequestOptions:(id)a3
{
  id v4;
  AFUISiriViewController *siriViewController;
  void *v6;
  id v7;

  v4 = a3;
  -[SiriPresentationViewController _createPresentationPropertiesWithRequestOptions:](self, "_createPresentationPropertiesWithRequestOptions:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  siriViewController = self->_siriViewController;
  objc_msgSend(v4, "uiPresentationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUISiriViewController showPresentationWithIdentifier:properties:lockState:](siriViewController, "showPresentationWithIdentifier:properties:lockState:", v6, v7, -[SiriPresentationViewController currentLockState](self, "currentLockState"));

  -[SiriPresentationViewController activateWithRequestOptions:](self, "activateWithRequestOptions:", v4);
  self->_activationHandled = 1;

}

- (BOOL)_shouldProceedPresentingSiriViewController
{
  NSTimer *clearSiriViewControllerTimer;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  clearSiriViewControllerTimer = self->_clearSiriViewControllerTimer;
  if (clearSiriViewControllerTimer)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SiriPresentationViewController _shouldProceedPresentingSiriViewController].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return clearSiriViewControllerTimer == 0;
}

- (void)_prepareSiriViewControllerWithRequestOptions:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  AFUISiriViewController *v18;
  AFUISiriViewController *siriViewController;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  __CFString *v55;
  id v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[4];
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  -[SiriPresentationViewController _updateHostedPresentationFrame](self, "_updateHostedPresentationFrame");
  v5 = -[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured");
  v6 = *MEMORY[0x24BE08FB0];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SiriPresentationViewController _prepareSiriViewControllerWithRequestOptions:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FF0];
    v57[0] = *MEMORY[0x24BDD0FC8];
    v57[1] = v15;
    v58[0] = CFSTR("Reusing AFUISiriViewController is currently unsupported.");
    v58[1] = CFSTR("If this call is necessary, use siriViewControllerConfigured to check if it is ready to use");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.activation"), 3, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    -[SiriPresentationViewController _dismissDueToUnexpectedError:](self, "_dismissDueToUnexpectedError:", v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v60 = "-[SiriPresentationViewController _prepareSiriViewControllerWithRequestOptions:]";
      _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation creating new AFUISiriViewController", buf, 0xCu);
    }
    -[SiriPresentationViewController _createSiriViewControllerWithRequestOptions:](self, "_createSiriViewControllerWithRequestOptions:", v4);
    v18 = (AFUISiriViewController *)objc_claimAutoreleasedReturnValue();
    siriViewController = self->_siriViewController;
    self->_siriViewController = v18;

    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationViewController addChildViewController:](self, "addChildViewController:", v20);

    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

    -[SiriPresentationViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v25);

    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "didMoveToParentViewController:", self);

    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationViewController hostedPresentationFrame](self, "hostedPresentationFrame");
    objc_msgSend(v27, "setHostedPresentationFrame:");

    if ((objc_msgSend(v4, "isForStark") & 1) != 0)
    {
      v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v4, "appBundleIdentifier");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = CFSTR("com.apple.siri");
      if (v28)
        v30 = (__CFString *)v28;
      v31 = v30;

      v32 = -[__CFString caseInsensitiveCompare:](v31, "caseInsensitiveCompare:", *MEMORY[0x24BE09510]);
      v33 = MEMORY[0x24BDAC760];
      if (v32 && -[__CFString caseInsensitiveCompare:](v31, "caseInsensitiveCompare:", *MEMORY[0x24BE09558]))
      {
        v34 = objc_alloc_init(MEMORY[0x24BE81118]);
        v35 = objc_alloc_init(MEMORY[0x24BE817D8]);
        objc_msgSend(v35, "setBundleId:", v31);
        objc_msgSend(v34, "setAppIdentifyingInfo:", v35);
        v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v37 = (void *)MEMORY[0x24BE090D8];
        v54[0] = v33;
        v54[1] = 3221225472;
        v54[2] = __79__SiriPresentationViewController__prepareSiriViewControllerWithRequestOptions___block_invoke;
        v54[3] = &unk_24D47A9C0;
        v55 = v31;
        v56 = v34;
        v38 = v34;
        v39 = (void *)objc_msgSend(v37, "newWithBuilder:", v54);
        objc_msgSend(v36, "addObject:", v39);

      }
      else
      {
        v36 = 0;
      }
      objc_msgSend(v4, "currentCarPlaySupportedOEMAppIdList");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v41 = objc_alloc_init(MEMORY[0x24BE81190]);
        objc_msgSend(v4, "currentCarPlaySupportedOEMAppIdList");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setAppIds:", v42);

        v43 = (void *)MEMORY[0x24BE090D8];
        v52[0] = v33;
        v52[1] = 3221225472;
        v52[2] = __79__SiriPresentationViewController__prepareSiriViewControllerWithRequestOptions___block_invoke_2;
        v52[3] = &unk_24D47A9E8;
        v53 = v41;
        v44 = v41;
        v45 = (void *)objc_msgSend(v43, "newWithBuilder:", v52);
        objc_msgSend(v17, "addObject:", v45);

      }
    }
    else
    {
      v36 = 0;
      v17 = 0;
    }
    -[SiriPresentationViewController setCurrentCarPlaySupportedOEMAppIdList:](self, "setCurrentCarPlaySupportedOEMAppIdList:", v17);
    -[SiriPresentationViewController setStarkAppBundleIdentifierContext:](self, "setStarkAppBundleIdentifierContext:", v36);
    objc_msgSend(v4, "uiPresentationIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationViewController _foregroundAppInfosForUIPresentationIdentifier:](self, "_foregroundAppInfosForUIPresentationIdentifier:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationViewController setContextAppInfosForSiriViewController:](self, "setContextAppInfosForSiriViewController:", v47);

    -[SiriPresentationViewController _handleContextClearForRequestOptions:](self, "_handleContextClearForRequestOptions:", v4);
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "siriWillActivateFromSource:", objc_msgSend(v4, "requestSource"));

    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isForStark") & 1) != 0)
      v50 = 0;
    else
      v50 = objc_msgSend(v4, "isForUIFree") ^ 1;
    objc_msgSend(v49, "setStatusBarEnabled:", v50);

    if (objc_msgSend(v4, "requestSource") == 19)
    {
      -[SiriPresentationViewController siriViewController](self, "siriViewController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setShowsStatusBar:", 1);

    }
    kdebug_trace();

  }
}

void __79__SiriPresentationViewController__prepareSiriViewControllerWithRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAssociatedBundleIdentifier:", v3);
  objc_msgSend(v4, "setAceContext:", *(_QWORD *)(a1 + 40));

}

uint64_t __79__SiriPresentationViewController__prepareSiriViewControllerWithRequestOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAceContext:", *(_QWORD *)(a1 + 32));
}

- (void)_presentationRequestedHandlerWithRequestOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  AFUISiriViewController *siriViewController;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  if (objc_msgSend(v4, "requestSource") != 19)
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didPresentSiri");

  }
  -[AFUISiriViewController siriDidActivateFromSource:](self->_siriViewController, "siriDidActivateFromSource:", objc_msgSend(v4, "requestSource"));
  if (objc_msgSend(MEMORY[0x24BE09538], "availabilityState") == 1
    || objc_msgSend(MEMORY[0x24BE09538], "availabilityState") == 3)
  {
    -[AFUISiriViewController presentRemoteViewControllerIfNecessary](self->_siriViewController, "presentRemoteViewControllerIfNecessary");
  }
  else if (objc_msgSend(MEMORY[0x24BE09538], "availabilityState") == 2)
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[SiriPresentationViewController _presentationRequestedHandlerWithRequestOptions:]";
      _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation Device not unlocked since boot; presenting passcode unlock screen",
        buf,
        0xCu);
    }
    objc_initWeak((id *)buf, self);
    siriViewController = self->_siriViewController;
    objc_msgSend(v4, "requestInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__SiriPresentationViewController__presentationRequestedHandlerWithRequestOptions___block_invoke;
    v9[3] = &unk_24D47AA10;
    v10 = v4;
    objc_copyWeak(&v11, (id *)buf);
    -[AFUISiriViewController showPasscodeUnlockScreenForRequest:unlockCompletion:](siriViewController, "showPasscodeUnlockScreenForRequest:unlockCompletion:", v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  kdebug_trace();

}

void __82__SiriPresentationViewController__presentationRequestedHandlerWithRequestOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  id WeakRetained;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v8 = 136315394;
      v9 = "-[SiriPresentationViewController _presentationRequestedHandlerWithRequestOptions:]_block_invoke";
      v10 = 2048;
      v11 = a2;
      _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation Device unlock aborted with result = %ld", (uint8_t *)&v8, 0x16u);
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 1, 15);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "dismissWithOptions:", v6);
  }
  else
  {
    if (v5)
    {
      v8 = 136315138;
      v9 = "-[SiriPresentationViewController _presentationRequestedHandlerWithRequestOptions:]_block_invoke";
      _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation Device is now unlocked; proceeding with the request.",
        (uint8_t *)&v8,
        0xCu);
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE907F0]), "initWithRequestSource:", objc_msgSend(*(id *)(a1 + 32), "requestSource"));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "activateWithRequestOptions:", v6);
  }

}

- (void)handleRequestWithOptions:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location;

  v4 = a3;
  kdebug_trace();
  objc_initWeak(&location, self);
  v5 = v4;
  objc_copyWeak(&v6, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

void __59__SiriPresentationViewController_handleRequestWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "requestSource") == 15)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "siriViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "siriWillActivateFromSource:", objc_msgSend(*(id *)(a1 + 32), "requestSource"));

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "activateWithRequestOptions:", *(_QWORD *)(a1 + 32));

}

- (void)activateWithRequestOptions:(id)a3
{
  id v4;

  v4 = a3;
  -[SiriPresentationViewController activateWithSource:requestOptions:timestamp:](self, "activateWithSource:requestOptions:timestamp:", objc_msgSend(v4, "requestSource"), v4, 0);

}

- (void)activateWithSource:(int64_t)a3 timestamp:(id)a4
{
  -[SiriPresentationViewController activateWithSource:requestOptions:timestamp:](self, "activateWithSource:requestOptions:timestamp:", a3, 0, a4);
}

- (int64_t)_viewModeForRequestOptions:(id)a3
{
  void *v3;
  char v4;
  os_log_t *v5;
  int64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "uiPresentationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay"));
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  if ((v4 & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.EyesFree")) & 1) != 0)
  {
    v6 = 4;
    goto LABEL_14;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.BluetoothCar")) & 1) != 0)
  {
    v6 = 8;
    goto LABEL_14;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.UIFree")) & 1) != 0)
    goto LABEL_8;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.SiriTVPresentation")) & 1) != 0)
  {
    v6 = 6;
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.Compact")) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.SystemAssistantExperience")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay.UIFree")) & 1) != 0)
      {
LABEL_2:
        v6 = 5;
        goto LABEL_14;
      }
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        -[SiriPresentationViewController _viewModeForRequestOptions:].cold.1();
LABEL_8:
      v6 = 0;
      goto LABEL_14;
    }
    v6 = 7;
  }
LABEL_14:
  v7 = *v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    SiriUINSStringFromSiriUIViewMode();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[SiriPresentationViewController _viewModeForRequestOptions:]";
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation: Returning SiriUIViewMode:%@", (uint8_t *)&v11, 0x16u);

  }
  return v6;
}

- (void)activateWithSource:(int64_t)a3 requestOptions:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  id v14;
  id *p_buttonTrigger;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BE907F0]);
    -[SiriPresentationViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithRequestSource:uiPresentationIdentifier:", a3, v12);

  }
  if (!SASRequestSourceIsHTT())
    goto LABEL_11;
  -[SiriPresentationViewController _releaseExistingTrigger](self, "_releaseExistingTrigger");
  if (!v8)
  {
    -[SiriPresentationViewController _setButtonDownEventDidOccur:](self, "_setButtonDownEventDidOccur:", 1);
    objc_msgSend(v9, "timeInterval");
    -[SiriPresentationViewController _setButtonDownTimestamp:](self, "_setButtonDownTimestamp:");
    objc_msgSend(v9, "timeInterval");
    objc_msgSend(v10, "setTimestamp:");
    v14 = objc_alloc(MEMORY[0x24BE907F8]);
    p_buttonTrigger = &self->_buttonTrigger;
    v16 = v10;
    goto LABEL_9;
  }
  objc_msgSend(v8, "buttonDownTimestamp");
  if (v13 == 0.0)
  {
    -[SiriPresentationViewController _setButtonDownEventDidOccur:](self, "_setButtonDownEventDidOccur:", 0);
    -[SiriPresentationViewController _setButtonDownTimestamp:](self, "_setButtonDownTimestamp:", 0.0);
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  -[SiriPresentationViewController _setButtonDownEventDidOccur:](self, "_setButtonDownEventDidOccur:", 1);
  objc_msgSend(v8, "buttonDownTimestamp");
  -[SiriPresentationViewController _setButtonDownTimestamp:](self, "_setButtonDownTimestamp:");
  v14 = objc_alloc(MEMORY[0x24BE907F8]);
  p_buttonTrigger = &self->_buttonTrigger;
  v16 = v8;
LABEL_9:
  v17 = (void *)objc_msgSend(v14, "initWithRequestOptions:updateHandle:", v16, p_buttonTrigger);
LABEL_12:
  objc_initWeak(&location, self);
  v18 = v17;
  v19 = v8;
  objc_copyWeak(&v21, &location);
  v20 = v10;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __78__SiriPresentationViewController_activateWithSource_requestOptions_timestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isShortButtonPressAction")
      && (objc_msgSend(*(id *)(a1 + 40), "isATVRemotePTTEligible") & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(WeakRetained, "siriViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortTapActionWithRequestOptions:", *(_QWORD *)(a1 + 40));

      v8 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v8, "siriViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentRemoteViewControllerIfNecessary");

    }
    else
    {
      v8 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v8, "siriViewController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "startRequestWithActivationTrigger:", *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 56));
    v4 = *(_QWORD *)(a1 + 40);
    if (!v4)
      v4 = *(_QWORD *)(a1 + 48);
    v8 = v3;
    objc_msgSend(v3, "_startRequestWithOptions:", v4);
  }

}

- (void)_startRequestWithOptions:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int64_t presentationState;
  NSObject *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  char v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  char v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD17F0];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v30 = "-[SiriPresentationViewController _startRequestWithOptions:]";
    v31 = 2048;
    v32 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->_presentationStateProcessingLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[SiriPresentationViewController _startRequestWithOptions:]";
    _os_log_impl(&dword_215D55000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock successfully locked", buf, 0xCu);
  }
  presentationState = self->_presentationState;
  os_unfair_lock_unlock(&self->_presentationStateProcessingLock);
  v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[SiriPresentationViewController _startRequestWithOptions:]";
    _os_log_impl(&dword_215D55000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock unlocked", buf, 0xCu);
  }
  if (-[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentRequestOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v15 = -[SiriPresentationViewController _shouldRequestPresentationForState:forNewRequest:currentRequest:](self, "_shouldRequestPresentationForState:forNewRequest:currentRequest:", presentationState, v4, v14);
  v16 = -[SiriPresentationViewController _shouldHandleNewRequestWithOptions:currentRequest:](self, "_shouldHandleNewRequestWithOptions:currentRequest:", v4, v14);
  if (objc_msgSend(v4, "isForStark")
    && objc_msgSend(MEMORY[0x24BE09518], "isRequestForAnnounceNotification:", v14))
  {
    v17 = objc_msgSend(MEMORY[0x24BE09518], "isRequestForMessageReadBannerTap:", v4);
    if (!v15)
      goto LABEL_18;
  }
  else
  {
    v17 = 0;
    if (!v15)
      goto LABEL_18;
  }
  v18 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[SiriPresentationViewController _startRequestWithOptions:]";
    _os_log_impl(&dword_215D55000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation requesting presentation for new request.", buf, 0xCu);
  }
  v19 = objc_alloc(MEMORY[0x24BE90840]);
  v20 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __59__SiriPresentationViewController__startRequestWithOptions___block_invoke;
  v27[3] = &unk_24D47AA88;
  v28 = v4;
  v21 = (void *)objc_msgSend(v19, "initWithBuilder:", v27);
  objc_initWeak((id *)buf, self);
  v24[0] = v20;
  v24[1] = 3221225472;
  v24[2] = __59__SiriPresentationViewController__startRequestWithOptions___block_invoke_2;
  v24[3] = &unk_24D47AAB0;
  objc_copyWeak(&v25, (id *)buf);
  v26 = v17;
  v24[4] = self;
  -[SiriPresentationViewController _requestPresentationWithOptions:completion:](self, "_requestPresentationWithOptions:completion:", v21, v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

LABEL_18:
  if (v16)
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "startRequestWithOptions:", v4);

  }
  else
  {
    v23 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[SiriPresentationViewController _startRequestWithOptions:]";
      _os_log_impl(&dword_215D55000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation ignoring starting a new request.", buf, 0xCu);
    }
  }

}

void __59__SiriPresentationViewController__startRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setRequestSource:", objc_msgSend(v3, "requestSource"));
  objc_msgSend(v4, "setInputType:", objc_msgSend(*(id *)(a1 + 32), "inputType"));

}

void __59__SiriPresentationViewController__startRequestWithOptions___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (v11 || (a2 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "connection");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (v11)
    {
      objc_msgSend(v9, "failedToPresentSiriWithError:");
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.siri.activation"), 1, &unk_24D47F3D0);
      objc_msgSend(v8, "failedToPresentSiriWithError:", v10);

    }
    goto LABEL_9;
  }
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 32), "siriViewControllerConfigured"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BE95A98]);
    objc_msgSend(*(id *)(a1 + 32), "siriViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emitInstrumentationEvent:", v7);
LABEL_9:

  }
}

- (BOOL)_shouldRequestPresentationForState:(int64_t)a3 forNewRequest:(id)a4 currentRequest:(id)a5
{
  id v7;
  id v8;
  char v9;
  BOOL v10;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "isForStark"))
  {
    v9 = objc_msgSend(MEMORY[0x24BE09518], "shouldPresentForNewRequest:duringCurrentRequest:", v7, v8);
    if (a3 == 3)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldHandleNewRequestWithOptions:(id)a3 currentRequest:(id)a4
{
  id v5;
  id v6;
  char v7;
  char v8;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isForStark"))
  {
    v7 = objc_msgSend(MEMORY[0x24BE09518], "shouldStartNewRequest:duringCurrentRequest:", v6, v5);

  }
  else
  {
    v8 = objc_msgSend(v6, "isRemotePresentationBringUp");

    v7 = v8 ^ 1;
  }

  return v7;
}

- (id)_uiPresentationIdentifier
{
  const __CFString *v2;
  void *v4;
  _BOOL4 v5;
  int v6;
  const __CFString *v7;

  v2 = CFSTR("com.apple.siri.CarDisplay");
  switch(self->_identifier)
  {
    case 0:
    case 3:
      v2 = CFSTR("com.apple.siri.Compact");
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isConnectedToEyesFreeDevice") & 1) != 0 || objc_msgSend(v4, "carDNDActive"))
      {
        AFDeviceSupportsSystemAssistantExperience();
        v2 = CFSTR("com.apple.siri.EyesFree");
      }
      else
      {
        v5 = -[SiriPresentationViewController _AFPreferencesAlwaysEyesFreeEnabled](self, "_AFPreferencesAlwaysEyesFreeEnabled");
        v6 = AFDeviceSupportsSystemAssistantExperience();
        v7 = CFSTR("com.apple.siri.Compact");
        if (v6)
          v7 = CFSTR("com.apple.siri.SystemAssistantExperience");
        if (v5)
          v2 = CFSTR("com.apple.siri.EyesFree");
        else
          v2 = v7;
      }

      break;
    case 4:
      v2 = CFSTR("com.apple.siri.SiriTVPresentation");
      break;
    default:
      return (id)v2;
  }
  return (id)v2;
}

- (CGRect)_fallbackFrameForScreen:(id)a3 withIdentifier:(int64_t)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v5 = a3;
  v6 = v5;
  if ((unint64_t)a4 > 4)
  {
    v10 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    objc_msgSend(v5, "bounds");
    v10 = v9;
    v12 = v11;
    if (a4 == 2)
    {
      v14 = v8;
      v13 = v7 + -44.0;
    }
    else
    {
      v13 = v7;
      v14 = v8;
    }
  }

  v15 = v10;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_fallbackScreenForIdentifier:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((unint64_t)a3 > 4)
  {
    v5 = 0;
  }
  else
  {
    if (a3 == 2)
      objc_msgSend(MEMORY[0x24BDF6D38], "_carScreen", v3, v4);
    else
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)presentationDismissalRequestedWithOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  kdebug_trace();
  -[SiriPresentationViewController _updateDismissalOptionsIfNecessary:](self, "_updateDismissalOptionsIfNecessary:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:](self, "_presentationDismissalRequestedWithOptions:withCompletion:", v5, 0);
}

- (id)_updateDismissalOptionsIfNecessary:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "dismissalReason") == 8 && self->_isVoiceActivationMaskShown)
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:requestCancellationReason:dismissalReason:shouldTurnScreenOff:", objc_msgSend(v4, "deactivationOptions"), objc_msgSend(v4, "animated"), objc_msgSend(v4, "reason"), objc_msgSend(v4, "dismissalReason"), 1);
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

- (void)_presentationDismissalRequestedWithOptions:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  os_log_t *v8;
  NSObject *v9;
  os_log_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int IsError;
  NSObject *v42;
  uint64_t v43;
  id v44;
  void (**v45)(_QWORD);
  NSObject *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  SRUIFPlatformHostingInstrumentationHandler *viewHostingInstrumentationHandler;
  void *v57;
  id v58;
  _QWORD v59[4];
  void (**v60)(_QWORD);
  id v61;
  _QWORD v62[4];
  id v63;
  SiriPresentationViewController *v64;
  void (**v65)(id, _QWORD);
  id v66[2];
  id location;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
    v70 = 2112;
    v71 = (uint64_t)v6;
    _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation %@", buf, 0x16u);
  }
  v10 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)MEMORY[0x24BDD17F0];
    v12 = v10;
    objc_msgSend(v11, "currentThread");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "qualityOfService");
    *(_DWORD *)buf = 136315394;
    v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
    v70 = 2048;
    v71 = v14;
    _os_log_impl(&dword_215D55000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->_presentationStateProcessingLock);
  v15 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
    _os_log_impl(&dword_215D55000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock successfully locked", buf, 0xCu);
  }
  v16 = -[SiriPresentationViewController presentationState](self, "presentationState");
  if (v16 != 4)
  {
    -[SiriPresentationViewController setPresentationState:](self, "setPresentationState:", 4);
    v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
      _os_log_impl(&dword_215D55000, v17, OS_LOG_TYPE_DEFAULT, "%s #activation isDismissing:YES", buf, 0xCu);
    }
  }
  os_unfair_lock_unlock(&self->_presentationStateProcessingLock);
  v18 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
    _os_log_impl(&dword_215D55000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _presentationStateProcessingLock unlocked", buf, 0xCu);
  }
  if (v16 == 4)
  {
    v19 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    -[SiriPresentationViewController _invalidateCarSiriButtonHoldToTalkTimer](self, "_invalidateCarSiriButtonHoldToTalkTimer");
    v27 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      -[SiriPresentationViewController _isDelayingSessionEnd](self, "_isDelayingSessionEnd");
      NSStringFromBOOL();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
      v70 = 2112;
      v71 = (uint64_t)v6;
      v72 = 2112;
      v73 = v29;
      _os_log_impl(&dword_215D55000, v28, OS_LOG_TYPE_DEFAULT, "%s #activation options:%@ _isDelayingSessionEnd:%@", buf, 0x20u);

    }
    if (-[SiriPresentationViewController _isDelayingSessionEnd](self, "_isDelayingSessionEnd"))
    {
      v30 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
        _os_log_impl(&dword_215D55000, v30, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy #punchout delaying session end, did not send willDismiss before dismissal", buf, 0xCu);
      }
    }
    else
    {
      -[SiriPresentationViewController connection](self, "connection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "remoteTarget");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "willDismiss");

    }
    v33 = objc_msgSend(v6, "reason");
    if (v33)
    {
      v34 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
        _os_log_impl(&dword_215D55000, v34, OS_LOG_TYPE_DEFAULT, "%s #cancellationReason: Passing through cancellationReason", buf, 0xCu);
      }
      -[SiriPresentationViewController siriViewController](self, "siriViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setSiriRequestCancellationReason:", v33);

    }
    -[SiriPresentationViewController _instrumentSuccessfulAppLaunchIfNecessary](self, "_instrumentSuccessfulAppLaunchIfNecessary");
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "viewMode");

    v38 = -[SiriPresentationViewController _dismissalReasonForDismissalWithOptions:](self, "_dismissalReasonForDismissalWithOptions:", v6);
    -[SiriPresentationViewController _logDismissalRequestedForViewMode:withDismissalReason:](self, "_logDismissalRequestedForViewMode:withDismissalReason:", v37, v38);
    v39 = (void *)MEMORY[0x24BDD17C8];
    SASDismissalReasonGetName();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("#activation dismissal reason: %@"), v40);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    IsError = SASDismissalIsError();
    v42 = *v8;
    if (IsError)
    {
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        -[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:].cold.3();
    }
    else if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
      v70 = 2112;
      v71 = (uint64_t)v57;
      _os_log_impl(&dword_215D55000, v42, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    objc_initWeak(&location, self);
    v43 = MEMORY[0x24BDAC760];
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke;
    v62[3] = &unk_24D47AB28;
    objc_copyWeak(v66, &location);
    v44 = v6;
    v63 = v44;
    v66[1] = v38;
    v64 = self;
    v65 = v7;
    v45 = (void (**)(_QWORD))MEMORY[0x2199F1430](v62);
    if (-[SiriPresentationViewController currentViewMode](self, "currentViewMode") == 7
      && objc_msgSend(v44, "shouldTurnScreenOff"))
    {
      v46 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v69 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]";
        _os_log_impl(&dword_215D55000, v46, OS_LOG_TYPE_DEFAULT, "%s #activation #myriadUI : Animating Orb before requesting dismissal", buf, 0xCu);
      }
      -[SiriPresentationViewController startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:](self, "startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:", v45, objc_msgSend(v44, "shouldTurnScreenOff"));
      objc_initWeak((id *)buf, self);
      -[SiriPresentationViewController siriViewController](self, "siriViewController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v43;
      v59[1] = 3221225472;
      v59[2] = __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_230;
      v59[3] = &unk_24D47A540;
      objc_copyWeak(&v61, (id *)buf);
      v60 = v45;
      objc_msgSend(v47, "animateOrbViewDismissalIfNecessaryWithCompletion:", v59);

      objc_destroyWeak(&v61);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v45[2](v45);
    }
    objc_copyWeak(&v58, &location);
    SiriUIInvokeOnMainQueue();
    v48 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
      -[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:].cold.2(v48, v49, v50, v51, v52, v53, v54, v55);
    viewHostingInstrumentationHandler = self->_viewHostingInstrumentationHandler;
    self->_viewHostingInstrumentationHandler = 0;

    objc_destroyWeak(&v58);
    objc_destroyWeak(v66);
    objc_destroyWeak(&location);

  }
}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13[2];

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "siriPresentationControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_2;
  v8[3] = &unk_24D47AB00;
  objc_copyWeak(v13, v2);
  v13[1] = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = WeakRetained;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v4, "siriPresentation:requestsDismissalWithOptions:withHandler:", WeakRetained, v5, v8);

  objc_destroyWeak(v13);
}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v9;
  void *v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  os_log_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  char v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x24BE08FB0];
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke_2";
    _os_log_impl(&dword_215D55000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation handler for siriPresentation:requestsDismissalWithOptions:WithHandler:", buf, 0xCu);
  }
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 64));
  v9 = WeakRetained;
  if (v5 || !(_DWORD)a2)
  {
    if (WeakRetained)
    {
      v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)MEMORY[0x24BDD16E0];
        v13 = v11;
        objc_msgSend(v12, "numberWithBool:", a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
        v32 = 2112;
        v33 = (uint64_t)v14;
        v34 = 2112;
        v35 = v5;
        _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation handler for siriPresentation:requestsDismissalWithOptions:WithHandler: returned success:%@ error:%@. Aborting dismissal and calling resetSiriToActive to reset state.", buf, 0x20u);

      }
      -[os_unfair_lock_s connection](v9, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "remoteTarget");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resetSiriToActive");

      v17 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)MEMORY[0x24BDD17F0];
        v19 = v17;
        objc_msgSend(v18, "currentThread");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "qualityOfService");
        *(_DWORD *)buf = 136315394;
        v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
        v32 = 2048;
        v33 = v21;
        _os_log_impl(&dword_215D55000, v19, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock about to lock with qos: %zd", buf, 0x16u);

      }
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 1064));
      v22 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
        _os_log_impl(&dword_215D55000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_presentationStateProcessingLock successfully locked", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 48), "setPresentationState:", 6);
      v23 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
        _os_log_impl(&dword_215D55000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation isDismissing:NO", buf, 0xCu);
      }
      os_unfair_lock_unlock(v9 + 266);
      v24 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
        _os_log_impl(&dword_215D55000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_presentationStateProcessingLock unlocked", buf, 0xCu);
      }
    }
    v25 = *(_QWORD *)(a1 + 56);
    if (v25)
      (*(void (**)(uint64_t, _QWORD))(v25 + 16))(v25, 0);
  }
  else
  {
    -[os_unfair_lock_s siriViewController](WeakRetained, "siriViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "siriWillBeginTearDownForDismissalReason:withOriginalDismissalOptions:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));

    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_229;
    v26[3] = &unk_24D47AAD8;
    objc_copyWeak(&v28, (id *)(a1 + 64));
    v26[4] = v9;
    v27 = *(id *)(a1 + 56);
    v29 = a2;
    -[os_unfair_lock_s _wasDismissedWithCompletion:](v9, "_wasDismissedWithCompletion:", v26);

    objc_destroyWeak(&v28);
  }

}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_229(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  os_log_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "_isDelayingSessionEnd");
    v5 = (os_log_t *)MEMORY[0x24BE08FB0];
    if ((v4 & 1) != 0)
    {
      v6 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315138;
        v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
        _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #noisy #punchout delaying session end, did not send didDismiss on dismissal", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v3, "connection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remoteTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didDismiss");

      objc_msgSend(v3, "_teardownPongTimer");
    }
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x24BDD17F0];
      v11 = v9;
      objc_msgSend(v10, "currentThread");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "qualityOfService");
      v21 = 136315394;
      v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      v23 = 2048;
      v24 = v13;
      _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_presentationStateProcessingLock about to lock with qos: %zd", (uint8_t *)&v21, 0x16u);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1064));
    v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_presentationStateProcessingLock successfully locked", (uint8_t *)&v21, 0xCu);
    }
    objc_msgSend(v3, "setPresentationState:", 5);
    v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      _os_log_impl(&dword_215D55000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation isDismissing:NO", (uint8_t *)&v21, 0xCu);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 1064));
    v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      _os_log_impl(&dword_215D55000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy innerStrongSelf->_presentationStateProcessingLock unlocked", (uint8_t *)&v21, 0xCu);
    }
    objc_msgSend(v3, "_setShouldDeferWake:", 0);
    v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      NSStringFromBOOL();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315394;
      v22 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke";
      v23 = 2112;
      v24 = (uint64_t)v19;
      _os_log_impl(&dword_215D55000, v18, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Resetting shouldDeferWake - %@", (uint8_t *)&v21, 0x16u);

    }
    v20 = *(_QWORD *)(a1 + 40);
    if (v20)
      (*(void (**)(uint64_t, _QWORD))(v20 + 16))(v20, *(unsigned __int8 *)(a1 + 56));
  }

}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_230(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stopAnimationDismissalWatchdogTimerIfNeededThen:onQueue:", *(_QWORD *)(a1 + 32), MEMORY[0x24BDAC9B8]);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_analytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEventWithType:context:", 1931, 0);

}

void __92__SiriPresentationViewController__presentationDismissalRequestedWithOptions_withCompletion___block_invoke_2_231(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[161])
    {
      v3 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:]_block_invoke_2";
        _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController invalidate hint glow assertion for dismissal", (uint8_t *)&v5, 0xCu);
      }
      *((_QWORD *)v2 + 162) = 0;
      objc_msgSend(*((id *)v2 + 161), "invalidate");
      v4 = (void *)*((_QWORD *)v2 + 161);
      *((_QWORD *)v2 + 161) = 0;

    }
    objc_msgSend(v2, "_tearDownSiriEffectsViewController");
  }

}

- (void)_setUpUnownedConnectionIfNecessary
{
  os_log_t *v3;
  void *v4;
  AFConnection *unownedConnection;
  void *v6;
  NSObject *v7;
  void *v8;
  AFConnection *v9;
  AFConnection *v10;
  NSObject *v11;
  AFConnection *v12;
  int v13;
  const char *v14;
  __int16 v15;
  AFConnection *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    unownedConnection = self->_unownedConnection;
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v4;
    objc_msgSend(v6, "numberWithBool:", -[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[SiriPresentationViewController _setUpUnownedConnectionIfNecessary]";
    v15 = 2112;
    v16 = unownedConnection;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_215D55000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation _unownedConnection: %@ , siriViewControllerConfigured: %@", (uint8_t *)&v13, 0x20u);

  }
  if (!self->_unownedConnection
    && !-[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
  {
    v9 = (AFConnection *)objc_alloc_init(MEMORY[0x24BE09170]);
    v10 = self->_unownedConnection;
    self->_unownedConnection = v9;

    v11 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_unownedConnection;
      v13 = 136315394;
      v14 = "-[SiriPresentationViewController _setUpUnownedConnectionIfNecessary]";
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation created new _unownedConnection: %@", (uint8_t *)&v13, 0x16u);
    }
    -[SiriPresentationViewController _scheduleConnectionHouseKeepingAfterDelay:](self, "_scheduleConnectionHouseKeepingAfterDelay:", 2.0);
  }
}

- (void)preheat
{
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SiriPresentationViewController preheat]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation Activation service requests preheat", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v4, (id *)buf);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak((id *)buf);
}

void __41__SiriPresentationViewController_preheat__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 1016) = 0;
    objc_msgSend(WeakRetained, "_setUpUnownedConnectionIfNecessary");
    objc_msgSend(v2[143], "preheatWithStyle:", 1);
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v2[143];
      v5 = 136315394;
      v6 = "-[SiriPresentationViewController preheat]_block_invoke";
      v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation preheated _unownedConnection: %@", (uint8_t *)&v5, 0x16u);
    }
  }

}

- (void)cancelPreheat
{
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v4 = "-[SiriPresentationViewController cancelPreheat]";
    _os_log_impl(&dword_215D55000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation Cancel preheat", buf, 0xCu);
  }
  SiriUIInvokeOnMainQueue();
}

uint64_t __47__SiriPresentationViewController_cancelPreheat__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_cleanupUnownedConnection");
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[161])
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[SiriPresentationViewController cancelPreheat]_block_invoke";
      _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s SiriPresentationViewController invalidate hint glow assertion for cancel preheat", (uint8_t *)&v7, 0xCu);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1296) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1288), "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1288);
    *(_QWORD *)(v4 + 1288) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_tearDownSiriEffectsViewController");
}

- (void)handleButtonDownFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[SiriPresentationViewController handleButtonDownFromButtonIdentifier:timestamp:context:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s handleButtonDownFromButtonIdentifier:%@ timestamp:%@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v15, (id *)buf);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __89__SiriPresentationViewController_handleButtonDownFromButtonIdentifier_timestamp_context___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "_isSpringBoardMainScreenPresentation"))
    {
      SBUIGetUserAgent();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isScreenOn");

      v7 = objc_msgSend(a1[4], "siriButtonIdentifier") == 1 || objc_msgSend(a1[4], "siriButtonIdentifier") == 2;
      if ((v7 & v6) == 1)
      {
        objc_msgSend(v4, "_setScreenOffDuringActivation:", 0);
        v13 = 1;
      }
      else
      {
        v13 = v7 & (v6 ^ 1);
      }
      v14 = objc_msgSend(a1[4], "siriButtonIdentifier");
      if ((v14 > 9 || ((1 << v14) & 0x3E6) == 0) && v14 - 200 >= 2 && v14 - 100 > 1)
      {
        if ((v13 & 1) != 0)
          goto LABEL_36;
        goto LABEL_28;
      }
      if ((v13 & 1) == 0 && (objc_msgSend(v4, "_cancelPendingPhoneCall") & 1) == 0)
LABEL_28:
        objc_msgSend(v4, "activateWithSource:timestamp:", objc_msgSend(MEMORY[0x24BE907C8], "requestSourceForButtonIdentifier:", objc_msgSend(a1[4], "siriButtonIdentifier")), a1[5]);
    }
    else if (objc_msgSend(v4, "identifier") == 4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = a1[6];
      if (objc_msgSend(v8, "isListening"))
      {
        v9 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v28 = "-[SiriPresentationViewController handleButtonDownFromButtonIdentifier:timestamp:context:]_block_invoke";
          _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Received Button Down While Listening", buf, 0xCu);
        }
        objc_msgSend(v4, "_handleButtonDownWhileListeningFromButtonIdentifier:timestamp:context:", a1[4], a1[5], v8);
      }

    }
    else if ((unint64_t)(objc_msgSend(a1[4], "siriButtonIdentifier") - 5) <= 2)
    {
      if ((objc_msgSend(v4, "siriViewControllerConfigured") & 1) != 0)
      {
        objc_msgSend(v4, "siriViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isVisible");

        if (v11)
        {
          objc_msgSend(v4, "_setButtonDownEventDidOccur:", 1);
          objc_msgSend(a1[5], "timeInterval");
          objc_msgSend(v4, "_setButtonDownTimestamp:");
        }
        objc_msgSend(v4, "siriViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isListening"))
        {

        }
        else
        {
          objc_msgSend(v4, "clearSiriViewControllerTimer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            objc_msgSend(v4, "_invalidateCarSiriButtonHoldToTalkTimer");
            objc_msgSend(a1[5], "timeInterval");
            objc_msgSend(v4, "_setCarSiriButtonTimeInterval:");
            v17 = (void *)MEMORY[0x24BDBCF40];
            v21 = MEMORY[0x24BDAC760];
            v22 = 3221225472;
            v23 = __89__SiriPresentationViewController_handleButtonDownFromButtonIdentifier_timestamp_context___block_invoke_236;
            v24 = &unk_24D47AB50;
            objc_copyWeak(&v26, v2);
            v25 = a1[4];
            objc_msgSend(v17, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v21, 0.4);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "_setCarSiriButtonHoldToTalkTimer:", v18, v21, v22, v23, v24);

            v19 = (id)*MEMORY[0x24BE08FB0];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v4, "_carSiriButtonHoldToTalkTimer");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v28 = "-[SiriPresentationViewController handleButtonDownFromButtonIdentifier:timestamp:context:]_block_invoke_2";
              v29 = 2112;
              v30 = v20;
              v31 = 2048;
              v32 = 0x3FD999999999999ALL;
              _os_log_impl(&dword_215D55000, v19, OS_LOG_TYPE_INFO, "%s #activation Started Car Siri button long press timer (%@) for %f seconds", buf, 0x20u);

            }
            objc_destroyWeak(&v26);
          }
        }
      }
      else
      {
        v15 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v28 = "-[SiriPresentationViewController handleButtonDownFromButtonIdentifier:timestamp:context:]_block_invoke";
          _os_log_impl(&dword_215D55000, v15, OS_LOG_TYPE_INFO, "%s #activation button pressed, but AFUISiriViewController is not set up, returning early.", buf, 0xCu);
        }
      }
    }
  }
LABEL_36:

}

void __89__SiriPresentationViewController_handleButtonDownFromButtonIdentifier_timestamp_context___block_invoke_236(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_carSiriButtonHoldToTalkIntervalFiredWithButtonIdentifier:", objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier"));

}

- (void)_handleButtonDownWhileListeningFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SiriPresentationViewController _handleButtonDownWhileListeningFromButtonIdentifier:timestamp:context:]";
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s _handleButtonDownWhileListeningFromButtonIdentifier:%@ timestamp:%@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v14, (id *)buf);
  v12 = v8;
  v13 = v10;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __104__SiriPresentationViewController__handleButtonDownWhileListeningFromButtonIdentifier_timestamp_context___block_invoke(id *a1)
{
  id *WeakRetained;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained
    && objc_msgSend(a1[4], "siriButtonIdentifier") == 201
    && objc_msgSend(a1[5], "isPTTEligible")
    && objc_msgSend(WeakRetained[164], "isListening"))
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[SiriPresentationViewController _handleButtonDownWhileListeningFromButtonIdentifier:timestamp:context:]_block_invoke";
      _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #ptt We are Listening, sending Button Down While Listening to Siri View Controller", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(WeakRetained[164], "tvRemoteSentButtonDownWhileListening");
  }

}

- (void)handleButtonUpFromButtonIdentifier:(id)a3 deviceIdentifier:(id)a4 timestamp:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location;
  _BYTE buf[24];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  kdebug_trace();
  v14 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[SiriPresentationViewController handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation handleButtonUpFromButtonIdentifier:%@ deviceIdentifier:%@ timestamp:%@ context:%@", buf, 0x34u);
  }
  if (objc_msgSend(MEMORY[0x24BE091E0], "isTVPushToTalkEnabled")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = v13;
  }
  else
  {
    v15 = 0;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v23) = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v20, &location);
  v16 = v10;
  v17 = v15;
  v18 = v13;
  v19 = v11;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

}

void __104__SiriPresentationViewController_handleButtonUpFromButtonIdentifier_deviceIdentifier_timestamp_context___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  os_log_t *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained
    && objc_msgSend(WeakRetained, "_buttonIdentifierIsHoldToTalkTrigger:", objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier")))
  {
    if ((unint64_t)(objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier") - 5) <= 2)
      objc_msgSend(WeakRetained, "_invalidateCarSiriButtonHoldToTalkTimer");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(WeakRetained, "_releaseExistingTrigger");
  }
  if (objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier") == 201)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isPTTEligible")
      && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
      && (AFPreferencesTypeToSiriEnabled() & 1) == 0)
    {
      v18 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(void **)(a1 + 40);
        v20 = v18;
        objc_msgSend(v19, "remoteType");
        SiriTVStringForRemoteType();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v23 = 136315650;
        v24 = "-[SiriPresentationViewController handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]_block_invoke";
        v25 = 2112;
        v26 = v21;
        v27 = 1024;
        v28 = v22;
        _os_log_impl(&dword_215D55000, v20, OS_LOG_TYPE_DEFAULT, "%s #activation #ptt Not stopping requests as the remote - %@ is PTT Eligible, and tap released trigger - %{BOOL}d", (uint8_t *)&v23, 0x1Cu);

      }
    }
    else
    {
      v4 = (os_log_t *)MEMORY[0x24BE08FB0];
      v5 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315138;
        v24 = "-[SiriPresentationViewController handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]_block_invoke";
        _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s Stopping request due to wired mic tap", (uint8_t *)&v23, 0xCu);
      }
      v6 = objc_msgSend(MEMORY[0x24BE907C8], "requestSourceForButtonIdentifier:", objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier"));
      v7 = objc_alloc(MEMORY[0x24BE907F0]);
      objc_msgSend(*(id *)(a1 + 48), "_uiPresentationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithRequestSource:uiPresentationIdentifier:buttonContext:", v6, v8, *(_QWORD *)(a1 + 56));

      if (objc_msgSend(*(id *)(a1 + 64), "length"))
        objc_msgSend(v9, "setActivationDeviceIdentifier:", *(_QWORD *)(a1 + 64));
      v10 = objc_loadWeakRetained(v2);
      objc_msgSend(v10, "siriViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isListening");

      if (v12)
      {
        v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 136315138;
          v24 = "-[SiriPresentationViewController handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]_block_invoke";
          _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s Stopping request due to wired mic tap", (uint8_t *)&v23, 0xCu);
        }
        v14 = objc_loadWeakRetained(v2);
        objc_msgSend(v14, "siriViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stopRequestWithOptions:", v9);

      }
      v16 = objc_loadWeakRetained(v2);
      objc_msgSend(v16, "siriViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "didReceiveButtonUpWithRequestOptions:", v9);

    }
  }

}

- (void)handleButtonTapFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriPresentationViewController handleButtonTapFromButtonIdentifier:timestamp:context:]";
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation handleButtonTapFromButtonIdentifier:%@", buf, 0x16u);
  }
  if (!objc_msgSend(MEMORY[0x24BE091E0], "isTVPushToTalkEnabled")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = 0;
    goto LABEL_8;
  }
  v12 = v10;
  if (!objc_msgSend(v12, "isPTTEligible"))
  {
LABEL_8:
    objc_initWeak((id *)buf, self);
    v14 = v8;
    objc_copyWeak(&v15, (id *)buf);
    SiriUIInvokeOnMainQueue();
    objc_destroyWeak(&v15);

    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  objc_msgSend(v12, "activeDeviceBluetoothIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriPresentationViewController handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:](self, "handleButtonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:", v8, v13, v9, v12);

LABEL_9:
}

void __88__SiriPresentationViewController_handleButtonTapFromButtonIdentifier_timestamp_context___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *WeakRetained;
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v18 = CFSTR("eventSource");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSiriButtonIdentifier:", objc_msgSend(a1[4], "siriButtonIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsEventCreateCurrent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEvent:", v5);

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (-[NSObject _handleTapButtonBehavior:](WeakRetained, "_handleTapButtonBehavior:", objc_msgSend(a1[4], "siriButtonIdentifier")))
  {

LABEL_5:
    v10 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = a1[4];
      WeakRetained = v10;
      objc_msgSend(v11, "stringWithSiriButtonIdentifier:", objc_msgSend(v12, "siriButtonIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[SiriPresentationViewController handleButtonTapFromButtonIdentifier:timestamp:context:]_block_invoke";
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_215D55000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%s #activation handled for %@", (uint8_t *)&v14, 0x16u);

LABEL_8:
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v7 = objc_loadWeakRetained(a1 + 6);
  if ((objc_msgSend(v7, "_buttonIdentifierIsHoldToTalkTrigger:", objc_msgSend(a1[4], "siriButtonIdentifier")) & 1) == 0)
  {

    goto LABEL_8;
  }
  v8 = objc_loadWeakRetained(a1 + 6);
  v9 = objc_msgSend(v8, "_releaseExistingTrigger");

  if (v9)
    goto LABEL_5;
LABEL_9:
  objc_msgSend(a1[5], "_setButtonDownEventDidOccur:", 0);

}

- (void)handleButtonLongPressFromButtonIdentifier:(id)a3 deviceIdentifier:(id)a4 timestamp:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  kdebug_trace();
  v14 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "-[SiriPresentationViewController handleButtonLongPressFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s handleButtonLongPressFromButtonIdentifier:%@ deviceIdentifier:%@ timestamp:%@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v19, (id *)buf);
  v15 = v10;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __111__SiriPresentationViewController_handleButtonLongPressFromButtonIdentifier_deviceIdentifier_timestamp_context___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained[164], "isListening");
    v5 = *MEMORY[0x24BE08FB0];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
    if ((v4 & 1) != 0)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        v13 = 136315394;
        v14 = "-[SiriPresentationViewController handleButtonLongPressFromButtonIdentifier:deviceIdentifier:timestamp:cont"
              "ext:]_block_invoke";
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation handleButtonLongPressFromIdentifier:%@ whileListening:YES Ignoring", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      if (v6)
      {
        v8 = *(_QWORD *)(a1 + 32);
        v13 = 136315394;
        v14 = "-[SiriPresentationViewController handleButtonLongPressFromButtonIdentifier:deviceIdentifier:timestamp:cont"
              "ext:]_block_invoke";
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation handleButtonLongPressFromIdentifier:%@ whileListening:NO Starting a new request", (uint8_t *)&v13, 0x16u);
      }
      v9 = objc_msgSend(MEMORY[0x24BE907C8], "requestSourceForButtonIdentifier:", objc_msgSend(*(id *)(a1 + 32), "siriButtonIdentifier"));
      v10 = objc_alloc(MEMORY[0x24BE907F0]);
      objc_msgSend(*(id *)(a1 + 40), "_uiPresentationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithRequestSource:uiPresentationIdentifier:buttonContext:", v9, v11, *(_QWORD *)(a1 + 48));

      objc_msgSend(*(id *)(a1 + 56), "timeInterval");
      objc_msgSend(v12, "setButtonDownTimestamp:");
      if (objc_msgSend(*(id *)(a1 + 64), "length"))
        objc_msgSend(v12, "setActivationDeviceIdentifier:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v3, "activateWithSource:requestOptions:timestamp:", v9, v12, *(_QWORD *)(a1 + 56));

    }
  }

}

- (void)presentationWithIdentifier:(id)a3 didUpdatePresentationState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = v6;
    objc_msgSend(v7, "stringWithSiriPresentationIdentifier:", -[SiriPresentationViewController identifier](self, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[SiriPresentationViewController presentationWithIdentifier:didUpdatePresentationState:]";
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ received presentation state update %@", (uint8_t *)&v10, 0x20u);

  }
}

- (BOOL)_handleTapButtonBehavior:(int64_t)a3
{
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  SiriPresentationViewController *v19;
  int64_t v20;
  char v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = v6;
    objc_msgSend(v7, "stringWithSiriButtonIdentifier:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 136315394;
    v29 = "-[SiriPresentationViewController _handleTapButtonBehavior:]";
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation _handleTapButtonBehavior:%@", (uint8_t *)&v28, 0x16u);

  }
  v10 = objc_alloc(MEMORY[0x24BE907F0]);
  v11 = objc_msgSend(MEMORY[0x24BE907C8], "requestSourceForButtonIdentifier:", a3);
  -[SiriPresentationViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithRequestSource:uiPresentationIdentifier:", v11, v12);

  if ((unint64_t)a3 > 9)
    goto LABEL_19;
  if (((1 << a3) & 0x30E) != 0)
  {
    if (-[SiriPresentationViewController _wasScreenOffDuringActivation](self, "_wasScreenOffDuringActivation"))
    {
      v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 136315138;
        v29 = "-[SiriPresentationViewController _handleTapButtonBehavior:]";
        _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s Turning on the screen because pocket state kept the screen off during activation", (uint8_t *)&v28, 0xCu);
      }
      -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_254E174C0);

      if (v16)
      {
        -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "screenWakeRequested");
        -[SiriPresentationViewController _analytics](self, "_analytics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logEventWithType:context:", 1930, &unk_24D47F3F8);

        -[SiriPresentationViewController _setScreenOffDuringActivation:](self, "_setScreenOffDuringActivation:", 0);
LABEL_18:

LABEL_21:
        v21 = 1;
        goto LABEL_23;
      }
LABEL_22:
      v21 = 0;
      goto LABEL_23;
    }
    goto LABEL_11;
  }
  if (((1 << a3) & 0xE0) != 0)
  {
LABEL_11:
    v19 = self;
    v20 = a3;
    goto LABEL_12;
  }
  if (a3 != 4)
  {
LABEL_19:
    if (a3 == 201)
    {
      -[SiriPresentationViewController siriViewController](self, "siriViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "shortTapActionWithRequestOptions:", v13);

      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (-[AFUISiriViewController isListening](self->_siriViewController, "isListening"))
  {
    v22 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 136315138;
      v29 = "-[SiriPresentationViewController _handleTapButtonBehavior:]";
      _os_log_impl(&dword_215D55000, v22, OS_LOG_TYPE_DEFAULT, "%s Stopping request due to wired mic tap", (uint8_t *)&v28, 0xCu);
    }
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x24BE907F0]);
    -[SiriPresentationViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithRequestSource:uiPresentationIdentifier:", 17, v24);
    objc_msgSend(v17, "stopRequestWithOptions:", v25);

    goto LABEL_18;
  }
  v19 = self;
  v20 = 4;
LABEL_12:
  v21 = -[SiriPresentationViewController _handleTapDismissal:](v19, "_handleTapDismissal:", v20);
LABEL_23:

  return v21;
}

- (BOOL)_handleTapDismissal:(int64_t)a3
{
  NSObject *v5;
  BOOL v6;
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  _BOOL4 activationHandled;
  AFUISiriViewController *siriViewController;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (-[SiriPresentationViewController _cancelPendingPhoneCall](self, "_cancelPendingPhoneCall"))
    return 1;
  if (self->_siriSetupViewController)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = "-[SiriPresentationViewController _handleTapDismissal:]";
      _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s Dismissing Siri setup due to button tap", (uint8_t *)&v19, 0xCu);
    }
    -[SiriPresentationViewController _dismissSiriSetup](self, "_dismissSiriSetup");
    return 1;
  }
  v8 = -[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured");
  v9 = *MEMORY[0x24BE08FB0];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v19 = 136315138;
      v20 = "-[SiriPresentationViewController _handleTapDismissal:]";
      _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s Dismissing Siri due to button tap", (uint8_t *)&v19, 0xCu);
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      v11 = 20;
    }
    else if (a3 == 5)
    {
      -[SiriPresentationViewController siriViewController](self, "siriViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentRequestOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "requestSource");

      if (v17 == 37)
        v11 = 41;
      else
        v11 = 50;
    }
    else
    {
      v11 = 5;
    }
    v6 = 1;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 1, v11);
    -[SiriPresentationViewController _requestDismissalWithOptions:](self, "_requestDismissalWithOptions:", v18);

  }
  else
  {
    if (v10)
    {
      activationHandled = self->_activationHandled;
      siriViewController = self->_siriViewController;
      v14 = v9;
      v19 = 136315650;
      v20 = "-[SiriPresentationViewController _handleTapDismissal:]";
      v21 = 1024;
      v22 = activationHandled;
      v23 = 1024;
      v24 = -[AFUISiriViewController isVisible](siriViewController, "isVisible");
      _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s Not handled: _activationHandled=%d [_siriViewController isVisible]=%d", (uint8_t *)&v19, 0x18u);

    }
    return 0;
  }
  return v6;
}

- (void)updateCurrentLockState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location;

  v4 = a3;
  kdebug_trace();
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  v5 = v4;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __57__SiriPresentationViewController_updateCurrentLockState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentLockState:", objc_msgSend(*(id *)(a1 + 32), "SASLockState"));

}

- (void)setCurrentLockState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t currentLockState;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_currentLockState != a3)
  {
    self->_currentLockState = a3;
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      currentLockState = self->_currentLockState;
      v8 = 136315394;
      v9 = "-[SiriPresentationViewController setCurrentLockState:]";
      v10 = 2048;
      v11 = currentLockState;
      _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation Lock state in SiriPresentationViewController updated to %zd", (uint8_t *)&v8, 0x16u);
    }
    if (self->_siriViewController)
    {
      -[SiriPresentationViewController siriViewController](self, "siriViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLockState:", a3);

    }
  }
}

- (void)_requestDismissal
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:", 0, 1);
  -[SiriPresentationViewController _requestDismissalWithOptions:](self, "_requestDismissalWithOptions:", v3);

}

- (void)_requestDismissalWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SiriPresentationViewController _invalidateCarSiriButtonHoldToTalkTimer](self, "_invalidateCarSiriButtonHoldToTalkTimer");
  -[SiriPresentationViewController _setScreenOffDuringActivation:](self, "_setScreenOffDuringActivation:", 0);
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SiriPresentationViewController _requestDismissalWithOptions:]";
    _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_INFO, "%s wantsDismissal", (uint8_t *)&v6, 0xCu);
  }
  -[SiriPresentationViewController presentationDismissalRequestedWithOptions:](self, "presentationDismissalRequestedWithOptions:", v4);

}

- (void)_carSiriButtonHoldToTalkIntervalFiredWithButtonIdentifier:(int64_t)a3
{
  double v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[SiriPresentationViewController _carSiriButtonTimeInterval](self, "_carSiriButtonTimeInterval");
  if (v5 != 0.0)
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[SiriPresentationViewController _carSiriButtonHoldToTalkIntervalFiredWithButtonIdentifier:]";
      _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_INFO, "%s #activation Starting new Speech Request due to Car Siri button long press timer", (uint8_t *)&v11, 0xCu);
    }
    v7 = objc_alloc(MEMORY[0x24BE907F0]);
    v8 = objc_msgSend(MEMORY[0x24BE907C8], "requestSourceForButtonIdentifier:", a3);
    -[SiriPresentationViewController _uiPresentationIdentifier](self, "_uiPresentationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithRequestSource:uiPresentationIdentifier:", v8, v9);

    -[SiriPresentationViewController activateWithRequestOptions:](self, "activateWithRequestOptions:", v10);
  }
  -[SiriPresentationViewController _invalidateCarSiriButtonHoldToTalkTimer](self, "_invalidateCarSiriButtonHoldToTalkTimer");
}

- (void)cancelPendingActivationEventWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  kdebug_trace();
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SiriPresentationViewController cancelPendingActivationEventWithReason:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s cancelPendingActivationEventWithReason:%@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v7, (id *)buf);
  v6 = v4;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);

}

void __73__SiriPresentationViewController_cancelPendingActivationEventWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cancelPendingActivationWithReason:", objc_msgSend(*(id *)(a1 + 32), "cancelReason"));

}

- (void)_cancelPendingActivationWithReason:(unint64_t)a3
{
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = v6;
    objc_msgSend(v7, "stringWithSiriPresentationActivationCancelReason:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[SiriPresentationViewController _cancelPendingActivationWithReason:]";
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s cancelReason=%@", buf, 0x16u);

  }
  if (self->_activationHandled)
  {
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      -[SiriPresentationViewController _cancelPendingActivationWithReason:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    if (self->_receivedIncomingPhoneCall)
      v18 = 5;
    else
      v18 = a3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithSiriPresentationActivationCancelReason:", v18, CFSTR("cancelReason"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    AFAnalyticsEventCreateCurrent();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logEvent:", v22);

    if (self->_unownedConnection)
    {
      -[SiriPresentationViewController _cleanupUnownedConnection](self, "_cleanupUnownedConnection");
      -[SiriPresentationViewController _requestDismissal](self, "_requestDismissal");
    }

  }
}

- (BOOL)_buttonIdentifierIsHoldToTalkTrigger:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 9 && ((0x183u >> (a3 - 1)) & 1) != 0
      || -[SiriPresentationViewController identifier](self, "identifier") == 2
      || -[SiriPresentationViewController identifier](self, "identifier") == 4;
}

- (void)bulletinManagerDidChangeBulletins
{
  -[AFUISiriViewController setAlertContext](self->_siriViewController, "setAlertContext");
}

- (void)siriSessionShouldExtendAudioSessionForImminentPhoneCall
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriPresentationViewController siriSessionShouldExtendAudioSessionForImminentPhoneCall]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler Extending audio session for imminent phone call. Setting _waitingForTelephonyToStart:YES", (uint8_t *)&v4, 0xCu);
  }
  -[SiriPresentationViewController _setWaitingForTelephonyToStart:](self, "_setWaitingForTelephonyToStart:", 1);
}

- (void)siriSessionShouldEndExtendAudioSessionForImminentPhoneCall
{
  void *v3;
  void *v4;
  AFUISiriViewController *siriViewController;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    siriViewController = self->_siriViewController;
    v6 = v3;
    objc_msgSend(v4, "numberWithBool:", -[AFUISiriViewController isVisible](siriViewController, "isVisible"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[SiriPresentationViewController siriSessionShouldEndExtendAudioSessionForImminentPhoneCall]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler stop extending audio session while visible: %@", (uint8_t *)&v8, 0x16u);

  }
  if (-[AFUISiriViewController isVisible](self->_siriViewController, "isVisible"))
  {
    self->_waitingForTelephonyToStart = 0;
    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__telephonyHasStarted, 0);
  }
  else
  {
    -[SiriPresentationViewController _setWaitingForTelephonyToStart:](self, "_setWaitingForTelephonyToStart:", 0);
  }
}

- (AFUISiriViewController)siriViewController
{
  AFUISiriViewController *siriViewController;
  void *v4;

  siriViewController = self->_siriViewController;
  if (!siriViewController)
  {
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SiriPresentationViewController siriViewController].cold.1(v4);
    siriViewController = self->_siriViewController;
  }
  return siriViewController;
}

- (id)_createSiriViewControllerWithRequestOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  _BOOL8 v8;
  AFConnection *unownedConnection;
  AFConnection *v10;
  AFConnection *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  FBSDisplayConfiguration *displayConfiguration;
  void *v18;
  void *v19;
  AFConnection *v20;
  _BOOL8 v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "requestSource");
  else
    v6 = 0;
  v7 = -[SiriPresentationViewController _viewModeForRequestOptions:](self, "_viewModeForRequestOptions:", v5);
  self->_currentViewMode = v7;
  v8 = -[SiriPresentationViewController _shouldAllowResizingBetweenModesForViewMode:](self, "_shouldAllowResizingBetweenModesForViewMode:", v7);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA84F0]), "initWithFlamesViewFidelity:isSystemHostedPresentation:allowResizingBetweenModes:siriViewMode:showsSensitiveUI:", -[SiriPresentationViewController preferredFlamesViewFidelity](self, "preferredFlamesViewFidelity"), 1, v8, v7, 1);
  unownedConnection = self->_unownedConnection;
  if (unownedConnection)
    v10 = unownedConnection;
  else
    v10 = (AFConnection *)objc_alloc_init(MEMORY[0x24BE09170]);
  v11 = v10;
  v12 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    SASRequestSourceGetName();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v31 = "-[SiriPresentationViewController _createSiriViewControllerWithRequestOptions:]";
    v32 = 2112;
    v33 = (const __CFString *)v11;
    v34 = 2112;
    v35 = v29;
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation Creating new view controller with connection: %@, configuration: %@, requestSource: %@", buf, 0x2Au);

  }
  if (-[SiriPresentationViewController _canPresentSiriEffectsViewControllerWithRequestOptions:](self, "_canPresentSiriEffectsViewControllerWithRequestOptions:", v5))
  {
    -[SiriPresentationViewController siriEffectsViewController](self, "siriEffectsViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_alloc(MEMORY[0x24BE09548]);
  displayConfiguration = self->_displayConfiguration;
  -[SiriPresentationViewController _viewHostingInstrumentationHandler](self, "_viewHostingInstrumentationHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithConnection:configuration:requestSource:displayConfiguration:edgeLightViewProvider:instrumentationHandler:", v11, v29, v6, displayConfiguration, v15, v18);

  v20 = self->_unownedConnection;
  self->_unownedConnection = 0;

  objc_msgSend(v19, "setDataSource:", self);
  objc_msgSend(v19, "setDelegate:", self);
  objc_msgSend(v19, "setLockState:", -[SiriPresentationViewController currentLockState](self, "currentLockState"));
  -[SiriPresentationViewController hostedPresentationFrame](self, "hostedPresentationFrame");
  objc_msgSend(v19, "setHostedPresentationFrame:");
  if ((objc_msgSend(v5, "isConnectedToCarPlay") & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    v21 = 1;
    if (v7 != 4 && v7 != 8)
      v21 = -[SiriPresentationViewController _AFPreferencesAlwaysEyesFreeEnabled](self, "_AFPreferencesAlwaysEyesFreeEnabled");
  }
  objc_msgSend(v19, "setSupportsCarPlayVehicleData:", objc_msgSend(v5, "supportsCarPlayVehicleData"));
  objc_msgSend(v19, "setEyesFree:", v21);
  objc_msgSend(v19, "setDeviceInStarkMode:", objc_msgSend(v5, "isForStark"));
  objc_msgSend(v19, "setCarDNDActive:", objc_msgSend(v5, "isForCarDND"));
  objc_msgSend(v19, "setDirectActionEvent:", objc_msgSend(v5, "directActionEvent"));
  v22 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    if (objc_msgSend(v5, "isForStark"))
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    objc_msgSend(v5, "carDNDStatus");
    CARAutomaticFeatureStateGetName();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "supportsCarPlayVehicleData");
    NSStringFromBOOL();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v31 = "-[SiriPresentationViewController _createSiriViewControllerWithRequestOptions:]";
    v32 = 2112;
    v33 = v24;
    v34 = 2112;
    v35 = v25;
    v36 = 2112;
    v37 = v26;
    v38 = 2112;
    v39 = v27;
    _os_log_impl(&dword_215D55000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #carPlay #carDnd #eyesFree isForStark: %@, carDNDStatus: %@, eyesFree: %@, supportsCarPlayVehicleData: %@", buf, 0x34u);

  }
  return v19;
}

- (BOOL)siriViewControllerConfigured
{
  return self->_siriViewController != 0;
}

- (void)_scheduleConnectionHouseKeepingAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithDouble:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SiriPresentationViewController _scheduleConnectionHouseKeepingAfterDelay:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_215D55000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation delay: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__processConnectionHouseKeeping, 0);
  -[SiriPresentationViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__processConnectionHouseKeeping, 0, a3);
}

- (void)_processConnectionHouseKeeping
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriPresentationViewController _processConnectionHouseKeeping]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation", (uint8_t *)&v4, 0xCu);
  }
  -[SiriPresentationViewController _cleanupUnownedConnection](self, "_cleanupUnownedConnection");
}

- (void)_cleanupUnownedConnection
{
  NSObject *v3;
  AFConnection *unownedConnection;
  AFConnection *v5;
  AFConnection *v6;
  int v7;
  const char *v8;
  __int16 v9;
  AFConnection *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    unownedConnection = self->_unownedConnection;
    v7 = 136315394;
    v8 = "-[SiriPresentationViewController _cleanupUnownedConnection]";
    v9 = 2112;
    v10 = unownedConnection;
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _unownedConnection: %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = self->_unownedConnection;
  if (v5)
  {
    -[AFConnection cancelRequest](v5, "cancelRequest");
    -[AFConnection endSession](self->_unownedConnection, "endSession");
    -[AFConnection invalidate](self->_unownedConnection, "invalidate");
    -[AFConnection setSpeechDelegate:](self->_unownedConnection, "setSpeechDelegate:", 0);
    -[AFConnection setDelegate:](self->_unownedConnection, "setDelegate:", 0);
    v6 = self->_unownedConnection;
    self->_unownedConnection = 0;

  }
}

- (void)_clearSiriViewControllerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SiriPresentationViewController *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __73__SiriPresentationViewController__clearSiriViewControllerWithCompletion___block_invoke;
  v10 = &unk_24D47AC18;
  v11 = self;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x2199F1430](&v7);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", v7, v8, v9, v10, v11))
    v6[2](v6);
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], v6);

}

void __73__SiriPresentationViewController__clearSiriViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SiriPresentationViewController _clearSiriViewControllerWithCompletion:]_block_invoke";
    _os_log_impl(&dword_215D55000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation _clearSiriViewController", buf, 0xCu);
  }
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 1312);
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCarSiriButtonHoldToTalkTimer");
  objc_msgSend(*(id *)(a1 + 32), "_cleanupUnownedConnection");
  v4 = MEMORY[0x2199F1430](*(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1072);
  *(_QWORD *)(v5 + 1072) = v4;

  v7 = *(void **)(a1 + 32);
  if (v3)
  {
    v8 = (void *)MEMORY[0x24BDBCF40];
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __73__SiriPresentationViewController__clearSiriViewControllerWithCompletion___block_invoke_261;
    v15 = &unk_24D47AB50;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v3;
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v12, 3.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClearSiriViewControllerTimer:", v9, v12, v13, v14, v15);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1312), "siriDidDeactivate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1312), "setDataSource:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1312), "underlyingConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1312), "willMoveToParentViewController:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1312), "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1312), "removeFromParentViewController");
    objc_msgSend(*(id *)(a1 + 32), "setSiriViewController:", 0);

    objc_destroyWeak(&v17);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishClearingSiriViewController:", 0);
  }
  objc_destroyWeak((id *)buf);

}

void __73__SiriPresentationViewController__clearSiriViewControllerWithCompletion___block_invoke_261(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriPresentationViewController _clearSiriViewControllerWithCompletion:]_block_invoke";
    _os_log_impl(&dword_215D55000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation calling didDismiss from inside clearSiriViewControllerTimer", (uint8_t *)&v4, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishClearingSiriViewController:", *(_QWORD *)(a1 + 32));

}

- (void)_finishClearingSiriViewController:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void (**dismissalCompletion)(void);
  id v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[SiriPresentationViewController _finishClearingSiriViewController:]";
    _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation _finishClearingSiriViewController", (uint8_t *)&v12, 0xCu);
  }
  -[SiriPresentationViewController _invalidateCarSiriButtonHoldToTalkTimer](self, "_invalidateCarSiriButtonHoldToTalkTimer");
  -[SiriPresentationViewController clearSiriViewControllerTimer](self, "clearSiriViewControllerTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[SiriPresentationViewController setClearSiriViewControllerTimer:](self, "setClearSiriViewControllerTimer:", 0);
  v8 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[SiriPresentationViewController _finishClearingSiriViewController:]";
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation clearSiriViewControllerTimer was invalidated", (uint8_t *)&v12, 0xCu);
  }
  objc_msgSend(v4, "setDelegate:", 0);

  v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[SiriPresentationViewController _finishClearingSiriViewController:]";
    _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s Attempting to enable the SpringBoard idle timer because we are losing the SiriViewController", (uint8_t *)&v12, 0xCu);
  }
  -[SiriPresentationViewController _enableSpringBoardIdleTimer](self, "_enableSpringBoardIdleTimer");
  dismissalCompletion = (void (**)(void))self->_dismissalCompletion;
  if (dismissalCompletion)
  {
    dismissalCompletion[2]();
    v11 = self->_dismissalCompletion;
    self->_dismissalCompletion = 0;

  }
}

- (void)_invalidateCarSiriButtonHoldToTalkTimer
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SiriPresentationViewController _carSiriButtonHoldToTalkTimer](self, "_carSiriButtonHoldToTalkTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v5 = v4;
      -[SiriPresentationViewController _carSiriButtonHoldToTalkTimer](self, "_carSiriButtonHoldToTalkTimer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[SiriPresentationViewController _invalidateCarSiriButtonHoldToTalkTimer]";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_INFO, "%s #activation Invalidating _carSiriButtonHoldToTalkTimer (%@)…", (uint8_t *)&v8, 0x16u);

    }
    -[SiriPresentationViewController _carSiriButtonHoldToTalkTimer](self, "_carSiriButtonHoldToTalkTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[SiriPresentationViewController _setCarSiriButtonHoldToTalkTimer:](self, "_setCarSiriButtonHoldToTalkTimer:", 0);
    -[SiriPresentationViewController _setCarSiriButtonTimeInterval:](self, "_setCarSiriButtonTimeInterval:", 0.0);
  }
}

- (void)_handleContextClearForRequestOptions:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[SiriPresentationViewController _isDelayingSessionEnd](self, "_isDelayingSessionEnd")
    && (objc_msgSend(v4, "isForStark") & 1) != 0
    || objc_msgSend(v4, "directActionEvent") && (objc_msgSend(v4, "isForStark") & 1) != 0)
  {
    v5 = 6;
  }
  else
  {
    v5 = 7;
  }
  if (objc_msgSend(v4, "requestSource") == 26)
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[SiriPresentationViewController _handleContextClearForRequestOptions:]";
      _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s Triggerless request, dont clear Siri context", (uint8_t *)&v8, 0xCu);
    }
    v5 = 3;
  }
  -[SiriPresentationViewController siriViewController](self, "siriViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetContextTypes:", v5);

}

- (void)_dismissSiriSetup
{
  UINavigationController *siriSetupNavigationController;
  _QWORD v4[4];
  id v5;
  id location;

  if (self->_siriSetupNavigationController)
  {
    objc_initWeak(&location, self);
    siriSetupNavigationController = self->_siriSetupNavigationController;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __51__SiriPresentationViewController__dismissSiriSetup__block_invoke;
    v4[3] = &unk_24D47A790;
    objc_copyWeak(&v5, &location);
    -[UINavigationController dismissViewControllerAnimated:completion:](siriSetupNavigationController, "dismissViewControllerAnimated:completion:", 1, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __51__SiriPresentationViewController__dismissSiriSetup__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSiriSetupNavigationController:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setSiriSetupViewController:", 0);

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 0, 30);
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "dismissWithOptions:", v5);

}

- (void)_wasDismissedWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char v9;
  char v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  kdebug_trace();
  if (-[SiriPresentationViewController _isDelayingSessionEnd](self, "_isDelayingSessionEnd"))
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_siriView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMode:", 0);

    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelSpeechRecordingIfNecessary");

LABEL_7:
    v9 = 1;
    goto LABEL_9;
  }
  if (-[SiriPresentationViewController siriSetupViewControllerPresented](self, "siriSetupViewControllerPresented"))
  {
    -[SiriPresentationViewController _removeSetupViewControllerIfNecessary](self, "_removeSetupViewControllerIfNecessary");
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SiriPresentationViewController _wasDismissedWithCompletion:]";
      _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s Attempting to enable the SpringBoard idle timer because we are losing the setupViewController", (uint8_t *)&v11, 0xCu);
    }
    -[SiriPresentationViewController _enableSpringBoardIdleTimer](self, "_enableSpringBoardIdleTimer");
    goto LABEL_7;
  }
  -[SiriPresentationViewController _clearSiriViewControllerWithCompletion:](self, "_clearSiriViewControllerWithCompletion:", v4);
  v9 = 0;
LABEL_9:
  if (-[SiriPresentationViewController _startGuidedAccessOnDismissal](self, "_startGuidedAccessOnDismissal"))
  {
    _AXSGuidedAccessStartSession();
    -[SiriPresentationViewController _setStartGuidedAccessOnDismissal:](self, "_setStartGuidedAccessOnDismissal:", 0);
  }
  v10 = v9 ^ 1;
  if (!v4)
    v10 = 1;
  if ((v10 & 1) == 0)
    v4[2](v4);

}

- (void)_siriDidOpenURL:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  kdebug_trace();
  v5 = _ACIsTelephonyURL(v4);

  if (v5)
    -[SiriPresentationViewController _setWaitingForTelephonyToStart:](self, "_setWaitingForTelephonyToStart:", 1);
}

- (BOOL)_releaseExistingTrigger
{
  NSObject *v3;
  const __CFString *v4;
  void (**buttonTrigger)(id, uint64_t);
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    if (self->_buttonTrigger)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v8 = 136315394;
    v9 = "-[SiriPresentationViewController _releaseExistingTrigger]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s _buttonTrigger=%@", (uint8_t *)&v8, 0x16u);
  }
  buttonTrigger = (void (**)(id, uint64_t))self->_buttonTrigger;
  if (buttonTrigger)
  {
    buttonTrigger[2](self->_buttonTrigger, 2);
    v6 = self->_buttonTrigger;
    self->_buttonTrigger = 0;

    -[SiriPresentationViewController _setButtonDownEventDidOccur:](self, "_setButtonDownEventDidOccur:", 0);
  }
  return buttonTrigger != 0;
}

- (BOOL)_isDeviceButton:(int64_t)a3
{
  return a3 == 9 || (unint64_t)(a3 - 1) < 2;
}

- (void)_enableSpringBoardIdleTimer
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (-[SiriPresentationViewController presentationHostedInSpringBoard](self, "presentationHostedInSpringBoard"))
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[SiriPresentationViewController _enableSpringBoardIdleTimer]";
      _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s Siri enabled SpringBoard idle timer", (uint8_t *)&v4, 0xCu);
    }
    -[SiriPresentationViewController _setSpringBoardIdleTimerDisabled:](self, "_setSpringBoardIdleTimerDisabled:", 0);
  }
}

- (void)_dismissDueToUnexpectedError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    -[SiriPresentationViewController _dismissDueToUnexpectedError:].cold.1();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 0, 21);
  -[SiriPresentationViewController _requestDismissalWithOptions:](self, "_requestDismissalWithOptions:", v5);

}

- (int64_t)_impliedDismissalReasonFromState
{
  if (self->_instrumentationDismissalState.punchedOut)
    return 9;
  if (self->_instrumentationDismissalState.incomingPhoneCallDetected)
    return 2;
  if (self->_instrumentationDismissalState.outgoingPhoneCallDetected)
    return 3;
  if (self->_instrumentationDismissalState.fluidDismissalSet)
    return 6;
  if (-[NSString length](self->_instrumentationDismissalState.attemptedAppLaunchIdentifier, "length"))
    return 29;
  return 0;
}

- (void)_logDismissalRequestedForViewMode:(int64_t)a3 withDismissalReason:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  SASDismissalReasonGetName();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v10 = CFSTR("reason");
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationViewController _analytics](self, "_analytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logEventWithType:context:", 1460, v8);

  }
  -[SiriPresentationViewController _logDismissalToPowerLogWithReason:](self, "_logDismissalToPowerLogWithReason:", a4);
  -[SiriPresentationViewController _emitInstrumentationDismissalStateWithReason:](self, "_emitInstrumentationDismissalStateWithReason:", a4);

}

- (void)_logDismissalToPowerLogWithReason:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("ReasonEnd");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent();
}

- (void)_instrumentSuccessfulAppLaunchIfNecessary
{
  InstrumentationDismissalState *p_instrumentationDismissalState;
  void *v4;
  id v5;

  p_instrumentationDismissalState = &self->_instrumentationDismissalState;
  if (-[NSString length](self->_instrumentationDismissalState.attemptedAppLaunchIdentifier, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BE95B58]);
    objc_msgSend(v5, "setAppID:", p_instrumentationDismissalState->attemptedAppLaunchIdentifier);
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emitInstrumentationEvent:", v5);

  }
}

- (void)_emitInstrumentationDismissalStateWithReason:(int64_t)a3
{
  void *v5;

  -[SiriPresentationViewController siriViewController](self, "siriViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitUIStateTransitionForSiriDismissalWithReason:", a3);

  -[SiriPresentationViewController _resetStateForInstrumentation](self, "_resetStateForInstrumentation");
}

- (int64_t)_dismissalReasonForDismissalWithOptions:(id)a3
{
  int64_t v4;
  int64_t v5;

  v4 = objc_msgSend(a3, "dismissalReason");
  v5 = -[SiriPresentationViewController _impliedDismissalReasonFromState](self, "_impliedDismissalReasonFromState");
  if (!v4)
    return -[SiriPresentationViewController _impliedDismissalReasonFromState](self, "_impliedDismissalReasonFromState");
  if (v5 == 29 && v4 == 4)
    return 29;
  else
    return v4;
}

- (void)_resetStateForInstrumentation
{
  InstrumentationDismissalState *p_instrumentationDismissalState;
  NSString *attemptedAppLaunchIdentifier;

  p_instrumentationDismissalState = &self->_instrumentationDismissalState;
  *(_DWORD *)&self->_instrumentationDismissalState.fluidDismissalSet = 0;
  attemptedAppLaunchIdentifier = self->_instrumentationDismissalState.attemptedAppLaunchIdentifier;
  p_instrumentationDismissalState->attemptedAppLaunchIdentifier = (NSString *)&stru_24D47B258;

}

- (id)_analytics
{
  return (id)objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
}

- (id)_viewHostingInstrumentationHandler
{
  SRUIFPlatformHostingInstrumentationHandler *viewHostingInstrumentationHandler;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SRUIFPlatformHostingInstrumentationHandler *v12;
  SRUIFPlatformHostingInstrumentationHandler *v13;

  viewHostingInstrumentationHandler = self->_viewHostingInstrumentationHandler;
  if (!viewHostingInstrumentationHandler)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
      -[SiriPresentationViewController _viewHostingInstrumentationHandler].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = (SRUIFPlatformHostingInstrumentationHandler *)objc_opt_new();
    v13 = self->_viewHostingInstrumentationHandler;
    self->_viewHostingInstrumentationHandler = v12;

    viewHostingInstrumentationHandler = self->_viewHostingInstrumentationHandler;
  }
  return viewHostingInstrumentationHandler;
}

- (void)_logSignatureWithType:(id)a3 subType:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    -[SiriPresentationViewController _logSignatureWithType:subType:context:].cold.1();
  objc_msgSend(MEMORY[0x24BE92078], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportIssueForType:subType:context:processIdentifier:walkboutStatus:", v7, v8, v9, objc_msgSend(v11, "processIdentifier"), AFIsInternalInstall());

}

- (void)siriViewController:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v9, &location);
  v8 = v7;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __94__SiriPresentationViewController_siriViewController_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 122, *(id *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)siriViewController:(id)a3 failedToLaunchAppWithBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __91__SiriPresentationViewController_siriViewController_failedToLaunchAppWithBundleIdentifier___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[122];
    WeakRetained[122] = &stru_24D47B258;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)siriViewControllerDidFinishDismissing:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SiriPresentationViewController siriViewControllerDidFinishDismissing:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation siriViewControllerDidFinishDismissing: %@", (uint8_t *)&v7, 0x16u);
  }
  if (self->_clearSiriViewControllerTimer)
  {
    -[SiriPresentationViewController _finishClearingSiriViewController:](self, "_finishClearingSiriViewController:", v4);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:", 0, 0);
    -[SiriPresentationViewController dismissWithOptions:](self, "dismissWithOptions:", v6);

  }
}

- (void)siriViewController:(id)a3 didEncounterUnexpectedError:(id)a4
{
  -[SiriPresentationViewController _dismissDueToUnexpectedError:](self, "_dismissDueToUnexpectedError:", a4);
}

- (void)dismissSiriViewController:(id)a3 withReason:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    SASDismissalReasonGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[SiriPresentationViewController dismissSiriViewController:withReason:]";
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #punchout #activation %@ %@", (uint8_t *)&v11, 0x20u);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 1, a4);
  -[SiriPresentationViewController presentationDismissalRequestedWithOptions:](self, "presentationDismissalRequestedWithOptions:", v10);

}

- (void)startGuidedAccessForSiriViewController:(id)a3
{
  id v4;

  -[SiriPresentationViewController _setStartGuidedAccessOnDismissal:](self, "_setStartGuidedAccessOnDismissal:", 1);
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:", 0, 1);
  -[SiriPresentationViewController presentationDismissalRequestedWithOptions:](self, "presentationDismissalRequestedWithOptions:", v4);

}

- (id)siriViewController:(id)a3 willStartRequestWithOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  AFRequestCompletionOptions *v8;
  AFRequestCompletionOptions *completionOptions;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;

  v5 = a4;
  objc_msgSend(v5, "requestInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "requestInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "activationEvent") == 6 || objc_msgSend(v7, "activationEvent") == 9)
    {
      objc_msgSend(v7, "requestCompletionOptions");
      v8 = (AFRequestCompletionOptions *)objc_claimAutoreleasedReturnValue();
      completionOptions = self->_completionOptions;
      self->_completionOptions = v8;

    }
  }
  v10 = objc_msgSend(v5, "requestSource");
  v11 = objc_msgSend(v5, "requestSource") == 2 && objc_msgSend(v5, "previousInteractionInputType") == 1;
  if (v10 == 48 || v11)
  {
    -[SiriPresentationViewController _presentSiriEffectsWithRequestOptions:](self, "_presentSiriEffectsWithRequestOptions:", v5);
  }
  else if (objc_msgSend(v5, "inputType") == 1 || objc_msgSend(v5, "requestSource") == 32)
  {
    -[SiriPresentationViewController _tearDownSiriEffectsViewController](self, "_tearDownSiriEffectsViewController");
  }
  -[SiriPresentationViewController _updateRequestOptionsWithTestingInput:](self, "_updateRequestOptionsWithTestingInput:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)siriViewController:(id)a3 didStopRequestWithOptions:(id)a4
{
  return a4;
}

- (id)_updateRequestOptionsWithTestingInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (-[SiriPresentationViewController _hasTestingInput](self, "_hasTestingInput"))
  {
    -[SiriPresentationViewController _dequeueTestingInput](self, "_dequeueTestingInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type");
    if (v6 == 2)
    {
      objc_msgSend(v5, "recordedSpeechURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSpeechFileURL:", v7);
    }
    else
    {
      if (v6 != 1)
      {
LABEL_7:

        return v4;
      }
      objc_msgSend(v5, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setText:", v7);
    }

    goto LABEL_7;
  }
  return v4;
}

- (BOOL)siriViewControllerShouldEndSession:(id)a3
{
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 waitingForTelephonyToStart;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = !-[SiriPresentationViewController _isDelayingSessionEnd](self, "_isDelayingSessionEnd", a3);
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    waitingForTelephonyToStart = self->_waitingForTelephonyToStart;
    v10 = 136315650;
    v11 = "-[SiriPresentationViewController siriViewControllerShouldEndSession:]";
    v12 = 2112;
    v13 = v7;
    v14 = 1024;
    v15 = waitingForTelephonyToStart;
    _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #punchout shouldEnd:%@ waitingForTelephonyToStart:%i", (uint8_t *)&v10, 0x1Cu);

  }
  return v4;
}

- (void)siriViewController:(id)a3 siriIdleAndQuietStatusDidChange:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (-[SiriPresentationViewController presentationHostedInSpringBoard](self, "presentationHostedInSpringBoard", a3))
    -[SiriPresentationViewController _setSpringBoardIdleTimerDisabled:](self, "_setSpringBoardIdleTimerDisabled:", !v4);
  self->_isIdleAndQuiet = v4;
}

- (void)_setScreenOffDuringActivation:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[SiriPresentationViewController _setScreenOffDuringActivation:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriadUI Setting wasScreenOffDuringActivation to %@", (uint8_t *)&v8, 0x16u);

  }
  self->_wasScreenOffDuringActivation = a3;
}

- (void)openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v7 = a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    NSStringFromBOOL();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v27 = "-[SiriPresentationViewController openURL:bundleId:inPlace:completion:]";
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v15;
    v32 = 2112;
    v33 = v10;
    _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s #punchout 2 bundleId:%@ inPlace:%@ url:%@", buf, 0x2Au);

  }
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEA8590]))
  {
    objc_msgSend(MEMORY[0x24BEA8528], "defaultBrowserBundleIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v16;
  }
  v17 = objc_alloc_init(MEMORY[0x24BE90848]);
  v18 = v17;
  if (v7)
    v19 = 2;
  else
    v19 = 1;
  objc_msgSend(v17, "setPunchoutStyle:", v19);
  objc_msgSend(v18, "setBundleIdentifier:", v11);
  if (v10)
  {
    objc_initWeak((id *)buf, self);
    v20 = (void *)MEMORY[0x24BDC1520];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __70__SiriPresentationViewController_openURL_bundleId_inPlace_completion___block_invoke;
    v21[3] = &unk_24D47AC40;
    v22 = v18;
    v23 = v10;
    objc_copyWeak(&v25, (id *)buf);
    v24 = v12;
    objc_msgSend(v20, "getAppLinkWithURL:completionHandler:", v23, v21);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[SiriPresentationViewController _punchout:completion:](self, "_punchout:completion:", v18, v12);
  }

}

void __70__SiriPresentationViewController_openURL_bundleId_inPlace_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(a2, "targetApplicationProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBundleIdentifier:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "setUrl:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_punchout:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)_punchout:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  v8 = v6;
  v9 = v7;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __55__SiriPresentationViewController__punchout_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "siriPresentationControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SiriPresentationViewController__punchout_completion___block_invoke_2;
  v7[3] = &unk_24D47AC68;
  v8 = v6;
  objc_copyWeak(&v10, v2);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "siriPresentation:requestsPunchout:withHandler:", v5, v8, v7);

  objc_destroyWeak(&v10);
}

void __55__SiriPresentationViewController__punchout_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  _QWORD *WeakRetained;
  _QWORD *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x24BE08FB0];
  v7 = (id)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if ((a2 & 1) != 0)
    {
      v9 = CFSTR("Completed");
    }
    else
    {
      objc_msgSend(v5, "localizedDescription");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v18 = 136315650;
    v19 = "-[SiriPresentationViewController _punchout:completion:]_block_invoke_2";
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_215D55000, v7, OS_LOG_TYPE_DEFAULT, "%s #punchout 3 %@ %@", (uint8_t *)&v18, 0x20u);
    if ((a2 & 1) == 0)

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 969) = a2;
    if ((_DWORD)a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = _ACIsTelephonyURL(v12);

      if (v13)
      {
        objc_msgSend(v11, "siriViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "telephonyRequestCompleted");

      }
    }
    if (objc_msgSend(*(id *)(a1 + 32), "punchoutStyle") == 2 && v11[155] == 5)
    {
      v15 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[SiriPresentationViewController _punchout:completion:]_block_invoke";
        _os_log_impl(&dword_215D55000, v15, OS_LOG_TYPE_DEFAULT, "%s #punchout 4 Deactivating scene and returning focus back to CarPlay", (uint8_t *)&v18, 0xCu);
      }
      objc_msgSend(v11, "siriViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deactivateScene");

    }
    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
      (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, a2);
  }

}

- (BOOL)siriViewController:(id)a3 attemptUnlockWithPassword:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;

  v5 = a4;
  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_254E174C0);

  if (v7)
  {
    -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "siriPresentation:requestsDeviceUnlockWithPassword:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)siriViewController:(id)a3 updateHomeAffordanceForBlurVisibilty:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  uint64_t v7;

  v4 = a4;
  if (-[SiriPresentationViewController isAmbientPresented](self, "isAmbientPresented", a3))
    v6 = AFDeviceSupportsSystemAssistantExperience() ^ 1;
  else
    v6 = 1;
  if ((v4 & v6) != 0)
    v7 = 0;
  else
    v7 = 2;
  -[SiriPresentationViewController _requestHomeAffordanceSuppression:](self, "_requestHomeAffordanceSuppression:", v7);
}

- (void)_requestHomeAffordanceSuppression:(int64_t)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (a3 == 1 || !self->_isVoiceActivationMaskShown)
    {
      -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "siriPresentation:setHomeAffordanceSuppression:", self, a3);

      v9 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        v11 = v9;
        objc_msgSend(v10, "stringWithSiriHomeAffordanceSuppression:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315394;
        v14 = "-[SiriPresentationViewController _requestHomeAffordanceSuppression:]";
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s #Compact: Telling SpringBoard that the Siri Home affordance state is %@", (uint8_t *)&v13, 0x16u);

      }
    }
    else
    {
      v7 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315138;
        v14 = "-[SiriPresentationViewController _requestHomeAffordanceSuppression:]";
        _os_log_impl(&dword_215D55000, v7, OS_LOG_TYPE_DEFAULT, "%s #Compact: Not showing Home Affordance as we are showing voiceActivationMask, Returning", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)siriViewController:(id)a3 didCompleteRequestWithError:(id)a4
{
  NSObject *v5;
  AFRequestCompletionOptions *completionOptions;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__SiriPresentationViewController_siriViewController_didCompleteRequestWithError___block_invoke;
  v7[3] = &unk_24D47A790;
  objc_copyWeak(&v8, &location);
  dispatch_async(v5, v7);

  completionOptions = self->_completionOptions;
  self->_completionOptions = 0;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __81__SiriPresentationViewController_siriViewController_didCompleteRequestWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "siriViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "carDNDActive"))
    {
LABEL_5:

      WeakRetained = v5;
      goto LABEL_6;
    }
    objc_msgSend(v5, "siriViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "currentSource");

    WeakRetained = v5;
    if (v4 == 8)
    {
      objc_msgSend(MEMORY[0x24BEA8510], "sharedPreferences");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setVoiceRequestMadeWhileInCarDND:", 1);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)siriViewController:(id)a3 requestsPresentation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SiriPresentationViewController siriViewController:requestsPresentation:]";
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation siriPresentationControllerDelegate called", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90840]), "initWithBuilder:", 0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__SiriPresentationViewController_siriViewController_requestsPresentation___block_invoke;
  v11[3] = &unk_24D47ACB8;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v7;
  v12 = v10;
  -[SiriPresentationViewController _requestPresentationWithOptions:completion:](self, "_requestPresentationWithOptions:completion:", v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __74__SiriPresentationViewController_siriViewController_requestsPresentation___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;

  v5 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6 = v5;
  v8 = a2;
  SiriUIInvokeOnMainQueue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  objc_destroyWeak(&v7);
}

void __74__SiriPresentationViewController_siriViewController_requestsPresentation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained || *(_QWORD *)(a1 + 32) || !*(_BYTE *)(a1 + 48))
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteTarget");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v4, "failedToPresentSiriWithError:");
    }
    else
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.siri.activation"), 1, &unk_24D47F420);
      objc_msgSend(v5, "failedToPresentSiriWithError:", v6);

    }
    WeakRetained = v7;
  }

}

- (void)siriViewController:(id)a3 requestsDismissalWithReason:(int64_t)a4 withCompletion:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    SASDismissalReasonGetName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[SiriPresentationViewController siriViewController:requestsDismissalWithReason:withCompletion:]";
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation dismissal requested %@", (uint8_t *)&v12, 0x16u);

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 1, a4);
  -[SiriPresentationViewController _presentationDismissalRequestedWithOptions:withCompletion:](self, "_presentationDismissalRequestedWithOptions:withCompletion:", v11, v7);

}

- (void)siriViewController:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->siriPresentationControllerDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("Not Visible");
      if (v4)
        v9 = CFSTR("Visible");
      v11 = 136315394;
      v12 = "-[SiriPresentationViewController siriViewController:willChangeKeyboardVisibility:]";
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #SAE - telling delegate keyboard visibility will change to: %@", (uint8_t *)&v11, 0x16u);
    }
    -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "siriPresentation:willChangeKeyboardVisibility:", self, v4);

  }
}

- (void)siriViewController:(id)a3 presentedIntentWithBundleId:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SiriPresentationViewController intentUsageDelegate](self, "intentUsageDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeIntentWithBundleId:", v5);

}

- (id)getDeviceEngagementEvents:(id)a3 forDeviceEngagementTimeWindow:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriPresentationViewController deviceEngagementTimeStamps](self, "deviceEngagementTimeStamps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", &unk_24D47F448);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriPresentationViewController deviceEngagementTimeStamps](self, "deviceEngagementTimeStamps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", &unk_24D47F460);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    objc_msgSend(v11, "timeIntervalSinceDate:", v8);
    if (v13 < a4)
      objc_msgSend(v6, "addObject:", &unk_24D47F448);
  }
  if (v10)
  {
    objc_msgSend(v12, "timeIntervalSinceDate:", v10);
    if (v14 < a4)
      objc_msgSend(v6, "addObject:", &unk_24D47F460);
  }

  return v6;
}

- (id)bulletinsForSiriViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriPresentationViewController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SiriPresentationViewController identifier](self, "identifier") == 1)
  {
    objc_msgSend(MEMORY[0x24BE90800], "sharedSystemState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lockStateMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "lockState");

    if ((v9 & 2) != 0)
      objc_msgSend(v6, "bulletinsOnLockScreen");
    else
      objc_msgSend(v6, "allBulletins");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isRead", (_QWORD)v18) & 1) == 0)
            objc_msgSend(v4, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }

  }
  v16 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SiriPresentationViewController bulletinsForSiriViewController:]";
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_215D55000, v16, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  return v4;
}

- (void)siriViewController:(id)a3 didUpdateAudioCategoriesDisablingVolumeHUD:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "siriPresentation:didUpdateAudioCategoriesDisablingVolumeHUD:", self, v8);

  }
}

- (void)siriViewControllerSpeechRequestStartedFromSiriOrb
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[SiriPresentationViewController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SiriPresentationViewController siriViewControllerSpeechRequestStartedFromSiriOrb]";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s Speech request was started from Siri orb button press %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(v3, "speechRequestStartedFromSiriOrb");

}

- (void)siriViewControllerDidReactivateFromFlexibleFollowups
{
  void *v3;
  char v4;
  id v5;

  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriRequestDidReactivateForSiriPresentation:", self);

  }
}

- (void)siriViewControllerSpeechRequestCancelledFromSiriOrb
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[SiriPresentationViewController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SiriPresentationViewController siriViewControllerSpeechRequestCancelledFromSiriOrb]";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s Speech request was cancelled from Siri orb button press %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(v3, "speechRequestCancelledFromSiriOrb");

}

- (void)siriViewController:(id)a3 voiceActivationMaskViewIsVisible:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;

  v4 = a4;
  -[SiriPresentationViewController _setVoiceActivationMaskShown:](self, "_setVoiceActivationMaskShown:", a4);
  if (v4)
    v6 = 1;
  else
    v6 = 2;
  -[SiriPresentationViewController _requestHomeAffordanceSuppression:](self, "_requestHomeAffordanceSuppression:", v6);
}

- (void)siriViewController:(id)a3 onboardingScreenContinueButtonTappedWithRequestOptions:(id)a4
{
  -[SiriPresentationViewController activateWithRequestOptions:](self, "activateWithRequestOptions:", a4);
}

- (void)requestSystemApertureCollapse
{
  void *v3;
  char v4;
  void *v5;

  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "restrictSystemApertureToDefaultLayoutWithReason:", CFSTR("Siri requested collapse"));

    -[SiriPresentationViewController invalidateSystemApertureAssertion](self, "invalidateSystemApertureAssertion");
  }
}

- (void)invalidateSystemApertureAssertion
{
  void *v3;
  char v4;
  id v5;

  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateSystemApertureAssertionWithReason:", CFSTR("Siri invalidated collapse"));

  }
}

- (BOOL)headphonesAuthenticated
{
  SASHeadphonesAuthenticationManager *headphonesAuthenticationManager;

  headphonesAuthenticationManager = self->_headphonesAuthenticationManager;
  if (headphonesAuthenticationManager)
    LOBYTE(headphonesAuthenticationManager) = -[SASHeadphonesAuthenticationManager isAuthenticated](headphonesAuthenticationManager, "isAuthenticated");
  return (char)headphonesAuthenticationManager;
}

- (id)siriViewController:(id)a3 bulletinWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[SiriPresentationViewController connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bulletinForIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UIEdgeInsets)safeAreaInsetsForSceneCreationInSiriViewController:(id)a3
{
  SiriPresentationViewController *v4;
  SiriPresentationViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  SiriPresentationViewController *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  SiriPresentationViewController *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  UIEdgeInsets result;

  v4 = (SiriPresentationViewController *)a3;
  v5 = v4;
  if (self->_currentViewMode == 7)
  {
    -[SiriPresentationViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "safeAreaInsetsPortrait");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    goto LABEL_26;
  }
  -[SiriPresentationViewController view](v4, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeAreaInsets");
  v12 = *MEMORY[0x24BDF7718];
  v14 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v18 = *(double *)(MEMORY[0x24BDF7718] + 24);
  if (v23 != v14 || v20 != v12 || v22 != v18)
  {

LABEL_24:
    v39 = v5;
LABEL_25:
    -[SiriPresentationViewController view](v39, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "safeAreaInsets");
    v12 = v41;
    v14 = v42;
    v16 = v43;
    v18 = v44;

    goto LABEL_26;
  }
  v26 = v21;
  v16 = *(double *)(MEMORY[0x24BDF7718] + 16);

  if (v26 != v16)
    goto LABEL_24;
  -[SiriPresentationViewController additionalSafeAreaInsets](v5, "additionalSafeAreaInsets");
  if (v30 != v14 || v27 != v12 || v29 != v18 || v28 != v16)
  {
    v34 = v5;
LABEL_23:
    -[SiriPresentationViewController additionalSafeAreaInsets](v34, "additionalSafeAreaInsets");
    v12 = v35;
    v14 = v36;
    v16 = v37;
    v18 = v38;
    goto LABEL_26;
  }
  -[SiriPresentationViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "safeAreaInsets");
  if (v53 != v14 || v50 != v12 || v52 != v18)
  {

LABEL_41:
    v39 = self;
    goto LABEL_25;
  }
  v56 = v51;

  if (v56 != v16)
    goto LABEL_41;
  -[SiriPresentationViewController additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
  if (v60 != v14 || v57 != v12 || v59 != v18 || v58 != v16)
  {
    v34 = self;
    goto LABEL_23;
  }
LABEL_26:

  v45 = v12;
  v46 = v14;
  v47 = v16;
  v48 = v18;
  result.right = v48;
  result.bottom = v47;
  result.left = v46;
  result.top = v45;
  return result;
}

- (void)_checkForGuideUpdatesIfNecessary
{
  void *v3;
  NSDate *lastGuideCheck;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    lastGuideCheck = self->_lastGuideCheck;
    if (lastGuideCheck)
    {
      -[NSDate dateByAddingTimeInterval:](lastGuideCheck, "dateByAddingTimeInterval:", 86400.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "compare:", v3) == -1)
      {
        v8 = objc_msgSend(MEMORY[0x24BE09538], "availabilityState");

        if (v8)
          goto LABEL_15;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE09520], "sharedManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cachedGuideSnippet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {

LABEL_15:
          return;
        }
        v9 = objc_msgSend(MEMORY[0x24BE09538], "availabilityState");

        if (v9)
          goto LABEL_15;
      }
    }
    else if (objc_msgSend(MEMORY[0x24BE09538], "availabilityState"))
    {
      goto LABEL_15;
    }
    objc_storeStrong((id *)&self->_lastGuideCheck, v3);
    objc_msgSend(MEMORY[0x24BE09520], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldCheckForUpdateWithLastAppUpdateTime:", self->_lastAppUpdateTimestamp);

    if (v11)
    {
      v12 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315138;
        v15 = "-[SiriPresentationViewController _checkForGuideUpdatesIfNecessary]";
        _os_log_impl(&dword_215D55000, v12, OS_LOG_TYPE_DEFAULT, "%s Checking for guide updates", (uint8_t *)&v14, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BE09520], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "checkGuideUpdate");

    }
    goto LABEL_15;
  }
}

- (void)_applicationsDidChange
{
  NSDate *v3;
  NSDate *lastAppUpdateTimestamp;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastAppUpdateTimestamp = self->_lastAppUpdateTimestamp;
  self->_lastAppUpdateTimestamp = v3;

}

- (void)_setSpringBoardIdleTimerDisabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  if (-[SiriPresentationViewController presentationHostedInSpringBoard](self, "presentationHostedInSpringBoard"))
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("Enabled");
      if (v3)
        v6 = CFSTR("Disabled");
      *(_DWORD *)buf = 136315394;
      v8 = "-[SiriPresentationViewController _setSpringBoardIdleTimerDisabled:]";
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s %@ the SpringBoard idle timer", buf, 0x16u);
    }
    SiriUIInvokeOnMainQueue();
    self->_springBoardIdleTimerDisabled = v3;
  }
}

void __67__SiriPresentationViewController__setSpringBoardIdleTimerDisabled___block_invoke(uint64_t a1)
{
  id v2;

  SBUIGetUserAgent();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdleTimerDisabled:forReason:", *(unsigned __int8 *)(a1 + 32), CFSTR("SiriIsTalking"));

}

- (BOOL)_cancelPendingPhoneCall
{
  _BOOL4 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = -[SiriPresentationViewController _isWaitingForTelephonyToStart](self, "_isWaitingForTelephonyToStart");
  if (v3)
  {
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[SiriPresentationViewController _cancelPendingPhoneCall]";
      _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler we are waiting for telephony to start, so cancelling pending phone call", (uint8_t *)&v6, 0xCu);
    }
    CTCallListDisconnect();
    -[SiriPresentationViewController _setWaitingForTelephonyToStart:](self, "_setWaitingForTelephonyToStart:", 0);
  }
  return v3;
}

- (void)_setWaitingForTelephonyToStart:(BOOL)a3
{
  _BOOL8 v3;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = v6;
    objc_msgSend(v7, "numberWithBool:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v27 = "-[SiriPresentationViewController _setWaitingForTelephonyToStart:]";
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler setting _waitingForTelephonyToStart:%@", buf, 0x16u);

  }
  if (self->_waitingForTelephonyToStart != v3)
  {
    self->_waitingForTelephonyToStart = v3;
    -[AFUISiriViewController setWaitingForTelephonyToStart:](self->_siriViewController, "setWaitingForTelephonyToStart:", v3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_waitingForTelephonyToStart)
    {
      objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (_QWORD *)MEMORY[0x24BE647F8];
      v25 = *MEMORY[0x24BE647F8];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAttribute:forKey:error:", v13, *MEMORY[0x24BE64930], 0);
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__callIsActiveDidChangeNotification_, *v12, 0);
      -[SiriPresentationViewController _sendTelephonyHasStartedAfterDelay:](self, "_sendTelephonyHasStartedAfterDelay:", 10.0);
      self->_instrumentationDismissalState.outgoingPhoneCallDetected = 1;
    }
    else
    {
      v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "-[SiriPresentationViewController _setWaitingForTelephonyToStart:]";
        _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler requesting dismissal", buf, 0xCu);
      }
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 1, 3);
      -[SiriPresentationViewController dismissWithOptions:](self, "dismissWithOptions:", v11);
      v24 = *MEMORY[0x24BE647F8];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v20;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v20 != v17)
              objc_enumerationMutation(v13);
            objc_msgSend(v10, "removeObserver:name:object:", self, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), 0, (_QWORD)v19);
          }
          while (v16 != v18);
          v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v16);
      }

    }
  }
}

- (void)_telephonyHasStarted
{
  -[SiriPresentationViewController _setWaitingForTelephonyToStart:](self, "_setWaitingForTelephonyToStart:", 0);
}

- (void)_sendTelephonyHasStartedAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithDouble:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SiriPresentationViewController _sendTelephonyHasStartedAfterDelay:]";
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_215D55000, v7, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler Setting %@ second audio session extension timer, if the timer fires, we'll stop extending the audio session", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__telephonyHasStarted, 0);
  -[SiriPresentationViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__telephonyHasStarted, 0, a3);
}

- (void)_callIsActiveDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *MEMORY[0x24BE647F8];
    v7 = 136315394;
    v8 = "-[SiriPresentationViewController _callIsActiveDidChangeNotification:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler %@ posted: ending audio session", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__telephonyHasStarted, 0);
  if (-[SiriPresentationViewController _isWaitingForTelephonyToStart](self, "_isWaitingForTelephonyToStart"))
    -[SiriPresentationViewController _telephonyHasStarted](self, "_telephonyHasStarted");

}

- (BOOL)presentationHostedInSpringBoard
{
  return self->_identifier == 1;
}

- (BOOL)isAmbientPresented
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAmbientActive");

  return v6;
}

- (void)callStateChangedToIsActive:(BOOL)a3 isOutgoing:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  char v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    if (a3
      && -[AFUISiriViewController isVisible](self->_siriViewController, "isVisible")
      && !-[SiriPresentationViewController _isWaitingForTelephonyToStart](self, "_isWaitingForTelephonyToStart"))
    {
      v6 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        v10 = "-[SiriPresentationViewController callStateChangedToIsActive:isOutgoing:]";
        _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation Requesting dismissal for outgoing phone call", (uint8_t *)&v9, 0xCu);
      }
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90830]), "initWithDeactivationOptions:animated:dismissalReason:", 0, 1, 3);
      -[SiriPresentationViewController dismissWithOptions:](self, "dismissWithOptions:", v7);

    }
  }
  else
  {
    self->_receivedIncomingPhoneCall = a3;
    -[AFUISiriViewController setReceivedIncomingPhoneCall:](self->_siriViewController, "setReceivedIncomingPhoneCall:", a3);
    if (v4)
      v8 = -[AFUISiriViewController isVisible](self->_siriViewController, "isVisible");
    else
      v8 = 0;
    self->_instrumentationDismissalState.incomingPhoneCallDetected = v8;
  }
}

- (void)_showSetupViewControllerIfNecessary
{
  NSObject *v3;
  AFUISiriSetupViewController *v4;
  AFUISiriSetupViewController *siriSetupViewController;
  UINavigationController *v6;
  UINavigationController *siriSetupNavigationController;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SiriPresentationViewController _showSetupViewControllerIfNecessary]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation Siri supported but not enabled, presenting an AFUISiriSetupViewController", buf, 0xCu);
  }
  -[SiriPresentationViewController _updateHostedPresentationFrame](self, "_updateHostedPresentationFrame");
  if (!self->_siriSetupViewController)
  {
    v4 = (AFUISiriSetupViewController *)objc_alloc_init(MEMORY[0x24BE09540]);
    siriSetupViewController = self->_siriSetupViewController;
    self->_siriSetupViewController = v4;

    -[AFUISiriSetupViewController setDelegate:](self->_siriSetupViewController, "setDelegate:", self);
    v6 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", self->_siriSetupViewController);
    siriSetupNavigationController = self->_siriSetupNavigationController;
    self->_siriSetupNavigationController = v6;

    -[UINavigationController setModalPresentationStyle:](self->_siriSetupNavigationController, "setModalPresentationStyle:", 2);
    -[UINavigationController presentationController](self->_siriSetupNavigationController, "presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self->_siriSetupViewController);

  }
  v9 = objc_alloc(MEMORY[0x24BEA8650]);
  v10 = (void *)objc_msgSend(v9, "initWithSuiteName:", *MEMORY[0x24BEA86E0]);
  v11 = objc_msgSend(v10, "integerForKey:", CFSTR("NumberOfTimesSetupSiriShown"));
  if (v11 < 2)
  {
    objc_msgSend(v10, "setInteger:forKey:", v11 + 1, CFSTR("NumberOfTimesSetupSiriShown"));
    objc_msgSend(v10, "synchronize");
  }
  else
  {
    -[AFUISiriSetupViewController setLastTimeShown:](self->_siriSetupViewController, "setLastTimeShown:", 1);
  }
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__SiriPresentationViewController__showSetupViewControllerIfNecessary__block_invoke;
  v12[3] = &unk_24D47AD00;
  objc_copyWeak(&v13, (id *)buf);
  -[SiriPresentationViewController siriViewController:requestsPresentation:](self, "siriViewController:requestsPresentation:", 0, v12);
  kdebug_trace();
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __69__SiriPresentationViewController__showSetupViewControllerIfNecessary__block_invoke(uint64_t a1, char a2)
{
  id v3;
  char v4;

  objc_copyWeak(&v3, (id *)(a1 + 32));
  v4 = a2;
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v3);
}

void __69__SiriPresentationViewController__showSetupViewControllerIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_BYTE *)(a1 + 40))
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "siriSetupNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);

    objc_msgSend(v4, "_setupSiriViewControllerPresentedSuccessHandler");
    WeakRetained = v4;
  }

}

- (void)_setupSiriViewControllerPresentedSuccessHandler
{
  void *v3;

  kdebug_trace();
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didPresentSiri");

  -[SiriPresentationViewController setSiriSetupViewControllerPresented:](self, "setSiriSetupViewControllerPresented:", 1);
}

- (void)_removeSetupViewControllerIfNecessary
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriPresentationViewController _removeSetupViewControllerIfNecessary]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation _removeSetupViewControllerIfNecessary", (uint8_t *)&v4, 0xCu);
  }
  if (self->_siriSetupViewController)
  {
    -[UINavigationController dismissViewControllerAnimated:completion:](self->_siriSetupNavigationController, "dismissViewControllerAnimated:completion:", 0, 0);
    -[SiriPresentationViewController setSiriSetupNavigationController:](self, "setSiriSetupNavigationController:", 0);
    -[SiriPresentationViewController setSiriSetupViewController:](self, "setSiriSetupViewController:", 0);
    -[SiriPresentationViewController setSiriSetupViewControllerPresented:](self, "setSiriSetupViewControllerPresented:", 0);
  }
}

- (BOOL)siriSetupViewController:(id)a3 openURL:(id)a4
{
  -[SiriPresentationViewController openURL:bundleId:inPlace:completion:](self, "openURL:bundleId:inPlace:completion:", a4, 0, 0, 0);
  return 1;
}

- (void)disableSiriActivationRequestedBySiriSetupViewController:(id)a3
{
  _AXSSetHomeButtonAssistant();
}

- (void)openSiriRequestedBySiriSetupViewController:(id)a3
{
  id v4;
  id v5;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __77__SiriPresentationViewController_openSiriRequestedBySiriSetupViewController___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id *v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "_removeSetupViewControllerIfNecessary");
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE907F0]), "initWithRequestSource:uiPresentationIdentifier:", 19, CFSTR("com.apple.siri.Compact"));
    v3 = objc_alloc(MEMORY[0x24BE90840]);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __77__SiriPresentationViewController_openSiriRequestedBySiriSetupViewController___block_invoke_2;
    v10[3] = &unk_24D47AA88;
    v4 = v2;
    v11 = v4;
    v5 = (void *)objc_msgSend(v3, "initWithBuilder:", v10);
    objc_msgSend(v9, "presentationRequestedWithPresentationOptions:requestOptions:", v5, v4);
    objc_msgSend(v9[164], "_siriView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v9[164], "_fullSiriView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackdropVisible:", 1);

    }
    WeakRetained = v9;
  }

}

void __77__SiriPresentationViewController_openSiriRequestedBySiriSetupViewController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setRequestSource:", objc_msgSend(v3, "requestSource"));
  objc_msgSend(v4, "setInputType:", objc_msgSend(*(id *)(a1 + 32), "inputType"));

}

- (void)startAnimationDismissalWatchdogTimerWithTimeoutHandler:(id)a3 shouldTurnScreenOff:(BOOL)a4
{
  id v6;
  NSObject *watchdogQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  watchdogQueue = self->_watchdogQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __109__SiriPresentationViewController_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke;
  v9[3] = &unk_24D47AD28;
  objc_copyWeak(&v11, &location);
  v10 = v6;
  v12 = a4;
  v8 = v6;
  dispatch_async(watchdogQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __109__SiriPresentationViewController_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)_watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:(id)a3 shouldTurnScreenOff:(BOOL)a4
{
  id v6;
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  BOOL v30;
  id location;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SiriPresentationViewController animationDismissalTimer](self, "animationDismissalTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (v7)
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SiriPresentationViewController _watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    -[SiriPresentationViewController animationDismissalTimer](self, "animationDismissalTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancelIfNotAlreadyCanceled");

    -[SiriPresentationViewController setAnimationDismissalTimer:](self, "setAnimationDismissalTimer:", 0);
  }
  objc_initWeak(&location, self);
  v18 = objc_alloc(MEMORY[0x24BE093A8]);
  v19 = MEMORY[0x24BDAC9B8];
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __124__SiriPresentationViewController__watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke;
  v27 = &unk_24D47AD28;
  objc_copyWeak(&v29, &location);
  v20 = v6;
  v28 = v20;
  v30 = a4;
  v21 = (void *)objc_msgSend(v18, "initWithTimeoutInterval:onQueue:timeoutHandler:", MEMORY[0x24BDAC9B8], &v24, 0.75);
  -[SiriPresentationViewController setAnimationDismissalTimer:](self, "setAnimationDismissalTimer:", v21, v24, v25, v26, v27);

  v22 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[SiriPresentationViewController _watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:shouldTurnScreenOff:]";
    v34 = 2048;
    v35 = 0x3FE8000000000000;
    _os_log_impl(&dword_215D55000, v22, OS_LOG_TYPE_DEFAULT, "%s #activation #myriadUI - Starting animation dismissal watchdog timer for %f seconds", buf, 0x16u);
  }
  -[SiriPresentationViewController animationDismissalTimer](self, "animationDismissalTimer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "start");

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __124__SiriPresentationViewController__watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __124__SiriPresentationViewController__watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend(WeakRetained, "animationDismissalTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelIfNotAlreadyCanceled");

  objc_msgSend(WeakRetained, "setAnimationDismissalTimer:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "_analytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logEventWithType:context:", 1931, 0);

  }
  objc_msgSend(WeakRetained, "_logSignatureWithType:subType:context:", CFSTR("AnimationDismissalWatchdogTimerFired"), 0, MEMORY[0x24BDBD1B8]);

}

- (void)_watchdogQueue_stopAnimationDismissalWatchdogTimerIfNeededThen:(id)a3 onQueue:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[SiriPresentationViewController animationDismissalTimer](self, "animationDismissalTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x24BE08FB0];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v12 = 136315138;
      v13 = "-[SiriPresentationViewController _watchdogQueue_stopAnimationDismissalWatchdogTimerIfNeededThen:onQueue:]";
      _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #myriadUI - Animation dismissal watchdog timer request stopping", (uint8_t *)&v12, 0xCu);
    }
    -[SiriPresentationViewController animationDismissalTimer](self, "animationDismissalTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelIfNotAlreadyCanceled");

    -[SiriPresentationViewController setAnimationDismissalTimer:](self, "setAnimationDismissalTimer:", 0);
  }
  else if (v10)
  {
    v12 = 136315138;
    v13 = "-[SiriPresentationViewController _watchdogQueue_stopAnimationDismissalWatchdogTimerIfNeededThen:onQueue:]";
    _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #myriadUI - Animation dismissal watchdog timer request stopping, but not needed", (uint8_t *)&v12, 0xCu);
  }
  dispatch_async(v6, v7);

}

- (void)stopAnimationDismissalWatchdogTimerIfNeededThen:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *watchdogQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  watchdogQueue = self->_watchdogQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__SiriPresentationViewController_stopAnimationDismissalWatchdogTimerIfNeededThen_onQueue___block_invoke;
  v11[3] = &unk_24D47AD50;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(watchdogQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __90__SiriPresentationViewController_stopAnimationDismissalWatchdogTimerIfNeededThen_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_watchdogQueue_stopAnimationDismissalWatchdogTimerIfNeededThen:onQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)_updateLanguageCode
{
  void *v2;
  id v3;

  -[SiriPresentationViewController _language](self, "_language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spokenLanguageCode");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2199F0FBC](v3);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  CGRect v20;

  -[SiriPresentationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (CGRectEqualToRect(v20, *MEMORY[0x24BDBF090]))
  {
    -[SiriPresentationViewController hostedPresentationFrame](self, "hostedPresentationFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    -[SiriPresentationViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v5 = v13;
    v7 = v14;
    v9 = v15;
    v11 = v16;

  }
  if (-[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHostedPresentationFrame:", v5, v7, v9, v11);

    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFrame:", v5, v7, v9, v11);

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  AFUISiriViewController *siriViewController;
  int64_t currentViewMode;
  _BOOL4 v5;
  unint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  siriViewController = self->_siriViewController;
  if (siriViewController)
  {
    currentViewMode = self->_currentViewMode;
    v5 = currentViewMode == 8 || currentViewMode == 4;
    if (currentViewMode == 4 || currentViewMode == 8)
      v7 = 2;
    else
      v7 = -[AFUISiriViewController supportedInterfaceOrientations](siriViewController, "supportedInterfaceOrientations");
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      if (v5)
        v9 = CFSTR("YES");
      v11 = 136315394;
      v12 = "-[SiriPresentationViewController supportedInterfaceOrientations]";
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s 🚗📱 Forcing portrait mode for Siri EyesFree: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if ((SiriUIDeviceIsZoomed() & 1) != 0 || (SiriUIIsAllOrientationsSupported() & 1) == 0)
  {
    return 2;
  }
  else
  {
    return 30;
  }
  return v7;
}

- (BOOL)_shouldAllowResizingBetweenModesForViewMode:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x1B0u >> a3);
}

- (void)_setupPongTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SiriPresentationViewController _setupPongTimer]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #pingpong", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v4 = (void *)MEMORY[0x24BDBCF40];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__SiriPresentationViewController__setupPongTimer__block_invoke;
  v8[3] = &unk_24D47AD78;
  objc_copyWeak(&v9, (id *)buf);
  objc_msgSend(v4, "timerWithTimeInterval:repeats:block:", 0, v8, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriPresentationViewController pongTimer](self, "pongTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SiriPresentationViewController setPongTimer:](self, "setPongTimer:", v5);
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTimer:forMode:", v5, *MEMORY[0x24BDBCB80]);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __49__SiriPresentationViewController__setupPongTimer__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_shouldKeepPonging");

  v4 = *MEMORY[0x24BE08FB0];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = v4;
      v7 = objc_loadWeakRetained(v1);
      objc_msgSend(v7, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained(v1);
      objc_msgSend(v9, "connection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "remoteTarget");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315650;
      v17 = "-[SiriPresentationViewController _setupPongTimer]_block_invoke";
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #pingpong sending pong and waiting for ping - connection: %@ | remoteTarget: %@", (uint8_t *)&v16, 0x20u);

    }
    v12 = objc_loadWeakRetained(v1);
    objc_msgSend(v12, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pong");

    v15 = objc_loadWeakRetained(v1);
    objc_msgSend(v15, "_waitForPing");

  }
  else if (v5)
  {
    v16 = 136315138;
    v17 = "-[SiriPresentationViewController _setupPongTimer]_block_invoke";
    _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s #pingpong tried to send pong but _shouldKeepPonging == NO", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_waitForPing
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SiriPresentationViewController _waitForPing]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #pingpong", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v4 = (void *)MEMORY[0x24BDBCF40];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SiriPresentationViewController__waitForPing__block_invoke;
  v7[3] = &unk_24D47AD78;
  objc_copyWeak(&v8, (id *)buf);
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriPresentationViewController pongTimer](self, "pongTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SiriPresentationViewController setPongTimer:](self, "setPongTimer:", v5);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __46__SiriPresentationViewController__waitForPing__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __46__SiriPresentationViewController__waitForPing__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BDD0FC8];
  v15[0] = CFSTR("SiriPresentationViewController expected ping from SiriActivationService but timed out.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.activation"), 4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissDueToUnexpectedError:", v12);

}

- (void)_teardownPongTimer
{
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SiriPresentationViewController _teardownPongTimer]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #pingpong", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v4, (id *)buf);
  SiriUIInvokeOnMainQueue();
  objc_destroyWeak(&v4);
  objc_destroyWeak((id *)buf);
}

void __52__SiriPresentationViewController__teardownPongTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SiriPresentationViewController _teardownPongTimer]_block_invoke";
    _os_log_impl(&dword_215D55000, v2, OS_LOG_TYPE_DEFAULT, "%s #pingpong on main thread", (uint8_t *)&v7, 0xCu);
  }
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "pongTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setPongTimer:", 0);

}

- (BOOL)_shouldKeepPonging
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  char v9;

  if (-[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isVisible");

  }
  else
  {
    v4 = 0;
  }
  if (self->_currentViewMode)
    v5 = 0;
  else
    v5 = -[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured");
  -[SiriPresentationViewController siriSetupNavigationController](self, "siriSetupNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_currentViewMode == 5
    && -[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
  {
    -[SiriPresentationViewController siriViewController](self, "siriViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isVisible") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  v9 = v4 | v5;
  if (v6)
    v9 = 1;
  return v9 | v8;
}

- (id)_foregroundAppInfosForUIPresentationIdentifier:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[SiriPresentationViewController _presentationIdentifierFromUIPresentationIdentifier:](self, "_presentationIdentifierFromUIPresentationIdentifier:", a3);
  -[SiriPresentationViewController applicationStateHelper](self, "applicationStateHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 2)
    objc_msgSend(v5, "foregroundAppInfosForCarPlay");
  else
    objc_msgSend(v5, "foregroundAppInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_presentationIdentifierFromUIPresentationIdentifier:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.EyesFree")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.BluetoothCar")) & 1) != 0)
  {
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay")) & 1) != 0)
  {
LABEL_4:
    v4 = 2;
    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.UIFree")) & 1) != 0)
    goto LABEL_10;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.SiriTVPresentation")) & 1) != 0)
  {
    v4 = 4;
    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.Compact")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.SystemAssistantExperience")) & 1) != 0)
  {
LABEL_10:
    v4 = 1;
    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay.UIFree")) & 1) != 0)
    goto LABEL_4;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    -[SiriPresentationViewController _presentationIdentifierFromUIPresentationIdentifier:].cold.1();
  v4 = 0;
LABEL_11:

  return v4;
}

- (void)presentationStateProvider:(id)a3 presentationStateDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[SiriPresentationViewController presentationStateProvider:presentationStateDidChange:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  -[SiriPresentationViewController connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didUpdatePresentationState:", v5);

}

- (void)setPresentationState:(int64_t)a3
{
  int64_t presentationState;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  presentationState = self->_presentationState;
  if (presentationState != a3)
  {
    self->_presentationState = a3;
    v5 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      SiriUIPresentationStateGetName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      SiriUIPresentationStateGetName();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[SiriPresentationViewController setPresentationState:]";
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation updating presentation state from %@ to %@", (uint8_t *)&v10, 0x20u);

    }
    if (-[SiriPresentationViewController siriViewControllerConfigured](self, "siriViewControllerConfigured"))
    {
      -[SiriPresentationViewController siriViewController](self, "siriViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentationStateUpdatedFromPresentationState:toPresentationState:", presentationState, self->_presentationState);

    }
  }
}

+ (id)_applicationStateHelper
{
  return objc_alloc_init(MEMORY[0x24BEA85A8]);
}

- (SiriPresentationControllerDelegate)siriPresentationControllerDelegate
{
  return (SiriPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->siriPresentationControllerDelegate);
}

- (void)setSiriPresentationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->siriPresentationControllerDelegate, a3);
}

- (SASUIDeviceScreenEngagementController)_deviceScreenEngagementController
{
  return self->_deviceScreenEngagementController;
}

- (void)_setDeviceScreenEngagementController:(id)a3
{
  objc_storeStrong((id *)&self->_deviceScreenEngagementController, a3);
}

- (NSMutableDictionary)deviceEngagementTimeStamps
{
  return self->_deviceEngagementTimeStamps;
}

- (void)setDeviceEngagementTimeStamps:(id)a3
{
  objc_storeStrong((id *)&self->_deviceEngagementTimeStamps, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (CGRect)hostedPresentationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_hostedPresentationFrame.origin.x;
  y = self->_hostedPresentationFrame.origin.y;
  width = self->_hostedPresentationFrame.size.width;
  height = self->_hostedPresentationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHostedPresentationFrame:(CGRect)a3
{
  self->_hostedPresentationFrame = a3;
}

- (AFConnection)unownedConnection
{
  return self->_unownedConnection;
}

- (void)setUnownedConnection:(id)a3
{
  objc_storeStrong((id *)&self->_unownedConnection, a3);
}

- (NSDate)_lastAppUpdateTimestamp
{
  return self->_lastAppUpdateTimestamp;
}

- (void)_setLastAppUpdateTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastAppUpdateTimestamp, a3);
}

- (BOOL)_isSpringBoardIdleTimerDisabled
{
  return self->_springBoardIdleTimerDisabled;
}

- (BOOL)_isWaitingForTelephonyToStart
{
  return self->_waitingForTelephonyToStart;
}

- (BOOL)_startGuidedAccessOnDismissal
{
  return self->_startGuidedAccessOnDismissal;
}

- (void)_setStartGuidedAccessOnDismissal:(BOOL)a3
{
  self->_startGuidedAccessOnDismissal = a3;
}

- (BOOL)_wasScreenOffDuringActivation
{
  return self->_wasScreenOffDuringActivation;
}

- (BOOL)_isVoiceActivationMaskShown
{
  return self->_isVoiceActivationMaskShown;
}

- (void)_setVoiceActivationMaskShown:(BOOL)a3
{
  self->_isVoiceActivationMaskShown = a3;
}

- (BOOL)_buttonDownEventDidOccur
{
  return self->_buttonDownEventDidOccur;
}

- (void)_setButtonDownEventDidOccur:(BOOL)a3
{
  self->_buttonDownEventDidOccur = a3;
}

- (double)_buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void)_setButtonDownTimestamp:(double)a3
{
  self->_buttonDownTimestamp = a3;
}

- (NSTimer)_carSiriButtonHoldToTalkTimer
{
  return self->_carSiriButtonHoldToTalkTimer;
}

- (void)_setCarSiriButtonHoldToTalkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_carSiriButtonHoldToTalkTimer, a3);
}

- (double)_carSiriButtonTimeInterval
{
  return self->_carSiriButtonTimeInterval;
}

- (void)_setCarSiriButtonTimeInterval:(double)a3
{
  self->_carSiriButtonTimeInterval = a3;
}

- (BOOL)_shouldDeferWake
{
  return self->_shouldDeferWake;
}

- (void)_setShouldDeferWake:(BOOL)a3
{
  self->_shouldDeferWake = a3;
}

- (NSArray)currentCarPlaySupportedOEMAppIdList
{
  return self->_currentCarPlaySupportedOEMAppIdList;
}

- (void)setCurrentCarPlaySupportedOEMAppIdList:(id)a3
{
  objc_storeStrong((id *)&self->_currentCarPlaySupportedOEMAppIdList, a3);
}

- (NSArray)starkAppBundleIdentifierContext
{
  return self->_starkAppBundleIdentifierContext;
}

- (void)setStarkAppBundleIdentifierContext:(id)a3
{
  objc_storeStrong((id *)&self->_starkAppBundleIdentifierContext, a3);
}

- (BOOL)predictedRecordRouteIsZLL
{
  return self->_predictedRecordRouteIsZLL;
}

- (void)setPredictedRecordRouteIsZLL:(BOOL)a3
{
  self->_predictedRecordRouteIsZLL = a3;
}

- (unint64_t)currentLockState
{
  return self->_currentLockState;
}

- (AFWatchdogTimer)animationDismissalTimer
{
  return self->_animationDismissalTimer;
}

- (void)setAnimationDismissalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_animationDismissalTimer, a3);
}

- (AFUISiriLanguage)_language
{
  return self->_language;
}

- (SiriPresentationIntentUsageDelegate)intentUsageDelegate
{
  return self->_intentUsageDelegate;
}

- (void)setIntentUsageDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_intentUsageDelegate, a3);
}

- (NSTimer)clearSiriViewControllerTimer
{
  return self->_clearSiriViewControllerTimer;
}

- (void)setClearSiriViewControllerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clearSiriViewControllerTimer, a3);
}

- (int64_t)currentViewMode
{
  return self->_currentViewMode;
}

- (void)setCurrentViewMode:(int64_t)a3
{
  self->_currentViewMode = a3;
}

- (NSTimer)pongTimer
{
  return self->_pongTimer;
}

- (void)setPongTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pongTimer, a3);
}

- (SUICApplicationStateHelper)applicationStateHelper
{
  return self->_applicationStateHelper;
}

- (void)setApplicationStateHelper:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateHelper, a3);
}

- (SiriPresentationStateProvider)presentationStateProvider
{
  return self->_presentationStateProvider;
}

- (void)setPresentationStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_presentationStateProvider, a3);
}

- (SRUIFTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
  objc_storeStrong((id *)&self->_trialManager, a3);
}

- (SASHeadphonesAuthenticationManager)headphonesAuthenticationManager
{
  return self->_headphonesAuthenticationManager;
}

- (void)setHeadphonesAuthenticationManager:(id)a3
{
  objc_storeStrong((id *)&self->_headphonesAuthenticationManager, a3);
}

- (SBSHardwareButtonSystemGlowStyleControlling)hintGlowAssertion
{
  return self->_hintGlowAssertion;
}

- (void)setHintGlowAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_hintGlowAssertion, a3);
}

- (int64_t)currentGlowState
{
  return self->_currentGlowState;
}

- (void)setCurrentGlowState:(int64_t)a3
{
  self->_currentGlowState = a3;
}

- (int64_t)currentEffectsViewPresentationState
{
  return self->_currentEffectsViewPresentationState;
}

- (void)setCurrentEffectsViewPresentationState:(int64_t)a3
{
  self->_currentEffectsViewPresentationState = a3;
}

- (BOOL)siriSetupViewControllerPresented
{
  return self->_siriSetupViewControllerPresented;
}

- (void)setSiriSetupViewControllerPresented:(BOOL)a3
{
  self->_siriSetupViewControllerPresented = a3;
}

- (void)setSiriViewController:(id)a3
{
  objc_storeStrong((id *)&self->_siriViewController, a3);
}

- (AFUISiriSetupViewController)siriSetupViewController
{
  return self->_siriSetupViewController;
}

- (void)setSiriSetupViewController:(id)a3
{
  objc_storeStrong((id *)&self->_siriSetupViewController, a3);
}

- (void)setSiriEffectsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_siriEffectsViewController, a3);
}

- (UINavigationController)siriSetupNavigationController
{
  return self->_siriSetupNavigationController;
}

- (void)setSiriSetupNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_siriSetupNavigationController, a3);
}

- (NSArray)contextAppInfosForSiriViewController
{
  return self->_contextAppInfosForSiriViewController;
}

- (void)setContextAppInfosForSiriViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contextAppInfosForSiriViewController, a3);
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (AFQueue)_testInputQueue
{
  return self->_testInputQueue;
}

- (void)setTestInputQueue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1360);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testInputQueue, 0);
  objc_storeStrong((id *)&self->_contextAppInfosForSiriViewController, 0);
  objc_storeStrong((id *)&self->_siriSetupNavigationController, 0);
  objc_storeStrong((id *)&self->_siriEffectsViewController, 0);
  objc_storeStrong((id *)&self->_siriSetupViewController, 0);
  objc_storeStrong((id *)&self->_siriViewController, 0);
  objc_storeStrong((id *)&self->_hintGlowAssertion, 0);
  objc_storeStrong((id *)&self->_headphonesAuthenticationManager, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_presentationStateProvider, 0);
  objc_storeStrong((id *)&self->_applicationStateHelper, 0);
  objc_storeStrong((id *)&self->_pongTimer, 0);
  objc_storeStrong((id *)&self->_clearSiriViewControllerTimer, 0);
  objc_storeStrong((id *)&self->_intentUsageDelegate, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_animationDismissalTimer, 0);
  objc_storeStrong((id *)&self->_starkAppBundleIdentifierContext, 0);
  objc_storeStrong((id *)&self->_currentCarPlaySupportedOEMAppIdList, 0);
  objc_storeStrong((id *)&self->_carSiriButtonHoldToTalkTimer, 0);
  objc_storeStrong((id *)&self->_lastAppUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_unownedConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_deviceEngagementTimeStamps, 0);
  objc_storeStrong((id *)&self->_deviceScreenEngagementController, 0);
  objc_destroyWeak((id *)&self->siriPresentationControllerDelegate);
  objc_storeStrong((id *)&self->_viewHostingInstrumentationHandler, 0);
  objc_storeStrong(&self->_dismissalCompletion, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_watchdogQueue, 0);
  objc_storeStrong(&self->_buttonTrigger, 0);
  objc_storeStrong((id *)&self->_activeTCCs, 0);
  objc_storeStrong((id *)&self->_activeScreen, 0);
  objc_storeStrong((id *)&self->_completionOptions, 0);
  objc_storeStrong((id *)&self->_lastGuideCheck, 0);

}

+ (id)extractTestingInputsFromContext:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v28;
  void *v29;
  id obj;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v29 = v3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE908D0]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        v11 = objc_alloc(MEMORY[0x24BE90808]);
        v36[0] = v6;
        v36[1] = 3221225472;
        v36[2] = __75__SiriPresentationViewController_Testing__extractTestingInputsFromContext___block_invoke;
        v36[3] = &unk_24D47A5D0;
        v36[4] = v10;
        v12 = (void *)objc_msgSend(v11, "initWithBuilder:", v36);
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v7);
  }
  objc_msgSend(v29, "objectForKey:", *MEMORY[0x24BE908B0], a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
        v19 = objc_alloc(MEMORY[0x24BE90808]);
        v31[0] = v6;
        v31[1] = 3221225472;
        v31[2] = __75__SiriPresentationViewController_Testing__extractTestingInputsFromContext___block_invoke_2;
        v31[3] = &unk_24D47A5D0;
        v31[4] = v18;
        v20 = (void *)objc_msgSend(v19, "initWithBuilder:", v31);
        objc_msgSend(v4, "addObject:", v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v15);
  }
  v21 = *MEMORY[0x24BE908B8];
  objc_msgSend(v29, "objectForKey:", *MEMORY[0x24BE908B8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v29, "objectForKey:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BE908C8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BE908C0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_failTestWithName:andFailure:", v24, v25);

  }
  return v4;
}

void __75__SiriPresentationViewController_Testing__extractTestingInputsFromContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setText:", v2);
  objc_msgSend(v3, "setType:", 1);

}

void __75__SiriPresentationViewController_Testing__extractTestingInputsFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecordedSpeechURL:", v4);

  objc_msgSend(v5, "setType:", 2);
}

- (void)_processIncomingRequestOptionsForTestingPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "testingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SiriPresentationViewController _clearAllTestingInputs](self, "_clearAllTestingInputs");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "testingContext", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SiriPresentationViewController extractTestingInputsFromContext:](SiriPresentationViewController, "extractTestingInputsFromContext:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[SiriPresentationViewController _enqueueTestInput:](self, "_enqueueTestInput:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)_clearAllTestingInputs
{
  id v2;
  id v3;

  -[SiriPresentationViewController _testInputQueue](self, "_testInputQueue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "dequeueAllObjects");

}

- (void)_enqueueTestInput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriPresentationViewController _testInputQueue](self, "_testInputQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueObject:", v4);

}

- (BOOL)_hasTestingInput
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SiriPresentationViewController _testInputQueue](self, "_testInputQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frontObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_dequeueTestingInput
{
  void *v2;
  void *v3;

  -[SiriPresentationViewController _testInputQueue](self, "_testInputQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_runSyntheticButtonActivationTest
{
  SASHIDGenerator *v2;

  v2 = objc_alloc_init(SASHIDGenerator);
  if (MGGetSInt32Answer() == 2)
    -[SASHIDGenerator sendHoldLockButtonHIDEvents](v2, "sendHoldLockButtonHIDEvents");
  else
    -[SASHIDGenerator sendHoldHomeButtonHIDEvents](v2, "sendHoldHomeButtonHIDEvents");

}

- (void)_startUIRequestWithText:(id)a3 testName:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BE092B8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "startUIRequest:", v5);

  objc_msgSend(v6, "barrier");
}

+ (void)_failTestWithName:(id)a3 andFailure:(id)a4
{
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "failedTest:withFailure:", a3, a4);
}

- (void)_removePreviousConversationIfNeededWithTestName:(id)a3 testOptions:(id)a4
{
  void *v4;
  char v5;
  id v6;

  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("keepPreviousConversation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE09180]);
    objc_msgSend(v6, "removeConversationWithIdentifier:completionBlock:", *MEMORY[0x24BE09500], 0);

  }
}

- (void)_removePreviousInjectAudioSettings
{
  -[SiriPresentationViewController _enableAudioInjection:audioFiles:](self, "_enableAudioInjection:audioFiles:", 0, MEMORY[0x24BDBD1A8]);
}

- (void)_enableAudioInjection:(BOOL)a3 audioFiles:(id)a4
{
  _BOOL8 v4;
  id value;

  v4 = a3;
  value = a4;
  CFPreferencesSetAppValue(CFSTR("Audio Injection Enabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4), CFSTR("com.apple.voicetrigger"));
  CFPreferencesSetAppValue(CFSTR("Audio Injection File Path"), value, CFSTR("com.apple.voicetrigger"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.voicetrigger"));

}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_215D55000, a1, a3, "%s SiriPresentationViewController connection invalidated", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __98__SiriPresentationViewController_initWithIdentifier_hostedPresentationFrame_displayConfiguration___block_invoke_65_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_215D55000, a1, a3, "%s SiriPresentationViewController connection interrupted. Reactivating...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)siriEffectsViewController
{
  OUTLINED_FUNCTION_6(&dword_215D55000, a1, a3, "%s SiriPresentationViewController creating siri effects VC", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)didPresentLocationTCC:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_215D55000, v3, v4, "%s #location Location TCC presented: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_5();
}

- (void)didDismissLocationTCC:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_215D55000, v3, v4, "%s #location Location TCC dismissed: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_5();
}

- (void)_activeTCCHasContentAtPoint:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("was not");
  v5 = "-[SiriPresentationViewController _activeTCCHasContentAtPoint:]";
  v4 = 136315650;
  if ((a1 & 1) != 0)
    v3 = CFSTR("was");
  v6 = 2048;
  v7 = a2;
  v8 = 2112;
  v9 = v3;
  _os_log_debug_impl(&dword_215D55000, log, OS_LOG_TYPE_DEBUG, "%s #location hit testing %lu alerts - touch %@ in content.", (uint8_t *)&v4, 0x20u);
}

void __50__SiriPresentationViewController_activateHintGlow__block_invoke_88_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_215D55000, v0, v1, "%s SiriPresentationViewController Failed to present Siri effects VC with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __85__SiriPresentationViewController__requestPresentationOfEffectsVCForButtonInvocation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_215D55000, v0, v1, "%s SiriPresentationViewController Failed to present Siri effects VC with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __68__SiriPresentationViewController__tearDownSiriEffectsViewController__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_215D55000, v0, v1, "%s #SiriPresentationViewController Failed to dismiss Siri effects VC with error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __72__SiriPresentationViewController__startDeviceScreenEngagementController__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  __int16 v8;
  uint64_t v9;
  int v10[5];
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_deviceScreenEngagementController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 136315650;
  OUTLINED_FUNCTION_10();
  v11 = v8;
  v12 = a3;
  OUTLINED_FUNCTION_9(&dword_215D55000, v5, v9, "%s #userAttention Failed to start device screen engagement: %{public}@, error: %{public}@", (uint8_t *)v10);

}

- (void)_shouldProceedPresentingSiriViewController
{
  OUTLINED_FUNCTION_1(&dword_215D55000, a1, a3, "%s #activation There was a pending dismissal when Siri tried to present. Rejecting presentation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_prepareSiriViewControllerWithRequestOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_215D55000, a1, a3, "%s #activation reusing AFUISiriViewController. This is currently not supported!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_viewModeForRequestOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_215D55000, v0, v1, "%s #activation unknown presentationIdentifier %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_presentationDismissalRequestedWithOptions:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_215D55000, a1, a3, "%s #activation presentation dismissal requested while another dismissal in progress", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_presentationDismissalRequestedWithOptions:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_215D55000, a1, a3, "%s SiriPresentationViewController invalidating platform hosting instrumentation handler for dismissal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_presentationDismissalRequestedWithOptions:withCompletion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_215D55000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_cancelPendingActivationWithReason:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_215D55000, a1, a3, "%s #activation tried to cancel pending activation but it already finished.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)siriViewController
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_215D55000, v1, v4, "%s #activation Attempting to use siriViewController, but one does not exist. Backtrace: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_5();
}

- (void)_dismissDueToUnexpectedError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2(&dword_215D55000, v0, v1, "%s #activation Siri encountered an unexpected error; dismissing Siri: %{public}@",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_3();
}

- (void)_viewHostingInstrumentationHandler
{
  OUTLINED_FUNCTION_6(&dword_215D55000, a1, a3, "%s SiriPresentationViewController initializing new platform hosting instrumentation handler", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_logSignatureWithType:subType:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_215D55000, v0, v1, "%s Reporting Automatic Bug Capture of type - %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler:(uint64_t)a3 shouldTurnScreenOff:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_215D55000, a1, a3, "%s #activation #myriadUI - Trying to start animation dismissal timer when one already exists", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __124__SiriPresentationViewController__watchdogQueue_startAnimationDismissalWatchdogTimerWithTimeoutHandler_shouldTurnScreenOff___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_215D55000, a1, a3, "%s #activation #myriadUI - Animation did not call completion, watchdogTimer cleaning up & continuing with dismissal", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __46__SiriPresentationViewController__waitForPing__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_215D55000, a1, a3, "%s #pingpong timed out waiting for ping", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_presentationIdentifierFromUIPresentationIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_215D55000, v0, v1, "%s Unhandled presentation identifier: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
