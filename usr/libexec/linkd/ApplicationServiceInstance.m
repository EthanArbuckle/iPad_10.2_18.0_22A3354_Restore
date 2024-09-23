@implementation ApplicationServiceInstance

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->sourceBundleIdentifier[OBJC_IVAR____TtC10LinkDaemon26ApplicationServiceInstance_sourceBundleIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->sourceBundleIdentifier[OBJC_IVAR____TtC10LinkDaemon26ApplicationServiceInstance_destinationBundleIdentifier]);
  sub_10001F944(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10LinkDaemon26ApplicationServiceInstance_registrySource));
}

- (void)requestUpdateAppShortcutParametersWithReply:(id)a3
{
  sub_100003704(self, (int)a2, a3, (uint64_t)&unk_10011CD08);
}

- (void)refreshAutoShortcutSubstitution:(NSArray *)a3 spans:(NSArray *)a4 parameterPresentationSubstitutions:(NSArray *)a5 reply:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  _TtC10LinkDaemon26ApplicationServiceInstance *v15;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject(&unk_10011CCE0, 56, 7);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_100004C84((uint64_t)&unk_10012A258, (uint64_t)v11);
}

- (void)updateRelevantIntents:(NSArray *)a3 bundleIdentifier:(NSString *)a4 reply:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSArray *v10;
  NSString *v11;
  _TtC10LinkDaemon26ApplicationServiceInstance *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject(&unk_10011CC90, 48, 7);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100004C84((uint64_t)&unk_10012A228, (uint64_t)v9);
}

- (void)persistIntentEnablementForIntent:(NSString *)a3 enablement:(LNIntentEnablement *)a4 reply:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  LNIntentEnablement *v11;
  _TtC10LinkDaemon26ApplicationServiceInstance *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject(&unk_10011CC68, 48, 7);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100004C84((uint64_t)&unk_10012A218, (uint64_t)v9);
}

- (void)retrievePersistedIntentEnablementsWithReply:(id)a3
{
  sub_100003704(self, (int)a2, a3, (uint64_t)&unk_10011CC40);
}

- (void)retrieveEnabledIntentsWithReply:(id)a3
{
  sub_100003704(self, (int)a2, a3, (uint64_t)&unk_10011CC18);
}

- (void)retrieveSiriLanguageWithReply:(id)a3
{
  sub_100003704(self, (int)a2, a3, (uint64_t)&unk_10011CBF0);
}

- (void)setIntentEnabled:(NSString *)a3 enabled:(BOOL)a4 reply:(id)a5
{
  void *v8;
  uint64_t v9;
  NSString *v10;
  _TtC10LinkDaemon26ApplicationServiceInstance *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10011CBC8, 48, 7);
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;
  sub_100004C84((uint64_t)&unk_10012A1A0, v9);
}

- (_TtC10LinkDaemon26ApplicationServiceInstance)init
{
  sub_10006FCD0();
}

@end
