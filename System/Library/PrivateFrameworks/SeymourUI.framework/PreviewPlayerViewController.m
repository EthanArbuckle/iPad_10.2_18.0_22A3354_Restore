@implementation PreviewPlayerViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (_TtC9SeymourUI27PreviewPlayerViewController)initWithCoder:(id)a3
{
  _TtC9SeymourUI27PreviewPlayerViewController *result;

  result = (_TtC9SeymourUI27PreviewPlayerViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for PreviewPlayerViewController();
  -[PreviewPlayerViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewPlayerViewController();
  v4 = v5.receiver;
  -[PreviewPlayerViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B6600F4();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9SeymourUI27PreviewPlayerViewController *v4;

  v4 = self;
  sub_22B76B780(a3);

}

- (_TtC9SeymourUI27PreviewPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI27PreviewPlayerViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI27PreviewPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27PreviewPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3;
  _TtC9SeymourUI27PreviewPlayerViewController *result;

  v3 = a3;
  result = (_TtC9SeymourUI27PreviewPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27PreviewPlayerViewController_dataProvider));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI27PreviewPlayerViewController_metricPage;
  v4 = sub_22BA79CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
