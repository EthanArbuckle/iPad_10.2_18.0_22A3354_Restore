@implementation EVChargerUtility

+ (int)realTimeEVChargerStatusWithEvCharger:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;

  v4 = (void *)objc_opt_self(SearchVirtualGarageManager);
  v5 = a3;
  v6 = objc_msgSend(v4, "sharedSearchVirtualGarageManager");
  v7 = objc_msgSend(v6, "virtualGarage");

  if (v7)
  {
    v8 = objc_msgSend((id)objc_opt_self(MUEVChargingHelper), "getRealTimeEVChargerInfo:charger:", v7, v5);
    v9 = objc_msgSend(v8, "status");

    v5 = v8;
  }
  else
  {
    v9 = objc_msgSend(v5, "_realTimePlugAvailabilityStatus");
  }

  return v9;
}

+ (int)chargerStatusForNonRealData
{
  return 0;
}

+ (id)chargerStringForNonRealDataWithChargerNumber:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  sub_1001E26EC(a3);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

+ (id)realTimeEVChargerDisplayStringWithEvCharger:(id)a3 mapDisplay:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v5 = a3;
  sub_1001E2534(v5, a4);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return v8;
}

- (_TtC4Maps16EVChargerUtility)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EVChargerUtility();
  return -[EVChargerUtility init](&v3, "init");
}

@end
