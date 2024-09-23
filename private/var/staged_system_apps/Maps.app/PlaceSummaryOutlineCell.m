@implementation PlaceSummaryOutlineCell

- (_TtC4Maps28PlaceSummaryOutlineCellModel)viewModel
{
  return (_TtC4Maps28PlaceSummaryOutlineCellModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super
                                                                                            + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_viewModel));
}

- (void)setViewModel:(id)a3
{
  void *v4;
  _TtC4Maps23PlaceSummaryOutlineCell *v5;
  id v6;

  v4 = *(void **)((char *)&self->super.super + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_viewModel);
  *(MapsThemeCollectionViewOutlineCell *)((char *)&self->super.super
                                        + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_viewModel) = (MapsThemeCollectionViewOutlineCell)a3;
  v6 = a3;
  v5 = self;

  sub_1000D2674();
}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaceSummaryOutlineCell();
  v2 = (char *)v4.receiver;
  -[PlaceSummaryOutlineCell prepareForReuse](&v4, "prepareForReuse");
  v3 = *(void **)&v2[OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_curatedGuideViewModel];
  *(_QWORD *)&v2[OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_curatedGuideViewModel] = 0;

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC4Maps23PlaceSummaryOutlineCell *v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_1000D2904();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (_TtC4Maps23PlaceSummaryOutlineCell)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps23PlaceSummaryOutlineCell *)sub_1000D35F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps23PlaceSummaryOutlineCell)initWithCoder:(id)a3
{
  id v4;
  _TtC4Maps23PlaceSummaryOutlineCell *result;

  *(MapsThemeCollectionViewOutlineCell *)((char *)&self->super.super
                                        + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_curatedGuideViewModel) = 0;
  *(MapsThemeCollectionViewOutlineCell *)((char *)&self->super.super
                                        + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_viewModel) = 0;
  v4 = a3;

  result = (_TtC4Maps23PlaceSummaryOutlineCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/PlaceSummaryOutlineCell.swift", 34, 2, 193, 0);
  __break(1u);
  return result;
}

- (BOOL)isHovering
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceSummaryOutlineCell();
  return -[SidebarOutlineCell isHovering](&v3, "isHovering");
}

- (void)setHovering:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC4Maps23PlaceSummaryOutlineCell *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for PlaceSummaryOutlineCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[SidebarOutlineCell isHovering](&v9, "isHovering");
  v8.receiver = v6;
  v8.super_class = v5;
  -[SidebarOutlineCell setHovering:](&v8, "setHovering:", v3);
  sub_1000D383C(v7);

}

- (void)updateDisclosureIndicator
{
  _TtC4Maps23PlaceSummaryOutlineCell *v2;

  v2 = self;
  sub_1000D38F8();

}

- (void).cxx_destruct
{

}

@end
