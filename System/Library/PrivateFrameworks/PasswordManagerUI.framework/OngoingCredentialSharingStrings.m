@implementation OngoingCredentialSharingStrings

+ (NSString)cannotChangePermissionForGroupMemberTitle
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)preventReadOnlyPermissionForGroupMemberThatHasContributedPasswordsExplanationFooter
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)groupCreationViewSubtitleString
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)groupManagementViewSubtitleStringForOwner
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)groupManagementViewSubtitleStringForNonOwner
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)newGroupViewTitle
{
  return (NSString *)sub_24354E104();
}

+ (NSString)newGroupButtonTitle
{
  return (NSString *)sub_24354E104();
}

+ (id)pickerTitleWithNumberOfSelectedAccounts:(int64_t)a3
{
  return sub_24354E43C((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_24354E830);
}

+ (NSString)choosePasswordsButtonTitle
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)reviewDuplicateButtonTitle
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)removeDuplicatePasswordsTitle
{
  return (NSString *)sub_2435481C4();
}

+ (id)deleteDuplicatesButtonTitleWithNumberOfSelectedAccounts:(int64_t)a3
{
  return sub_24354E43C((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_24354EB70);
}

+ (id)unableToInviteContactBecauseOfUnsupportedDevicesAlertMessageWithContactName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v3 = sub_24384DA08();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_243850264();
  v9 = v8;
  sub_24384D9FC();
  sub_24384D9F0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572BB980);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2438672E0;
  *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v10 + 64) = sub_24354AEFC();
  *(_QWORD *)(v10 + 32) = v7;
  *(_QWORD *)(v10 + 40) = v9;
  swift_bridgeObjectRetain();
  sub_243850240();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v11;
}

+ (NSString)unableToInviteMultipleContactsBecauseOfUnsupportedDevicesAlertMessage
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)sharedPasswordsGroupsUnavailableAlertTitle
{
  return (NSString *)sub_2435481C4();
}

- (_TtC17PasswordManagerUI31OngoingCredentialSharingStrings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OngoingCredentialSharingStrings();
  return -[OngoingCredentialSharingStrings init](&v3, sel_init);
}

@end
