@implementation VKCRemoveBackgroundVideoResult

- (VKCRemoveBackgroundVideoResult)initWithMADVideoResult:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  VKCRemoveBackgroundVideoResult *v9;
  VKCRemoveBackgroundVideoResult *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VKCRemoveBackgroundVideoResult;
  v9 = -[VKCRemoveBackgroundVideoResult init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_madResult, a3);
    objc_storeStrong((id *)&v10->_request, a4);
    v10->_canvasSize = (CGSize)*MEMORY[0x1E0C9D820];
    -[MADVideoRemoveBackgroundResult data](v10->_madResult, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCRemoveBackgroundVideoResult generateVideoSizeWithData:](v10, "generateVideoSizeWithData:", v11);

  }
  return v10;
}

- (void)generateVideoSizeWithData:(id)a3
{
  const __CFData *v4;
  CGImageSource *v5;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  const __CFData *v15;

  v4 = (const __CFData *)a3;
  if (v4)
  {
    v15 = v4;
    v5 = CGImageSourceCreateWithData(v4, 0);
    v4 = v15;
    if (v5)
    {
      v6 = CGImageSourceCopyProperties(v5, 0);
      -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCE80]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCE70]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;

        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCE68]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        -[VKCRemoveBackgroundVideoResult setCanvasSize:](self, "setCanvasSize:", v11, v14);
      }
      CFRelease(v5);

      v4 = v15;
    }
  }

}

- (UTType)utType
{
  void *v2;
  void *v3;

  -[VKCRemoveBackgroundVideoResult madResult](self, "madResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UTType *)v3;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[VKCRemoveBackgroundVideoResult madResult](self, "madResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasSize.width;
  height = self->_canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->_canvasSize = a3;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void)setAnimatedStickerScore:(id)a3
{
  objc_storeStrong((id *)&self->_animatedStickerScore, a3);
}

- (MADVideoRemoveBackgroundResult)madResult
{
  return self->_madResult;
}

- (void)setMadResult:(id)a3
{
  objc_storeStrong((id *)&self->_madResult, a3);
}

- (VKCRemoveBackgroundVideoRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_madResult, 0);
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
}

@end
