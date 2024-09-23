@implementation PXScrollDetent

- (NSString)identifier
{
  void *v2;

  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v2 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)offset
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PXScrollDetent_offset);
}

- (PXScrollDetent)initWithIdentifier:(id)a3 offset:(double)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  objc_super v10;

  v6 = sub_1A7AE3764();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___PXScrollDetent_identifier);
  *v7 = v6;
  v7[1] = v8;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___PXScrollDetent_offset) = a4;
  v10.receiver = self;
  v10.super_class = (Class)PXScrollDetent;
  return -[PXScrollDetent init](&v10, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  PXScrollDetent *v4;
  PXScrollDetent *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A7AE46D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = PXScrollDetent.isEqual(_:)((uint64_t)v8);

  sub_1A68AE2FC((uint64_t)v8);
  return v6;
}

- (NSString)debugDescription
{
  PXScrollDetent *v2;
  void *v3;

  v2 = self;
  PXScrollDetent.debugDescription.getter();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PXScrollDetent)init
{
  PXScrollDetent *result;

  result = (PXScrollDetent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
