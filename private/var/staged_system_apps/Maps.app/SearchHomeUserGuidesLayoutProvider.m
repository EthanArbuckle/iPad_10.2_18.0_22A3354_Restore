@implementation SearchHomeUserGuidesLayoutProvider

- (id)isDeletable
{
  return sub_1000714D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable, (uint64_t)sub_100071274, (uint64_t)&unk_10119EAC0);
}

- (void)setIsDeletable:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10119EAA8, 24, 7);
    v4[2] = v5;
    v6 = sub_10007261C;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable);
  v8 = *(_QWORD *)&self->isDeletable[OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_10000BF74(v9, v8);
}

- (id)shareHandler
{
  return sub_1000714D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler, (uint64_t)sub_1000713A8, (uint64_t)&unk_10119EA70);
}

- (void)setShareHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void (*v6)();
  void (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10119EA58, 24, 7);
    v4[2] = v5;
    v6 = sub_100072620;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)())((char *)self + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler);
  v8 = *(_QWORD *)&self->isDeletable[OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler];
  *v7 = v6;
  v7[1] = (void (*)())v4;
  sub_10000BF74(v9, v8);
}

- (id)isShareable
{
  return sub_1000714D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable, (uint64_t)sub_100071274, (uint64_t)&unk_10119EA20);
}

- (void)setIsShareable:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10119EA08, 24, 7);
    v4[2] = v5;
    v6 = sub_10007261C;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable);
  v8 = *(_QWORD *)&self->isDeletable[OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_10000BF74(v9, v8);
}

- (_TtC4Maps34SearchHomeUserGuidesLayoutProvider)init
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable);
  v6 = (objc_class *)type metadata accessor for SearchHomeUserGuidesLayoutProvider();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[SearchHomeUserGuidesLayoutProvider init](&v8, "init");
}

- (void).cxx_destruct
{
  sub_10000BF74(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable), *(_QWORD *)&self->isDeletable[OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable]);
  sub_10000BF74(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler), *(_QWORD *)&self->isDeletable[OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler]);
  sub_10000BF74(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable), *(_QWORD *)&self->isDeletable[OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable]);
}

- (id)cellClasses
{
  uint64_t v2;
  uint64_t v3;
  Class isa;

  v2 = sub_100008B04((uint64_t *)&unk_101496370);
  v3 = swift_allocObject(v2, 40, 7);
  *(_OWORD *)(v3 + 16) = xmmword_100E22F40;
  *(_QWORD *)(v3 + 32) = sub_10000E4BC(0, &qword_101492B48, off_1011960F0);
  sub_100008B04((uint64_t *)&unk_101496380);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (id)cellReuseIdentifier
{
  _TtC4Maps34SearchHomeUserGuidesLayoutProvider *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  v3 = -[SearchHomeUserGuidesLayoutProvider description](v2, "description");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

- (int64_t)type
{
  return 7;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC4Maps34SearchHomeUserGuidesLayoutProvider *v14;
  id v15;
  _QWORD v17[4];

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = a4;
  swift_unknownObjectRetain(a5);
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v17);
  swift_unknownObjectRelease(a5);
  v15 = sub_100071C58((uint64_t)v12, v13, (uint64_t)v17);

  sub_10000BEAC(v17);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  void *v12;
  uint64_t v13;
  id v14;
  _TtC4Maps34SearchHomeUserGuidesLayoutProvider *v15;
  void *v16;

  v12 = _Block_copy(a6);
  if (v12)
  {
    v13 = swift_allocObject(&unk_10119E8F0, 24, 7);
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_10000BF64;
  }
  else
  {
    v13 = 0;
  }
  swift_unknownObjectRetain(a3);
  v14 = a8;
  v15 = self;
  v16 = sub_100072040((uint64_t)a3, (uint64_t)v12, v13, a4);
  sub_10000BF74((uint64_t)v12, v13);
  swift_unknownObjectRelease(a3);

  return v16;
}

@end
