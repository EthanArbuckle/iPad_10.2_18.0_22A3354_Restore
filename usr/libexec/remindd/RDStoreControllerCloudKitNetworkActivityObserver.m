@implementation RDStoreControllerCloudKitNetworkActivityObserver

- (BOOL)isObsolete
{
  void *Strong;
  void *v3;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver_clientConnection, a2);
  v3 = Strong;
  if (Strong)

  return v3 == 0;
}

- (void)updateNetworkActivityWithValue:(id)a3
{
  id v5;
  _TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver *v6;
  id Strong;

  Strong = (id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver_clientConnection, a2);
  v5 = a3;
  v6 = self;
  objc_msgSend(Strong, "cloudKitNetworkActivityDidUpdate:", v5);

}

- (_TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver)init
{
  _TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver *result;

  result = (_TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDStoreControllerCloudKitNetworkActivityObserver", 56, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC7remindd48RDStoreControllerCloudKitNetworkActivityObserver_clientConnection);
}

@end
