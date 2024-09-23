@implementation REMTemplatePublicLinkConfiguration

- (REMTemplatePublicLinkConfiguration)initWithShouldIncludeHashtags:(BOOL)a3 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:(BOOL)a4 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:(BOOL)a5
{
  REMTemplatePublicLinkConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REMTemplatePublicLinkConfiguration;
  result = -[REMTemplatePublicLinkConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_shouldIncludeHashtags = a3;
    result->_shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval = a4;
    result->_shouldIncludeAlarmTriggersBasedOnLocationOrVehicle = a5;
  }
  return result;
}

- (BOOL)shouldIncludeContactsHandleData
{
  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMTemplatePublicLinkConfiguration shouldIncludeHashtags](self, "shouldIncludeHashtags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval](self, "shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnLocationOrVehicle](self, "shouldIncludeAlarmTriggersBasedOnLocationOrVehicle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMTemplatePublicLinkConfiguration shouldIncludeContactsHandleData](self, "shouldIncludeContactsHandleData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p shouldIncludeHashtags: %@, shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval: %@, shouldIncludeAlarmTriggersBasedOnLocationOrVehicle: %@, shouldIncludeContactsHandleData: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  _BOOL4 v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[REMTemplatePublicLinkConfiguration shouldIncludeHashtags](self, "shouldIncludeHashtags"),
        v5 == objc_msgSend(v4, "shouldIncludeHashtags"))
    && (v6 = -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval](self, "shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"), v6 == objc_msgSend(v4, "shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval")))
  {
    v9 = -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnLocationOrVehicle](self, "shouldIncludeAlarmTriggersBasedOnLocationOrVehicle");
    v7 = v9 ^ objc_msgSend(v4, "shouldIncludeAlarmTriggersBasedOnLocationOrVehicle") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[REMTemplatePublicLinkConfiguration initWithShouldIncludeHashtags:shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:]([REMTemplatePublicLinkConfiguration alloc], "initWithShouldIncludeHashtags:shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:", -[REMTemplatePublicLinkConfiguration shouldIncludeHashtags](self, "shouldIncludeHashtags"), -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval](self, "shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"), -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnLocationOrVehicle](self, "shouldIncludeAlarmTriggersBasedOnLocationOrVehicle"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplatePublicLinkConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldIncludeHashtags"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldIncludeAlarmTriggersBasedOnLocationOrVehicle"));

  return -[REMTemplatePublicLinkConfiguration initWithShouldIncludeHashtags:shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:](self, "initWithShouldIncludeHashtags:shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:", v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplatePublicLinkConfiguration shouldIncludeHashtags](self, "shouldIncludeHashtags"), CFSTR("shouldIncludeHashtags"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval](self, "shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"), CFSTR("shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMTemplatePublicLinkConfiguration shouldIncludeAlarmTriggersBasedOnLocationOrVehicle](self, "shouldIncludeAlarmTriggersBasedOnLocationOrVehicle"), CFSTR("shouldIncludeAlarmTriggersBasedOnLocationOrVehicle"));

}

- (BOOL)shouldIncludeHashtags
{
  return self->_shouldIncludeHashtags;
}

- (BOOL)shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval
{
  return self->_shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval;
}

- (BOOL)shouldIncludeAlarmTriggersBasedOnLocationOrVehicle
{
  return self->_shouldIncludeAlarmTriggersBasedOnLocationOrVehicle;
}

@end
