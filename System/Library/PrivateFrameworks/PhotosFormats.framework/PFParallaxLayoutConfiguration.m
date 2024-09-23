@implementation PFParallaxLayoutConfiguration

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 denormalizedYDownTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a5.size.height;
  width = a5.size.width;
  v8 = a5.origin.x - *MEMORY[0x1E0C9D538];
  v9 = 0.0;
  v10 = 0.0;
  if (a3.width != 0.0)
  {
    v8 = v8 / a3.width;
    v10 = width / a3.width;
  }
  v11 = a5.origin.y - *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (a3.height != 0.0)
  {
    v11 = v11 / a3.height;
    v9 = height / a3.height;
  }
  return -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", *(_QWORD *)&v8, *(double *)(MEMORY[0x1E0D71110] + 8) + *(double *)(MEMORY[0x1E0D71110] + 24) - (v9 + v11), *(_QWORD *)&v10, *(_QWORD *)&v9, *(_QWORD *)&a6.width, *(_QWORD *)&a6.height);
}

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 normalizedYDownTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6
{
  return -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:normalizedTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:normalizedTimeRect:parallaxPadding:", a3.width, a3.height, a4, a5.origin.x, *(double *)(MEMORY[0x1E0D71110] + 8)+ *(double *)(MEMORY[0x1E0D71110] + 24)- (a5.origin.y+ a5.size.height), a5.size.width);
}

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 normalizedTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6
{
  return -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", a3.width, a3.height, a4, *(_QWORD *)&a5.origin.x, *(_QWORD *)&a5.origin.y, *(_QWORD *)&a5.size.width, *(_QWORD *)&a5.size.height, *(_QWORD *)&a6.width, *(_QWORD *)&a6.height);
}

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 timeRect:(CGRect)a4 inactiveTimeRect:(CGRect)a5 parallaxPadding:(CGSize)a6
{
  return -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", a3.width, a3.height, PFDeviceScreenScale(), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (PFParallaxLayoutConfiguration)initWithScreenSize:(CGSize)a3 screenScale:(double)a4 timeRect:(CGRect)a5 inactiveTimeRect:(CGRect)a6 parallaxPadding:(CGSize)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  PFParallaxLayoutConfiguration *result;
  CGFloat v14;
  objc_super v15;
  CGFloat v16;
  CGFloat v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3.height;
  v12 = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)PFParallaxLayoutConfiguration;
  result = -[PFParallaxLayoutConfiguration init](&v15, sel_init, *(_QWORD *)&a7.width, *(_QWORD *)&a7.height);
  result->_screenScale = a4;
  result->_screenSize.width = v12;
  result->_timeRect.origin.y = y;
  result->_timeRect.size.width = width;
  result->_timeRect.size.height = height;
  result->_inactiveTimeRect.origin.x = x;
  result->_inactiveTimeRect.origin.y = y;
  result->_inactiveTimeRect.size.width = width;
  result->_inactiveTimeRect.size.height = height;
  result->_screenSize.height = v14;
  result->_parallaxPadding.width = v16;
  result->_parallaxPadding.height = v17;
  result->_timeRect.origin.x = x;
  return result;
}

- (PFParallaxLayoutConfiguration)init
{
  PFParallaxLayoutConfiguration *v2;
  SEL v3;
  PFParallaxLayoutConfiguration *result;

  v2 = (PFParallaxLayoutConfiguration *)_PFAssertFailHandler();
  -[PFParallaxLayoutConfiguration unsafeRect](v2, v3);
  return result;
}

- (CGRect)unsafeRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PFParallaxLayoutConfiguration timeRect](self, "timeRect");
  v5 = 1.0 - v3;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)timeOverlapCheckBottom
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  +[PFParallaxLayoutTextOverlapParameters systemParameters](PFParallaxLayoutTextOverlapParameters, "systemParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAreaHeight");
  v5 = v4;

  -[PFParallaxLayoutConfiguration timeRect](self, "timeRect");
  v8 = v7 + v6 * 0.0;
  v11 = v9 + v10 * 0.0;
  v12 = v5 * v10;
  result.size.height = v12;
  result.size.width = v6;
  result.origin.y = v11;
  result.origin.x = v8;
  return result;
}

- (CGRect)timeOverlapCheckTop
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  +[PFParallaxLayoutTextOverlapParameters systemParameters](PFParallaxLayoutTextOverlapParameters, "systemParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAreaHeight");
  v5 = v4;

  -[PFParallaxLayoutConfiguration timeRect](self, "timeRect");
  v8 = v7 + v6 * 0.0;
  v11 = v9 + v5 * v10;
  v12 = (1.0 - v5) * v10;
  result.size.height = v12;
  result.size.width = v6;
  result.origin.y = v11;
  result.origin.x = v8;
  return result;
}

- (CGSize)parallaxPaddingPct
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PFParallaxLayoutConfiguration screenSize](self, "screenSize");
  v4 = v3;
  v6 = v5;
  -[PFParallaxLayoutConfiguration parallaxPadding](self, "parallaxPadding");
  v8 = v7 / v4;
  v10 = v9 / v6;
  result.height = v10;
  result.width = v8;
  return result;
}

- (id)description
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PFParallaxLayoutConfiguration screenSize](self, "screenSize");
  v6 = v5;
  v8 = v7;
  -[PFParallaxLayoutConfiguration timeRect](self, "timeRect");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%0.0fx%0.0f time=(%0.0f,%0.0f,%0.0f,%0.0f)]"), *(_QWORD *)&v6, *(_QWORD *)&v8, v3 + v9 * v6, v4 + v10 * v8, v6 * v11, v8 * v12);
}

- (id)debugDescription
{
  double v3;
  double v4;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v34;
  double v35;
  _QWORD v36[2];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[2];

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PFParallaxLayoutConfiguration screenSize](self, "screenSize");
  v6 = v5;
  v8 = v7;
  -[PFParallaxLayoutConfiguration timeRect](self, "timeRect");
  v10 = v3 + v9 * v6;
  v12 = v4 + v11 * v8;
  v14 = v6 * v13;
  v16 = v8 * v15;
  -[PFParallaxLayoutConfiguration inactiveTimeRect](self, "inactiveTimeRect");
  v18 = v3 + v17 * v6;
  v20 = v4 + v19 * v8;
  v34 = v8 * v22;
  v35 = v6 * v21;
  v23 = (void *)MEMORY[0x1E0CB3940];
  v24 = objc_opt_class();
  *(double *)v39 = v6;
  *(double *)&v39[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v39, "{CGSize=dd}");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v38 = v10;
  *(double *)&v38[1] = v12;
  *(double *)&v38[2] = v14;
  *(double *)&v38[3] = v16;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v38, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v37 = v18;
  *(double *)&v37[1] = v20;
  *(double *)&v37[2] = v35;
  *(double *)&v37[3] = v34;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v37, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB3B18];
  -[PFParallaxLayoutConfiguration parallaxPadding](self, "parallaxPadding");
  v36[0] = v29;
  v36[1] = v30;
  objc_msgSend(v28, "valueWithBytes:objCType:", v36, "{CGSize=dd}");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@:%p screen=%@ time=%@ inactiveTime=%@ parallaxPadding=%@>"), v24, self, v25, v26, v27, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E45CA7F0, CFSTR("version"));
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_screenSize);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("screenSize"));

  v5 = CGRectCreateDictionaryRepresentation(self->_timeRect);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("timeRect"));

  v6 = CGRectCreateDictionaryRepresentation(self->_inactiveTimeRect);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("inactiveTimeRect"));

  v7 = CGSizeCreateDictionaryRepresentation(self->_parallaxPadding);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("parallaxPadding"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_screenScale);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("screenScale"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PFParallaxLayoutConfiguration *v4;
  BOOL v5;

  v4 = (PFParallaxLayoutConfiguration *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PFParallaxLayoutConfiguration isEqualToLayoutConfiguration:](self, "isEqualToLayoutConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToLayoutConfiguration:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v26;
  double v27;
  double v28;

  v4 = a3;
  objc_msgSend(v4, "screenSize");
  v6 = v5;
  v8 = v7;
  -[PFParallaxLayoutConfiguration screenSize](self, "screenSize");
  v11 = v6 == v10 && v8 == v9;
  if (v11
    && (objc_msgSend(v4, "timeRect"),
        v13 = v12,
        v15 = v14,
        v17 = v16,
        v19 = v18,
        -[PFParallaxLayoutConfiguration timeRect](self, "timeRect"),
        vabdd_f64(v13, v23) <= 0.00000999999975)
    && vabdd_f64(v15, v20) <= 0.00000999999975
    && vabdd_f64(v17, v21) <= 0.00000999999975
    && vabdd_f64(v19, v22) <= 0.00000999999975)
  {
    -[PFParallaxLayoutConfiguration screenScale](self, "screenScale");
    v27 = v26;
    objc_msgSend(v4, "screenScale");
    v24 = vabdd_f64(v27, v28) <= 0.1;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", 2, CFSTR("version"));
  -[PFParallaxLayoutConfiguration screenSize](self, "screenSize");
  objc_msgSend(v4, "encodeSize:forKey:", CFSTR("screenSize"));
  -[PFParallaxLayoutConfiguration timeRect](self, "timeRect");
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("timeRect"));
  -[PFParallaxLayoutConfiguration inactiveTimeRect](self, "inactiveTimeRect");
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("inactiveTimeRect"));
  -[PFParallaxLayoutConfiguration parallaxPadding](self, "parallaxPadding");
  objc_msgSend(v4, "encodeSize:forKey:", CFSTR("parallaxPadding"));
  -[PFParallaxLayoutConfiguration screenScale](self, "screenScale");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("screenScale"));

}

- (PFParallaxLayoutConfiguration)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  PFParallaxLayoutConfiguration *v26;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v4 = a3;
  objc_msgSend(v4, "decodeSizeForKey:", CFSTR("screenSize"));
  v31 = v6;
  v32 = v5;
  objc_msgSend(v4, "decodeRectForKey:", CFSTR("timeRect"));
  v29 = v8;
  v30 = v7;
  v28 = v9;
  v11 = v10;
  objc_msgSend(v4, "decodeRectForKey:", CFSTR("inactiveTimeRect"));
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v4, "decodeSizeForKey:", CFSTR("parallaxPadding"));
  v21 = v20;
  v23 = v22;
  if (+[PFWallpaperCompoundDeviceConfiguration deviceSupportsLandscapeConfiguration](PFWallpaperCompoundDeviceConfiguration, "deviceSupportsLandscapeConfiguration"))
  {
    v24 = 2.0;
  }
  else
  {
    v24 = 3.0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("version")))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("screenScale"));
    v24 = v25;
  }
  v26 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](self, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", v32, v31, v24, v30, v29, v28, v11, v13, v15, v17, v19, v21, v23);

  return v26;
}

- (CGSize)screenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_screenSize.width;
  height = self->_screenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (CGRect)timeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timeRect.origin.x;
  y = self->_timeRect.origin.y;
  width = self->_timeRect.size.width;
  height = self->_timeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)inactiveTimeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inactiveTimeRect.origin.x;
  y = self->_inactiveTimeRect.origin.y;
  width = self->_inactiveTimeRect.size.width;
  height = self->_inactiveTimeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)parallaxPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_parallaxPadding.width;
  height = self->_parallaxPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

+ (id)genericConfigurationForOrientation:(int64_t)a3
{
  double v3;
  double v4;

  if (a3 == 1)
  {
    v3 = 1170.0;
    v4 = 2532.0;
  }
  else
  {
    v3 = 2388.0;
    v4 = 1668.0;
  }
  objc_msgSend(a1, "bestConfigurationForScreenSize:screenScale:orientation:", v3, v4, 3.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)genericPadConfigurationForOrientation:(int64_t)a3
{
  double v3;
  double v4;

  if (a3 == 1)
  {
    v3 = 1668.0;
    v4 = 2388.0;
  }
  else
  {
    v3 = 2388.0;
    v4 = 1668.0;
  }
  objc_msgSend(a1, "bestConfigurationForScreenSize:screenScale:orientation:", v3, v4, 2.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)deviceConfigurationForOrientation:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  switch(a3)
  {
    case 1:
      goto LABEL_5;
    case 2:
      +[PFWallpaperCompoundDeviceConfiguration deviceConfiguration](PFWallpaperCompoundDeviceConfiguration, "deviceConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "landscapeConfiguration");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      _PFAssertFailHandler();
LABEL_5:
      +[PFWallpaperCompoundDeviceConfiguration deviceConfiguration](PFWallpaperCompoundDeviceConfiguration, "deviceConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "portraitConfiguration");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v3 = (void *)v5;

      break;
  }
  return v3;
}

+ (id)bestConfigurationForScreenSize:(CGSize)a3 screenScale:(double)a4 orientation:(int64_t)a5
{
  return (id)objc_msgSend(a1, "bestConfigurationForScreenSize:screenScale:startingWithConfiguration:orientation:", 0, a5, a3.width, a3.height, a4);
}

+ (id)bestConfigurationForScreenSize:(CGSize)a3 screenScale:(double)a4 startingWithConfiguration:(id)a5 orientation:(int64_t)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  _BOOL4 v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  objc_class *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  double v58;
  double v59;
  Class v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  double v67;
  __int16 v68;
  double v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  height = a3.height;
  width = a3.width;
  v73 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99E60];
  +[PFWallpaperCompoundDeviceConfiguration knownDeviceConfigurations](PFWallpaperCompoundDeviceConfiguration, "knownDeviceConfigurations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  v17 = v10;
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v63;
    v17 = v10;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v63 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        switch(a6)
        {
          case 1:
            if (!v17)
              goto LABEL_12;
            objc_msgSend(v17, "screenSize");
            v23 = v22;
            v25 = v24;
            objc_msgSend(v21, "portraitConfiguration");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "screenSize");
            v29 = __114__PFParallaxLayoutConfiguration_bestConfigurationForScreenSize_screenScale_startingWithConfiguration_orientation___block_invoke(width, height, v23, v25, v27, v28);

            if (v29)
            {
LABEL_12:
              objc_msgSend(v21, "portraitConfiguration");
              v30 = objc_claimAutoreleasedReturnValue();
LABEL_16:
              v39 = (void *)v30;

              v17 = v39;
              continue;
            }
            break;
          case 2:
            if (!v17)
              goto LABEL_15;
            objc_msgSend(v17, "screenSize");
            v32 = v31;
            v34 = v33;
            objc_msgSend(v21, "landscapeConfiguration");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "screenSize");
            v38 = __114__PFParallaxLayoutConfiguration_bestConfigurationForScreenSize_screenScale_startingWithConfiguration_orientation___block_invoke(width, height, v32, v34, v36, v37);

            if (v38)
            {
LABEL_15:
              objc_msgSend(v21, "landscapeConfiguration");
              v30 = objc_claimAutoreleasedReturnValue();
              goto LABEL_16;
            }
            break;
          case 0:
            _PFAssertFailHandler();
            break;
        }
      }
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v18);
  }

  v40 = objc_alloc((Class)a1);
  objc_msgSend(v17, "timeRect");
  v59 = v42;
  v61 = v41;
  v58 = v43;
  v45 = v44;
  objc_msgSend(v17, "inactiveTimeRect");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  objc_msgSend(v17, "parallaxPadding");
  v56 = (void *)objc_msgSend(v40, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", width, height, a4, *(double *)&v61, v59, v58, v45, v47, v49, v51, v53, v54, v55);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    v67 = width;
    v68 = 2048;
    v69 = height;
    v70 = 2114;
    v71 = v56;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Best layout configuration for screen size %0.0fx%0.0f: %{public}@", buf, 0x20u);
  }

  return v56;
}

+ (id)layoutConfigurationFromDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  const __CFDictionary *v7;
  BOOL v8;
  const __CFDictionary *v9;
  BOOL v10;
  const __CFDictionary *v11;
  BOOL v12;
  const __CFDictionary *v13;
  BOOL v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  PFParallaxLayoutConfiguration *v18;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  PFParallaxLayoutConfiguration *v30;
  CGSize v31;
  CGRect v32;
  CGRect rect;
  CGSize size;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
    _PFAssertFailHandler();
  v6 = v5;
  size.width = 0.0;
  size.height = 0.0;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("screenSize"));
  v7 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = CGSizeMakeWithDictionaryRepresentation(v7, &size);

    if (v8)
    {
      memset(&rect, 0, sizeof(rect));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeRect"));
      v9 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v10 = CGRectMakeWithDictionaryRepresentation(v9, &rect);

        if (v10)
        {
          memset(&v32, 0, sizeof(v32));
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inactiveTimeRect"));
          v11 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
          if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v12 = CGRectMakeWithDictionaryRepresentation(v11, &v32);

            if (v12)
            {
              v31.width = 0.0;
              v31.height = 0.0;
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("parallaxPadding"));
              v13 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
              if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v14 = CGSizeMakeWithDictionaryRepresentation(v13, &v31);

                if (v14)
                  goto LABEL_41;
              }
              else
              {

              }
              v31 = (CGSize)*MEMORY[0x1E0C9D820];
LABEL_41:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("screenScale"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (+[PFWallpaperCompoundDeviceConfiguration deviceSupportsLandscapeConfiguration](PFWallpaperCompoundDeviceConfiguration, "deviceSupportsLandscapeConfiguration"))
                {
                  v28 = 2.0;
                }
                else
                {
                  v28 = 3.0;
                }
                objc_msgSend(v27, "doubleValue");
                if (v29 != 0.0)
                  v28 = v29;

              }
              else
              {
                v28 = PFDeviceScreenScale();
              }
              v30 = [PFParallaxLayoutConfiguration alloc];
              v18 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:](v30, "initWithScreenSize:screenScale:timeRect:inactiveTimeRect:parallaxPadding:", size.width, size.height, v28, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, *(_QWORD *)&v32.origin.x, *(_QWORD *)&v32.origin.y, *(_QWORD *)&v32.size.width, *(_QWORD *)&v32.size.height, *(_QWORD *)&v31.width, *(_QWORD *)&v31.height);

LABEL_38:
LABEL_30:

              goto LABEL_22;
            }
          }
          else
          {

          }
          if (a4)
          {
            v23 = (void *)MEMORY[0x1E0CB35C8];
            v35[0] = CFSTR("PFNonLocalizedFailureReason");
            v35[1] = CFSTR("PFRelatedObject");
            if (v11)
              v24 = (const __CFString *)v11;
            else
              v24 = CFSTR("nil");
            v36[0] = CFSTR("Invalid inactive time rect");
            v36[1] = v24;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v25);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          v18 = 0;
          goto LABEL_38;
        }
      }
      else
      {

      }
      if (a4)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v37[0] = CFSTR("PFNonLocalizedFailureReason");
        v37[1] = CFSTR("PFRelatedObject");
        if (v9)
          v21 = (const __CFString *)v9;
        else
          v21 = CFSTR("nil");
        v38[0] = CFSTR("Invalid time rect");
        v38[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v18 = 0;
      goto LABEL_30;
    }
  }
  else
  {

  }
  if (a4)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v39[0] = CFSTR("PFNonLocalizedFailureReason");
    v39[1] = CFSTR("PFRelatedObject");
    if (v7)
      v16 = (const __CFString *)v7;
    else
      v16 = CFSTR("nil");
    v40[0] = CFSTR("Invalid screen size");
    v40[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18 = 0;
LABEL_22:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

BOOL __114__PFParallaxLayoutConfiguration_bestConfigurationForScreenSize_screenScale_startingWithConfiguration_orientation___block_invoke(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v11;
  double v12;
  double v13;
  double v14;

  if (a3 == *MEMORY[0x1E0C9D820] && a4 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    return 1;
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v13 = hypot(a1 - *MEMORY[0x1E0C9D538], a2 - v12);
  v14 = hypot(a3 - v11, a4 - v12);
  return vabdd_f64(v13, hypot(a5 - v11, a6 - v12)) < vabdd_f64(v13, v14);
}

@end
