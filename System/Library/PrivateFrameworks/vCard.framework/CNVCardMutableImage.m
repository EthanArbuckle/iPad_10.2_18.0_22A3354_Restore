@implementation CNVCardMutableImage

- (CNVCardMutableImage)initWithData:(id)a3 cropRects:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  CNVCardMutableImage *v11;
  uint64_t v12;
  NSData *originalData;
  uint64_t v14;
  NSDictionary *originalCropRects;
  CNVCardMutableImage *v16;
  objc_super v18;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNVCardMutableImage;
  v11 = -[CNVCardImage initWithData:cropRects:size:](&v18, sel_initWithData_cropRects_size_, v9, v10, width, height);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    originalData = v11->_originalData;
    v11->_originalData = (NSData *)v12;

    v14 = objc_msgSend(v10, "copy");
    originalCropRects = v11->_originalCropRects;
    v11->_originalCropRects = (NSDictionary *)v14;

    v11->_originalSize.width = width;
    v11->_originalSize.height = height;
    v11->_CGImage = 0;
    v16 = v11;
  }

  return v11;
}

- (void)dealloc
{
  CGImage *CGImage;
  objc_super v4;

  CGImage = self->_CGImage;
  if (CGImage)
    CFRelease(CGImage);
  v4.receiver = self;
  v4.super_class = (Class)CNVCardMutableImage;
  -[CNVCardMutableImage dealloc](&v4, sel_dealloc);
}

- (void)describePropertiesWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNVCardMutableImage;
  -[CNVCardImage describePropertiesWithBuilder:](&v21, sel_describePropertiesWithBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[CNVCardMutableImage originalData](self, "originalData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ bytes"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("originalData"), v9);

  -[CNVCardMutableImage originalCropRects](self, "originalCropRects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("originalCropRects"), v11);

  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[CNVCardMutableImage originalSize](self, "originalSize");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[CNVCardMutableImage originalSize](self, "originalSize");
  objc_msgSend(v16, "numberWithDouble:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@x%@"), v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v4, "appendName:object:", CFSTR("originalSize"), v19);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNVCardImage *v4;
  void *v5;
  void *v6;
  CNVCardImage *v7;

  v4 = [CNVCardImage alloc];
  -[CNVCardMutableImage data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardMutableImage cropRects](self, "cropRects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNVCardImage initWithData:cropRects:](v4, "initWithData:cropRects:", v5, v6);

  return v7;
}

- (id)data
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__0;
  v8 = __Block_byref_object_dispose__0;
  v9 = 0;
  cn_runWithObjectLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __27__CNVCardMutableImage_data__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nts_updateRepresentation");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)isSourceLossless
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  cn_runWithObjectLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __39__CNVCardMutableImage_isSourceLossless__block_invoke(uint64_t a1)
{
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "nts_initCGImage");
  v2 = (uint64_t (*)(uint64_t, uint64_t))softLinkUTTypeConformsTo;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  v4 = getkUTTypeJPEG();
  result = v2(v3, v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result == 0;
  return result;
}

- (BOOL)hasAlphaChannel
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  cn_runWithObjectLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __38__CNVCardMutableImage_hasAlphaChannel__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "nts_initCGImage");
  result = softLinkCGImageGetAlphaInfo(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (result > 6) | (0x1Eu >> result) & 1;
  return result;
}

- (CGSize)size
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  CGSize result;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x3010000000;
  v9 = &unk_1D3C305E2;
  v10 = *MEMORY[0x1E0CB3440];
  cn_runWithObjectLock();
  v2 = v7[4];
  v3 = v7[5];
  _Block_object_dispose(&v6, 8);
  v4 = v2;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

__n128 __27__CNVCardMutableImage_size__block_invoke(uint64_t a1)
{
  __n128 result;

  objc_msgSend(*(id *)(a1 + 32), "nts_updateRepresentation");
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 24);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setSize:(CGSize)a3
{
  cn_runWithObjectLock();
}

void __31__CNVCardMutableImage_setSize___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "nts_invalidateImageSize");
  if (NSEqualSizes(*MEMORY[0x1E0CB3440], *(NSSize *)(a1 + 40))
    || (v2 = *(double *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "originalSize"), v2 >= v3)
    || (v4 = *(double *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "originalSize"), v4 >= v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "setTargetSizeValue:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTargetSizeValue:", v6);

  }
}

- (void)nts_invalidateImageSize
{
  NSData *data;
  NSDictionary *cropRects;
  NSValue *targetSizeValue;
  CGImage *CGImage;

  data = self->super._data;
  self->super._data = 0;

  cropRects = self->super._cropRects;
  self->super._cropRects = 0;

  targetSizeValue = self->_targetSizeValue;
  self->_targetSizeValue = 0;

  CGImage = self->_CGImage;
  if (CGImage)
    CFRelease(CGImage);
  self->_CGImage = 0;
  self->_attemptedCGImage = 0;
}

- (NSNumber)compressionQuality
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__0;
  v8 = __Block_byref_object_dispose__0;
  v9 = 0;
  cn_runWithObjectLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSNumber *)v2;
}

void __41__CNVCardMutableImage_compressionQuality__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)setCompressionQuality:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  cn_runWithObjectLock();

}

void __45__CNVCardMutableImage_setCompressionQuality___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[12] != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "nts_invalidateImageQuality");
    v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v3;

  }
}

- (void)nts_invalidateImageQuality
{
  NSData *data;

  data = self->super._data;
  self->super._data = 0;

}

- (id)cropRects
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__0;
  v8 = __Block_byref_object_dispose__0;
  v9 = 0;
  cn_runWithObjectLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __32__CNVCardMutableImage_cropRects__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nts_updateRepresentation");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)nts_initCGImage
{
  void *v3;
  void *v4;
  CGImage *v5;
  CGFloat Width;
  unint64_t Height;
  NSDictionary *v8;
  NSDictionary *cropRects;
  void *v10;

  if (!self->_CGImage && !self->_attemptedCGImage)
  {
    objc_msgSend((id)objc_opt_class(), "CGImageCreateWithData:maxSizeValue:", self->_originalData, self->_targetSizeValue);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    self->_attemptedCGImage = 1;
    if (v3)
    {
      v10 = v3;
      v5 = (CGImage *)objc_msgSend(v3, "imageRef");
      v4 = v10;
      self->_CGImage = v5;
      if (v5)
      {
        self->_sourceImageFormatUTI = (__CFString *)objc_msgSend(v10, "sourceImageFormatUTI");
        if (self->_targetSizeValue)
        {
          Width = (double)(unint64_t)softLinkCGImageGetWidth((uint64_t)self->_CGImage);
          Height = softLinkCGImageGetHeight((uint64_t)self->_CGImage);
          self->super._size.width = Width;
          self->super._size.height = (double)Height;
          objc_msgSend((id)objc_opt_class(), "scaleCropRects:factor:", self->_originalCropRects, Width / self->_originalSize.width);
          v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          cropRects = self->super._cropRects;
          self->super._cropRects = v8;

        }
        else
        {
          objc_storeStrong((id *)&self->super._cropRects, self->_originalCropRects);
          self->super._size = self->_originalSize;
        }
        v4 = v10;
      }
    }

  }
}

- (void)nts_updateRepresentation
{
  NSData *v3;
  NSData *data;

  -[CNVCardMutableImage nts_initCGImage](self, "nts_initCGImage");
  if (!self->super._data)
  {
    -[CNVCardMutableImage renderCGImage:](self, "renderCGImage:", self->_CGImage);
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    data = self->super._data;
    self->super._data = v3;

  }
}

+ (id)CGImageCreateWithData:(id)a3 maxSizeValue:(id)a4
{
  id v5;
  CGImageRefWithFormat *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t ThumbnailAtIndex;

  v5 = a4;
  v6 = (CGImageRefWithFormat *)softLinkCGImageSourceCreateWithData((uint64_t)a3, 0);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], getkCGImageSourceCreateThumbnailFromImageAlways());
    if (v5)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "sizeValue");
      v10 = v9;
      objc_msgSend(v5, "sizeValue");
      if (v10 >= v11)
        v12 = v10;
      else
        v12 = v11;
      objc_msgSend(v8, "numberWithDouble:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, getkCGImageSourceThumbnailMaxPixelSize());

    }
    ThumbnailAtIndex = softLinkCGImageSourceCreateThumbnailAtIndex((uint64_t)v6, 0, (uint64_t)v7);
    v6 = -[CGImageRefWithFormat initWithImage:andFormat:]([CGImageRefWithFormat alloc], "initWithImage:andFormat:", ThumbnailAtIndex, softLinkCGImageSourceGetType((uint64_t)v6));

  }
  return v6;
}

+ (id)scaleCropRects:(id)a3 factor:(double)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CNVCardMutableImage_scaleCropRects_factor___block_invoke;
  v5[3] = &__block_descriptor_48_e26___NSValue_16__0__NSValue_8l;
  v5[4] = a1;
  *(double *)&v5[5] = a4;
  objc_msgSend(a3, "_cn_mapValues:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __45__CNVCardMutableImage_scaleCropRects_factor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  NSRect v5;
  NSRect v6;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "rectValue");
  objc_msgSend(v3, "scaleRect:byFactor:");
  v6 = NSIntegralRect(v5);
  return objc_msgSend(v2, "valueWithRect:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

+ (CGRect)scaleRect:(CGRect)a3 byFactor:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = a3.origin.x * a4;
  v5 = a3.origin.y * a4;
  v6 = a3.size.width * a4;
  v7 = a3.size.height * a4;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)renderCGImage:(CGImage *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[objc_class imageWithCGImage:](getCIImageClass(), "imageWithCGImage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[objc_class context](getCIContextClass(), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      if (-[CNVCardMutableImage shouldReturnPNG](self, "shouldReturnPNG"))
      {
        objc_msgSend(v5, "PNGRepresentationOfImage:format:colorSpace:options:", v4, getkCIFormatRGBA8(), objc_msgSend(v4, "colorSpace"), v6);
      }
      else
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_compressionQuality, getkCGImageDestinationLossyCompressionQuality());
        objc_msgSend(v5, "JPEGRepresentationOfImage:colorSpace:options:", v4, objc_msgSend(v4, "colorSpace"), v6);
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldReturnPNG
{
  _BOOL4 v3;
  NSNumber *compressionQuality;
  double v5;

  if (-[CNVCardMutableImage isSourceLossless](self, "isSourceLossless")
    || (v3 = -[CNVCardMutableImage hasAlphaChannel](self, "hasAlphaChannel")))
  {
    compressionQuality = self->_compressionQuality;
    if (compressionQuality)
    {
      -[NSNumber doubleValue](compressionQuality, "doubleValue");
      LOBYTE(v3) = v5 >= 1.0;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (NSData)originalData
{
  return self->_originalData;
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (BOOL)attemptedCGImage
{
  return self->_attemptedCGImage;
}

- (NSDictionary)originalCropRects
{
  return self->_originalCropRects;
}

- (CGSize)originalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_originalSize.width;
  height = self->_originalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSValue)targetSizeValue
{
  return self->_targetSizeValue;
}

- (void)setTargetSizeValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (__CFString)sourceImageFormatUTI
{
  return self->_sourceImageFormatUTI;
}

- (void)setSourceImageFormatUTI:(__CFString *)a3
{
  self->_sourceImageFormatUTI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressionQuality, 0);
  objc_storeStrong((id *)&self->_targetSizeValue, 0);
  objc_storeStrong((id *)&self->_originalCropRects, 0);
  objc_storeStrong((id *)&self->_originalData, 0);
}

@end
