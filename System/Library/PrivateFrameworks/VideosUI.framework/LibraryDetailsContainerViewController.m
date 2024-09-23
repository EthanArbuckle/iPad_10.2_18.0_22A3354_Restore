@implementation LibraryDetailsContainerViewController

- (_TtC8VideosUI37LibraryDetailsContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9B4859C();
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v3;

  OUTLINED_FUNCTION_103_1(self);
  OUTLINED_FUNCTION_36_5();
  sub_1D9B4867C();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  char v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = OUTLINED_FUNCTION_36_5();
  sub_1D9B48974(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  void *v4;

  OUTLINED_FUNCTION_103_1(self);
  v3 = (void *)OUTLINED_FUNCTION_36_5();
  sub_1D9B48A2C(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)viewDidLoad
{
  _TtC8VideosUI37LibraryDetailsContainerViewController *v2;

  v2 = self;
  sub_1D9B48B1C();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)viewWillLayoutSubviews
{
  _TtC8VideosUI37LibraryDetailsContainerViewController *v2;

  v2 = self;
  sub_1D9B49024();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI37LibraryDetailsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9B4A364();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController_source);
  objc_release(*(id *)((char *)&self->super._tab
                     + OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController_navigationBarTraits));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController_detailsViewController);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController____lazy_storage___contentPresenter);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI37LibraryDetailsContainerViewController_contentView);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
