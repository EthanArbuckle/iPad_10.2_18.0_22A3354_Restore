@implementation RemoteHandleObserverDelegateTrampoline

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  _TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline *v5;

  v4 = a3;
  v5 = self;
  sub_100437A6C(v4, "FMRemoteUILauncher - Did activate handle %@", (uint64_t)&unk_101076950, (uint64_t)&unk_1010FBF18);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline *v5;

  v4 = a3;
  v5 = self;
  sub_100437A6C(v4, "Did deactivate handle %@", (uint64_t)&unk_101076928, (uint64_t)&unk_1010FBF08);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100437EA8(v6, (uint64_t)a4);

}

- (_TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline)init
{
  _TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline *result;

  result = (_TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.RemoteHandleObserverDelegateTrampoline", 51, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002EB2D8((uint64_t)self+ OBJC_IVAR____TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline_delegate);
}

@end
