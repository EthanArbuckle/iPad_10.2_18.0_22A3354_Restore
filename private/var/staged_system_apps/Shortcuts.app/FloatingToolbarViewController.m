@implementation FloatingToolbarViewController

- (void)viewDidLoad
{
  _TtC9Shortcuts29FloatingToolbarViewController *v2;

  v2 = self;
  sub_10000A458();

}

- (_TtC9Shortcuts29FloatingToolbarViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10002D580();
}

- (void)dealloc
{
  _TtC9Shortcuts29FloatingToolbarViewController *v2;

  v2 = self;
  sub_10002D638();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts29FloatingToolbarViewController_toolbar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts29FloatingToolbarViewController_bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Shortcuts29FloatingToolbarViewController_backgroundColor));
}

- (void)keyboardWillChange:(id)a3
{
  id v4;
  _TtC9Shortcuts29FloatingToolbarViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10002D714();

}

- (_TtC9Shortcuts29FloatingToolbarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = a4;
  sub_10002DC64();
}

@end
