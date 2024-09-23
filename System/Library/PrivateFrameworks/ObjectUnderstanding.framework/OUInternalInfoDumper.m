@implementation OUInternalInfoDumper

- (OUInternalInfoDumper)init
{
  OUInternalInfoDumper *v2;
  OUInternalInfoDumper *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *save_queue;
  dispatch_group_t v6;
  OS_dispatch_group *save_group;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)OUInternalInfoDumper;
  v2 = -[OUInternalInfoDumper init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_enableARFrameDump = 16843009;
    v2->_maxKeyframeFPS = 3.0;
    v4 = dispatch_queue_create("ObjectUnderstanding.InternalInfoDumper", 0);
    save_queue = v3->_save_queue;
    v3->_save_queue = (OS_dispatch_queue *)v4;

    v6 = dispatch_group_create();
    save_group = v3->_save_group;
    v3->_save_group = (OS_dispatch_group *)v6;

  }
  return v3;
}

- (void)createDirectory:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  char v8;

  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v8);

  if (v8)
    v6 = v5;
  else
    v6 = 0;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  }
}

- (void)setUpInternalDumpWithLogDir:(id)a3 enable:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_loggingDirectory, a3);
  v6 = v8;
  self->_enableLiveDump = 1;
  if (v8)
  {
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Live"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OUInternalInfoDumper createDirectory:](self, "createDirectory:", v7);

    v6 = v8;
  }

}

- (void)logKeyFrame:(id)a3 WithSkip:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  NSDate *v11;
  NSDate *lastKeyframeTime;
  void *v13;
  OS_dispatch_group *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSObject *save_queue;
  id v18;
  NSMutableDictionary *v19;
  id v20;
  OS_dispatch_group *v21;
  void *v22;
  void *v23;
  OUFrame *lastARFrame;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  _QWORD block[4];
  id v31;
  NSMutableDictionary *v32;
  id v33;
  OUInternalInfoDumper *v34;
  OS_dispatch_group *v35;

  v4 = a4;
  v6 = a3;
  NSLog(CFSTR("log key frame"));
  if (self->_enableLiveDump)
  {
    if (!v4
      || self->_maxKeyframeFPS != 0.0
      && (!self->_lastKeyframeTime
       || (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
           v7 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(v7, "timeIntervalSinceDate:", self->_lastKeyframeTime),
           v9 = v8,
           v10 = 1.0 / self->_maxKeyframeFPS,
           v7,
           v9 >= v10)))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastKeyframeTime = self->_lastKeyframeTime;
      self->_lastKeyframeTime = v11;

      -[NSString stringByAppendingPathComponent:](self->_loggingDirectory, "stringByAppendingPathComponent:", CFSTR("Live"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_save_group;
      v15 = (void *)objc_msgSend(v6, "copy", v13);
      v16 = self->_keyframeMeta;
      dispatch_group_enter((dispatch_group_t)v14);
      save_queue = self->_save_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__OUInternalInfoDumper_logKeyFrame_WithSkip___block_invoke;
      block[3] = &unk_24F2431B8;
      v18 = v15;
      v31 = v18;
      v19 = v16;
      v32 = v19;
      v20 = v13;
      v33 = v20;
      v34 = self;
      v21 = v14;
      v35 = v21;
      dispatch_async(save_queue, block);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("skipped"));

      lastARFrame = self->_lastARFrame;
      if (lastARFrame)
      {
        v25 = (void *)MEMORY[0x24BDD16E0];
        -[OUFrame timestamp](lastARFrame, "timestamp");
        objc_msgSend(v25, "numberWithDouble:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("timestamp"));

        v27 = (void *)MEMORY[0x24BDD16E0];
        -[OUFrame timestamp](self->_lastARFrame, "timestamp");
        objc_msgSend(v27, "numberWithDouble:", v28 - self->_firstARFrameTime);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("video_timestamp"));

      }
      else
      {
        objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_24F24AD38, CFSTR("timestamp"));
        objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_24F24AD38, CFSTR("video_timestamp"));
      }
      -[NSMutableArray addObject:](self->_keyframesDebug, "addObject:", v22);
      -[OUInternalInfoDumper dumpLastARFrameImage](self, "dumpLastARFrameImage");

    }
  }

}

void __45__OUInternalInfoDumper_logKeyFrame_WithSkip___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  OUKeyframeMetaExtend *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE __dst[480];
  _OWORD v39[30];
  _BYTE __src[480];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  const __CFString *v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v42 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v6, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v9, "samplePoints");
        else
          memset(v39, 0, sizeof(v39));
        v10 = is_sample_points_equal((uint64_t)v39, v6, (uint64_t)__src);
        if (!v9
          || ((v11 = v10, v12 = objc_msgSend(v9, "size"), v12 == objc_msgSend(v6, "count")) ? (v13 = v11) : (v13 = 0),
              (v13 & 1) == 0))
        {
          v14 = objc_alloc_init(OUKeyframeMetaExtend);
          -[OUKeyframeMeta setSize:](v14, "setSize:", objc_msgSend(v6, "count"));
          objc_msgSend(v6, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[OUKeyframeMeta setIdentifier:](v14, "setIdentifier:", v15);

          objc_msgSend(v6, "cameraPose");
          -[OUKeyframeMeta setCameraPose:](v14, "setCameraPose:");
          objc_msgSend(v6, "timestamp");
          -[OUKeyframeMeta setTimestamp:](v14, "setTimestamp:");
          memcpy(__dst, __src, sizeof(__dst));
          -[OUKeyframeMetaExtend setSamplePoints:](v14, "setSamplePoints:", __dst);
          v16 = *(void **)(a1 + 40);
          objc_msgSend(v6, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v17);

          objc_msgSend(v33, "addObject:", v6);
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v3);
  }

  v18 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v18, "setDateFormat:", CFSTR("MM_dd_yyyy_HH_mm_ss_SSS"));
  v19 = (void *)MEMORY[0x24BDD17C8];
  v20 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromDate:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@/%@_fp_input.plist"), v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = v33;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v29, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, v30);

      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v26);
  }

  v45 = CFSTR("keyframes");
  OUKeyframeSequenceToDictionary(v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 56), "createDirectory:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v32, "writeToFile:atomically:", v23, 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

- (void)setFirstARFrame:(id)a3
{
  id v4;
  double v5;
  id v6;

  v4 = a3;
  if (self->_enableLiveDump && self->_firstARFrameTime == 0.0)
  {
    v6 = v4;
    objc_msgSend(v4, "timestamp");
    self->_firstARFrameTime = v5;
    v4 = v6;
  }

}

+ (id)serailizeARFrameMeta:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "timestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("timestamp"));

  objc_msgSend(v3, "sceneCamera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transform");
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v28 = v11;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v25, 64);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("cameraTransform"));

  objc_msgSend(v3, "sceneCamera", 0, 0, 0, 0, 0, 0, v25, v26, v27, v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "intrinsics");
  DWORD2(v22) = v14;
  DWORD2(v23) = v15;
  *(_QWORD *)&v22 = v16;
  *(_QWORD *)&v23 = v17;
  DWORD2(v24) = v18;
  *(_QWORD *)&v24 = v19;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v22, 48);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("intrinsics"), v22, v23, v24);

  return v4;
}

- (void)setLastARFrame:(__n128)a3 withCameraPose:(__n128)a4
{
  id v9;
  id v10;

  v9 = a7;
  if (*(_BYTE *)(a1 + 177))
  {
    v10 = v9;
    objc_storeStrong((id *)(a1 + 104), a7);
    v9 = v10;
    *(__n128 *)(a1 + 112) = a2;
    *(__n128 *)(a1 + 128) = a3;
    *(__n128 *)(a1 + 144) = a4;
    *(__n128 *)(a1 + 160) = a5;
  }

}

- (id)encodePng:(__CVBuffer *)a3
{
  __CFData *v4;
  CGImageDestination *v5;
  void *BaseAddress;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  CGColorSpace *DeviceRGB;
  size_t v11;
  CGContext *v12;
  CGColorSpace *DeviceGray;
  size_t BytesPerRow;
  CGImage *Image;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v5 = CGImageDestinationCreateWithData(v4, CFSTR("public.png"), 1uLL, 0);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 1647392359)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    v12 = CGBitmapContextCreate(BaseAddress, Width, Height, 0x10uLL, BytesPerRow, DeviceGray, 0x1000u);
    CGColorSpaceRelease(DeviceGray);
  }
  else if (PixelFormatType == 32)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v11 = CVPixelBufferGetBytesPerRow(a3);
    v12 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, v11, DeviceRGB, 6u);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    v12 = 0;
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (v12)
    Image = CGBitmapContextCreateImage(v12);
  else
    Image = 0;
  CGContextRelease(v12);
  if (v5 && Image)
  {
    CGImageDestinationAddImage(v5, Image, 0);
    CGImageDestinationFinalize(v5);
LABEL_13:
    CFRelease(v5);
    goto LABEL_14;
  }
  if (v5)
    goto LABEL_13;
LABEL_14:
  CGImageRelease(Image);
  return v4;
}

- (id)encodeRGBPng:(__CVBuffer *)a3 withWidth:(unint64_t)a4 Height:(unint64_t)a5
{
  void *v9;
  CVPixelBufferRef pixelBufferOut;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  pixelBufferOut = 0;
  pixelTransferSessionOut = 0;
  if (VTPixelTransferSessionCreate(0, &pixelTransferSessionOut)
    || (v13 = *MEMORY[0x24BDC5668],
        v14[0] = MEMORY[0x24BDBD1B8],
        CVPixelBufferCreate(0, a4, a5, 0x20u, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1), &pixelBufferOut))|| !pixelBufferOut)
  {
    v9 = 0;
  }
  else
  {
    VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a3, pixelBufferOut);
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
    -[OUInternalInfoDumper encodePng:](self, "encodePng:", pixelBufferOut);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(pixelBufferOut);
  }
  return v9;
}

- (id)encodeDepthPng:(__CVBuffer *)a3
{
  vImagePixelCount Width;
  vImagePixelCount Height;
  void *v8;
  CVPixelBufferRef texture;
  vImage_Buffer dest;
  vImage_Buffer src;

  CVPixelBufferLockBaseAddress(a3, 1uLL);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  src.width = CVPixelBufferGetWidth(a3);
  src.height = CVPixelBufferGetHeight(a3);
  src.rowBytes = CVPixelBufferGetBytesPerRow(a3);
  dest.height = Height;
  dest.width = Width;
  dest.rowBytes = 32 * Width;
  src.data = CVPixelBufferGetBaseAddress(a3);
  dest.data = malloc_type_malloc(32 * Width * Height, 0x1000040E0EAB150uLL);
  vImageConvert_FTo16U(&src, &dest, 0.0, 0.001, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  texture = 0;
  if (CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x62313667u, dest.data, dest.rowBytes, 0, 0, 0, &texture))
  {
    free(dest.data);
    return 0;
  }
  else
  {
    -[OUInternalInfoDumper encodePng:](self, "encodePng:", texture);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    free(dest.data);
    CVPixelBufferRelease(texture);
    return v8;
  }
}

- (void)dumpLastARFrameImage
{
  void *v3;
  double firstARFrameTime;
  OUFrame *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int16 v9;
  OS_dispatch_group *v10;
  NSObject *save_queue;
  OS_dispatch_group *v12;
  OUFrame *v13;
  id v14;
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  OUFrame *v21;
  OUInternalInfoDumper *v22;
  OS_dispatch_group *v23;
  uint64_t v24;
  double v25;
  __int16 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[NSString stringByAppendingPathComponent:](self->_loggingDirectory, "stringByAppendingPathComponent:", CFSTR("Live"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  firstARFrameTime = self->_firstARFrameTime;
  v5 = self->_lastARFrame;
  v6 = *(_OWORD *)&self->_anon_70[16];
  v27 = *(_OWORD *)self->_anon_70;
  v28 = v6;
  v7 = *(_OWORD *)&self->_anon_70[48];
  v29 = *(_OWORD *)&self->_anon_70[32];
  v30 = v7;
  v8 = -[NSMutableArray count](self->_keyframesDebug, "count");
  v9 = *(_WORD *)&self->_enableARFrameRGB;
  v10 = self->_save_group;
  dispatch_group_enter((dispatch_group_t)v10);
  save_queue = self->_save_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __44__OUInternalInfoDumper_dumpLastARFrameImage__block_invoke;
  v15[3] = &unk_24F2431E0;
  v20 = v3;
  v21 = v5;
  v23 = v10;
  v24 = v8;
  v25 = firstARFrameTime;
  v16 = v27;
  v17 = v28;
  v18 = v29;
  v19 = v30;
  v26 = v9;
  v22 = self;
  v12 = v10;
  v13 = v5;
  v14 = v3;
  dispatch_async(save_queue, v15);

}

void __44__OUInternalInfoDumper_dumpLastARFrameImage__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  __CVBuffer *v13;
  size_t Width;
  size_t Height;
  BOOL v16;
  int v17;
  void *v18;
  void *v19;
  __CVBuffer *v20;
  size_t v21;
  size_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;

  v38 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v38, "setDateFormat:", CFSTR("MM_dd_yyyy_HH_mm_ss_SSS"));
  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(_QWORD *)(a1 + 96);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@_Image.plist"), v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v6;
  +[OUInternalInfoDumper serailizeARFrameMeta:](OUInternalInfoDumper, "serailizeARFrameMeta:", *(_QWORD *)(a1 + 104));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 128));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("keyframe_index"));

  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 104), "timestamp");
  objc_msgSend(v9, "numberWithDouble:", v10 - *(double *)(a1 + 136));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("video_timestamp"));

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a1 + 32, 64);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("cameraPose"));

  v13 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 104), "sceneDepthBuffer");
  v36 = objc_msgSend(*(id *)(a1 + 104), "sceneDepthConfidenceBuffer");
  Width = CVPixelBufferGetWidth(v13);
  Height = CVPixelBufferGetHeight(v13);
  if (Height * Width)
    v16 = v13 == 0;
  else
    v16 = 1;
  v17 = !v16;
  if (*(_BYTE *)(a1 + 144))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      v20 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 104), "sceneColorBuffer");
      v21 = CVPixelBufferGetWidth(v20);
      v22 = CVPixelBufferGetHeight(v20);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("width"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, CFSTR("height"));

      objc_msgSend(*(id *)(a1 + 112), "encodeRGBPng:withWidth:Height:", v20, v21, v22);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24F24AC30, CFSTR("width"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_24F24AC30, CFSTR("height"));
      v25 = objc_alloc_init(MEMORY[0x24BDBCE50]);
    }
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("data"));

    objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("PNG"), CFSTR("type"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("image"));

  }
  if (*(_BYTE *)(a1 + 145))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Width);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("width"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Height);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("height"));

      objc_msgSend(*(id *)(a1 + 112), "encodeDepthPng:", objc_msgSend(*(id *)(a1 + 104), "sceneDepthBuffer"));
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_24F24AC30, CFSTR("width"));
      objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_24F24AC30, CFSTR("height"));
      v30 = objc_alloc_init(MEMORY[0x24BDBCE50]);
    }
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v30, CFSTR("data"));

    objc_msgSend(v27, "setObject:forKeyedSubscript:", CFSTR("PNG"), CFSTR("type"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("depth"));
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v36)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Width);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("width"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", Height);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("height"));

      objc_msgSend(*(id *)(a1 + 112), "encodeDepthPng:", objc_msgSend(*(id *)(a1 + 104), "sceneDepthConfidenceBuffer"));
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v31, "setObject:forKeyedSubscript:", &unk_24F24AC30, CFSTR("width"));
      objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_24F24AC30, CFSTR("height"));
      v35 = objc_alloc_init(MEMORY[0x24BDBCE50]);
    }
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("data"));

    objc_msgSend(v32, "setObject:forKeyedSubscript:", CFSTR("PNG"), CFSTR("type"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("depth_confidence"));

  }
  objc_msgSend(*(id *)(a1 + 112), "createDirectory:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v7, "writeToFile:atomically:", v37, 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 120));

}

- (void)dumpObjects:(id)a3
{
  id v4;
  NSString *loggingDirectory;
  void *v6;
  OS_dispatch_group *v7;
  NSObject *save_queue;
  OS_dispatch_group *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  OUInternalInfoDumper *v14;
  OS_dispatch_group *v15;

  v4 = a3;
  if (self->_enableLiveDump && self->_enableARFrameDump)
  {
    loggingDirectory = self->_loggingDirectory;
    if (loggingDirectory)
    {
      -[NSString stringByAppendingPathComponent:](loggingDirectory, "stringByAppendingPathComponent:", CFSTR("Live"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = self->_save_group;
      dispatch_group_enter((dispatch_group_t)v7);
      save_queue = self->_save_queue;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __36__OUInternalInfoDumper_dumpObjects___block_invoke;
      v11[3] = &unk_24F243208;
      v12 = v6;
      v13 = v4;
      v14 = self;
      v15 = v7;
      v9 = v7;
      v10 = v6;
      dispatch_async(save_queue, v11);

    }
  }

}

void __36__OUInternalInfoDumper_dumpObjects___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("MM_dd_yyyy_HH_mm_ss_SSS"));
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@_Objects.plist"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v8, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 48), "createDirectory:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "writeToFile:atomically:", v7, 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

- (void)dumpARFrame:(__n128)a3 withKeyFrames:(__n128)a4 withCameraPose:(__n128)a5
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  id v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;

  v10 = a7;
  v11 = a8;
  if (objc_msgSend(v10, "sceneDepthBuffer"))
    objc_msgSend((id)a1, "setLastARFrame:withCameraPose:", v10, a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0]);
  NSLog(CFSTR("_enableLiveDump %d"), *(unsigned __int8 *)(a1 + 177));
  NSLog(CFSTR("_enableARFrameDump %d"), *(unsigned __int8 *)(a1 + 176));
  NSLog(CFSTR("_loggingDirectory %@"), *(_QWORD *)(a1 + 24));
  if (*(_BYTE *)(a1 + 177))
  {
    if (*(_BYTE *)(a1 + 176))
    {
      v12 = *(void **)(a1 + 24);
      if (v12)
      {
        objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("Live"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 72);
        v15 = *(id *)(a1 + 16);
        v16 = objc_msgSend(v11, "count");
        dispatch_group_enter(v15);
        v17 = *(NSObject **)(a1 + 8);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __65__OUInternalInfoDumper_dumpARFrame_withKeyFrames_withCameraPose___block_invoke;
        block[3] = &unk_24F243230;
        v29 = v13;
        v34 = v14;
        v25 = a2;
        v26 = a3;
        v27 = a4;
        v28 = a5;
        v30 = v10;
        v31 = a1;
        v32 = v15;
        v33 = v16;
        v18 = v15;
        v19 = v13;
        dispatch_async(v17, block);

      }
    }
  }

}

void __65__OUInternalInfoDumper_dumpARFrame_withKeyFrames_withCameraPose___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v13, "setDateFormat:", CFSTR("MM_dd_yyyy_HH_mm_ss_SSS"));
  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(_QWORD *)(a1 + 96);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@_ARFrame.plist"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("file path %@"), v6);
  +[OUInternalInfoDumper serailizeARFrameMeta:](OUInternalInfoDumper, "serailizeARFrameMeta:", *(_QWORD *)(a1 + 104));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 128));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("keyframesCount"));

  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 104), "timestamp");
  objc_msgSend(v9, "numberWithDouble:", v10 - *(double *)(a1 + 136));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("video_timestamp"));

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a1 + 32, 64);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("cameraPose"));

  objc_msgSend(*(id *)(a1 + 112), "createDirectory:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v7, "writeToFile:atomically:", v6, 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 120));

}

- (void)logMemory:(unint64_t)a3
{
  NSMutableArray *sysDebug;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  if (self->_enableLiveDump)
  {
    if (self->_lastARFrame)
    {
      sysDebug = self->_sysDebug;
      v9[0] = CFSTR("avail_mem");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9[1] = CFSTR("time_stamp");
      v10[0] = v5;
      v6 = (void *)MEMORY[0x24BDD16E0];
      -[OUFrame timestamp](self->_lastARFrame, "timestamp");
      objc_msgSend(v6, "numberWithDouble:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](sysDebug, "addObject:", v8);

    }
  }
}

- (id)getDebugInfoWithConfig:(id)a3 OnlineDebug:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *save_group;
  dispatch_time_t v18;
  NSMutableArray *keyframesDebug;
  void *v20;
  void *v21;
  _QWORD v23[7];
  _QWORD v24[3];
  __int128 v25;
  NSMutableArray *sysDebug;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_enableLiveDump)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("floorPlanDebug"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSMutableArray count](self->_floorPlanDebug, "count");
    if (v10 != objc_msgSend(v9, "count") - 1)
    {
      v11 = -[NSMutableArray count](self->_floorPlanDebug, "count");
      if (v11 != objc_msgSend(v9, "count"))
        __assert_rtn("-[OUInternalInfoDumper getDebugInfoWithConfig:OnlineDebug:]", "OUDebugInfo.mm", 426, "_floorPlanDebug.count == internalWall.count - 1 || _floorPlanDebug.count == internalWall.count");
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < -[NSMutableArray count](self->_floorPlanDebug, "count"); ++i)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_floorPlanDebug, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addEntriesFromDictionary:", v15);

      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addEntriesFromDictionary:", v16);

      objc_msgSend(v12, "addObject:", v14);
    }
    save_group = self->_save_group;
    v18 = dispatch_time(0, 30000000000);
    dispatch_group_wait(save_group, v18);
    v23[0] = CFSTR("config");
    v23[1] = CFSTR("keyframeDebug");
    keyframesDebug = self->_keyframesDebug;
    v24[0] = v6;
    v24[1] = keyframesDebug;
    v24[2] = v12;
    v23[2] = CFSTR("floorPlanDebug");
    v23[3] = CFSTR("coachingDebug");
    v25 = *(_OWORD *)&self->_coachingDebug;
    v23[4] = CFSTR("driftDebug");
    v23[5] = CFSTR("sysDebug");
    sysDebug = self->_sysDebug;
    v23[6] = CFSTR("firstARFrameTime");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_firstARFrameTime);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v21;
}

- (void)reset
{
  NSMutableArray *v3;
  NSMutableArray *keyframesDebug;
  NSMutableArray *v5;
  NSMutableArray *floorPlanDebug;
  NSMutableArray *v7;
  NSMutableArray *coachingDebug;
  NSMutableArray *v9;
  NSMutableArray *driftDebug;
  NSMutableDictionary *v11;
  NSMutableDictionary *keyframeMeta;
  NSMutableArray *v13;
  NSMutableArray *sysDebug;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  OUFrame *lastARFrame;
  NSDate *lastKeyframeTime;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  keyframesDebug = self->_keyframesDebug;
  self->_keyframesDebug = v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  floorPlanDebug = self->_floorPlanDebug;
  self->_floorPlanDebug = v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  coachingDebug = self->_coachingDebug;
  self->_coachingDebug = v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  driftDebug = self->_driftDebug;
  self->_driftDebug = v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  keyframeMeta = self->_keyframeMeta;
  self->_keyframeMeta = v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  sysDebug = self->_sysDebug;
  self->_sysDebug = v13;

  *(_WORD *)&self->_enableARFrameRGB = 257;
  self->_enableARFrameDump = 1;
  v15 = (_OWORD *)MEMORY[0x24BDAEE00];
  self->_firstARFrameTime = 0.0;
  v16 = v15[1];
  *(_OWORD *)self->_anon_70 = *v15;
  *(_OWORD *)&self->_anon_70[16] = v16;
  v17 = v15[3];
  *(_OWORD *)&self->_anon_70[32] = v15[2];
  *(_OWORD *)&self->_anon_70[48] = v17;
  lastARFrame = self->_lastARFrame;
  self->_maxKeyframeFPS = 3.0;
  self->_lastARFrame = 0;

  lastKeyframeTime = self->_lastKeyframeTime;
  self->_lastKeyframeTime = 0;

}

- (BOOL)enableARFrameDump
{
  return self->_enableARFrameDump;
}

- (void)setEnableARFrameDump:(BOOL)a3
{
  self->_enableARFrameDump = a3;
}

- (BOOL)enableLiveDump
{
  return self->_enableLiveDump;
}

- (void)setEnableLiveDump:(BOOL)a3
{
  self->_enableLiveDump = a3;
}

- (BOOL)enableARFrameRGB
{
  return self->_enableARFrameRGB;
}

- (void)setEnableARFrameRGB:(BOOL)a3
{
  self->_enableARFrameRGB = a3;
}

- (BOOL)enableARFrameDepth
{
  return self->_enableARFrameDepth;
}

- (void)setEnableARFrameDepth:(BOOL)a3
{
  self->_enableARFrameDepth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastARFrame, 0);
  objc_storeStrong((id *)&self->_keyframeMeta, 0);
  objc_storeStrong((id *)&self->_lastKeyframeTime, 0);
  objc_storeStrong((id *)&self->_sysDebug, 0);
  objc_storeStrong((id *)&self->_driftDebug, 0);
  objc_storeStrong((id *)&self->_coachingDebug, 0);
  objc_storeStrong((id *)&self->_floorPlanDebug, 0);
  objc_storeStrong((id *)&self->_keyframesDebug, 0);
  objc_storeStrong((id *)&self->_loggingDirectory, 0);
  objc_storeStrong((id *)&self->_save_group, 0);
  objc_storeStrong((id *)&self->_save_queue, 0);
}

@end
