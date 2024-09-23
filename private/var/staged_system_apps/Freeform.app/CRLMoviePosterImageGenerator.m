@implementation CRLMoviePosterImageGenerator

- (CRLMoviePosterImageGenerator)initWithAsset:(id)a3
{
  id v5;
  CRLMoviePosterImageGenerator *v6;
  CRLMoviePosterImageGenerator *v7;
  AVAssetImageGenerator *v8;
  AVAssetImageGenerator *assetImageGenerator;
  AVAssetImageGenerator *v10;
  CMTimeEpoch v11;
  AVAssetImageGenerator *v12;
  __int128 v14;
  __int128 v15;
  CMTimeEpoch v16;
  __int128 v17;
  CMTimeEpoch epoch;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLMoviePosterImageGenerator;
  v6 = -[CRLMoviePosterImageGenerator init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    v8 = (AVAssetImageGenerator *)objc_msgSend(objc_alloc((Class)AVAssetImageGenerator), "initWithAsset:", v5);
    assetImageGenerator = v7->_assetImageGenerator;
    v7->_assetImageGenerator = v8;

    v10 = v7->_assetImageGenerator;
    v17 = *(_OWORD *)&kCMTimeZero.value;
    v14 = v17;
    epoch = kCMTimeZero.epoch;
    v11 = epoch;
    -[AVAssetImageGenerator setRequestedTimeToleranceAfter:](v10, "setRequestedTimeToleranceAfter:", &v17);
    v12 = v7->_assetImageGenerator;
    v15 = v14;
    v16 = v11;
    -[AVAssetImageGenerator setRequestedTimeToleranceBefore:](v12, "setRequestedTimeToleranceBefore:", &v15);
    -[AVAssetImageGenerator setAppliesPreferredTrackTransform:](v7->_assetImageGenerator, "setAppliesPreferredTrackTransform:", 1);
    v7->_maximumSize = CGSizeZero;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLMoviePosterImageGenerator;
  -[CRLMoviePosterImageGenerator dealloc](&v2, "dealloc");
}

- (CGSize)p_scaledSizeForRenderSize:(CGSize)result
{
  double width;
  double height;
  float v7;
  float v8;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  if (width != CGSizeZero.width || height != CGSizeZero.height)
  {
    if (width <= 0.0)
      width = result.width;
    if (height <= 0.0)
      height = result.height;
    if (width < result.width || height < result.height)
    {
      v7 = width / result.width;
      v8 = height / result.height;
      result.height = result.height * v7;
      result.width = result.width * v8;
      if (v7 >= v8)
        result.height = height;
      else
        result.width = width;
    }
  }
  return result;
}

- (CGImage)p_copyCGImageUsingAssetReaderForTime:(id *)a3
{
  void *v5;
  id v6;
  AVAsset *asset;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  opaqueCMSampleBuffer *v18;
  opaqueCMSampleBuffer *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  CMTimeRange v28;
  CMTime duration;
  CMTime start;
  CMTimeRange v31;
  id v32;
  _QWORD v33[4];
  _QWORD v34[4];

  v5 = objc_autoreleasePoolPush();
  v6 = objc_alloc((Class)AVAssetReader);
  asset = self->_asset;
  v32 = 0;
  v8 = objc_msgSend(v6, "initWithAsset:error:", asset, &v32);
  v9 = v32;
  if (v8)
  {
    start = (CMTime)*a3;
    duration = kCMTimePositiveInfinity;
    CMTimeRangeMake(&v31, &start, &duration);
    v28 = v31;
    objc_msgSend(v8, "setTimeRange:", &v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset crl_firstTrackWithMediaType:](self->_asset, "crl_firstTrackWithMediaType:", AVMediaTypeVideo));
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "naturalSize");
      -[CRLMoviePosterImageGenerator p_scaledSizeForRenderSize:](self, "p_scaledSizeForRenderSize:");
      v13 = v12;
      v33[0] = kCVPixelBufferWidthKey;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v34[0] = v14;
      v33[1] = kCVPixelBufferHeightKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
      v34[1] = v15;
      v34[2] = &off_1012CBAD0;
      v33[2] = kCVPixelBufferPixelFormatTypeKey;
      v33[3] = kCVPixelBufferMetalCompatibilityKey;
      v34[3] = &__kCFBooleanTrue;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 4));

      v17 = objc_msgSend(objc_alloc((Class)AVAssetReaderTrackOutput), "initWithTrack:outputSettings:", v11, v16);
      objc_msgSend(v8, "addOutput:", v17);
      objc_msgSend(v8, "startReading");
      v18 = (opaqueCMSampleBuffer *)objc_msgSend(v17, "copyNextSampleBuffer");
      if (v18)
      {
        v19 = v18;
        v20 = atomic_load((unsigned int *)&self->_isCancelled);
        if (!v20 && CMSampleBufferGetImageBuffer(v18))
          atomic_load((unsigned int *)&self->_isCancelled);
        CFRelease(v19);
      }
      else
      {
        v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122F7C8);
        v21 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DEC724(v21, (uint64_t)v8, v27);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122F7E8);
        v22 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePosterImageGenerator p_copyCGImageUsingAssetReaderForTime:]"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePosterImageGenerator.m"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 111, 0, "Failed to copy buffer when generating poster frame using AVAssetReader (error: %@). Falling back to AVAssetImageGenerator.", v25);

      }
      objc_msgSend(v8, "cancelReading");

    }
  }

  objc_autoreleasePoolPop(v5);
  return 0;
}

- (CGImage)p_applyPreferredTransform:(CGAffineTransform *)a3 toImage:(CGImage *)a4
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  __int128 v14;
  double width;
  double height;
  unint64_t BitsPerComponent;
  CGColorSpace *ColorSpace;
  uint32_t BitmapInfo;
  CGContext *v20;
  CGContext *v21;
  __int128 v22;
  CGImage *Image;
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;

  CGImageGetWidth(a4);
  CGImageGetHeight(a4);
  v6 = sub_10005FDDC();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v25.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v25.c = v14;
  *(_OWORD *)&v25.tx = *(_OWORD *)&a3->tx;
  *(CGFloat *)&v14 = v9;
  v26 = CGRectApplyAffineTransform(*(CGRect *)&v6, &v25);
  width = v26.size.width;
  height = v26.size.height;
  BitsPerComponent = CGImageGetBitsPerComponent(a4);
  ColorSpace = CGImageGetColorSpace(a4);
  BitmapInfo = CGImageGetBitmapInfo(a4);
  v20 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, BitsPerComponent, (unint64_t)(width * (double)BitsPerComponent), ColorSpace, BitmapInfo);
  if (!v20)
    return 0;
  v21 = v20;
  CGContextScaleCTM(v20, -1.0, -1.0);
  CGContextTranslateCTM(v21, -width, -height);
  v22 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v25.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v25.c = v22;
  *(_OWORD *)&v25.tx = *(_OWORD *)&a3->tx;
  CGContextConcatCTM(v21, &v25);
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  CGContextDrawImage(v21, v27, a4);
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  return Image;
}

- (CGImage)p_copyCGImageUsingAssetImageGeneratorForTime:(id *)a3 error:(id *)a4
{
  AVAssetImageGenerator *assetImageGenerator;
  void *v8;
  void *v9;
  void *v10;
  AVAssetImageGenerator *v11;
  __int128 v13;
  int64_t var3;

  assetImageGenerator = self->_assetImageGenerator;
  if (!assetImageGenerator)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F808);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC808();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F828);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePosterImageGenerator p_copyCGImageUsingAssetImageGeneratorForTime:error:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePosterImageGenerator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 165, 0, "invalid nil value for '%{public}s'", "_assetImageGenerator");

    assetImageGenerator = self->_assetImageGenerator;
  }
  -[AVAssetImageGenerator setMaximumSize:](assetImageGenerator, "setMaximumSize:", self->_maximumSize.width, self->_maximumSize.height);
  v11 = self->_assetImageGenerator;
  v13 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  return -[AVAssetImageGenerator copyCGImageAtTime:actualTime:error:](v11, "copyCGImageAtTime:actualTime:error:", &v13, 0, a4);
}

- (CGImage)p_copyCGImageForTime:(id *)a3 error:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  return -[CRLMoviePosterImageGenerator p_copyCGImageUsingAssetImageGeneratorForTime:error:](self, "p_copyCGImageUsingAssetImageGeneratorForTime:error:", &v5, a4);
}

- (CGImage)copyCGImageAtTime:(id *)a3 error:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  return -[CRLMoviePosterImageGenerator p_copyCGImageForTime:error:](self, "p_copyCGImageForTime:error:", &v5, a4);
}

- (id)p_coverArtDataWith:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem metadataItemsFromArray:filteredByIdentifier:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifier:", v3, AVMetadataCommonIdentifierArtwork));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem metadataItemsFromArray:filteredByIdentifier:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifier:", v3, CFSTR("caaf/aart")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataValue"));

  return v7;
}

- (CGImage)copyAssetCoverArtMetadataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGImage *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset commonMetadata](self->_asset, "commonMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMoviePosterImageGenerator p_coverArtDataWith:](self, "p_coverArtDataWith:", v5));
  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithData:](CRLImage, "imageWithData:", v6))) != 0)
  {
    v8 = v7;
    v9 = CGImageRetain((CGImageRef)objc_msgSend(v7, "CGImage"));

  }
  else
  {
    v9 = 0;
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", AVFoundationErrorDomain, -11832, 0));
  }

  return v9;
}

- (void)generateCGImageAsynchronouslyForTime:(id *)a3 completionHandler:(id)a4
{
  void (**v6)(id, CGImage *, BOOL, id);
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  CGImage *v12;
  id v13;
  _QWORD block[5];
  void (**v15)(id, CGImage *, BOOL, id);
  __int128 v16;
  int64_t var3;

  v6 = (void (**)(id, CGImage *, BOOL, id))a4;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F848);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC8AC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F868);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMoviePosterImageGenerator generateCGImageAsynchronouslyForTime:completionHandler:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMoviePosterImageGenerator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 214, 0, "invalid nil value for '%{public}s'", "handler");

    goto LABEL_14;
  }
  if (!-[AVAsset crl_containsVideoTracks](self->_asset, "crl_containsVideoTracks"))
  {
    v13 = 0;
    v12 = -[CRLMoviePosterImageGenerator copyAssetCoverArtMetadataWithError:](self, "copyAssetCoverArtMetadataWithError:", &v13);
    v10 = v13;
    v6[2](v6, v12, v12 == 0, v10);
LABEL_14:

    goto LABEL_15;
  }
  global_queue = dispatch_get_global_queue(25, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051DA0;
  block[3] = &unk_10122F890;
  block[4] = self;
  v16 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v15 = v6;
  dispatch_async(v8, block);

LABEL_15:
}

- (void)cancelAllCGImageGeneration
{
  int *p_isCancelled;
  unsigned int v3;

  p_isCancelled = &self->_isCancelled;
  do
    v3 = __ldaxr((unsigned int *)p_isCancelled);
  while (__stlxr(v3 + 1, (unsigned int *)p_isCancelled));
  -[AVAssetImageGenerator cancelAllCGImageGeneration](self->_assetImageGenerator, "cancelAllCGImageGeneration");
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  self->_maximumSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetImageGenerator, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
