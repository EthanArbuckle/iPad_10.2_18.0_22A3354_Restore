@implementation ICCloudServiceStatusRemoteMonitoring

+ (id)clientInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ICCloudServiceStatusRemoteMonitoring_clientInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (clientInterface_sCloudServiceStatusRemoteMonitoringClientInterfaceOnceToken != -1)
    dispatch_once(&clientInterface_sCloudServiceStatusRemoteMonitoringClientInterfaceOnceToken, block);
  return (id)clientInterface_sCloudServiceStatusRemoteMonitoringClientInterface;
}

+ (id)serviceInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ICCloudServiceStatusRemoteMonitoring_serviceInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serviceInterface_sCloudServiceStatusRemoteMonitoringServiceInterfaceOnceToken != -1)
    dispatch_once(&serviceInterface_sCloudServiceStatusRemoteMonitoringServiceInterfaceOnceToken, block);
  return (id)serviceInterface_sCloudServiceStatusRemoteMonitoringServiceInterface;
}

+ (id)_clientInterface
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5C3968);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_storefrontCountryCodeDidChange_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_storefrontIdentifierDidChange_, 0, 0);

  return v2;
}

+ (id)_serviceInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DD968);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_beginObservingCloudServiceStatusWithCompletionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_endObservingCloudServiceStatusWithToken_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_requestCapabilitiesWithPrivacyPromptPolicy_completionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_requestStorefrontCountryCodeWithCompletionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_requestStorefrontCountryCodeWithCompletionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_requestStorefrontIdentifierWithCompletionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_requestStorefrontIdentifierWithCompletionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_requestDeveloperTokenWithOptions_clientInfo_completionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestDeveloperTokenWithOptions_clientInfo_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_requestDeveloperTokenWithOptions_clientInfo_completionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_requestUserTokenForDeveloperToken_options_clientInfo_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_requestUserTokenForDeveloperToken_options_clientInfo_completionHandler_, 2, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_requestUserTokenForDeveloperToken_options_clientInfo_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_requestUserTokenForDeveloperToken_options_clientInfo_completionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_requestMusicKitTokensWithOptions_clientInfo_completionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_requestMusicKitTokensWithOptions_clientInfo_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_requestMusicKitTokensWithOptions_clientInfo_completionHandler_, 1, 1);

  return v2;
}

void __56__ICCloudServiceStatusRemoteMonitoring_serviceInterface__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_serviceInterface");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)serviceInterface_sCloudServiceStatusRemoteMonitoringServiceInterface;
  serviceInterface_sCloudServiceStatusRemoteMonitoringServiceInterface = v1;

}

void __55__ICCloudServiceStatusRemoteMonitoring_clientInterface__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_clientInterface");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)clientInterface_sCloudServiceStatusRemoteMonitoringClientInterface;
  clientInterface_sCloudServiceStatusRemoteMonitoringClientInterface = v1;

}

@end
