@implementation RDXPCSuggestedAttributesPerformer

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC7remindd33RDXPCSuggestedAttributesPerformer *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = qword_100836EF8;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_100836EF8, sub_1001B7834);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_10001AAA8(v6, (uint64_t)qword_10083F090);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter(v8);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Deallocating SuggestedAttributesPerformer", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11.receiver = v5;
  v11.super_class = ObjectType;
  -[RDXPCSuggestedAttributesPerformer dealloc](&v11, "dealloc");
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)&self->queue[OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_configurationSource];
  v4 = *(_QWORD *)&self->configurationSource[OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_configurationSource
                                           + 8];
  v5 = *(_QWORD *)&self->configurationSource[OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_configurationSource
                                           + 24];
  swift_release(*(_QWORD *)&self->configurationSource[OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_configurationSource
                                                    + 40]);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease();

  sub_10000882C((uint64_t)self + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_cachedEditingSessionID, (uint64_t *)&unk_100839C80);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_storePerformer));
  sub_10000882C((uint64_t)self + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_cachedMLModels, &qword_10083F1D0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_contactStore));
}

- (void)preWarmModels
{
  _TtC7remindd33RDXPCSuggestedAttributesPerformer *v2;

  v2 = self;
  sub_1001B8348();

}

- (void)performSwiftInvocation:(id)a3 withParametersData:(id)a4 storages:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _TtC7remindd33RDXPCSuggestedAttributesPerformer *v21;

  v10 = _Block_copy(a6);
  v11 = a3;
  v12 = a4;
  v21 = self;
  v13 = a5;
  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;

  if (v13)
  {
    v17 = sub_1000151B0(0, (unint64_t *)&qword_10083A1E0, REMObjectID_ptr);
    v18 = sub_1000E51DC((unint64_t *)&qword_10083A1F0, (unint64_t *)&qword_10083A1E0, REMObjectID_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
    v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v13, v17, (char *)&type metadata for Any + 8, v18);

  }
  else
  {
    v19 = 0;
  }
  v20 = *(uint64_t *)((char *)&v21->super.isa + OBJC_IVAR____TtC7remindd33RDXPCSuggestedAttributesPerformer_storePerformer);
  _Block_copy(v10);
  sub_1004CA494(v11, v14, v16, v19, (uint64_t)v21, v20, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);
  swift_bridgeObjectRelease();
  sub_1000A71C8(v14, v16);

}

- (_TtC7remindd33RDXPCSuggestedAttributesPerformer)init
{
  _TtC7remindd33RDXPCSuggestedAttributesPerformer *result;

  result = (_TtC7remindd33RDXPCSuggestedAttributesPerformer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDXPCSuggestedAttributesPerformer", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
