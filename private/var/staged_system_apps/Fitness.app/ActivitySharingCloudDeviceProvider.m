@implementation ActivitySharingCloudDeviceProvider

- (_TtC10FitnessApp34ActivitySharingCloudDeviceProvider)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC10FitnessApp34ActivitySharingCloudDeviceProvider *v7;
  objc_class *v8;
  objc_super v10;

  v3 = type metadata accessor for SecureCloudClient(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_cloudDevices) = (Class)_swiftEmptyArrayStorage;
  *(_DWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_activitySharingCloudDevicesChangedToken) = -1;
  v7 = self;
  SecureCloudClient.init()();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))((uint64_t)v7 + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_secureCloudClient, v6, v3);

  v8 = (objc_class *)type metadata accessor for ActivitySharingCloudDeviceProvider(0);
  v10.receiver = v7;
  v10.super_class = v8;
  return -[ActivitySharingCloudDeviceProvider init](&v10, "init");
}

- (void)dealloc
{
  int *v3;
  int v4;
  _TtC10FitnessApp34ActivitySharingCloudDeviceProvider *v5;
  objc_super v6;
  _BYTE v7[24];

  v3 = (int *)((char *)self
             + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_activitySharingCloudDevicesChangedToken);
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_activitySharingCloudDevicesChangedToken, v7, 0, 0);
  v4 = *v3;
  v5 = self;
  if (v4 != -1)
    notify_cancel(v4);
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for ActivitySharingCloudDeviceProvider(0);
  -[ActivitySharingCloudDeviceProvider dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_secureCloudClient;
  v4 = type metadata accessor for SecureCloudClient(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp34ActivitySharingCloudDeviceProvider_cloudDevices));
}

@end
