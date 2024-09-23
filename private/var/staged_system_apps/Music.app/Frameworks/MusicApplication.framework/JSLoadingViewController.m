@implementation JSLoadingViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication23JSLoadingViewController *v2;

  v2 = self;
  sub_5A539C();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication23JSLoadingViewController *v2;

  v2 = self;
  sub_5A5510();

}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  id v4;
  _TtC16MusicApplication23JSLoadingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_5A6D6C();

}

- (_TtC16MusicApplication23JSLoadingViewController)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication23JSLoadingViewController *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication23JSLoadingViewController *)sub_5A6E44((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSLoadingViewController_loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSLoadingViewController_errorMessageView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication23JSLoadingViewController_scriptingBridgeDidFailInitializationDidChangeObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication23JSLoadingViewController_errorMessageTask));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication23JSLoadingViewController_loadingIndicatorTask));
}

@end
