@implementation PUIColorBoxes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)colorBoxesForImage:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  size_t v12;
  void *v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  size_t AlignedBytesPerRow;
  CGContext *v26;
  id v27;
  CGImage *v28;
  char *Data;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unsigned __int8 *v51;
  unsigned __int8 *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  char v65;
  uint64_t v66;
  char *v67;
  NSObject *v68;
  char v70;
  PUIColorBoxes *v71;
  id v72;
  uint64_t v73;
  CGContext *c;
  CGColorSpace *space;
  NSObject *v76;
  id v77;
  char *v78;
  size_t v79;
  unint64_t v80;
  uint64_t v81;
  size_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char v86;
  size_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  _BYTE buf[22];
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  unint64_t v96;
  uint64_t v97;
  CGRect v98;

  v97 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "size");
  v6 = v4;
  v7 = v5;
  if (v4 != *MEMORY[0x24BDBF148] || v5 != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v9 = v4 > 4.0 && v5 > 4.0 ? 4 : 1;
    v10 = vcvtpd_u64_f64(v4 / (double)(unint64_t)v9);
    v11 = v4 > 4.0 && v5 > 4.0 ? 4 : 16;
    v12 = vcvtpd_u64_f64(v5 / (double)(unint64_t)v9);
    if (v10 && v12 != 0)
    {
      if (v4 > 4.0 && v5 > 4.0)
        v15 = 2;
      else
        v15 = 4;
      if (((v11 - 1) & v12) != 0)
        v16 = (v12 >> v15) + 1;
      else
        v16 = v12 >> v15;
      v86 = v15;
      if (((v11 - 1) & v10) != 0)
        v17 = (v10 >> v15) + 1;
      else
        v17 = v10 >> v15;
      if (is_mul_ok(v16, v17))
      {
        v88 = v16 * v17;
        v83 = (char *)malloc_type_calloc(v16 * v17, 4uLL, 0x100004052888210uLL);
        if (v83)
        {
          v85 = v11;
          v73 = v9;
          objc_msgSend(v3, "scale");
          v20 = (double)v10 / v19;
          objc_msgSend(v3, "scale");
          v22 = (double)v12 / v21;
          objc_msgSend(v3, "pui_wrappedIOSurface");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v3;
          objc_msgSend(v3, "pui_cropImageWithRect:outputSize:canUseIOSurface:", v23 != 0, 0.0, 0.0, v6, v7, v20, v22);
          v24 = objc_claimAutoreleasedReturnValue();

          AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
          v82 = v10;
          v79 = v12;
          space = CGColorSpaceCreateDeviceRGB();
          v26 = CGBitmapContextCreate(0, v10, v12, 8uLL, AlignedBytesPerRow, space, 0x4001u);
          CGContextSetInterpolationQuality(v26, kCGInterpolationLow);
          v76 = v24;
          -[NSObject pui_CGImageBackedImage](v24, "pui_CGImageBackedImage");
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v28 = (CGImage *)objc_msgSend(v27, "CGImage");
          v98.origin.x = 0.0;
          v98.origin.y = 0.0;
          v98.size.width = (double)v10;
          v98.size.height = (double)v12;
          CGContextDrawImage(v26, v98, v28);

          c = v26;
          Data = (char *)CGBitmapContextGetData(v26);
          v80 = v16;
          if (v16)
          {
            v81 = 0;
            v32 = 0;
            v33 = 0;
            v34 = 0;
            v35 = 0;
            v16 = 0;
            v36 = 0;
            v37 = 0;
            v78 = Data + 1;
            v87 = AlignedBytesPerRow;
            do
            {
              if (v17)
              {
                v38 = 0;
                v39 = v81 << v86;
                if ((v81 << v86) + v85 >= v79)
                  v40 = v79 - (v81 << v86);
                else
                  v40 = v85;
                v91 = v40 + v39;
                v89 = v81 * v17;
                v84 = &v78[AlignedBytesPerRow * v39];
                do
                {
                  v90 = v38;
                  if (v39 >= v91)
                  {
                    v48 = 0;
                    v47 = 0;
                    v46 = 0;
                    v45 = 0;
                    v44 = 0;
                    v43 = 0;
                    v42 = 0;
                  }
                  else
                  {
                    v41 = v39;
                    v42 = 0;
                    v43 = 0;
                    v44 = 0;
                    v45 = 0;
                    v46 = 0;
                    v47 = 0;
                    v48 = 0;
                    v49 = v38 << v86;
                    if ((v38 << v86) + v85 >= v82)
                      v50 = v82 - v49;
                    else
                      v50 = v85;
                    v51 = (unsigned __int8 *)&v84[4 * v49];
                    v30 = v41;
                    do
                    {
                      if (v49 < v50 + v49)
                      {
                        v42 += v50;
                        v52 = v51;
                        v53 = v50;
                        do
                        {
                          v54 = *(v52 - 1);
                          v48 += v54;
                          v55 = *v52;
                          v47 += v55;
                          v56 = v52[1];
                          v46 += v56;
                          v57 = (v54 * v54);
                          v45 += v57;
                          v58 = (v55 * v55);
                          v44 += v58;
                          v59 = (v56 * v56);
                          v43 += v59;
                          v37 += v54;
                          v36 += v55;
                          v16 += v56;
                          v35 += v57;
                          v34 += v58;
                          v33 += v59;
                          v52 += 4;
                          --v53;
                        }
                        while (v53);
                        v32 += v50;
                      }
                      ++v30;
                      v51 += AlignedBytesPerRow;
                      v31 = v91;
                    }
                    while (v30 != v91);
                  }
                  v60 = 1.0 / (double)v42;
                  v61 = llround(v60 * (double)v48);
                  if (v61 >= 0x100)
                    +[PUIColorBoxes colorBoxesForImage:].cold.3(v42, v30, v31);
                  v62 = llround(v60 * (double)v47);
                  if (v62 >= 0x100)
                    +[PUIColorBoxes colorBoxesForImage:].cold.3(v42, v30, v31);
                  v63 = v17;
                  v64 = llround(v60 * (double)v46);
                  if (v64 >= 0x100)
                    +[PUIColorBoxes colorBoxesForImage:].cold.3(v42, v30, v31);
                  v65 = contrast(v42, (double)v48, (double)v47, (double)v46, (double)v45, (double)v44, (double)v43);
                  v66 = v90;
                  if (v90 + v89 >= v88)
                  {
                    PUILogCommon();
                    v68 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218752;
                      *(_QWORD *)&buf[4] = v90 + v89;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v81;
                      v93 = 2048;
                      v94 = v90;
                      v95 = 2048;
                      v96 = v63;
                      _os_log_error_impl(&dword_24464E000, v68, OS_LOG_TYPE_ERROR, "Bad box index '%lu' from row %lu column %lu and column count %lu", buf, 0x2Au);
                    }

                    AlignedBytesPerRow = v87;
                    v66 = v90;
                    v17 = v63;
                  }
                  else
                  {
                    v67 = &v83[4 * v90 + 4 * v89];
                    *v67 = v61;
                    v67[1] = v62;
                    v67[2] = v64;
                    v67[3] = v65;
                    v17 = v63;
                    AlignedBytesPerRow = v87;
                  }
                  v38 = v66 + 1;
                  v39 = v81 << v86;
                }
                while (v38 != v17);
              }
              ++v81;
            }
            while (v81 != v80);
          }
          else
          {
            v37 = 0;
            v36 = 0;
            v35 = 0;
            v34 = 0;
            v33 = 0;
            v32 = 0;
          }
          v70 = contrast(v32, (double)v37, (double)v36, (double)v16, (double)v35, (double)v34, (double)v33);
          CGContextRelease(c);
          CGColorSpaceRelease(space);
          v71 = [PUIColorBoxes alloc];
          if (v71)
          {
            *(_QWORD *)buf = v71;
            *(_QWORD *)&buf[8] = PUIColorBoxes;
            v72 = objc_msgSendSuper2((objc_super *)buf, sel_init);
            v14 = v72;
            v18 = v76;
            v3 = v77;
            if (v72)
            {
              *((_QWORD *)v72 + 8) = v83;
              *((_QWORD *)v72 + 9) = v80;
              *((_QWORD *)v72 + 10) = v17;
              *((_QWORD *)v72 + 11) = 16;
              *((_BYTE *)v72 + 24) = v70;
              *((double *)v72 + 1) = v6;
              *((double *)v72 + 2) = v7;
              *((_QWORD *)v72 + 4) = v85;
              *((_QWORD *)v72 + 5) = v73;
              *((_QWORD *)v72 + 6) = v79;
              *((_QWORD *)v72 + 7) = v82;
            }
          }
          else
          {
            v14 = 0;
            v18 = v76;
            v3 = v77;
          }
          goto LABEL_63;
        }
        PUILogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[PUIColorBoxes colorBoxesForImage:].cold.2();
      }
      else
      {
        PUILogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          +[PUIColorBoxes colorBoxesForImage:].cold.1();
      }
      v14 = 0;
LABEL_63:

      goto LABEL_64;
    }
  }
  v14 = 0;
LABEL_64:

  return v14;
}

- (id)initWithColorBoxes:(uint64_t)a3 size:(uint64_t)a4 rowCount:(uint64_t)a5 columnCount:(char)a6 totalContrast8:(uint64_t)a7 imageSize:(uint64_t)a8 downsampledBoxSize:(double)a9 effectiveDownsampleFactor:(double)a10 pixelHeight:(uint64_t)a11 pixelWidth:(uint64_t)a12
{
  objc_super v21;

  if (result)
  {
    v21.receiver = result;
    v21.super_class = (Class)PUIColorBoxes;
    result = objc_msgSendSuper2(&v21, sel_init);
    if (result)
    {
      *((_QWORD *)result + 8) = a2;
      *((_QWORD *)result + 9) = a4;
      *((_QWORD *)result + 10) = a5;
      *((_QWORD *)result + 11) = a3;
      *((_BYTE *)result + 24) = a6;
      *((double *)result + 1) = a9;
      *((double *)result + 2) = a10;
      *((_QWORD *)result + 4) = a7;
      *((_QWORD *)result + 5) = a8;
      *((_QWORD *)result + 6) = a11;
      *((_QWORD *)result + 7) = a12;
    }
  }
  return result;
}

- (double)contrast
{
  unint64_t v2;

  LOBYTE(v2) = self->_totalContrast8;
  return (double)v2 / 255.0;
}

- (double)rectForColorBoxAtRow:(uint64_t)a3 col:
{
  if (a1)
    return (double)(unint64_t)(*(_QWORD *)(a1 + 40) * *(_QWORD *)(a1 + 32) * a3);
  else
    return 0.0;
}

- (uint64_t)colorBoxAtRow:(uint64_t)a3 col:
{
  if (result)
    return *(_QWORD *)(result + 64) + 4 * (a3 + *(_QWORD *)(result + 80) * a2);
  return result;
}

- (PUIColorBoxes)initWithCoder:(id)a3
{
  id v4;
  PUIColorBoxes *v5;
  CGFloat v6;
  CGFloat v7;
  const void *v8;
  $14D77461FF5D83CAEC4252578BA76F85 *v9;
  size_t size;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUIColorBoxes;
  v5 = -[PUIColorBoxes init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("imageSize"));
    v5->_imageSize.width = v6;
    v5->_imageSize.height = v7;
    v5->_downsampledBoxSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("downsampledBoxSize"));
    v5->_effectiveDownsampleFactor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effectiveDownsampleFactor"));
    v5->_pixelHeight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pixelHeight"));
    v5->_pixelWidth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pixelWidth"));
    v5->_rowCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rowCount"));
    v5->_columnCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("columnCount"));
    v5->_size = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("size"));
    v5->_totalContrast8 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("totalContrast8"));
    size = 0;
    v8 = (const void *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("colorBoxesRowMajor"), &size);
    v9 = ($14D77461FF5D83CAEC4252578BA76F85 *)malloc_type_malloc(size, 0x41E7BD32uLL);
    memcpy(v9, v8, size);
    v5->_colorBoxesRowMajor = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double width;
  double height;
  id v6;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  v6 = a3;
  objc_msgSend(v6, "encodeCGSize:forKey:", CFSTR("imageSize"), width, height);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_downsampledBoxSize, CFSTR("downsampledBoxSize"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_effectiveDownsampleFactor, CFSTR("effectiveDownsampleFactor"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_pixelHeight, CFSTR("pixelHeight"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_pixelWidth, CFSTR("pixelWidth"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_rowCount, CFSTR("rowCount"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_columnCount, CFSTR("columnCount"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_size, CFSTR("size"));
  objc_msgSend(v6, "encodeInt:forKey:", self->_totalContrast8, CFSTR("totalContrast8"));
  objc_msgSend(v6, "encodeBytes:length:forKey:", self->_colorBoxesRowMajor, 4 * self->_rowCount * self->_columnCount, CFSTR("colorBoxesRowMajor"));

}

- (void)dealloc
{
  objc_super v3;

  free(self->_colorBoxesRowMajor);
  v3.receiver = self;
  v3.super_class = (Class)PUIColorBoxes;
  -[PUIColorBoxes dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_colorBoxesRowMajor, CFSTR("Color boxes"));
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_size, CFSTR("Size"));
  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_rowCount, CFSTR("Rows"));
  v7 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_columnCount, CFSTR("Columns"));
  v8 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_totalContrast8, CFSTR("Contrast"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)imageSize
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)downsampledBoxSize
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)effectiveDownsampleFactor
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)pixelHeight
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)pixelWidth
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)totalContrast8
{
  if (result)
    return *(unsigned __int8 *)(result + 24);
  return result;
}

- (uint64_t)colorBoxesRowMajor
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (uint64_t)rowCount
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)columnCount
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)size
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

+ (void)colorBoxesForImage:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_24464E000, v0, v1, "Detected overflow trying to multiply row count %lu with column count %lu", v2, v3);
}

+ (void)colorBoxesForImage:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_24464E000, v0, v1, "Failed to allocate color box buffer with row count %lu column count %lu", v2, v3);
}

+ (void)colorBoxesForImage:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_2("round_to_uint8", "PUIColorBoxes.m", a3, "0 <= lx && lx <= 255");
}

@end
