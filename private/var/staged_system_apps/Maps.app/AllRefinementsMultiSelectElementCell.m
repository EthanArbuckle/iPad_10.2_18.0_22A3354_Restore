@implementation AllRefinementsMultiSelectElementCell

+ (NSString)reuseIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v2 = sub_100008B04((uint64_t *)&unk_101498B50);
  String.init<A>(describing:)(&ObjCClassMetadata, v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)setDisplayName:(id)a3 isSelected:(BOOL)a4 labelWidth:(double)a5 maxWidth:(double)a6 allowSelection:(id)a7 tapHandler:(id)a8
{
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _TtC4Maps36AllRefinementsMultiSelectElementCell *v21;

  v14 = _Block_copy(a7);
  v15 = _Block_copy(a8);
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = v17;
  v19 = swift_allocObject(&unk_1011A0700, 24, 7);
  *(_QWORD *)(v19 + 16) = v14;
  if (v15)
  {
    v20 = swift_allocObject(&unk_1011A0728, 24, 7);
    *(_QWORD *)(v20 + 16) = v15;
    v15 = sub_1000268B4;
  }
  else
  {
    v20 = 0;
  }
  v21 = self;
  sub_1000ABD7C(v16, v18, a4, (uint64_t)sub_1000AC644, v19, (uint64_t)v15, v20, a5, a6);
  sub_10000BF74((uint64_t)v15, v20);

  swift_bridgeObjectRelease(v18);
  swift_release();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC4Maps36AllRefinementsMultiSelectElementCell *v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_1000AC108();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtC4Maps36AllRefinementsMultiSelectElementCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps36AllRefinementsMultiSelectElementCell_viewModel) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AllRefinementsMultiSelectElementCell();
  return -[AllRefinementsMultiSelectElementCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC4Maps36AllRefinementsMultiSelectElementCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps36AllRefinementsMultiSelectElementCell_viewModel) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AllRefinementsMultiSelectElementCell();
  return -[AllRefinementsMultiSelectElementCell initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC4Maps36AllRefinementsMultiSelectElementCell_viewModel));
}

@end
