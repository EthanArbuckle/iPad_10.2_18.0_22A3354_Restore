@implementation WFListDisplayConfiguration

- (WFListDisplayConfiguration)initWithCoder:(id)a3
{
  id v4;
  WFListDisplayConfiguration *v5;
  uint64_t v6;
  NSNumber *titleLineLimit;
  WFListDisplayConfiguration *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFListDisplayConfiguration;
  v5 = -[WFListDisplayConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleLineLimit"));
    v6 = objc_claimAutoreleasedReturnValue();
    titleLineLimit = v5->_titleLineLimit;
    v5->_titleLineLimit = (NSNumber *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFListDisplayConfiguration titleLineLimit](self, "titleLineLimit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("titleLineLimit"));

}

- (NSNumber)titleLineLimit
{
  return self->_titleLineLimit;
}

- (void)setTitleLineLimit:(id)a3
{
  objc_storeStrong((id *)&self->_titleLineLimit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLineLimit, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
