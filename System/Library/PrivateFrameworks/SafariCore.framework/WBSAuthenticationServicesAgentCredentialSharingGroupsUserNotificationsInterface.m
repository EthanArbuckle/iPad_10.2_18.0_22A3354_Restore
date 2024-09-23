@implementation WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface

void __WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEFEA5F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface;
  WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_groupsUpdatedWithInfos_, 0, 0);
  objc_msgSend((id)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_groupsUpdatedWithInfos_shouldForceShowingNotifications_completionHandler_, 0, 0);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_fetchSharingGroupsThatIncludeFamilyMembers_, 0, 1);
}

@end
