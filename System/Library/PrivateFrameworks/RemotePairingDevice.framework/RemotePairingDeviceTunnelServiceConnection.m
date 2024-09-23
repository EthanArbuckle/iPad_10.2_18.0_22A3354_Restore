@implementation RemotePairingDeviceTunnelServiceConnection

- (_TtC19RemotePairingDevice42RemotePairingDeviceTunnelServiceConnection)init
{
  return (_TtC19RemotePairingDevice42RemotePairingDeviceTunnelServiceConnection *)RemotePairingDeviceTunnelServiceConnection.init()();
}

- (id)copyRemoteUnlockDeviceKeyForTunnelWithTunnelName:(id)a3 error:(id *)a4
{
  _TtC19RemotePairingDevice42RemotePairingDeviceTunnelServiceConnection *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  sub_1CF73EED4();
  v5 = self;
  v6 = RemotePairingDeviceTunnelServiceConnection.copyRemoteUnlockDeviceKeyForTunnel(tunnelName:)();
  v8 = v7;
  swift_bridgeObjectRelease();

  v9 = (void *)sub_1CF73E58C();
  sub_1CF6933C0(v6, v8);
  return v9;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
