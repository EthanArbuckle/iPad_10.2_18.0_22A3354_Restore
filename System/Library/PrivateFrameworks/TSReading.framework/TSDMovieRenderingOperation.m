@implementation TSDMovieRenderingOperation

- (TSDMovieRenderingOperation)initWithPreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 movieInfo:(id)a7 documentRoot:(id)a8 shouldClipVertically:(BOOL)a9
{
  TSDMovieRenderingOperation *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSDMovieRenderingOperation;
  v11 = -[TSDSwatchRenderingOperation initWithPreset:imageSize:imageScale:swatchFrame:documentRoot:](&v13, sel_initWithPreset_imageSize_imageScale_swatchFrame_documentRoot_, a3, a8, a4.width, a4.height, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  if (v11)
  {
    v11->mMovieInfo = (TSDMovieInfo *)a7;
    v11->mShouldClipVertically = a9;
  }
  return v11;
}

- (TSDMovieRenderingOperation)initWithPreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 movieInfo:(id)a7 documentRoot:(id)a8
{
  return -[TSDMovieRenderingOperation initWithPreset:imageSize:imageScale:swatchFrame:movieInfo:documentRoot:shouldClipVertically:](self, "initWithPreset:imageSize:imageScale:swatchFrame:movieInfo:documentRoot:shouldClipVertically:", a3, a7, a8, 0, a4.width, a4.height, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRenderingOperation;
  -[TSDSwatchRenderingOperation dealloc](&v3, sel_dealloc);
}

- (void)doWorkWithReadLock
{
  int v3;
  id v4;
  TSSPreset *mPreset;
  CGSize *p_mImageSize;
  double mImageScale;
  void *v8;

  v3 = TSUPhoneUI();
  v4 = +[TSDSwatchCache swatchCache](TSDSwatchCache, "swatchCache");
  mPreset = self->super.mPreset;
  p_mImageSize = &self->super.mImageSize;
  mImageScale = self->super.mImageScale;
  if (v3)
    v8 = (void *)objc_msgSend(v4, "imageForMoviePreset:imageSize:imageScale:swatchFrame:movieInfo:shouldClipVertically:documentRoot:", mPreset, self->mMovieInfo, self->mShouldClipVertically, self->super.mDocumentRoot, p_mImageSize->width, self->super.mImageSize.height, mImageScale, self->super.mSwatchFrame.origin.x, self->super.mSwatchFrame.origin.y, self->super.mSwatchFrame.size.width, self->super.mSwatchFrame.size.height);
  else
    v8 = (void *)objc_msgSend(v4, "imageForMoviePreset:imageSize:imageScale:movieInfo:shouldClipVertically:documentRoot:", mPreset, self->mMovieInfo, self->mShouldClipVertically, self->super.mDocumentRoot, p_mImageSize->width, self->super.mImageSize.height, mImageScale);
  -[TSDSwatchRenderingOperation deliverCGImage:](self, "deliverCGImage:", objc_msgSend(v8, "CGImage"));
}

- (TSDMovieInfo)movieInfo
{
  return (TSDMovieInfo *)objc_getProperty(self, a2, 360, 1);
}

- (void)setMovieInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

@end
