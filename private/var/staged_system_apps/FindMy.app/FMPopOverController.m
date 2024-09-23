@implementation FMPopOverController

- (_TtC6FindMy19FMPopOverController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC6FindMy19FMPopOverController *result;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy19FMPopOverController_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy19FMPopOverController_selectionSubscription) = 0;
  v6 = OBJC_IVAR____TtC6FindMy19FMPopOverController_sideBarView;
  v7 = objc_allocWithZone((Class)type metadata accessor for FMSideBarView());
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, "init");

  result = (_TtC6FindMy19FMPopOverController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPopOverController.swift", 32, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy19FMPopOverController *v4;

  v4 = self;
  sub_10021F1F8(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy19FMPopOverController *v4;

  v4 = self;
  sub_10021F398(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FMPopOverController();
  v4 = (char *)v10.receiver;
  -[FMPopOverController viewDidDisappear:](&v10, "viewDidDisappear:", v3);
  v5 = &v4[OBJC_IVAR____TtC6FindMy19FMPopOverController_delegate];
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC6FindMy19FMPopOverController_delegate]);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(ObjectType, v8);

    swift_unknownObjectRelease(v7);
  }
  else
  {

  }
}

- (void)viewDidLoad
{
  char *v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMPopOverController();
  v2 = (char *)v5.receiver;
  -[FMPopOverController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "addSubview:", *(_QWORD *)&v2[OBJC_IVAR____TtC6FindMy19FMPopOverController_sideBarView]);

    sub_10021F62C();
  }
  else
  {
    __break(1u);
  }
}

- (_TtC6FindMy19FMPopOverController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy19FMPopOverController *result;

  v4 = a4;
  result = (_TtC6FindMy19FMPopOverController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPopOverController", 26, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMPopOverController_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy19FMPopOverController_mediator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy19FMPopOverController_selectionSubscription));

}

@end
