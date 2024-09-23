@implementation PXPhotosSearchCollectionSectionProvider

- (PXPhotosSearchCollectionSectionProvider)initWithPhotoLibrary:(id)a3
{
  id v3;
  PXPhotosSearchCollectionSectionProvider *v4;

  v3 = a3;
  v4 = (PXPhotosSearchCollectionSectionProvider *)sub_1A6FA4DA0(v3);

  return v4;
}

- (PXPhotosSearchCollectionSectionProvider)init
{
  PXPhotosSearchCollectionSectionProvider *result;

  result = (PXPhotosSearchCollectionSectionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___PXPhotosSearchCollectionSectionProvider_badgesModifier));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXPhotosSearchCollectionSectionProvider_promotedRankedCollection));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
