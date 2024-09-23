@implementation FinderStateTrampoline

- (void)start
{
  _TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *v3;
  uint64_t v4;
  id v5;

  sub_10000F4A0(0, (unint64_t *)&qword_1010ED8F0, OS_os_log_ptr);
  v3 = self;
  v5 = (id)static OS_os_log.default.getter(v3);
  v4 = static os_log_type_t.default.getter(v5);
  os_log(_:dso:log:type:_:)("Kickstarting daemon for finding state manager callback", 54, 2, &_mh_execute_header, v5, v4, _swiftEmptyArrayStorage);

}

- (void)enableFinderModeWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010B3FF8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10000F4A0(0, (unint64_t *)&qword_1010ED8F0, OS_os_log_ptr);
  v6 = self;
  v7 = (void *)static OS_os_log.default.getter(v6);
  v8 = static os_log_type_t.default.getter(v7);
  os_log(_:dso:log:type:_:)("Trampolining enableFinderMode", 29, 2, &_mh_execute_header, v7, v8, _swiftEmptyArrayStorage);

  sub_100030784((uint64_t)v6+ OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation, (uint64_t)v11);
  v9 = v12;
  v10 = v13;
  sub_10001AA44(v11, v12);
  (*(void (**)(uint64_t (*)(_QWORD), uint64_t, uint64_t, uint64_t))(v10 + 8))(sub_10001D1EC, v5, v9, v10);
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0(v11);

  swift_release();
}

- (void)disableFinderModeWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010B3FD0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10000F4A0(0, (unint64_t *)&qword_1010ED8F0, OS_os_log_ptr);
  v6 = self;
  v7 = (void *)static OS_os_log.default.getter(v6);
  v8 = static os_log_type_t.default.getter(v7);
  os_log(_:dso:log:type:_:)("Trampolining disableFinderMode", 30, 2, &_mh_execute_header, v7, v8, _swiftEmptyArrayStorage);

  sub_100030784((uint64_t)v6+ OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation, (uint64_t)v11);
  v9 = v12;
  v10 = v13;
  sub_10001AA44(v11, v12);
  (*(void (**)(uint64_t (*)(_QWORD), uint64_t, uint64_t, uint64_t))(v10 + 16))(sub_10001D1EC, v5, v9, v10);
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0(v11);

  swift_release();
}

- (void)fetchFinderState:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010B3FA8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100BEAD80((uint64_t)sub_10001EEDC, v5);

  swift_release();
}

- (void)stateInfoWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void (*)(void *, char), uint64_t, uint64_t, uint64_t);
  _TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010B3F58, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_100030784((uint64_t)self+ OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation, (uint64_t)v11);
  v6 = v12;
  v7 = v13;
  sub_10001AA44(v11, v12);
  v8 = swift_allocObject(&unk_1010B3F80, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_10015A53C;
  *(_QWORD *)(v8 + 24) = v5;
  v9 = *(void (**)(void (*)(void *, char), uint64_t, uint64_t, uint64_t))(v7 + 24);
  v10 = self;
  swift_retain();
  v9(sub_100BEC5B4, v8, v6, v7);
  swift_release();
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0(v11);

  swift_release();
}

- (void)setActiveCache:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1010B3F30, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_100BEB0BC(a3, (uint64_t)sub_10001D1F0, v7);

  swift_release();
}

- (_TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline)init
{
  _TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *result;

  result = (_TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.FinderStateTrampoline", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartydP33_A237235B9060AAA443FA0E26E38E988121FinderStateTrampoline_implementation));
}

@end
