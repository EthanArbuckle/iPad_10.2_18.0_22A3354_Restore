@implementation WBSNamedColorOption

- (WBSNamedColorOption)initWithColorName:(id)a3 red:(double)a4 green:(double)a5 blue:(double)a6 alpha:(double)a7 accessibilityName:(id)a8
{
  id v15;
  id v16;
  WBSNamedColorOption *v17;
  WBSNamedColorOption *v18;
  WBSNamedColorOption *v19;
  objc_super v21;

  v15 = a3;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)WBSNamedColorOption;
  v17 = -[WBSNamedColorOption init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_colorName, a3);
    v18->_redComponent = a4;
    v18->_greenComponent = a5;
    v18->_blueComponent = a6;
    v18->_alphaComponent = a7;
    objc_storeStrong((id *)&v18->_accessibilityName, a8);
    v19 = v18;
  }

  return v18;
}

+ (id)colorWithData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    if (!v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataRepresentation
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 0;
  if (!v6)
    v4 = v2;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *colorName;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  colorName = self->_colorName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", colorName, CFSTR("colorName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_redComponent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("redComponent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_greenComponent);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("greenComponent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_blueComponent);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("blueComponent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_alphaComponent);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("alphaComponent"));

}

- (WBSNamedColorOption)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  WBSNamedColorOption *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("greenComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blueComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alphaComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "floatValue");
  v11 = v10;
  objc_msgSend(v7, "floatValue");
  v13 = v12;
  objc_msgSend(v8, "floatValue");
  v15 = v14;
  objc_msgSend(v9, "floatValue");
  v17 = -[WBSNamedColorOption initWithColorName:red:green:blue:alpha:accessibilityName:](self, "initWithColorName:red:green:blue:alpha:accessibilityName:", v5, 0, v11, v13, v15, v16);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  WBSNamedColorOption *v4;
  WBSNamedColorOption *v5;
  NSString *colorName;
  void *v7;
  double redComponent;
  double v9;
  double greenComponent;
  double v11;
  double blueComponent;
  double v13;
  double alphaComponent;
  double v15;
  BOOL v16;

  v4 = (WBSNamedColorOption *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      colorName = self->_colorName;
      -[WBSNamedColorOption colorName](v5, "colorName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual(colorName, v7)
        && (redComponent = self->_redComponent,
            -[WBSNamedColorOption redComponent](v5, "redComponent"),
            redComponent == v9)
        && (greenComponent = self->_greenComponent,
            -[WBSNamedColorOption greenComponent](v5, "greenComponent"),
            greenComponent == v11)
        && (blueComponent = self->_blueComponent,
            -[WBSNamedColorOption blueComponent](v5, "blueComponent"),
            blueComponent == v13))
      {
        alphaComponent = self->_alphaComponent;
        -[WBSNamedColorOption alphaComponent](v5, "alphaComponent");
        v16 = alphaComponent == v15;
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_colorName, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_redComponent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_greenComponent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_blueComponent);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_alphaComponent);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isClearColor
{
  return -[NSString isEqualToString:](self->_colorName, "isEqualToString:", CFSTR("clear"));
}

- (NSString)colorName
{
  return self->_colorName;
}

- (double)redComponent
{
  return self->_redComponent;
}

- (double)greenComponent
{
  return self->_greenComponent;
}

- (double)blueComponent
{
  return self->_blueComponent;
}

- (double)alphaComponent
{
  return self->_alphaComponent;
}

- (NSString)accessibilityName
{
  return self->_accessibilityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityName, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

@end
