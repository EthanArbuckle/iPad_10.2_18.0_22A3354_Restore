@implementation MetadataStore

- (_TtC10LinkDaemon13MetadataStore)init
{
  sub_100068734();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1000131E0((uint64_t)self + OBJC_IVAR____TtC10LinkDaemon13MetadataStore_URL, &qword_100128740);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10LinkDaemon13MetadataStore_provider));
}

- (id)actionsWithError:(id *)a3
{
  return sub_100069710(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_actionsWithError_, (uint64_t *)&unk_10012A700);
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _TtC10LinkDaemon13MetadataStore *v13;
  uint64_t v14;
  uint64_t v15;
  Class isa;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = self;
  sub_1000688E8(v7, v9, v10, v12);
  v15 = v14;
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  sub_10000795C(0, &qword_10012A710, LNActionMetadata_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  return isa;
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _TtC10LinkDaemon13MetadataStore *v15;
  uint64_t v16;
  uint64_t v17;
  Class isa;

  v10 = sub_10000795C(0, (unint64_t *)&qword_1001286C0, LNSystemProtocol_ptr);
  v11 = sub_10004FE50();
  v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v10, v11);
  if (a5)
  {
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v14;
  }
  else
  {
    v13 = 0;
  }
  v15 = self;
  sub_100063B7C(v12, a4, v13, a5);
  v17 = v16;
  swift_bridgeObjectRelease(v12);

  swift_bridgeObjectRelease(a5);
  sub_10001BE7C((uint64_t *)&unk_10012A700);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  return isa;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10LinkDaemon13MetadataStore *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;

  if (a3)
  {
    v5 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = self;
  sub_100068C1C(v5, v7, v9, v10, v11, v12, v13, v14);
  v16 = v15;

  swift_bridgeObjectRelease(v7);
  sub_10000795C(0, &qword_10012B200, LNBundleActionsMetadata_ptr);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  return isa;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006A078(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_actionsForBundleIdentifier_error_, &qword_10012A710, LNActionMetadata_ptr);
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100069CD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_actionIdentifiersForBundleIdentifier_error_);
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _TtC10LinkDaemon13MetadataStore *v13;
  void *v14;
  void *v15;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = self;
  sub_10006143C(v7, v9, v10, v12);
  v15 = v14;
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  return v15;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _TtC10LinkDaemon13MetadataStore *v15;
  uint64_t v16;
  uint64_t v17;
  Class isa;

  v10 = sub_10000795C(0, (unint64_t *)&unk_100129F80, LNValueType_ptr);
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v10, &protocol witness table for String);
  if (a5)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = a3;
  v15 = self;
  sub_100068F58((uint64_t)v14, v11, v12, a5);
  v17 = v16;
  swift_bridgeObjectRelease(v11);

  swift_bridgeObjectRelease(a5);
  sub_10001BE7C((uint64_t *)&unk_10012A700);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  return isa;
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
{
  void *v6;
  _TtC10LinkDaemon13MetadataStore *v7;
  uint64_t v8;
  uint64_t v9;
  Class isa;

  sub_10000795C(0, (unint64_t *)&unk_100129F70, LNFullyQualifiedActionIdentifier_ptr);
  v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = self;
  sub_1000691E8(v6);
  v9 = v8;
  swift_bridgeObjectRelease(v6);

  sub_10001BE7C((uint64_t *)&unk_10012A700);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (id)bundlesWithError:(id *)a3
{
  _TtC10LinkDaemon13MetadataStore *v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;

  v3 = self;
  sub_1000693D4();
  v5 = v4;

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  _TtC10LinkDaemon13MetadataStore *v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;

  v3 = self;
  sub_100069530();
  v5 = v4;

  sub_10000795C(0, (unint64_t *)&unk_100129F60, LNRegisteredBundleMetadata_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (id)queriesWithError:(id *)a3
{
  return sub_100069710(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_queriesWithError_, (uint64_t *)&unk_100129F30);
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _TtC10LinkDaemon13MetadataStore *v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  if (a4)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = self;
  sub_1000697C0(v7, v9, v10, a4);
  v14 = v13;
  swift_bridgeObjectRelease(v9);

  swift_bridgeObjectRelease(a4);
  sub_10000795C(0, (unint64_t *)&qword_10012A6F0, LNQueryMetadata_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return isa;
}

- (id)enumsWithError:(id *)a3
{
  return sub_100069710(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_enumsWithError_, &qword_10012B110);
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006A078(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_enumsForBundleIdentifier_error_, (unint64_t *)&qword_100129F40, LNEnumMetadata_ptr);
}

- (id)entitiesWithError:(id *)a3
{
  return sub_100069710(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_entitiesWithError_, &qword_10012B180);
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006A078(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_entitiesForBundleIdentifier_error_, (unint64_t *)&qword_100129F50, LNEntityMetadata_ptr);
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100069CD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_entityIdentifiersForBundleIdentifier_error_);
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC10LinkDaemon13MetadataStore *v9;
  id v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = self;
  v10 = sub_100069DA0(v6, v8, (uint64_t)a4);

  swift_bridgeObjectRelease(v8);
  return (int64_t)v10;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  _TtC10LinkDaemon13MetadataStore *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100069E60();
  v9 = v8;
  swift_bridgeObjectRelease(v6);

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006A078(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_examplePhrasesForBundleIdentifier_error_, &qword_10012B0C0, LNExamplePhraseDescription_ptr);
}

@end
