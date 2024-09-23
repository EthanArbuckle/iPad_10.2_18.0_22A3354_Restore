@implementation RemoteNetworkPaymentWebsocketURLSession

- (void)dealloc
{
  _TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession *v2;

  v2 = self;
  sub_18FDF529C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_18FD59F30((uint64_t)self + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_delegate);
  sub_18FDE1D88(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_remoteIdentifier), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_remoteIdentifier]);
  v3 = (char *)self + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_websocketURL;
  v4 = sub_1903D0178();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_urlSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_delegateQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_webSocketTask));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession_pingTimer));
}

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didOpenWithProtocol:(id)a5
{
  id v8;
  id v9;
  _TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession *v10;

  if (a5)
    sub_1903D05C8();
  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_18FDFB138();

  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 webSocketTask:(id)a4 didCloseWithCode:(int64_t)a5 reason:(id)a6
{
  void *v6;
  id v10;
  id v11;
  _TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession *v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  _TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession *v18;

  v6 = a6;
  if (a6)
  {
    v10 = a3;
    v11 = a4;
    v12 = self;
    v13 = v6;
    v6 = (void *)sub_1903D01B4();
    v15 = v14;

  }
  else
  {
    v16 = a3;
    v17 = a4;
    v18 = self;
    v15 = 0xF000000000000000;
  }
  sub_18FDFB418(a5, (uint64_t)v6, v15);
  sub_18FD4D5D8((uint64_t)v6, v15);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  _TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_18FDFB6BC(a4);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_18FDFB8DC((uint64_t)v9, a5);

}

- (_TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession)init
{
  _TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession *result;

  result = (_TtC11PassKitCore39RemoteNetworkPaymentWebsocketURLSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
