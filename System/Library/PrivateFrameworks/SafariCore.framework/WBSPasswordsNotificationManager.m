@implementation WBSPasswordsNotificationManager

+ (WBSPasswordsNotificationManager)sharedNotificationManager
{
  if (qword_1EEFE5A50 != -1)
    swift_once();
  return (WBSPasswordsNotificationManager *)(id)qword_1EEFE5A58;
}

- (WBSPasswordsNotificationManagerDelegate)delegate
{
  return (WBSPasswordsNotificationManagerDelegate *)(id)MEMORY[0x1B5E279C4]((char *)self+ OBJC_IVAR___WBSPasswordsNotificationManager_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (id)initIfAvailable
{
  return sub_1B26C3EA4();
}

- (WBSPasswordsNotificationManager)init
{
  return (WBSPasswordsNotificationManager *)sub_1B26C3FD4();
}

- (void)requestStatusWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  WBSPasswordsNotificationManager *v9;
  _QWORD v10[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1B26CB6CC;
  *(_QWORD *)(v7 + 24) = v5;
  v10[4] = sub_1B26CB700;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1B26C4640;
  v10[3] = &block_descriptor_104;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_getNotificationSettingsWithCompletionHandler_, v8);
  _Block_release(v8);

  swift_release();
}

- (void)requestPermissionToSendNotificationsProvisionally:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  WBSPasswordsNotificationManager *v11;
  _QWORD v12[6];

  v4 = a3;
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  if (v4)
    v8 = 70;
  else
    v8 = 6;
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WBSPasswordsNotificationManager_userNotificationCenter);
  v12[4] = sub_1B26CB6C4;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1B26C47A0;
  v12[3] = &block_descriptor_95;
  v10 = _Block_copy(v12);
  v11 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_requestAuthorizationWithOptions_completionHandler_, v8, v10);
  _Block_release(v10);

  swift_release();
}

- (void)schedulePasswordSavedNotificationForSavedAccount:(WBSSavedAccount *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  WBSSavedAccount *v14;
  WBSPasswordsNotificationManager *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5B98);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = sub_1B26D41D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EEFE5C78;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EEFE5C80;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1B26C71BC((uint64_t)v8, (uint64_t)&unk_1EEFE5C88, (uint64_t)v13);
  swift_release();
}

- (void)schedulePasswordUpdatedNotificationForSavedAccount:(WBSSavedAccount *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  WBSSavedAccount *v14;
  WBSPasswordsNotificationManager *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5B98);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = sub_1B26D41D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EEFE5C50;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EEFE5C58;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_1B26C71BC((uint64_t)v8, (uint64_t)&unk_1EEFE5C60, (uint64_t)v13);
  swift_release();
}

- (void)scheduleTakeATourNotificationIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  WBSPasswordsNotificationManager *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5B98);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_1B26D41D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1EEFE5C28;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EEFE5C30;
  v11[5] = v10;
  v12 = self;
  sub_1B26C71BC((uint64_t)v6, (uint64_t)&unk_1EEFE5C38, (uint64_t)v11);
  swift_release();
}

- (void)removeDeliveredTakeATourNotification
{
  WBSPasswordsNotificationManager *v2;

  v2 = self;
  sub_1B26C5E30();

}

- (void)scheduleICloudKeychainSyncingNotification
{
  WBSPasswordsNotificationManager *v2;

  v2 = self;
  sub_1B26C5EEC();

}

- (void)schedulePasswordBreachNotificationRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  WBSPasswordsNotificationManager *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1B26C6000((uint64_t)v8, (uint64_t)sub_1B26CB450, v7);

  swift_release();
}

- (void)scheduleAutomaticallyCreatedPasskeyNotificationWithServiceName:(NSString *)a3 relyingPartyID:(NSString *)a4 userName:(NSString *)a5 credentialID:(NSData *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  NSData *v23;
  WBSPasswordsNotificationManager *v24;
  uint64_t v25;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEFE5B98);
  MEMORY[0x1E0C80A78]();
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a7);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = v15;
  v16[7] = self;
  v17 = sub_1B26D41D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EEFE5BA8;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EEFE5BB8;
  v19[5] = v18;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = self;
  sub_1B26C71BC((uint64_t)v14, (uint64_t)&unk_1EEFE5BC8, (uint64_t)v19);
  swift_release();
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  WBSPasswordsNotificationManager *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = objc_msgSend(v11, sel_request);
  v14 = objc_msgSend(v13, sel_content);

  v15 = objc_msgSend(v14, sel_userInfo);
  v16 = sub_1B26D4128();

  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_1B26CB894;
  *(_QWORD *)(v17 + 24) = v9;
  swift_retain();
  sub_1B26C6BBC(2, 1, v16, (uint64_t)sub_1B26CB040, v17);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  WBSPasswordsNotificationManager *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1B26CA8DC(v10, (uint64_t)v11, (void (**)(_QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void).cxx_destruct
{
  sub_1B26CB7BC((uint64_t)self + OBJC_IVAR___WBSPasswordsNotificationManager_delegate);

}

@end
