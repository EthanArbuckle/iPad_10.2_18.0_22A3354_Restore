@implementation APAttributionRetryWorkerBridge

+ (BOOL)startWithSession:(id)a3 request:(id)a4 requestorId:(id)a5 intervalId:(unint64_t)a6 reportingStorefront:(id)a7 requestTimestamp:(id)a8 daemonStartTime:(id)a9 tokenReturnedToClientDate:(id)a10 payloadDeliveryStartDate:(id)a11
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void (*v32)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  uint64_t v41;

  v39 = a3;
  v40 = a6;
  v38 = a11;
  v36 = a8;
  v37 = a10;
  v14 = type metadata accessor for Date(0);
  v41 = *(_QWORD *)(v14 - 8);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v34 - v19;
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v34 - v22;
  __chkstk_darwin(v21);
  v26 = (char *)&v34 - v25;
  if (a5)
  {
    v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, v24);
    a5 = v24;
  }
  else
  {
    v35 = 0;
  }
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7, v24);
  v29 = v28;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v36);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a9);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v37);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v38);
  v30 = v39;
  v31 = a4;
  LOBYTE(v27) = sub_1000A99C8(v30, v31, v35, (uint64_t)a5, v40, v27, v29, (uint64_t)v26, (uint64_t)v23, (uint64_t)v20, (uint64_t)v17);

  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(a5);
  v32 = *(void (**)(char *, uint64_t))(v41 + 8);
  v32(v17, v14);
  v32(v20, v14);
  v32(v23, v14);
  v32(v26, v14);
  return v27 & 1;
}

- (APAttributionRetryWorkerBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AttributionRetryWorkerBridge();
  return -[APAttributionRetryWorkerBridge init](&v3, "init");
}

@end
