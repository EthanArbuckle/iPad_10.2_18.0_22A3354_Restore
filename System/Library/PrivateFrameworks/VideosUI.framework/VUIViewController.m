@implementation VUIViewController

- (void)willMoveToParentViewController:(id)a3
{
  void *v3;
  id v4;
  id v5;
  UIViewController_optional *v6;
  void *v7;

  v4 = OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v5 = v3;
  v6 = (UIViewController_optional *)OUTLINED_FUNCTION_36_5();
  VUIViewController.willMove(toParent:)(v6);

  OUTLINED_FUNCTION_12_4(v7);
}

- (void)loadView
{
  _TtC8VideosUI17VUIViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  VUIViewController.loadView()();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI17VUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC8VideosUI17VUIViewController *result;

  if (a3)
  {
    v5 = sub_1DA143E80();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  VUIViewController.init(nibName:bundle:)(v5, v7, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v3;
  id v4;
  id v5;
  UIViewController_optional *v6;
  void *v7;

  v4 = OUTLINED_FUNCTION_205_0((uint64_t)self, (uint64_t)a2, a3);
  v5 = v3;
  v6 = (UIViewController_optional *)OUTLINED_FUNCTION_36_5();
  VUIViewController.didMove(toParent:)(v6);

  OUTLINED_FUNCTION_12_4(v7);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  _TtC8VideosUI17VUIViewController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = VUIViewController.shouldAutomaticallyForwardAppearanceMethods.getter();

  return v3 & 1;
}

- (void)viewWillLayoutSubviews
{
  _TtC8VideosUI17VUIViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  VUIViewController.viewWillLayoutSubviews()();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidLayoutSubviews
{
  _TtC8VideosUI17VUIViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  VUIViewController.viewDidLayoutSubviews()();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)updateViewConstraints
{
  _TtC8VideosUI17VUIViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  VUIViewController.updateViewConstraints()();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  VUIViewController.viewWillDisappear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  VUIViewController.viewDidDisappear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  VUIViewController.viewWillAppear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  VUIViewController.viewDidAppear(_:)(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewDidLoad
{
  _TtC8VideosUI17VUIViewController *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  VUIViewController.viewDidLoad()();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI17VUIViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI17VUIViewController *)VUIViewController.init(coder:)(a3);
}

@end
