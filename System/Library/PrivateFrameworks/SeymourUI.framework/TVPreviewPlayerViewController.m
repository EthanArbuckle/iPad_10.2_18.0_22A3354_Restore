@implementation TVPreviewPlayerViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (_TtC9SeymourUI29TVPreviewPlayerViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC9SeymourUI29TVPreviewPlayerViewController *result;

  v5 = OBJC_IVAR____TtC9SeymourUI29TVPreviewPlayerViewController_playerViewController;
  v6 = objc_allocWithZone(MEMORY[0x24BDB27C0]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9SeymourUI29TVPreviewPlayerViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI29TVPreviewPlayerViewController *v2;

  v2 = self;
  sub_22BA32554();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVPreviewPlayerViewController();
  v4 = v5.receiver;
  -[TVPreviewPlayerViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_22B6600F4();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9SeymourUI29TVPreviewPlayerViewController *v4;

  v4 = self;
  sub_22BA327D4(a3);

}

- (_TtC9SeymourUI29TVPreviewPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI29TVPreviewPlayerViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI29TVPreviewPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29TVPreviewPlayerViewController_dataProvider));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI29TVPreviewPlayerViewController_metricPage;
  v4 = sub_22BA79CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29TVPreviewPlayerViewController_playerViewController));
}

@end
