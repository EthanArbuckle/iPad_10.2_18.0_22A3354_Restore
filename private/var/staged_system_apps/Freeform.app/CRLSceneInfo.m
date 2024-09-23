@implementation CRLSceneInfo

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform12CRLSceneInfo *v5;
  uint64_t v6;
  _TtC8Freeform12CRLSceneInfo *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_100668DA4((uint64_t)v10);

  sub_1004D28EC((uint64_t)v10);
  return v8 & 1;
}

- (int64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  _TtC8Freeform12CRLSceneInfo *v5;
  Swift::Int v6;
  _OWORD v8[4];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  Hasher.init()(v8);
  v3 = type metadata accessor for UUID(0);
  v4 = sub_1004B7878((unint64_t *)&qword_1013DE630, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v5 = self;
  dispatch thunk of Hashable.hash(into:)(v8, v3, v4);
  v12 = v8[2];
  v13 = v8[3];
  v14 = v9;
  v10 = v8[0];
  v11 = v8[1];
  v6 = Hasher.finalize()();

  return v6;
}

- (BOOL)isSupported
{
  _TtC8Freeform12CRLSceneInfo *v3;
  char v4;
  _QWORD v6[5];

  v6[3] = &type metadata for CRLFeatureFlags;
  v6[4] = sub_1004DB6DC();
  LOBYTE(v6[0]) = 16;
  v3 = self;
  v4 = isFeatureEnabled(_:)(v6);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v6);

  return v4 & 1;
}

- (CRLCanvasInfoGeometry)geometry
{
  return (CRLCanvasInfoGeometry *)objc_msgSend(objc_allocWithZone((Class)CRLCanvasInfoGeometry), "initWithPosition:size:", *(double *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect), *(double *)&self->name[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect], *(double *)&self->name[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect+ 8], *(double *)&self->savedUnscaledRect[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect]);
}

- (BOOL)isSelectable
{
  return 0;
}

- (Class)layoutClass
{
  unint64_t v2;
  uint64_t v3;

  v2 = sub_100669974();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLSceneRep();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (CRLCanvasElementInfo)parentInfo
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC8Freeform12CRLSceneInfo *v5;
  void *v6;
  _TtC8Freeform12CRLSceneInfo *v8;

  KeyPath = swift_getKeyPath(&unk_100F01990);
  v8 = self;
  v4 = sub_1004B7878(&qword_1013E9E70, type metadata accessor for CRLSceneInfo, (uint64_t)&unk_100F01948);
  v5 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v8, KeyPath, v4);
  swift_release(KeyPath);
  v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC8Freeform12CRLSceneInfo__parentInfo);
  swift_unknownObjectRetain(v6);

  return (CRLCanvasElementInfo *)v6;
}

- (void)setParentInfo:(id)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  _TtC8Freeform12CRLSceneInfo *v7;
  _QWORD v8[5];
  _TtC8Freeform12CRLSceneInfo *v9;

  KeyPath = swift_getKeyPath(&unk_100F01990);
  v8[2] = self;
  v8[3] = a3;
  v9 = self;
  v6 = sub_1004B7878(&qword_1013E9E70, type metadata accessor for CRLSceneInfo, (uint64_t)&unk_100F01948);
  swift_unknownObjectRetain(a3);
  v7 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_100669920, v8, (char *)&type metadata for () + 8, v6);

  swift_release(KeyPath);
  swift_unknownObjectRelease(a3);
}

- (Class)editorClass
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC8Freeform12CRLSceneInfo *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC8Freeform12CRLSceneInfo *v9;

  KeyPath = swift_getKeyPath(&unk_100F01968);
  v9 = self;
  v4 = sub_1004B7878(&qword_1013E9E70, type metadata accessor for CRLSceneInfo, (uint64_t)&unk_100F01948);
  v5 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v9, KeyPath, v4);
  swift_release(KeyPath);
  v6 = *(uint64_t *)((char *)&v5->super.isa + OBJC_IVAR____TtC8Freeform12CRLSceneInfo__editorClass);

  if (v6)
    return (Class)swift_getObjCClassFromMetadata(v6, v7);
  else
    return 0;
}

- (void)setEditorClass:(Class)a3
{
  uint64_t ObjCClassMetadata;
  uint64_t KeyPath;
  uint64_t v6;
  _TtC8Freeform12CRLSceneInfo *v7;
  _QWORD v8[5];
  _TtC8Freeform12CRLSceneInfo *v9;

  if (a3)
    ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  else
    ObjCClassMetadata = 0;
  KeyPath = swift_getKeyPath(&unk_100F01968);
  __chkstk_darwin(KeyPath);
  v8[2] = self;
  v8[3] = ObjCClassMetadata;
  v9 = self;
  v6 = sub_1004B7878(&qword_1013E9E70, type metadata accessor for CRLSceneInfo, (uint64_t)&unk_100F01948);
  v7 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_1006699B0, v8, (char *)&type metadata for () + 8, v6);

  swift_release(KeyPath);
}

- (_TtC8Freeform12CRLSceneInfo)init
{
  _TtC8Freeform12CRLSceneInfo *result;

  result = (_TtC8Freeform12CRLSceneInfo *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSceneInfo", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLSceneInfo_sceneID;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->name[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_name]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLSceneInfo__parentInfo));
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLSceneInfo___observationRegistrar;
  v6 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
