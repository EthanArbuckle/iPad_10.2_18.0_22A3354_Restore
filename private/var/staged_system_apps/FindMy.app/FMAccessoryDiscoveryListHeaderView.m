@implementation FMAccessoryDiscoveryListHeaderView

- (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy34FMAccessoryDiscoveryListHeaderView *result;

  v5 = OBJC_IVAR____TtC6FindMy34FMAccessoryDiscoveryListHeaderView_headerView;
  v6 = objc_allocWithZone((Class)type metadata accessor for FMAddItemFlowHeaderView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMy/FMAccessoryDiscoveryListHeaderView.swift", 47, 2, 63, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy34FMAccessoryDiscoveryListHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_100265DC0((uint64_t)a3);

}

- (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy34FMAccessoryDiscoveryListHeaderView *result;

  result = (_TtC6FindMy34FMAccessoryDiscoveryListHeaderView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAccessoryDiscoveryListHeaderView", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryDiscoveryListHeaderView_videoPlayerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy34FMAccessoryDiscoveryListHeaderView_headerView));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy34FMAccessoryDiscoveryListHeaderView_configuration;
  v4 = *(_QWORD *)&self->videoPlayerView[OBJC_IVAR____TtC6FindMy34FMAccessoryDiscoveryListHeaderView_configuration];
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 3));
  swift_bridgeObjectRelease(v4);
}

@end
