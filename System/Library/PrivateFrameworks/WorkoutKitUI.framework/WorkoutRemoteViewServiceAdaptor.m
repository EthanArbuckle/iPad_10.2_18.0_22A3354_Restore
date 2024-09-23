@implementation WorkoutRemoteViewServiceAdaptor

- (void)presentRemoteViewControllerOn:(id)a3 with:(id)a4 dismissCompletion:(id)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = sub_24A6338E8();
  v11 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  v15 = _Block_copy(a6);
  v16 = a3;
  v17 = a4;
  v18 = self;
  v19 = sub_24A6338B8();
  v21 = v20;

  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v14;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v15;
  _Block_copy(v15);
  sub_24A631630(v19, v21);
  sub_24A6338DC();
  sub_24A6318A0(v16, (uint64_t)v13, (uint64_t)sub_24A632D70, v22, (uint64_t)sub_24A632D7C, v23);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v24);
  swift_release();
  _Block_release(v15);
  swift_release();
  sub_24A632D84(v19, v21);

}

- (void)dismissRemoteViewControllerOn:(id)a3
{
  id v4;
  _TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor *v5;

  v4 = a3;
  v5 = self;
  sub_24A631BF8(v4);

}

- (void)closeButtonTapped
{
  _TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor *v2;

  v2 = self;
  sub_24A631CD8();

}

- (_TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  swift_unknownObjectWeakInit();
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion);
  v4 = (objc_class *)type metadata accessor for WorkoutRemoteViewServiceAdaptor();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[WorkoutRemoteViewServiceAdaptor init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_24A631B1C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor_dismissCompletion));
}

@end
