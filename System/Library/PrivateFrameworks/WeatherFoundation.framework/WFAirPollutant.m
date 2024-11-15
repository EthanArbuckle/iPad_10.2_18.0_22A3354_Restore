@implementation WFAirPollutant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAirPollutant)initWithCoder:(id)a3
{
  id v4;
  WFAirPollutant *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *localizedName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *localizedDescription;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSString *unit;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSString *localizedCategoryDescription;
  void *v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFAirPollutant;
  v5 = -[WFAirPollutant init](&v27, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_localizedName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_localizedDescription);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v12;

    NSStringFromSelector(sel_amount);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v14);
    v5->_amount = v15;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_unit);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    unit = v5->_unit;
    v5->_unit = (NSString *)v18;

    v20 = objc_opt_class();
    NSStringFromSelector(sel_localizedCategoryDescription);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    localizedCategoryDescription = v5->_localizedCategoryDescription;
    v5->_localizedCategoryDescription = (NSString *)v22;

    NSStringFromSelector(sel_categoryIndex);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_categoryIndex = objc_msgSend(v4, "decodeIntegerForKey:", v24);

    NSStringFromSelector(sel_index);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_index = objc_msgSend(v4, "decodeIntegerForKey:", v25);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  id v19;

  v4 = a3;
  -[WFAirPollutant localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[WFAirPollutant localizedDescription](self, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[WFAirPollutant amount](self, "amount");
  v10 = v9;
  NSStringFromSelector(sel_amount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v11, v10);

  -[WFAirPollutant unit](self, "unit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_unit);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v13);

  -[WFAirPollutant localizedCategoryDescription](self, "localizedCategoryDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedCategoryDescription);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, v15);

  v16 = -[WFAirPollutant categoryIndex](self, "categoryIndex");
  NSStringFromSelector(sel_categoryIndex);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v16, v17);

  v18 = -[WFAirPollutant index](self, "index");
  NSStringFromSelector(sel_index);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v18, v19);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  if (v4)
  {
    -[WFAirPollutant localizedName](self, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocalizedName:", v5);

    -[WFAirPollutant localizedDescription](self, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocalizedDescription:", v6);

    -[WFAirPollutant amount](self, "amount");
    objc_msgSend(v4, "setAmount:");
    -[WFAirPollutant unit](self, "unit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUnit:", v7);

    -[WFAirPollutant localizedCategoryDescription](self, "localizedCategoryDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocalizedCategoryDescription:", v8);

    objc_msgSend(v4, "setCategoryIndex:", -[WFAirPollutant categoryIndex](self, "categoryIndex"));
    objc_msgSend(v4, "setIndex:", -[WFAirPollutant index](self, "index"));
  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFAirPollutant localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirPollutant localizedDescription](self, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirPollutant amount](self, "amount");
  v7 = v6;
  -[WFAirPollutant unit](self, "unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirPollutant localizedCategoryDescription](self, "localizedCategoryDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WFAirPollutant localizedName: %@, localizedDescription: %@, amount: %f, unit: %@, localizedCategoryDescription: %@, categoryIndex: %lu, index: %lu"), v4, v5, v7, v8, v9, -[WFAirPollutant categoryIndex](self, "categoryIndex"), -[WFAirPollutant index](self, "index"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)amount
{
  return self->_amount;
}

- (void)setAmount:(double)a3
{
  self->_amount = a3;
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (NSString)localizedCategoryDescription
{
  return self->_localizedCategoryDescription;
}

- (void)setLocalizedCategoryDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedCategoryDescription, a3);
}

- (unint64_t)categoryIndex
{
  return self->_categoryIndex;
}

- (void)setCategoryIndex:(unint64_t)a3
{
  self->_categoryIndex = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryDescription, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end
