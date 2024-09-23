@implementation SCNPatchDebugger.SKDebugRenderer

- (_TtCC7Measure16SCNPatchDebugger15SKDebugRenderer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100017F94();
}

- (void)dealloc
{
  _TtCC7Measure16SCNPatchDebugger15SKDebugRenderer *v2;

  v2 = self;
  SCNPatchDebugger.SKDebugRenderer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCC7Measure16SCNPatchDebugger15SKDebugRenderer_textureBgColor));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCC7Measure16SCNPatchDebugger15SKDebugRenderer_tracker));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7Measure16SCNPatchDebugger15SKDebugRenderer_drawingTexture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7Measure16SCNPatchDebugger15SKDebugRenderer_drawingNode));
}

- (_TtCC7Measure16SCNPatchDebugger15SKDebugRenderer)init
{
  _TtCC7Measure16SCNPatchDebugger15SKDebugRenderer *result;

  result = (_TtCC7Measure16SCNPatchDebugger15SKDebugRenderer *)_swift_stdlib_reportUnimplementedInitializer("Measure.SKDebugRenderer", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
