@implementation TXRDataConverter

+ (id)newImageFromSourceImage:(id)a3 newPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 multiplyAlpha:(BOOL)a6 gammaDegamma:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  TXRImageIndependent *v17;
  TXRImageIndependent *v18;
  unint64_t v19;
  at_texel_format_t v20;
  unint64_t v21;
  at_block_format_t v22;
  void *v23;
  float v24;
  size_t MemoryLayout;
  size_t v26;
  size_t v27;
  unsigned int v28;
  unsigned int v29;
  uint32_t v30;
  unsigned int v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  TXRImageIndependent *v36;
  double v37;
  TXRImageIndependent *v38;
  TXRImageIndependent *v39;
  unint64_t v40;
  float v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  void *v46;
  TXRImageIndependent *v47;
  double v48;
  TXRImageIndependent *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  uint16x4_t *v54;
  void *v55;
  uint64_t v56;
  __n128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  float32x4_t v64;
  int8x16_t v65;
  __n128 v66;
  id v67;
  TXRImageIndependent *v68;
  TXRImageIndependent *v69;
  float v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v74;
  TXRImageIndependent *v75;
  void *v76;
  TXRImageIndependent *v77;
  double v78;
  uint64_t v79;
  TXRImageIndependent *v80;
  at_texel_format_t v81;
  at_block_format_t v82;
  TXRImageIndependent *v83;
  at_encoder_t v84;
  NSObject *v85;
  void *v86;
  void *v87;
  unsigned int v88;
  unsigned int v89;
  uint32_t v90;
  void *v91;
  void *v92;
  __n128 v94;
  void *v95;
  int v97;
  int v98;
  int v99;
  void *v100;
  void *v101;
  unint64_t v102;
  uint32_t v103;
  uint32_t v104;
  void *v105;
  unsigned int v106;
  unsigned int v107;
  double v108;
  unsigned int v109;
  id v110;
  unint64_t v111;
  unsigned int v112;
  void *v113;
  at_texel_region_t dest;
  at_block_buffer_t src;

  v8 = a7;
  v9 = a6;
  v12 = a3;
  v13 = a5;
  if (v9)
  {
    v14 = objc_msgSend(v12, "pixelFormat");
    v9 = 1;
    if (v14 > 129)
    {
      if (((unint64_t)(v14 - 130) > 0x35 || ((1 << (v14 + 126)) & 0x30003C00C0003FLL) == 0)
        && (unint64_t)(v14 - 552) >= 2)
      {
        goto LABEL_94;
      }
    }
    else if (((unint64_t)(v14 - 65) > 0x3C || ((1 << (v14 - 65)) & 0x1C07A000060183E1) == 0)
           && ((unint64_t)v14 > 0x2B || ((1 << v14) & 0xE0000000002) == 0))
    {
LABEL_94:
      v9 = 0;
    }
  }
  if (a4 - 130 < 0xE && ((0x3C3Fu >> (a4 + 126)) & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    v15 = 1;
    if (a4 - 150 >= 4 && (a4 & 0xFFFFFFFFFFFFFFF8) != 0xA0)
    {
      if (a4 - 170 >= 0x31)
        v15 = 0;
      else
        v15 = (0x1FF7C7FDF3F55uLL >> (a4 + 86)) & 1;
    }
  }
  v16 = objc_msgSend(v12, "pixelFormat");
  v110 = v13;
  v111 = a4;
  v113 = v12;
  v97 = v9;
  v98 = v8;
  v99 = v15;
  if (((unint64_t)(v16 - 130) > 0xD || ((1 << (v16 + 126)) & 0x3C3F) == 0)
    && (unint64_t)(v16 - 150) >= 4
    && (v16 & 0xFFFFFFFFFFFFFFF8) != 0xA0
    && ((unint64_t)(v16 - 170) > 0x30 || ((1 << (v16 + 86)) & 0x1FF7C7FDF3F55) == 0))
  {
    v18 = (TXRImageIndependent *)v12;
    goto LABEL_36;
  }
  v17 = (TXRImageIndependent *)v12;
  v18 = v17;
  v19 = a4 & 0xFFFFFFFFFFFFFFFELL;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0x46)
  {
    v20 = at_texel_format_rgba8_unorm;
    goto LABEL_28;
  }
  switch(v19)
  {
    case 0x50uLL:
      v20 = at_texel_format_bgra8_unorm;
LABEL_28:
      v21 = a4;
      goto LABEL_29;
    case 0xAuLL:
      v20 = at_texel_format_l8_unorm;
      goto LABEL_28;
    case 0x1EuLL:
      v20 = at_texel_format_la8_unorm;
      goto LABEL_28;
  }
  if (isGammaEncoded(-[TXRImageIndependent pixelFormat](v17, "pixelFormat")))
    v21 = 71;
  else
    v21 = 70;
  v20 = at_texel_format_rgba8_unorm;
LABEL_29:
  if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") == 204
    || -[TXRImageIndependent pixelFormat](v18, "pixelFormat") == 186)
  {
    v22 = at_block_format_astc_4x4_ldr;
  }
  else
  {
    if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 212
      && -[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 194)
    {
      if (a8)
      {
        _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Cannot decompress from specified format"));
        v39 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = 0;
      }
      goto LABEL_78;
    }
    v22 = at_block_format_astc_8x8_ldr;
  }
  -[TXRImage buffer](v18, "buffer");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "map");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  src.blocks = (void *)objc_msgSend(v23, "bytes");
  src.rowBytes = -[TXRImage bytesPerRow](v18, "bytesPerRow");
  src.sliceBytes = -[TXRImage bytesPerImage](v18, "bytesPerImage");
  -[TXRImageIndependent dimensions](v18, "dimensions");
  MemoryLayout = getMemoryLayout(v21, v24);
  v27 = v26;
  -[TXRImageIndependent dimensions](v18, "dimensions");
  v107 = v28;
  -[TXRImageIndependent dimensions](v18, "dimensions");
  v106 = v29;
  -[TXRImageIndependent dimensions](v18, "dimensions");
  v103 = v30;
  -[TXRImageIndependent dimensions](v18, "dimensions");
  v32 = (void *)objc_msgSend(v13, "newBufferWithLength:", v27 * v31);
  objc_msgSend(v32, "map");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *((_DWORD *)&dest.validSize + 3) = 0;
  dest.texels = (void *)objc_msgSend(v33, "bytes");
  *(_QWORD *)&dest.validSize.x = __PAIR64__(v106, v107);
  dest.validSize.z = v103;
  dest.rowBytes = MemoryLayout;
  dest.sliceBytes = v27;
  v34 = at_encoder_create(v20, at_alpha_not_premultiplied, v22, at_alpha_not_premultiplied, 0);
  if (!v34)
    +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:].cold.1();
  v35 = v34;
  at_encoder_decompress_texels(v34, &src, &dest, at_flags_default);
  v36 = [TXRImageIndependent alloc];
  -[TXRImageIndependent dimensions](v18, "dimensions");
  v38 = -[TXRImageIndependent initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:](v36, "initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:", v21, -[TXRImageIndependent alphaInfo](v18, "alphaInfo"), MemoryLayout, v27, v32, 0, v37);

  a4 = v111;
  if (v21 != v111)
  {

    v18 = v38;
    v12 = v113;
    v13 = v110;
    v15 = v99;
LABEL_36:
    v40 = a4;
    if (v15)
    {
      v40 = a4;
      if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 70)
      {
        v40 = a4;
        if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 80)
        {
          v40 = a4;
          if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 30)
          {
            v40 = a4;
            if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 10)
            {
              v40 = a4;
              if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 71)
              {
                v40 = a4;
                if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 81)
                {
                  v40 = a4;
                  if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 31)
                  {
                    v40 = a4;
                    if (-[TXRImageIndependent pixelFormat](v18, "pixelFormat") != 11)
                    {
                      if (isGammaEncoded(a4))
                        v40 = 71;
                      else
                        v40 = 70;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    objc_msgSend(v12, "dimensions");
    v42 = getMemoryLayout(v40, v41);
    v44 = v43;
    objc_msgSend(v12, "dimensions");
    v46 = (void *)objc_msgSend(v13, "newBufferWithLength:", v44 * v45);
    v47 = [TXRImageIndependent alloc];
    objc_msgSend(v12, "dimensions");
    v49 = -[TXRImageIndependent initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:](v47, "initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:", v40, objc_msgSend(v12, "alphaInfo"), v42, v44, v46, 0, v48);
    if (v40 == a4)
      v50 = v15;
    else
      v50 = 0;
    v105 = v46;
    if ((v50 & 1) == 0)
    {
      v102 = v40;
      objc_msgSend(v46, "map");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(v101, "bytes");
      -[TXRImage buffer](v18, "buffer");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "map");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v95 = v53;
      v54 = (uint16x4_t *)objc_msgSend(v53, "bytes");
      v55 = v12;
      v56 = (uint64_t)v51;
      objc_msgSend(v55, "dimensions");
      if ((fastConvert(v97, v98, -[TXRImageIndependent pixelFormat](v49, "pixelFormat"), -[TXRImage bytesPerRow](v49, "bytesPerRow"), -[TXRImage bytesPerImage](v49, "bytesPerImage"), v51, -[TXRImageIndependent pixelFormat](v18, "pixelFormat"), -[TXRImage bytesPerRow](v18, "bytesPerRow"), -[TXRImage bytesPerImage](v18, "bytesPerImage"), v54) & 1) == 0)
      {
        objc_msgSend(v113, "dimensions");
        v94 = v57;
        v58 = -[TXRImageIndependent pixelFormat](v49, "pixelFormat");
        v59 = -[TXRImage bytesPerRow](v49, "bytesPerRow");
        v60 = -[TXRImage bytesPerImage](v49, "bytesPerImage");
        v61 = -[TXRImageIndependent pixelFormat](v18, "pixelFormat");
        v62 = -[TXRImage bytesPerRow](v18, "bytesPerRow");
        v63 = -[TXRImage bytesPerImage](v18, "bytesPerImage");
        slowConvert(v97, v98, v58, v59, v60, v56, v61, v62, v94, v64, v65, v66, v63, v54);
      }

      v12 = v113;
      v13 = v110;
      a4 = v111;
      v15 = v99;
      v46 = v105;
      v40 = v102;
    }
    if (!v15)
    {
      v39 = v49;
LABEL_77:

      goto LABEL_78;
    }
    if (v40 == a4)
    {
      v67 = v13;
      v68 = v49;
      v69 = v18;
    }
    else
    {
      objc_msgSend(v12, "dimensions");
      v71 = getMemoryLayout(a4, v70);
      v73 = v72;
      objc_msgSend(v12, "dimensions");
      v67 = v13;
      v75 = v49;
      v76 = (void *)objc_msgSend(v13, "newBufferWithLength:", v73 * v74);
      v77 = [TXRImageIndependent alloc];
      objc_msgSend(v12, "dimensions");
      v108 = v78;
      v79 = objc_msgSend(v12, "alphaInfo");
      v80 = v77;
      a4 = v111;
      v68 = -[TXRImageIndependent initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:](v80, "initWithDimensions:pixelFormat:alphaInfo:bytesPerRow:bytesPerImage:buffer:offset:", v111, v79, v71, v73, v76, 0, v108);
      v69 = v75;

      v49 = v75;
    }
    if (-[TXRImageIndependent pixelFormat](v69, "pixelFormat") == 70
      || -[TXRImageIndependent pixelFormat](v69, "pixelFormat") == 71)
    {
      v81 = at_texel_format_rgba8_unorm;
    }
    else if (-[TXRImageIndependent pixelFormat](v69, "pixelFormat") == 80
           || -[TXRImageIndependent pixelFormat](v69, "pixelFormat") == 81)
    {
      v81 = at_texel_format_bgra8_unorm;
    }
    else if (-[TXRImageIndependent pixelFormat](v69, "pixelFormat") == 30
           || -[TXRImageIndependent pixelFormat](v69, "pixelFormat") == 31)
    {
      v81 = at_texel_format_la8_unorm;
    }
    else
    {
      if (-[TXRImageIndependent pixelFormat](v69, "pixelFormat") != 10
        && -[TXRImageIndependent pixelFormat](v69, "pixelFormat") != 11)
      {
        +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:].cold.3();
      }
      v81 = at_texel_format_l8_unorm;
    }
    v82 = at_block_format_astc_4x4_ldr;
    if ((uint64_t)a4 > 203)
    {
      if (a4 == 204)
        goto LABEL_74;
      if (a4 != 212)
        goto LABEL_69;
    }
    else
    {
      if (a4 == 186)
        goto LABEL_74;
      if (a4 != 194)
      {
LABEL_69:
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0x98)
        {
          if (a8)
          {
            _newTXRErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Cannot compress to specified format"));
            v39 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v39 = 0;
          }
LABEL_76:

          v13 = v67;
          v46 = v105;
          goto LABEL_77;
        }
        v82 = at_block_format_bc7;
LABEL_74:
        v83 = v49;
        v84 = at_encoder_create(v81, at_alpha_not_premultiplied, v82, at_alpha_not_premultiplied, 0);
        if (!v84)
          +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:].cold.2();
        v85 = v84;
        -[TXRImage buffer](v69, "buffer");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "map");
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "dimensions");
        v112 = v88;
        objc_msgSend(v12, "dimensions");
        v109 = v89;
        objc_msgSend(v12, "dimensions");
        v104 = v90;
        memset(&dest.validSize.z, 0, 24);
        dest.texels = (void *)objc_msgSend(v87, "bytes");
        *(_QWORD *)&dest.validSize.x = __PAIR64__(v109, v112);
        dest.validSize.z = v104;
        dest.rowBytes = -[TXRImage bytesPerRow](v69, "bytesPerRow");
        dest.sliceBytes = -[TXRImage bytesPerImage](v69, "bytesPerImage");
        -[TXRImage buffer](v68, "buffer");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "map");
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        src.blocks = (void *)objc_msgSend(v92, "bytes");
        src.rowBytes = -[TXRImage bytesPerRow](v68, "bytesPerRow");
        src.sliceBytes = -[TXRImage bytesPerImage](v68, "bytesPerImage");
        at_encoder_compress_texels(v85, &dest, &src, 2.0e-15, at_flags_default);
        v39 = v68;

        v49 = v83;
        goto LABEL_76;
      }
    }
    v82 = at_block_format_astc_8x8_ldr;
    goto LABEL_74;
  }
  v18 = v38;

  v39 = v18;
  v12 = v113;
  v13 = v110;
LABEL_78:

  return v39;
}

+ (id)newImageFromSourceImage:(id)a3 newPixelFormat:(unint64_t)a4 bufferAllocator:(id)a5 gammaDegamma:(BOOL)a6 error:(id *)a7
{
  return +[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:](TXRDataConverter, "newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:", a3, a4, a5, 0, a6, a7);
}

+ (id)newPixelFormatSetForCGImage:(CGImage *)a3 displayGamut:(unint64_t)a4 options:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  unsigned int v10;
  size_t BitsPerPixel;
  CGBitmapInfo v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = (objc_class *)MEMORY[0x1E0C99E10];
  v8 = a5;
  v9 = objc_alloc_init(v7);
  v10 = +[TXRParserImageIO determineColorSpaceClass:displayGamut:options:](TXRParserImageIO, "determineColorSpaceClass:displayGamut:options:", a3, a4, v8);

  BitsPerPixel = CGImageGetBitsPerPixel(a3);
  v12 = CGImageGetBitmapInfo(a3) & 0x1F;
  if (v10 < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 204);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 152);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

    if (BitsPerPixel != 8)
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      v16 = 70;
      goto LABEL_15;
    }
    v15 = (void *)MEMORY[0x1E0CB37E8];
    if (v12 != 7)
    {
      v16 = 10;
LABEL_15:
      objc_msgSend(v15, "numberWithUnsignedInteger:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v21);

      return v9;
    }
LABEL_12:
    v16 = 1;
    goto LABEL_15;
  }
  if (v10 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 186);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 153);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v20);

    v15 = (void *)MEMORY[0x1E0CB37E8];
    if (v12 != 7)
    {
      v16 = 71;
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if (v10 == 3)
  {
    if (v12 == 7)
      v13 = 1;
    else
      v13 = 555;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

    v15 = (void *)MEMORY[0x1E0CB37E8];
    v16 = 115;
    goto LABEL_15;
  }
  return v9;
}

+ (void)newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:.cold.1()
{
  __assert_rtn("+[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:]", "TXRDataConverter.m", 140, "!\"Couldn't create decoder\");
}

+ (void)newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:.cold.2()
{
  __assert_rtn("+[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:]", "TXRDataConverter.m", 345, "!\"Couldn't create encoder\");
}

+ (void)newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:.cold.3()
{
  __assert_rtn("+[TXRDataConverter newImageFromSourceImage:newPixelFormat:bufferAllocator:multiplyAlpha:gammaDegamma:error:]", "TXRDataConverter.m", 309, "!\"Unhandled source format during compression\");
}

@end
