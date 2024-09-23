@implementation TIAnalyticsMetricsContext

- (TIAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4
{
  id v6;
  id v7;
  TIAnalyticsMetricsContext *v8;
  uint64_t v9;
  NSString *inputLanguage;
  uint64_t v11;
  NSString *inputRegion;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIAnalyticsMetricsContext;
  v8 = -[TIAnalyticsMetricsContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    inputLanguage = v8->_inputLanguage;
    v8->_inputLanguage = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    inputRegion = v8->_inputRegion;
    v8->_inputRegion = (NSString *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputRegion, 0);
  objc_storeStrong((id *)&self->_inputLanguage, 0);
}

- (NSString)inputRegion
{
  return self->_inputRegion;
}

- (NSString)inputLanguage
{
  return self->_inputLanguage;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *inputLanguage;
  id v5;

  inputLanguage = self->_inputLanguage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", inputLanguage, CFSTR("inputLanguage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inputRegion, CFSTR("inputRegion"));

}

- (TIAnalyticsMetricsContext)initWithCoder:(id)a3
{
  id v4;
  TIAnalyticsMetricsContext *v5;
  void *v6;
  uint64_t v7;
  NSString *inputLanguage;
  void *v9;
  uint64_t v10;
  NSString *inputRegion;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIAnalyticsMetricsContext;
  v5 = -[TIAnalyticsMetricsContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputLanguage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    inputLanguage = v5->_inputLanguage;
    v5->_inputLanguage = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputRegion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    inputRegion = v5->_inputRegion;
    v5->_inputRegion = (NSString *)v10;

  }
  return v5;
}

- (NSString)inputLanguageAndRegion
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), self->_inputLanguage, self->_inputRegion);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TIAnalyticsMetricsContext *v10;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_inputLanguage, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSString copyWithZone:](self->_inputRegion, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  v10 = self;

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = 257 * -[NSString hash](self->_inputLanguage, "hash");
  return -[NSString hash](self->_inputRegion, "hash") + v3;
}

- (BOOL)isEqual:(id)a3
{
  TIAnalyticsMetricsContext *v4;
  TIAnalyticsMetricsContext *v5;
  TIAnalyticsMetricsContext *v6;
  NSString *inputLanguage;
  NSString *inputRegion;
  char v9;

  v4 = (TIAnalyticsMetricsContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    inputLanguage = self->_inputLanguage;
    if ((unint64_t)inputLanguage | (unint64_t)v6->_inputLanguage
      && !-[NSString isEqualToString:](inputLanguage, "isEqualToString:"))
    {
      v9 = 0;
    }
    else
    {
      inputRegion = self->_inputRegion;
      if ((unint64_t)inputRegion | (unint64_t)v6->_inputRegion)
        v9 = -[NSString isEqualToString:](inputRegion, "isEqualToString:");
      else
        v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
