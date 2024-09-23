@implementation DragDropController.DropDelegate

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return sub_84AD20((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_canHandleSession);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  uint64_t (*v4)(id);
  uint64_t v7;
  id v8;
  _TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate *v9;
  id v10;

  v4 = *(uint64_t (**)(id))((char *)&self->super.isa
                                    + OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate);
  if (v4)
  {
    v7 = *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate];
    v8 = a3;
    swift_unknownObjectRetain(a4);
    v9 = self;
    sub_A9DEC((uint64_t)v4, v7);
    v10 = (id)v4(a4);
    sub_5C198((uint64_t)v4, v7);

    swift_unknownObjectRelease(a4);
  }
  else
  {
    v10 = objc_msgSend(objc_allocWithZone((Class)UIDropProposal), "initWithDropOperation:", 0);
  }
  return v10;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  sub_84AFD4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E4, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E0);
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  sub_84AFD4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E4, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E0);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  sub_84AFD4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onPerformDrop, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E4, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E0);
}

- (_TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate)init
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_class *v7;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_canHandleSession);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onPerformDrop);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd);
  v7 = (objc_class *)type metadata accessor for DragDropController.DropDelegate();
  *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return -[DragDropController.DropDelegate init](&v9, "init");
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_canHandleSession), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_canHandleSession]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onPerformDrop), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onPerformDrop]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidUpdate]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd), *(_QWORD *)&self->canHandleSession[OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DropDelegate_onDropSessionDidExitOrEnd]);
}

@end
