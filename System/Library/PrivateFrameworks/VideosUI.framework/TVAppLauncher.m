@implementation TVAppLauncher

- (void)showLoadingView
{
  _TtC8VideosUI13TVAppLauncher *v2;

  v2 = self;
  TVAppLauncher.showLoadingView()();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)hideLoadingView
{
  _TtC8VideosUI13TVAppLauncher *v2;

  v2 = self;
  TVAppLauncher.hideLoadingView()();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)configureAppWindow
{
  _TtC8VideosUI13TVAppLauncher *v2;

  v2 = self;
  TVAppLauncher.configureAppWindow()();

}

- (_TtC8VideosUI13TVAppLauncher)init
{
  return (_TtC8VideosUI13TVAppLauncher *)TVAppLauncher.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8VideosUI13TVAppLauncher__isLoading;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA87880);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end
