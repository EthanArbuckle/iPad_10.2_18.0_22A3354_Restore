@implementation _PXLivePhotoTrimScrubberLoupeViewImageRequest

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  double v5;
  double v6;
  char v8;

  -[_PXLivePhotoTrimScrubberLoupeViewImageRequest asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (-[_PXLivePhotoTrimScrubberLoupeViewImageRequest sourceTime](self, "sourceTime"), (v8 & 1) != 0))
  {
    -[_PXLivePhotoTrimScrubberLoupeViewImageRequest imageSize](self, "imageSize");
    v4 = v6 != *(double *)(MEMORY[0x1E0C9D820] + 8) || v5 != *MEMORY[0x1E0C9D820];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CMTime v18;
  CMTime time1;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[_PXLivePhotoTrimScrubberLoupeViewImageRequest asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[_PXLivePhotoTrimScrubberLoupeViewImageRequest videoComposition](self, "videoComposition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "videoComposition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9)
        && (-[_PXLivePhotoTrimScrubberLoupeViewImageRequest sourceTime](self, "sourceTime"),
            objc_msgSend(v5, "sourceTime"),
            !CMTimeCompare(&time1, &v18)))
      {
        -[_PXLivePhotoTrimScrubberLoupeViewImageRequest imageSize](self, "imageSize");
        v13 = v12;
        v15 = v14;
        objc_msgSend(v5, "imageSize");
        v10 = v15 == v17 && v13 == v16;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (void)setVideoComposition:(id)a3
{
  objc_storeStrong((id *)&self->_videoComposition, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sourceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setSourceTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_sourceTime.epoch = a3->var3;
  *(_OWORD *)&self->_sourceTime.value = v3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
