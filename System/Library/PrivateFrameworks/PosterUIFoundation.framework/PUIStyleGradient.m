@implementation PUIStyleGradient

- (PUIStyleGradient)initWithColors:(id)a3
{
  return -[PUIStyleGradient initWithColors:gradientType:locations:startPoint:endPoint:](self, "initWithColors:gradientType:locations:startPoint:endPoint:", a3, 0, &unk_25156AFC0, 0.5, 0.0, 0.5, 1.0);
}

- (PUIStyleGradient)initWithColors:(id)a3 gradientType:(unint64_t)a4 locations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  id v14;
  id v15;
  PUIStyleGradient *v16;
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
  v22.super_class = (Class)PUIStyleGradient;
  v16 = -[PUIStyleGradient init](&v22, sel_init);
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
  return -[PUIStyleGradient isEqual:ignoringVariation:](self, "isEqual:ignoringVariation:", a3, 1);
}

- (BOOL)isEqualToStyle:(id)a3
{
  return -[PUIStyleGradient isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", a3, 1);
}

- (BOOL)isEqual:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL8 v4;
  PUIStyleGradient *v6;
  BOOL v7;

  v4 = a4;
  v6 = (PUIStyleGradient *)a3;
  if (v6 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PUIStyleGradient isEqualToStyle:ignoringVariation:](self, "isEqualToStyle:ignoringVariation:", v6, v4);
  }

  return v7;
}

- (BOOL)isEqualToStyle:(id)a3 ignoringVariation:(BOOL)a4
{
  _BOOL4 v4;
  PUIStyleGradient *v6;
  PUIStyleGradient *v7;
  PUIStyleGradient *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  char v15;

  v4 = a4;
  v6 = (PUIStyleGradient *)a3;
  v7 = v6;
  if (v6 == self)
  {
    v15 = 1;
  }
  else if (v6 && _PUIStyleCompareUsingIdentifiers(self, v6, v4))
  {
    v8 = v7;
    -[PUIStyleGradient colors](self, "colors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleGradient colors](v8, "colors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToArray:", v10);

    if (v11
      && self->_gradientType == v8->_gradientType
      && (-[PUIStyleGradient locations](self, "locations"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          -[PUIStyleGradient locations](v8, "locations"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v12, "isEqualToArray:", v13),
          v13,
          v12,
          v14)
      && BSPointEqualToPoint())
    {
      v15 = BSPointEqualToPoint();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
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

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
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

  v18[6] = *MEMORY[0x24BDAC8D0];
  NSStringFromPUIStyleType(-[PUIStyleGradient type](self, "type"));
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
  -[PUIStyleGradient colors](self, "colors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_map:", &__block_literal_global_179);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("_"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSArray hash](self->_locations, "hash"));
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
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("-"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

uint64_t __41__PUIStyleGradient_nonVariatedIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

- (NSString)localizedName
{
  return 0;
}

- (NSArray)colors
{
  return (NSArray *)(id)-[NSArray copy](self->_colors, "copy");
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIStyleGradient)initWithCoder:(id)a3
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
  PUIStyleGradient *v16;

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

  v16 = -[PUIStyleGradient initWithColors:gradientType:locations:startPoint:endPoint:](self, "initWithColors:gradientType:locations:startPoint:endPoint:", v5, v6, v7, v9, v11, v13, v15);
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
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColors:gradientType:locations:startPoint:endPoint:", self->_colors, self->_gradientType, self->_locations, self->_startPoint.x, self->_startPoint.y, self->_endPoint.x, self->_endPoint.y);
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
