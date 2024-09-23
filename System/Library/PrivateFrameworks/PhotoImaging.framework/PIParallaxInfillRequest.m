@implementation PIParallaxInfillRequest

- (PIParallaxInfillRequest)initWithComposition:(id)a3
{
  PIParallaxInfillRequest *v3;
  uint64_t v4;
  NUScalePolicy *scalePolicy;
  uint64_t v6;
  NUPixelFormat *pixelFormat;
  uint64_t v8;
  NUColorSpace *colorSpace;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PIParallaxInfillRequest;
  v3 = -[NURenderRequest initWithComposition:](&v11, sel_initWithComposition_, a3);
  objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
  v4 = objc_claimAutoreleasedReturnValue();
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
  v6 = objc_claimAutoreleasedReturnValue();
  pixelFormat = v3->_pixelFormat;
  v3->_pixelFormat = (NUPixelFormat *)v6;

  objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
  v8 = objc_claimAutoreleasedReturnValue();
  colorSpace = v3->_colorSpace;
  v3->_colorSpace = (NUColorSpace *)v8;

  v3->_shouldInfillForeground = 0;
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PIParallaxInfillRequest;
  v4 = -[NURenderRequest copyWithZone:](&v14, sel_copyWithZone_, a3);
  if (v4)
  {
    -[PIParallaxInfillRequest segmentationMatte](self, "segmentationMatte");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[20];
    v4[20] = v5;

    -[PIParallaxInfillRequest scalePolicy](self, "scalePolicy");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[21];
    v4[21] = v7;

    -[PIParallaxInfillRequest pixelFormat](self, "pixelFormat");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v4[22];
    v4[22] = v9;

    -[PIParallaxInfillRequest colorSpace](self, "colorSpace");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v4[23];
    v4[23] = v11;

    *((_BYTE *)v4 + 152) = -[PIParallaxInfillRequest shouldInfillForeground](self, "shouldInfillForeground");
  }
  return v4;
}

- (id)newRenderJob
{
  return -[PIParallaxInfillJob initWithParallaxInfillRequest:]([PIParallaxInfillJob alloc], "initWithParallaxInfillRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (NUImageBuffer)segmentationMatte
{
  return self->_segmentationMatte;
}

- (void)setSegmentationMatte:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationMatte, a3);
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setScalePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scalePolicy, a3);
}

- (NUPixelFormat)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(id)a3
{
  objc_storeStrong((id *)&self->_pixelFormat, a3);
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (BOOL)shouldInfillForeground
{
  return self->_shouldInfillForeground;
}

- (void)setShouldInfillForeground:(BOOL)a3
{
  self->_shouldInfillForeground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pixelFormat, 0);
  objc_storeStrong((id *)&self->_scalePolicy, 0);
  objc_storeStrong((id *)&self->_segmentationMatte, 0);
}

@end
