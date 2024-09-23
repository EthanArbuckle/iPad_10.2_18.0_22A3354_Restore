@implementation CRLSpotlightManager

- (_TtC8Freeform19CRLSpotlightManager)init
{
  _TtC8Freeform19CRLSpotlightManager *result;

  swift_defaultActor_initialize(self, a2);
  result = (_TtC8Freeform19CRLSpotlightManager *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSpotlightManager", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10128C2B8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  swift_retain(self);
  sub_100978A84(v8, (uint64_t)sub_100565828, v7);

  swift_release(self);
  swift_release(v7);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  id v10;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  _Block_copy(v8);
  v10 = a3;
  swift_retain(self);
  sub_10097ABB8(v9, (uint64_t *)self, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release(self);
  swift_bridgeObjectRelease();
}

@end
