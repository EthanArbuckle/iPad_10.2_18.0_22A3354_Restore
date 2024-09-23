@implementation WFAQIScaleCategory

- (WFAQIScaleCategory)initWithCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4
{
  id v6;
  WFAQIScaleCategory *v7;
  WFAQIScaleCategory *v8;
  uint64_t v9;
  NSString *localizedCategoryDescription;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFAQIScaleCategory;
  v7 = -[WFAQIScaleCategory init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_categoryIndex = a3;
    v9 = objc_msgSend(v6, "copy");
    localizedCategoryDescription = v8->_localizedCategoryDescription;
    v8->_localizedCategoryDescription = (NSString *)v9;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WFAQIScaleCategory *v4;
  BOOL v5;

  v4 = (WFAQIScaleCategory *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[WFAQIScaleCategory isEqualToScaleCategory:](self, "isEqualToScaleCategory:", v4);
  }

  return v5;
}

- (BOOL)isEqualToScaleCategory:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "categoryIndex");
  if (v5 == -[WFAQIScaleCategory categoryIndex](self, "categoryIndex"))
  {
    objc_msgSend(v4, "categoryName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScaleCategory categoryName](self, "categoryName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v4, "color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAQIScaleCategory color](self, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        v10 = objc_msgSend(v4, "range");
        v12 = v11;
        v15 = v10 == -[WFAQIScaleCategory range](self, "range") && v12 == v13;
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

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFAQIScaleCategory *v4;
  unint64_t v5;
  void *v6;
  WFAQIScaleCategory *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = [WFAQIScaleCategory alloc];
  v5 = -[WFAQIScaleCategory categoryIndex](self, "categoryIndex");
  -[WFAQIScaleCategory localizedCategoryDescription](self, "localizedCategoryDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFAQIScaleCategory initWithCategoryIndex:localizedCategoryDescription:](v4, "initWithCategoryIndex:localizedCategoryDescription:", v5, v6);

  -[WFAQIScaleCategory categoryName](self, "categoryName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory setCategoryName:](v7, "setCategoryName:", v8);

  -[WFAQIScaleCategory color](self, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory setColor:](v7, "setColor:", v9);

  -[WFAQIScaleCategory glyph](self, "glyph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory setGlyph:](v7, "setGlyph:", v10);

  -[WFAQIScaleCategory recommendation](self, "recommendation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory setRecommendation:](v7, "setRecommendation:", v11);

  -[WFAQIScaleCategory setCategoryNumber:](v7, "setCategoryNumber:", -[WFAQIScaleCategory categoryNumber](self, "categoryNumber"));
  v12 = -[WFAQIScaleCategory range](self, "range");
  -[WFAQIScaleCategory setRange:](v7, "setRange:", v12, v13);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAQIScaleCategory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFAQIScaleCategory *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  NSStringFromSelector(sel_categoryIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  v7 = objc_opt_class();
  NSStringFromSelector(sel_localizedCategoryDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WFAQIScaleCategory initWithCategoryIndex:localizedCategoryDescription:](self, "initWithCategoryIndex:localizedCategoryDescription:", v6, v9);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAQIScaleCategoryNameKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory setCategoryName:](v10, "setCategoryName:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAQIScaleCategoryColorKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory setColor:](v10, "setColor:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAQIScaleCategoryGlyphKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory setGlyph:](v10, "setGlyph:", v13);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAQIScaleCategoryRecommendationKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory setRecommendation:](v10, "setRecommendation:", v14);

  -[WFAQIScaleCategory setCategoryNumber:](v10, "setCategoryNumber:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFAQIScaleCategoryNumberKey")));
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFAQIScaleCategoryRangeLocationKey"));
  v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFAQIScaleCategoryRangeLengthKey"));

  -[WFAQIScaleCategory setRange:](v10, "setRange:", v15, v16);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v4 = -[WFAQIScaleCategory categoryIndex](self, "categoryIndex");
  NSStringFromSelector(sel_categoryIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeInteger:forKey:", v4, v5);

  -[WFAQIScaleCategory localizedCategoryDescription](self, "localizedCategoryDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedCategoryDescription);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, v7);

  -[WFAQIScaleCategory categoryName](self, "categoryName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("WFAQIScaleCategoryNameKey"));

  -[WFAQIScaleCategory color](self, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("WFAQIScaleCategoryColorKey"));

  -[WFAQIScaleCategory glyph](self, "glyph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("WFAQIScaleCategoryGlyphKey"));

  -[WFAQIScaleCategory recommendation](self, "recommendation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("WFAQIScaleCategoryRecommendationKey"));

  objc_msgSend(v13, "encodeInteger:forKey:", -[WFAQIScaleCategory categoryNumber](self, "categoryNumber"), CFSTR("WFAQIScaleCategoryNumberKey"));
  objc_msgSend(v13, "encodeInteger:forKey:", -[WFAQIScaleCategory range](self, "range"), CFSTR("WFAQIScaleCategoryRangeLocationKey"));
  -[WFAQIScaleCategory range](self, "range");
  objc_msgSend(v13, "encodeInteger:forKey:", v12, CFSTR("WFAQIScaleCategoryRangeLengthKey"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFAQIScaleCategory categoryName](self, "categoryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory glyph](self, "glyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory recommendation](self, "recommendation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WFAQIScaleCategory categoryName: %@, color: %@, glyph: %@, recommendation: %@, categoryNumber: %lu"), v4, v5, v6, v7, -[WFAQIScaleCategory categoryNumber](self, "categoryNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFAQIScaleCategory categoryName](self, "categoryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory color](self, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory glyph](self, "glyph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCategory recommendation](self, "recommendation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFAQIScaleCategory categoryNumber](self, "categoryNumber");
  v9 = -[WFAQIScaleCategory range](self, "range");
  -[WFAQIScaleCategory range](self, "range");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WFAQIScaleCategory categoryName: %@, color: %@, glyph: %@, recommendation: %@, categoryNumber: %lu, rangeLocation: %lu, rangeLength: %lu"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)recommendation
{
  return self->_recommendation;
}

- (void)setRecommendation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)categoryNumber
{
  return self->_categoryNumber;
}

- (void)setCategoryNumber:(unint64_t)a3
{
  self->_categoryNumber = a3;
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

- (unint64_t)categoryIndex
{
  return self->_categoryIndex;
}

- (void)setCategoryIndex:(unint64_t)a3
{
  self->_categoryIndex = a3;
}

- (NSString)localizedCategoryDescription
{
  return self->_localizedCategoryDescription;
}

- (void)setLocalizedCategoryDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryDescription, 0);
  objc_storeStrong((id *)&self->_recommendation, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end
