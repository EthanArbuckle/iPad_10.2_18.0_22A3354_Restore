@implementation SettingsExtensionHostViewController

- (_TtC8Settings35SettingsExtensionHostViewController)init
{
  id v3;
  _TtC8Settings35SettingsExtensionHostViewController *v4;
  objc_class *v5;
  _TtC8Settings35SettingsExtensionHostViewController *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Settings35SettingsExtensionHostViewController_extensionProxies) = (Class)MEMORY[0x1E0DEE9E0];
  v3 = objc_allocWithZone(MEMORY[0x1E0CAA600]);
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8Settings35SettingsExtensionHostViewController_viewController) = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for SettingsExtensionHostViewController();
  v6 = -[SettingsExtensionHostViewController init](&v8, sel_init);
  objc_msgSend(*(id *)((char *)&v6->super.isa + OBJC_IVAR____TtC8Settings35SettingsExtensionHostViewController_viewController), sel_setDelegate_, v6);
  return v6;
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  _TtC8Settings35SettingsExtensionHostViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DB479454(v4);

}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC8Settings35SettingsExtensionHostViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1DB479B3C(v8, v9, a5);

}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6;
  id v7;
  _TtC8Settings35SettingsExtensionHostViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DB47E704();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Settings35SettingsExtensionHostViewController_viewController));
  swift_bridgeObjectRelease();
}

@end
