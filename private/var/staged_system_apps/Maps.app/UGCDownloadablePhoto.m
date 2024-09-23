@implementation UGCDownloadablePhoto

- (UGCDownloadablePhoto)initWithGEORPEnrichmentImage:(id)a3
{
  id v5;
  UGCDownloadablePhoto *v6;
  UGCDownloadablePhoto *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UGCDownloadablePhoto;
  v6 = -[UGCDownloadablePhoto init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_enrichmentImage, a3);

  return v7;
}

- (UIImage)image
{
  return 0;
}

- (NSURL)url
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)NSURL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPEnrichmentImage url](self->_enrichmentImage, "url"));
  v5 = objc_msgSend(v3, "initWithString:", v4);

  return (NSURL *)v5;
}

- (NSString)identifier
{
  return (NSString *)-[GEORPEnrichmentImage imageId](self->_enrichmentImage, "imageId");
}

- (BOOL)needsToBeDownloaded
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  char isKindOfClass;
  unsigned __int8 v7;

  v4 = a3;
  v5 = objc_opt_class(UGCDownloadablePhoto);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  v7 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
    v7 = -[GEORPEnrichmentImage isEqual:](self->_enrichmentImage, "isEqual:", v4[1]);

  return v7;
}

- (NSString)author
{
  return 0;
}

- (NSString)caption
{
  return 0;
}

- (NSURL)licenseURL
{
  return 0;
}

- (BOOL)displayFullScreenPhotoGallery
{
  return 0;
}

- (BOOL)businessProvided
{
  return 0;
}

- (NSString)backgroundJoeColor
{
  return 0;
}

- (BOOL)highQuality
{
  return 0;
}

- (GEOMapItemPhotosAttribution)attribution
{
  return 0;
}

- (NSDate)dateCreated
{
  return 0;
}

- (NSString)licenseDescription
{
  return 0;
}

- (double)sizeRatio
{
  return 0.0;
}

- (BOOL)isBackgroundJoeColorCurated
{
  return 0;
}

- (BOOL)useGallery
{
  return 0;
}

- (id)bestPhotoForFrameSize:(CGSize)a3 displayScale:(double)a4 options:(id)a5
{
  double height;
  double width;
  UGCUserUploadedPhotoInfo *v8;
  void *v9;
  UGCUserUploadedPhotoInfo *v10;

  height = a3.height;
  width = a3.width;
  v8 = [UGCUserUploadedPhotoInfo alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCDownloadablePhoto url](self, "url"));
  v10 = -[UGCUserUploadedPhotoInfo initWithURL:size:](v8, "initWithURL:size:", v9, width, height);

  return v10;
}

- (id)bestPhotoForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  double height;
  double width;
  UGCUserUploadedPhotoInfo *v7;
  void *v8;
  UGCUserUploadedPhotoInfo *v9;

  height = a3.height;
  width = a3.width;
  v7 = [UGCUserUploadedPhotoInfo alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCDownloadablePhoto url](self, "url"));
  v9 = -[UGCUserUploadedPhotoInfo initWithURL:size:](v7, "initWithURL:size:", v8, width, height);

  return v9;
}

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  double height;
  double width;
  UGCUserUploadedPhotoInfo *v7;
  void *v8;
  UGCUserUploadedPhotoInfo *v9;

  height = a3.height;
  width = a3.width;
  v7 = [UGCUserUploadedPhotoInfo alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCDownloadablePhoto url](self, "url"));
  v9 = -[UGCUserUploadedPhotoInfo initWithURL:size:](v7, "initWithURL:size:", v8, width, height);

  return v9;
}

- (id)largestPhoto
{
  UGCUserUploadedPhotoInfo *v3;
  void *v4;
  UGCUserUploadedPhotoInfo *v5;

  v3 = [UGCUserUploadedPhotoInfo alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UGCDownloadablePhoto url](self, "url"));
  v5 = -[UGCUserUploadedPhotoInfo initWithURL:size:](v3, "initWithURL:size:", v4, CGSizeZero.width, CGSizeZero.height);

  return v5;
}

- (BOOL)needsObfuscationWhenRenderedInFullScreen
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichmentImage, 0);
}

@end
