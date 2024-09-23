@implementation CuratedGuideTableViewCell

- (_TtP4Maps33CuratedGuideTableViewCellDelegate_)delegate
{
  return (_TtP4Maps33CuratedGuideTableViewCellDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_delegate, a3);
}

+ (NSString)reuseIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC4Maps21CuratedGuideViewModel)viewModel
{
  return (_TtC4Maps21CuratedGuideViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                     + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel));
}

- (void)setViewModel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel) = (Class)a3;
  v3 = a3;

}

- (_TtC4Maps25CuratedGuideTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC4Maps25CuratedGuideTableViewCell *)sub_1000AFD88(a3, (uint64_t)a4, v6);
}

- (_TtC4Maps25CuratedGuideTableViewCell)initWithCoder:(id)a3
{
  id v5;
  _TtC4Maps25CuratedGuideTableViewCell *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_delegate, 0);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel) = 0;
  v5 = a3;

  result = (_TtC4Maps25CuratedGuideTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/CuratedGuideTableViewCell.swift", 36, 2, 30, 0);
  __break(1u);
  return result;
}

- (_TtC4Maps25CuratedGuideTableViewCell)initWithReuseIdentifier:(id)a3
{
  _TtC4Maps25CuratedGuideTableViewCell *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_delegate, 0);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel) = 0;

  result = (_TtC4Maps25CuratedGuideTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002FLL, 0x8000000100E46CF0, "Maps/CuratedGuideTableViewCell.swift", 36, 2, 34, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CuratedGuideTableViewCell();
  v2 = (char *)v4.receiver;
  -[CuratedGuideTableViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = *(void **)&v2[OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel];
  *(_QWORD *)&v2[OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel] = 0;

  swift_unknownObjectWeakAssign(&v2[OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_delegate], 0);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v10;
  _TtC4Maps25CuratedGuideTableViewCell *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v10 = (void *)objc_opt_self(CATransaction);
  v11 = self;
  objc_msgSend(v10, "setFrameStallSkipRequest:", 1);
  v20.receiver = v11;
  v20.super_class = (Class)type metadata accessor for CuratedGuideTableViewCell();
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  -[CuratedGuideTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v20, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v12, v13);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)configureWith:(id)a3 delegate:(id)a4 imageLoader:(id)a5
{
  id v8;
  id v9;
  _TtC4Maps25CuratedGuideTableViewCell *v10;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = a5;
  v10 = self;
  sub_1000B01A0(v8, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC4Maps25CuratedGuideTableViewCell *v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_1000B02D8();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void).cxx_destruct
{
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel));
}

@end
