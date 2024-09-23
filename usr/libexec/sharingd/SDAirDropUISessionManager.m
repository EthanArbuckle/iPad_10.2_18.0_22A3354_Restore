@implementation SDAirDropUISessionManager

- (_TtC16DaemoniOSLibrary25SDAirDropUISessionManager)init
{
  return (_TtC16DaemoniOSLibrary25SDAirDropUISessionManager *)sub_1003714D0();
}

- (void)activate
{
  _TtC16DaemoniOSLibrary25SDAirDropUISessionManager *v2;

  v2 = self;
  sub_1003717E8();

}

- (void).cxx_destruct
{
  double v3;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_transferObserver));
  *(_QWORD *)&v3 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_activeTransfersById)).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_progressObserversById), v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_airDropUISession));
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_delegate);
  swift_bridgeObjectRelease(*(const char **)&self->transferObserver[OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_airDropUIBundleIdentifier]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_airDropUIAssertion));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropUISessionManager_ongoingWalletTransferStartDate, &qword_1007C4330);

}

- (void)updatedTransfer:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary25SDAirDropUISessionManager *v5;

  v4 = a3;
  v5 = self;
  sub_100376690(v4);

}

- (void)removedTransfer:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary25SDAirDropUISessionManager *v5;

  v4 = a3;
  v5 = self;
  sub_100376DAC(v4);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v4;
  _TtC16DaemoniOSLibrary25SDAirDropUISessionManager *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;

  v4 = qword_1007B3FA8;
  v11 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_1007B3FA8, sub_100371440);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100221DF8(v6, (uint64_t)qword_1007BCCC0);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter(v8);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Wallet UI service deactivated", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC16DaemoniOSLibrary25SDAirDropUISessionManager *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_10037A334((uint64_t)a4);

}

@end
