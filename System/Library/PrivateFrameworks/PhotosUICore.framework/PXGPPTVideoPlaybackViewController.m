@implementation PXGPPTVideoPlaybackViewController

- (PXGPPTVideoPlaybackViewController)initWithAssetsDataSource:(id)a3
{
  id v5;
  PXGStackLayout *v6;
  PXGPPTVideoPlaybackViewController *v7;
  PXGPPTVideoPlaybackViewController *v8;
  uint64_t v9;
  UIColor *spriteColor;
  dispatch_queue_t v11;
  OS_dispatch_queue *pixelBufferSources_queue;
  uint64_t v13;
  NSMapTable *pixelBufferSourcesByDisplayAsset;
  objc_super v16;

  v5 = a3;
  v6 = objc_alloc_init(PXGStackLayout);
  v16.receiver = self;
  v16.super_class = (Class)PXGPPTVideoPlaybackViewController;
  v7 = -[PXGPPTViewController initWithLayout:](&v16, sel_initWithLayout_, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataSource, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
    v9 = objc_claimAutoreleasedReturnValue();
    spriteColor = v8->_spriteColor;
    v8->_spriteColor = (UIColor *)v9;

    v8->_numberOfColumns = 4;
    v11 = dispatch_queue_create("com.apple.photos._pixelBufferSources_queue", 0);
    pixelBufferSources_queue = v8->_pixelBufferSources_queue;
    v8->_pixelBufferSources_queue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    pixelBufferSourcesByDisplayAsset = v8->_pixelBufferSourcesByDisplayAsset;
    v8->_pixelBufferSourcesByDisplayAsset = (NSMapTable *)v13;

    -[PXGStackLayout setAxis:](v6, "setAxis:", 1);
    -[PXGStackLayout setInterlayoutSpacing:](v6, "setInterlayoutSpacing:", 10.0);
    -[PXGStackLayout insertSublayoutProvider:inRange:](v6, "insertSublayoutProvider:inRange:", v8, 0, 10);
  }

  return v8;
}

- (PXGPPTVideoPlaybackViewController)initWithLayout:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGPPTVideoPlaybackViewController.m"), 53, CFSTR("%s is not available as initializer"), "-[PXGPPTVideoPlaybackViewController initWithLayout:]");

  abort();
}

- (void)viewDidLoad
{
  PXFileBackedUIMediaProvider *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGPPTVideoPlaybackViewController;
  -[PXGPPTViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_alloc_init(PXFileBackedUIMediaProvider);
  -[PXGPPTViewController gridView](self, "gridView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerAllTextureProvidersWithMediaProvider:namedImagesBundle:", v3, 0);

}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result
{
  double v5;

  v5 = result.width * 0.25 * (double)((((a4 << 63 >> 63) & 0x14) + self->_numberOfColumns) / self->_numberOfColumns);
  result.height = v5;
  return result;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  char v4;
  PXGGridLayout *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a4;
  v6 = objc_alloc_init(PXGGridLayout);
  -[PXGLayout setContentSource:](v6, "setContentSource:", self);
  -[PXGGridLayout setNumberOfColumns:](v6, "setNumberOfColumns:", self->_numberOfColumns);
  if ((v4 & 1) != 0)
    v7 = 21;
  else
    v7 = 1;
  if ((v4 & 1) != 0)
    v8 = 5;
  else
    v8 = 2;
  -[PXGItemsLayout setNumberOfItems:](v6, "setNumberOfItems:", v7);
  -[PXGGridLayout setMediaKind:](v6, "setMediaKind:", v8);
  return v6;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_spriteColor;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  uint64_t v5;
  PXAssetsDataSource *dataSource;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v5 = -[PXAssetsDataSource identifier](self->_dataSource, "identifier", a3, a4);
  dataSource = self->_dataSource;
  v8 = v5;
  v9 = xmmword_1A7C0C1F0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXAssetsDataSource assetsInSectionIndexPath:](dataSource, "assetsInSectionIndexPath:", &v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  return 2;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferSourcesByDisplayAsset, 0);
  objc_storeStrong((id *)&self->_pixelBufferSources_queue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_spriteColor, 0);
}

@end
