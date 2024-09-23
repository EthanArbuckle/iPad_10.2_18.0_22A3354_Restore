@implementation FMNoLocationCalloutViewController

- (_TtC6FindMy33FMNoLocationCalloutViewController)init
{
  return (_TtC6FindMy33FMNoLocationCalloutViewController *)sub_10036A064();
}

- (_TtC6FindMy33FMNoLocationCalloutViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10036B714();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMNoLocationCalloutViewController();
  v2 = v3.receiver;
  -[FMNoLocationCalloutViewController viewDidLoad](&v3, "viewDidLoad");
  sub_10036A394();
  sub_10036A884();

}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy33FMNoLocationCalloutViewController *v2;

  v2 = self;
  sub_10036A254();

}

- (void)infoButtonPressed
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  void (*v8)(uint64_t, uint64_t);
  _TtC6FindMy33FMNoLocationCalloutViewController *v9;

  v3 = (char *)self + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType(Strong);
    v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v9 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease(v5);
  }
}

- (_TtC6FindMy33FMNoLocationCalloutViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy33FMNoLocationCalloutViewController *result;

  v4 = a4;
  result = (_TtC6FindMy33FMNoLocationCalloutViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMNoLocationCalloutViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_infoButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_popoverView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_calloutView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMNoLocationCalloutViewController_blurredBackground));
}

@end
