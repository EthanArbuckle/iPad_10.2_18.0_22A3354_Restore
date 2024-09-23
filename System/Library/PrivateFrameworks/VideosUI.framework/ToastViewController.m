@implementation ToastViewController

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController)initWithCoder:(id)a3
{
  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9F6F410();
}

- (void)loadView
{
  _TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9F6F4A4();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidLoad
{
  _TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9F6F518();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController *v4;

  v4 = self;
  sub_1D9F6FB44(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewSafeAreaInsetsDidChange
{
  _TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9F6FBF8();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidLayoutSubviews
{
  _TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9F6FCD0();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  OUTLINED_FUNCTION_8_14();
  v6 = v5;
  swift_unknownObjectRetain();
  v7 = v6;
  sub_1D9F70014(a4);
  swift_unknownObjectRelease();

}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (_TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9F70324();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController_actionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_CEC0FAA63D95F28694C5A7BD137F0AC119ToastViewController_hostingController));
  swift_release();
}

@end
