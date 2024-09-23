@implementation PKTextureLoader

void __26__PKTextureLoader__decode__block_invoke()
{
  JUMPOUT(0x2199BB27CLL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)read:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  -[PKTextureLoader _decode]((uint64_t)self);
  if (self->_buffer)
    v4[2]();
  else
    ((void (*)(void (**)(void), _QWORD))v4[2])(v4, 0);

}

- (void)_decode
{
  os_unfair_lock_s *v2;
  CGImage *v3;
  int v4;
  size_t Width;
  size_t Height;
  vm_map_t *v7;
  vImagePixelCount v8;
  vImage_Error v9;
  size_t rowBytes;
  NSObject *v11;
  const char *v12;
  vImage_Error v13;
  NSObject *v14;
  uint64_t v15;
  vImage_Error v16;
  size_t v17;
  NSObject *v18;
  const char *v19;
  vImage_Error v20;
  size_t v21;
  uint64_t v22;
  size_t v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  vImageConverter *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  vm_size_t v38;
  kern_return_t v39;
  vImage_Error v40;
  vImagePixelCount v41;
  vImage_Error v42;
  vImagePixelCount v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  kern_return_t v47;
  NSObject *v48;
  vImage_Buffer v49;
  vImage_Buffer address;
  uint8_t v51[4];
  vImagePixelCount v52;
  __int16 v53;
  size_t v54;
  vImage_Buffer buf;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = *(CGImage **)(a1 + 128);
    if (!v3)
    {
LABEL_55:
      os_unfair_lock_unlock(v2);
      return;
    }
    if (*(_QWORD *)(a1 + 176) && *(_QWORD *)(a1 + 120) && *(_QWORD *)(a1 + 136))
    {
      v4 = 1;
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.data) = 134217984;
        *(void **)((char *)&buf.data + 4) = (void *)a1;
        _os_log_impl(&dword_213A36000, v46, OS_LOG_TYPE_DEFAULT, "PKTextureLoader (%p): decode preconditions violated.", (uint8_t *)&buf, 0xCu);
      }

      v4 = 0;
      v3 = *(CGImage **)(a1 + 128);
    }
    Width = CGImageGetWidth(v3);
    Height = CGImageGetHeight(*(CGImageRef *)(a1 + 128));
    address.data = 0;
    address.height = Height;
    address.width = Width;
    address.rowBytes = 0;
    v49.data = 0;
    v49.height = Height;
    v49.width = Width;
    v49.rowBytes = 0;
    v7 = (vm_map_t *)MEMORY[0x24BDAEC58];
    if (!v4)
    {
      v23 = 0;
      v38 = 0;
      goto LABEL_42;
    }
    v8 = Height;
    memset(&buf, 0, sizeof(buf));
    v9 = vImageBuffer_Init(&buf, Height, Width, *(_DWORD *)(a1 + 28), 0x200u);
    if (v9 < 0)
    {
      v13 = v9;
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v51 = 134217984;
        v52 = v13;
        _os_log_impl(&dword_213A36000, v14, OS_LOG_TYPE_DEFAULT, "PKTextureLoader: failed to populate buffer rowBytes field - %zd.", v51, 0xCu);
      }

      rowBytes = 0;
      goto LABEL_22;
    }
    rowBytes = buf.rowBytes;
    if (!buf.rowBytes)
    {
LABEL_22:
      v38 = 0;
LABEL_23:
      address.rowBytes = rowBytes;
      memset(&buf, 0, sizeof(buf));
      v16 = vImageBuffer_Init(&buf, v8, Width, *(_DWORD *)(a1 + 76), 0x200u);
      if (v16 < 0)
      {
        v20 = v16;
        PKLogFacilityTypeGetObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v51 = 134217984;
          v52 = v20;
          _os_log_impl(&dword_213A36000, v18, OS_LOG_TYPE_DEFAULT, "PKTextureLoader: failed to populate buffer rowBytes field - %zd.", v51, 0xCu);
        }
        v17 = 0;
        goto LABEL_36;
      }
      v17 = buf.rowBytes;
      if (!buf.rowBytes)
      {
LABEL_37:
        v23 = 0;
        v49.rowBytes = v17;
LABEL_38:
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
LABEL_41:

          goto LABEL_42;
        }
        LODWORD(buf.data) = 134218496;
        *(void **)((char *)&buf.data + 4) = (void *)a1;
        WORD2(buf.height) = 2048;
        *(vImagePixelCount *)((char *)&buf.height + 6) = v38;
        HIWORD(buf.width) = 2048;
        buf.rowBytes = v23;
        v25 = "PKTextureLoader (%p): invalid buffer sizes - %zu, %zu.";
        v26 = v24;
        v27 = 32;
LABEL_40:
        _os_log_impl(&dword_213A36000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&buf, v27);
        goto LABEL_41;
      }
      if (!is_mul_ok(v8, buf.rowBytes))
      {
        PKLogFacilityTypeGetObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v51 = 134218240;
          v52 = v8;
          v53 = 2048;
          v54 = v17;
          v19 = "PKTextureLoader: image size computation overflowed - %zu x %zu.";
LABEL_35:
          _os_log_impl(&dword_213A36000, v18, OS_LOG_TYPE_DEFAULT, v19, v51, 0x16u);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
      v21 = v8 * buf.rowBytes;
      v22 = *MEMORY[0x24BDB03C8] - 1;
      if (__CFADD__(v21, v22))
      {
        PKLogFacilityTypeGetObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v51 = 134218240;
          v52 = v21;
          v53 = 2048;
          v54 = v22;
          v19 = "PKTextureLoader: buffer allocation size computation overflowed - %zu + %zu.";
          goto LABEL_35;
        }
LABEL_36:

        goto LABEL_37;
      }
      v23 = (v21 + v22) & -*MEMORY[0x24BDB03C8];
      v49.rowBytes = buf.rowBytes;
      if (!v38 || !v23)
        goto LABEL_38;
      v39 = vm_allocate(*v7, (vm_address_t *)&address, v38, 1);
      if (v39)
      {
        v47 = v39;
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          goto LABEL_41;
        LODWORD(buf.data) = 134218240;
        *(void **)((char *)&buf.data + 4) = (void *)a1;
        WORD2(buf.height) = 1024;
        *(_DWORD *)((char *)&buf.height + 6) = v47;
        v25 = "PKTextureLoader (%p): could not create source allocation - %d.";
        v26 = v24;
        v27 = 18;
        goto LABEL_40;
      }
      v40 = vImageBuffer_InitWithCGImage(&address, (vImage_CGImageFormat *)(a1 + 24), 0, *(CGImageRef *)(a1 + 128), 0x200u);
      if (v40)
      {
        v41 = v40;
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          goto LABEL_41;
        LODWORD(buf.data) = 134218240;
        *(void **)((char *)&buf.data + 4) = (void *)a1;
        WORD2(buf.height) = 2048;
        *(vImagePixelCount *)((char *)&buf.height + 6) = v41;
        v25 = "PKTextureLoader (%p): could not fill source buffer - %zd.";
        goto LABEL_63;
      }
      if (v23 == v38
        && (v49.data = address.data,
            vImageConverter_MustOperateOutOfPlace(*(const vImageConverterRef *)(a1 + 136), &address, &v49, 0x10u)))
      {
        v49.data = 0;
      }
      else if (v49.data)
      {
LABEL_69:
        v42 = vImageConvert_AnyToAny(*(const vImageConverterRef *)(a1 + 136), &address, &v49, 0, 0x10u);
        v43 = v42;
        if (address.data == v49.data)
          address.data = 0;
        if (v42)
        {
          PKLogFacilityTypeGetObject();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.data) = 134218240;
            *(void **)((char *)&buf.data + 4) = (void *)a1;
            WORD2(buf.height) = 2048;
            *(vImagePixelCount *)((char *)&buf.height + 6) = v43;
            _os_log_impl(&dword_213A36000, v48, OS_LOG_TYPE_DEFAULT, "PKTextureLoader (%p): could not convert to destination format - %zd.", (uint8_t *)&buf, 0x16u);
          }

        }
        else
        {
          *(_QWORD *)(a1 + 168) = v49.rowBytes;
          *(int8x16_t *)(a1 + 152) = vextq_s8(*(int8x16_t *)&v49.height, *(int8x16_t *)&v49.height, 8uLL);
          v44 = objc_msgSend(*(id *)(a1 + 120), "newBufferWithBytesNoCopy:length:options:deallocator:");
          v45 = *(void **)(a1 + 144);
          *(_QWORD *)(a1 + 144) = v44;

          if (*(_QWORD *)(a1 + 144))
            v49.data = 0;
        }
LABEL_42:
        if (address.data)
          MEMORY[0x2199BB27C](*v7, address.data, v38);
        if (v49.data)
          MEMORY[0x2199BB27C](*v7, v49.data, v23);
        v28 = *(vImageConverter **)(a1 + 136);
        if (v28)
        {
          vImageConverter_Release(v28);
          *(_QWORD *)(a1 + 136) = 0;
        }
        v29 = *(void **)(a1 + 120);
        *(_QWORD *)(a1 + 120) = 0;

        CFRelease(*(CFTypeRef *)(a1 + 128));
        *(_QWORD *)(a1 + 128) = 0;
        v30 = *(void **)(a1 + 144);
        if (v30)
        {
          v31 = *(_QWORD *)(a1 + 160);
          v32 = *(_QWORD *)(a1 + 168);
          PKLogFacilityTypeGetObject();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = objc_msgSend(v30, "length");
            LODWORD(buf.data) = 134218496;
            *(void **)((char *)&buf.data + 4) = (void *)a1;
            WORD2(buf.height) = 2048;
            *(vImagePixelCount *)((char *)&buf.height + 6) = v32 * v31;
            HIWORD(buf.width) = 2048;
            buf.rowBytes = v34 - v32 * v31;
            v35 = "PKTextureLoader (%p): decoded %zu + %zu bytes.";
            v36 = v33;
            v37 = 32;
LABEL_53:
            _os_log_impl(&dword_213A36000, v36, OS_LOG_TYPE_DEFAULT, v35, (uint8_t *)&buf, v37);
          }
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.data) = 134217984;
            *(void **)((char *)&buf.data + 4) = (void *)a1;
            v35 = "PKTextureLoader (%p): failed to decode bytes.";
            v36 = v33;
            v37 = 12;
            goto LABEL_53;
          }
        }

        goto LABEL_55;
      }
      if (vm_allocate(*v7, (vm_address_t *)&v49, v23, 1))
      {
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          goto LABEL_41;
        LODWORD(buf.data) = 134218240;
        *(void **)((char *)&buf.data + 4) = (void *)a1;
        WORD2(buf.height) = 2048;
        *(vImagePixelCount *)((char *)&buf.height + 6) = 0;
        v25 = "PKTextureLoader (%p): could not create destination allocation - %zd.";
LABEL_63:
        v26 = v24;
        v27 = 22;
        goto LABEL_40;
      }
      goto LABEL_69;
    }
    if (is_mul_ok(v8, buf.rowBytes))
    {
      v15 = *MEMORY[0x24BDB03C8] - 1;
      if (!__CFADD__(v8 * buf.rowBytes, v15))
      {
        v38 = (v8 * buf.rowBytes + v15) & -*MEMORY[0x24BDB03C8];
        goto LABEL_23;
      }
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_DWORD *)v51 = 134218240;
      v52 = v8 * rowBytes;
      v53 = 2048;
      v54 = v15;
      v12 = "PKTextureLoader: buffer allocation size computation overflowed - %zu + %zu.";
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_21:

        goto LABEL_22;
      }
      *(_DWORD *)v51 = 134218240;
      v52 = v8;
      v53 = 2048;
      v54 = rowBytes;
      v12 = "PKTextureLoader: image size computation overflowed - %zu x %zu.";
    }
    _os_log_impl(&dword_213A36000, v11, OS_LOG_TYPE_DEFAULT, v12, v51, 0x16u);
    goto LABEL_21;
  }
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_sourceColorSpace);
  CGColorSpaceRelease(self->_destinationColorSpace);
  vImageConverter_Release(self->_converter);
  v3.receiver = self;
  v3.super_class = (Class)PKTextureLoader;
  -[PKTextureLoader dealloc](&v3, sel_dealloc);
}

- (id)initForDevice:(CGImage *)a3 image:(void *)a4 withStorageMode:(int)a5 premultiplyAlpha:(CGColorSpace *)a6 colorSpace:(CGColorRenderingIntent)a7 renderingIntent:
{
  id v14;
  void *v15;
  id *v16;
  uint32_t BitsPerComponent;
  uint32_t BitsPerPixel;
  CGColorSpace *ColorSpace;
  CGBitmapInfo BitmapInfo;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint8_t *p_buf;
  NSObject *v25;
  uint32_t v26;
  size_t NumberOfComponents;
  size_t v28;
  CGColorSpace *v29;
  CGColorSpace *v30;
  CGColorSpaceModel Model;
  size_t v32;
  size_t v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  int v37;
  uint32_t v38;
  NSObject *v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  CGColorSpace *v43;
  size_t v44;
  size_t v45;
  BOOL v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;
  _DWORD *v62;
  CGBitmapInfo v63;
  int v64;
  CGColorSpace *v65;
  vImageConverter *v66;
  vImageConverter *v67;
  unint64_t NumberOfSourceBuffers;
  unint64_t NumberOfDestinationBuffers;
  unint64_t v70;
  id *v71;
  id *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  NSObject *v77;
  CGColorSpace *v78;
  id *v79;
  void *v80;
  int v81;
  CGColorRenderingIntent v82;
  objc_super v83;
  vImage_Error error;
  vImage_CGImageFormat srcFormat;
  uint8_t v86[4];
  vImage_Error v87;
  __int16 v88;
  unint64_t v89;
  vImage_CGImageFormat buf;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v14 = a2;
  v15 = v14;
  v16 = 0;
  if (a1 && v14 && a3)
  {
    v81 = a5;
    v82 = a7;
    v80 = a4;
    *((_DWORD *)&srcFormat.renderingIntent + 1) = 0;
    BitsPerComponent = CGImageGetBitsPerComponent(a3);
    BitsPerPixel = CGImageGetBitsPerPixel(a3);
    ColorSpace = CGImageGetColorSpace(a3);
    BitmapInfo = CGImageGetBitmapInfo(a3);
    srcFormat.bitsPerComponent = BitsPerComponent;
    srcFormat.bitsPerPixel = BitsPerPixel;
    srcFormat.colorSpace = ColorSpace;
    srcFormat.bitmapInfo = BitmapInfo;
    srcFormat.version = 0;
    srcFormat.decode = CGImageGetDecode(a3);
    v21 = BitmapInfo & 0x1F;
    srcFormat.renderingIntent = CGImageGetRenderingIntent(a3);
    if (!ColorSpace && (_DWORD)v21 != 7)
    {
      PKLogFacilityTypeGetObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        v16 = 0;
        goto LABEL_123;
      }
      LOWORD(buf.bitsPerComponent) = 0;
      v23 = "PKTextureLoader: declining to initialize - missing color space.";
      p_buf = (uint8_t *)&buf;
LABEL_8:
      v25 = v22;
      v26 = 2;
LABEL_9:
      _os_log_impl(&dword_213A36000, v25, OS_LOG_TYPE_DEFAULT, v23, p_buf, v26);
      goto LABEL_10;
    }
    v79 = a1;
    if ((_DWORD)v21 == 7)
      NumberOfComponents = 0;
    else
      NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
    if ((BitmapInfo & 0x1F) != 0)
      v28 = NumberOfComponents + 1;
    else
      v28 = NumberOfComponents;
    if (v28 * BitsPerComponent == BitsPerPixel)
    {
      if (a6)
        v29 = a6;
      else
        v29 = ColorSpace;
      a1 = v79;
      if (v29 && (_DWORD)v21 != 7)
      {
        v30 = v29;
        Model = CGColorSpaceGetModel(v29);
        v78 = v30;
        v32 = CGColorSpaceGetNumberOfComponents(v30);
        v33 = v32;
        if (Model == kCGColorSpaceModelRGB)
        {
          v29 = v78;
          if (v32 != 3)
          {
            PKLogFacilityTypeGetObject();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              buf.bitsPerComponent = 134217984;
              *(_QWORD *)&buf.bitsPerPixel = v33;
              v35 = "PKTextureLoader: declining to initialize - invalid number of channels (%zu) for RGB color space.";
              goto LABEL_70;
            }
LABEL_71:

            goto LABEL_72;
          }
        }
        else
        {
          if (Model)
          {
            PKLogFacilityTypeGetObject();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.bitsPerComponent) = 0;
              v40 = "PKTextureLoader: declining to initialize - invalid destination color model.";
              v41 = v39;
              v42 = 2;
LABEL_66:
              _os_log_impl(&dword_213A36000, v41, OS_LOG_TYPE_DEFAULT, v40, (uint8_t *)&buf, v42);
            }
LABEL_67:

LABEL_72:
            v16 = 0;
            goto LABEL_123;
          }
          v29 = v78;
          if (v32 != 1)
          {
            PKLogFacilityTypeGetObject();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              buf.bitsPerComponent = 134217984;
              *(_QWORD *)&buf.bitsPerPixel = v33;
              v35 = "PKTextureLoader: declining to initialize - invalid number of channels (%zu) for monochrome color space.";
LABEL_70:
              _os_log_impl(&dword_213A36000, v34, OS_LOG_TYPE_DEFAULT, v35, (uint8_t *)&buf, 0xCu);
              goto LABEL_71;
            }
            goto LABEL_71;
          }
        }
      }
      switch(BitsPerComponent)
      {
        case 8u:
          v37 = 0;
          v38 = 8;
          goto LABEL_46;
        case 0x20u:
          if ((BitmapInfo & 0x100) != 0)
            v37 = 4;
          else
            v37 = 3;
          v38 = 32;
LABEL_46:
          *(_QWORD *)&buf.renderingIntent = 0;
          if (v29)
          {
            v43 = v29;
            v44 = CGColorSpaceGetNumberOfComponents(v29);
            v29 = v43;
          }
          else
          {
            v44 = 0;
          }
          if ((_DWORD)v21 == 7)
            v45 = 0;
          else
            v45 = v44;
          if ((_DWORD)v21)
            v46 = 1;
          else
            v46 = v44 == 3;
          v47 = v46;
          if (v46)
            ++v45;
          v48 = 0;
          switch(v37)
          {
            case 0:
              v51 = v21 - 1;
              if ((v21 - 1) > 6)
              {
                v50 = 0;
                v52 = 6;
              }
              else
              {
                v52 = dword_213A5DC5C[v51];
                v50 = dword_213A5DC5C[(int)v51];
              }
              switch(v45)
              {
                case 4uLL:
                  v48 = 0;
                  v59 = 0x2000;
                  v60 = 80;
                  v50 = v52;
                  break;
                case 2uLL:
                  v48 = 0;
                  v59 = 4096;
                  v60 = 30;
                  break;
                case 1uLL:
                  v59 = 0;
                  v48 = 0;
                  if (v47)
                    v60 = 1;
                  else
                    v60 = 10;
                  break;
                default:
                  goto LABEL_97;
              }
              goto LABEL_111;
            case 1:
            case 3:
              goto LABEL_62;
            case 2:
            case 4:
              v48 = 1;
LABEL_62:
              switch((int)v21)
              {
                case 1:
                case 2:
                  v49 = 0;
                  v50 = 1;
                  break;
                case 3:
                case 4:
                  v49 = 0;
                  v50 = 3;
                  break;
                case 5:
                case 6:
                  v49 = 0;
                  v50 = 5;
                  break;
                case 7:
                  v49 = 0;
                  v50 = 7;
                  break;
                default:
                  v50 = 0;
                  v49 = 1;
                  break;
              }
              if ((v47 & v49) != 0)
                v50 = 5;
              if ((v37 - 1) <= 1)
              {
                switch(v45)
                {
                  case 4uLL:
                    v53 = v48 == 0;
                    v54 = 110;
                    v55 = 115;
                    goto LABEL_101;
                  case 2uLL:
                    v53 = v48 == 0;
                    v54 = 60;
                    v55 = 65;
                    goto LABEL_101;
                  case 1uLL:
                    v53 = v48 == 0;
                    v54 = 20;
                    v55 = 25;
LABEL_101:
                    if (v53)
                      v60 = v54;
                    else
                      v60 = v55;
                    v59 = 4096;
LABEL_111:
                    v61 = v50 - 1;
                    if ((v50 - 1) < 4)
                    {
                      v62 = &unk_213A5DC90;
                      if (v81)
                        v62 = &unk_213A5DC80;
                      v50 = v62[v61];
                    }
                    buf.bitsPerComponent = v38;
                    buf.bitsPerPixel = v45 * v38;
                    v63 = v50 | v59;
                    v64 = v50 | v59 | 0x100;
                    if (v48)
                      v63 = v64;
                    v65 = v29;
                    buf.colorSpace = v29;
                    buf.bitmapInfo = v63;
                    buf.version = 0;
                    buf.decode = 0;
                    buf.renderingIntent = v82;
                    error = 0;
                    v66 = vImageConverter_CreateWithCGImageFormat(&srcFormat, &buf, 0, 0, &error);
                    if (v66)
                    {
                      v67 = v66;
                      NumberOfSourceBuffers = vImageConverter_GetNumberOfSourceBuffers(v66);
                      NumberOfDestinationBuffers = vImageConverter_GetNumberOfDestinationBuffers(v67);
                      v70 = NumberOfDestinationBuffers;
                      if (NumberOfSourceBuffers == 1 && NumberOfDestinationBuffers == 1)
                      {
                        v83.receiver = v79;
                        v83.super_class = (Class)PKTextureLoader;
                        v71 = (id *)objc_msgSendSuper2(&v83, sel_init);
                        v72 = v71;
                        if (v71)
                        {
                          objc_storeStrong(v71 + 15, a2);
                          v72[16] = CGImageRetain(a3);
                          v72[17] = v67;
                          v73 = *(void **)&srcFormat.renderingIntent;
                          v74 = *(_OWORD *)&srcFormat.bitmapInfo;
                          *(_OWORD *)(v72 + 3) = *(_OWORD *)&srcFormat.bitsPerComponent;
                          *(_OWORD *)(v72 + 5) = v74;
                          v72[7] = v73;
                          v72[8] = CGColorSpaceRetain(ColorSpace);
                          v72[22] = (id)v60;
                          v75 = *(_OWORD *)&buf.bitmapInfo;
                          *(_OWORD *)(v72 + 9) = *(_OWORD *)&buf.bitsPerComponent;
                          *(_OWORD *)(v72 + 11) = v75;
                          v72[13] = *(id *)&buf.renderingIntent;
                          v72[14] = CGColorSpaceRetain(v65);
                          v72[2] = v80;
                        }
                        a1 = v72;
                        v16 = a1;
                      }
                      else
                      {
                        PKLogFacilityTypeGetObject();
                        v77 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v86 = 134218240;
                          v87 = NumberOfSourceBuffers;
                          v88 = 2048;
                          v89 = v70;
                          _os_log_impl(&dword_213A36000, v77, OS_LOG_TYPE_DEFAULT, "PKTextureLoader: declining to initialize - invalid converter created with unexpected buffer counts %lu -> %lu.", v86, 0x16u);
                        }

                        vImageConverter_Release(v67);
                        v16 = 0;
                        a1 = v79;
                      }
                      goto LABEL_123;
                    }
                    PKLogFacilityTypeGetObject();
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_10;
                    *(_DWORD *)v86 = 134217984;
                    v87 = error;
                    v23 = "PKTextureLoader: declining to initialize - failed to create converter due to %zd.";
                    p_buf = v86;
                    v25 = v22;
                    v26 = 12;
                    goto LABEL_9;
                }
LABEL_97:
                PKLogFacilityTypeGetObject();
                v22 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_10;
                *(_WORD *)v86 = 0;
                v23 = "PKTextureLoader: declining to initialize - invalid destination format.";
                p_buf = v86;
                goto LABEL_8;
              }
              switch(v45)
              {
                case 4uLL:
                  v56 = v48 == 0;
                  v57 = 123;
                  v58 = 125;
                  break;
                case 2uLL:
                  v56 = v48 == 0;
                  v57 = 103;
                  v58 = 105;
                  break;
                case 1uLL:
                  v56 = v48 == 0;
                  v57 = 53;
                  v58 = 55;
                  break;
                default:
                  goto LABEL_97;
              }
              if (v56)
                v60 = v57;
              else
                v60 = v58;
              v59 = 0x2000;
              goto LABEL_111;
            default:
              goto LABEL_97;
          }
        case 0x10u:
          if ((BitmapInfo & 0x100) != 0)
            v37 = 2;
          else
            v37 = 1;
          v38 = 16;
          goto LABEL_46;
      }
      PKLogFacilityTypeGetObject();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        buf.bitsPerComponent = 134217984;
        *(_QWORD *)&buf.bitsPerPixel = BitsPerComponent;
        v40 = "PKTextureLoader: declining to initialize - unexpected component size %zu.";
        v41 = v39;
        v42 = 12;
        goto LABEL_66;
      }
      goto LABEL_67;
    }
    PKLogFacilityTypeGetObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      buf.bitsPerComponent = 134218240;
      *(_QWORD *)&buf.bitsPerPixel = BitsPerPixel;
      WORD2(buf.colorSpace) = 2048;
      *(CGColorSpaceRef *)((char *)&buf.colorSpace + 6) = (CGColorSpaceRef)v28;
      _os_log_impl(&dword_213A36000, v36, OS_LOG_TYPE_DEFAULT, "PKTextureLoader: declining to initialize - unexpected pixel size %zu for %zu components.", (uint8_t *)&buf, 0x16u);
    }

    v16 = 0;
    a1 = v79;
  }
LABEL_123:

  return v16;
}

- (PKTextureLoader)init
{

  return 0;
}

- (unint64_t)format
{
  return self->_format;
}

@end
