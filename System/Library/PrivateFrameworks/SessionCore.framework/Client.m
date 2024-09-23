@implementation Client

- (BOOL)registerForPushTokensWithError:(id *)a3
{
  _TtC11SessionCoreP33_4CCBD309304C86708E1086DB2B0619886Client *v3;

  v3 = self;
  sub_1C132C89C();

  return 1;
}

- (id)subscribeWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  _TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  v5 = a3;
  v6 = self;
  v7 = sub_1C14250D8();
  v9 = v8;

  v10 = sub_1C1329928();
  v12 = v11;

  sub_1C13282B4(v7, v9);
  v13 = (void *)sub_1C14250CC();
  sub_1C13282B4(v10, v12);
  return v13;
}

- (id)activityDescriptorContentStatesWithError:(id *)a3
{
  _TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = self;
  v4 = sub_1C13E259C();
  v6 = v5;

  v7 = (void *)sub_1C14250CC();
  sub_1C13282B4(v4, v6);
  return v7;
}

- (NSString)description
{
  _TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *v2;
  void *v3;

  v2 = self;
  sub_1C1332C1C();

  v3 = (void *)sub_1C1426A7C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  _TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *v2;

  v2 = self;
  sub_1C1332D68();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client_connection));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client_requestProcessingQueue));
  swift_bridgeObjectRelease();
}

- (_TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client)init
{
  _TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *result;

  result = (_TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)mockPushWithToken:(id)a3 processIdentifier:(id)a4 environmentName:(id)a5 payload:(id)a6 pushPriority:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *v31;

  v30 = _Block_copy(a8);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v31 = self;
  v19 = sub_1C14250D8();
  v21 = v20;

  v22 = sub_1C1426A88();
  v24 = v23;

  v25 = sub_1C1426A88();
  v27 = v26;

  v28 = sub_1C1426A34();
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v30;
  sub_1C1337C94(v19, v21, 0, 0, v22, v24, v25, v27, v28, v18, (uint64_t)v31, (void (*)(void *, void *))sub_1C13391F4, v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1C13282B4(v19, v21);

}

- (void)mockPushWithChannelID:(id)a3 processIdentifier:(id)a4 environmentName:(id)a5 payload:(id)a6 pushPriority:(id)a7 completionHandler:(id)a8
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *v22;
  uint64_t v23;

  v10 = _Block_copy(a8);
  v23 = sub_1C1426A88();
  v12 = v11;
  v13 = sub_1C1426A88();
  v15 = v14;
  v16 = sub_1C1426A88();
  v18 = v17;
  v19 = sub_1C1426A34();
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v10;
  v21 = a7;
  v22 = self;
  sub_1C1337C94(0, 0xF000000000000000, v23, v12, v13, v15, v16, v18, v19, v21, (uint64_t)v22, (void (*)(void *, void *))sub_1C1338FFC, v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (id)requestActivityWithRequest:(id)a3 error:(id *)a4
{
  id v5;
  _TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  v5 = a3;
  v6 = self;
  v7 = sub_1C14250D8();
  v9 = v8;

  v10 = sub_1C1333458();
  v12 = v11;

  sub_1C13282B4(v7, v9);
  v13 = (void *)sub_1C14250CC();
  sub_1C13282B4(v10, v12);
  return v13;
}

- (void)updateActivityWithIdentifier:(id)a3 payload:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;

  v6 = sub_1C1425450();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1C1426A88();
  v12 = v11;
  v13 = a4;
  v14 = self;
  v15 = sub_1C14250D8();
  v17 = v16;

  v18 = (void *)sub_1C14250CC();
  sub_1C1329AD0((unint64_t *)&unk_1ED792708, (uint64_t (*)(uint64_t))MEMORY[0x1E0C8F570], MEMORY[0x1E0C8F568]);
  sub_1C1425BAC();

  sub_1C1333E80(v10, v12, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1C13282B4(v15, v17);

  swift_bridgeObjectRelease();
}

- (void)endActivityWithIdentifier:(id)a3 payload:(id)a4 options:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC11SessionCoreP33_F0FA238C64D38D6BA2E43F90C1B188B06Client *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v8 = sub_1C1426A88();
  v10 = v9;
  v11 = a5;
  v12 = self;
  if (a4)
  {
    v13 = a4;
    a4 = (id)sub_1C14250D8();
    v15 = v14;

  }
  else
  {
    v15 = 0xF000000000000000;
  }
  v16 = sub_1C14250D8();
  v18 = v17;

  sub_1C1334364(v8, v10, (uint64_t)a4, v15);
  sub_1C13282B4(v16, v18);
  sub_1C132D03C((uint64_t)a4, v15);

  swift_bridgeObjectRelease();
}

- (_TtC11SessionCoreP33_353B8C47142C77ABAD422CF2B8B621406Client)init
{
  _TtC11SessionCoreP33_353B8C47142C77ABAD422CF2B8B621406Client *result;

  result = (_TtC11SessionCoreP33_353B8C47142C77ABAD422CF2B8B621406Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)requestAlertDismissalWithActivityIdentifier:(id)a3
{
  _TtC11SessionCoreP33_353B8C47142C77ABAD422CF2B8B621406Client *v4;

  sub_1C1426A88();
  if (MEMORY[0x1C3BAD4B4]((char *)self + OBJC_IVAR____TtC11SessionCoreP33_353B8C47142C77ABAD422CF2B8B621406Client_delegate))
  {
    v4 = self;
    sub_1C13EE280();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (_TtC11SessionCoreP33_4CCBD309304C86708E1086DB2B0619886Client)init
{
  _TtC11SessionCoreP33_4CCBD309304C86708E1086DB2B0619886Client *result;

  result = (_TtC11SessionCoreP33_4CCBD309304C86708E1086DB2B0619886Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client)init
{
  _TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client *result;

  result = (_TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)activityDescriptorsWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v15;

  v4 = sub_1C1425348();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1C13E17DC((uint64_t)v7);
  sub_1C1329AD0(&qword_1ED7932E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0C8F448], MEMORY[0x1E0C8F440]);
  v9 = (void *)sub_1C1425BB8();
  v10 = sub_1C14250D8();
  v12 = v11;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v13 = (void *)sub_1C14250CC();
  sub_1C13282B4(v10, v12);
  return v13;
}

- (id)activityDescriptorForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client *v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF6DC000);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v22 - v8;
  v10 = sub_1C1426A88();
  v12 = v11;
  v13 = self;
  sub_1C13E1F68(v10, v12, (uint64_t)v9);
  sub_1C132C344((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_1EF6DC000);
  v14 = sub_1C1425498();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) == 1)
  {
    sub_1C132C860((uint64_t)v9, (uint64_t *)&unk_1EF6DC000);

    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    sub_1C1329AD0(&qword_1ED793BA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0C8F670], MEMORY[0x1E0C8F668]);
    v17 = (void *)sub_1C1425BB8();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
    v18 = sub_1C14250D8();
    v20 = v19;

    sub_1C132C860((uint64_t)v9, (uint64_t *)&unk_1EF6DC000);
    swift_bridgeObjectRelease();
    v21 = (void *)sub_1C14250CC();
    sub_1C13282B4(v18, v20);
    return v21;
  }
}

- (void)unsubscribe
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  os_unfair_lock_s *v6;
  _TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED793BC0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (os_unfair_lock_s *)(*(_QWORD **)((char *)&self->super.isa
                                       + OBJC_IVAR____TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client_lock))[2];
  v7 = self;
  os_unfair_lock_lock(v6);
  v8 = sub_1C14256B4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC11SessionCoreP33_0305B71F931612257040B50ABDE1CB866Client__lock_subscriptionOptions;
  swift_beginAccess();
  sub_1C1331720((uint64_t)v5, v9);
  swift_endAccess();
  os_unfair_lock_unlock(v6);

}

- (_TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client)init
{
  _TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client *result;

  result = (_TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)registerForSubscriptionPreferencesWithError:(id *)a3
{
  _TtC11SessionCoreP33_B02F3357A3D0A8E8DFCA3AAB9BED3E036Client *v3;

  v3 = self;
  sub_1C13EF230();

  return 1;
}

@end
