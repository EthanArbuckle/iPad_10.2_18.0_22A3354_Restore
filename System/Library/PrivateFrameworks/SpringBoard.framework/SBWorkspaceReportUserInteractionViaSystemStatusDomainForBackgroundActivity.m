@implementation SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity

void __SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[14];

  v16[13] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "systemStatusServer");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0DB0B60];
  v16[0] = *MEMORY[0x1E0DB0B58];
  v16[1] = v1;
  v2 = *MEMORY[0x1E0DB0C00];
  v16[2] = *MEMORY[0x1E0DB0B00];
  v16[3] = v2;
  v3 = *MEMORY[0x1E0DB0BD0];
  v16[4] = *MEMORY[0x1E0DB0BF8];
  v16[5] = v3;
  v4 = *MEMORY[0x1E0DB0BD8];
  v16[6] = *MEMORY[0x1E0DB0BE0];
  v16[7] = v4;
  v5 = *MEMORY[0x1E0DB0B50];
  v16[8] = *MEMORY[0x1E0DB0AC8];
  v16[9] = v5;
  v6 = *MEMORY[0x1E0DB0B08];
  v16[10] = *MEMORY[0x1E0DB0AF8];
  v16[11] = v6;
  v16[12] = CFSTR("com.apple.systemstatus.background-activity.CallRecording");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity___callingActivityIdentifiers;
  SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity___callingActivityIdentifiers = v8;

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB08B0]), "initWithServerHandle:", v0);
  v11 = (void *)SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity___callingDomain;
  SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity___callingDomain = v10;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A60]), "initWithServerHandle:", v0);
  v13 = (void *)SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity___stewieDomain;
  SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity___stewieDomain = v12;

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0868]), "initWithServerHandle:", v0);
  v15 = (void *)SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity___backgroundActivitiesDomain;
  SBWorkspaceReportUserInteractionViaSystemStatusDomainForBackgroundActivity___backgroundActivitiesDomain = v14;

}

@end
