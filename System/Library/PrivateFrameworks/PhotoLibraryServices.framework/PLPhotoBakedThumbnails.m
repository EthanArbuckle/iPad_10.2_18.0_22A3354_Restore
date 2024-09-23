@implementation PLPhotoBakedThumbnails

- (PLPhotoBakedThumbnails)initWithData:(id)a3 format:(unsigned __int16)a4 readOnly:(BOOL)a5
{
  int v6;
  id v9;
  PLPhotoBakedThumbnails *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSData *thumbnailData;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  PLPhotoBakedThumbnails *v25;
  BOOL v27;
  uint64_t v28;
  uint64_t v30;
  NSData *optionsData;
  objc_super v32;

  v6 = a4;
  v9 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PLPhotoBakedThumbnails;
  v10 = -[PLPhotoBakedThumbnails init](&v32, sel_init);
  if (!v10)
    goto LABEL_17;
  v11 = PLPhotoBakedFormatInfoForFormat();
  if (!v11)
    goto LABEL_17;
  v12 = v11;
  v10->_format = v6;
  v10->_dataIsMutable = !a5;
  objc_storeStrong((id *)&v10->_thumbnailData, a3);
  v13 = -[NSData length](v10->_thumbnailData, "length");
  thumbnailData = v10->_thumbnailData;
  if (!thumbnailData || (unint64_t)v13 < 0x10)
    goto LABEL_17;
  v16 = -[NSData bytes](thumbnailData, "bytes");
  if (!v16)
    goto LABEL_17;
  v17 = *(_DWORD *)(v16 + 4);
  v18 = *(unsigned __int16 *)(v16 + 8);
  v19 = *(_DWORD *)(v16 + 12);
  if (*(_DWORD *)v16 != -1160913749)
  {
    if (*(_DWORD *)v16 != -1411592774)
    {
LABEL_17:
      v25 = 0;
      goto LABEL_18;
    }
    v17 = bswap32(v17);
    v18 = __rev16(v18);
    v19 = bswap32(v19);
  }
  if (bswap32(v17) != v6)
    goto LABEL_17;
  if ((*(_BYTE *)(v16 + 11) & 1) != 0)
  {
    v23 = bswap32(*(_DWORD *)(v16 + 16));
    v24 = bswap32(*(_DWORD *)(v16 + 20));
    v10->_size.width = (double)v23;
    v10->_size.height = (double)v24;
    v21 = v24 * v23 * *(_DWORD *)(v12 + 96);
    v22 = 24;
    v20 = 1;
  }
  else
  {
    v20 = __rev16(v18);
    v21 = *(_DWORD *)(v12 + 168);
    v22 = 16;
  }
  v10->_count = v20;
  v10->_singleThumbnailImageLength = v21;
  if (v13 < v22 + (int)v20 * (uint64_t)v21)
    goto LABEL_17;
  v27 = v19 == 0;
  v28 = bswap32(v19);
  if (!v27 && v13 > v28)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16 + v28, v13 - v28);
    v30 = objc_claimAutoreleasedReturnValue();
    optionsData = v10->_optionsData;
    v10->_optionsData = (NSData *)v30;

  }
  v25 = v10;
LABEL_18:

  return v25;
}

- (PLPhotoBakedThumbnails)initWithContentsOfFile:(id)a3 format:(unsigned __int16)a4 readOnly:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  void *v10;
  PLPhotoBakedThumbnails *v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v8)
  {
    if (v5)
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v8, 8, 0);
    else
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithContentsOfFile:", v8);
    v10 = (void *)v9;
  }
  else
  {
    v10 = 0;
  }
  v11 = -[PLPhotoBakedThumbnails initWithData:format:readOnly:](self, "initWithData:format:readOnly:", v10, v6, v5);

  return v11;
}

- (PLPhotoBakedThumbnails)initWithImages:(id)a3 format:(unsigned __int16)a4 options:(id)a5 delegate:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  PLPhotoBakedThumbnails *v14;
  PLPhotoBakedThumbnails *v15;
  uint64_t v16;
  unint64_t count;
  BOOL v18;
  PLPhotoBakedThumbnails *v19;
  uint64_t v20;
  int v21;
  int singleThumbnailImageLength;
  CGImage *v23;
  double Width;
  size_t Height;
  double v26;
  double v27;
  float v28;
  double v29;
  float v30;
  uint64_t v31;
  NSMutableDictionary *options;
  NSMutableDictionary *v33;
  void *v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSData *thumbnailData;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  objc_super v64;
  uint8_t v65[128];
  uint8_t buf[4];
  id v67;
  uint64_t v68;

  v8 = a4;
  v68 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v64.receiver = self;
  v64.super_class = (Class)PLPhotoBakedThumbnails;
  v14 = -[PLPhotoBakedThumbnails init](&v64, sel_init);
  v15 = v14;
  if (!v14)
  {
LABEL_38:
    v19 = v15;
    goto LABEL_39;
  }
  v14->_format = v8;
  v14->_count = objc_msgSend(v11, "count");
  v16 = PLPhotoBakedFormatInfoForFormat();
  count = v15->_count;
  if (count)
    v18 = v16 == 0;
  else
    v18 = 1;
  if (!v18)
  {
    v20 = v16;
    v21 = *(_DWORD *)(v16 + 168);
    if (v21)
    {
      v56 = 16;
      singleThumbnailImageLength = *(_DWORD *)(v16 + 168);
    }
    else
    {
      if (count != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PLPhotoBakedThumbnails.m"), 196, CFSTR("Tried to serialize multiple images into baked thumbnail with dynamic size"));

      }
      v23 = (CGImage *)objc_msgSend(v11, "objectAtIndex:", 0);
      Width = (double)CGImageGetWidth(v23);
      Height = CGImageGetHeight(v23);
      v26 = Width / (double)Height;
      if (v26 <= 1.0)
      {
        v29 = *(double *)(v20 + 16);
        v30 = v26 * v29;
        v27 = roundf(v30);
      }
      else
      {
        v27 = *(double *)(v20 + 8);
        v28 = (double)Height / Width * v27;
        v29 = roundf(v28);
      }
      v15->_size.width = v27;
      v15->_size.height = v29;
      singleThumbnailImageLength = (int)(v29 * (double)*(int *)(v20 + 96) * v27);
      v56 = 24;
    }
    v15->_singleThumbnailImageLength = singleThumbnailImageLength;
    if (v12)
    {
      v31 = objc_msgSend(v12, "mutableCopy");
      options = v15->_options;
      v15->_options = (NSMutableDictionary *)v31;

      v33 = v15->_options;
      v63 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, &v63);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v63;
      if (!v34)
      {
        PLBackendGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v35;
          _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Failed to archive options, error: %@", buf, 0xCu);
        }

      }
      v37 = objc_msgSend(v34, "length");

      singleThumbnailImageLength = v15->_singleThumbnailImageLength;
    }
    else
    {
      v34 = 0;
      v37 = 0;
    }
    v57 = v34;
    v58 = v12;
    v38 = v56 + v15->_count * singleThumbnailImageLength;
    v15->_dataIsMutable = 1;
    v55 = v37;
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v38 + v37);
    thumbnailData = v15->_thumbnailData;
    v15->_thumbnailData = (NSData *)v39;

    v41 = -[NSData bytes](v15->_thumbnailData, "bytes");
    v42 = v41;
    *(_DWORD *)v41 = -1160913749;
    *(_DWORD *)(v41 + 4) = bswap32(v8);
    *(_BYTE *)(v41 + 10) = 0;
    *(_BYTE *)(v41 + 11) = v21 == 0;
    *(_WORD *)(v41 + 8) = bswap32(LOWORD(v15->_count)) >> 16;
    v54 = v38;
    v43 = bswap32(v38);
    if (v15->_options)
      v44 = v43;
    else
      v44 = 0;
    *(_DWORD *)(v41 + 12) = v44;
    if (!v21)
      *(int8x8_t *)(-[NSData bytes](v15->_thumbnailData, "bytes") + 16) = vrev32_s8((int8x8_t)vmovn_s64((int64x2_t)vcvtq_u64_f64((float64x2_t)v15->_size)));
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v45 = v11;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v46)
    {
      v47 = v46;
      v48 = v42 + v56;
      v49 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v60 != v49)
            objc_enumerationMutation(v45);
          -[PLPhotoBakedThumbnails writeBorderedThumbnailOfImage:toBuffer:orientation:format:formatInfo:delegate:](v15, "writeBorderedThumbnailOfImage:toBuffer:orientation:format:formatInfo:delegate:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i), v48, 0, v8, v20, v13);
          v48 += v15->_singleThumbnailImageLength;
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v47);
    }

    if (v55)
    {
      -[PLPhotoBakedThumbnails _thumbnailData](v15, "_thumbnailData");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "replaceBytesInRange:withBytes:length:", v54, v55, objc_msgSend(objc_retainAutorelease(v57), "bytes"), v55);

    }
    v12 = v58;
    goto LABEL_38;
  }
  v19 = 0;
LABEL_39:

  return v19;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>(format: %d count: %lu options: %@)"), objc_opt_class(), self, self->_format, self->_count, self->_options);
}

- (id)serializedData
{
  NSMutableDictionary *options;
  void *v4;
  id v5;
  NSObject *v6;
  unint64_t count;
  uint64_t singleThumbnailImageLength;
  int IsDynamicallySized;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  id v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_count)
    return 0;
  if (self->_optionsAccessed)
  {
    options = self->_options;
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", options, 1, &v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v16;
    if (!v4)
    {
      PLBackendGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Failed to archive options, error: %@", buf, 0xCu);
      }

    }
    count = self->_count;
    singleThumbnailImageLength = self->_singleThumbnailImageLength;
    IsDynamicallySized = PLPhotoBakedFormatIsDynamicallySized();
    v10 = 16;
    if (IsDynamicallySized)
      v10 = 24;
    v11 = v10 + count * singleThumbnailImageLength;
    -[PLPhotoBakedThumbnails _thumbnailData](self, "_thumbnailData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length") - v11;
    v14 = objc_retainAutorelease(v4);
    objc_msgSend(v12, "replaceBytesInRange:withBytes:length:", v11, v13, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
    self->_optionsAccessed = 0;

  }
  return self->_thumbnailData;
}

- (BOOL)saveToFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PLPhotoBakedThumbnails serializedData](self, "serializedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "writeToFile:options:error:", v4, 1073741825, 0);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)thumbnailDataAtIndex:(int64_t)a3
{
  char *v4;
  const UInt8 *v5;
  NSData *v6;
  const __CFAllocator *v7;
  CFDataRef v8;
  CFAllocatorContext v10;

  v4 = -[PLPhotoBakedThumbnails thumbnailBytesAtIndex:](self, "thumbnailBytesAtIndex:", a3);
  if (!v4)
    return 0;
  v5 = (const UInt8 *)v4;
  v6 = self->_thumbnailData;
  v10.version = 0;
  memset(&v10.retain, 0, 40);
  v10.info = v6;
  v10.deallocate = (CFAllocatorDeallocateCallBack)releaseThumbnailData;
  v10.preferredSize = 0;
  v7 = CFAllocatorCreate(0, &v10);
  v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, self->_singleThumbnailImageLength, v7);
  CFRelease(v7);
  return v8;
}

- (char)thumbnailBytesAtIndex:(int64_t)a3
{
  _BOOL4 v5;
  uint64_t v6;

  if (self->_singleThumbnailImageLength < 1 || self->_count <= a3)
    return 0;
  v5 = !self->_missingHeader;
  if (PLPhotoBakedFormatIsDynamicallySized())
    v6 = (16 * v5) | 8u;
  else
    v6 = (16 * v5);
  return (char *)(-[NSData bytes](self->_thumbnailData, "bytes") + v6 + self->_singleThumbnailImageLength * a3);
}

- (CGImage)thumbnailImageAtIndex:(int64_t)a3
{
  unint64_t count;
  NSMutableArray *v6;
  NSMutableArray *thumbnailImages;
  unint64_t v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  CGColorSpace *DeviceRGB;
  const __CFData *v14;
  const __CFData *v15;
  CGDataProvider *v16;
  double v17;
  double v18;
  size_t v19;
  size_t v20;
  size_t v21;
  double v22;
  double v23;
  CGImageRef v24;
  unint64_t width;

  if (self->_thumbnailImages)
  {
    count = self->_count;
  }
  else
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_count);
    thumbnailImages = self->_thumbnailImages;
    self->_thumbnailImages = v6;

    if (!self->_count)
      return 0;
    v8 = 0;
    do
    {
      v9 = self->_thumbnailImages;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v9, "addObject:", v10);

      ++v8;
      count = self->_count;
    }
    while (count > v8);
  }
  if (count <= a3)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_thumbnailImages, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    -[PLPhotoBakedThumbnails thumbnailDataAtIndex:](self, "thumbnailDataAtIndex:", a3);
    v14 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = CGDataProviderCreateWithCFData(v14);
      -[PLPhotoBakedThumbnails size](self, "size");
      width = (unint64_t)v17;
      -[PLPhotoBakedThumbnails size](self, "size");
      v19 = (unint64_t)v18;
      v20 = -[PLPhotoBakedThumbnails bitsPerComponent](self, "bitsPerComponent");
      v21 = 8 * -[PLPhotoBakedThumbnails bytesPerPixel](self, "bytesPerPixel");
      v22 = (double)-[PLPhotoBakedThumbnails bytesPerPixel](self, "bytesPerPixel");
      -[PLPhotoBakedThumbnails size](self, "size");
      v24 = CGImageCreate(width, v19, v20, v21, (unint64_t)(v23 * v22), DeviceRGB, -[PLPhotoBakedThumbnails bitmapInfo](self, "bitmapInfo"), v16, 0, 0, kCGRenderingIntentDefault);

      CGDataProviderRelease(v16);
      if (v24)
      {
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_thumbnailImages, "replaceObjectAtIndex:withObject:", a3, v24);
        v11 = v24;
      }
      else
      {
        v11 = 0;
      }
    }
    CGColorSpaceRelease(DeviceRGB);

  }
  return (CGImage *)v11;
}

- (unsigned)format
{
  return self->_format;
}

- (NSMutableDictionary)options
{
  NSMutableDictionary *options;
  void *v4;
  NSData *optionsData;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;

  options = self->_options;
  if (!options)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    optionsData = self->_optionsData;
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pl_safeUnarchiveObjectFromData:classes:", optionsData, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSMutableDictionary *)objc_msgSend(v10, "mutableCopy");
    v12 = self->_options;
    self->_options = v11;

    options = self->_options;
  }
  self->_optionsAccessed = 1;
  return options;
}

- (NSData)optionsData
{
  return self->_optionsData;
}

- (int)bitsPerComponent
{
  return *(_DWORD *)(PLPhotoBakedFormatInfoForFormat() + 92);
}

- (int)bytesPerPixel
{
  return *(_DWORD *)(PLPhotoBakedFormatInfoForFormat() + 96);
}

- (CGSize)size
{
  CGSize *p_size;
  CGFloat *p_height;
  uint64_t v5;
  double v6;
  double width;
  CGSize result;

  if (PLPhotoBakedFormatIsDynamicallySized())
  {
    p_size = &self->_size;
    p_height = &self->_size.height;
  }
  else
  {
    v5 = PLPhotoBakedFormatInfoForFormat();
    p_size = (CGSize *)(v5 + 8);
    p_height = (CGFloat *)(v5 + 16);
  }
  v6 = *p_height;
  width = p_size->width;
  result.height = v6;
  result.width = width;
  return result;
}

- (unsigned)bitmapInfo
{
  return *(_DWORD *)(PLPhotoBakedFormatInfoForFormat() + 88);
}

- (CGRect)imageRect
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)PLPhotoBakedFormatInfoForFormat();
  v3 = v2[3];
  v4 = v2[4];
  v5 = v2[5];
  v6 = v2[6];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)writeBorderedThumbnailOfImage:(CGImage *)a3 toBuffer:(void *)a4 orientation:(int *)a5 format:(unsigned __int16)a6 formatInfo:(id *)a7 delegate:(id)a8
{
  uint64_t v9;
  id v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  CGFloat v18;
  CGFloat width;
  CGFloat height;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat y;
  CGFloat x;
  BOOL v26;
  __int128 v27;
  void *v28;
  CGColorSpace *DeviceRGB;
  CGContext *v30;
  CGContext *v31;
  CGColor *v32;
  CGColor *v33;
  CGAffineTransform v35;
  CGAffineTransform transform;
  CGAffineTransform v37;
  CGSize size;
  CGSize v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v9 = a6;
  v14 = a8;
  if (a3)
    v15 = a4 == 0;
  else
    v15 = 1;
  v16 = v15 || a7 == 0;
  v17 = !v16;
  if (!v16)
  {
    if (PLPhotoBakedFormatIsDynamicallySized())
    {
      size = self->_size;
      v39 = size;
      v18 = 0.0;
      height = size.height;
      width = size.width;
      v21 = 0.0;
      v22 = size.height;
      v23 = size.width;
      y = 0.0;
      x = 0.0;
    }
    else
    {
      size = a7->var1;
      v39 = size;
      x = a7->var2.origin.x;
      y = a7->var2.origin.y;
      v23 = a7->var2.size.width;
      v22 = a7->var2.size.height;
      v21 = a7->var3.origin.x;
      v18 = a7->var3.origin.y;
      width = a7->var3.size.width;
      height = a7->var3.size.height;
    }
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = v23;
    v40.size.height = v22;
    v47.origin.x = v21;
    v47.origin.y = v18;
    v47.size.width = width;
    v47.size.height = height;
    v26 = CGRectEqualToRect(v40, v47);
    v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v37.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v37.c = v27;
    *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5
      && objc_msgSend((id)objc_opt_class(), "_transformForImage:isCropped:captureOrientation:sizeInOut:contextSizeOut:transformOut:", a3, objc_msgSend(v28, "isCropped"), *a5, &v39, &size, &v37))
    {
      v35 = v37;
      memset(&transform, 0, sizeof(transform));
      CGAffineTransformInvert(&transform, &v35);
      v35 = transform;
      v41.origin.x = x;
      v41.origin.y = y;
      v41.size.width = v23;
      v41.size.height = v22;
      v42 = CGRectApplyAffineTransform(v41, &v35);
      x = v42.origin.x;
      y = v42.origin.y;
      v23 = v42.size.width;
      v22 = v42.size.height;
      v35 = transform;
      v42.origin.x = v21;
      v42.origin.y = v18;
      v42.size.width = width;
      v42.size.height = height;
      v43 = CGRectApplyAffineTransform(v42, &v35);
      v21 = v43.origin.x;
      v18 = v43.origin.y;
      width = v43.size.width;
      height = v43.size.height;
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v30 = CGBitmapContextCreate(a4, (unint64_t)size.width, (unint64_t)size.height, a7->var5, (unint64_t)(size.width * (double)a7->var6), DeviceRGB, a7->var4);
    v31 = v30;
    if (a5)
    {
      transform = v37;
      CGContextConcatCTM(v30, &transform);
    }
    v32 = CGColorCreate(DeviceRGB, a7->var7);
    v33 = CGColorCreate(DeviceRGB, a7->var8);
    CGContextSetFillColorWithColor(v31, v32);
    if (!v26)
      CGContextSetStrokeColorWithColor(v31, v33);
    v44.size = v39;
    v44.origin.x = 0.0;
    v44.origin.y = 0.0;
    CGContextFillRect(v31, v44);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = v23;
    v45.size.height = v22;
    CGContextDrawImage(v31, v45, a3);
    if (!v26)
    {
      v46.origin.x = v21;
      v46.origin.y = v18;
      v46.size.width = width;
      v46.size.height = height;
      CGContextStrokeRect(v31, v46);
    }
    CGColorRelease(v33);
    CGColorRelease(v32);
    if (v14)
      objc_msgSend(v14, "decorateThumbnail:inContext:", self, v31);
    CGContextRelease(v31);
    CGColorSpaceRelease(DeviceRGB);

  }
  return v17;
}

- (id)_thumbnailData
{
  NSData *v3;
  NSData *thumbnailData;

  if (!self->_dataIsMutable)
  {
    v3 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", self->_thumbnailData);
    thumbnailData = self->_thumbnailData;
    self->_thumbnailData = v3;

    self->_dataIsMutable = 1;
  }
  return self->_thumbnailData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsData, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_thumbnailImages, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
}

+ (id)thumbnailsWithContentsOfFile:(id)a3 format:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  PLPhotoBakedThumbnails *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[PLPhotoBakedThumbnails initWithContentsOfFile:format:readOnly:]([PLPhotoBakedThumbnails alloc], "initWithContentsOfFile:format:readOnly:", v5, v4, 0);

  return v6;
}

+ (BOOL)_transformForImage:(CGImage *)a3 isCropped:(BOOL)a4 captureOrientation:(int)a5 sizeInOut:(CGSize *)a6 contextSizeOut:(CGSize *)a7 transformOut:(CGAffineTransform *)a8
{
  BOOL result;
  size_t Width;
  size_t Height;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGFloat v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  double v26;
  __int128 v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v34;
  CGAffineTransform v35;
  CGAffineTransform v36;

  if (!a8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, *(_QWORD *)&a5, a6, a7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoBakedThumbnails.m"), 481, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transform"));

    return 0;
  }
  result = 0;
  if (a6 && a7)
  {
    Width = CGImageGetWidth(a3);
    Height = CGImageGetHeight(a3);
    if (!a4)
    {
      if (Width <= Height)
        a6->width = floor(a6->height * (float)((float)Width / (float)Height));
      else
        a6->height = floor(a6->width * (float)((float)Height / (float)Width));
      *a7 = *a6;
    }
    v17 = MEMORY[0x1E0C9BAA8];
    v19 = *MEMORY[0x1E0C9BAA8];
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&a8->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&a8->c = v18;
    v20 = *(_OWORD *)(v17 + 32);
    *(_OWORD *)&a8->tx = v20;
    switch(a5)
    {
      case 2:
        *(_OWORD *)&v35.a = v19;
        *(_OWORD *)&v35.c = v18;
        *(_OWORD *)&v35.tx = v20;
        CGAffineTransformRotate(&v36, &v35, 1.57079633);
        v25 = *(_OWORD *)&v36.c;
        *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
        *(_OWORD *)&a8->c = v25;
        *(_OWORD *)&a8->tx = *(_OWORD *)&v36.tx;
        v26 = -a6->height;
        v27 = *(_OWORD *)&a8->c;
        *(_OWORD *)&v35.a = *(_OWORD *)&a8->a;
        *(_OWORD *)&v35.c = v27;
        *(_OWORD *)&v35.tx = *(_OWORD *)&a8->tx;
        v28 = 0.0;
        break;
      case 3:
        return 1;
      case 4:
        *(_OWORD *)&v35.a = v19;
        *(_OWORD *)&v35.c = v18;
        *(_OWORD *)&v35.tx = v20;
        CGAffineTransformRotate(&v36, &v35, 3.14159265);
        v21 = *(_OWORD *)&v36.c;
        *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
        *(_OWORD *)&a8->c = v21;
        *(_OWORD *)&a8->tx = *(_OWORD *)&v36.tx;
        v22 = -a6->width;
        *(double *)&v21 = -a6->height;
        v23 = *(_OWORD *)&a8->c;
        *(_OWORD *)&v35.a = *(_OWORD *)&a8->a;
        *(_OWORD *)&v35.c = v23;
        *(_OWORD *)&v35.tx = *(_OWORD *)&a8->tx;
        CGAffineTransformTranslate(&v36, &v35, v22, *(CGFloat *)&v21);
        v24 = *(_OWORD *)&v36.c;
        *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
        *(_OWORD *)&a8->c = v24;
        *(_OWORD *)&a8->tx = *(_OWORD *)&v36.tx;
        return 1;
      default:
        *(_OWORD *)&v35.a = v19;
        *(_OWORD *)&v35.c = v18;
        *(_OWORD *)&v35.tx = v20;
        CGAffineTransformRotate(&v36, &v35, -1.57079633);
        v29 = *(_OWORD *)&v36.c;
        *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
        *(_OWORD *)&a8->c = v29;
        *(_OWORD *)&a8->tx = *(_OWORD *)&v36.tx;
        v28 = -a6->width;
        v30 = *(_OWORD *)&a8->c;
        *(_OWORD *)&v35.a = *(_OWORD *)&a8->a;
        *(_OWORD *)&v35.c = v30;
        *(_OWORD *)&v35.tx = *(_OWORD *)&a8->tx;
        v26 = 0.0;
        break;
    }
    CGAffineTransformTranslate(&v36, &v35, v28, v26);
    v31 = *(_OWORD *)&v36.c;
    *(_OWORD *)&a8->a = *(_OWORD *)&v36.a;
    *(_OWORD *)&a8->c = v31;
    *(_OWORD *)&a8->tx = *(_OWORD *)&v36.tx;
    *(int8x16_t *)a7 = vextq_s8(*(int8x16_t *)a6, *(int8x16_t *)a6, 8uLL);
    return 1;
  }
  return result;
}

@end
