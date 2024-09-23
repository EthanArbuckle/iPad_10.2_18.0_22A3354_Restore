@implementation WaveformIndicatorView

- (_TtC23ShelfKitCollectionViews21WaveformIndicatorView)init
{
  return (_TtC23ShelfKitCollectionViews21WaveformIndicatorView *)sub_212178();
}

- (_TtC23ShelfKitCollectionViews21WaveformIndicatorView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC23ShelfKitCollectionViews21WaveformIndicatorView *result;

  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21WaveformIndicatorView_state;
  v6 = enum case for WaveformState.hidden(_:);
  v7 = type metadata accessor for WaveformState(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  v8 = a3;

  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease(0xE000000000000000);
  result = (_TtC23ShelfKitCollectionViews21WaveformIndicatorView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/WaveformIndicatorView.swift", 51, 2, 74, 0);
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  sub_212788(self, (uint64_t)a2, (const char **)&selRef_didMoveToWindow);
}

- (void)didMoveToSuperview
{
  sub_212788(self, (uint64_t)a2, (const char **)&selRef_didMoveToSuperview);
}

- (_TtC23ShelfKitCollectionViews21WaveformIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews21WaveformIndicatorView *result;

  result = (_TtC23ShelfKitCollectionViews21WaveformIndicatorView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.WaveformIndicatorView", 45, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21WaveformIndicatorView_state;
  v4 = type metadata accessor for WaveformState(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21WaveformIndicatorView_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WaveformIndicatorView_contentView));
}

@end
