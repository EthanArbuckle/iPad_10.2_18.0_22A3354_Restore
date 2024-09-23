@implementation WorkoutDetailGuidedRunMMGalleryViewController

- (void)doneButtonTapped
{
  -[WorkoutDetailGuidedRunMMGalleryViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100527D24();
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100527B30(v4);

}

- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *result;

  result = (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailGuidedRunMMGalleryViewController", 56, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *result;

  v3 = a3;
  result = (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailGuidedRunMMGalleryViewController", 56, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutDetailGuidedRunMMGalleryViewController", 56, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController_rootViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp45WorkoutDetailGuidedRunMMGalleryViewController_imageScrollView));
}

@end
