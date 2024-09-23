@implementation SectionViewController

- (_TtC5TeaUI21SectionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SectionViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC5TeaUI21SectionViewController *v2;

  v2 = self;
  sub_1B14D9984();

}

- (void)viewWillLayoutSubviews
{
  _TtC5TeaUI21SectionViewController *v2;

  v2 = self;
  sub_1B14DA138();

}

- (_TtC5TeaUI21SectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  SectionViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI21SectionViewController_dataSource);
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI21SectionViewController_delegate);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI21SectionViewController_sectionTitleColor);
  swift_release();
  sub_1B14D8CFC(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI21SectionViewController_presentation), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5TeaUI21SectionViewController_presentation), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC5TeaUI21SectionViewController_presentation), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC5TeaUI21SectionViewController_presentation));
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI21SectionViewController_sectionBarTintColor);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI21SectionViewController_sectionBarTextColor);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI21SectionViewController_barBackgroundColor);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super._responderFlags
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController_currentSection));
  swift_release();
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI21SectionViewController_barCompressionManager);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI21SectionViewController____lazy_storage___sectionsBarButtonItem);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI21SectionViewController____lazy_storage___sectionsSegmentedView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI21SectionViewController____lazy_storage___sectionSelectorView));
}

@end
