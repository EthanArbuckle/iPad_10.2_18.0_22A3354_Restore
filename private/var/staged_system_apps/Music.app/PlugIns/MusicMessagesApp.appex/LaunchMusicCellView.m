@implementation LaunchMusicCellView

- (_TtC16MusicMessagesApp19LaunchMusicCellView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicMessagesApp19LaunchMusicCellView *)sub_10001BEF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicMessagesApp19LaunchMusicCellView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC16MusicMessagesApp19LaunchMusicCellView *)sub_10001CCA0();
}

- (void)dealloc
{
  void *v3;
  _TtC16MusicMessagesApp19LaunchMusicCellView *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for LaunchMusicCellView();
  -[LaunchMusicCellView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp19LaunchMusicCellView_launchMusicLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp19LaunchMusicCellView_indicatorView));
  sub_10000DCF8(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicMessagesApp19LaunchMusicCellView_layoutInvalidationHandler), *(_QWORD *)&self->super.platterView[OBJC_IVAR____TtC16MusicMessagesApp19LaunchMusicCellView_layoutInvalidationHandler]);
}

- (void)layoutSubviews
{
  _TtC16MusicMessagesApp19LaunchMusicCellView *v2;

  v2 = self;
  sub_10001C254();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicMessagesApp19LaunchMusicCellView *v6;

  v5 = a3;
  v6 = self;
  sub_10001C780(a3);

}

- (UILabel)accessibilityLaunchMusicLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicMessagesApp19LaunchMusicCellView_launchMusicLabel));
}

@end
