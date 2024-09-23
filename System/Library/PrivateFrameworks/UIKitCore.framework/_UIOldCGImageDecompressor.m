@implementation _UIOldCGImageDecompressor

- (CGImage)waitForImageRef
{
  CGImage *result;
  CGImageRef v4;

  -[_UIOldCGImageDecompressor _decompressEagerly:]((uint64_t)self, 0);
  -[_UIOldCGImageDecompressor _waitForMetadata]((uint64_t)self);
  result = self->_imageRef;
  if (result)
  {
    v4 = CGImageRetain(result);
    return (CGImage *)CFAutorelease(v4);
  }
  return result;
}

- (id)initWithData:(void *)a3 immediateLoadWithMaxSize:(int)a4 renderingIntent:(double)a5 cache:(double)a6
{
  id v12;
  id *v13;
  id *v14;
  char v15;
  id *v16;
  dispatch_block_t v17;
  _QWORD block[4];
  id *v20;
  objc_super v21;

  v12 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)_UIOldCGImageDecompressor;
    v13 = (id *)objc_msgSendSuper2(&v21, sel_init);
    v14 = v13;
    if (v13)
    {
      *((double *)v13 + 2) = a5;
      *((double *)v13 + 3) = a6;
      v13[5] = a3;
      objc_storeStrong(v13 + 1, a2);
      if (a4)
        v15 = 32;
      else
        v15 = 0;
      *((_BYTE *)v14 + 64) = (_BYTE)v14[8] & 0xDF | v15;
      v14[6] = 0;
      *((_DWORD *)v14 + 14) = 0;
      *((_DWORD *)v14 + 15) = 0;
    }
    if (qword_1ECD7A7B8 != -1)
      dispatch_once(&qword_1ECD7A7B8, &__block_literal_global_647);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89___UIOldCGImageDecompressor_initWithData_immediateLoadWithMaxSize_renderingIntent_cache___block_invoke_2;
    block[3] = &unk_1E16B1B28;
    v16 = v14;
    v20 = v16;
    v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async((dispatch_queue_t)_MergedGlobals_3_26, v17);
    a1 = v16;

  }
  return a1;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)_UIOldCGImageDecompressor;
  -[_UIOldCGImageDecompressor dealloc](&v3, sel_dealloc);
}

- (void)_waitForMetadata
{
  uint64_t v2;
  const __CFDictionary *v3;
  CGImageSource *v4;
  CGImageSource *v5;
  char v6;
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    }
    else
    {
      if ((*(_BYTE *)(a1 + 64) & 0x20) != 0)
      {
        v3 = 0;
      }
      else
      {
        v2 = *MEMORY[0x1E0CBD288];
        v8[0] = *MEMORY[0x1E0CBD240];
        v8[1] = v2;
        v9[0] = MEMORY[0x1E0C9AAA0];
        v9[1] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
        v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      }
      v4 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 8), v3);
      v7 = 0;
      if (v4)
      {
        v5 = v4;
        _UIImageGetOrientationAndScale(v4, 0, v3, (unint64_t)&v7, 0);
        CFRelease(v5);
        v6 = 2 * (v7 & 7);
      }
      else
      {
        v6 = 0;
      }
      *(_BYTE *)(a1 + 64) = *(_BYTE *)(a1 + 64) & 0xF1 | v6;
      *(_BYTE *)(a1 + 64) |= 1u;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    }
  }
}

- (void)_decompressEagerly:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  NSObject *v4;
  __CFDictionary *Mutable;
  double v7;
  double v8;
  void *v9;
  void *v10;
  const __CFData *v11;
  const __CFDictionary *v12;
  CGImageSource *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  void *Value;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  double v23;
  _QWORD *v24;
  CFNumberRef v25;
  int v26;
  CFNumberRef v27;
  dispatch_semaphore_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t TypeWithData;
  void *v34;
  char v35;
  CGImageRef v36;
  void *v37;
  _QWORD *v38;
  objc_class *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  id v44;
  objc_class *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  id v50;
  objc_class *v51;
  void *v52;
  NSObject *v53;
  _QWORD block[4];
  id v55;
  id location;
  const __CFString *v57;
  _QWORD valuePtr[3];

  valuePtr[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 60);
    if (a2)
    {
      if (!os_unfair_lock_trylock(v3))
        return;
    }
    else
    {
      os_unfair_lock_lock(v3);
    }
    if ((*(_BYTE *)(a1 + 64) & 0x10) != 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
      return;
    }
    objc_initWeak(&location, (id)a1);
    dispatch_get_global_queue(2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48___UIOldCGImageDecompressor__decompressEagerly___block_invoke;
    block[3] = &unk_1E16B3F40;
    objc_copyWeak(&v55, &location);
    dispatch_async(v4, block);

    if (_decompressEagerly__oneSessionRefToken != -1)
      dispatch_once(&_decompressEagerly__oneSessionRefToken, &__block_literal_global_13_10);
    if (atomic_load(&jpegDecodeSessionRef))
    {
      Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v8 = *MEMORY[0x1E0C9D820];
      v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (*(double *)(a1 + 16) != *MEMORY[0x1E0C9D820] || *(double *)(a1 + 24) != v7)
      {
        v9 = *(void **)(a1 + 8);
        v57 = CFSTR("kCGImageSourceSkipMetadata");
        valuePtr[0] = *MEMORY[0x1E0C9AE50];
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v9;
        objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", valuePtr, &v57, 1);
        v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        v13 = CGImageSourceCreateWithData(v11, 0);

        v14 = CGImageSourceCopyPropertiesAtIndex(v13, 0, v12);
        v15 = v14;
        if (v14)
        {
          Value = (void *)CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E0CBD048]);
          v17 = (void *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E0CBD040]);
          objc_msgSend(Value, "floatValue");
          v19 = v18;
          objc_msgSend(v17, "floatValue");
          v21 = v20;
          CFRelease(v15);
          CFRelease(v13);
          v22 = v19;
          v23 = v21;
        }
        else
        {
          CFRelease(v13);
          v23 = v7;
          v22 = v8;
        }

        if (v22 != v8 || v23 != v7)
        {
          v24 = (_QWORD *)(a1 + 16);
          if (v22 <= v23)
            v24 = (_QWORD *)(a1 + 24);
          valuePtr[0] = *v24;
          v25 = CFNumberCreate(0, kCFNumberFloatType, valuePtr);
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D095D8], v25);
          CFRelease(v25);
        }
      }
      if (*(_QWORD *)(a1 + 40))
        v26 = 1111970369;
      else
        v26 = 875704422;
      LODWORD(valuePtr[0]) = v26;
      v27 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D095E0], v27);
      CFRelease(v27);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D095D0], (const void *)*MEMORY[0x1E0C9AE50]);
      v28 = dispatch_semaphore_create(0);
      atomic_load(&jpegDecodeSessionRef);
      v53 = v28;
      *(_QWORD *)(a1 + 48) = CMPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously();
      dispatch_semaphore_wait(v53, 0xFFFFFFFFFFFFFFFFLL);
      CFRelease(Mutable);

    }
    if ((*(_BYTE *)(a1 + 64) & 0x10) != 0)
    {
LABEL_39:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);
      return;
    }
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 60));
    v29 = *(void **)(a1 + 8);
    LOBYTE(valuePtr[0]) = 0;
    v30 = (void *)*MEMORY[0x1E0CEC530];
    v31 = v29;
    objc_msgSend(v30, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    TypeWithData = CGImageSourceGetTypeWithData();

    if (LOBYTE(valuePtr[0])
      || (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", TypeWithData),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = objc_msgSend(v34, "conformsToType:", v30),
          v34,
          (v35 & 1) != 0))
    {
      v36 = _UIImageRefFromData(*(void **)(a1 + 8), 0, 0, 0);
      *(_QWORD *)(a1 + 32) = v36;
      if (v36)
      {
LABEL_38:
        *(_BYTE *)(a1 + 64) |= 0x10u;
        goto LABEL_39;
      }
      v37 = (void *)MEMORY[0x1E0CB3940];
      v38 = (id)a1;
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("<%@: %p>"), v40, v38);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v42 = (void *)v38[1];
      if (v42)
      {
        v43 = (void *)MEMORY[0x1E0CB3940];
        v44 = v42;
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "stringWithFormat:", CFSTR("<%@: %p>"), v46, v44);
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v47 = CFSTR("(nil)");
      }
      NSLog(CFSTR("Unable to create image %@ from data: %@"), v41, v47);

    }
    else
    {
      v48 = *(void **)(a1 + 8);
      if (v48)
      {
        v49 = (void *)MEMORY[0x1E0CB3940];
        v50 = v48;
        v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringWithFormat:", CFSTR("<%@: %p>"), v52, v50);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v41 = CFSTR("(nil)");
      }
      NSLog(CFSTR("Invalid JPEG data for creating image: %@"), v41);
    }

    goto LABEL_38;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

+ (uint64_t)flushCaches
{
  uint64_t result;

  objc_opt_self();
  result = atomic_load(&jpegDecodeSessionRef);
  if (result)
    return CMPhotoJPEGDecodeSessionDiscardCachedBuffers();
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (double *)v4;
    v6 = (NSData *)*((_QWORD *)v5 + 1) == self->_imageData
      && *((_QWORD *)v5 + 5) == self->_renderingIntent
      && ((*(_BYTE *)&self->_decompressorFlags ^ *((unsigned __int8 *)v5 + 64)) & 0x20) == 0
      && v5[3] == self->_maxSize.height
      && v5[2] == self->_maxSize.width;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_imageData, "hash");
}

@end
