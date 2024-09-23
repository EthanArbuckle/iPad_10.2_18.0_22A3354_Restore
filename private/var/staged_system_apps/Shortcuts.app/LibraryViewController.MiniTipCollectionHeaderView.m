@implementation LibraryViewController.MiniTipCollectionHeaderView

- (void)prepareForReuse
{
  _TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView *v2;

  v2 = self;
  sub_10008D618();

}

- (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView *)sub_10008D6B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView)initWithCoder:(id)a3
{
  return (_TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView *)sub_10008D754(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_layoutConstraints));
}

@end
