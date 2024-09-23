@implementation SwipeActionManager

- (_TtC5TeaUI18SwipeActionManager)init
{
  sub_1B13BA13C();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC5TeaUI18SwipeActionManager *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1B16402BC(v4);

  return self & 1;
}

- (void)handlePanGestureWithRecognizer:(id)a3
{
  id v4;
  _TtC5TeaUI18SwipeActionManager *v5;

  v4 = a3;
  v5 = self;
  sub_1B1640A94(v4);

}

- (void)handleTapGestureWithRecognizer:(id)a3
{
  id v4;
  _TtC5TeaUI18SwipeActionManager *v5;

  v4 = a3;
  v5 = self;
  sub_1B1641F64(v4);

}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI18SwipeActionManager_sceneStateManager);
  swift_unknownObjectWeakDestroy();
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI18SwipeActionManager_dataSource);
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI18SwipeActionManager_delegate);
  sub_1B140F6C0((uint64_t)self + OBJC_IVAR____TtC5TeaUI18SwipeActionManager_swipeState, qword_1ED1799F8, type metadata accessor for SwipeActionState);
}

@end
