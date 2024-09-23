@implementation BKDebugBoolDefaultSwitch

- (BKDebugBoolDefaultSwitch)initWithInitialValue:(BOOL)a3 synchronize:(id)a4
{
  _BOOL8 v4;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BKDebugBoolDefaultSwitch *v11;
  _QWORD v13[5];
  uint64_t v14;

  v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    v8 = swift_allocObject(&unk_100919FE8, 24, 7);
    *(_QWORD *)(v8 + 16) = v6;
    v6 = sub_100654870;
    v13[4] = sub_100654870;
    v14 = v8;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256;
    v13[2] = sub_10004DCB4;
    v13[3] = &unk_10091A000;
    v9 = _Block_copy(v13);
    v10 = v14;
    swift_retain(v8);
    *(_QWORD *)&v7 = swift_release(v10).n128_u64[0];
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v11 = -[BKDebugBoolDefaultSwitch initWithInitialValue:synchronize:action:](self, "initWithInitialValue:synchronize:action:", v4, v9, 0, v7);
  sub_10002AD00((uint64_t)v6, v8);
  _Block_release(v9);
  return v11;
}

- (BKDebugBoolDefaultSwitch)initWithInitialValue:(BOOL)a3 synchronize:(id)a4 action:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char);

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = v8;
  if (!v7)
  {
    v10 = 0;
    if (v8)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    v11 = 0;
    return (BKDebugBoolDefaultSwitch *)sub_100653CD0(a3, (uint64_t)v7, v10, (uint64_t)v12, v11);
  }
  v10 = swift_allocObject(&unk_100919FC0, 24, 7);
  *(_QWORD *)(v10 + 16) = v7;
  v7 = sub_100654870;
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v11 = swift_allocObject(&unk_100919F98, 24, 7);
  *(_QWORD *)(v11 + 16) = v9;
  v12 = sub_100654870;
  return (BKDebugBoolDefaultSwitch *)sub_100653CD0(a3, (uint64_t)v7, v10, (uint64_t)v12, v11);
}

- (BKDebugBoolDefaultSwitch)initWithDefaultsKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSString v7;
  BKDebugBoolDefaultSwitch *v8;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  v8 = -[BKDebugBoolDefaultSwitch initWithDefaults:key:action:](self, "initWithDefaults:key:action:", v6, v7, 0);

  return v8;
}

- (BKDebugBoolDefaultSwitch)initWithDefaultsKey:(id)a3 action:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(char);

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  if (v5)
  {
    v9 = swift_allocObject(&unk_100919F48, 24, 7);
    *(_QWORD *)(v9 + 16) = v5;
    v10 = sub_100654870;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  return (BKDebugBoolDefaultSwitch *)sub_100653F3C(v6, v8, (uint64_t)v10, v9);
}

- (BKDebugBoolDefaultSwitch)initWithDefaults:(id)a3 key:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  BKDebugBoolDefaultSwitch *v10;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  v8 = a3;
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v10 = -[BKDebugBoolDefaultSwitch initWithDefaults:key:action:](self, "initWithDefaults:key:action:", v8, v9, 0);

  return v10;
}

- (BKDebugBoolDefaultSwitch)initWithDefaults:(id)a3 key:(id)a4 action:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = _Block_copy(a5);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  if (v7)
  {
    v11 = swift_allocObject(&unk_100919F20, 24, 7);
    *(_QWORD *)(v11 + 16) = v7;
    v7 = sub_10049EC58;
  }
  else
  {
    v11 = 0;
  }
  return (BKDebugBoolDefaultSwitch *)sub_1006541C8(a3, v8, v10, (uint64_t)v7, v11);
}

- (BKDebugBoolDefaultSwitch)initWithCoder:(id)a3
{
  BKDebugBoolDefaultSwitch *result;

  result = (BKDebugBoolDefaultSwitch *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/DebugBoolDefaultSwitch.swift", 34, 2, 79, 0);
  __break(1u);
  return result;
}

- (void)didTapWithSender:(id)a3
{
  id v4;
  BKDebugBoolDefaultSwitch *v5;

  v4 = a3;
  v5 = self;
  sub_100654404(v4);

}

- (BKDebugBoolDefaultSwitch)initWithFrame:(CGRect)a3
{
  BKDebugBoolDefaultSwitch *result;

  result = (BKDebugBoolDefaultSwitch *)_swift_stdlib_reportUnimplementedInitializer("Books.DebugBoolDefaultSwitch", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100654650(*(void **)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___BKDebugBoolDefaultSwitch_type), *(_QWORD *)&self->type[OBJC_IVAR___BKDebugBoolDefaultSwitch_type], *(_QWORD *)&self->type[OBJC_IVAR___BKDebugBoolDefaultSwitch_type + 8], self->type[OBJC_IVAR___BKDebugBoolDefaultSwitch_type + 16]);
  sub_10002AD00(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___BKDebugBoolDefaultSwitch_action), *(_QWORD *)&self->type[OBJC_IVAR___BKDebugBoolDefaultSwitch_action]);
}

@end
