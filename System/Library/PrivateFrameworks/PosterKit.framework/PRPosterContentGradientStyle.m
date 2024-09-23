@implementation PRPosterContentGradientStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterContentGradientStyle)initWithColors:(id)a3
{
  return -[PRPosterContentGradientStyle initWithColors:gradientType:locations:startPoint:endPoint:](self, "initWithColors:gradientType:locations:startPoint:endPoint:", a3, 0, &unk_1E21DD0F8, 0.5, 0.0, 0.5, 1.0);
}

- (PRPosterContentGradientStyle)initWithColors:(id)a3 gradientType:(unint64_t)a4 locations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  id v14;
  id v15;
  PRPosterContentGradientStyle *v16;
  uint64_t v17;
  NSArray *colors;
  uint64_t v19;
  NSArray *locations;
  objc_super v22;

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  v14 = a3;
  v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PRPosterContentGradientStyle;
  v16 = -[PRPosterContentGradientStyle init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    colors = v16->_colors;
    v16->_colors = (NSArray *)v17;

    v16->_gradientType = a4;
    v19 = objc_msgSend(v15, "copy");
    locations = v16->_locations;
    v16->_locations = (NSArray *)v19;

    v16->_startPoint.x = v10;
    v16->_startPoint.y = v9;
    v16->_endPoint.x = x;
    v16->_endPoint.y = y;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterContentGradientStyle *v4;
  PRPosterContentGradientStyle *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  char v12;

  v4 = (PRPosterContentGradientStyle *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PRPosterContentGradientStyle colors](self, "colors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterContentGradientStyle colors](v5, "colors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToArray:", v7);

      if (v8
        && self->_gradientType == v5->_gradientType
        && (-[PRPosterContentGradientStyle locations](self, "locations"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[PRPosterContentGradientStyle locations](v5, "locations"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqualToArray:", v10),
            v10,
            v9,
            v11)
        && BSPointEqualToPoint())
      {
        v12 = BSPointEqualToPoint();
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_colors);
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_gradientType);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_locations);
  v7 = (id)objc_msgSend(v3, "appendCGPoint:", self->_startPoint.x, self->_startPoint.y);
  v8 = (id)objc_msgSend(v3, "appendCGPoint:", self->_endPoint.x, self->_endPoint.y);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (NSString)nonVariatedIdentifier
{
  void *v3;
  unint64_t gradientType;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  _PRPosterContentStyleStringForType(-[PRPosterContentGradientStyle type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  gradientType = self->_gradientType;
  v5 = CFSTR("A");
  if (gradientType == 1)
    v5 = CFSTR("R");
  if (gradientType == 2)
    v6 = CFSTR("C");
  else
    v6 = (__CFString *)v5;
  v7 = v6;
  -[PRPosterContentGradientStyle colors](self, "colors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_map:", &__block_literal_global_182);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("_"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray hash](self->_locations, "hash"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromCGPoint(self->_startPoint);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_endPoint);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v18[1] = v7;
  v18[2] = v10;
  v18[3] = v12;
  v18[4] = v13;
  v18[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("-"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

uint64_t __53__PRPosterContentGradientStyle_nonVariatedIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  return (NSArray *)(id)-[NSArray copy](self->_colors, "copy");
}

- (void)applyStyleWithRenderer:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "renderGradientStyle:", self);

}

- (BOOL)allowsVariation
{
  return 0;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)isSupportedSystemStyle
{
  return 0;
}

- (BOOL)isSupportedBackgroundStyle
{
  return 1;
}

- (BOOL)desiresVibrancyEffectView
{
  return 0;
}

- (int64_t)vibrancyEffectType
{
  return 1;
}

- (UIColor)vibrancyEffectColor
{
  return (UIColor *)-[NSArray firstObject](self->_colors, "firstObject");
}

- (NSString)lutIdentifier
{
  return 0;
}

- (PRPosterContentGradientStyle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  PRPosterContentGradientStyle *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("colors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("gradientType"));
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("locations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("startPoint"));
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("endPoint"));
  v13 = v12;
  v15 = v14;

  v16 = -[PRPosterContentGradientStyle initWithColors:gradientType:locations:startPoint:endPoint:](self, "initWithColors:gradientType:locations:startPoint:endPoint:", v5, v6, v7, v9, v11, v13, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *colors;
  id v5;

  colors = self->_colors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", colors, CFSTR("colors"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_gradientType, CFSTR("gradientType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locations, CFSTR("locations"));
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("startPoint"), self->_startPoint.x, self->_startPoint.y);
  objc_msgSend(v5, "encodeCGPoint:forKey:", CFSTR("endPoint"), self->_endPoint.x, self->_endPoint.y);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PRPosterContentGradientStyle initWithColors:gradientType:locations:startPoint:endPoint:]([PRPosterContentGradientStyle alloc], "initWithColors:gradientType:locations:startPoint:endPoint:", self->_colors, self->_gradientType, self->_locations, self->_startPoint.x, self->_startPoint.y, self->_endPoint.x, self->_endPoint.y);
}

- (CGPoint)startPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_endPoint.x;
  y = self->_endPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSArray)locations
{
  return self->_locations;
}

- (unint64_t)gradientType
{
  return self->_gradientType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
