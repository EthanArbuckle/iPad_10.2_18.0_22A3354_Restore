@implementation PVStabilizationConfig

+ (id)configWithHomography:(double)a3 cleanAperture:(double)a4 cropRect:(double)a5 fillMode:(double)a6
{
  return (id)objc_msgSend([a1 alloc], "initWithHomography:cleanAperture:cropRect:fillMode:", a10, a2, a3, a4, a5, a6, a7, a8, a16, a17, a18);
}

- (PVStabilizationConfig)initWithHomography:(double)a3 cleanAperture:(double)a4 cropRect:(double)a5 fillMode:(double)a6
{
  PVStabilizationConfig *v24;
  PVStabilizationConfig *v25;
  objc_super v30;

  v30.receiver = a1;
  v30.super_class = (Class)PVStabilizationConfig;
  v24 = -[PVStabilizationConfig init](&v30, sel_init);
  v25 = v24;
  if (v24)
  {
    -[PVStabilizationConfig setHomography:](v24, "setHomography:", a2, a3, a4);
    -[PVStabilizationConfig setCleanAperture:](v25, "setCleanAperture:", a5, a6, a7, a8);
    -[PVStabilizationConfig setCropRect:](v25, "setCropRect:", a12, a13, a14, a15);
    -[PVStabilizationConfig setFillMode:](v25, "setFillMode:", a10);
  }
  return v25;
}

- (CGRect)normalizedCleanAperture
{
  double width;
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  width = self->_cleanAperture.size.width;
  height = self->_cleanAperture.size.height;
  v4 = fmax(width, height);
  v5 = width / v4;
  v6 = height / v4;
  v7 = *MEMORY[0x1E0C9D538] - v5 * 0.5;
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8) - v6 * 0.5;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (BOOL)isValid
{
  return -[PVStabilizationConfig isValidWithReason:](self, "isValidWithReason:", 0);
}

- (BOOL)isValidWithReason:(id *)a3
{
  double width;
  double height;
  __CFString *v5;
  BOOL result;
  double v8;
  double v9;

  width = self->_cleanAperture.size.width;
  if (width > -0.0000001 && width < 0.0000001
    || (height = self->_cleanAperture.size.height, height > -0.0000001) && height < 0.0000001)
  {
    if (a3)
    {
      v5 = CFSTR("Clean aperture has zero area");
LABEL_7:
      result = 0;
      *a3 = v5;
      return result;
    }
    return 0;
  }
  if (width < 2.0 || height < 2.0)
  {
    if (a3)
    {
      v5 = CFSTR("Clean aperture has side shorter than 2. Only pixel based clean aperture is supported.");
      goto LABEL_7;
    }
    return 0;
  }
  v8 = self->_cropRect.size.width;
  if (v8 > -0.0000001 && v8 < 0.0000001 || (v9 = self->_cropRect.size.height, v9 > -0.0000001) && v9 < 0.0000001)
  {
    if (a3)
    {
      v5 = CFSTR("Crop rect has zero area");
      goto LABEL_7;
    }
    return 0;
  }
  if (v8 > 1.5 || v9 > 1.5)
  {
    if (a3)
    {
      v5 = CFSTR("Crop rect has side longer than 1.5. Only normalized crop rect is supported.");
      goto LABEL_7;
    }
    return 0;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v10 = a3;
  -[PVStabilizationConfig homography](self, "homography");
  objc_msgSend(v4, "valueWithSIMDFloat3x3:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("homography"));

  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[PVStabilizationConfig cleanAperture](self, "cleanAperture");
  objc_msgSend(v6, "valueWithCGRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("cleanAperture"));

  v8 = (void *)MEMORY[0x1E0CB3B18];
  -[PVStabilizationConfig cropRect](self, "cropRect");
  objc_msgSend(v8, "valueWithCGRect:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("cropRect"));

  objc_msgSend(v10, "encodeInteger:forKey:", -[PVStabilizationConfig fillMode](self, "fillMode"), CFSTR("fillMode"));
}

- (PVStabilizationConfig)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  PVStabilizationConfig *v28;
  double v30;
  double v31;
  double v32;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homography"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SIMDFloat3x3Value");
  v31 = v7;
  v32 = v6;
  v30 = v8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cleanAperture"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CGRectValue");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cropRect"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CGRectValue");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fillMode"));

  v28 = -[PVStabilizationConfig initWithHomography:cleanAperture:cropRect:fillMode:](self, "initWithHomography:cleanAperture:cropRect:fillMode:", v27, v32, v31, v30, v11, v13, v15, v17, v20, v22, v24, v26);
  return v28;
}

- (void)setFillMode:(int)a3
{
  int v3;

  if (self->_fillMode != a3)
  {
    if (a3 >= 0xF)
      v3 = 0;
    else
      v3 = a3;
    self->_fillMode = v3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  PVStabilizationConfig *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v21;
  double v22;
  double v23;

  v4 = [PVStabilizationConfig alloc];
  -[PVStabilizationConfig homography](self, "homography");
  v22 = v6;
  v23 = v5;
  v21 = v7;
  -[PVStabilizationConfig cleanAperture](self, "cleanAperture");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PVStabilizationConfig cropRect](self, "cropRect");
  return -[PVStabilizationConfig initWithHomography:cleanAperture:cropRect:fillMode:](v4, "initWithHomography:cleanAperture:cropRect:fillMode:", -[PVStabilizationConfig fillMode](self, "fillMode"), v23, v22, v21, v9, v11, v13, v15, v16, v17, v18, v19);
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  char *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  __int128 v30[2];
  __int128 v31[2];
  __int128 v32[2];
  objc_super v33;
  id v34;
  simd_float3x3 v35;

  v34 = 0;
  v3 = -[PVStabilizationConfig isValidWithReason:](self, "isValidWithReason:", &v34);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v33.receiver = self;
  v33.super_class = (Class)PVStabilizationConfig;
  v5 = (__CFString *)v34;
  -[PVStabilizationConfig description](&v33, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVStabilizationConfig homography](self, "homography");
  NSStringFromSIMDFloat3x3(4, v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVStabilizationConfig cleanAperture](self, "cleanAperture");
  *((_QWORD *)&v9 + 1) = v8;
  *((_QWORD *)&v11 + 1) = v10;
  v32[0] = v9;
  v32[1] = v11;
  NSStringFromSIMDDouble4(v32, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVStabilizationConfig normalizedCleanAperture](self, "normalizedCleanAperture");
  *((_QWORD *)&v14 + 1) = v13;
  *((_QWORD *)&v16 + 1) = v15;
  v31[0] = v14;
  v31[1] = v16;
  NSStringFromSIMDDouble4(v31, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVStabilizationConfig cropRect](self, "cropRect");
  *((_QWORD *)&v19 + 1) = v18;
  *((_QWORD *)&v21 + 1) = v20;
  v30[0] = v19;
  v30[1] = v21;
  NSStringFromSIMDDouble4(v30, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[PVStabilizationConfig fillMode](self, "fillMode");
  if (v23 >= 0xF)
    v24 = 0;
  else
    v24 = v23;
  v25 = PVViewContentModeNames[v24];
  v26 = CFSTR("N");
  if (v3)
    v26 = CFSTR("Y");
  v27 = &stru_1E65EDDA0;
  if (v5)
    v27 = v5;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@\nhomography:\n%@\ncleanAperture: %@\ncleanAperture (normalized/centered): %@\ncropRect: %@\nfillMode: %s\nisValid: %@ %@"), v6, v7, v12, v17, v22, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (__n128)homography
{
  return a1[5];
}

- (__n128)setHomography:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

- (CGRect)cleanAperture
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cleanAperture.origin.x;
  y = self->_cleanAperture.origin.y;
  width = self->_cleanAperture.size.width;
  height = self->_cleanAperture.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCleanAperture:(CGRect)a3
{
  self->_cleanAperture = a3;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (int)fillMode
{
  return self->_fillMode;
}

@end
