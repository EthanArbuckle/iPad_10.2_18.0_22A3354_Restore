@implementation VFXREREnderer

- (MTLDevice)device
{
  return (MTLDevice *)(id)swift_unknownObjectRetain();
}

- (void)setDevice:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREREnderer_device) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (VFXREREnderer)init
{
  VFXREREnderer *result;

  result = (VFXREREnderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
