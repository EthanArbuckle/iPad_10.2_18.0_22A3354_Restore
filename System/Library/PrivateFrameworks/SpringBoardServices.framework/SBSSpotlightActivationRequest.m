@implementation SBSSpotlightActivationRequest

- (void)requestSpotlightActivation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v2 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSSpotlightActivationRequestServer identifier](SBSSpotlightActivationRequestServer, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointForMachName:service:instance:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "configureConnection:", &__block_literal_global_17);
  SBLogSpotlight();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18EB52000, v7, OS_LOG_TYPE_DEFAULT, "SBSSpotlightActivationRequest requests spotlight activation.", v9, 2u);
  }

  objc_msgSend(v6, "activate");
  objc_msgSend(v6, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestSpotlightActivation");

  objc_msgSend(v6, "invalidate");
}

void __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  +[SBSSpotlightActivationRequestServer interface](SBSSpotlightActivationRequestServer, "interface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v2);

  +[SBSSpotlightActivationRequestServer serviceQuality](SBSSpotlightActivationRequestServer, "serviceQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v3);

  objc_msgSend(v4, "setInvalidationHandler:", &__block_literal_global_5_1);
}

void __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke_2()
{
  NSObject *v0;

  SBLogSpotlight();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke_2_cold_1(v0);

}

void __59__SBSSpotlightActivationRequest_requestSpotlightActivation__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "Availability request connection invalidated remotely.", v1, 2u);
}

@end
