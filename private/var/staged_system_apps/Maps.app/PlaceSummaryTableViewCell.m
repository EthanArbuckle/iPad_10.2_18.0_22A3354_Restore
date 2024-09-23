@implementation PlaceSummaryTableViewCell

- (_TtP4Maps33PlaceSummaryTableViewCellDelegate_)delegate
{
  return (_TtP4Maps33PlaceSummaryTableViewCellDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_delegate, a3);
}

- (_TtC4Maps28PlaceSummaryAsyncDataManager)asyncDataManager
{
  return (_TtC4Maps28PlaceSummaryAsyncDataManager *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_asyncDataManager);
}

- (void)setAsyncDataManager:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_asyncDataManager, a3);
}

- (BOOL)hasActionButtons
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_hasActionButtons);
}

- (void)setHasActionButtons:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_hasActionButtons) = a3;
}

+ (NSString)reuseIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtC4Maps29PlaceSummaryViewModelTemplate)viewModel
{
  return (_TtC4Maps29PlaceSummaryViewModelTemplate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel));
}

- (void)setViewModel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel) = (Class)a3;
  v3 = a3;

}

+ (double)searchResultEstimatedHeight
{
  return 112.0;
}

+ (double)autocompleteResultEstimatedHeight
{
  return 69.0;
}

- (_TtC4Maps25PlaceSummaryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC4Maps25PlaceSummaryTableViewCell *)sub_1001F7648(a3, (uint64_t)a4, v6);
}

- (_TtC4Maps25PlaceSummaryTableViewCell)initWithCoder:(id)a3
{
  id v5;
  _TtC4Maps25PlaceSummaryTableViewCell *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_delegate, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_asyncDataManager, 0);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_hasActionButtons) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel) = 0;
  v5 = a3;

  result = (_TtC4Maps25PlaceSummaryTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/PlaceSummaryTableViewCell.swift", 36, 2, 61, 0);
  __break(1u);
  return result;
}

- (_TtC4Maps25PlaceSummaryTableViewCell)initWithReuseIdentifier:(id)a3
{
  _TtC4Maps25PlaceSummaryTableViewCell *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_delegate, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_asyncDataManager, 0);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_hasActionButtons) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel) = 0;

  result = (_TtC4Maps25PlaceSummaryTableViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002FLL, 0x8000000100E46CF0, "Maps/PlaceSummaryTableViewCell.swift", 36, 2, 65, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaceSummaryTableViewCell();
  v2 = (char *)v4.receiver;
  -[PlaceSummaryTableViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = *(void **)&v2[OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel];
  *(_QWORD *)&v2[OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel] = 0;

  swift_unknownObjectWeakAssign(&v2[OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_delegate], 0);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v10;
  _TtC4Maps25PlaceSummaryTableViewCell *v11;
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
  v20.super_class = (Class)type metadata accessor for PlaceSummaryTableViewCell();
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  -[PlaceSummaryTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v20, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v12, v13);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)setViewModel:(id)a3 delegate:(id)a4 asyncDataManager:(id)a5
{
  id v8;
  id v9;
  _TtC4Maps25PlaceSummaryTableViewCell *v10;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = a5;
  v10 = self;
  sub_1001F7AD4(v8, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease(a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC4Maps25PlaceSummaryTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1001F9BD0();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  _TtC4Maps25PlaceSummaryTableViewCell *v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_1001F7D18();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t KeyPath;
  uint64_t v9;
  _TtC4Maps25PlaceSummaryTableViewCell *v10;
  _TtC4Maps25PlaceSummaryTableViewCell *v11;
  objc_class *v12;
  BOOL v13;
  objc_super v14;

  v4 = a4;
  v5 = a3;
  v7 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel);
  if (v7)
  {
    KeyPath = swift_getKeyPath(&unk_100E33CB0);
    v9 = swift_getKeyPath(&unk_100E33CD8);
    v13 = v5;
    v10 = self;
    static Published.subscript.setter(&v13, v7, KeyPath, v9);
  }
  else
  {
    v11 = self;
  }
  v12 = (objc_class *)type metadata accessor for PlaceSummaryTableViewCell();
  v14.receiver = self;
  v14.super_class = v12;
  -[PlaceSummaryTableViewCell setSelected:animated:](&v14, "setSelected:animated:", v5, v4);

}

- (void).cxx_destruct
{
  sub_100017510((uint64_t)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_asyncDataManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel));
}

- (PersonalizedItem)personalizedItemForQuickActionMenu
{
  uint64_t Strong;
  void *v4;
  _TtC4Maps25PlaceSummaryTableViewCell *v5;
  id v6;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_delegate);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    v6 = objc_msgSend(v4, "personalizedItemForQuickActionMenuWithCell:", v5);

    swift_unknownObjectRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return (PersonalizedItem *)v6;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1002A8AA0(a1) == 5;
}

@end
