@implementation PlaceholderViewController

- (_TtC9SeymourUI25PlaceholderViewController)init
{
  uint64_t v3;
  id v4;
  _TtC9SeymourUI25PlaceholderViewController *v5;
  id v6;
  _TtC9SeymourUI25PlaceholderViewController *v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator;
  v4 = objc_allocWithZone(MEMORY[0x24BEBD398]);
  v5 = self;
  v6 = objc_msgSend(v4, sel_initWithActivityIndicatorStyle_, 101);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)v6;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for PlaceholderViewController();
  v7 = -[PlaceholderViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  objc_msgSend(*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator), sel_setHidesWhenStopped_, 1);
  return v7;
}

- (_TtC9SeymourUI25PlaceholderViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _TtC9SeymourUI25PlaceholderViewController *result;

  v5 = OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD398]);
  v7 = a3;
  v8 = objc_msgSend(v6, sel_initWithActivityIndicatorStyle_, 101);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;

  result = (_TtC9SeymourUI25PlaceholderViewController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI25PlaceholderViewController *v2;

  v2 = self;
  sub_22B965610();

}

- (_TtC9SeymourUI25PlaceholderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI25PlaceholderViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI25PlaceholderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator));
}

@end
