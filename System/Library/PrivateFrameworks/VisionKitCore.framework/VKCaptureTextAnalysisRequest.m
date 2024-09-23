@implementation VKCaptureTextAnalysisRequest

- (VKCaptureTextAnalysisRequest)initWithImage:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  VKCaptureTextAnalysisRequest *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "size");
  v8 = -[VKCaptureTextAnalysisRequest initWithImage:focusRect:delegate:](self, "initWithImage:focusRect:delegate:", v7, v6, VKMRectWithSize());

  return v8;
}

- (VKCaptureTextAnalysisRequest)initWithImage:(id)a3 focusRect:(CGRect)a4 delegate:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  VKCaptureTextAnalysisRequest *v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v12 = a3;
  +[VKQuad quadFromCGRect:](VKQuad, "quadFromCGRect:", x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VKCaptureTextAnalysisRequest initWithImage:focusQuad:delegate:](self, "initWithImage:focusQuad:delegate:", v12, v13, v11);

  return v14;
}

- (VKCaptureTextAnalysisRequest)initWithImage:(id)a3 focusQuad:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  VKCaptureTextAnalysisRequest *v12;
  VKCaptureTextAnalysisRequest *v13;
  VKQuad *v14;
  VKQuad *focusQuad;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VKCaptureTextAnalysisRequest;
  v12 = -[VKCaptureTextAnalysisRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    if (v10)
    {
      v14 = (VKQuad *)v10;
    }
    else
    {
      objc_msgSend(v9, "size");
      +[VKQuad quadFromCGRect:](VKQuad, "quadFromCGRect:", VKMRectWithSize());
      v14 = (VKQuad *)objc_claimAutoreleasedReturnValue();
    }
    focusQuad = v13->_focusQuad;
    v13->_focusQuad = v14;

    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (CGRect)focusRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[VKCaptureTextAnalysisRequest focusQuad](self, "focusQuad");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)requestHandler
{
  id v2;
  uint64_t v3;
  __IOSurface *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  CVPixelBufferRef pixelBufferOut;

  -[VKCaptureTextAnalysisRequest image](self, "image");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "CGImage");
  v4 = (__IOSurface *)objc_msgSend(v2, "ioSurface");
  v5 = vk_cgImagePropertyOrientationFromVKOrientation(objc_msgSend(v2, "imageOrientation"));
  if (v3)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v7 = (void *)objc_msgSend(v6, "initWithCGImage:orientation:options:", v3, v5, MEMORY[0x1E0C9AA70]);
  }
  else if (v4)
  {
    pixelBufferOut = 0;
    v7 = 0;
    if (!CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0, &pixelBufferOut))
    {
      v8 = objc_alloc(MEMORY[0x1E0CEDF70]);
      v7 = (void *)objc_msgSend(v8, "initWithCVPixelBuffer:orientation:options:", pixelBufferOut, v5, MEMORY[0x1E0C9AA70]);
    }
    CVBufferRelease(pixelBufferOut);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VKCaptureTextAnalysisRequest *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  VKCaptureTextAnalysisRequest *v15;

  v4 = [VKCaptureTextAnalysisRequest alloc];
  -[VKCaptureTextAnalysisRequest image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCaptureTextAnalysisRequest focusRect](self, "focusRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[VKCaptureTextAnalysisRequest delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[VKCaptureTextAnalysisRequest initWithImage:focusRect:delegate:](v4, "initWithImage:focusRect:delegate:", v5, v14, v7, v9, v11, v13);

  return v15;
}

- (BOOL)saveAssetsToFeedbackAttachmentsFolder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[VKCaptureTextAnalysisRequest image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vk_PNGData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("RequestAsset.png"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v8, "writeToURL:options:error:", v9, 2, a4);
  return (char)a4;
}

- (UIImage)image
{
  return self->_image;
}

- (VKQuad)focusQuad
{
  return self->_focusQuad;
}

- (VKCaptureTextAnalysisRequestDelegate)delegate
{
  return (VKCaptureTextAnalysisRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusQuad, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
