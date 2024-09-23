@implementation SportsFavoritesOnboardingViewController

- (_TtC8VideosUI39SportsFavoritesOnboardingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9BB30A8();
}

- (_TtC8VideosUI39SportsFavoritesOnboardingViewController)init
{
  _TtC8VideosUI39SportsFavoritesOnboardingViewController *result;

  sub_1D9BB31F8();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)viewDidLoad
{
  _TtC8VideosUI39SportsFavoritesOnboardingViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BB3370();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8VideosUI39SportsFavoritesOnboardingViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9BB3AF8(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8VideosUI39SportsFavoritesOnboardingViewController *v3;
  char v4;
  void *v5;

  v3 = self;
  v4 = OUTLINED_FUNCTION_36_5();
  sub_1D9BB3D00(v4);
  OUTLINED_FUNCTION_5_8(v5);
}

- (void)viewWillLayoutSubviews
{
  _TtC8VideosUI39SportsFavoritesOnboardingViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BB3DC0();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)doConfirmationAction
{
  _TtC8VideosUI39SportsFavoritesOnboardingViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BB3EC8();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)doDeferAction
{
  _TtC8VideosUI39SportsFavoritesOnboardingViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9BB4C44();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI39SportsFavoritesOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9BB4E3C();
}

- (void).cxx_destruct
{
  void *v3;

  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_completion));
  v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_viewModel);
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController____lazy_storage___controller);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_imageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_confirmationButton);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_deferButton);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI39SportsFavoritesOnboardingViewController_lastRecordedPageEventData));
}

@end
