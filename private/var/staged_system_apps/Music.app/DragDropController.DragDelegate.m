@implementation DragDropController.DragDelegate

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t (*v4)(id);
  uint64_t v7;
  id v8;
  uint64_t v9;
  _TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *v10;
  _QWORD *v11;
  Class isa;

  v4 = *(uint64_t (**)(id))((char *)&self->super.isa
                                    + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider);
  if (v4)
  {
    v7 = *(_QWORD *)&self->dragItemsProvider[OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider];
    v8 = a3;
    swift_unknownObjectRetain(a4, v9);
    v10 = self;
    sub_100048AAC((uint64_t)v4, v7);
    v11 = (_QWORD *)v4(a4);
    sub_10004BA30((uint64_t)v4, v7);

    swift_unknownObjectRelease(a4);
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
  }
  sub_10004A07C(0, (unint64_t *)&unk_1011AB310, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  return isa;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  uint64_t (*v5)(id);
  uint64_t v8;
  id v9;
  uint64_t v10;
  _TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *v11;
  _QWORD *v12;
  Class isa;

  v5 = *(uint64_t (**)(id))((char *)&self->super.isa
                                    + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider);
  if (v5)
  {
    v8 = *(_QWORD *)&self->dragItemsProvider[OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider];
    v9 = a3;
    swift_unknownObjectRetain(a4, v10);
    v11 = self;
    sub_100048AAC((uint64_t)v5, v8);
    v12 = (_QWORD *)v5(a4);
    sub_10004BA30((uint64_t)v5, v8);

    swift_unknownObjectRelease(a4);
  }
  else
  {
    v12 = _swiftEmptyArrayStorage;
  }
  sub_10004A07C(0, (unint64_t *)&unk_1011AB310, UIDragItem_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  return isa;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  sub_1002E1CE4((char *)self, (uint64_t)a2, a3, (uint64_t)a4, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionWillBegin, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA50, (void (*)(void (*)(uint64_t), uint64_t))sub_10004BA54);
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  void (*v5)(id);
  uint64_t v8;
  id v9;
  uint64_t v10;
  _TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *v11;

  v5 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd);
  if (v5)
  {
    v8 = *(_QWORD *)&self->dragItemsProvider[OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd];
    v9 = a3;
    swift_unknownObjectRetain(a4, v10);
    v11 = self;
    sub_100048AAC((uint64_t)v5, v8);
    v5(a4);
    sub_10004BA30((uint64_t)v5, v8);

    swift_unknownObjectRelease(a4);
  }
}

- (_TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate)init
{
  return (_TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate *)sub_1002E1490((char *)self, (uint64_t)a2, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd, (uint64_t (*)(_QWORD))type metadata accessor for DragDropController.DragDelegate);
}

- (void).cxx_destruct
{
  sub_1002E1524((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_dragItemsProvider, (void (*)(_QWORD, _QWORD))sub_10004BA54, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionWillBegin, &OBJC_IVAR____TtCC5Music18DragDropControllerP33_A2D93B940709760920FE5612D029DD8B12DragDelegate_onDragSessionDidEnd);
}

- (id)_dragInteraction:(void *)a3 sessionPropertiesForSession:(uint64_t)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v7 = objc_allocWithZone((Class)_UIDragSessionProperties);
  v8 = a3;
  swift_unknownObjectRetain(a4, v9);
  v10 = a1;
  v11 = objc_msgSend(v7, "init");
  objc_msgSend(v11, "set_supportsSystemDrag:", 0);

  swift_unknownObjectRelease(a4);
  return v11;
}

@end
