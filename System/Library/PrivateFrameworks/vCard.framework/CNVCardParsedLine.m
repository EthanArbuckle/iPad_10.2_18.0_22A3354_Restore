@implementation CNVCardParsedLine

- (CNVCardParsedLine)initWithName:(id)a3
{
  id v4;
  CNVCardParsedLine *v5;
  uint64_t v6;
  NSString *name;
  CNVCardParsedLine *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVCardParsedLine;
  v5 = -[CNVCardParsedLine init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CNVCardParsedLine name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParsedLine value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@='%@' primary=%d>"), v4, self, v5, v6, -[CNVCardParsedLine isPrimary](self, "isPrimary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)parameters
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setParameters:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGrouping:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
