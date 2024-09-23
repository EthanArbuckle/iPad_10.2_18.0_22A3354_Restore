@implementation PLPositionalASTCImageTable

+ (unint64_t)metalPixelFormat
{
  return 204;
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
  uint64_t v26;
  char v27[17];
  __int16 v28;
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
    v21 = xmmword_199EB0340;
    v22 = 0x1908000093B0;
    v23 = HIDWORD(v18);
    v24 = v18;
    v25 = xmmword_199EB0350;
    v28 = 51;
    strcpy(v27, "ColorSpace_APPLE");
    v29 = 0;
    v26 = 0x1300000018;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend(v8, "appendBytes:length:", &v19, 88);
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
  _BOOL4 v8;
  CGImage *ImageAtIndex;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  CGImageSource *v15;
  CGImageSource *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  unint64_t v30;
  int v31;
  __int128 v32;
  uint64_t v33;
  int v34;
  int v35;
  __int128 v36;
  uint64_t v37;
  char v38[20];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (self->super.super._readOnly)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  else if (self->super.super._entryCapacity <= a4)
  {
    return 0;
  }
  v25 = 0;
  v26 = 0;
  v23 = 0;
  v24 = 0;
  v22 = 0;
  v6 = (OSQueueHead **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)-[PLPositionalTable pool](self, "pool", a3), (void *)-[PLPositionalTable entryLength](self, "entryLength"));
  if (!v6)
    return 0;
  v7 = v6;
  v8 = -[PLPositionalImageTable readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:](self, "readImageDataAtIndex:intoPoolNode:bytesRead:imageWidth:imageHeight:imageDataWidth:imageDataHeight:startingOffset:bytesPerRow:uuidBytes:", a4, v6, &v22, (char *)&v26 + 4, &v26, (char *)&v25 + 4, &v25, &v23, &v24, 0);
  ImageAtIndex = 0;
  if (v8)
  {
    v10 = HIDWORD(v26) + 6;
    if (SHIDWORD(v26) >= -3)
      v10 = HIDWORD(v26) + 3;
    v11 = v10 >> 2;
    v12 = v26 + 6;
    if ((int)v26 >= -3)
      v12 = v26 + 3;
    v13 = (int)(16 * v11 * (v12 >> 2));
    -[PLPositionalTable entryLength](self, "entryLength");
    v27 = v13;
    ImageAtIndex = (CGImage *)*v7;
    if (*v7)
    {
      v31 = 169478669;
      v30 = 0xBB31312058544BABLL;
      v32 = xmmword_199EB0340;
      v33 = 0x1908000093B0;
      v34 = HIDWORD(v26);
      v35 = v26;
      v36 = xmmword_199EB0350;
      strcpy(&v38[17], "3");
      strcpy(v38, "ColorSpace_APPLE");
      v38[19] = 0;
      v37 = 0x1300000018;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v13 + 92);
      objc_msgSend(v14, "appendBytes:length:", &v30, 88);
      objc_msgSend(v14, "appendBytes:length:", &v27, 4);
      objc_msgSend(v14, "appendBytes:length:", ImageAtIndex, v27);
      v15 = CGImageSourceCreateWithData((CFDataRef)v14, 0);
      if (v15)
      {
        v16 = v15;
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, 0);
        if (!ImageAtIndex)
        {
          PLThumbnailsGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = objc_msgSend(v14, "length");
            *(_DWORD *)buf = 134217984;
            v29 = v18;
            _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_ERROR, "Unable to decode ASTC KTX data of length: %ld to CGImage", buf, 0xCu);
          }

        }
        CFRelease(v16);
      }
      else
      {
        PLThumbnailsGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = objc_msgSend(v14, "length");
          *(_DWORD *)buf = 134217984;
          v29 = v20;
          _os_log_impl(&dword_199DF7000, v19, OS_LOG_TYPE_ERROR, "Unable to open image source for ASTC KTX data of length: %ld", buf, 0xCu);
        }

        ImageAtIndex = 0;
      }

    }
  }
  PLPositionalTableMemoryPool_Free(v7);
  return ImageAtIndex;
}

@end
