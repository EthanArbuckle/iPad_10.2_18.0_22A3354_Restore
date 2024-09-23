@implementation WorkoutRemoteViewController

+ (id)serviceViewControllerInterface
{
  return sub_24A633090((uint64_t)a1, (uint64_t)a2, &protocolRef_WorkoutRemoteViewServiceInterface);
}

+ (id)exportedInterface
{
  return sub_24A633090((uint64_t)a1, (uint64_t)a2, &protocolRef_WorkoutRemoteViewServiceExportedInterface);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  _TtC12WorkoutKitUI27WorkoutRemoteViewController *v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = self;
  if (a3)
  {
    v5 = a3;
    v6 = (void *)sub_24A6338A0();
  }
  else
  {
    v6 = 0;
  }
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for WorkoutRemoteViewController();
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v7, sel_viewServiceDidTerminateWithError_, v6);

  -[WorkoutRemoteViewController dismiss](v4, sel_dismiss);
}

- (_TtC12WorkoutKitUI27WorkoutRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  id v10;
  _TtC12WorkoutKitUI27WorkoutRemoteViewController *v11;
  objc_super v13;

  if (a3)
  {
    sub_24A633900();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler);
    *v6 = 0;
    v6[1] = 0;
    v7 = a4;
    v8 = (void *)sub_24A6338F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler);
    *v9 = 0;
    v9[1] = 0;
    v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for WorkoutRemoteViewController();
  v11 = -[WorkoutRemoteViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v8, a4);

  return v11;
}

- (_TtC12WorkoutKitUI27WorkoutRemoteViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler);
  v6 = (objc_class *)type metadata accessor for WorkoutRemoteViewController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[WorkoutRemoteViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_24A631B1C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler));
}

- (void)dismiss
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC12WorkoutKitUI27WorkoutRemoteViewController *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC12WorkoutKitUI27WorkoutRemoteViewController_dismissHandler);
  if (v2)
  {
    v4 = self;
    v3 = sub_24A632CA4((uint64_t)v2);
    v2(v3);
    sub_24A631B1C((uint64_t)v2);

  }
}

@end
