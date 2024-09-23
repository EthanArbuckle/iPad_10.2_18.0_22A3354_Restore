@implementation PLPositionalBC7ImageTable

+ (unint64_t)metalPixelFormat
{
  return 0;
}

+ (__CFString)colorSpaceName
{
  return (__CFString *)*MEMORY[0x1E0C9D908];
}

- (void)getImageDataOffset:(int64_t *)a3 size:(CGSize *)a4 bytesPerRow:(unint64_t *)a5 fromEntryFooter:(PLImageTableEntryFooter_s *)a6
{
  int32x2_t v6;
  unint64_t v7;
  int64x2_t v8;

  *a3 = 0;
  v6 = vadd_s32(*(int32x2_t *)&a6->var1, (int32x2_t)0x300000003);
  v7 = *(_QWORD *)&vsra_n_u32((uint32x2_t)v6, (uint32x2_t)vcltz_s32(v6), 0x1EuLL) & 0xFFFFFFFCFFFFFFFCLL;
  v8.i64[0] = (int)v7;
  v8.i64[1] = SHIDWORD(v7);
  *a5 = 4 * v7;
  *(float64x2_t *)a4 = vcvtq_f64_s64(v8);
}

- (id)debugImageDataAtIndex:(unint64_t)a3
{
  OSQueueHead **v5;
  OSQueueHead **v6;
  _BOOL4 v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  __int128 v21;
  uint64_t v22;
  int v23;
  int v24;
  __int128 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->super.super._readOnly)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_13;
  }
  else if (self->super.super._entryCapacity <= a3)
  {
LABEL_13:
    v8 = 0;
    return v8;
  }
  v17 = 0;
  v18 = 0;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v5 = (OSQueueHead **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)-[PLPositionalTable pool](self, "pool"), (void *)-[PLPositionalTable entryLength](self, "entryLength"));
  if (!v5)
    goto LABEL_13;
  v6 = v5;
  v7 = -[PLPositionalImageTable readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:](self, "readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:", a3, v5, &v14, (char *)&v18 + 4, &v18, (char *)&v17 + 4, &v17, &v15, &v16, 0);
  v8 = 0;
  if (v7)
  {
    v9 = HIDWORD(v18) + 3;
    if (SHIDWORD(v18) < -3)
      v9 = HIDWORD(v18) + 6;
    v10 = v9 >> 2;
    v11 = v18 + 3;
    if ((int)v18 < -3)
      v11 = v18 + 6;
    v13 = (int)(16 * v10 * (v11 >> 2));
    v19 = 0xBB31312058544BABLL;
    v20 = 169478669;
    v21 = xmmword_199EB0360;
    v22 = 0x190800008E8DLL;
    v23 = HIDWORD(v18);
    v24 = v18;
    v25 = xmmword_199EB0350;
    v26 = 0;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend(v8, "appendBytes:length:", &v19, 64);
    objc_msgSend(v8, "appendBytes:length:", &v13, 4);
    objc_msgSend(v8, "appendBytes:length:", *v6, v13);
  }
  PLPositionalTableMemoryPool_Free(v6);
  return v8;
}

- (CGImage)createImageWithIdentifier:(id)a3 orIndex:(unint64_t)a4
{
  OSQueueHead **v6;
  OSQueueHead **v7;
  CGImage *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  OSQueueHead *v13;
  void *v14;
  CGImageSource *v15;
  CGImageSource *v16;
  CGImageRef ImageAtIndex;
  CGColorSpace *v18;
  CGImageRef CopyWithColorSpace;
  CGImage *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  unint64_t v34;
  int v35;
  __int128 v36;
  uint64_t v37;
  int v38;
  int v39;
  __int128 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (self->super.super._readOnly)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  else if (self->super.super._entryCapacity <= a4)
  {
    return 0;
  }
  v29 = 0;
  v30 = 0;
  v27 = 0;
  v28 = 0;
  v26 = 0;
  v6 = (OSQueueHead **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)-[PLPositionalTable pool](self, "pool", a3), (void *)-[PLPositionalTable entryLength](self, "entryLength"));
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  if (-[PLPositionalImageTable readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:](self, "readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:", a4, v6, &v26, (char *)&v30 + 4, &v30, (char *)&v29 + 4, &v29, &v27, &v28, 0))
  {
    v9 = HIDWORD(v30) + 6;
    if (SHIDWORD(v30) >= -3)
      v9 = HIDWORD(v30) + 3;
    v10 = v9 >> 2;
    v11 = v30 + 6;
    if ((int)v30 >= -3)
      v11 = v30 + 3;
    v12 = (int)(16 * v10 * (v11 >> 2));
    -[PLPositionalTable entryLength](self, "entryLength");
    v31 = v12;
    v13 = *v7;
    if (*v7)
    {
      v35 = 169478669;
      v34 = 0xBB31312058544BABLL;
      v36 = xmmword_199EB0360;
      v37 = 0x190800008E8DLL;
      v38 = HIDWORD(v30);
      v39 = v30;
      v40 = xmmword_199EB0350;
      v41 = 0;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v12 + 68);
      objc_msgSend(v14, "appendBytes:length:", &v34, 64);
      objc_msgSend(v14, "appendBytes:length:", &v31, 4);
      objc_msgSend(v14, "appendBytes:length:", v13, v31);
      v15 = CGImageSourceCreateWithData((CFDataRef)v14, 0);
      if (v15)
      {
        v16 = v15;
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, 0);
        if (ImageAtIndex)
        {
          v8 = ImageAtIndex;
          v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
          CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v8, v18);
          if (CopyWithColorSpace)
          {
            v20 = CopyWithColorSpace;
            CGImageRelease(v8);
            v8 = v20;
          }
          CGColorSpaceRelease(v18);
        }
        else
        {
          PLThumbnailsGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = objc_msgSend(v14, "length");
            *(_DWORD *)buf = 134217984;
            v33 = v24;
            _os_log_impl(&dword_199DF7000, v23, OS_LOG_TYPE_ERROR, "Unable to decode BC7 KTX data of length: %ld to CGImage", buf, 0xCu);
          }

          v8 = 0;
        }
        CFRelease(v16);
      }
      else
      {
        PLThumbnailsGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = objc_msgSend(v14, "length");
          *(_DWORD *)buf = 134217984;
          v33 = v22;
          _os_log_impl(&dword_199DF7000, v21, OS_LOG_TYPE_ERROR, "Unable to open image source for BC7 KTX data of length: %ld", buf, 0xCu);
        }

        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }
  PLPositionalTableMemoryPool_Free(v7);
  return v8;
}

@end
