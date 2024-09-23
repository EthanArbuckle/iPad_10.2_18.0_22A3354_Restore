@implementation WFNextHourPrecipitationDescription

- (WFNextHourPrecipitationDescription)initWithToken:(id)a3 shortTemplate:(id)a4 longTemplate:(id)a5 parameters:(id)a6 validUntil:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WFNextHourPrecipitationDescription *v17;
  uint64_t v18;
  NSString *token;
  uint64_t v20;
  NSString *shortTemplate;
  uint64_t v22;
  NSString *longTemplate;
  uint64_t v24;
  NSDictionary *parameters;
  uint64_t v26;
  NSDate *validUntil;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)WFNextHourPrecipitationDescription;
  v17 = -[WFNextHourPrecipitationDescription init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    token = v17->_token;
    v17->_token = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    shortTemplate = v17->_shortTemplate;
    v17->_shortTemplate = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    longTemplate = v17->_longTemplate;
    v17->_longTemplate = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    parameters = v17->_parameters;
    v17->_parameters = (NSDictionary *)v24;

    v26 = objc_msgSend(v16, "copy");
    validUntil = v17->_validUntil;
    v17->_validUntil = (NSDate *)v26;

  }
  return v17;
}

- (WFNextHourPrecipitationDescription)initWithShortTemplate:(id)a3 longTemplate:(id)a4 parameters:(id)a5 validUntil:(id)a6
{
  return -[WFNextHourPrecipitationDescription initWithToken:shortTemplate:longTemplate:parameters:validUntil:](self, "initWithToken:shortTemplate:longTemplate:parameters:validUntil:", &stru_24CCA55E8, a3, a4, a5, a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[NSString copy](self->_token, "copy");
  v6 = (void *)-[NSString copy](self->_shortTemplate, "copy");
  v7 = (void *)-[NSString copy](self->_longTemplate, "copy");
  v8 = (void *)-[NSDictionary copy](self->_parameters, "copy");
  v9 = (void *)-[NSDate copy](self->_validUntil, "copy");
  v10 = (void *)objc_msgSend(v4, "initWithToken:shortTemplate:longTemplate:parameters:validUntil:", v5, v6, v7, v8, v9);

  return v10;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNextHourPrecipitationDescription fillTemplate:withDate:](self, "fillTemplate:withDate:", self->_shortTemplate, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)longDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNextHourPrecipitationDescription fillTemplate:withDate:](self, "fillTemplate:withDate:", self->_longTemplate, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isValidAtDate:(id)a3
{
  NSDate *validUntil;
  double v4;

  validUntil = self->_validUntil;
  if (!validUntil)
    return 1;
  -[NSDate timeIntervalSinceDate:](validUntil, "timeIntervalSinceDate:", a3);
  return v4 > 91.0;
}

- (id)fillTemplate:(id)a3 withDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("firstAt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%@}"), CFSTR("firstAt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v6);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.0f"), round(v10 / 60.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", v9, v11, 0, 0, objc_msgSend(v7, "length"));
    -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("secondAt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%@}"), CFSTR("secondAt"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v8);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.0f"), round(v14 / 60.0));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", v13, v15, 0, 0, objc_msgSend(v7, "length"));

    }
  }

  return v7;
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
  void *v8;
  id v9;

  v4 = a3;
  -[WFNextHourPrecipitationDescription token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFNextHourPrecipitationDescriptionTokenKey"));

  -[WFNextHourPrecipitationDescription shortTemplate](self, "shortTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WFNextHourPrecipitationDescriptionShortTemplateKey"));

  -[WFNextHourPrecipitationDescription longTemplate](self, "longTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WFNextHourPrecipitationDescriptionLongTemplateKey"));

  -[WFNextHourPrecipitationDescription parameters](self, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WFNextHourPrecipitationDescriptionParametersKey"));

  -[WFNextHourPrecipitationDescription validUntil](self, "validUntil");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WFNextHourPrecipitationDescriptionValidUntilKey"));

}

- (WFNextHourPrecipitationDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFNextHourPrecipitationDescription *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationDescriptionTokenKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationDescriptionShortTemplateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationDescriptionLongTemplateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (initWithCoder__onceToken_3 != -1)
    dispatch_once(&initWithCoder__onceToken_3, &__block_literal_global_25);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes_2, CFSTR("WFNextHourPrecipitationDescriptionParametersKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationDescriptionValidUntilKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFNextHourPrecipitationDescription initWithToken:shortTemplate:longTemplate:parameters:validUntil:](self, "initWithToken:shortTemplate:longTemplate:parameters:validUntil:", v5, v6, v7, v8, v9);

  return v10;
}

void __52__WFNextHourPrecipitationDescription_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)initWithCoder__classes_2;
  initWithCoder__classes_2 = v3;

}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (NSString)shortTemplate
{
  return self->_shortTemplate;
}

- (void)setShortTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)longTemplate
{
  return self->_longTemplate;
}

- (void)setLongTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_longTemplate, 0);
  objc_storeStrong((id *)&self->_shortTemplate, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
