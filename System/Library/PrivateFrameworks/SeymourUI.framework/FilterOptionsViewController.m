@implementation FilterOptionsViewController

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_subtitleLabel));
}

- (_TtC9SeymourUI27FilterOptionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B44F21C();
}

- (void)viewDidLoad
{
  _TtC9SeymourUI27FilterOptionsViewController *v2;

  v2 = self;
  sub_22B44D23C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9SeymourUI27FilterOptionsViewController *v4;

  v4 = self;
  sub_22B44D7E0(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9SeymourUI27FilterOptionsViewController *v4;

  v4 = self;
  sub_22B44D9E8(a3);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FilterOptionsViewController();
  v2 = v3.receiver;
  -[FilterOptionsViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_22B44DD78();

}

- (void)updateTitleView
{
  _TtC9SeymourUI27FilterOptionsViewController *v2;

  v2 = self;
  sub_22B44DB54();

}

- (void)onDone
{
  _TtC9SeymourUI27FilterOptionsViewController *v2;

  v2 = self;
  sub_22B44DF0C();

}

- (void)onCancel
{
  _TtC9SeymourUI27FilterOptionsViewController *v2;

  v2 = self;
  sub_22B44E6F0();

}

- (void)textSizeChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9SeymourUI27FilterOptionsViewController *v8;
  uint64_t v9;

  v4 = sub_22BA79344();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79320();
  v8 = self;
  sub_22B44DD78();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC9SeymourUI27FilterOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI27FilterOptionsViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI27FilterOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27FilterOptionsViewController_subtitleLabel));
}

@end
