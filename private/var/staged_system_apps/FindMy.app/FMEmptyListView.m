@implementation FMEmptyListView

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy15FMEmptyListView_mediator));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy15FMEmptyListView_scrollableContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy15FMEmptyListView_actionButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy15FMEmptyListView_actionButtonCenteringConstraint));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMEmptyListView();
  v4 = a3;
  v5 = v7.receiver;
  v6 = -[FMEmptyListView traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  (*(void (**)(id))((swift_isaMask & *v5) + 0x128))(v6);
  sub_1000475B8();

}

- (void)layoutSubviews
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMEmptyListView();
  v2 = v4.receiver;
  v3 = -[FMEmptyListView layoutSubviews](&v4, "layoutSubviews");
  (*(void (**)(id))((swift_isaMask & *v2) + 0x128))(v3);
  if (*((_BYTE *)v2 + OBJC_IVAR____TtC6FindMy15FMEmptyListView_isFirstLayout) == 1)
    *((_BYTE *)v2 + OBJC_IVAR____TtC6FindMy15FMEmptyListView_isFirstLayout) = 0;

}

- (_TtC6FindMy15FMEmptyListView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10022D570();
}

- (_TtC6FindMy15FMEmptyListView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy15FMEmptyListView *result;

  result = (_TtC6FindMy15FMEmptyListView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMEmptyListView", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
