@implementation PKBitmapContext

+ (id)createWithSize:(id)a3 origin:(char)a4 format:(const vImage_CGImageFormat *)a5
{
  return -[PKBitmapContext _initWithSize:origin:format:]([PKBitmapContext alloc], a3.var0, a3.var1, a4, &a5->bitsPerComponent);
}

- (uint32_t)_initWithSize:(vImagePixelCount)a3 origin:(int)a4 format:(uint32_t *)a5
{
  uint32_t *v9;
  uint32_t *v10;
  CGColorSpace *v11;
  CGColorSpace *v12;
  int v13;
  size_t NumberOfComponents;
  size_t v15;
  void *v16;
  const void *v17;
  void *v18;
  uint32_t v19;
  uint32_t v20;
  uint32_t v21;
  uint64_t v22;
  _QWORD *v23;
  vImage_Error v24;
  unint64_t v25;
  unint64_t v26;
  NSObject *v27;
  const char *v28;
  vm_size_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  CGContext *v34;
  uint32_t *v35;
  vm_size_t v36;
  unint64_t v37;
  NSObject *v38;
  objc_super v40;
  uint8_t buf[4];
  unint64_t v42;
  __int16 v43;
  unint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    goto LABEL_50;
  if (!a5)
    goto LABEL_49;
  v40.receiver = a1;
  v40.super_class = (Class)PKBitmapContext;
  v9 = (uint32_t *)objc_msgSendSuper2(&v40, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v9 + 4 == a5)
    {
      v19 = v9[5];
      goto LABEL_22;
    }
    v11 = CGColorSpaceRetain(*((CGColorSpaceRef *)a5 + 1));
    v12 = v11;
    if (*((_QWORD *)a5 + 3))
    {
      v13 = a5[4] & 0x1F;
      if (!v11 || v13 == 7)
      {
        if (v13)
        {
          LOBYTE(NumberOfComponents) = 1;
          goto LABEL_15;
        }
      }
      else
      {
        NumberOfComponents = CGColorSpaceGetNumberOfComponents(v11);
        if (NumberOfComponents >= 0x100)
          goto LABEL_49;
        if (v13)
        {
          if (NumberOfComponents == 255)
            goto LABEL_49;
          LOBYTE(NumberOfComponents) = NumberOfComponents + 1;
          goto LABEL_15;
        }
        if ((_BYTE)NumberOfComponents)
        {
LABEL_15:
          v15 = 16 * NumberOfComponents;
          v16 = malloc_type_aligned_alloc(8uLL, v15, 0x84BB333AuLL);
          memcpy(v16, *((const void **)a5 + 3), v15);
LABEL_17:
          v17 = (const void *)*((_QWORD *)v10 + 3);
          if (v17)
          {
            CFRelease(v17);
            *((_QWORD *)v10 + 3) = 0;
          }
          v18 = (void *)*((_QWORD *)v10 + 5);
          if (v18)
            free(v18);
          v20 = *a5;
          v19 = a5[1];
          v21 = a5[8];
          *((_QWORD *)v10 + 3) = v12;
          v22 = *((_QWORD *)a5 + 2);
          v10[4] = v20;
          v10[5] = v19;
          *((_QWORD *)v10 + 4) = v22;
          *((_QWORD *)v10 + 5) = v16;
          v10[12] = v21;
LABEL_22:
          v23 = v10 + 14;
          v24 = vImageBuffer_Init((vImage_Buffer *)(v10 + 14), a3, a2, v19, 0x200u);
          if ((v24 & 0x8000000000000000) == 0 && !*v23)
          {
            v25 = *((_QWORD *)v10 + 8);
            v26 = *((_QWORD *)v10 + 10);
            if (!is_mul_ok(v25, v26))
            {
              PKLogFacilityTypeGetObject(0);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                v42 = v25;
                v43 = 2048;
                v44 = v26;
                v28 = "PKBitmapContext: image length computation overflowed - %zu x %zu.";
LABEL_32:
                _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
                goto LABEL_33;
              }
              goto LABEL_33;
            }
            v29 = v25 * v26;
            if (!v29)
              goto LABEL_34;
            v30 = *MEMORY[0x1E0C85AD8] - 1;
            if (__CFADD__(v29, v30))
            {
              PKLogFacilityTypeGetObject(0);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                v42 = v29;
                v43 = 2048;
                v44 = v30;
                v28 = "PKBitmapContext: buffer length computation overflowed - %zu + %zu.";
                goto LABEL_32;
              }
LABEL_33:

              goto LABEL_34;
            }
            v36 = (v29 + v30) & -*MEMORY[0x1E0C85AD8];
            if (v29 > v36)
              goto LABEL_49;
            v37 = v24;
            if (vm_allocate(*MEMORY[0x1E0C83DA0], (vm_address_t *)v10 + 7, v36, 1))
            {
              PKLogFacilityTypeGetObject(0);
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v42 = v36;
                _os_log_impl(&dword_18FC92000, v38, OS_LOG_TYPE_DEFAULT, "PKBitmapContext: could not create allocation of size %zu.", buf, 0xCu);
              }

              goto LABEL_34;
            }
            if (!*v23)
            {
LABEL_34:
              v31 = 0;
LABEL_35:
              v32 = (void *)*((_QWORD *)v10 + 11);
              *((_QWORD *)v10 + 11) = v31;

              v33 = (void *)*((_QWORD *)v10 + 11);
              if (v33)
              {
                v34 = _PKCreateBitmapContext((CGColorSpaceRef *)v10 + 2, (uint64_t)(v10 + 14), v33, a4);
                *((_QWORD *)v10 + 12) = v34;
                if (v34)
                  goto LABEL_37;
              }
LABEL_51:
              v35 = 0;
              goto LABEL_52;
            }
            if (!v37 || !os_variant_has_internal_ui() || !(*v23 % v37))
            {
              v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", *v23, v36, &__block_literal_global_93);
              goto LABEL_35;
            }
          }
LABEL_49:
          __break(1u);
LABEL_50:
          v10 = 0;
          goto LABEL_51;
        }
      }
    }
    v16 = 0;
    goto LABEL_17;
  }
LABEL_37:
  v10 = v10;
  v35 = v10;
LABEL_52:

  return v35;
}

+ (id)create8UintWithSize:(id)a3 configuration:(id)a4
{
  __int16 v4;
  vImagePixelCount var1;
  vImagePixelCount var0;
  CGColorSpace *v7;
  CGColorSpace *v8;
  size_t NumberOfComponents;
  unint64_t v10;
  int v11;
  uint32_t v13[2];
  CGColorSpace *v14;
  int v15;
  uint64_t v16;
  _BYTE v17[12];

  v4 = *(_WORD *)&a4.var0;
  var1 = a3.var1;
  var0 = a3.var0;
  if ((*(_DWORD *)&a4.var0 & 0x10000) != 0)
    v7 = (CGColorSpace *)PKColorSpaceStandardLinearRGB();
  else
    v7 = (CGColorSpace *)PKColorSpaceStandardRGB();
  v8 = v7;
  if (v7)
  {
    NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
    if (NumberOfComponents <= 0xFE)
    {
      v10 = (8 * (_WORD)NumberOfComponents + 8) & 0x7F8;
      if (v10 < 0x100)
        goto LABEL_9;
    }
    __break(1u);
  }
  LOBYTE(v10) = 8;
LABEL_9:
  *(_QWORD *)&v17[4] = 0;
  if ((v4 & 0x100) != 0)
    v11 = 8198;
  else
    v11 = 8194;
  v13[0] = 8;
  v13[1] = v10 & 0xF8;
  v14 = v8;
  v15 = v11;
  v16 = 0;
  *(_QWORD *)v17 = 0;
  return -[PKBitmapContext _initWithSize:origin:format:]([PKBitmapContext alloc], var0, var1, (char)v4, v13);
}

+ (id)create16FloatWithSize:(id)a3 configuration:(id)a4
{
  __int16 v4;
  vImagePixelCount var1;
  vImagePixelCount var0;
  CGColorSpace *v7;
  CGColorSpace *v8;
  size_t NumberOfComponents;
  unint64_t v10;
  int v11;
  uint32_t v13[2];
  CGColorSpace *v14;
  int v15;
  uint64_t v16;
  _BYTE v17[12];

  v4 = *(_WORD *)&a4.var0;
  var1 = a3.var1;
  var0 = a3.var0;
  if ((*(_DWORD *)&a4.var0 & 0x10000) != 0)
    v7 = (CGColorSpace *)PKColorSpaceStandardLinearRGB();
  else
    v7 = (CGColorSpace *)PKColorSpaceStandardRGB();
  v8 = v7;
  if (v7)
  {
    NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
    if (NumberOfComponents <= 0xFE)
    {
      v10 = (16 * (_WORD)NumberOfComponents + 16) & 0xFF0;
      if (v10 < 0x100)
        goto LABEL_9;
    }
    __break(1u);
  }
  LOBYTE(v10) = 16;
LABEL_9:
  *(_QWORD *)&v17[4] = 0;
  if ((v4 & 0x100) != 0)
    v11 = 4357;
  else
    v11 = 4353;
  v13[0] = 16;
  v13[1] = v10 & 0xF0;
  v14 = v8;
  v15 = v11;
  v16 = 0;
  *(_QWORD *)v17 = 0;
  return -[PKBitmapContext _initWithSize:origin:format:]([PKBitmapContext alloc], var0, var1, (char)v4, v13);
}

+ (id)create16FloatExtendedWithSize:(id)a3 configuration:(id)a4
{
  __int16 v4;
  vImagePixelCount var1;
  vImagePixelCount var0;
  CGColorSpace *v7;
  CGColorSpace *v8;
  size_t NumberOfComponents;
  unint64_t v10;
  int v11;
  uint32_t v13[2];
  CGColorSpace *v14;
  int v15;
  uint64_t v16;
  _BYTE v17[12];

  v4 = *(_WORD *)&a4.var0;
  var1 = a3.var1;
  var0 = a3.var0;
  if ((*(_DWORD *)&a4.var0 & 0x10000) != 0)
    v7 = (CGColorSpace *)PKColorSpaceStandardExtendedLinearRGB();
  else
    v7 = (CGColorSpace *)PKColorSpaceStandardExtendedRGB();
  v8 = v7;
  if (v7)
  {
    NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
    if (NumberOfComponents <= 0xFE)
    {
      v10 = (16 * (_WORD)NumberOfComponents + 16) & 0xFF0;
      if (v10 < 0x100)
        goto LABEL_9;
    }
    __break(1u);
  }
  LOBYTE(v10) = 16;
LABEL_9:
  *(_QWORD *)&v17[4] = 0;
  if ((v4 & 0x100) != 0)
    v11 = 4357;
  else
    v11 = 4353;
  v13[0] = 16;
  v13[1] = v10 & 0xF0;
  v14 = v8;
  v15 = v11;
  v16 = 0;
  *(_QWORD *)v17 = 0;
  return -[PKBitmapContext _initWithSize:origin:format:]([PKBitmapContext alloc], var0, var1, (char)v4, v13);
}

+ (id)create32FloatWithSize:(id)a3 configuration:(id)a4
{
  __int16 v4;
  vImagePixelCount var1;
  vImagePixelCount var0;
  CGColorSpace *v7;
  CGColorSpace *v8;
  size_t NumberOfComponents;
  unint64_t v10;
  int v11;
  uint32_t v13[2];
  CGColorSpace *v14;
  int v15;
  uint64_t v16;
  _BYTE v17[12];

  v4 = *(_WORD *)&a4.var0;
  var1 = a3.var1;
  var0 = a3.var0;
  if ((*(_DWORD *)&a4.var0 & 0x10000) != 0)
    v7 = (CGColorSpace *)PKColorSpaceStandardLinearRGB();
  else
    v7 = (CGColorSpace *)PKColorSpaceStandardRGB();
  v8 = v7;
  if (v7)
  {
    NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
    if (NumberOfComponents <= 0xFE)
    {
      v10 = (32 * (_WORD)NumberOfComponents + 32) & 0x1FE0;
      if (v10 < 0x100)
        goto LABEL_9;
    }
    __break(1u);
  }
  LOBYTE(v10) = 32;
LABEL_9:
  *(_QWORD *)&v17[4] = 0;
  if ((v4 & 0x100) != 0)
    v11 = 8453;
  else
    v11 = 8449;
  v13[0] = 32;
  v13[1] = v10 & 0xE0;
  v14 = v8;
  v15 = v11;
  v16 = 0;
  *(_QWORD *)v17 = 0;
  return -[PKBitmapContext _initWithSize:origin:format:]([PKBitmapContext alloc], var0, var1, (char)v4, v13);
}

+ (id)createWithCGBitmapContext:(CGContext *)a3
{
  return (id)-[PKBitmapContext _initWithBitmapContext:]((unint64_t)[PKBitmapContext alloc], a3);
}

- (unint64_t)_initWithBitmapContext:(unint64_t)result
{
  char *v2;
  unint64_t v4;
  int v5;
  int v6;
  CGColorSpace *ColorSpace;
  CGBitmapInfo BitmapInfo;
  int RenderingIntent;
  CGColorSpaceRef v10;
  const void *v11;
  void *v12;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  unint64_t *v16;
  unint64_t v17;
  objc_super v18;

  v2 = (char *)result;
  if (!result)
    return (unint64_t)v2;
  if (!context)
    goto LABEL_20;
  result = (unint64_t)CGBitmapContextGetData(context);
  if (!result)
    goto LABEL_20;
  v4 = result;
  v18.receiver = v2;
  v18.super_class = (Class)PKBitmapContext;
  v2 = (char *)objc_msgSendSuper2(&v18, sel_init);
  if (!v2)
    return (unint64_t)v2;
  result = CGBitmapContextGetBitsPerComponent(context);
  if (HIDWORD(result))
    goto LABEL_20;
  v5 = result;
  result = CGBitmapContextGetBitsPerPixel(context);
  if (HIDWORD(result))
    goto LABEL_20;
  v6 = result;
  ColorSpace = CGBitmapContextGetColorSpace(context);
  BitmapInfo = CGBitmapContextGetBitmapInfo(context);
  RenderingIntent = CGContextGetRenderingIntent();
  v10 = CGColorSpaceRetain(ColorSpace);
  v11 = (const void *)*((_QWORD *)v2 + 3);
  if (v11)
  {
    CFRelease(v11);
    *((_QWORD *)v2 + 3) = 0;
  }
  v12 = (void *)*((_QWORD *)v2 + 5);
  if (v12)
    free(v12);
  *((_DWORD *)v2 + 4) = v5;
  *((_DWORD *)v2 + 5) = v6;
  *((_QWORD *)v2 + 3) = v10;
  *((_DWORD *)v2 + 8) = BitmapInfo;
  *((_DWORD *)v2 + 9) = 0;
  *((_QWORD *)v2 + 5) = 0;
  *((_DWORD *)v2 + 12) = RenderingIntent;
  Width = CGBitmapContextGetWidth(context);
  Height = CGBitmapContextGetHeight(context);
  BytesPerRow = CGBitmapContextGetBytesPerRow(context);
  v16 = (unint64_t *)(v2 + 56);
  result = vImageBuffer_Init((vImage_Buffer *)(v2 + 56), Height, Width, *((_DWORD *)v2 + 5), 0x200u);
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_20;
  v17 = result;
  if (*((_QWORD *)v2 + 10) == BytesPerRow)
  {
LABEL_13:
    *v16 = v4;
    if (v17)
    {
      result = os_variant_has_internal_ui();
      if ((_DWORD)result)
      {
        if (*v16 % v17)
          goto LABEL_20;
      }
    }
    *((_QWORD *)v2 + 12) = CFRetain(context);
    return (unint64_t)v2;
  }
  result = os_variant_has_internal_ui();
  if (!(_DWORD)result)
  {
    *((_QWORD *)v2 + 10) = BytesPerRow;
    goto LABEL_13;
  }
LABEL_20:
  __break(1u);
  return result;
}

- (PKBitmapContext)init
{

  return 0;
}

- (void)dealloc
{
  CGColorSpaceRef colorSpace;
  CGFloat *decode;
  CGContext *context;
  objc_super v6;

  colorSpace = self->_format.colorSpace;
  if (colorSpace)
  {
    CFRelease(colorSpace);
    self->_format.colorSpace = 0;
  }
  decode = (CGFloat *)self->_format.decode;
  if (decode)
  {
    free(decode);
    self->_format.decode = 0;
  }
  context = self->_context;
  if (context)
    CFRelease(context);
  v6.receiver = self;
  v6.super_class = (Class)PKBitmapContext;
  -[PKBitmapContext dealloc](&v6, sel_dealloc);
}

- (void)accessContext:(id)a3
{
  -[PKBitmapContext _accessContext:]((uint64_t)self, a3);
}

- (void)_accessContext:(uint64_t)a1
{
  void (**v3)(id, _QWORD);
  void *v4;
  void (**v5)(id, _QWORD);

  v3 = a2;
  if (!a1)
    goto LABEL_4;
  if (v3)
  {
    v5 = v3;
    v4 = (void *)MEMORY[0x19400CFE8]();
    v5[2](v5, *(_QWORD *)(a1 + 96));
    objc_autoreleasePoolPop(v4);
    v3 = v5;
LABEL_4:

    return;
  }
  __break(1u);
}

- (void)accessData:(id)a3
{
  void (**v4)(id, vImage_CGImageFormat *, vImage_Buffer *);
  uint64_t v5;
  __int16 v6;
  void *v7;
  unsigned int v8;
  void (**v9)(id, vImage_CGImageFormat *, vImage_Buffer *);

  v4 = (void (**)(id, vImage_CGImageFormat *, vImage_Buffer *))a3;
  if (!self)
    goto LABEL_6;
  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  v9 = v4;
  v5 = MEMORY[0x19400CFE8]();
  v6 = ++self->_vImageAccessCounter;
  if ((v6 & 0x100) != 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v7 = (void *)v5;
  v9[2](v9, &self->_format, &self->_buffer);
  v8 = --self->_vImageAccessCounter;
  if (v8 < 0x100)
  {
    objc_autoreleasePoolPop(v7);
    v4 = v9;
LABEL_6:

    return;
  }
LABEL_9:
  __break(1u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedBuffer, 0);
}

@end
