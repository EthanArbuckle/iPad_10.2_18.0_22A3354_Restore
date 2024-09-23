@implementation WFAQIScale

- (BOOL)isEqual:(id)a3
{
  WFAQIScale *v4;
  BOOL v5;

  v4 = (WFAQIScale *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[WFAQIScale isEqualToScale:](self, "isEqualToScale:", v4);
  }

  return v5;
}

- (BOOL)isEqualToScale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = objc_msgSend(v4, "isNumerical"), v7 == -[WFAQIScale isNumerical](self, "isNumerical"))
    && (v8 = objc_msgSend(v4, "isAscending"), v8 == -[WFAQIScale isAscending](self, "isAscending")))
  {
    v11 = objc_msgSend(v4, "range");
    v13 = v12;
    v9 = 0;
    if (v11 == -[WFAQIScale range](self, "range") && v13 == v14)
    {
      objc_msgSend(v4, "categories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAQIScale categories](self, "categories");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToArray:", v16))
      {
        objc_msgSend(v4, "gradient");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAQIScale gradient](self, "gradient");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v17, "isEqual:", v18);

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFAQIScale *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(WFAQIScale);
  -[WFAQIScale identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale setIdentifier:](v4, "setIdentifier:", v5);

  -[WFAQIScale displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale setDisplayName:](v4, "setDisplayName:", v6);

  -[WFAQIScale displayLabel](self, "displayLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale setDisplayLabel:](v4, "setDisplayLabel:", v7);

  -[WFAQIScale setNumerical:](v4, "setNumerical:", -[WFAQIScale isNumerical](self, "isNumerical"));
  -[WFAQIScale setAscending:](v4, "setAscending:", -[WFAQIScale isAscending](self, "isAscending"));
  v8 = -[WFAQIScale range](self, "range");
  -[WFAQIScale setRange:](v4, "setRange:", v8, v9);
  -[WFAQIScale categories](self, "categories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale setCategories:](v4, "setCategories:", v10);

  -[WFAQIScale gradient](self, "gradient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale setGradient:](v4, "setGradient:", v11);

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
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFAQIScale identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFAQIScaleIdentifierKey"));

  -[WFAQIScale displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WFAQIScaleDisplayNameKey"));

  -[WFAQIScale displayLabel](self, "displayLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WFAQIScaleDisplayLabelKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAQIScale isNumerical](self, "isNumerical"), CFSTR("WFAQIScaleNumericalKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFAQIScale isAscending](self, "isAscending"), CFSTR("WFAQIScaleAscendingKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAQIScale range](self, "range"), CFSTR("WFAQIScaleRangeLocationKey"));
  -[WFAQIScale range](self, "range");
  objc_msgSend(v4, "encodeInteger:forKey:", v8, CFSTR("WFAQIScaleRangeLengthKey"));
  -[WFAQIScale categories](self, "categories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WFAQIScaleCategoriesKey"));

  -[WFAQIScale gradient](self, "gradient");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("WFAQIScaleGradientKey"));

}

- (WFAQIScale)initWithCoder:(id)a3
{
  id v4;
  WFAQIScale *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFAQIScale;
  v5 = -[WFAQIScale init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAQIScaleIdentifierKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScale setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAQIScaleDisplayNameKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScale setDisplayName:](v5, "setDisplayName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAQIScaleDisplayLabelKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScale setDisplayLabel:](v5, "setDisplayLabel:", v8);

    -[WFAQIScale setNumerical:](v5, "setNumerical:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WFAQIScaleNumericalKey")));
    -[WFAQIScale setAscending:](v5, "setAscending:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WFAQIScaleAscendingKey")));
    -[WFAQIScale setRange:](v5, "setRange:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFAQIScaleRangeLocationKey")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFAQIScaleRangeLengthKey")));
    if (initWithCoder__onceToken_1 != -1)
      dispatch_once(&initWithCoder__onceToken_1, &__block_literal_global_16);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__categoryClasses, CFSTR("WFAQIScaleCategoriesKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScale setCategories:](v5, "setCategories:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAQIScaleGradientKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScale setGradient:](v5, "setGradient:", v10);

  }
  return v5;
}

void __28__WFAQIScale_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__categoryClasses;
  initWithCoder__categoryClasses = v2;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFAQIScale identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale displayLabel](self, "displayLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFAQIScale isNumerical](self, "isNumerical");
  v8 = -[WFAQIScale isAscending](self, "isAscending");
  -[WFAQIScale categories](self, "categories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WFAQIScale identifier: %@, displayName: %@, displayLabel: %@, isNumerical: %d, isAscending: %d, categories: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFAQIScale identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale displayLabel](self, "displayLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFAQIScale isNumerical](self, "isNumerical");
  v8 = -[WFAQIScale isAscending](self, "isAscending");
  v9 = -[WFAQIScale range](self, "range");
  -[WFAQIScale range](self, "range");
  v11 = v10;
  -[WFAQIScale categories](self, "categories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScale gradient](self, "gradient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WFAQIScale identifier: %@, displayName: %@, displayLabel: %@, isNumerical: %d, isAscending: %d, rangeLocation: %lu, rangeLength: %lu, categories: %@, gradient: %@"), v4, v5, v6, v7, v8, v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void)setDisplayLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isNumerical
{
  return self->_numerical;
}

- (void)setNumerical:(BOOL)a3
{
  self->_numerical = a3;
}

- (BOOL)isAscending
{
  return self->_ascending;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (WFAQIScaleGradient)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
