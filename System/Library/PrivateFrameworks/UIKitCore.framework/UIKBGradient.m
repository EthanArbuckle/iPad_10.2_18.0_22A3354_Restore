@implementation UIKBGradient

+ (id)gradientWithFlatColor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFlatColor:", v4);

  return v5;
}

- (UIKBGradient)initWithFlatColor:(id)a3
{
  id v5;
  UIKBGradient *v6;
  UIKBGradient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBGradient;
  v6 = -[UIKBGradient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_flatColorName, a3);
    v7->_opacity = 1.0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middleLocations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_endColorName, 0);
  objc_storeStrong((id *)&self->_startColorName, 0);
  objc_storeStrong((id *)&self->_flatColorName, 0);
  objc_storeStrong((id *)&self->_gradientName, 0);
}

- (BOOL)usesRGBColors
{
  if (!self->_didQueryRGBColors)
    CGGradientRelease(-[UIKBGradient CGGradient](self, "CGGradient"));
  return self->_usesRGBColors;
}

- (NSString)flatColorName
{
  NSString *startColorName;
  NSString *flatColorName;

  if (!self->_gradientName)
  {
    flatColorName = self->_flatColorName;
    if (!flatColorName)
    {
      startColorName = self->_startColorName;
      if (!startColorName)
        return startColorName;
      if (!self->_endColorName || !-[NSString isEqualToString:](startColorName, "isEqualToString:"))
        goto LABEL_2;
      flatColorName = self->_startColorName;
    }
    startColorName = flatColorName;
    return startColorName;
  }
LABEL_2:
  startColorName = 0;
  return startColorName;
}

- (CGGradient)CGGradient
{
  NSString *gradientName;
  CGGradient *v4;
  NSString *flatColorName;
  CGColor *CopyWithAlpha;
  double opacity;
  NSArray *colors;
  uint64_t v9;
  CGFloat *v10;
  unint64_t v11;
  void *v12;
  CGFloat v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  CGColorSpace *DeviceRGB;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  self->_didQueryRGBColors = 1;
  gradientName = self->_gradientName;
  if (gradientName)
  {
    self->_usesRGBColors = 1;
    v4 = (CGGradient *)UIKBGetNamedLinearGradient(gradientName);
    CGGradientRetain(v4);
    return v4;
  }
  flatColorName = self->_flatColorName;
  if (flatColorName)
  {
    CopyWithAlpha = (CGColor *)UIKBGetNamedColor(flatColorName);
    self->_usesRGBColors = UIKBColorUsesRGB((_BOOL8)CopyWithAlpha);
    opacity = self->_opacity;
    if (opacity == 1.0)
      CGColorRetain(CopyWithAlpha);
    else
      CopyWithAlpha = CGColorCreateCopyWithAlpha(CopyWithAlpha, opacity);
    v4 = UIKBCreateTwoColorLinearGradient((_BOOL8)CopyWithAlpha, (_BOOL8)CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
    return v4;
  }
  colors = self->_colors;
  if (colors)
  {
    v9 = -[NSArray count](colors, "count");
    if (v9 == -[NSArray count](self->_middleLocations, "count") + 2)
    {
      v10 = (CGFloat *)malloc_type_calloc(8uLL, -[NSArray count](self->_middleLocations, "count") + 2, 0x1BF39E55uLL);
      *v10 = 0.0;
      if (-[NSArray count](self->_middleLocations, "count"))
      {
        v11 = 0;
        do
        {
          -[NSArray objectAtIndex:](self->_middleLocations, "objectAtIndex:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          v10[v11 + 1] = v13;

          ++v11;
        }
        while (v11 < -[NSArray count](self->_middleLocations, "count"));
      }
      v10[-[NSArray count](self->_middleLocations, "count") + 1] = 1.0;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = self->_colors;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          v24 = UIKBGetNamedColor(*(void **)(*((_QWORD *)&v27 + 1) + 8 * i));
          v25 = v24;
          if (!self->_usesRGBColors)
            self->_usesRGBColors = UIKBColorUsesRGB((_BOOL8)v24);
          objc_msgSend(v18, "addObject:", v25, (_QWORD)v27);
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v21);
    }

    if (self->_usesRGBColors)
    {
      DeviceRGB = (CGColorSpace *)UIKBColorSpaceDeviceRGB_colorspace;
      if (!UIKBColorSpaceDeviceRGB_colorspace)
      {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        UIKBColorSpaceDeviceRGB_colorspace = (uint64_t)DeviceRGB;
      }
    }
    else
    {
      DeviceRGB = (CGColorSpace *)UIKBColorSpaceDeviceGray_colorspace;
      if (!UIKBColorSpaceDeviceGray_colorspace)
      {
        DeviceRGB = CGColorSpaceCreateDeviceGray();
        UIKBColorSpaceDeviceGray_colorspace = (uint64_t)DeviceRGB;
      }
    }
    v4 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v18, v10);
    if (v10)
      free(v10);

    return v4;
  }
  v14 = UIKBGetNamedColor(self->_startColorName);
  v15 = UIKBGetNamedColor(self->_endColorName);
  if (!self->_usesRGBColors)
  {
    v16 = UIKBColorUsesRGB((_BOOL8)v14);
    self->_usesRGBColors = v16;
    if (!v16)
      self->_usesRGBColors = UIKBColorUsesRGB((_BOOL8)v15);
  }
  return UIKBCreateTwoColorLinearGradient((_BOOL8)v14, (_BOOL8)v15);
}

+ (id)gradientWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:", v4);

  return v5;
}

+ (id)gradientWithStartColor:(id)a3 endColor:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartColor:endColor:", v7, v6);

  return v8;
}

+ (id)gradientWith3Colors:(id)a3 middleLocation:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWith3Colors:middleLocation:", v6, a4);

  return v7;
}

+ (id)gradientWithColors:(id)a3 middleLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColors:middleLocations:", v7, v6);

  return v8;
}

- (UIKBGradient)initWithName:(id)a3
{
  id v5;
  UIKBGradient *v6;
  UIKBGradient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBGradient;
  v6 = -[UIKBGradient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gradientName, a3);
    v7->_opacity = 1.0;
  }

  return v7;
}

- (UIKBGradient)initWithStartColor:(id)a3 endColor:(id)a4
{
  id v7;
  id v8;
  UIKBGradient *v9;
  UIKBGradient *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIKBGradient;
  v9 = -[UIKBGradient init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startColorName, a3);
    objc_storeStrong((id *)&v10->_endColorName, a4);
    v10->_opacity = 1.0;
  }

  return v10;
}

- (UIKBGradient)initWith3Colors:(id)a3 middleLocation:(double)a4
{
  id v7;
  UIKBGradient *v8;
  UIKBGradient *v9;
  void *v10;
  uint64_t v11;
  NSArray *middleLocations;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIKBGradient;
  v8 = -[UIKBGradient init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_colors, a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    middleLocations = v9->_middleLocations;
    v9->_middleLocations = (NSArray *)v11;

    v9->_opacity = 1.0;
  }

  return v9;
}

- (UIKBGradient)initWithColors:(id)a3 middleLocations:(id)a4
{
  id v7;
  id v8;
  UIKBGradient *v9;
  UIKBGradient *v10;
  uint64_t v11;
  NSArray *middleLocations;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIKBGradient;
  v9 = -[UIKBGradient init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_colors, a3);
    v11 = objc_msgSend(v8, "copy");
    middleLocations = v10->_middleLocations;
    v10->_middleLocations = (NSArray *)v11;

    v10->_opacity = 1.0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *endColorName;
  double v6;
  uint64_t v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v4 = v3;
  if (self->_horizontal)
    objc_msgSend(v3, "appendString:", CFSTR("; horizontal gradient"));
  if (self->_gradientName)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("; Named Gradient = %@"), self->_gradientName, v8);
  }
  else if (self->_flatColorName)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("; Flat Color Gradient = %@"), self->_flatColorName, v8);
  }
  else if (self->_startColorName && (endColorName = self->_endColorName) != 0)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("; 2-Color Gradient = %@ -> %@"), self->_startColorName, endColorName);
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("; 3-Color Gradient = %@, middleLocations = %@"),
      self->_colors,
      self->_middleLocations);
  }
  -[UIKBGradient opacity](self, "opacity");
  if (v6 != 1.0)
    objc_msgSend(v4, "appendFormat:", CFSTR("; opacity = %f"), *(_QWORD *)&self->_opacity);
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UIKBGradient *v4;
  NSString *gradientName;
  NSString *flatColorName;
  NSString *startColorName;
  NSString *endColorName;
  NSArray *colors;
  NSArray *middleLocations;
  BOOL v11;

  v4 = (UIKBGradient *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    v11 = (objc_opt_isKindOfClass() & 1) != 0
       && self->_horizontal == v4->_horizontal
       && (gradientName = self->_gradientName, (gradientName != 0) != (v4->_gradientName == 0))
       && (!gradientName || -[NSString isEqualToString:](gradientName, "isEqualToString:"))
       && (flatColorName = self->_flatColorName, (flatColorName != 0) != (v4->_flatColorName == 0))
       && (!flatColorName || -[NSString isEqualToString:](flatColorName, "isEqualToString:"))
       && (startColorName = self->_startColorName, (startColorName != 0) != (v4->_startColorName == 0))
       && (!startColorName || -[NSString isEqualToString:](startColorName, "isEqualToString:"))
       && (endColorName = self->_endColorName, (endColorName != 0) != (v4->_endColorName == 0))
       && (!endColorName || -[NSString isEqualToString:](endColorName, "isEqualToString:"))
       && (colors = self->_colors, (colors != 0) != (v4->_colors == 0))
       && (!colors || -[NSArray isEqualToArray:](colors, "isEqualToArray:"))
       && ((middleLocations = self->_middleLocations) == 0
        || -[NSArray isEqualToArray:](middleLocations, "isEqualToArray:", v4->_middleLocations))
       && self->_opacity == v4->_opacity;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBGradient *v4;

  v4 = -[UIKBGradient initWithStartColor:endColor:](+[UIKBGradient allocWithZone:](UIKBGradient, "allocWithZone:", a3), "initWithStartColor:endColor:", self->_startColorName, self->_endColorName);
  objc_storeStrong((id *)&v4->_gradientName, self->_gradientName);
  objc_storeStrong((id *)&v4->_flatColorName, self->_flatColorName);
  objc_storeStrong((id *)&v4->_colors, self->_colors);
  objc_storeStrong((id *)&v4->_middleLocations, self->_middleLocations);
  v4->_horizontal = self->_horizontal;
  v4->_opacity = self->_opacity;
  return v4;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (BOOL)horizontal
{
  return self->_horizontal;
}

- (void)setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

@end
