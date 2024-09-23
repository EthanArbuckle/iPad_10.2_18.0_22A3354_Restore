@implementation RemoteExtensionScene

- (UIViewController)viewController
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC13iCloudQuotaUI20RemoteExtensionScene_viewController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setViewController:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC13iCloudQuotaUI20RemoteExtensionScene_viewController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC13iCloudQuotaUI20RemoteExtensionScene)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13iCloudQuotaUI20RemoteExtensionScene_viewController) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoteExtensionScene();
  return -[RemoteExtensionScene init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
