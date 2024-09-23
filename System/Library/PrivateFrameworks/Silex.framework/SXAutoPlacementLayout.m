@implementation SXAutoPlacementLayout

- (id)marginWithValue:(id)a3 withType:(int)a4
{
  id v6;
  void *v7;
  float v8;
  SXAutoPlacementMargin *v9;
  SXMargin *v10;
  void *v11;

  v6 = a3;
  v7 = v6;
  if (a4 == 5)
  {
    v10 = [SXMargin alloc];
    -[SXJSONObject specificationVersion](self, "specificationVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SXJSONObject initWithJSONObject:andVersion:](v10, "initWithJSONObject:andVersion:", v7, v11);

  }
  else if (a4 == 2)
  {
    objc_msgSend(v6, "floatValue");
    v9 = -[SXAutoPlacementMargin initWithTop:bottom:]([SXAutoPlacementMargin alloc], "initWithTop:bottom:", v8, 1, v8, 1);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAutoPlacementLayout margin](self, "margin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "top");
  -[SXAutoPlacementLayout margin](self, "margin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "top");
  v8 = v7;
  -[SXAutoPlacementLayout margin](self, "margin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "bottom");
  -[SXAutoPlacementLayout margin](self, "margin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottom");
  objc_msgSend(v3, "appendFormat:", CFSTR("top margin: %f(%lu) bottom margin: %f(%lu)"), v5, v8, v10, v12);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

@end
