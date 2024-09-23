@implementation ControlsSettingAttribute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ControlsSettingAttribute)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECDD4();
  return (ControlsSettingAttribute *)ControlsSettingAttribute.init(identifier:display:pronunciationHint:)();
}

- (ControlsSettingAttribute)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (ControlsSettingAttribute *)ControlsSettingAttribute.init(coder:)();
}

@end
