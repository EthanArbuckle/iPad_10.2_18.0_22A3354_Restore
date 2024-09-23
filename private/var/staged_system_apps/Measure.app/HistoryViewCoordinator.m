@implementation HistoryViewCoordinator

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  char *v7;
  _BYTE v8[24];
  uint64_t v9;
  uint64_t v10;

  if (a4)
    return 0;
  v9 = v4;
  v10 = v5;
  v7 = (char *)self + qword_100485CC8;
  swift_beginAccess((char *)self + qword_100485CC8, v8, 0, 0);
  return *(_QWORD *)(*(_QWORD *)v7 + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7Measure22HistoryViewCoordinator *v12;
  _QWORD *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_10014D064(v11, v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC7Measure22HistoryViewCoordinator *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10014D650(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = type metadata accessor for IndexPath(0, a2);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  LOBYTE(a4) = *(_BYTE *)(*(_QWORD *)((char *)self + qword_100485CE8)
                        + OBJC_IVAR____TtC7Measure23CardContainerController_isPanningCard);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (a4 & 1) == 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC7Measure22HistoryViewCoordinator *v14;
  uint64_t v15;

  v9 = type metadata accessor for IndexPath(0, a2);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = self;
  sub_10014DBF8(v13, a4, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t Strong;
  void *v12;
  id v13;
  _TtC7Measure22HistoryViewCoordinator *v14;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  *((_BYTE *)self + qword_100485D00) = 1;
  Strong = swift_unknownObjectUnownedLoadStrong(*(_QWORD *)((char *)self + qword_100485CE8)+ OBJC_IVAR____TtC7Measure23CardContainerController_panGestureRecognizer);
  if (Strong)
  {
    v12 = (void *)Strong;
    v13 = a3;
    v14 = self;
    objc_msgSend(v12, "setEnabled:", 0);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    __break(1u);
  }
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t Strong;
  void *v15;
  id v16;
  _TtC7Measure22HistoryViewCoordinator *v17;
  uint64_t v18;

  v7 = sub_10000EDC8((uint64_t *)&unk_100486260);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v12 = type metadata accessor for IndexPath(0, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0, v8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  *((_BYTE *)self + qword_100485D00) = 0;
  Strong = swift_unknownObjectUnownedLoadStrong(*(_QWORD *)((char *)self + qword_100485CE8)+ OBJC_IVAR____TtC7Measure23CardContainerController_panGestureRecognizer);
  if (Strong)
  {
    v15 = (void *)Strong;
    v16 = a3;
    v17 = self;
    objc_msgSend(v15, "setEnabled:", 1);

    sub_100036600((uint64_t)v10, (uint64_t *)&unk_100486260);
  }
  else
  {
    __break(1u);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC7Measure22HistoryViewCoordinator *v6;

  v4 = a3;
  v6 = self;
  sub_100150600((uint64_t)v6, v5);

}

- (id)copyWithZone:(void *)a3
{
  _TtC7Measure22HistoryViewCoordinator *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v8[3];
  uint64_t v9;

  v3 = self;
  sub_10014EDB4(v8);

  v4 = v9;
  v5 = sub_10000F66C(v8, v9);
  v6 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v5, v4);
  sub_10000F690(v8);
  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure22HistoryViewCoordinator *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10014EF3C(v6, v7);

  return v9 & 1;
}

@end
