@implementation WFChangeForecast

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFChangeForecast)initWithDate:(id)a3 descriptionSameTimeZone:(id)a4 descriptionDifferentTimeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFChangeForecast *v11;
  uint64_t v12;
  NSDate *date;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFChangeForecast;
  v11 = -[WFChangeForecast init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    date = v11->_date;
    v11->_date = (NSDate *)v12;

    objc_storeStrong((id *)&v11->_descriptionSameTimeZone, a4);
    objc_storeStrong((id *)&v11->_descriptionDifferentTimeZone, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[WFChangeForecast initWithDate:descriptionSameTimeZone:descriptionDifferentTimeZone:]([WFChangeForecast alloc], "initWithDate:descriptionSameTimeZone:descriptionDifferentTimeZone:", self->_date, self->_descriptionSameTimeZone, self->_descriptionSameTimeZone);
}

- (WFChangeForecast)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFChangeForecast *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFChangeForecastDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("WFChangeForecastSameTimeZoneDescriptionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("WFChangeForecastDifferentTimeZoneDescriptionKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFChangeForecast initWithDate:descriptionSameTimeZone:descriptionDifferentTimeZone:](self, "initWithDate:descriptionSameTimeZone:descriptionDifferentTimeZone:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("WFChangeForecastDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptionSameTimeZone, CFSTR("WFChangeForecastSameTimeZoneDescriptionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptionDifferentTimeZone, CFSTR("WFChangeForecastDifferentTimeZoneDescriptionKey"));

}

- (NSDate)date
{
  return self->_date;
}

- (NSString)descriptionSameTimeZone
{
  return self->_descriptionSameTimeZone;
}

- (NSString)descriptionDifferentTimeZone
{
  return self->_descriptionDifferentTimeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionDifferentTimeZone, 0);
  objc_storeStrong((id *)&self->_descriptionSameTimeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
