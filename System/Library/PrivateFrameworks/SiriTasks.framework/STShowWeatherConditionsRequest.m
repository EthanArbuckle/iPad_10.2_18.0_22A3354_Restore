@implementation STShowWeatherConditionsRequest

- (id)_initWithAttributes:(id)a3 city:(id)a4
{
  id v7;
  id v8;
  STShowWeatherConditionsRequest *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STShowWeatherConditionsRequest;
  v9 = -[AFSiriRequest init](&v12, sel_init);
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributes, a3);
    objc_storeStrong(p_isa + 6, a4);
  }

  return p_isa;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (id)attributes
{
  return self->_attributes;
}

- (id)city
{
  return self->_city;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowWeatherConditionsRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_attributes, CFSTR("_attributes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_city, CFSTR("_city"));

}

- (STShowWeatherConditionsRequest)initWithCoder:(id)a3
{
  id v4;
  STShowWeatherConditionsRequest *v5;
  uint64_t v6;
  STWeatherAttributes *attributes;
  uint64_t v8;
  STCity *city;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STShowWeatherConditionsRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_attributes"));
    v6 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (STWeatherAttributes *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_city"));
    v8 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (STCity *)v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
