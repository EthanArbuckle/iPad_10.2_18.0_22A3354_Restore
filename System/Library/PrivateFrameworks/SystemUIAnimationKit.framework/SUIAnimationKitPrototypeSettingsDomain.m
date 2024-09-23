@implementation SUIAnimationKitPrototypeSettingsDomain

+ (id)rootSettings
{
  id result;
  objc_super v3;

  swift_getObjCClassMetadata();
  v3.receiver = (id)swift_getObjCClassFromMetadata();
  v3.super_class = (Class)&OBJC_METACLASS___SUIAnimationKitPrototypeSettingsDomain;
  result = objc_msgSendSuper2(&v3, sel_rootSettings);
  if (result)
  {
    objc_opt_self();
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)domainGroupName
{
  return (id)sub_247C9FDA8();
}

+ (id)domainName
{
  return (id)sub_247C9FDA8();
}

+ (Class)rootSettingsClass
{
  type metadata accessor for SUIAnimationKitPrototypeSettings(0);
  return (Class)swift_getObjCClassFromMetadata();
}

@end
