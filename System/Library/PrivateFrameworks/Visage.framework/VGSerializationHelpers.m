@implementation VGSerializationHelpers

+ (id)createDataFromPixelBuffer:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  size_t BytesPerRow;
  id v8;
  uint64_t v9;
  char *BaseAddress;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", BytesPerRow * Height + 32));
  v9 = objc_msgSend(v8, "mutableBytes");
  *(_DWORD *)v9 = 1;
  *(_QWORD *)(v9 + 4) = Width;
  *(_QWORD *)(v9 + 12) = Height;
  *(_QWORD *)(v9 + 20) = BytesPerRow;
  *(_DWORD *)(v9 + 28) = PixelFormatType;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  if (Height)
  {
    v11 = BaseAddress;
    v12 = 0;
    v13 = v9 + 32;
    do
    {
      memcpy((void *)(v13 + v12), &v11[v12], BytesPerRow);
      v12 += BytesPerRow;
      --Height;
    }
    while (Height);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return v8;
}

+ (__CVBuffer)createPixelBufferFromData:(id)a3
{
  uint64_t v3;
  size_t v4;
  size_t v5;
  size_t v6;
  OSType v7;
  const __CFDictionary *v8;
  __CVBuffer *v9;
  size_t BytesPerRow;
  char *BaseAddress;
  char *v12;
  char *v13;
  CVPixelBufferRef pixelBuffer;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v4 = *(_QWORD *)(v3 + 4);
  v5 = *(_QWORD *)(v3 + 12);
  v6 = *(_QWORD *)(v3 + 20);
  v7 = *(_DWORD *)(v3 + 28);
  pixelBuffer = 0;
  v16 = *MEMORY[0x24BDC5668];
  v17[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (CVPixelBufferCreate(0, v4, v5, v7, v8, &pixelBuffer))
  {
    v9 = 0;
  }
  else
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    if (v5)
    {
      v12 = BaseAddress;
      v13 = (char *)(v3 + 32);
      do
      {
        memcpy(v12, v13, v6);
        v12 += BytesPerRow;
        v13 += v6;
        --v5;
      }
      while (v5);
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    v9 = pixelBuffer;
  }

  return v9;
}

+ (id)cgRectToDict:(const CGRect *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("origin");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->origin.x);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("size");
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->size.width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3->size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
