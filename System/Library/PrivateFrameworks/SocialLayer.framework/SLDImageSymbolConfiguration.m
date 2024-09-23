@implementation SLDImageSymbolConfiguration

+ (id)configurationWithName:(id)a3 coreUISize:(int64_t)a4 weight:(int64_t)a5 pointSize:(double)a6
{
  id v9;
  SLDImageSymbolConfiguration *v10;

  v9 = a3;
  v10 = -[SLDImageSymbolConfiguration initWithName:coreUISize:weight:pointSize:]([SLDImageSymbolConfiguration alloc], "initWithName:coreUISize:weight:pointSize:", v9, a4, a5, a6);

  return v10;
}

- (SLDImageSymbolConfiguration)init
{
  SLDImageSymbolConfiguration *v2;
  SLDImageSymbolConfiguration *v3;
  NSString *name;
  uint64_t v5;
  NSNumber *pointSizeNumber;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SLDImageSymbolConfiguration;
  v2 = -[SLDImageSymbolConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)CFSTR("exclamationmark.circle");

    *(_OWORD *)&v3->_coreUISize = xmmword_199FA7800;
    v3->_pointSize = 20.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 20.0);
    v5 = objc_claimAutoreleasedReturnValue();
    pointSizeNumber = v3->_pointSizeNumber;
    v3->_pointSizeNumber = (NSNumber *)v5;

  }
  return v3;
}

- (SLDImageSymbolConfiguration)initWithName:(id)a3 coreUISize:(int64_t)a4 weight:(int64_t)a5 pointSize:(double)a6
{
  id v11;
  SLDImageSymbolConfiguration *v12;
  SLDImageSymbolConfiguration *v13;
  uint64_t v14;
  NSNumber *pointSizeNumber;
  objc_super v17;

  v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SLDImageSymbolConfiguration;
  v12 = -[SLDImageSymbolConfiguration init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_coreUISize = a4;
    v13->_weight = a5;
    v13->_pointSize = a6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v14 = objc_claimAutoreleasedReturnValue();
    pointSizeNumber = v13->_pointSizeNumber;
    v13->_pointSizeNumber = (NSNumber *)v14;

  }
  return v13;
}

- (CGSize)minViableSizeWithStyle:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v4 = a3;
  v5 = -[SLDImageSymbolConfiguration coreUISize](self, "coreUISize");
  v6 = -[SLDImageSymbolConfiguration weight](self, "weight");
  -[SLDImageSymbolConfiguration pointSize](self, "pointSize");
  v7 = 10.0;
  if (v8 > 0.0)
  {
    -[SLDImageSymbolConfiguration pointSize](self, "pointSize");
    v7 = v9;
  }
  if (!v6)
    v6 = 4;
  -[SLDImageSymbolConfiguration name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SLDSystemVectorGlyphWithSlotStyle(v4, v10, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = objc_msgSend(v4, "displayScale");
  v12 = SLDVectorGlyphMinimumViableSize(v11, (double)v10);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)minViableSizeWithDisplayScale:(double)a3 RTL:(BOOL)a4 darkMode:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v5 = a5;
  v6 = a4;
  v9 = -[SLDImageSymbolConfiguration coreUISize](self, "coreUISize");
  v10 = -[SLDImageSymbolConfiguration weight](self, "weight");
  -[SLDImageSymbolConfiguration pointSize](self, "pointSize");
  v11 = 10.0;
  if (v12 > 0.0)
  {
    -[SLDImageSymbolConfiguration pointSize](self, "pointSize");
    v11 = v13;
  }
  if (!v10)
    v10 = 4;
  -[SLDImageSymbolConfiguration name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SLDSystemVectorGlyph(v14, v6, v9, v10, v5, a3, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = SLDVectorGlyphMinimumViableSize(v15, a3);
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SLDImageSymbolConfiguration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("symbolName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SLDImageSymbolConfiguration coreUISize](self, "coreUISize"), CFSTR("coreUISize"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SLDImageSymbolConfiguration weight](self, "weight"), CFSTR("weight"));
  -[SLDImageSymbolConfiguration pointSize](self, "pointSize");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ptSize"));
  -[SLDImageSymbolConfiguration pointSizeNumber](self, "pointSizeNumber");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ptSizeNumber"));

}

- (SLDImageSymbolConfiguration)initWithCoder:(id)a3
{
  id v4;
  SLDImageSymbolConfiguration *v5;
  uint64_t v6;
  NSString *name;
  double v8;
  uint64_t v9;
  NSNumber *pointSizeNumber;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLDImageSymbolConfiguration;
  v5 = -[SLDImageSymbolConfiguration init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_coreUISize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("coreUISize"));
    v5->_weight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("weight"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ptSize"));
    v5->_pointSize = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ptSizeNumber"));
    v9 = objc_claimAutoreleasedReturnValue();
    pointSizeNumber = v5->_pointSizeNumber;
    v5->_pointSizeNumber = (NSNumber *)v9;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  SLDImageSymbolConfiguration *v6;
  SLDImageSymbolConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (SLDImageSymbolConfiguration *)v5;
    v7 = v6;
    if (v6 == self)
    {
      v12 = 1;
    }
    else
    {
      -[SLDImageSymbolConfiguration name](v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        || (-[SLDImageSymbolConfiguration name](self, "name"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SLDImageSymbolConfiguration name](v7, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLDImageSymbolConfiguration name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v8)
        {

          if (!v11)
            goto LABEL_15;
        }
        else
        {

          if ((v11 & 1) == 0)
          {
LABEL_15:
            v12 = 0;
            goto LABEL_16;
          }
        }
      }
      v13 = -[SLDImageSymbolConfiguration coreUISize](v7, "coreUISize");
      if (v13 != -[SLDImageSymbolConfiguration coreUISize](self, "coreUISize"))
        goto LABEL_15;
      v14 = -[SLDImageSymbolConfiguration weight](v7, "weight");
      if (v14 != -[SLDImageSymbolConfiguration weight](self, "weight"))
        goto LABEL_15;
      -[SLDImageSymbolConfiguration pointSize](v7, "pointSize");
      v16 = v15;
      -[SLDImageSymbolConfiguration pointSize](self, "pointSize");
      if (v16 != v17)
        goto LABEL_15;
      -[SLDImageSymbolConfiguration pointSizeNumber](v7, "pointSizeNumber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDImageSymbolConfiguration pointSizeNumber](self, "pointSizeNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v18, "isEqualToNumber:", v19);

    }
LABEL_16:

    goto LABEL_17;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[SLDImageSymbolConfiguration coreUISize](self, "coreUISize");
  -[SLDImageSymbolConfiguration name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[SLDImageSymbolConfiguration weight](self, "weight");
  -[SLDImageSymbolConfiguration pointSizeNumber](self, "pointSizeNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SLDImageSymbolConfiguration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(v4, "setCoreUISize:", -[SLDImageSymbolConfiguration coreUISize](self, "coreUISize"));
  objc_msgSend(v4, "setWeight:", -[SLDImageSymbolConfiguration weight](self, "weight"));
  -[SLDImageSymbolConfiguration pointSize](self, "pointSize");
  objc_msgSend(v4, "setPointSize:");
  -[SLDImageSymbolConfiguration pointSizeNumber](self, "pointSizeNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPointSizeNumber:", v6);

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)coreUISize
{
  return self->_coreUISize;
}

- (void)setCoreUISize:(int64_t)a3
{
  self->_coreUISize = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (NSNumber)pointSizeNumber
{
  return self->_pointSizeNumber;
}

- (void)setPointSizeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_pointSizeNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointSizeNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
