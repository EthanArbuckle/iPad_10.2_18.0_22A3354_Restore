@implementation PXPhotosFileProviderRegisterConfiguration

+ (NSString)typeIdentifierLivePhotoBundlePrivate
{
  return (NSString *)(id)sub_1A7AE3734();
}

+ (NSString)typeIdentifierAutoLoopAsGIFPrivate
{
  return (NSString *)(id)sub_1A7AE3734();
}

+ (NSString)typeIdentifierLiveWallpaperPrivate
{
  return (NSString *)(id)sub_1A7AE3734();
}

+ (NSString)typeIdentifierThumbnailLowPrivate
{
  return (NSString *)(id)sub_1A7AE3734();
}

+ (NSString)typeIdentifierThumbnailStandardPrivate
{
  return (NSString *)(id)sub_1A7AE3734();
}

+ (NSString)typeIdentifierMailMovieExportPrivate
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (int64_t)usage
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_usage);
}

- (int64_t)userEncodingPolicy
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_userEncodingPolicy);
  swift_beginAccess();
  return *v2;
}

- (void)setUserEncodingPolicy:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_userEncodingPolicy);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)clientEncodingPolicy
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_clientEncodingPolicy);
  swift_beginAccess();
  return *v2;
}

- (void)setClientEncodingPolicy:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_clientEncodingPolicy);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldIncludeLocation
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_shouldIncludeLocation;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldIncludeLocation:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_shouldIncludeLocation;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldIncludeCaption
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_shouldIncludeCaption;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldIncludeCaption:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_shouldIncludeCaption;
  swift_beginAccess();
  *v4 = a3;
}

- (NSNumber)downscalingTargetDimension
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_downscalingTargetDimension);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setDownscalingTargetDimension:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_downscalingTargetDimension);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isLiveWallpaperSelection
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_isLiveWallpaperSelection;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLiveWallpaperSelection:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_isLiveWallpaperSelection;
  swift_beginAccess();
  *v4 = a3;
}

- (PXPhotosFileProviderRegisterConfiguration)initWithUsage:(int64_t)a3
{
  return (PXPhotosFileProviderRegisterConfiguration *)PhotosFileProviderRegister.Configuration.init(usage:)(a3);
}

- (PXPhotosFileProviderRegisterConfiguration)init
{
  PXPhotosFileProviderRegisterConfiguration *result;

  result = (PXPhotosFileProviderRegisterConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_downscalingTargetDimension));
  sub_1A67EC0B0((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_livePhotoContentType, (uint64_t (*)(_QWORD))sub_1A71D3518);
  sub_1A67EC0B0((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_autoLoopAsGIFContentType, (uint64_t (*)(_QWORD))sub_1A71D3518);
  sub_1A67EC0B0((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_liveWallpaperContentType, (uint64_t (*)(_QWORD))sub_1A71D3518);
  sub_1A67EC0B0((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_thumbnailLowContentType, (uint64_t (*)(_QWORD))sub_1A71D3518);
  sub_1A67EC0B0((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_thumbnailStandardContentType, (uint64_t (*)(_QWORD))sub_1A71D3518);
  sub_1A67EC0B0((uint64_t)self + OBJC_IVAR___PXPhotosFileProviderRegisterConfiguration_mailMovieExportContentType, (uint64_t (*)(_QWORD))sub_1A71D3518);
}

@end
