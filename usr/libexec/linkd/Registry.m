@implementation Registry

- (void)fetchDatabaseURL:(id)a3
{
  void *v4;
  _TtC10LinkDaemon8Registry *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100012254((char *)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (_TtC10LinkDaemon8Registry)init
{
  sub_10009BD60();
}

- (void).cxx_destruct
{
  sub_10000E87C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10LinkDaemon8Registry_applicationSource));
  sub_1000BE8E8(OBJC_IVAR____TtC10LinkDaemon8Registry_indexingQueue);
  swift_bridgeObjectRelease();
  sub_1000BE8E8(OBJC_IVAR____TtC10LinkDaemon8Registry_ready);
  sub_1000131E0((uint64_t)self + OBJC_IVAR____TtC10LinkDaemon8Registry_lastMetadataAudit, &qword_10012AA20);

  sub_1000BE8E8(OBJC_IVAR____TtC10LinkDaemon8Registry_appShortcutInterpolator);
  sub_1000BE8E8(OBJC_IVAR____TtC10LinkDaemon8Registry_examplePhraseInterpolator);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10LinkDaemon8Registry_appProtectionSubscription));
}

- (void)actionsWithReply:(id)a3
{
  sub_1000B3024(self, (int)a2, a3, (uint64_t)&unk_10011DD80);
}

- (void)actionsForBundleIdentifier:(NSString *)a3 andActionIdentifier:(NSString *)a4 reply:(id)a5
{
  sub_1000B003C(self, (int)a2, a3, a4, a5, (uint64_t)&unk_10011DD58);
}

- (void)actionsConformingToSystemProtocols:(NSSet *)a3 logicalType:(unint64_t)a4 bundleIdentifier:(NSString *)a5 reply:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSSet *v12;
  NSString *v13;
  _TtC10LinkDaemon8Registry *v14;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject(&unk_10011DD30, 56, 7);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_100004C84((uint64_t)&unk_10012B288, (uint64_t)v11);
}

- (void)actionsConformingToSystemProtocol:(LNSystemProtocol *)a3 withParametersOfTypes:(NSDictionary *)a4 bundleIdentifier:(NSString *)a5 reply:(id)a6
{
  sub_1000ADE1C();
}

- (void)actionsForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)actionsWithFullyQualifiedIdentifiers:(NSArray *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)actionsAndSystemProtocolDefaultsForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)actionIdentifiersForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)bundlesWithReply:(id)a3
{
  sub_1000B3024(self, (int)a2, a3, (uint64_t)&unk_10011DC40);
}

- (void)bundleRegistrationsWithReply:(id)a3
{
  sub_1000B3024(self, (int)a2, a3, (uint64_t)&unk_10011DC18);
}

- (void)entitiesWithReply:(id)a3
{
  sub_1000B3024(self, (int)a2, a3, (uint64_t)&unk_10011DBF0);
}

- (void)entitiesForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)entityIdentifiersForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)enumsWithReply:(id)a3
{
  sub_1000B3024(self, (int)a2, a3, (uint64_t)&unk_10011DB78);
}

- (void)enumsForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)examplePhrasesForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)queriesWithReply:(id)a3
{
  sub_1000B3024(self, (int)a2, a3, (uint64_t)&unk_10011DB00);
}

- (void)queriesForBundleIdentifier:(NSString *)a3 ofType:(NSString *)a4 reply:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  NSString *v11;
  _TtC10LinkDaemon8Registry *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject(&unk_10011DAD8, 48, 7);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_100004C84((uint64_t)&unk_10012B060, (uint64_t)v9);
}

- (void)metadataVersionForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)actionForBundleIdentifier:(NSString *)a3 appShortcutIdentifier:(NSString *)a4 parameterIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  sub_1000ADE1C();
}

- (void)actionForBundleIdentifier:(NSString *)a3 basePhraseTemplate:(NSString *)a4 completionHandler:(id)a5
{
  sub_1000B003C(self, (int)a2, a3, a4, a5, (uint64_t)&unk_10011DA48);
}

- (void)actionForBundleIdentifier:(NSString *)a3 basePhraseTemplate:(NSString *)a4 parameterIdentifier:(NSUUID *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  NSString *v12;
  NSString *v13;
  NSUUID *v14;
  _TtC10LinkDaemon8Registry *v15;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject(&unk_10011DA08, 56, 7);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_100004C84((uint64_t)&unk_10012AFD0, (uint64_t)v11);
}

- (void)actionForBundleIdentifier:(NSString *)a3 basePhraseTemplate:(NSString *)a4 actionIdentifier:(NSString *)a5 parameterIdentifier:(NSUUID *)a6 completionHandler:(id)a7
{
  void *v12;
  _QWORD *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSUUID *v17;
  _TtC10LinkDaemon8Registry *v18;

  v12 = _Block_copy(a7);
  v13 = (_QWORD *)swift_allocObject(&unk_10011D9C8, 64, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = self;
  sub_100004C84((uint64_t)&unk_10012AF98, (uint64_t)v13);
}

- (void)autoShortcutsForBundleIdentifier:(NSString *)a3 localeIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  sub_1000B003C(self, (int)a2, a3, a4, a5, (uint64_t)&unk_10011D9A0);
}

- (void)autoShortcutsForLocaleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)propertiesForIdentifiers:(NSArray *)a3 completionHandler:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)relevantIntentsForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

- (void)relevantIntentsWithReply:(id)a3
{
  sub_1000B3024(self, (int)a2, a3, (uint64_t)&unk_10011D900);
}

- (void)registerBundleWithIdentifier:(NSString *)a3 force:(BOOL)a4 reply:(id)a5
{
  void *v8;
  uint64_t v9;
  NSString *v10;
  _TtC10LinkDaemon8Registry *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10011D8D8, 48, 7);
  *(_QWORD *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;
  sub_100004C84((uint64_t)&unk_10012AE78, v9);
}

- (void)resetWithReply:(id)a3
{
  sub_1000B3024(self, (int)a2, a3, (uint64_t)&unk_10011D8B0);
}

- (void)scanBundlesWithReply:(id)a3
{
  sub_1000B3024(self, (int)a2, a3, (uint64_t)&unk_10011D888);
}

- (void)unregisterBundleWithIdentifier:(NSString *)a3 reply:(id)a4
{
  sub_1000AC52C((int)self, (int)a2, (int)a3, a4);
}

@end
