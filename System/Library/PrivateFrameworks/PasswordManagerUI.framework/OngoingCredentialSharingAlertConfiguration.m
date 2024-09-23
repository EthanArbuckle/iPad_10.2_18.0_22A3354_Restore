@implementation OngoingCredentialSharingAlertConfiguration

+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 toMyPasswordsFromGroup:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  sub_2435489EC(v5, v6);
  v8 = v7;

  if (v8)
  {
    v9 = (void *)sub_243850234();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromMyPasswordstoGroupWithName:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  sub_24354AC1C(v4);

  v5 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)confirmationAlertSubtitleForMovingSavedAccount:(id)a3 fromGroupWithName:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v5 = sub_243850264();
  v7 = v6;
  v8 = a3;
  sub_24354AD4C(v8, v5, v7);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v9;
}

+ (id)confirmationAlertTitleForRemovingGroupMemberWithName:(id)a3
{
  return sub_243547744();
}

+ (id)confirmationAlertSubtitleForRemovingGroupMemberWithName:(id)a3
{
  return sub_243547744();
}

+ (id)warningAlertTitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemovalWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = sub_243850264();
  sub_24354AF40(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)warningAlertSubtitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemovalWithName:(id)a3
{
  return sub_243547744();
}

+ (id)alertTitleAndSubtitleForMovingSavedAccounts:(id)a3 toGroupWithName:(id)a4 isDragAndDropOperation:(BOOL)a5
{
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  sub_24354DEA8(0, (unint64_t *)&qword_2572B40D8);
  v7 = sub_243850414();
  if (a4)
  {
    v8 = sub_243850264();
    a4 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = sub_24354C0D8(v7, v8, (uint64_t)a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

+ (NSString)alertTitleForFailingToMoveToGroup
{
  return (NSString *)sub_2435481C4();
}

+ (id)alertSubtitleForFailingToMoveSavedAccounts:(id)a3 toGroupWithName:(id)a4
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  sub_24354DEA8(0, (unint64_t *)&qword_2572B40D8);
  v5 = sub_243850414();
  if (a4)
  {
    v6 = sub_243850264();
    a4 = v7;
  }
  else
  {
    v6 = 0;
  }
  sub_24354C780(v5, v6, (uint64_t)a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v8;
}

+ (id)warningAlertTitleForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4
{
  return sub_243547C00();
}

+ (id)warningAlertMessageForMovingNumberOfReusedPasswords:(int64_t)a3 withTotalNumberOfAccountsSelected:(int64_t)a4
{
  return sub_243547C00();
}

+ (id)alertTitleForMovingSavedAccount:(id)a3 toGroupWithName:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;

  if (a4)
  {
    v5 = sub_243850264();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a3;
  sub_24354C908(v8, v5, v7);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v9;
}

+ (NSString)groupDeletionConfirmationAlertTitle
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)groupDeletionWarningAlertSubtitle
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)leaveGroupConfirmationAlertTitle
{
  return (NSString *)sub_2435481C4();
}

+ (id)groupDeletionConfirmationAlertSubtitle
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v6;

  v0 = sub_24384DA08();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend((id)objc_opt_self(), sel_isPasswordManagerAppEnabled);
  sub_24384D9FC();
  sub_24384D9F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v4 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v4;
}

+ (NSString)leaveGroupWarningAlertSubtitle
{
  return (NSString *)sub_2435481C4();
}

+ (id)groupExitWarningAlertTitleWithGroupMemberNames:(id)a3
{
  _QWORD *v3;
  void *v4;

  v3 = (_QWORD *)sub_243850414();
  sub_24354D76C(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v4;
}

+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup
{
  return (NSString *)sub_2435481C4();
}

+ (id)alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileLeavingGroup
{
  void *v0;

  sub_24354DA98();
  v0 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v0;
}

+ (NSString)alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)alertTitleForUnavailableGroup
{
  return (NSString *)sub_2435481C4();
}

+ (NSString)alertSubtitleForUnavailableGroup
{
  return (NSString *)sub_2435481C4();
}

+ (id)alertTitleForFailingToCreateGroupWithError:(id)a3
{
  return sub_2435487B4((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToDeleteGroupWithError:(id)a3
{
  return sub_2435487B4((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToLeaveGroupWithError:(id)a3
{
  return sub_2435487B4((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToAddGroupMemberWithError:(id)a3
{
  return sub_2435487B4((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToRemoveGroupMemberWithError:(id)a3
{
  return sub_2435487B4((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToUpdateGroupWithError:(id)a3
{
  return sub_2435487B4((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToAcceptInvitationWithError:(id)a3
{
  return sub_2435487B4((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)alertTitleForFailingToDeclineInvitationWithError:(id)a3
{
  return sub_2435487B4((uint64_t)a1, (uint64_t)a2, a3);
}

+ (id)declineGroupInvitationAlertTitleForGroupWithName:(id)a3 fromKnownSender:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = sub_243850264();
  sub_24354DBDC(v5, v6, a4);
  swift_bridgeObjectRelease();
  v7 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC17PasswordManagerUI42OngoingCredentialSharingAlertConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OngoingCredentialSharingAlertConfiguration();
  return -[OngoingCredentialSharingAlertConfiguration init](&v3, sel_init);
}

@end
