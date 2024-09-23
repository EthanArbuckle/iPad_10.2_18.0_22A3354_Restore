@implementation LibraryViewController.SyncUnavailableCollectionHeaderView

- (void)prepareForReuse
{
  _TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView *v2;

  v2 = self;
  sub_100048C94();

}

- (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView *)sub_100048D30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView)initWithCoder:(id)a3
{
  return (_TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView *)sub_100048DD0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView_hostingView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView_layoutConstraints));
}

@end
