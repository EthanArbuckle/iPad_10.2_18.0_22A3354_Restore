@implementation TVAppInstallerViewController

- (_TtC8VideosUI28TVAppInstallerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9CD2838();
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = OUTLINED_FUNCTION_91_0();
  v6 = sub_1D9CD3DB0();

  return v6;
}

- (_TtC8VideosUI28TVAppInstallerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    OUTLINED_FUNCTION_63_30();
  v5 = a4;
  sub_1D9CD3E88();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI28TVAppInstallerViewController_appInfo);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI28TVAppInstallerViewController_appInstallerHelper));
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI28TVAppInstallerViewController____lazy_storage___titleLabel));
}

- (void)lockupView:(id)a3 preprocessOffer:(id)a4 inState:(id)a5 completionBlock:(id)a6
{
  void *v10;
  id v11;
  id v12;
  _TtC8VideosUI28TVAppInstallerViewController *v13;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  swift_unknownObjectRetain();
  v12 = a5;
  v13 = self;
  sub_1D9CD3F98((uint64_t)v11, (uint64_t)a4, (uint64_t)v12, (uint64_t)v13, (void (**)(_QWORD, _QWORD))v10);
  _Block_release(v10);

  swift_unknownObjectRelease();
}

@end
