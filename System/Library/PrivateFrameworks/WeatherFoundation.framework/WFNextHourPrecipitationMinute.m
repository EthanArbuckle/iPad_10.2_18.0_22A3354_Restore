@implementation WFNextHourPrecipitationMinute

- (WFNextHourPrecipitationMinute)initWithIntensity:(double)a3 chance:(double)a4 perceivedIntensity:(double)a5 date:(id)a6
{
  id v11;
  WFNextHourPrecipitationMinute *v12;
  WFNextHourPrecipitationMinute *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)WFNextHourPrecipitationMinute;
  v12 = -[WFNextHourPrecipitationMinute init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_intensity = a3;
    v12->_chance = a4;
    v12->_perceivedIntensity = a5;
    objc_storeStrong((id *)&v12->_date, a6);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v4 + 8) = self->_intensity;
  *(double *)(v4 + 16) = self->_chance;
  *(double *)(v4 + 24) = self->_perceivedIntensity;
  v5 = -[NSDate copy](self->_date, "copy");
  v6 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v5;

  return (id)v4;
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
  -[WFNextHourPrecipitationMinute intensity](self, "intensity");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("WFNextHourPrecipitationMinuteIntensityKey"));
  -[WFNextHourPrecipitationMinute chance](self, "chance");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("WFNextHourPrecipitationMinuteChanceKey"));
  -[WFNextHourPrecipitationMinute perceivedIntensity](self, "perceivedIntensity");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("WFNextHourPrecipitationMinutePerceivedIntensityKey"));
  -[WFNextHourPrecipitationMinute date](self, "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFNextHourPrecipitationMinuteDateKey"));

}

- (WFNextHourPrecipitationMinute)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  WFNextHourPrecipitationMinute *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("WFNextHourPrecipitationMinuteIntensityKey"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("WFNextHourPrecipitationMinuteChanceKey"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("WFNextHourPrecipitationMinutePerceivedIntensityKey"));
  v10 = v9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationMinuteDateKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[WFNextHourPrecipitationMinute initWithIntensity:chance:perceivedIntensity:date:](self, "initWithIntensity:chance:perceivedIntensity:date:", v11, v6, v8, v10);
  return v12;
}

- (double)intensity
{
  return self->_intensity;
}

- (double)chance
{
  return self->_chance;
}

- (double)perceivedIntensity
{
  return self->_perceivedIntensity;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
