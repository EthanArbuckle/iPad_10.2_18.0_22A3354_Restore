@implementation LocationManagerDelegateTrampoline

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t Strong;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline *v17;
  uint64_t v18;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000F4A0(0, (unint64_t *)&qword_1010F89C0, CLLocation_ptr);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v10);
  Strong = swift_weakLoadStrong((char *)self+ OBJC_IVAR____TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline_target);
  if (Strong)
  {
    v13 = Strong;
    v14 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
    v15 = (_QWORD *)swift_allocObject(&unk_1010AFDC0, 48, 7);
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v13;
    v15[5] = v11;
    v16 = a3;
    v17 = self;
    swift_bridgeObjectRetain(v11);
    sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1011168C8, (uint64_t)v15);
    swift_release();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  _TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline *v16;
  uint64_t v17;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = swift_weakLoadStrong((char *)self+ OBJC_IVAR____TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline_target);
  if (Strong)
  {
    v11 = Strong;
    v12 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
    v13 = (_QWORD *)swift_allocObject(&unk_1010AFD98, 48, 7);
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = v11;
    v13[5] = a4;
    v14 = a4;
    v15 = a3;
    v16 = self;
    sub_100691AC0((uint64_t)v9, (uint64_t)&unk_1011168A8, (uint64_t)v13);
    swift_release();

  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline *v13;
  uint64_t v14;

  v5 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = swift_weakLoadStrong((char *)self+ OBJC_IVAR____TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline_target);
  if (Strong)
  {
    v9 = Strong;
    v10 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject(&unk_1010AFD70, 40, 7);
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    v12 = a3;
    v13 = self;
    sub_100691AC0((uint64_t)v7, (uint64_t)&unk_101116898, (uint64_t)v11);
    swift_release();

  }
}

- (_TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_weakInit((char *)self+ OBJC_IVAR____TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline_target, 0);
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[LocationManagerDelegateTrampoline init](&v5, "init");
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self+ OBJC_IVAR____TtC12searchpartydP33_59DB3DB2CFFD0A5DD2F04F14E73C8D1533LocationManagerDelegateTrampoline_target);
}

@end
