@implementation SDAirDropAlertManager

- (_TtC16DaemoniOSLibrary21SDAirDropAlertManager)init
{
  return (_TtC16DaemoniOSLibrary21SDAirDropAlertManager *)sub_1003DD334();
}

- (void)activate
{
  _TtC16DaemoniOSLibrary21SDAirDropAlertManager *v2;

  v2 = self;
  sub_1003DD43C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary21SDAirDropAlertManager_transferObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary21SDAirDropAlertManager_rateLimiter));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary21SDAirDropAlertManager_transfersToAlerts));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary21SDAirDropAlertManager_queuedAlerts));
}

- (void)updatedTransfer:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary21SDAirDropAlertManager *v5;

  v4 = a3;
  v5 = self;
  sub_1003DDAF8(v4);

}

- (void)removedTransfer:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary21SDAirDropAlertManager *v5;

  v4 = a3;
  v5 = self;
  sub_1003DFAD0(v4);

}

@end
