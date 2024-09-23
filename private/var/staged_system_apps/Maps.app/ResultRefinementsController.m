@implementation ResultRefinementsController

- (_TtP4Maps35ResultRefinementsControllerDelegate_)delegate
{
  return (_TtP4Maps35ResultRefinementsControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps27ResultRefinementsController_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps27ResultRefinementsController_delegate, a3);
}

- (void)refinementBarButtonTappedWithRefinementID:(id)a3 submenuElementID:(id)a4 viewModel:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  char *v16;
  __n128 v17;
  uint64_t v18;
  id v19;
  _TtC4Maps27ResultRefinementsController *v20;
  uint64_t v21;

  v9 = sub_100008B04((uint64_t *)&unk_10149AA90);
  __chkstk_darwin(v9);
  v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3, v14);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4, v17);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v18, 1, v12);
  v19 = a5;
  v20 = self;
  sub_1000A4634((uint64_t)v16, v11, (uint64_t)v19);

  sub_1000A5008((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

- (_TtC4Maps27ResultRefinementsController)init
{
  objc_super v4;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps27ResultRefinementsController_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ResultRefinementsController();
  return -[ResultRefinementsController init](&v4, "init");
}

- (void).cxx_destruct
{
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps27ResultRefinementsController_delegate);
}

@end
