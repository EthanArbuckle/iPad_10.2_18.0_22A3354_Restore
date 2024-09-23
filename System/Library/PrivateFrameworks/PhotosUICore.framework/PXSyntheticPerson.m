@implementation PXSyntheticPerson

- (int)requestFaceCropImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 cropFactor:(int64_t)a5 style:(int64_t)a6 cacheResult:(BOOL)a7 synchronous:(BOOL)a8 resultHandler:(id)a9
{
  void (**v10)(void *, _QWORD, void *);
  PXSyntheticPerson *v11;
  void *v12;

  v10 = (void (**)(void *, _QWORD, void *))_Block_copy(a9);
  v11 = self;
  sub_1A6A3597C(MEMORY[0x1E0DEE9D8]);
  v12 = (void *)sub_1A7AE3578();
  v10[2](v10, 0, v12);
  swift_bridgeObjectRelease();

  _Block_release(v10);
  return 0;
}

- (int64_t)numberOfAssets
{
  return 42;
}

- (id)name
{
  void *v1;

  if (*(_QWORD *)(a1 + OBJC_IVAR___PXSyntheticPerson_name + 8))
  {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
    v1 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (NSString)px_localIdentifier
{
  void *v2;

  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v2 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isVerified
{
  return 1;
}

- (BOOL)isPersonModel
{
  return 1;
}

- (signed)detectionType
{
  return 1;
}

- (BOOL)px_isHuman
{
  return 1;
}

- (BOOL)px_isPet
{
  return 0;
}

- (PXSyntheticPerson)init
{
  PXSyntheticPerson *result;

  result = (PXSyntheticPerson *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
