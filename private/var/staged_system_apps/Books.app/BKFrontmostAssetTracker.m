@implementation BKFrontmostAssetTracker

- (BOOL)isFrontmost
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_state) & *((_BYTE *)&self->super.isa
                                                                                    + OBJC_IVAR___BKFrontmostAssetTracker_state
                                                                                    + 1) & 1;
}

- (id)onFrontmostChanged
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD aBlock[5];
  uint64_t v8;
  _BYTE v9[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_onFrontmostChanged);
  swift_beginAccess((char *)self + OBJC_IVAR___BKFrontmostAssetTracker_onFrontmostChanged, v9, 0, 0);
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  v8 = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10004DCB4;
  aBlock[3] = &unk_1008F3428;
  v4 = _Block_copy(aBlock);
  v5 = v8;
  swift_retain(v3);
  swift_release(v5);
  return v4;
}

- (void)setOnFrontmostChanged:(id)a3
{
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject(&unk_1008F3410, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_100202970;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___BKFrontmostAssetTracker_onFrontmostChanged);
  swift_beginAccess(v6, v9, 1, 0);
  v7 = *v6;
  v8 = v6[1];
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10002AD00(v7, v8);
}

- (BKFrontmostAssetTracker)initWithAssetID:(id)a3 window:(id)a4 onFrontmostChanged:(id)a5
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;

  v7 = _Block_copy(a5);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  if (v7)
  {
    v11 = swift_allocObject(&unk_1008F33E8, 24, 7);
    *(_QWORD *)(v11 + 16) = v7;
    v7 = sub_1002028E0;
  }
  else
  {
    v11 = 0;
  }
  v12 = a4;
  return (BKFrontmostAssetTracker *)FrontmostAssetTracker.init(assetID:window:onFrontmostChanged:)(v8, v10, a4, (uint64_t)v7, v11);
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  BKFrontmostAssetTracker *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_frontmostTracker);
  v5 = self;
  if (v4)
  {
    v6 = v4;
    FrontmostWindowTracker.onFrontmostChanged.setter(0, 0);

  }
  v7.receiver = self;
  v7.super_class = ObjectType;
  -[BKFrontmostAssetTracker dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->assetID[OBJC_IVAR___BKFrontmostAssetTracker_assetID]);

  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_onFrontmostChanged), *(_QWORD *)&self->assetID[OBJC_IVAR___BKFrontmostAssetTracker_onFrontmostChanged]);
}

- (UIWindow)window
{
  void *v2;
  BKFrontmostAssetTracker *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFrontmostAssetTracker_frontmostTracker);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    v2 = (void *)FrontmostWindowTracker.window.getter();

  }
  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5;
  BKFrontmostAssetTracker *v6;

  v5 = a3;
  v6 = self;
  FrontmostAssetTracker.window.setter(a3);

}

- (BKFrontmostAssetTracker)init
{
  BKFrontmostAssetTracker *result;

  result = (BKFrontmostAssetTracker *)_swift_stdlib_reportUnimplementedInitializer("Books.FrontmostAssetTracker", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
