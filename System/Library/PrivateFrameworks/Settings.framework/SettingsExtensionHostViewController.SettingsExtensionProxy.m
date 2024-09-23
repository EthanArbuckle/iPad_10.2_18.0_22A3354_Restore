@implementation SettingsExtensionHostViewController.SettingsExtensionProxy

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtCC8Settings35SettingsExtensionHostViewControllerP33_66DE5C0BC5107F4CC3560F98A88F046722SettingsExtensionProxy *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1DB47DA44(v7);

  return v9 & 1;
}

- (_TtCC8Settings35SettingsExtensionHostViewControllerP33_66DE5C0BC5107F4CC3560F98A88F046722SettingsExtensionProxy)init
{
  _TtCC8Settings35SettingsExtensionHostViewControllerP33_66DE5C0BC5107F4CC3560F98A88F046722SettingsExtensionProxy *result;

  result = (_TtCC8Settings35SettingsExtensionHostViewControllerP33_66DE5C0BC5107F4CC3560F98A88F046722SettingsExtensionProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DB442B10(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC8Settings35SettingsExtensionHostViewControllerP33_66DE5C0BC5107F4CC3560F98A88F046722SettingsExtensionProxy_completion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8Settings35SettingsExtensionHostViewControllerP33_66DE5C0BC5107F4CC3560F98A88F046722SettingsExtensionProxy____lazy_storage___privateListener));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8Settings35SettingsExtensionHostViewControllerP33_66DE5C0BC5107F4CC3560F98A88F046722SettingsExtensionProxy_connectionError));
}

@end
