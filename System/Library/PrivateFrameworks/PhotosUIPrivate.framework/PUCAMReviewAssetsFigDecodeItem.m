@implementation PUCAMReviewAssetsFigDecodeItem

- (PUCAMReviewAssetsFigDecodeItem)initWithImageURL:(id)a3 targetSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  PUCAMReviewAssetsFigDecodeItem *v8;
  objc_super v10;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PUCAMReviewAssetsFigDecodeItem;
  v8 = -[PLFigPreheatItem initWithImagePath:format:imageType:optimalSourcePixelSize:options:](&v10, sel_initWithImagePath_format_imageType_optimalSourcePixelSize_options_, v7, 10000, 0, 3, width, height);

  return v8;
}

- (id)decodeSessionOptions
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCAMReviewAssetsFigDecodeItem;
  -[PLFigPreheatItem initialDecodeSessionOptions](&v7, sel_initialDecodeSessionOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PUCAMReviewAssetsFigDecodeItem;
  -[PLFigPreheatItem decodeSessionOptions](&v6, sel_decodeSessionOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09548]);
  if (v4)
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (void)cancelRequest
{
  -[PLFigPreheatItem cancelPreheatRequestWithCompletionHandler:](self, "cancelPreheatRequestWithCompletionHandler:", 0);
}

@end
