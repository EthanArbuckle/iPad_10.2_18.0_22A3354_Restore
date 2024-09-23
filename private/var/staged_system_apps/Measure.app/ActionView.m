@implementation ActionView

- (_TtC7Measure10ActionView)initWithCoder:(id)a3
{
  id v5;
  _TtC7Measure10ActionView *result;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure10ActionView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC7Measure10ActionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/ActionView.swift", 24, 2, 45, 0);
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC7Measure10ActionView *v11;

  v7 = sub_10001AD70();
  v8 = sub_10001ADAC();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_10001A954(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_10001AB20(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesMoved_withEvent_, sub_100019BBC);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_10001AB20(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_, sub_100019CA4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_10001AB20(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_, sub_100019CA4);
}

- (_TtC7Measure10ActionView)initWithFrame:(CGRect)a3
{
  _TtC7Measure10ActionView *result;

  result = (_TtC7Measure10ActionView *)_swift_stdlib_reportUnimplementedInitializer("Measure.ActionView", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001ADF4((uint64_t)self + OBJC_IVAR____TtC7Measure10ActionView_delegate);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC7Measure10ActionView_shouldPreventManipulatingPoint]);
}

@end
