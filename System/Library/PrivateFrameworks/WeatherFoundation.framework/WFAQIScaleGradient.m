@implementation WFAQIScaleGradient

- (WFAQIScaleGradient)initWithStops:(id)a3
{
  id v4;
  WFAQIScaleGradient *v5;
  uint64_t v6;
  NSArray *stops;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFAQIScaleGradient;
  v5 = -[WFAQIScaleGradient init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stops = v5->_stops;
    v5->_stops = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WFAQIScaleGradient *v4;
  BOOL v5;

  v4 = (WFAQIScaleGradient *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[WFAQIScaleGradient isEqualToScaleGradient:](self, "isEqualToScaleGradient:", v4);
  }

  return v5;
}

- (BOOL)isEqualToScaleGradient:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "stops");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleGradient stops](self, "stops");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WFAQIScaleGradient *v4;
  void *v5;
  WFAQIScaleGradient *v6;

  v4 = [WFAQIScaleGradient alloc];
  -[WFAQIScaleGradient stops](self, "stops");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFAQIScaleGradient initWithStops:](v4, "initWithStops:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFAQIScaleGradient stops](self, "stops");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFAQIScaleGradientStopsKey"));

}

- (WFAQIScaleGradient)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  WFAQIScaleGradient *v8;

  v4 = initWithCoder__onceToken_2;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initWithCoder__onceToken_2, &__block_literal_global_24);
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", initWithCoder__classes_1, CFSTR("WFAQIScaleGradientStopsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[WFAQIScaleGradient initWithStops:](self, "initWithStops:", v7);

  return v8;
}

void __36__WFAQIScaleGradient_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__classes_1;
  initWithCoder__classes_1 = v2;

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[WFAQIScaleGradient stops](self, "stops");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<WFAQIScaleGradient stops: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)stops
{
  return self->_stops;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stops, 0);
}

@end
