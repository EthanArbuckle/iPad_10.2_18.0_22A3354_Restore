@implementation SDAirDropiOSNotificationManager

- (_TtC16DaemoniOSLibrary31SDAirDropiOSNotificationManager)init
{
  char *v3;
  objc_super v5;

  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAirDropiOSNotificationManager_delegate;
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakInit(v3, 0);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SDAirDropiOSNotificationManager();
  return -[SDAirDropiOSNotificationManager init](&v5, "init");
}

- (void).cxx_destruct
{
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAirDropiOSNotificationManager_delegate);
}

@end
