@implementation CRLCommandController

- (void)openGroup
{
  -[CRLCommandController openGroupWithSelectionBehavior:](self, "openGroupWithSelectionBehavior:", 0);
}

- (void)closeGroup
{
  -[CRLCommandController closeGroupWithSelectionBehavior:](self, "closeGroupWithSelectionBehavior:", 0);
}

- (void)enqueueCommand:(id)a3
{
  -[CRLCommandController enqueueCommand:withSelectionBehavior:](self, "enqueueCommand:withSelectionBehavior:", a3, 0);
}

- (_TtC8Freeform8CRLBoard)board
{
  return (_TtC8Freeform8CRLBoard *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC8Freeform20CRLCommandController_board));
}

- (_TtC8Freeform20CRLCommandController)initWithBoard:(id)a3 changeNotifier:(id)a4 selectionDispatcher:(id)a5
{
  return (_TtC8Freeform20CRLCommandController *)sub_1006A551C((uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)enqueueCommand:(id)a3 withSelectionBehavior:(id)a4
{
  _BYTE *v6;
  id v7;
  _TtC8Freeform20CRLCommandController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1006A5F54(v6, 0, a4, 4, 0);

}

- (void)undo
{
  _TtC8Freeform20CRLCommandController *v2;

  v2 = self;
  sub_1006A7D24();

}

- (void)redo
{
  _TtC8Freeform20CRLCommandController *v2;

  v2 = self;
  sub_1006A8214();

}

- (BOOL)canUndo
{
  _TtC8Freeform20CRLCommandController *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1006A8734();

  return v3;
}

- (BOOL)canRedo
{
  _TtC8Freeform20CRLCommandController *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1006A886C();

  return v3;
}

- (int64_t)undoCount
{
  _TtC8Freeform20CRLCommandController *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1006A89A4();

  return v3;
}

- (int64_t)redoCount
{
  _TtC8Freeform20CRLCommandController *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1006A8AD4();

  return v3;
}

- (void)enqueueWithNonUndoableCommand:(id)a3
{
  _QWORD **v5;
  _QWORD *v6;
  id v7;
  _TtC8Freeform20CRLCommandController *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _BYTE v13[24];

  v5 = (_QWORD **)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue, v13, 33, 0);
  v6 = *v5;
  v7 = a3;
  v8 = self;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v6);
  *v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_100D0F980(0, v6[2] + 1, 1, v6);
    *v5 = v6;
  }
  v11 = v6[2];
  v10 = v6[3];
  if (v11 >= v10 >> 1)
  {
    v6 = sub_100D0F980((_QWORD *)(v10 > 1), v11 + 1, 1, v6);
    *v5 = v6;
  }
  v6[2] = v11 + 1;
  v12 = &v6[2 * v11];
  v12[4] = v7;
  *((_BYTE *)v12 + 40) = 1;
  swift_endAccess(v13);
  sub_1006A8ED4();

}

- (void)enqueueWithUntrackedCommand:(id)a3
{
  _QWORD **v5;
  _QWORD *v6;
  id v7;
  _TtC8Freeform20CRLCommandController *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _BYTE v13[24];

  v5 = (_QWORD **)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue, v13, 33, 0);
  v6 = *v5;
  v7 = a3;
  v8 = self;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v6);
  *v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_100D0F980(0, v6[2] + 1, 1, v6);
    *v5 = v6;
  }
  v11 = v6[2];
  v10 = v6[3];
  if (v11 >= v10 >> 1)
  {
    v6 = sub_100D0F980((_QWORD *)(v10 > 1), v11 + 1, 1, v6);
    *v5 = v6;
  }
  v6[2] = v11 + 1;
  v12 = &v6[2 * v11];
  v12[4] = v7;
  *((_BYTE *)v12 + 40) = 2;
  swift_endAccess(v13);
  sub_1006A8ED4();

}

- (void)enqueueWithRealTimePeerCommand:(id)a3
{
  _QWORD **v5;
  _QWORD *v6;
  id v7;
  _TtC8Freeform20CRLCommandController *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _BYTE v13[24];

  v5 = (_QWORD **)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue, v13, 33, 0);
  v6 = *v5;
  v7 = a3;
  v8 = self;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v6);
  *v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v6 = sub_100D0F980(0, v6[2] + 1, 1, v6);
    *v5 = v6;
  }
  v11 = v6[2];
  v10 = v6[3];
  if (v11 >= v10 >> 1)
  {
    v6 = sub_100D0F980((_QWORD *)(v10 > 1), v11 + 1, 1, v6);
    *v5 = v6;
  }
  v6[2] = v11 + 1;
  v12 = &v6[2 * v11];
  v12[4] = v7;
  *((_BYTE *)v12 + 40) = 3;
  swift_endAccess(v13);
  sub_1006A8ED4();

}

- (NSString)undoActionString
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  _BYTE v7[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLCommandController_commandHistory);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_commandHistory, v7, 0, 0);
  sub_100A08774(*v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)redoActionString
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  _BYTE v7[24];

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_commandHistory;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_commandHistory, v7, 0, 0);
  sub_100A08774(*((_QWORD *)v2 + 1));
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)currentGroupActionString
{
  _TtC8Freeform20CRLCommandController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1006A912C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)setCurrentGroupActionString:(id)a3
{
  uint64_t v4;
  double *v5;
  double *v6;
  _TtC8Freeform20CRLCommandController *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_1006A92B4(v4, v6);

}

- (int64_t)groupingLevel
{
  uint64_t *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v7;
  _TtC8Freeform20CRLCommandController *v8;
  _BYTE v9[24];

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_openGroupDatas);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_openGroupDatas, v9, 0, 0);
  v4 = *v3;
  if (!((unint64_t)v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4 < 0)
    v7 = v4;
  else
    v7 = v4 & 0xFFFFFFFFFFFFFF8;
  v8 = self;
  swift_bridgeObjectRetain(v4);
  v5 = _CocoaArrayWrapper.endIndex.getter(v7);

  swift_bridgeObjectRelease(v4);
  return v5;
}

- (BOOL)isGroupOpen
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _TtC8Freeform20CRLCommandController *v8;
  _BYTE v9[24];

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_openGroupDatas);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandController_openGroupDatas, v9, 0, 0);
  v4 = *v3;
  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0)
      v7 = v4;
    else
      v7 = v4 & 0xFFFFFFFFFFFFFF8;
    v8 = self;
    swift_bridgeObjectRetain(v4);
    v5 = _CocoaArrayWrapper.endIndex.getter(v7);

    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 > 0;
}

- (BOOL)hasIncomingSuspensionInPlaceForCurrentTransaction
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform20CRLCommandController_hasIncomingSuspensionInPlaceForCurrentTransaction);
}

- (void)setHasIncomingSuspensionInPlaceForCurrentTransaction:(BOOL)a3
{
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC8Freeform20CRLCommandController_hasIncomingSuspensionInPlaceForCurrentTransaction) = a3;
}

- (void)openGroupWithSelectionBehavior:(id)a3
{
  id v5;
  _TtC8Freeform20CRLCommandController *v6;

  v5 = a3;
  v6 = self;
  sub_1006A9664(a3);

}

- (void)closeGroupWithSelectionBehavior:(id)a3
{
  id v5;
  _TtC8Freeform20CRLCommandController *v6;

  v5 = a3;
  v6 = self;
  sub_1006A984C((char *)a3);

}

- (void)destroyOutermostCommandGroupOnClose
{
  _TtC8Freeform20CRLCommandController *v2;

  v2 = self;
  sub_1006A9C98();

}

- (void)enableProgressiveEnqueuingInCurrentGroup
{
  _TtC8Freeform20CRLCommandController *v2;

  v2 = self;
  sub_1006A9FEC();

}

- (BOOL)isProgressiveEnqueuingInCurrentGroupEnabled
{
  _TtC8Freeform20CRLCommandController *v2;
  char v3;

  v2 = self;
  v3 = sub_1006AA310();

  return v3 & 1;
}

- (void)enableRealTimeSyncProgressiveEnqueuingInCurrentGroup
{
  _TtC8Freeform20CRLCommandController *v2;

  v2 = self;
  sub_1006AA414();

}

- (void)enableRealTimeSyncProgressiveEnqueuingWithSimultaneousRealtimeIncomingInCurrentGroup
{
  _TtC8Freeform20CRLCommandController *v2;

  v2 = self;
  sub_1006AA9B0();

}

- (BOOL)isRealTimeSyncProgressiveEnqueuingInCurrentGroupEnabled
{
  _TtC8Freeform20CRLCommandController *v2;
  char v3;

  v2 = self;
  v3 = sub_1006AAF78();

  return v3 & 1;
}

- (BOOL)isRealTimeSyncProgressiveWithSimultaneousRealtimeIncomingInCurrentGroupEnabled
{
  _TtC8Freeform20CRLCommandController *v2;
  char v3;

  v2 = self;
  v3 = sub_1006AB0AC();

  return v3 & 1;
}

- (void)_stepWatermarkContextIfNecessary
{
  _TtC8Freeform20CRLCommandController *v2;

  v2 = self;
  sub_1006AB1AC();

}

- (_TtC8Freeform20CRLCommandController)init
{
  _TtC8Freeform20CRLCommandController *result;

  result = (_TtC8Freeform20CRLCommandController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandController", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform20CRLCommandController__currentTransactionContext));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform20CRLCommandController__currentWatermarkTransactionContext));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Freeform20CRLCommandController_suspendResumeProvider));
  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLCommandController_commandHistory);
  swift_bridgeObjectRelease(*(_QWORD *)&self->board[OBJC_IVAR____TtC8Freeform20CRLCommandController_commandHistory]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform20CRLCommandController_openGroupDatas));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform20CRLCommandController__currentSelectionBehavior));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform20CRLCommandController_nonUserCommandQueue));
}

@end
