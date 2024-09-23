@implementation _PXGTextureStreamingSession

- (_PXGTextureStreamingSession)initWithDisplayAsset:(id)a3 presentationController:(id)a4 pixelBufferSource:(id)a5 pixelBufferSourcesProvider:(id)a6 adjustment:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _PXGTextureStreamingSession *v17;
  _PXGTextureStreamingSession *v18;
  NSMutableIndexSet *v19;
  NSMutableIndexSet *textureRequestIDs;
  id v22;
  objc_super v23;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_PXGTextureStreamingSession;
  v17 = -[_PXGTextureStreamingSession init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayAsset, a3);
    objc_storeStrong((id *)&v18->_presentationController, a4);
    objc_storeStrong((id *)&v18->_pixelBufferSource, a5);
    objc_storeStrong((id *)&v18->_pixelBufferSourcesProvider, a6);
    v19 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    textureRequestIDs = v18->_textureRequestIDs;
    v18->_textureRequestIDs = v19;

    objc_storeStrong((id *)&v18->_displayAdjustment, a7);
  }

  return v18;
}

- (NSIndexSet)textureRequestIDs
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_textureRequestIDs, "copy");
}

- (void)addTextureRequestID:(int)a3
{
  -[NSMutableIndexSet addIndex:](self->_textureRequestIDs, "addIndex:", a3);
}

- (void)removeTextureRequestID:(int)a3
{
  -[NSMutableIndexSet removeIndex:](self->_textureRequestIDs, "removeIndex:", a3);
}

- (void)removeTextureRequestIDs:(id)a3
{
  -[NSMutableIndexSet removeIndexes:](self->_textureRequestIDs, "removeIndexes:", a3);
}

- (void)setPixelBufferPool:(__CVPixelBufferPool *)a3
{
  __CVPixelBufferPool *pixelBufferPool;

  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool != a3)
  {
    CVPixelBufferPoolRelease(pixelBufferPool);
    self->_pixelBufferPool = a3;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[_PXGTextureStreamingSession setPixelBufferPool:](self, "setPixelBufferPool:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_PXGTextureStreamingSession;
  -[_PXGTextureStreamingSession dealloc](&v3, sel_dealloc);
}

- (PXGDisplayAssetVideoPresentationController)presentationController
{
  return self->_presentationController;
}

- (PXGDisplayAssetPixelBufferSource)pixelBufferSource
{
  return self->_pixelBufferSource;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (PXGDisplayAssetAdjustment)displayAdjustment
{
  return self->_displayAdjustment;
}

- (NSDate)firstPixelBufferDisplayDate
{
  return self->_firstPixelBufferDisplayDate;
}

- (void)setFirstPixelBufferDisplayDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (__CVPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (PXGDisplayAssetPixelBufferSourcesProvider)pixelBufferSourcesProvider
{
  return self->_pixelBufferSourcesProvider;
}

- (void)setPixelBufferSourcesProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pixelBufferSourcesProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferSourcesProvider, 0);
  objc_storeStrong((id *)&self->_firstPixelBufferDisplayDate, 0);
  objc_storeStrong((id *)&self->_displayAdjustment, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_pixelBufferSource, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_textureRequestIDs, 0);
}

@end
