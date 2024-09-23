@implementation OrientationLockHintViewModel

- (_TtC5Books28OrientationLockHintViewModel)init
{
  return (_TtC5Books28OrientationLockHintViewModel *)OrientationLockHintViewModel.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  uint64_t v9;

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel_orientationLockHandler);
  v3 = (char *)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel__currentInterfaceOrientation;
  v4 = sub_10004CFD4(&qword_1009DB8D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel__isOrientationLocked;
  v6 = sub_10004CFD4((uint64_t *)&unk_1009D4E70);
  v7 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel__isHintShown, v6);
  v8 = (char *)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel__hintRotationDegrees;
  v9 = sub_10004CFD4((uint64_t *)&unk_1009D4E40);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books28OrientationLockHintViewModel_tapActionViewListener);
}

@end
