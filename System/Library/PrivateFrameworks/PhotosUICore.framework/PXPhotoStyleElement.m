@implementation PXPhotoStyleElement

- (id)copyWithZone:(void *)a3
{
  PXPhotoStyleElement *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  PhotoStyleElement.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1A7AE4D9C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (BOOL)hasNonDefaultValues
{
  PXPhotoStyleElement *v2;
  char v3;
  char v4;

  v2 = self;
  PhotoStyleElement.hasNonDefaultValues.getter();
  v4 = v3;

  return v4 & 1;
}

- (void)resetToDefaultValues
{
  PXPhotoStyleElement *v2;

  v2 = self;
  PhotoStyleElement.resetToDefaultValues()();

}

- (PXPhotoStyleElement)init
{
  PXPhotoStyleElement *result;

  result = (PXPhotoStyleElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  sub_1A6AEC314(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PXPhotoStyleElement_semanticStyle), *(_QWORD *)&self->id[OBJC_IVAR___PXPhotoStyleElement_semanticStyle], *(void **)&self->id[OBJC_IVAR___PXPhotoStyleElement_semanticStyle + 8]);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PXPhotoStyleElement__contentVersion;
  sub_1A6AEEBA8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (NSString)defaultName
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle;
  swift_beginAccess();
  if (*((_QWORD *)v2 + 1))
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (double)tone
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle);
  swift_beginAccess();
  if (*((_QWORD *)v2 + 1))
    return v2[3];
  else
    return 0.0;
}

- (double)color
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle);
  swift_beginAccess();
  if (*((_QWORD *)v2 + 1))
    return v2[4];
  else
    return 0.0;
}

- (double)intensity
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle);
  swift_beginAccess();
  if (*((_QWORD *)v2 + 1))
    return v2[5];
  else
    return 1.0;
}

- (NSString)cast
{
  char *v2;
  id *v3;

  v2 = (char *)self + OBJC_IVAR___PXPhotoStyleElement_semanticStyle;
  swift_beginAccess();
  if (*((_QWORD *)v2 + 1))
    v3 = (id *)(v2 + 16);
  else
    v3 = (id *)MEMORY[0x1E0D71428];
  return (NSString *)*v3;
}

- (double)defaultTone
{
  PXPhotoStyleElement *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1A6AEE3DC();
  v4 = v3;

  return v4;
}

- (double)defaultColor
{
  PXPhotoStyleElement *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1A6AEE56C();
  v4 = v3;

  return v4;
}

- (double)defaultIntensity
{
  PXPhotoStyleElement *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1A6AEE700();
  v4 = v3;

  return v4;
}

- (BOOL)updateWithTone:(double)a3 color:(double)a4 intensity:(double)a5
{
  PXPhotoStyleElement *v8;
  BOOL v9;

  v8 = self;
  v9 = sub_1A6AEE85C(a3, a4, a5);

  return v9;
}

@end
