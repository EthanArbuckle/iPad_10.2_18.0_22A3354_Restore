@implementation PVColorSpace

+ (id)preferredDisplayColorSpace
{
  if (+[PVDeviceCharacteristics hasExtendedColorDisplay](PVDeviceCharacteristics, "hasExtendedColorDisplay"))
  {
    objc_msgSend(a1, "p3d65GammaColorSpace");
  }
  else
  {
    objc_msgSend(a1, "sRGBColorSpace");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sRGBColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 0);
}

+ (id)rec601_1_1_6_GammaColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 1);
}

+ (id)rec601_SMPTE_C_GammaColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 2);
}

+ (id)rec601_EBU_3213_GammaColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 3);
}

+ (id)rec709GammaColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 4);
}

+ (id)rec709LinearColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 5);
}

+ (id)extendedSRGBColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 6);
}

+ (id)extendedLinearSRGBColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 7);
}

+ (id)extendedDisplayP3ColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 8);
}

+ (id)p3d65GammaColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 9);
}

+ (id)p3HLGGammaColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 10);
}

+ (id)p3PQGammaColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 11);
}

+ (id)rec2100HLGColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 12);
}

+ (id)rec2100PQColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 13);
}

+ (id)rec2020LinearColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 14);
}

+ (id)rec2020GammaColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 15);
}

+ (id)ProResLogColorSpace
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", 16);
}

+ (id)pvColorSpaceFromCGColorSpace:(CGColorSpace *)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;

  if (!a3)
    goto LABEL_32;
  +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToCGColorSpace:", a3);

  if (!v5)
  {
    +[PVColorSpace rec601_1_1_6_GammaColorSpace](PVColorSpace, "rec601_1_1_6_GammaColorSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToCGColorSpace:", a3);

    if (v8)
    {
      +[PVColorSpace rec601_1_1_6_GammaColorSpace](PVColorSpace, "rec601_1_1_6_GammaColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace rec601_SMPTE_C_GammaColorSpace](PVColorSpace, "rec601_SMPTE_C_GammaColorSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToCGColorSpace:", a3);

    if (v10)
    {
      +[PVColorSpace rec601_SMPTE_C_GammaColorSpace](PVColorSpace, "rec601_SMPTE_C_GammaColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace rec601_EBU_3213_GammaColorSpace](PVColorSpace, "rec601_EBU_3213_GammaColorSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToCGColorSpace:", a3);

    if (v12)
    {
      +[PVColorSpace rec601_EBU_3213_GammaColorSpace](PVColorSpace, "rec601_EBU_3213_GammaColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace rec709GammaColorSpace](PVColorSpace, "rec709GammaColorSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToCGColorSpace:", a3);

    if (v14)
    {
      +[PVColorSpace rec709GammaColorSpace](PVColorSpace, "rec709GammaColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace extendedSRGBColorSpace](PVColorSpace, "extendedSRGBColorSpace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToCGColorSpace:", a3);

    if (v16)
    {
      +[PVColorSpace extendedSRGBColorSpace](PVColorSpace, "extendedSRGBColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace extendedLinearSRGBColorSpace](PVColorSpace, "extendedLinearSRGBColorSpace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToCGColorSpace:", a3);

    if (v18)
    {
      +[PVColorSpace extendedLinearSRGBColorSpace](PVColorSpace, "extendedLinearSRGBColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace extendedDisplayP3ColorSpace](PVColorSpace, "extendedDisplayP3ColorSpace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToCGColorSpace:", a3);

    if (v20)
    {
      +[PVColorSpace extendedDisplayP3ColorSpace](PVColorSpace, "extendedDisplayP3ColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace p3d65GammaColorSpace](PVColorSpace, "p3d65GammaColorSpace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToCGColorSpace:", a3);

    if (v22)
    {
      +[PVColorSpace p3d65GammaColorSpace](PVColorSpace, "p3d65GammaColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace p3HLGGammaColorSpace](PVColorSpace, "p3HLGGammaColorSpace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToCGColorSpace:", a3);

    if (v24)
    {
      +[PVColorSpace p3HLGGammaColorSpace](PVColorSpace, "p3HLGGammaColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace p3PQGammaColorSpace](PVColorSpace, "p3PQGammaColorSpace");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToCGColorSpace:", a3);

    if (v26)
    {
      +[PVColorSpace p3PQGammaColorSpace](PVColorSpace, "p3PQGammaColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace rec2020LinearColorSpace](PVColorSpace, "rec2020LinearColorSpace");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToCGColorSpace:", a3);

    if (v28)
    {
      +[PVColorSpace rec2020LinearColorSpace](PVColorSpace, "rec2020LinearColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace rec2020GammaColorSpace](PVColorSpace, "rec2020GammaColorSpace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToCGColorSpace:", a3);

    if (v30)
    {
      +[PVColorSpace rec2020GammaColorSpace](PVColorSpace, "rec2020GammaColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace rec2100HLGColorSpace](PVColorSpace, "rec2100HLGColorSpace");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToCGColorSpace:", a3);

    if (v32)
    {
      +[PVColorSpace rec2100HLGColorSpace](PVColorSpace, "rec2100HLGColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    +[PVColorSpace rec2100PQColorSpace](PVColorSpace, "rec2100PQColorSpace");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToCGColorSpace:", a3);

    if (v34)
    {
      +[PVColorSpace rec2100PQColorSpace](PVColorSpace, "rec2100PQColorSpace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
LABEL_32:
    v6 = 0;
    return v6;
  }
  +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (id)pvColorSpaceForCVPixelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  CFTypeRef v4;
  const void *v5;
  unint64_t v6;
  unint64_t v7;
  CFTypeRef v8;
  const void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;

  v3 = a3;
  if (!a3)
    return v3;
  v4 = CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA8D68], 0);
  if (!v4)
  {
    v3 = 0;
    return v3;
  }
  v5 = v4;
  v6 = (unint64_t)CVBufferCopyAttachment(v3, (CFStringRef)*MEMORY[0x1E0CA8EE8], 0);
  v7 = (unint64_t)CVBufferCopyAttachment(v3, (CFStringRef)*MEMORY[0x1E0CA8E98], 0);
  v8 = CVBufferCopyAttachment(v3, CFSTR("LogTransferFunction"), 0);
  if (!v8)
  {
LABEL_15:
    if (CFEqual(v5, (CFTypeRef)*MEMORY[0x1E0CA8D98]))
    {
      +[PVColorSpace p3d65GammaColorSpace](PVColorSpace, "p3d65GammaColorSpace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EA8]))
        {
          +[PVColorSpace p3HLGGammaColorSpace](PVColorSpace, "p3HLGGammaColorSpace");
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_26:
          v3 = (__CVBuffer *)v13;

          goto LABEL_8;
        }
        if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EC8]))
        {
          +[PVColorSpace p3PQGammaColorSpace](PVColorSpace, "p3PQGammaColorSpace");
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        }
      }
      v3 = (__CVBuffer *)v12;
      goto LABEL_8;
    }
    if (!CFEqual(v5, (CFTypeRef)*MEMORY[0x1E0CA8D88]))
    {
      if (CFEqual(v5, (CFTypeRef)*MEMORY[0x1E0CA8D80]))
      {
        if (v7)
        {
          if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EA8]))
          {
            +[PVColorSpace rec2100HLGColorSpace](PVColorSpace, "rec2100HLGColorSpace");
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
          if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EC8]))
          {
            +[PVColorSpace rec2100PQColorSpace](PVColorSpace, "rec2100PQColorSpace");
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
          if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EB8]))
          {
            +[PVColorSpace rec2020LinearColorSpace](PVColorSpace, "rec2020LinearColorSpace");
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
          if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EB0])
            || CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EA0]))
          {
            +[PVColorSpace rec2020GammaColorSpace](PVColorSpace, "rec2020GammaColorSpace");
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
        }
      }
      else if (CFEqual(v5, (CFTypeRef)*MEMORY[0x1E0CA8DA0]))
      {
        if (v7)
        {
          v3 = 0;
          if (!CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EB0]) || !v6)
            goto LABEL_8;
          if (CFEqual((CFTypeRef)v6, (CFTypeRef)*MEMORY[0x1E0CA8F10]))
          {
            +[PVColorSpace rec601_SMPTE_C_GammaColorSpace](PVColorSpace, "rec601_SMPTE_C_GammaColorSpace");
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
        }
      }
      else
      {
        v3 = 0;
        if (!CFEqual(v5, (CFTypeRef)*MEMORY[0x1E0CA8D78]))
          goto LABEL_8;
        if (!v7)
          goto LABEL_8;
        v3 = 0;
        if (!CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EB0]) || !v6)
          goto LABEL_8;
        if (CFEqual((CFTypeRef)v6, (CFTypeRef)*MEMORY[0x1E0CA8F10]))
        {
          +[PVColorSpace rec601_EBU_3213_GammaColorSpace](PVColorSpace, "rec601_EBU_3213_GammaColorSpace");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        }
      }
      v3 = 0;
      goto LABEL_8;
    }
    if (v7 | v6)
    {
      if (v6 && CFEqual((CFTypeRef)v6, (CFTypeRef)*MEMORY[0x1E0CA8F10]))
      {
        +[PVColorSpace rec601_1_1_6_GammaColorSpace](PVColorSpace, "rec601_1_1_6_GammaColorSpace");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      if (!v7)
        goto LABEL_54;
      if (!CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EB0]))
      {
        if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EB8]))
        {
          +[PVColorSpace rec709LinearColorSpace](PVColorSpace, "rec709LinearColorSpace");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        }
        if (CFEqual((CFTypeRef)v7, (CFTypeRef)*MEMORY[0x1E0CA8EE0]))
        {
          +[PVColorSpace sRGBColorSpace](PVColorSpace, "sRGBColorSpace");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        }
LABEL_54:
        NSLog(CFSTR("Unknown transfer function (%@) and matrix (%@). Fallback to 709gamma"), v7, v6);
      }
    }
    +[PVColorSpace rec709GammaColorSpace](PVColorSpace, "rec709GammaColorSpace");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = v8;
  if (!CFEqual(v8, CFSTR("AppleLog")) && !CFEqual(v9, CFSTR("com.apple.rec2020.apple-log")))
  {
    CFRelease(v9);
    goto LABEL_15;
  }
  CFRelease(v9);
  +[PVColorSpace ProResLogColorSpace](PVColorSpace, "ProResLogColorSpace");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v3 = (__CVBuffer *)v10;
LABEL_8:
  CFRelease(v5);
  if (v7)
    CFRelease((CFTypeRef)v7);
  if (v6)
    CFRelease((CFTypeRef)v6);
  return v3;
}

- (PVColorSpace)initWithType:(int)a3
{
  PVColorSpace *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PVColorSpace;
  result = -[PVColorSpace init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PVColorSpace init](+[PVColorSpace allocWithZone:](PVColorSpace, "allocWithZone:", a3), "init");
  if (result)
    *((_DWORD *)result + 2) = self->_type;
  return result;
}

- (BOOL)isSRGBColorSpace
{
  return self->_type == 0;
}

- (BOOL)isRec601_1_1_6_GammaColorSpace
{
  return self->_type == 1;
}

- (BOOL)isRec601_SMPTE_C_GammaColorSpace
{
  return self->_type == 2;
}

- (BOOL)isRec601_EBU_3213_GammaColorSpace
{
  return self->_type == 3;
}

- (BOOL)isRec709GammaColorSpace
{
  return self->_type == 4;
}

- (BOOL)isRec709LinearColorSpace
{
  return self->_type == 5;
}

- (BOOL)isExtendedSRGBColorSpace
{
  return self->_type == 6;
}

- (BOOL)isExtendedLinearSRGBColorSpace
{
  return self->_type == 7;
}

- (BOOL)isExtendedDisplayP3ColorSpace
{
  return self->_type == 8;
}

- (BOOL)isP3d65GammaColorSpace
{
  return self->_type == 9;
}

- (BOOL)isP3HLGGammaColorSpace
{
  return self->_type == 10;
}

- (BOOL)isP3PQGammaColorSpace
{
  return self->_type == 11;
}

- (BOOL)isRec2100HLGColorSpace
{
  return self->_type == 12;
}

- (BOOL)isRec2100PQColorSpace
{
  return self->_type == 13;
}

- (BOOL)isRec2020LinearColorSpace
{
  return self->_type == 14;
}

- (BOOL)isRec2020GammaColorSpace
{
  return self->_type == 15;
}

- (BOOL)isProResLogColorSpace
{
  return self->_type == 16;
}

- (BOOL)isWideGamutSpace
{
  return -[PVColorSpace isExtendedSRGBColorSpace](self, "isExtendedSRGBColorSpace")
      || -[PVColorSpace isExtendedLinearSRGBColorSpace](self, "isExtendedLinearSRGBColorSpace")
      || -[PVColorSpace isExtendedDisplayP3ColorSpace](self, "isExtendedDisplayP3ColorSpace")
      || -[PVColorSpace isP3d65GammaColorSpace](self, "isP3d65GammaColorSpace")
      || -[PVColorSpace isRec2020LinearColorSpace](self, "isRec2020LinearColorSpace")
      || -[PVColorSpace isRec2020GammaColorSpace](self, "isRec2020GammaColorSpace")
      || -[PVColorSpace isHDRSpace](self, "isHDRSpace");
}

- (BOOL)isHDRSpace
{
  return -[PVColorSpace isP3HLGGammaColorSpace](self, "isP3HLGGammaColorSpace")
      || -[PVColorSpace isP3PQGammaColorSpace](self, "isP3PQGammaColorSpace")
      || -[PVColorSpace isRec2100HLGColorSpace](self, "isRec2100HLGColorSpace")
      || -[PVColorSpace isRec2100PQColorSpace](self, "isRec2100PQColorSpace")
      || -[PVColorSpace isProResLogColorSpace](self, "isProResLogColorSpace");
}

- (BOOL)isEqualToCGColorSpace:(CGColorSpace *)a3
{
  CGColorSpace *v4;
  BOOL result;

  v4 = -[PVColorSpace cgColorSpace](self, "cgColorSpace");
  result = 0;
  if (a3)
  {
    if (v4)
      return CFEqual(v4, a3) != 0;
  }
  return result;
}

- (id)nclcTriplet
{
  unsigned __int8 v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PVColorSpace *v16;

  if ((v2 & 1) == 0)
  {
    v16 = self;
    self = v16;
    if (v4)
    {
      v5 = *MEMORY[0x1E0CA8D88];
      v6 = *MEMORY[0x1E0CA8EE0];
      v7 = *MEMORY[0x1E0CA8F18];
      MakePVNCLCTriplet(*MEMORY[0x1E0CA8D88], 0, *MEMORY[0x1E0CA8EE0], 13, *MEMORY[0x1E0CA8F18], 1);
      -[PVColorSpace nclcTriplet]::s_NCLCTripletsMap[0] = objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0CA8EB0];
      v9 = *MEMORY[0x1E0CA8F10];
      MakePVNCLCTriplet(v5, 0, *MEMORY[0x1E0CA8EB0], 1, *MEMORY[0x1E0CA8F10], 2);
      qword_1ED4D90D8 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(*MEMORY[0x1E0CA8DA0], 2, v8, 1, v9, 2);
      qword_1ED4D90E0 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(*MEMORY[0x1E0CA8D78], 1, v8, 1, v9, 2);
      qword_1ED4D90E8 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(v5, 0, v8, 1, v7, 1);
      qword_1ED4D90F0 = objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x1E0CA8EB8];
      MakePVNCLCTriplet(v5, 0, *MEMORY[0x1E0CA8EB8], 8, v7, 1);
      qword_1ED4D90F8 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(v5, 0, v6, 13, v7, 1);
      qword_1ED4D9100 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(v5, 0, v10, 8, v7, 1);
      qword_1ED4D9108 = objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x1E0CA8D98];
      MakePVNCLCTriplet(*MEMORY[0x1E0CA8D98], 5, v6, 13, v7, 1);
      qword_1ED4D9110 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(v11, 5, v8, 1, v7, 1);
      qword_1ED4D9118 = objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0CA8EA8];
      MakePVNCLCTriplet(v11, 5, *MEMORY[0x1E0CA8EA8], 18, v7, 1);
      qword_1ED4D9120 = objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0CA8EC8];
      MakePVNCLCTriplet(v11, 5, *MEMORY[0x1E0CA8EC8], 16, v7, 1);
      qword_1ED4D9128 = objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0CA8D80];
      v15 = *MEMORY[0x1E0CA8F00];
      MakePVNCLCTriplet(*MEMORY[0x1E0CA8D80], 3, v12, 18, *MEMORY[0x1E0CA8F00], 3);
      qword_1ED4D9130 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(v14, 3, v13, 16, v15, 3);
      qword_1ED4D9138 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(v14, 3, v10, 8, v15, 3);
      qword_1ED4D9140 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(v14, 3, v8, 1, v15, 3);
      qword_1ED4D9148 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(v14, 3, v8, 1, v15, 3);
      qword_1ED4D9150 = objc_claimAutoreleasedReturnValue();
      MakePVNCLCTriplet(0, 0, 0, 1, 0, 0);
      qword_1ED4D9158 = objc_claimAutoreleasedReturnValue();
      self = v16;
    }
  }
  return (id)-[PVColorSpace nclcTriplet]::s_NCLCTripletsMap[self->_type];
}

- (BOOL)isEqual:(id)a3
{
  PVColorSpace *v4;
  BOOL v5;

  v4 = (PVColorSpace *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (v4)
  {
    v5 = self->_type == v4->_type;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_type;
}

- (id)name
{
  uint64_t type;

  type = self->_type;
  if (type > 0x10)
    return CFSTR("unknown");
  else
    return off_1E64D6F40[type];
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PVColorSpace name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGColorSpace)cgColorSpace
{
  uint64_t type;
  CGColorSpace *result;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD block[5];

  type = self->_type;
  switch((int)type)
  {
    case 1:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__PVColorSpace_cgColorSpace__block_invoke;
      block[3] = &unk_1E64D47C0;
      block[4] = self;
      if (-[PVColorSpace cgColorSpace]::onceToken_601Gamma != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_601Gamma, block);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_601Gamma;
      break;
    case 2:
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __28__PVColorSpace_cgColorSpace__block_invoke_2;
      v5[3] = &unk_1E64D47C0;
      v5[4] = self;
      if (-[PVColorSpace cgColorSpace]::onceToken_601_SMPTE_C_Gamma != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_601_SMPTE_C_Gamma, v5);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_601_SMPTE_C_Gamma;
      break;
    case 3:
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __28__PVColorSpace_cgColorSpace__block_invoke_3;
      v4[3] = &unk_1E64D47C0;
      v4[4] = self;
      if (-[PVColorSpace cgColorSpace]::onceToken_601_EBU_3213_Gamma != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_601_EBU_3213_Gamma, v4);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_601_EBU_3213_Gamma;
      break;
    case 6:
      if (-[PVColorSpace cgColorSpace]::onceToken_xrsRGB != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_xrsRGB, &__block_literal_global_15);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_extendedSRGB;
      break;
    case 7:
      if (-[PVColorSpace cgColorSpace]::onceToken_xrLinearsRGB != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_xrLinearsRGB, &__block_literal_global_73_0);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_extendedLinearSRGB;
      break;
    case 8:
      if (-[PVColorSpace cgColorSpace]::onceToken_xrDisplayP3 != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_xrDisplayP3, &__block_literal_global_74_0);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_extendedDisplayP3;
      break;
    case 9:
      if (-[PVColorSpace cgColorSpace]::onceToken_p3d65 != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_p3d65, &__block_literal_global_75);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_displayP3;
      break;
    case 10:
      if (-[PVColorSpace cgColorSpace]::onceToken_p3HLG != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_p3HLG, &__block_literal_global_76);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_p3HLGCS;
      break;
    case 11:
      if (-[PVColorSpace cgColorSpace]::onceToken_p3PQ != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_p3PQ, &__block_literal_global_77);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_p3PQCS;
      break;
    case 12:
      if (-[PVColorSpace cgColorSpace]::onceToken_2100HLG != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_2100HLG, &__block_literal_global_78);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_2100HLGCS;
      break;
    case 13:
      if (-[PVColorSpace cgColorSpace]::onceToken_2100PQ != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_2100PQ, &__block_literal_global_79_0);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_2100PQCS;
      break;
    case 14:
      if (-[PVColorSpace cgColorSpace]::onceToken_2020Lin != -1)
        dispatch_once(&-[PVColorSpace cgColorSpace]::onceToken_2020Lin, &__block_literal_global_80);
      result = (CGColorSpace *)-[PVColorSpace cgColorSpace]::s_2020LinearCS;
      break;
    default:
      result = (CGColorSpace *)PCColorSpaceCache::getCGColorSpaceByID((CGColorSpace **)-[PVColorSpace cgColorSpace]::s_proCoreColorSpaceMap[type]);
      break;
  }
  return result;
}

void __28__PVColorSpace_cgColorSpace__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "nclcTriplet");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  -[PVColorSpace cgColorSpace]::s_601Gamma = (uint64_t)makeColorSpaceFromNCLC((const __CFString *)objc_msgSend(v1, "colorPrimary"), (const __CFString *)objc_msgSend(v1, "transferFunction"), (const __CFString *)objc_msgSend(v1, "ycbcrMatrix"));

}

void __28__PVColorSpace_cgColorSpace__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "nclcTriplet");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  -[PVColorSpace cgColorSpace]::s_601_SMPTE_C_Gamma = (uint64_t)makeColorSpaceFromNCLC((const __CFString *)objc_msgSend(v1, "colorPrimary"), (const __CFString *)objc_msgSend(v1, "transferFunction"), (const __CFString *)objc_msgSend(v1, "ycbcrMatrix"));

}

void __28__PVColorSpace_cgColorSpace__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "nclcTriplet");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  -[PVColorSpace cgColorSpace]::s_601_EBU_3213_Gamma = (uint64_t)makeColorSpaceFromNCLC((const __CFString *)objc_msgSend(v1, "colorPrimary"), (const __CFString *)objc_msgSend(v1, "transferFunction"), (const __CFString *)objc_msgSend(v1, "ycbcrMatrix"));

}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_4()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  -[PVColorSpace cgColorSpace]::s_extendedSRGB = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_5()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D958]);
  -[PVColorSpace cgColorSpace]::s_extendedLinearSRGB = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_6()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D928]);
  -[PVColorSpace cgColorSpace]::s_extendedDisplayP3 = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_7()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  -[PVColorSpace cgColorSpace]::s_displayP3 = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_8()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D910]);
  -[PVColorSpace cgColorSpace]::s_p3HLGCS = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_9()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D918]);
  -[PVColorSpace cgColorSpace]::s_p3PQCS = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_10()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9C0]);
  -[PVColorSpace cgColorSpace]::s_2100HLGCS = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_11()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9C8]);
  -[PVColorSpace cgColorSpace]::s_2100PQCS = (uint64_t)result;
  return result;
}

CGColorSpaceRef __28__PVColorSpace_cgColorSpace__block_invoke_12()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D950]);
  -[PVColorSpace cgColorSpace]::s_2020LinearCS = (uint64_t)result;
  return result;
}

@end
