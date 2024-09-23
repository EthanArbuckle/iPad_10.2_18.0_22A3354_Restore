@implementation ObservabilitySignalMonitor

- (void)eventSavedWithCreatedToSavedTimeInterval:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = type metadata accessor for ObservabilitySignal(0);
  __chkstk_darwin(v5);
  v7 = (double *)((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v7 = a3;
  swift_storeEnumTagMultiPayload(v7, v8, 5);
  swift_retain(self, v9);
  sub_100006E7C((uint64_t)v7);
  sub_1000070D8((uint64_t)v7, type metadata accessor for ObservabilitySignal);
  swift_release(self);
}

- (void)uploadSuccess
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = type metadata accessor for ObservabilitySignal(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload(v5, v6, 8);
  swift_retain(self, v7);
  sub_100006E7C((uint64_t)v5);
  sub_1000070D8((uint64_t)v5, type metadata accessor for ObservabilitySignal);
  swift_release(self);
}

- (void)batchDequeuedWithWaitingTime:(double)a3 queueLength:(int64_t)a4 batchID:(id)a5
{
  uint64_t v8;
  void *v9;
  void *v10;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, a2);
  v10 = v9;
  swift_retain(self, v9);
  sub_10002ED8C(a4, v8, v10, a3);
  swift_release(self);
  swift_bridgeObjectRelease(v10);
}

- (void)willUploadWithBatchCount:(int64_t)a3
{
  sub_10002EC70((uint64_t)self, (uint64_t)a2, a3, 7);
}

- (void)batchClosedWithBatchLifetime:(double)a3 eventsCount:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = type metadata accessor for ObservabilitySignal(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(double *)v9 = a3;
  *((_QWORD *)v9 + 1) = a4;
  swift_storeEnumTagMultiPayload(v9, v10, 0);
  swift_retain(self, v11);
  sub_100006E7C((uint64_t)v9);
  sub_1000070D8((uint64_t)v9, type metadata accessor for ObservabilitySignal);
  swift_release(self);
}

- (void)batchEnqueuedWithQueueLength:(int64_t)a3
{
  sub_10002EC70((uint64_t)self, (uint64_t)a2, a3, 2);
}

- (void)batchExpiredWithBatchID:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v6 = v5;
  swift_retain(self, v5);
  sub_100139E2C(v4, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
}

- (void)eventCreatedWithCreationDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = type metadata accessor for ObservabilitySignal(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v11, v8);
  swift_storeEnumTagMultiPayload(v7, v5, 4);
  swift_retain(self, v12);
  sub_100006E7C((uint64_t)v7);
  sub_1000070D8((uint64_t)v7, type metadata accessor for ObservabilitySignal);
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)uploadFailureWithType:(int64_t)a3 code:(int64_t)a4 batchIDs:(id)a5
{
  uint64_t v8;
  uint64_t v9;

  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  swift_retain(self, v9);
  sub_10013A1C8(a3, a4, v8);
  swift_release(self);
  swift_bridgeObjectRelease(v8);
}

@end
