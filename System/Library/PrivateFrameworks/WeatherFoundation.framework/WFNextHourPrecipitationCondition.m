@implementation WFNextHourPrecipitationCondition

- (WFNextHourPrecipitationCondition)initWithType:(id)a3 intensity:(double)a4 probability:(double)a5 validUntil:(id)a6
{
  id v10;
  id v11;
  WFNextHourPrecipitationCondition *v12;
  WFNextHourPrecipitationCondition *v13;
  objc_super v15;

  v10 = a3;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)WFNextHourPrecipitationCondition;
  v12 = -[WFNextHourPrecipitationCondition init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = -[WFNextHourPrecipitationCondition typeForString:](v12, "typeForString:", v10);
    v13->_intensity = a4;
    v13->_probability = a5;
    objc_storeStrong((id *)&v13->_validUntil, a6);
  }

  return v13;
}

- (unint64_t)typeForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("clear")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("precip")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rain")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("snow")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sleet")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("hail")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_stringForType:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("unknown");
  else
    return off_24CCA0630[a3 - 1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 8) = self->_type;
  *(double *)(v4 + 16) = self->_intensity;
  *(double *)(v4 + 24) = self->_probability;
  v5 = -[NSDate copy](self->_validUntil, "copy");
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
  void *v5;
  id v6;

  v4 = a3;
  -[WFNextHourPrecipitationCondition _stringForType:](self, "_stringForType:", -[WFNextHourPrecipitationCondition type](self, "type"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WFNextHourPrecipitationConditionTypeKey"));
  -[WFNextHourPrecipitationCondition intensity](self, "intensity");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("WFNextHourPrecipitationConditionIntensityKey"));
  -[WFNextHourPrecipitationCondition probability](self, "probability");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("WFNextHourPrecipitationConditionProbabilityKey"));
  -[WFNextHourPrecipitationCondition validUntil](self, "validUntil");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFNextHourPrecipitationConditionValidUntilKey"));

}

- (WFNextHourPrecipitationCondition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  WFNextHourPrecipitationCondition *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationConditionTypeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("WFNextHourPrecipitationConditionIntensityKey"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("WFNextHourPrecipitationConditionProbabilityKey"));
  v9 = v8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationConditionValidUntilKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFNextHourPrecipitationCondition initWithType:intensity:probability:validUntil:](self, "initWithType:intensity:probability:validUntil:", v5, v10, v7, v9);
  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)intensity
{
  return self->_intensity;
}

- (double)probability
{
  return self->_probability;
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validUntil, 0);
}

@end
