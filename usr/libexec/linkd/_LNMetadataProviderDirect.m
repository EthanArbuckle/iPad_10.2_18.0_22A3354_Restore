@implementation _LNMetadataProviderDirect

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100007884(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actions(forBundleIdentifier:), &qword_10012A710, LNActionMetadata_ptr);
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100007884(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.enums(forBundleIdentifier:), (unint64_t *)&qword_100129F40, LNEnumMetadata_ptr);
}

- (_TtC10LinkDaemon25_LNMetadataProviderDirect)initWithConnection:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  return (_TtC10LinkDaemon25_LNMetadataProviderDirect *)_LNMetadataProviderDirect.init(connection:options:)(a3, a4);
}

- (id)actionsWithError:(id *)a3
{
  return sub_10008A9BC(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.actions(), (uint64_t *)&unk_10012A700);
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v15;
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
  _LNMetadataProviderDirect.actionsConforming(to:logicalType:bundleIdentifier:)(v12, a4, v13, (uint64_t)a5);
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
  uint64_t v5;
  uint64_t v6;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v7;
  id v8;
  Class isa;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = self;
  v8 = _LNMetadataProviderDirect.actionsAndSystemProtocolDefaults(forBundleIdentifier:)();

  swift_bridgeObjectRelease(v6);
  sub_10000795C(0, &qword_10012B200, LNBundleActionsMetadata_ptr);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10008AB0C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actionIdentifiers(forBundleIdentifier:));
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v13;
  void *v14;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = self;
  v14 = (void *)_LNMetadataProviderDirect.action(forBundleIdentifier:andActionIdentifier:)(v7, v9, v10, v12);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  return v14;
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v13;
  uint64_t v14;
  Class isa;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = self;
  v14 = _LNMetadataProviderDirect.actions(forBundleIdentifier:andActionIdentifier:)(v7, v9, v10, v12);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  sub_10000795C(0, &qword_10012A710, LNActionMetadata_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return isa;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v15;
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
  _LNMetadataProviderDirect.actionsConforming(to:withParametersOfTypes:bundleIdentifier:)((uint64_t)v15, v11, v12, (uint64_t)a5);
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
  uint64_t v6;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v7;
  uint64_t v8;
  uint64_t v9;
  Class isa;

  sub_10000795C(0, (unint64_t *)&unk_100129F70, LNFullyQualifiedActionIdentifier_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = self;
  _LNMetadataProviderDirect.actions(withFullyQualifiedIdentifiers:)();
  v9 = v8;
  swift_bridgeObjectRelease(v6);

  sub_10001BE7C((uint64_t *)&unk_10012A700);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (id)bundlesWithError:(id *)a3
{
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;

  v3 = self;
  _LNMetadataProviderDirect.bundles()();
  v5 = v4;

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;

  v3 = self;
  _LNMetadataProviderDirect.bundleRegistrations()();
  v5 = v4;

  sub_10000795C(0, (unint64_t *)&unk_100129F60, LNRegisteredBundleMetadata_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (id)queriesWithError:(id *)a3
{
  return sub_10008A9BC(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.queries(), (uint64_t *)&unk_100129F30);
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v12;
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
  _LNMetadataProviderDirect.queries(forBundleIdentifier:ofType:)(v7, v9, v10, (uint64_t)a4);
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
  return sub_10008A9BC(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.enums(), &qword_10012B110);
}

- (id)entitiesWithError:(id *)a3
{
  return sub_10008A9BC(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.entities(), &qword_10012B180);
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100007884(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entities(forBundleIdentifier:), (unint64_t *)&qword_100129F50, LNEntityMetadata_ptr);
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10008AB0C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entityIdentifiers(forBundleIdentifier:));
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v9;
  id v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = self;
  v10 = _LNMetadataProviderDirect.metadataVersion(forBundleIdentifier:error:)(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
  return (int64_t)v10;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v9;
  Swift::String v10;
  void *object;
  uint64_t v12;
  void *v13;
  id v14;
  NSString v15;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  object = _LNMetadataProviderDirect.appShortcutsProviderMangledTypeName(forBundleIdentifier:)(v10)._object;
  swift_bridgeObjectRelease(v8);

  if (v12)
  {
    if (a4)
    {
      v13 = (void *)_convertErrorToNSError(_:)(v12);
      swift_errorRelease(v12);
      v14 = v13;
      v15 = 0;
      *a4 = v13;
    }
    else
    {
      swift_errorRelease(v12);
      v15 = 0;
    }
  }
  else
  {
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
  }
  return v15;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_100007884(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.examplePhrases(forBundleIdentifier:), &qword_10012B0C0, LNExamplePhraseDescription_ptr);
}

- (_TtC10LinkDaemon25_LNMetadataProviderDirect)init
{
  _LNMetadataProviderDirect.init()();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10LinkDaemon25_LNMetadataProviderDirect_connection));
}

- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v15;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  _Block_copy(v8);
  v15 = self;
  sub_10008B294(v9, v11, v12, v14, v15, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v10;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_10008B764(v7, v9, v10, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4
{
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v5;
  Class isa;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = self;
  _LNMetadataProviderDirect.autoShortcuts(forLocaleIdentifier:)();
  swift_bridgeObjectRelease();

  sub_10001BE7C(&qword_10012AF50);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4
{
  _TtC10LinkDaemon25_LNMetadataProviderDirect *v6;
  Class isa;

  type metadata accessor for UUID(0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = self;
  _LNMetadataProviderDirect.properties(forIdentifiers:)();
  swift_bridgeObjectRelease();

  sub_10000795C(0, &qword_1001284E0, LNProperty_ptr);
  sub_100025AFC(&qword_1001289E0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

@end
