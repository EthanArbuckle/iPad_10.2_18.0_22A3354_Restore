@implementation SWTransparencyXPCImplementation

- (void)triggerMilestoneRefreshWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001099E8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100109A10, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100128240;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100109A38, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100128248;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100032E54((uint64_t)v7, (uint64_t)&unk_100128250, (uint64_t)v12);
  swift_release(v14);
}

- (void)triggerConsistencyVerificationWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100109970, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100109998, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100128220;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001099C0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100128228;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100032E54((uint64_t)v7, (uint64_t)&unk_100128230, (uint64_t)v12);
  swift_release(v14);
}

- (void)triggerPublicKeybagRefreshWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001098F8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100109920, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100128200;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100109948, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100128208;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100032E54((uint64_t)v7, (uint64_t)&unk_100128210, (uint64_t)v12);
  swift_release(v14);
}

- (void)verifyProofs:(NSData *)a3 forObject:(NSData *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSData *v17;
  NSData *v18;
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100109880, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1001098A8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001281E0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1001098D0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001281E8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_100032E54((uint64_t)v11, (uint64_t)&unk_1001281F0, (uint64_t)v16);
  swift_release(v20);
}

- (void)sysdiagnoseInfoWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100109808, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100109830, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001281C0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100109858, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001281C8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100032E54((uint64_t)v7, (uint64_t)&unk_1001281D0, (uint64_t)v12);
  swift_release(v14);
}

- (void)postCFU:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100109790, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1001097B8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001281A0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1001097E0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001281A8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100032E54((uint64_t)v9, (uint64_t)&unk_1001281B0, (uint64_t)v14);
  swift_release(v17);
}

- (void)clearAllCFUWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100109718, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100109740, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100128180;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100109768, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100128188;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100032E54((uint64_t)v7, (uint64_t)&unk_100128190, (uint64_t)v12);
  swift_release(v14);
}

- (void)waitStateMachineReadyWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001096A0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1001096C8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100128160;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001096F0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100128168;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100032E54((uint64_t)v7, (uint64_t)&unk_100128170, (uint64_t)v12);
  swift_release(v14);
}

- (void)dailyWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10001D138(&qword_100127220);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100109600, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100109628, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100128138;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100109650, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100128140;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100032E54((uint64_t)v7, (uint64_t)&unk_100128148, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC15swtransparencyd31SWTransparencyXPCImplementation)init
{
  _TtC15swtransparencyd31SWTransparencyXPCImplementation *result;

  result = (_TtC15swtransparencyd31SWTransparencyXPCImplementation *)_swift_stdlib_reportUnimplementedInitializer("swtransparencyd.SWTransparencyXPCImplementation", 47, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC15swtransparencyd31SWTransparencyXPCImplementation_stateMachine));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC15swtransparencyd31SWTransparencyXPCImplementation_daemon));
  swift_bridgeObjectRelease(*(_QWORD *)&self->stateMachine[OBJC_IVAR____TtC15swtransparencyd31SWTransparencyXPCImplementation_clientName]);
}

@end
