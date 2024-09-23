@implementation ManagedConfigRestrictionProvider

- (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332ManagedConfigRestrictionProvider)init
{
  return (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332ManagedConfigRestrictionProvider *)sub_1C13C8F4C();
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  _TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332ManagedConfigRestrictionProvider *v7;

  if (a4)
    sub_1C1426A34();
  v6 = a3;
  v7 = self;
  sub_1C13C9450();

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  sub_1C13C9B04((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332ManagedConfigRestrictionProvider_profileConnection, (SEL *)&selRef_unregisterObserver_, 0, (uint64_t (*)(uint64_t))type metadata accessor for ManagedConfigRestrictionProvider);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332ManagedConfigRestrictionProvider_profileConnection));
  swift_bridgeObjectRelease();
}

@end
