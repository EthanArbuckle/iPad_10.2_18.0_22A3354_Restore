@implementation SXAutoPlacement

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("advertisement"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("suggestedArticles")))
  {
    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXAutoPlacement;
    objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return (Class)v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@; %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAutoPlacement advertisement](self, "advertisement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXAutoPlacement advertisement](self, "advertisement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; advertisement: %@"), v5);

  }
  -[SXAutoPlacement suggestedArticles](self, "suggestedArticles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SXAutoPlacement suggestedArticles](self, "suggestedArticles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; suggestedArticles: %@"), v7);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

@end
