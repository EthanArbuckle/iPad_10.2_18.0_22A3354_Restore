@implementation PUAssetTransitionInfo

- (PUAssetTransitionInfo)init
{
  PUAssetTransitionInfo *result;
  uint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAssetTransitionInfo;
  result = -[PUAssetTransitionInfo init](&v4, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->_seekTime.value = *MEMORY[0x1E0CA2E18];
    result->_seekTime.epoch = *(_QWORD *)(v3 + 16);
  }
  return result;
}

- (PUAssetTransitionInfo)assetTransitionInfoWithModifications:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[PUAssetTransitionInfo copy](self, "copy");
  objc_msgSend(v5, "_applyConfigurationBlock:", v4);

  return (PUAssetTransitionInfo *)v5;
}

- (void)_applyConfigurationBlock:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  CGRect v7;
  CGRect v8;

  (*((void (**)(id, PUAssetTransitionInfo *))a3 + 2))(a3, self);
  -[PUAssetTransitionInfo snapshotView](self, "snapshotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || (-[PUAssetTransitionInfo image](self, "image"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[PUAssetTransitionInfo frame](self, "frame");
    if (CGRectIsEmpty(v7) || (-[PUAssetTransitionInfo frame](self, "frame"), CGRectIsNull(v8)))
    {
      PXAssertGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_error_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Transition info is required to have either snapshot view, or image, or a valid, non-empty frame.", v6, 2u);
      }

    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  PUAssetTransitionInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v4 = objc_alloc_init(PUAssetTransitionInfo);
  -[PUAssetTransitionInfo snapshotView](self, "snapshotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetTransitionInfo setSnapshotView:](v4, "setSnapshotView:", v5);

  -[PUAssetTransitionInfo image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetTransitionInfo setImage:](v4, "setImage:", v6);

  -[PUAssetTransitionInfo seekTime](self, "seekTime");
  v12 = v14;
  v13 = v15;
  -[PUAssetTransitionInfo setSeekTime:](v4, "setSeekTime:", &v12);
  -[PUAssetTransitionInfo frame](self, "frame");
  -[PUAssetTransitionInfo setFrame:](v4, "setFrame:");
  -[PUAssetTransitionInfo setAllowAutoPlay:](v4, "setAllowAutoPlay:", -[PUAssetTransitionInfo allowAutoPlay](self, "allowAutoPlay"));
  -[PUAssetTransitionInfo cornerRadius](self, "cornerRadius");
  -[PUAssetTransitionInfo setCornerRadius:](v4, "setCornerRadius:");
  -[PUAssetTransitionInfo asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetTransitionInfo setAsset:](v4, "setAsset:", v7);

  -[PUAssetTransitionInfo badgeTransitionInfos](self, "badgeTransitionInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetTransitionInfo setBadgeTransitionInfos:](v4, "setBadgeTransitionInfos:", v8);

  -[PUAssetTransitionInfo contentHelper](self, "contentHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetTransitionInfo setContentHelper:](v4, "setContentHelper:", v9);

  -[PUAssetTransitionInfo imageLayerModulator](self, "imageLayerModulator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetTransitionInfo setImageLayerModulator:](v4, "setImageLayerModulator:", v10);

  return v4;
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setSeekTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_seekTime.epoch = a3->var3;
  *(_OWORD *)&self->_seekTime.value = v3;
}

- (BOOL)allowAutoPlay
{
  return self->_allowAutoPlay;
}

- (void)setAllowAutoPlay:(BOOL)a3
{
  self->_allowAutoPlay = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSArray)badgeTransitionInfos
{
  return self->_badgeTransitionInfos;
}

- (void)setBadgeTransitionInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PUPhotoViewContentHelper)contentHelper
{
  return self->_contentHelper;
}

- (void)setContentHelper:(id)a3
{
  objc_storeStrong((id *)&self->_contentHelper, a3);
}

- (PXImageLayerModulator)imageLayerModulator
{
  return self->_imageLayerModulator;
}

- (void)setImageLayerModulator:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayerModulator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayerModulator, 0);
  objc_storeStrong((id *)&self->_contentHelper, 0);
  objc_storeStrong((id *)&self->_badgeTransitionInfos, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
}

+ (PUAssetTransitionInfo)assetTransitionInfoWithConfigurationBlock:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "_applyConfigurationBlock:", v3);

  return (PUAssetTransitionInfo *)v4;
}

@end
