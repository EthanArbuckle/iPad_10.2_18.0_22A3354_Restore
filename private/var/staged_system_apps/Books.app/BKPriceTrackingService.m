@implementation BKPriceTrackingService

- (BKPriceTrackingService)init
{
  return (BKPriceTrackingService *)PriceTrackingService.init()();
}

- (void).cxx_destruct
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *(void **)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__bridge + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__bridge]);

  v4 = *(_QWORD *)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__priceTracker + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__priceTracker]);
  swift_release(v4);
  v5 = *(void **)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__addToWTRDelegate + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__addToWTRDelegate]);

  v6 = *(void **)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__stateChanges + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_bridge[OBJC_IVAR___BKPriceTrackingService__stateChanges]);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKPriceTrackingService_mutableSetupState));
}

- (id)featureEnabled
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_100915128, (uint64_t)sub_1005C8D54, (uint64_t)sub_1001EDBF0, (uint64_t)&unk_100915140);
}

- (id)addWeakStateChangeObserver
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_1009150D8, (uint64_t)sub_1005C8D50, (uint64_t)sub_1001EDBF0, (uint64_t)&unk_1009150F0);
}

- (id)removeWeakStateChangeObserver
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_100915088, (uint64_t)sub_1005C8D4C, (uint64_t)sub_1001EDBF0, (uint64_t)&unk_1009150A0);
}

- (id)cardListString
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_100915038, (uint64_t)sub_1005C8D48, (uint64_t)sub_1001EDBF0, (uint64_t)&unk_100915050);
}

- (id)notificationsEnabled
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_100914FE8, (uint64_t)sub_1005C8D44, (uint64_t)sub_1001EDBF0, (uint64_t)&unk_100915000);
}

- (id)setNotificationsEnabled
{
  return sub_100590C80(self, (uint64_t)a2, (uint64_t)&unk_100914F98, (uint64_t)sub_1005C8D40, (uint64_t)sub_1005C5EA8, (uint64_t)&unk_100914FB0);
}

@end
