@implementation PXPeoplePetsHomeVisibilitySource

- (unint64_t)visibility
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___PXPeoplePetsHomeVisibilitySource_visibility);
  swift_beginAccess();
  return *v2;
}

- (void)setVisibility:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___PXPeoplePetsHomeVisibilitySource_visibility);
  swift_beginAccess();
  *v4 = a3;
}

- (PXPeoplePetsHomeVisibilitySource)initWithPhotoLibrary:(id)a3
{
  return (PXPeoplePetsHomeVisibilitySource *)sub_1A6A447E4(a3);
}

- (PXPeoplePetsHomeVisibilitySource)init
{
  PXPeoplePetsHomeVisibilitySource *result;

  result = (PXPeoplePetsHomeVisibilitySource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4;
  PXPeoplePetsHomeVisibilitySource *v5;

  v4 = a3;
  v5 = self;
  PeoplePetsHomeVisibilitySource.photoLibraryDidChange(onMainQueue:)((PHChange)v4);

}

@end
