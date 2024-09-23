@implementation BannerView.BannerContainerViewController

- (_TtCV12PhotosUICore10BannerView29BannerContainerViewController)initWithCoder:(id)a3
{
  _TtCV12PhotosUICore10BannerView29BannerContainerViewController *result;

  result = (_TtCV12PhotosUICore10BannerView29BannerContainerViewController *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  _TtCV12PhotosUICore10BannerView29BannerContainerViewController *v2;

  v2 = self;
  sub_1A6C4CE58();

}

- (void)viewDidLayoutSubviews
{
  _TtCV12PhotosUICore10BannerView29BannerContainerViewController *v2;

  v2 = self;
  sub_1A6C4D008();

}

- (void)preparePresentationEnvironmentForBannerView:(id)a3 actionIdentifier:(id)a4 completionHandler:(id)a5
{
  void (**v8)(void *, id, _QWORD);
  id v9;
  _TtCV12PhotosUICore10BannerView29BannerContainerViewController *v10;
  id v11;

  v8 = (void (**)(void *, id, _QWORD))_Block_copy(a5);
  if (a4)
    sub_1A7AE3764();
  v9 = a3;
  v10 = self;
  v11 = PXPresentationEnvironmentForSender(v10);
  v8[2](v8, v11, 0);
  swift_unknownObjectRelease();
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (_TtCV12PhotosUICore10BannerView29BannerContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCV12PhotosUICore10BannerView29BannerContainerViewController *result;

  v4 = a4;
  result = (_TtCV12PhotosUICore10BannerView29BannerContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v2;

  v2 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtCV12PhotosUICore10BannerView29BannerContainerViewController_representable);
  swift_release();
  swift_release();

}

@end
