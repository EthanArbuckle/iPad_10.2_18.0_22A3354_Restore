@implementation WFImageSymbolConfiguration

- (WFImageSymbolConfiguration)initWithPointSize:(double)a3 hierarchicalColors:(id)a4
{
  id v6;
  WFImageSymbolConfiguration *v7;
  WFImageSymbolConfiguration *v8;
  id platformSymbolConfiguration;
  uint64_t v10;
  NSArray *hierarchicalColors;
  WFImageSymbolConfiguration *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFImageSymbolConfiguration;
  v7 = -[WFImageSymbolConfiguration init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    platformSymbolConfiguration = v7->_platformSymbolConfiguration;
    v7->_representationType = 0;
    v7->_platformSymbolConfiguration = 0;

    v8->_pointSize = a3;
    v10 = objc_msgSend(v6, "copy");
    hierarchicalColors = v8->_hierarchicalColors;
    v8->_hierarchicalColors = (NSArray *)v10;

    v8->_weight = 0;
    v12 = v8;
  }

  return v8;
}

- (WFImageSymbolConfiguration)initWithPlatformSymbolConfiguration:(id)a3
{
  id v5;
  WFImageSymbolConfiguration *v6;
  WFImageSymbolConfiguration *v7;
  uint64_t v8;
  NSArray *hierarchicalColors;
  WFImageSymbolConfiguration *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFImageSymbolConfiguration;
  v6 = -[WFImageSymbolConfiguration init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_representationType = 1;
    objc_storeStrong(&v6->_platformSymbolConfiguration, a3);
    v7->_pointSize = 0.0;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    hierarchicalColors = v7->_hierarchicalColors;
    v7->_hierarchicalColors = (NSArray *)v8;

    v7->_weight = 0;
    v10 = v7;
  }

  return v7;
}

- (int64_t)platformWeight
{
  unint64_t v2;

  v2 = -[WFImageSymbolConfiguration weight](self, "weight");
  if (v2 - 1 > 7)
    return 4;
  else
    return qword_1AF780838[v2 - 1];
}

- (id)uiKitConfiguration
{
  void *v3;
  void *v4;
  Class UIImageSymbolConfigurationClass;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[WFImageSymbolConfiguration platformSymbolConfiguration](self, "platformSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFImageSymbolConfiguration platformSymbolConfiguration](self, "platformSymbolConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    UIImageSymbolConfigurationClass = getUIImageSymbolConfigurationClass();
    -[WFImageSymbolConfiguration pointSize](self, "pointSize");
    -[objc_class configurationWithPointSize:weight:](UIImageSymbolConfigurationClass, "configurationWithPointSize:weight:", -[WFImageSymbolConfiguration platformWeight](self, "platformWeight"), v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFImageSymbolConfiguration hierarchicalColors](self, "hierarchicalColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WFImageSymbolConfiguration platformHierarchicalColors](self, "platformHierarchicalColors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class _configurationWithHierarchicalColors:](getUIImageSymbolConfigurationClass(), "_configurationWithHierarchicalColors:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configurationByApplyingConfiguration:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WFImageSymbolConfiguration *v4;
  WFImageSymbolConfiguration *v5;
  WFImageSymbolConfiguration *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  double v13;
  double v14;
  double v15;

  v4 = (WFImageSymbolConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFImageSymbolConfiguration platformSymbolConfiguration](self, "platformSymbolConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7
        && (v8 = (void *)v7,
            -[WFImageSymbolConfiguration platformSymbolConfiguration](v6, "platformSymbolConfiguration"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9))
      {
        -[WFImageSymbolConfiguration platformSymbolConfiguration](self, "platformSymbolConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFImageSymbolConfiguration platformSymbolConfiguration](v6, "platformSymbolConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToConfiguration:", v11);

      }
      else
      {
        -[WFImageSymbolConfiguration pointSize](v6, "pointSize");
        v14 = v13;
        -[WFImageSymbolConfiguration pointSize](self, "pointSize");
        v12 = v14 == v15;
      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (id)platformHierarchicalColors
{
  void *v2;
  void *v3;

  -[WFImageSymbolConfiguration hierarchicalColors](self, "hierarchicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_4414);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFImageSymbolConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  WFImageSymbolConfiguration *v7;
  float v8;
  double v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("representationType"));
  if (!v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("pointSize"));
    v9 = v8;
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("hierarchicalColors"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFImageSymbolConfiguration initWithPointSize:hierarchicalColors:](self, "initWithPointSize:hierarchicalColors:", v6, v9);
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", getUIImageSymbolConfigurationClass(), CFSTR("platformSymbolConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFImageSymbolConfiguration initWithPlatformSymbolConfiguration:](self, "initWithPlatformSymbolConfiguration:", v6);
LABEL_5:
    self = v7;

  }
  self->_weight = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("weight"));

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[WFImageSymbolConfiguration representationType](self, "representationType"), CFSTR("representationType"));
  -[WFImageSymbolConfiguration platformSymbolConfiguration](self, "platformSymbolConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("platformSymbolConfiguration"));

  -[WFImageSymbolConfiguration pointSize](self, "pointSize");
  *(float *)&v5 = v5;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("pointSize"), v5);
  -[WFImageSymbolConfiguration hierarchicalColors](self, "hierarchicalColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("hierarchicalColors"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[WFImageSymbolConfiguration weight](self, "weight"), CFSTR("weight"));
}

- (double)pointSize
{
  return self->_pointSize;
}

- (NSArray)hierarchicalColors
{
  return self->_hierarchicalColors;
}

- (unint64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(unint64_t)a3
{
  self->_weight = a3;
}

- (unint64_t)representationType
{
  return self->_representationType;
}

- (id)platformSymbolConfiguration
{
  return self->_platformSymbolConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_platformSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_hierarchicalColors, 0);
}

uint64_t __56__WFImageSymbolConfiguration_platformHierarchicalColors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "platformColor");
}

+ (WFImageSymbolConfiguration)configurationWithPointSize:(double)a3
{
  return (WFImageSymbolConfiguration *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPointSize:hierarchicalColors:", 0, a3);
}

+ (WFImageSymbolConfiguration)configurationWithPointSize:(double)a3 hierarchicalColors:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPointSize:hierarchicalColors:", v6, a3);

  return (WFImageSymbolConfiguration *)v7;
}

+ (WFImageSymbolConfiguration)configurationWithUIImageSymbolConfiguration:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlatformSymbolConfiguration:", v4);

  return (WFImageSymbolConfiguration *)v5;
}

+ (WFImageSymbolConfiguration)configurationWithNSImageSymbolConfiguration:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlatformSymbolConfiguration:", v4);

  return (WFImageSymbolConfiguration *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
