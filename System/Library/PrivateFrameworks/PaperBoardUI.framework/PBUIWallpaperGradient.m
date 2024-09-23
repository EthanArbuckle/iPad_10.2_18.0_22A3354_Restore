@implementation PBUIWallpaperGradient

- (PBUIWallpaperGradient)init
{
  PBUIWallpaperGradient *v2;
  PBUIWallpaperGradient *v3;
  uint64_t v4;
  NSString *type;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBUIWallpaperGradient;
  v2 = -[PBUIWallpaperGradient init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_startPoint = (CGPoint)xmmword_1B723FA30;
    v2->_endPoint = (CGPoint)xmmword_1B723FA40;
    v4 = objc_msgSend((id)*MEMORY[0x1E0CD2F48], "copy");
    type = v3->_type;
    v3->_type = (NSString *)v4;

  }
  return v3;
}

- (id)cgColors
{
  void *v3;
  void *v4;
  const __CFAllocator *v5;
  CFIndex v6;
  __CFArray *Mutable;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PBUIWallpaperGradient colors](self, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = objc_msgSend(v3, "count");
    Mutable = CFArrayCreateMutable(v5, v6, MEMORY[0x1E0C9B378]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PBUIWallpaperGradient colors](self, "colors", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          CFArrayAppendValue(Mutable, (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i)), "CGColor"));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (void)configureLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PBUIWallpaperGradient cgColors](self, "cgColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColors:", v5);

  -[PBUIWallpaperGradient locations](self, "locations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocations:", v6);

  -[PBUIWallpaperGradient startPoint](self, "startPoint");
  objc_msgSend(v4, "setStartPoint:");
  -[PBUIWallpaperGradient endPoint](self, "endPoint");
  objc_msgSend(v4, "setEndPoint:");
  -[PBUIWallpaperGradient type](self, "type");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", v7);

}

- (CGGradient)copyCGGradient
{
  void *v3;
  size_t v4;
  CGFloat *v5;
  CGFloat *v6;
  const __CFArray *v7;
  CGGradient *v8;
  _QWORD v10[5];

  -[PBUIWallpaperGradient locations](self, "locations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = (CGFloat *)malloc_type_calloc(v4, 8uLL, 0x100004000313F17uLL);
    v6 = v5;
    if (v5)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __39__PBUIWallpaperGradient_copyCGGradient__block_invoke;
      v10[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
      v10[4] = v5;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
    }
  }
  else
  {
    v6 = 0;
  }
  -[PBUIWallpaperGradient cgColors](self, "cgColors");
  v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v8 = CGGradientCreateWithColors(0, v7, v6);

  free(v6);
  return v8;
}

uint64_t __39__PBUIWallpaperGradient_copyCGGradient__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(a2, "doubleValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a3) = v6;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PBUIWallpaperGradient *v4;
  void *v5;
  char isKindOfClass;
  PBUIWallpaperGradient *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  char v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;

  v4 = (PBUIWallpaperGradient *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PBUIWallpaperGradient colors](self, "colors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperGradient colors](v7, "colors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10
        && (-[PBUIWallpaperGradient locations](self, "locations"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            -[PBUIWallpaperGradient locations](v7, "locations"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = BSEqualObjects(),
            v12,
            v11,
            v13))
      {
        -[PBUIWallpaperGradient startPoint](self, "startPoint");
        v15 = v14;
        v17 = v16;
        -[PBUIWallpaperGradient startPoint](v7, "startPoint");
        v19 = 0;
        if (v15 == v20 && v17 == v18)
        {
          -[PBUIWallpaperGradient endPoint](self, "endPoint");
          v22 = v21;
          v24 = v23;
          -[PBUIWallpaperGradient endPoint](v7, "endPoint");
          v19 = 0;
          if (v22 == v26 && v24 == v25)
          {
            -[PBUIWallpaperGradient type](self, "type");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBUIWallpaperGradient type](v7, "type");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = BSEqualObjects();

          }
        }
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PBUIWallpaperGradient colors](self, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PBUIWallpaperGradient locations](self, "locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;
  -[PBUIWallpaperGradient type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)-[PBUIWallpaperGradient descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PBUIWallpaperGradient colors](self, "colors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColors:", v5);

  -[PBUIWallpaperGradient locations](self, "locations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocations:", v6);

  -[PBUIWallpaperGradient startPoint](self, "startPoint");
  objc_msgSend(v4, "setStartPoint:");
  -[PBUIWallpaperGradient endPoint](self, "endPoint");
  objc_msgSend(v4, "setEndPoint:");
  -[PBUIWallpaperGradient type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PBUIWallpaperGradient colors](self, "colors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("colors"));

  -[PBUIWallpaperGradient locations](self, "locations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("locations"));

  -[PBUIWallpaperGradient startPoint](self, "startPoint");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("startPoint"));
  -[PBUIWallpaperGradient endPoint](self, "endPoint");
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("endPoint"));
  -[PBUIWallpaperGradient type](self, "type");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("type"));

}

- (PBUIWallpaperGradient)initWithCoder:(id)a3
{
  id v4;
  PBUIWallpaperGradient *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *colors;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *locations;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  uint64_t v23;
  NSString *type;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PBUIWallpaperGradient;
  v5 = -[PBUIWallpaperGradient init](&v26, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("colors"));
    v10 = objc_claimAutoreleasedReturnValue();
    colors = v5->_colors;
    v5->_colors = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObjects:", v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("locations"));
    v16 = objc_claimAutoreleasedReturnValue();
    locations = v5->_locations;
    v5->_locations = (NSArray *)v16;

    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("startPoint"));
    v5->_startPoint.x = v18;
    v5->_startPoint.y = v19;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("endPoint"));
    v5->_endPoint.x = v20;
    v5->_endPoint.y = v21;
    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, CFSTR("type"));
    v23 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v23;

  }
  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperGradient descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperGradient colors](self, "colors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("colors"));

  -[PBUIWallpaperGradient locations](self, "locations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("locations"));

  -[PBUIWallpaperGradient startPoint](self, "startPoint");
  v9 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("startPoint"));
  -[PBUIWallpaperGradient endPoint](self, "endPoint");
  v10 = (id)objc_msgSend(v4, "appendPoint:withName:", CFSTR("endPoint"));
  -[PBUIWallpaperGradient type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("type"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIWallpaperGradient succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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

- (void)setStartPoint:(CGPoint)a3
{
  self->_startPoint = a3;
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

- (void)setEndPoint:(CGPoint)a3
{
  self->_endPoint = a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
