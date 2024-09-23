@implementation DragDropController.DropDelegate

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return sub_1002E1A30((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  uint64_t (*v4)(id);
  uint64_t v7;
  id v8;
  uint64_t v9;
  _TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate *v10;
  id v11;

  v4 = *(uint64_t (**)(id))((char *)&self->super.isa
                                    + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate);
  if (v4)
  {
    v7 = *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate];
    v8 = a3;
    swift_unknownObjectRetain(a4, v9);
    v10 = self;
    sub_100048AAC((uint64_t)v4, v7);
    v11 = (id)v4(a4);
    sub_10004BA30((uint64_t)v4, v7);

    swift_unknownObjectRelease(a4);
  }
  else
  {
    v11 = objc_msgSend(objc_allocWithZone((Class)UIDropProposal), "initWithDropOperation:", 0);
  }
  return v11;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  sub_1002E1CE4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA50, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA54);
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  sub_1002E1CE4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA50, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA54);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  sub_1002E1CE4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA50, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA54);
}

- (_TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate)init
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_class *v7;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd);
  v7 = (objc_class *)type metadata accessor for DragDropController.DropDelegate();
  *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return -[DragDropController.DropDelegate init](&v9, "init");
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_canHandleSession]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onPerformDrop]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidUpdate]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DropDelegate_onDropSessionDidExitOrEnd]);
}

@end
