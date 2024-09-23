@implementation DragDropController.DragDelegate

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  void (*v4)(id);
  uint64_t v7;
  id v8;
  _TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate *v9;
  Class isa;

  v4 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider);
  if (v4)
  {
    v7 = *(_QWORD *)&self->dragItemsProvider[OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider];
    v8 = a3;
    swift_unknownObjectRetain(a4);
    v9 = self;
    sub_A9DEC((uint64_t)v4, v7);
    v4(a4);
    sub_5C198((uint64_t)v4, v7);

    swift_unknownObjectRelease(a4);
  }
  sub_4E684(0, (unint64_t *)&unk_14E4708, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  void (*v5)(id);
  uint64_t v8;
  id v9;
  _TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate *v10;
  Class isa;

  v5 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider);
  if (v5)
  {
    v8 = *(_QWORD *)&self->dragItemsProvider[OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider];
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    sub_A9DEC((uint64_t)v5, v8);
    v5(a4);
    sub_5C198((uint64_t)v5, v8);

    swift_unknownObjectRelease(a4);
  }
  sub_4E684(0, (unint64_t *)&unk_14E4708, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  sub_84AFD4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionWillBegin, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E4, (void (*)(void (*)(uint64_t), uint64_t))sub_CD0E0);
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  void (*v5)(id);
  uint64_t v8;
  id v9;
  _TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate *v10;

  v5 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionDidEnd);
  if (v5)
  {
    v8 = *(_QWORD *)&self->dragItemsProvider[OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionDidEnd];
    v9 = a3;
    swift_unknownObjectRetain(a4);
    v10 = self;
    sub_A9DEC((uint64_t)v5, v8);
    v5(a4);
    sub_5C198((uint64_t)v5, v8);

    swift_unknownObjectRelease(a4);
  }
}

- (_TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate)init
{
  return (_TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate *)sub_84A79C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionDidEnd, (uint64_t (*)(_QWORD))type metadata accessor for DragDropController.DragDelegate);
}

- (void).cxx_destruct
{
  sub_84A830((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_dragItemsProvider, (void (*)(_QWORD, _QWORD))sub_CD0E0, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC16MusicApplication18DragDropControllerP33_47F8E5E7F218E75A185BA765B483BB8712DragDelegate_onDragSessionDidEnd);
}

- (id)_dragInteraction:(void *)a3 sessionPropertiesForSession:(uint64_t)a4
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = objc_allocWithZone((Class)_UIDragSessionProperties);
  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = a1;
  v10 = objc_msgSend(v7, "init");
  objc_msgSend(v10, "set_supportsSystemDrag:", 0);

  swift_unknownObjectRelease(a4);
  return v10;
}

@end
