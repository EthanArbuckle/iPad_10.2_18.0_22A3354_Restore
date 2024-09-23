@implementation _UIZoomTransitionSettingsDomain

+ (id)rootSettings
{
  id result;
  objc_super v3;

  swift_getObjCClassMetadata();
  v3.receiver = (id)swift_getObjCClassFromMetadata();
  v3.super_class = (Class)&OBJC_METACLASS____TtC5UIKit31_UIZoomTransitionSettingsDomain;
  result = objc_msgSendSuper2(&v3, sel_rootSettings);
  if (result)
  {
    type metadata accessor for _UIZoomTransitionSpec();
    return (id)swift_dynamicCastClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)domainName
{
  return (id)sub_1865074D4();
}

+ (id)domainGroupName
{
  return (id)sub_1865074D4();
}

+ (Class)rootSettingsClass
{
  type metadata accessor for _UIZoomTransitionSpec();
  return (Class)swift_getObjCClassFromMetadata();
}

@end
