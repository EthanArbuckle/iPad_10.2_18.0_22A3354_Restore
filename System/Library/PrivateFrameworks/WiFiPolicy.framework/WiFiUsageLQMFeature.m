@implementation WiFiUsageLQMFeature

- (NSNumber)median
{
  return self->_median;
}

- (void)setMedian:(id)a3
{
  objc_storeStrong((id *)&self->_median, a3);
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (BOOL)isPerSecond
{
  return self->_isPerSecond;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *fieldName;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    fieldName = self->_fieldName;
    objc_msgSend(v4, "fieldName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqual:](fieldName, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WiFiUsageLQMFeature)initWithField:(id)a3 andPerSecond:(BOOL)a4
{
  NSString *v6;
  WiFiUsageLQMFeature *v7;
  NSString *fieldName;
  objc_super v10;

  v6 = (NSString *)a3;
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageLQMFeature;
  v7 = -[WiFiUsageLQMFeature init](&v10, sel_init);
  fieldName = v7->_fieldName;
  v7->_fieldName = v6;

  v7->_isPerSecond = a4;
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setFieldName:", self->_fieldName);
  objc_msgSend(v4, "setIsPerSecond:", self->_isPerSecond);
  objc_msgSend(v4, "setMedian:", self->_median);
  return v4;
}

- (id)description
{
  const __CFString *v2;

  if (self->_isPerSecond)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fieldName:%@ isPerSecond:%@ median:%@"), self->_fieldName, v2, self->_median);
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (void)setIsPerSecond:(BOOL)a3
{
  self->_isPerSecond = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_median, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
}

@end
