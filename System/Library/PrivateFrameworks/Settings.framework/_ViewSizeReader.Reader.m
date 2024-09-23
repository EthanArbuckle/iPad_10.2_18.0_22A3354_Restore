@implementation _ViewSizeReader.Reader

- (_TtCV8Settings15_ViewSizeReader6Reader)initWithCoder:(id)a3
{
  _TtCV8Settings15_ViewSizeReader6Reader *result;

  result = (_TtCV8Settings15_ViewSizeReader6Reader *)sub_1DB4A1A7C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtCV8Settings15_ViewSizeReader6Reader *v2;

  v2 = self;
  sub_1DB44FAB8();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = v8.receiver;
  -[_ViewSizeReader.Reader viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB8130);
  sub_1DB4A150C();
  swift_unknownObjectRelease();

}

- (_TtCV8Settings15_ViewSizeReader6Reader)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCV8Settings15_ViewSizeReader6Reader *result;

  v4 = a4;
  result = (_TtCV8Settings15_ViewSizeReader6Reader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
