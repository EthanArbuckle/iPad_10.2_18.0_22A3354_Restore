@implementation SidebarSearchFieldContentView

- (_TtC5Books29SidebarSearchFieldContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC5Books29SidebarSearchFieldContentView *result;

  v5 = OBJC_IVAR____TtC5Books29SidebarSearchFieldContentView_searchBar;
  v6 = objc_allocWithZone((Class)UISearchBar);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Books29SidebarSearchFieldContentView_textSubscriptionCancellable) = 0;

  result = (_TtC5Books29SidebarSearchFieldContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/SidebarSearchFieldContentView.swift", 41, 2, 39, 0);
  __break(1u);
  return result;
}

- (_TtC5Books29SidebarSearchFieldContentView)initWithFrame:(CGRect)a3
{
  _TtC5Books29SidebarSearchFieldContentView *result;

  result = (_TtC5Books29SidebarSearchFieldContentView *)_swift_stdlib_reportUnimplementedInitializer("Books.SidebarSearchFieldContentView", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books29SidebarSearchFieldContentView_searchBar));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC5Books29SidebarSearchFieldContentView_configuration));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books29SidebarSearchFieldContentView_textSubscriptionCancellable));
}

@end
