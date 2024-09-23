@implementation DOCModalBlurViewControllerTransition

- (double)transitionDuration:(id)a3
{
  return 1.0;
}

- (void)animateTransition:(id)a3
{
  char v5;
  _TtC5Files36DOCModalBlurViewControllerTransition *v6;

  v5 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files36DOCModalBlurViewControllerTransition_direction);
  swift_unknownObjectRetain(a3);
  v6 = self;
  if ((v5 & 1) != 0)
    sub_1003C5998(a3);
  else
    sub_1003C5098(a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC5Files36DOCModalBlurViewControllerTransition)init
{
  _TtC5Files36DOCModalBlurViewControllerTransition *result;

  result = (_TtC5Files36DOCModalBlurViewControllerTransition *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCModalBlurViewControllerTransition", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files36DOCModalBlurViewControllerTransition_backgroundView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files36DOCModalBlurViewControllerTransition_containerView));

}

@end
