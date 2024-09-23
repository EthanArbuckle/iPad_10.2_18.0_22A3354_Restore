@implementation CRLMiniFormatterStateManager

- (void)teardown
{
  void *v3;
  _TtC8Freeform28CRLMiniFormatterStateManager *v4;
  id v5;
  id v6;
  id v7;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6 = objc_msgSend(v3, "defaultCenter");
  v7 = v6;
  if (qword_1013DD908 != -1)
  {
    swift_once(&qword_1013DD908, sub_100A16088);
    v6 = v7;
  }
  objc_msgSend(v6, "removeObserver:name:object:", v4, qword_101480600, 0);

}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform28CRLMiniFormatterStateManager *v9;
  _QWORD v10[4];

  v7 = type metadata accessor for CRLChangeRecord();
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  swift_unknownObjectRetain(a4);
  v9 = self;
  _bridgeAnyObjectToAny(_:)(v10, a4);
  swift_unknownObjectRelease(a4);
  CRLMiniFormatterStateManager.processChanges(_:forChangeSource:)(v8, (uint64_t)v10);

  swift_bridgeObjectRelease(v8);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v10);
}

- (void)selectionPathDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform28CRLMiniFormatterStateManager *v5;

  v4 = a3;
  v5 = self;
  sub_1005D33E4(v4);

}

- (_TtC8Freeform28CRLMiniFormatterStateManager)init
{
  _TtC8Freeform28CRLMiniFormatterStateManager *result;

  result = (_TtC8Freeform28CRLMiniFormatterStateManager *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLMiniFormatterStateManager", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLMiniFormatterStateManager_editorController));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform28CRLMiniFormatterStateManager_canvasLayerHosting));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLMiniFormatterStateManager_observedObjects));
}

@end
