@implementation STShowWeatherCurrentConditionsRequest

- (id)_initWithCurrentConditions:(id)a3 city:(id)a4 units:(id)a5
{
  id v9;
  id v10;
  id v11;
  STShowWeatherCurrentConditionsRequest *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STShowWeatherCurrentConditionsRequest;
  v12 = -[AFSiriRequest init](&v15, sel_init);
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_currentConditions, a3);
    objc_storeStrong(p_isa + 6, a4);
    objc_storeStrong(p_isa + 7, a5);
  }

  return p_isa;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (id)currentConditions
{
  return self->_currentConditions;
}

- (id)city
{
  return self->_city;
}

- (id)units
{
  return self->_units;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowWeatherCurrentConditionsRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentConditions, CFSTR("_currentConditions"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_city, CFSTR("_city"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_units, CFSTR("_units"));

}

- (STShowWeatherCurrentConditionsRequest)initWithCoder:(id)a3
{
  id v4;
  STShowWeatherCurrentConditionsRequest *v5;
  uint64_t v6;
  STWeatherCurrentConditions *currentConditions;
  uint64_t v8;
  STCity *city;
  uint64_t v10;
  STWeatherUnits *units;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STShowWeatherCurrentConditionsRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentConditions"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentConditions = v5->_currentConditions;
    v5->_currentConditions = (STWeatherCurrentConditions *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_city"));
    v8 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (STCity *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_units"));
    v10 = objc_claimAutoreleasedReturnValue();
    units = v5->_units;
    v5->_units = (STWeatherUnits *)v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_currentConditions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
