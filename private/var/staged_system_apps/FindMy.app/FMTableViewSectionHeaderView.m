@implementation FMTableViewSectionHeaderView

- (_TtC6FindMy28FMTableViewSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC6FindMy28FMTableViewSectionHeaderView *v8;
  NSString v9;
  _TtC6FindMy28FMTableViewSectionHeaderView *v10;
  objc_super v12;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = OBJC_IVAR____TtC6FindMy28FMTableViewSectionHeaderView_separatorView;
  v7 = objc_allocWithZone((Class)UIView);
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, "init");

  if (v5)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for FMTableViewSectionHeaderView();
  v10 = -[FMTableViewSectionHeaderView initWithReuseIdentifier:](&v12, "initWithReuseIdentifier:", v9);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMTableViewSectionHeaderView_separatorView));
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC6FindMy28FMTableViewSectionHeaderView *v9;
  Class isa;
  objc_class *v11;
  objc_super v12;

  v5 = type metadata accessor for UIViewConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UIViewConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = UIViewConfigurationState._bridgeToObjectiveC()().super.isa;
  v11 = (objc_class *)type metadata accessor for FMTableViewSectionHeaderView();
  v12.receiver = v9;
  v12.super_class = v11;
  -[FMTableViewSectionHeaderView _bridgedUpdateConfigurationUsingState:](&v12, "_bridgedUpdateConfigurationUsingState:", isa);

  sub_100369370();
  objc_msgSend(*(id *)((char *)&v9->super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy28FMTableViewSectionHeaderView_separatorView), "setHidden:", UIViewConfigurationState.isPinned.getter() & 1);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC6FindMy28FMTableViewSectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy28FMTableViewSectionHeaderView *v8;
  _TtC6FindMy28FMTableViewSectionHeaderView *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC6FindMy28FMTableViewSectionHeaderView_separatorView;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for FMTableViewSectionHeaderView();
  v9 = -[FMTableViewSectionHeaderView initWithCoder:](&v11, "initWithCoder:", v7);

  return v9;
}

@end
