@implementation PKBitmapConversionDescriptor

+ (id)create
{
  id result;
  objc_super v3;

  result = [PKBitmapConversionDescriptor alloc];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)PKBitmapConversionDescriptor;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
    {
      *((_WORD *)result + 4) = 0;
      *((_DWORD *)result + 3) = 0;
    }
  }
  return result;
}

+ (id)create8Uint
{
  PKBitmapConversionDescriptor *v2;
  id v3;
  void *v4;
  objc_super v6;

  v2 = [PKBitmapConversionDescriptor alloc];
  if (v2)
  {
    v6.receiver = v2;
    v6.super_class = (Class)PKBitmapConversionDescriptor;
    v3 = objc_msgSendSuper2(&v6, sel_init);
    v4 = v3;
    if (v3)
    {
      *((_WORD *)v3 + 4) = 0;
      *((_DWORD *)v3 + 3) = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "setFloatingComponents:", 0);
  objc_msgSend(v4, "setBitsPerComponent:withByteOrder:", 8, 0x2000);
  objc_msgSend(v4, "setAlphaInfoTransform:", &__block_literal_global_44);
  return v4;
}

uint64_t __43__PKBitmapConversionDescriptor_create8Uint__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  if (a2 < 8)
    return dword_190453EE0[a2];
  __break(1u);
  return result;
}

+ (id)create16Float
{
  PKBitmapConversionDescriptor *v2;
  id v3;
  void *v4;
  objc_super v6;

  v2 = [PKBitmapConversionDescriptor alloc];
  if (v2)
  {
    v6.receiver = v2;
    v6.super_class = (Class)PKBitmapConversionDescriptor;
    v3 = objc_msgSendSuper2(&v6, sel_init);
    v4 = v3;
    if (v3)
    {
      *((_WORD *)v3 + 4) = 0;
      *((_DWORD *)v3 + 3) = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "setFloatingComponents:", 1);
  objc_msgSend(v4, "setBitsPerComponent:withByteOrder:", 16, 4096);
  objc_msgSend(v4, "setAlphaInfoTransform:", &__block_literal_global_36);
  return v4;
}

uint64_t __45__PKBitmapConversionDescriptor_create16Float__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  if (a2 < 8)
    return dword_190453F00[a2];
  __break(1u);
  return result;
}

+ (id)create32Float
{
  PKBitmapConversionDescriptor *v2;
  id v3;
  void *v4;
  objc_super v6;

  v2 = [PKBitmapConversionDescriptor alloc];
  if (v2)
  {
    v6.receiver = v2;
    v6.super_class = (Class)PKBitmapConversionDescriptor;
    v3 = objc_msgSendSuper2(&v6, sel_init);
    v4 = v3;
    if (v3)
    {
      *((_WORD *)v3 + 4) = 0;
      *((_DWORD *)v3 + 3) = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "setFloatingComponents:", 1);
  objc_msgSend(v4, "setBitsPerComponent:withByteOrder:", 32, 0x2000);
  objc_msgSend(v4, "setAlphaInfoTransform:", &__block_literal_global_37_0);
  return v4;
}

uint64_t __45__PKBitmapConversionDescriptor_create32Float__block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  if (a2 < 8)
    return dword_190453F00[a2];
  __break(1u);
  return result;
}

- (PKBitmapConversionDescriptor)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PKBitmapConversionDescriptor;
  -[PKBitmapConversionDescriptor dealloc](&v3, sel_dealloc);
}

- (BOOL)convertContext:(id)a3
{
  return -[PKBitmapConversionDescriptor _convertContext:]((uint64_t)self, a3);
}

- (uint64_t)_convertContext:(uint64_t)a1
{
  id v3;
  void *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  vImage_CGImageFormat *v8;
  int v9;
  int v10;
  _DWORD *v11;
  int v12;
  __int128 v13;
  CGColorSpace *v14;
  size_t NumberOfComponents;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  CGColorRenderingIntent v19;
  CGColorSpace *v20;
  const __CFString *Name;
  const __CFString *v22;
  size_t v23;
  const CGFloat *v24;
  int v25;
  size_t v26;
  vImageConverter *v27;
  vImageConverter *v28;
  unint64_t NumberOfSourceBuffers;
  unint64_t NumberOfDestinationBuffers;
  unint64_t v31;
  vImage_Error v32;
  unint64_t v33;
  void **v34;
  void *v35;
  vImagePixelCount v36;
  NSObject *v37;
  NSObject *v38;
  vImage_Error v39;
  CGContext *v40;
  CGContext *v41;
  CGColorSpace *v42;
  CGColorSpace *v43;
  int v44;
  size_t v45;
  NSObject *v46;
  uint64_t v47;
  vImagePixelCount height;
  size_t rowBytes;
  NSObject *v50;
  const char *v51;
  vImagePixelCount v52;
  uint64_t v53;
  NSObject *v54;
  uint32_t v55;
  char v56;
  vm_size_t v57;
  id v58;
  size_t v59;
  void *v60;
  const void *v61;
  void *v62;
  CGBitmapInfo bitmapInfo;
  uint32_t version;
  CGColorRenderingIntent renderingIntent;
  __int128 v66;
  NSObject *v68;
  vImage_Error v69;
  vImage_CGImageFormat space;
  vImage_Buffer buf;
  vImage_Error error;
  unsigned __int8 v73;
  uint8_t v74[4];
  char *v75;
  __int16 v76;
  vImage_Error v77;
  __int16 v78;
  unint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
      goto LABEL_122;
    v5 = (char *)objc_retainAutorelease(v3);
    v6 = *((_DWORD *)v5 + 8) & 0x1F;
    v7 = *(_QWORD *)(a1 + 16);
    if (v7)
    {
      LODWORD(v6) = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);
      if (v6 >= 0x20)
        goto LABEL_122;
    }
    v8 = (vImage_CGImageFormat *)(v5 + 16);
    v9 = *(unsigned __int8 *)(a1 + 8) << 8;
    v10 = *(unsigned __int8 *)(a1 + 9);
    v11 = (_DWORD *)(a1 + 12);
    if (!*(_BYTE *)(a1 + 9))
      v11 = v5 + 32;
    v12 = *v11 & 0x7000;
    memset(&space, 0, sizeof(space));
    if (&space != v8)
    {
      v13 = *((_OWORD *)v5 + 2);
      *(_OWORD *)&space.bitsPerComponent = *(_OWORD *)&v8->bitsPerComponent;
      *(_OWORD *)&space.bitmapInfo = v13;
      *(_QWORD *)&space.renderingIntent = *((_QWORD *)v5 + 6);
    }
    space.bitmapInfo = v9 | v12 | v6;
    if ((_DWORD)v6 == 7)
    {
      v14 = 0;
    }
    else
    {
      v14 = *(CGColorSpace **)(a1 + 24);
      if (!v14)
        v14 = (CGColorSpace *)*((_QWORD *)v5 + 3);
    }
    space.colorSpace = v14;
    if (v10)
    {
      if ((_DWORD)v6 == 7 || !v14)
      {
        NumberOfComponents = (_DWORD)v6 != 0;
      }
      else
      {
        NumberOfComponents = CGColorSpaceGetNumberOfComponents(v14);
        if (NumberOfComponents >= 0x100)
          goto LABEL_122;
        if ((_DWORD)v6)
        {
          if (NumberOfComponents == 255)
            goto LABEL_122;
          ++NumberOfComponents;
        }
      }
      v16 = *(unsigned __int8 *)(a1 + 9);
      space.bitsPerComponent = *(unsigned __int8 *)(a1 + 9);
      v17 = NumberOfComponents * v16;
      if (v17 >= 0x100)
        goto LABEL_122;
      space.bitsPerPixel = v17;
    }
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = (*(unsigned int (**)(uint64_t, _QWORD, CGColorSpaceRef))(v18 + 16))(v18, *((_QWORD *)v5 + 3), space.colorSpace);
    else
      v19 = kCGRenderingIntentPerceptual;
    space.renderingIntent = v19;
    if (v5[8])
LABEL_123:
      __break(1u);
    if (*((_QWORD *)v5 + 2) == *(_QWORD *)&space.bitsPerComponent)
    {
      v20 = (CGColorSpace *)*((_QWORD *)v5 + 3);
      if (v20 == space.colorSpace)
        goto LABEL_36;
      if (v20)
      {
        if (space.colorSpace)
        {
          Name = CGColorSpaceGetName(v20);
          v22 = CGColorSpaceGetName(space.colorSpace);
          if (Name == v22 || Name && v22 && CFStringCompare(Name, v22, 0) == kCFCompareEqualTo)
          {
            v23 = CGColorSpaceGetNumberOfComponents(*((CGColorSpaceRef *)v5 + 3));
            if (v23 != CGColorSpaceGetNumberOfComponents(space.colorSpace))
              goto LABEL_122;
LABEL_36:
            if (*((_DWORD *)v5 + 9) == space.version && *((_DWORD *)v5 + 8) == space.bitmapInfo)
            {
              v24 = (const CGFloat *)*((_QWORD *)v5 + 5);
              if (v24 == space.decode)
                goto LABEL_94;
              if (v24 && space.decode)
              {
                v25 = *((_DWORD *)v5 + 8) & 0x1F;
                if (v25 == 7 || !space.colorSpace)
                {
                  LOBYTE(v26) = v25 != 0;
                }
                else
                {
                  v26 = CGColorSpaceGetNumberOfComponents(space.colorSpace);
                  if (v26 >= 0x100)
                    goto LABEL_122;
                  if (v25)
                  {
                    if (v26 == 255)
                      goto LABEL_122;
                    LOBYTE(v26) = v26 + 1;
                  }
                }
                if (!memcmp(*((const void **)v5 + 5), space.decode, 16 * v26))
                {
LABEL_94:
                  v47 = 1;
                  goto LABEL_112;
                }
              }
            }
          }
        }
      }
    }
    error = 0;
    v27 = vImageConverter_CreateWithCGImageFormat((const vImage_CGImageFormat *)(v5 + 16), &space, 0, 0, &error);
    if (v27)
    {
      v28 = v27;
      error = 0;
      NumberOfSourceBuffers = vImageConverter_GetNumberOfSourceBuffers(v27);
      NumberOfDestinationBuffers = vImageConverter_GetNumberOfDestinationBuffers(v28);
      v31 = NumberOfDestinationBuffers;
      if (NumberOfSourceBuffers == 1 && NumberOfDestinationBuffers == 1)
      {
        memset(&buf, 0, sizeof(buf));
        v32 = vImageBuffer_Init(&buf, *((_QWORD *)v5 + 8), *((_QWORD *)v5 + 9), space.bitsPerPixel, 0x200u);
        if (v32 < 0)
          goto LABEL_122;
        if (!is_mul_ok(buf.height, buf.rowBytes))
        {
          v38 = 0;
          goto LABEL_90;
        }
        v33 = v32;
        v34 = (void **)(v5 + 56);
        v35 = (void *)*((_QWORD *)v5 + 11);
        if (v35)
        {
          v36 = buf.height * buf.rowBytes;
          if (v36 <= objc_msgSend(v35, "length") && (!v33 || !((unint64_t)*v34 % v33)))
          {
            buf.data = *v34;
            v37 = *((id *)v5 + 11);
            if (!vImageConverter_MustOperateOutOfPlace(v28, (const vImage_Buffer *)(v5 + 56), &buf, 0x10u))
              goto LABEL_61;
            buf.data = 0;

          }
        }
        v37 = 0;
LABEL_61:
        if (buf.data)
        {
          v38 = v37;
LABEL_63:
          v39 = vImageConvert_AnyToAny(v28, (const vImage_Buffer *)(v5 + 56), &buf, 0, 0x10u);
          error = v39;
          if (!v39)
          {
            vImageConverter_Release(v28);
            v40 = _PKCreateBitmapContext((CGColorSpaceRef *)&space, (uint64_t)&buf, v38, 1);
            if (v40)
            {
              v41 = v40;
              CGContextGetBaseCTM();
              CGContextSetBaseCTM();
              if (&space == v8)
              {
LABEL_110:
                v66 = *(_OWORD *)&buf.width;
                *(_OWORD *)v34 = *(_OWORD *)&buf.data;
                *(_OWORD *)(v5 + 72) = v66;
                objc_storeStrong((id *)v5 + 11, v38);
                CGContextRelease(*((CGContextRef *)v5 + 12));
                *((_QWORD *)v5 + 12) = v41;
                v56 = 1;
                goto LABEL_111;
              }
              v42 = CGColorSpaceRetain(space.colorSpace);
              v43 = v42;
              if (!space.decode)
                goto LABEL_104;
              v44 = space.bitmapInfo & 0x1F;
              if (!v42 || v44 == 7)
              {
                if ((space.bitmapInfo & 0x1F) != 0)
                {
                  LOBYTE(v45) = 1;
                  goto LABEL_103;
                }
                goto LABEL_104;
              }
              v45 = CGColorSpaceGetNumberOfComponents(v42);
              if (v45 < 0x100)
              {
                if (v44)
                {
                  if (v45 != 255)
                  {
                    LOBYTE(v45) = v45 + 1;
LABEL_103:
                    v59 = 16 * v45;
                    v60 = malloc_type_aligned_alloc(8uLL, v59, 0x84BB333AuLL);
                    memcpy(v60, space.decode, v59);
LABEL_105:
                    v61 = (const void *)*((_QWORD *)v5 + 3);
                    if (v61)
                    {
                      CFRelease(v61);
                      *((_QWORD *)v5 + 3) = 0;
                    }
                    v62 = (void *)*((_QWORD *)v5 + 5);
                    if (v62)
                      free(v62);
                    bitmapInfo = space.bitmapInfo;
                    version = space.version;
                    renderingIntent = space.renderingIntent;
                    *((_QWORD *)v5 + 2) = *(_QWORD *)&space.bitsPerComponent;
                    *((_QWORD *)v5 + 3) = v43;
                    *((_DWORD *)v5 + 8) = bitmapInfo;
                    *((_DWORD *)v5 + 9) = version;
                    *((_QWORD *)v5 + 5) = v60;
                    *((_DWORD *)v5 + 12) = renderingIntent;
                    goto LABEL_110;
                  }
                  goto LABEL_122;
                }
                if ((_BYTE)v45)
                  goto LABEL_103;
LABEL_104:
                v60 = 0;
                goto LABEL_105;
              }
LABEL_122:
              __break(1u);
              goto LABEL_123;
            }
LABEL_91:
            v56 = 0;
LABEL_111:
            v73 = v56;

            v47 = v73;
            goto LABEL_112;
          }
          v69 = v39;
          PKLogFacilityTypeGetObject(0);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v74 = 134218240;
            v75 = v5;
            v76 = 2048;
            v77 = v69;
            _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "PKBitmapContext (%p): could not convert to destination format - %zd.", v74, 0x16u);
          }
          goto LABEL_89;
        }
        height = buf.height;
        rowBytes = buf.rowBytes;
        if (!is_mul_ok(buf.height, buf.rowBytes))
        {
          PKLogFacilityTypeGetObject(0);
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v74 = 134218240;
            v75 = (char *)height;
            v76 = 2048;
            v77 = rowBytes;
            v51 = "PKBitmapContext: image length computation overflowed - %zu x %zu.";
LABEL_85:
            v54 = v50;
            v55 = 22;
LABEL_86:
            _os_log_impl(&dword_18FC92000, v54, OS_LOG_TYPE_DEFAULT, v51, v74, v55);
            goto LABEL_87;
          }
          goto LABEL_87;
        }
        v52 = buf.height * buf.rowBytes;
        if (buf.height * buf.rowBytes)
        {
          v53 = *MEMORY[0x1E0C85AD8] - 1;
          if (__CFADD__(v52, v53))
          {
            PKLogFacilityTypeGetObject(0);
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v74 = 134218240;
              v75 = (char *)v52;
              v76 = 2048;
              v77 = v53;
              v51 = "PKBitmapContext: buffer length computation overflowed - %zu + %zu.";
              goto LABEL_85;
            }
LABEL_87:

            goto LABEL_88;
          }
          v57 = (v52 + v53) & -*MEMORY[0x1E0C85AD8];
          if (v52 > v57)
            goto LABEL_122;
          if (vm_allocate(*MEMORY[0x1E0C83DA0], (vm_address_t *)&buf, v57, 1))
          {
            PKLogFacilityTypeGetObject(0);
            v50 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              goto LABEL_87;
            *(_DWORD *)v74 = 134217984;
            v75 = (char *)v57;
            v51 = "PKBitmapContext: could not create allocation of size %zu.";
            v54 = v50;
            v55 = 12;
            goto LABEL_86;
          }
          if (buf.data)
          {
            if (v33 && os_variant_has_internal_ui() && (unint64_t)buf.data % v33)
              goto LABEL_122;
            v58 = objc_alloc(MEMORY[0x1E0C99D50]);
            v38 = objc_msgSend(v58, "initWithBytesNoCopy:length:deallocator:", buf.data, v57, &__block_literal_global_93);

            if (!v38)
              goto LABEL_90;
            goto LABEL_63;
          }
        }
LABEL_88:
        v38 = 0;
LABEL_89:

LABEL_90:
        vImageConverter_Release(v28);
        goto LABEL_91;
      }
      PKLogFacilityTypeGetObject(0);
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v74 = 134218496;
        v75 = v5;
        v76 = 2048;
        v77 = NumberOfSourceBuffers;
        v78 = 2048;
        v79 = v31;
        _os_log_impl(&dword_18FC92000, v68, OS_LOG_TYPE_DEFAULT, "PKBitmapContext (%p): converter requires an unexpected number of buffers - %lu -> %lu.", v74, 0x20u);
      }

      vImageConverter_Release(v28);
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v74 = 134218240;
        v75 = v5;
        v76 = 2048;
        v77 = error;
        _os_log_impl(&dword_18FC92000, v46, OS_LOG_TYPE_DEFAULT, "PKBitmapContext (%p): cannot create converter - %zd.", v74, 0x16u);
      }

    }
  }
  v47 = 0;
LABEL_112:

  return v47;
}

- (id)convertFromContext:(id)a3
{
  id result;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  result = a3;
  if (result)
  {
    v5 = result;
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__16;
    v13 = __Block_byref_object_dispose__16;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__PKBitmapConversionDescriptor_convertFromContext___block_invoke;
    v8[3] = &unk_1E2AC6720;
    v8[4] = &v9;
    -[PKBitmapContext _accessContext:]((uint64_t)result, v8);
    if (-[PKBitmapConversionDescriptor _convertContext:]((uint64_t)self, (void *)v10[5]))
      v6 = (void *)v10[5];
    else
      v6 = 0;
    v7 = v6;
    _Block_object_dispose(&v9, 8);

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void __51__PKBitmapConversionDescriptor_convertFromContext___block_invoke(uint64_t a1, CGContext *a2)
{
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = -[PKBitmapContext _initWithBitmapContext:]((unint64_t)[PKBitmapContext alloc], a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)convertImage:(CGImage *)a3
{
  PKBitmapContext *v5;
  char *v6;
  size_t BitsPerComponent;
  int v8;
  size_t BitsPerPixel;
  int v10;
  CGColorSpace *ColorSpace;
  CGBitmapInfo BitmapInfo;
  const CGFloat *Decode;
  CGColorRenderingIntent RenderingIntent;
  CGColorSpace *v15;
  CGColorSpace *v16;
  size_t NumberOfComponents;
  size_t v18;
  void *v19;
  const void *v20;
  void *v21;
  size_t Width;
  size_t Height;
  _QWORD *v24;
  vImage_Error v25;
  unint64_t v26;
  unint64_t v27;
  NSObject *v28;
  const char *v29;
  vm_size_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  vImage_Error v34;
  vImage_Error v35;
  NSObject *v36;
  char *v37;
  void *v39;
  CGContext *v40;
  char *v41;
  vm_size_t v42;
  unint64_t v43;
  NSObject *v44;
  PKBitmapConversionDescriptor *v45;
  objc_super v46;
  uint8_t buf[4];
  char *v48;
  __int16 v49;
  unint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_60;
  v5 = [PKBitmapContext alloc];
  if (!v5)
  {
LABEL_61:
    v6 = 0;
    goto LABEL_40;
  }
  v46.receiver = v5;
  v46.super_class = (Class)PKBitmapContext;
  v6 = -[PKBitmapConversionDescriptor init](&v46, sel_init);
  if (!v6)
  {
LABEL_41:
    v37 = 0;
    goto LABEL_42;
  }
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  if (HIDWORD(BitsPerComponent))
    goto LABEL_60;
  v8 = BitsPerComponent;
  v45 = self;
  BitsPerPixel = CGImageGetBitsPerPixel(a3);
  if (HIDWORD(BitsPerPixel))
    goto LABEL_60;
  v10 = BitsPerPixel;
  ColorSpace = CGImageGetColorSpace(a3);
  BitmapInfo = CGImageGetBitmapInfo(a3);
  Decode = CGImageGetDecode(a3);
  RenderingIntent = CGImageGetRenderingIntent(a3);
  v15 = CGColorSpaceRetain(ColorSpace);
  v16 = v15;
  if (!Decode)
    goto LABEL_17;
  if ((BitmapInfo & 0x1F) == 7 || !v15)
  {
    if ((BitmapInfo & 0x1F) != 0)
    {
      LOBYTE(NumberOfComponents) = 1;
      goto LABEL_16;
    }
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(v15);
  if (NumberOfComponents >= 0x100)
    goto LABEL_60;
  if ((BitmapInfo & 0x1F) != 0)
  {
    if (NumberOfComponents == 255)
      goto LABEL_60;
    LOBYTE(NumberOfComponents) = NumberOfComponents + 1;
    goto LABEL_16;
  }
  if (!(_BYTE)NumberOfComponents)
    goto LABEL_17;
LABEL_16:
  v18 = 16 * NumberOfComponents;
  v19 = malloc_type_aligned_alloc(8uLL, v18, 0x84BB333AuLL);
  memcpy(v19, Decode, v18);
LABEL_18:
  v20 = (const void *)*((_QWORD *)v6 + 3);
  if (v20)
  {
    CFRelease(v20);
    *((_QWORD *)v6 + 3) = 0;
  }
  v21 = (void *)*((_QWORD *)v6 + 5);
  if (v21)
    free(v21);
  *((_DWORD *)v6 + 4) = v8;
  *((_DWORD *)v6 + 5) = v10;
  *((_QWORD *)v6 + 3) = v16;
  *((_DWORD *)v6 + 8) = BitmapInfo;
  *((_DWORD *)v6 + 9) = 0;
  *((_QWORD *)v6 + 5) = v19;
  *((_DWORD *)v6 + 12) = RenderingIntent;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v24 = v6 + 56;
  v25 = vImageBuffer_Init((vImage_Buffer *)(v6 + 56), Height, Width, *((_DWORD *)v6 + 5), 0x200u);
  if (v25 < 0 || *v24)
    goto LABEL_60;
  v26 = *((_QWORD *)v6 + 8);
  v27 = *((_QWORD *)v6 + 10);
  if (!is_mul_ok(v26, v27))
  {
    PKLogFacilityTypeGetObject(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v48 = (char *)v26;
      v49 = 2048;
      v50 = v27;
      v29 = "PKBitmapContext: image length computation overflowed - %zu x %zu.";
LABEL_32:
      _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  v30 = v26 * v27;
  if (!v30)
    goto LABEL_34;
  v31 = *MEMORY[0x1E0C85AD8] - 1;
  if (__CFADD__(v30, v31))
  {
    PKLogFacilityTypeGetObject(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v48 = (char *)v30;
      v49 = 2048;
      v50 = v31;
      v29 = "PKBitmapContext: buffer length computation overflowed - %zu + %zu.";
      goto LABEL_32;
    }
LABEL_33:

    goto LABEL_34;
  }
  v42 = (v30 + v31) & -*MEMORY[0x1E0C85AD8];
  if (v30 > v42)
    goto LABEL_60;
  v43 = v25;
  if (vm_allocate(*MEMORY[0x1E0C83DA0], (vm_address_t *)v6 + 7, v42, 1))
  {
    PKLogFacilityTypeGetObject(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v48 = (char *)v42;
      _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "PKBitmapContext: could not create allocation of size %zu.", buf, 0xCu);
    }

    goto LABEL_34;
  }
  if (!*v24)
  {
LABEL_34:
    v32 = 0;
    goto LABEL_35;
  }
  if (v43 && os_variant_has_internal_ui() && *v24 % v43)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", *v24, v42, &__block_literal_global_93);
LABEL_35:
  v33 = (void *)*((_QWORD *)v6 + 11);
  *((_QWORD *)v6 + 11) = v32;

  if (!*((_QWORD *)v6 + 11))
  {
LABEL_40:

    v6 = 0;
    goto LABEL_41;
  }
  v34 = vImageBuffer_InitWithCGImage((vImage_Buffer *)(v6 + 56), (vImage_CGImageFormat *)(v6 + 16), 0, a3, 0x210u);
  if (v34)
  {
    v35 = v34;
    PKLogFacilityTypeGetObject(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v48 = v6;
      v49 = 2048;
      v50 = v35;
      _os_log_impl(&dword_18FC92000, v36, OS_LOG_TYPE_DEFAULT, "PKBitmapContext (%p): could not unpack image into buffer - %zd.", buf, 0x16u);
    }

    goto LABEL_40;
  }
  v39 = (void *)*((_QWORD *)v6 + 5);
  if (v39)
  {
    free(v39);
    *((_QWORD *)v6 + 5) = 0;
  }
  v40 = _PKCreateBitmapContext((CGColorSpaceRef *)v6 + 2, (uint64_t)(v6 + 56), *((void **)v6 + 11), 1);
  *((_QWORD *)v6 + 12) = v40;
  if (!v40)
    goto LABEL_40;
  v6 = v6;

  if (-[PKBitmapConversionDescriptor _convertContext:]((uint64_t)v45, v6))
    v41 = v6;
  else
    v41 = 0;
  v37 = v41;
LABEL_42:

  return v37;
}

- (void)setBitsPerComponent:(unsigned __int8)a3 withByteOrder:(unsigned int)a4
{
  self->_bitsPerComponent = a3;
  if ((a4 & 0xFFFF8FFF) != 0)
    __break(1u);
  else
    self->_byteOrder = a4 & 0x7000;
}

- (void)setColorSpace:(CGColorSpace *)a3 withPolicy:(id)a4
{
  CGColorSpace *colorSpace;
  id v7;
  void *v8;
  id colorTransformPolicy;

  colorSpace = self->_colorSpace;
  v7 = a4;
  CGColorSpaceRelease(colorSpace);
  self->_colorSpace = CGColorSpaceRetain(a3);
  v8 = _Block_copy(v7);

  colorTransformPolicy = self->_colorTransformPolicy;
  self->_colorTransformPolicy = v8;

}

- (id)alphaInfoTransform
{
  return self->_alphaInfoTransform;
}

- (void)setAlphaInfoTransform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)floatingComponents
{
  return self->_floatingComponents;
}

- (void)setFloatingComponents:(BOOL)a3
{
  self->_floatingComponents = a3;
}

- (unsigned)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (unsigned)byteOrder
{
  return self->_byteOrder;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (id)colorTransformPolicy
{
  return self->_colorTransformPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_colorTransformPolicy, 0);
  objc_storeStrong(&self->_alphaInfoTransform, 0);
}

@end
