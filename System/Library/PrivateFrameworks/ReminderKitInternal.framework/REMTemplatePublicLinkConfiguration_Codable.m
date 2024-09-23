@implementation REMTemplatePublicLinkConfiguration_Codable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplatePublicLinkConfiguration_Codable)initWithShouldIncludeHashtags:(BOOL)a3 shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:(BOOL)a4 shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  objc_super v9;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  return -[REMTemplatePublicLinkConfiguration initWithShouldIncludeHashtags:shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval:shouldIncludeAlarmTriggersBasedOnLocationOrVehicle:](&v9, sel_initWithShouldIncludeHashtags_shouldIncludeAlarmTriggersBasedOnDateOrTimeInterval_shouldIncludeAlarmTriggersBasedOnLocationOrVehicle_, v7, v6, v5);
}

@end
