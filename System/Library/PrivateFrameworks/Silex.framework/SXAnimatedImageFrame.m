@implementation SXAnimatedImageFrame

- (id)initWithImageSource:(void *)a3 index:(void *)a4 cache:(void *)a5 type:
{
  id v10;
  objc_super v12;

  v10 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SXAnimatedImageFrame;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      a1[2] = (id)CFRetain(a2);
      a1[4] = a3;
      objc_storeStrong(a1 + 1, a4);
      a1[5] = a5;
      -[SXAnimatedImageFrame captureFrameProperties]((uint64_t)a1);
    }
  }

  return a1;
}

- (void)captureFrameProperties
{
  const void **v1;
  const void **v2;
  double *v3;
  uint64_t v4;
  const void *v5;
  const void **v6;
  const __CFDictionary *v7;
  const void *v8;
  CFNumberRef number;
  void *value;

  if (a1)
  {
    v1 = (const void **)MEMORY[0x24BDD9598];
    v2 = (const void **)MEMORY[0x24BDD9590];
    *(_QWORD *)(a1 + 24) = 0x3FB999999999999ALL;
    v3 = (double *)(a1 + 24);
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 == 1)
      v1 = (const void **)MEMORY[0x24BDD96B0];
    v5 = *v1;
    if (v4 == 1)
      v6 = (const void **)MEMORY[0x24BDD9280];
    else
      v6 = v2;
    v7 = CGImageSourceCopyPropertiesAtIndex(*(CGImageSourceRef *)(a1 + 16), *(_QWORD *)(a1 + 32), 0);
    value = 0;
    if (CFDictionaryGetValueIfPresent(v7, v5, (const void **)&value))
    {
      if (v4 == 1)
        v8 = (const void *)*MEMORY[0x24BDD9298];
      else
        v8 = (const void *)*MEMORY[0x24BDD95B8];
      number = 0;
      if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)value, v8, (const void **)&number))
        CFDictionaryGetValueIfPresent((CFDictionaryRef)value, *v6, (const void **)&number);
      if (number)
        CFNumberGetValue(number, kCFNumberDoubleType, v3);
    }
    CFRelease(v7);
    if (*v3 < 0.011)
      *v3 = 0.1;
  }
}

- (uint64_t)index
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (id)image
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "imageForFrameIndex:", *(_QWORD *)(a1 + 32));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (void)dealloc
{
  CGImageSource *imageSource;
  objc_super v4;

  imageSource = self->_imageSource;
  if (imageSource)
  {
    CFRelease(imageSource);
    self->_imageSource = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SXAnimatedImageFrame;
  -[SXAnimatedImageFrame dealloc](&v4, sel_dealloc);
}

- (double)duration
{
  if (a1)
    return *(double *)(a1 + 24);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
