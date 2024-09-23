@implementation MicaLayerView

- (_TtC5Books13MicaLayerView)initWithCoder:(id)a3
{
  _TtC5Books13MicaLayerView *result;

  result = (_TtC5Books13MicaLayerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/MicaView.swift", 20, 2, 129, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books13MicaLayerView_micaSize);
  v3 = *(double *)&self->mica[OBJC_IVAR____TtC5Books13MicaLayerView_micaSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC5Books13MicaLayerView)initWithFrame:(CGRect)a3
{
  _TtC5Books13MicaLayerView *result;

  result = (_TtC5Books13MicaLayerView *)_swift_stdlib_reportUnimplementedInitializer("Books.MicaLayerView", 19, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->mica[OBJC_IVAR____TtC5Books13MicaLayerView_mica]);

}

- (void)micaPlayerDidChangePlaybackTime:(id)a3
{
  id v5;
  _TtC5Books13MicaLayerView *v6;

  v5 = a3;
  v6 = self;
  sub_1005A3D34(a3);

}

@end
