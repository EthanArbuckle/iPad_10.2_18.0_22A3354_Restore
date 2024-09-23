@implementation WFGeocodeResponse

- (WFGeocodeResponse)initWithIdentifier:(id)a3 location:(id)a4
{
  id v7;
  WFGeocodeResponse *v8;
  WFGeocodeResponse *v9;
  WFGeocodeResponse *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFGeocodeResponse;
  v8 = -[WFResponse initWithIdentifier:](&v12, sel_initWithIdentifier_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_location, a4);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WFGeocodeResponse %p: %@"), self, self->_location);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFGeocodeResponse)initWithCoder:(id)a3
{
  id v4;
  WFGeocodeResponse *v5;
  uint64_t v6;
  WFLocation *location;
  WFGeocodeResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFGeocodeResponse;
  v5 = -[WFResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (WFLocation *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFGeocodeResponse;
  v4 = a3;
  -[WFResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFGeocodeResponse location](self, "location", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("location"));

}

- (WFLocation)location
{
  return (WFLocation *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
