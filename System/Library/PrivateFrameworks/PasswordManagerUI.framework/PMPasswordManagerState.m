@implementation PMPasswordManagerState

- (_TtC17PasswordManagerUI22PMPasswordManagerState)init
{
  return (_TtC17PasswordManagerUI22PMPasswordManagerState *)PMPasswordManagerState.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__isGeneratedPasswordsLogPresented;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572C08B0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__systemSettingNavigationPath;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572BDB90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  v8 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__sharingGroupIDToPresent;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572B63F8);
  v10 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v11 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__contextForPresentedNewGroupFlow;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572BDB88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v10((char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__groupIDForRecentlyAcceptedInvitation, v9);
  v5((char *)self+ OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__isMembersOfDeletedGroupMightHaveAccessToAccountsAlertPresented, v4);
  v13 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__groupMemberNamesOfDeletedGroup;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572B63E8);
  v15 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8);
  v15(v13, v14);
  v5((char *)self+ OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__isMembersOfGroupUserLeftMightHaveAccessToAccountsAlertPresented, v4);
  v15((char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__groupMemberNamesOfGroupTheyLeft, v14);
  v16 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__inboundOTPAuthURLContext;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572BDB80);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI22PMPasswordManagerState__inboundSharableAccountContext;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572BDB78);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
