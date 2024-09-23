@implementation SUIKPControllerFactoryInternal

+ (id)thirdPartySettingsControllerForSpecifierWithSpecifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = objc_allocWithZone((Class)type metadata accessor for SUIKPThirdPartyAppListController());
  v5 = a3;
  sub_2289D7150();
  v7 = v6;
  objc_msgSend(v6, sel_setSpecifier_, v5);

  return v7;
}

- (SUIKPControllerFactoryInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _ControllerFactory();
  return -[SUIKPControllerFactoryInternal init](&v3, sel_init);
}

@end
