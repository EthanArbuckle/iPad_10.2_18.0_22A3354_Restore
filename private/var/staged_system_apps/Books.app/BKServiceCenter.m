@implementation BKServiceCenter

- (BKServiceCenter)initWithAppConfiguration:(id)a3
{
  char *v5;
  char *v6;
  uint64_t ObjectType;

  v5 = (char *)objc_allocWithZone((Class)swift_getObjectType());
  v6 = sub_1004EBD78(a3, v5);
  ObjectType = swift_getObjectType();
  swift_deallocPartialClassInstance(self, ObjectType, 40, 7);
  return (BKServiceCenter *)v6;
}

- (void)setupServicesWithLibraryManager:(id)a3 appDelegate:(id)a4
{
  id v6;
  id v7;
  BKServiceCenter *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  ServiceCenter.setupServices(withLibraryManager:appDelegate:)(v6, v7);

}

- (BKReadingActivityService)readingActivityService
{
  BKReadingActivityService *result;

  sub_10002DF54(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for ReadingActivityService, &qword_1009F0760);
  return result;
}

- (BKWidgetService)widgetService
{
  BKWidgetService *result;

  sub_10002DF54(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for WidgetService, &qword_1009E8710);
  return result;
}

- (BKYearInReviewEligibilityService)yearInReviewEligibilityService
{
  BKYearInReviewEligibilityService *result;

  sub_10002DF54(self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for YearInReviewEligibilityService, &qword_1009E8718);
  return result;
}

- (BKPriceTrackingService)priceTrackingService
{
  BKServiceCenter *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v10 = type metadata accessor for PriceTrackingService();
  v3 = self;
  v4 = sub_10004CFD4(&qword_1009E8720);
  v5 = String.init<A>(describing:)(&v10, v4);
  v7 = v6;
  v8 = (void *)sub_10002DFD8(v5, v6, (uint64_t (*)(_QWORD))type metadata accessor for PriceTrackingService);

  swift_bridgeObjectRelease(v7);
  return (BKPriceTrackingService *)v8;
}

- (BKServiceCenter)init
{
  return (BKServiceCenter *)sub_100551B2C();
}

- (void)deleteCloudDataWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BKServiceCenter *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    v9 = swift_allocObject(&unk_10090F780, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1005534B4;
  }
  else
  {
    v9 = 0;
  }
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10090F758, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = v9;
  v12 = self;
  sub_10002ACF0((uint64_t)v8, v9);
  v13 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009EAE18, (uint64_t)v11);
  swift_release(v13);
  sub_10002AD00((uint64_t)v8, v9);

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKServiceCenter_services));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKServiceCenter__setupState));
}

@end
