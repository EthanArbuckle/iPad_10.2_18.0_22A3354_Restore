@implementation GamePolicyPrivilegedToolProxy

- (void)ping
{
  swift_retain(self);
  sub_1000135F0();
  swift_release(self);
}

- (void)requestSetIgnoreDeviceRestrictions:(BOOL)a3 withReply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(void *, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  NSString v10;

  v4 = a3;
  v6 = (void (**)(void *, uint64_t))_Block_copy(a4);
  v7 = qword_100037328;
  swift_retain(self);
  if (v7 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v8 = off_1000375F8;
  v9 = (void *)*((_QWORD *)off_1000375F8 + 2);
  swift_retain(off_1000375F8);
  v10 = String._bridgeToObjectiveC()();
  objc_msgSend(v9, "setBool:forKey:", v4, v10);
  swift_release(v8);

  v6[2](v6, 1);
  _Block_release(v6);
  swift_release(self);
}

- (void)requestGetIgnoreDeviceRestrictionsWithReply:(id)a3
{
  void (**v4)(void *, _QWORD);
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void (**)(void *, _QWORD))_Block_copy(a3);
  v5 = qword_100037328;
  swift_retain(self);
  if (v5 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v6 = off_1000375F8;
  swift_retain(off_1000375F8);
  v7 = GlobalPreferences.ignoreDeviceRestrictions.getter();
  swift_release(v6);
  v4[2](v4, v7 & 1);
  _Block_release(v4);
  swift_release(self);
}

- (void)requestGameModeStatusWithReply:(id)a3
{
  sub_1000148E8((uint64_t)self, (int)a2, a3, (uint64_t (*)(uint64_t))sub_10000D490);
}

- (void)requestSetGameModeEnablementStrategy:(int64_t)a3 withReply:(id)a4
{
  sub_100014998((uint64_t)self, (int)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000D580);
}

- (void)requestDynamicSplitterStatusWithReply:(id)a3
{
  sub_1000148E8((uint64_t)self, (int)a2, a3, (uint64_t (*)(uint64_t))sub_10000E534);
}

- (void)requestSetDynamicSplitterEnablementStrategy:(int64_t)a3 withReply:(id)a4
{
  sub_100014998((uint64_t)self, (int)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000D964);
}

- (void)requestSEMStatusWithReply:(id)a3
{
  sub_1000148E8((uint64_t)self, (int)a2, a3, (uint64_t (*)(uint64_t))sub_10000E624);
}

- (void)requestSetSEMEnablementStrategy:(int64_t)a3 withReply:(id)a4
{
  sub_100014998((uint64_t)self, (int)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000DD48);
}

- (void)requestSEMAllowlistWithReply:(id)a3
{
  void (**v4)(void *, Class);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  Class isa;

  v4 = (void (**)(void *, Class))_Block_copy(a3);
  v5 = qword_100037328;
  swift_retain(self);
  if (v5 != -1)
    swift_once(&qword_100037328, sub_10000764C);
  v6 = off_1000375F8;
  swift_retain(off_1000375F8);
  v7 = GlobalPreferences.semAllowList.getter();
  swift_release(v6);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v4[2](v4, isa);
  swift_bridgeObjectRelease(v7);

  _Block_release(v4);
  swift_release(self);
}

- (void)requestSEMAddBundleID:(id)a3 withReply:(id)a4
{
  sub_100013AB8((uint64_t)self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, void *))sub_10001579C);
}

- (void)requestSEMRemoveBundleID:(id)a3 withReply:(id)a4
{
  sub_100013AB8((uint64_t)self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, void *))sub_100015B54);
}

- (void)requestSEMClearAllowlistWithReply:(id)a3
{
  void *v4;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  swift_retain(self);
  sub_100015E14((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
  swift_release(self);
}

- (void)requestCCUIGameModeStatusInfoWithReply:(id)a3
{
  void (**v4)(void *, void *);
  void *v5;

  v4 = (void (**)(void *, void *))_Block_copy(a3);
  swift_retain(self);
  v5 = (void *)sub_100013C78(0, 1);
  v4[2](v4, v5);

  _Block_release(v4);
  swift_release(self);
}

- (void)requestCCUIGameModeStatusBundleInfo:(id)a3 withReply:(id)a4
{
  void (**v6)(void *, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE v16[48];

  v6 = (void (**)(void *, void *))_Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = sub_100002090(&qword_100038718);
  inited = swift_initStackObject(v10, v16);
  *(_OWORD *)(inited + 16) = xmmword_100026FE0;
  *(_QWORD *)(inited + 32) = v7;
  *(_QWORD *)(inited + 40) = v9;
  swift_retain(self);
  swift_bridgeObjectRetain(v9);
  v12 = (_QWORD *)sub_100013C78((void *)inited, 0);
  swift_setDeallocating(inited);
  v13 = swift_arrayDestroy(inited + 32, *(_QWORD *)(inited + 16), &type metadata for String);
  v14 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v12) + 0x60))(v13);

  swift_bridgeObjectRetain(v9);
  v15 = sub_100016618(v14, v7, v9);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v9);
  v6[2](v6, v15);

  _Block_release(v6);
  swift_release(self);
  swift_bridgeObjectRelease(v9);
}

- (void)requestCCUISetGameModeInfoWithState:(int64_t)a3 bundleIdentifier:(id)a4 withReply:(id)a5
{
  sub_100014450((uint64_t)self, (int)a2, a3, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))sub_100016790);
}

- (void)requestCCUIGameModeStatusWithReply:(id)a3
{
  void (**v4)(void *, void *);
  _QWORD *v5;
  void *v6;

  v4 = (void (**)(void *, void *))_Block_copy(a3);
  swift_retain(self);
  v5 = (_QWORD *)sub_100013C78(0, 1);
  v6 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v5) + 0x80))();

  v4[2](v4, v6);
  _Block_release(v4);
  swift_release(self);
}

- (void)requestCCUIGameModeStatusBundle:(id)a3 withReply:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  swift_retain(self);
  sub_1000169BC(v7, v9, (uint64_t)self, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release(self);
  swift_bridgeObjectRelease(v9);
}

- (void)requestCCUISetGameModeWithState:(int64_t)a3 bundleIdentifier:(id)a4 withReply:(id)a5
{
  sub_100014450((uint64_t)self, (int)a2, a3, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))sub_100016AF0);
}

- (void)requestGameModeWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100002090(&qword_100038168);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1000314E0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100031508, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000386F8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100031530, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100038700;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_100014B0C((uint64_t)v7, (uint64_t)&unk_100038708, (uint64_t)v12);
  swift_release(v13);
}

- (void)requestSetGameModeWithGameModeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v7 = sub_100002090(&qword_100038168);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject(&unk_100031440, 40, 7);
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100031468, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000386B0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100031490, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000386C0;
  v14[5] = v13;
  swift_retain(self);
  v15 = sub_100014B0C((uint64_t)v9, (uint64_t)&unk_1000386D0, (uint64_t)v14);
  swift_release(v15);
}

- (void)requestModelManagerGameAssertionStatusWithReply:(id)a3
{
  sub_1000148E8((uint64_t)self, (int)a2, a3, (uint64_t (*)(uint64_t))sub_10000E714);
}

- (void)requestSetModelManagerGameAssertionPolicyStrategy:(int64_t)a3 withReply:(id)a4
{
  sub_100014998((uint64_t)self, (int)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_10000E12C);
}

@end
