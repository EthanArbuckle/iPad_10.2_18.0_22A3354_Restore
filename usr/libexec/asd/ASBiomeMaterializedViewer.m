@implementation ASBiomeMaterializedViewer

- (id)runWithQuery:(id)a3 inputColNames:(id)a4 inputColTypes:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC3asd25ASBiomeMaterializedViewer *v14;
  uint64_t v15;
  Class isa;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for Int);
  v14 = self;
  v15 = ASBiomeMaterializedViewer.run(query:inputColNames:inputColTypes:)(v9, v11);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);

  sub_100032C48(&qword_100503C10);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v15);
  return isa;
}

- (_TtC3asd25ASBiomeMaterializedViewer)init
{
  return (_TtC3asd25ASBiomeMaterializedViewer *)ASBackgroundActivityManager.init()();
}

@end
