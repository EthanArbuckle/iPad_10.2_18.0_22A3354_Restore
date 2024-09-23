@implementation BKSessionDonor

- (BKSessionDonor)init
{
  NSString v3;
  BKSessionDonor *v4;

  v3 = String._bridgeToObjectiveC()();
  v4 = -[BKSessionDonor initWithType:](self, "initWithType:", v3);

  return v4;
}

- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  BKSessionDonor *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  v11 = a3;
  v12 = self;
  sub_10003B13C((uint64_t)v11, v9, (uint64_t)a4, v12, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(a4);
}

- (BOOL)isCarPlayConnected
{
  void *v2;
  BKSessionDonor *v3;
  id v4;

  v2 = *(void **)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_carSessionStatus];
  if (!v2)
    return 0;
  v3 = self;
  v4 = objc_msgSend(v2, "currentSession");

  if (!v4)
    return 0;

  return 1;
}

- (uint64_t)libraryProvider:(uint64_t)a3 contentDidLoad:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;

  v7 = sub_100009E04(0, (unint64_t *)&unk_1009DB330, BSUIAsset_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  swift_unknownObjectRetain(a3);
  v9 = a1;
  sub_1000538A0(a3, v8);
  swift_unknownObjectRelease(a3);

  return swift_bridgeObjectRelease(v8);
}

- (BKSessionDonor)initWithType:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (BKSessionDonor *)sub_10002AD10(v3, v4);
}

- (void)reportPurchase:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BKSessionDonor *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v9 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  v10 = qword_1009CDEB8;
  v11 = self;
  swift_bridgeObjectRetain(v8);
  if (v10 != -1)
    swift_once(&qword_1009CDEB8, sub_100007FE0);
  v12 = qword_1009DAFB0;
  v13 = sub_100008DB0(&qword_1009DA220, (uint64_t (*)(uint64_t))type metadata accessor for PropertyValueActor.ActorType, (uint64_t)&unk_10071B984);
  v14 = (_QWORD *)swift_allocObject(&unk_1008FDE60, 48, 7);
  v14[2] = v12;
  v14[3] = v13;
  v14[4] = v11;
  v14[5] = v8;
  swift_retain(v12);
  v15 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009DA228, (uint64_t)v14);
  -[BKSessionDonor propertyDidChange:propertyConfiguration:](v11, "propertyDidChange:propertyConfiguration:", v11, *(_QWORD *)&v11->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_sessionConfiguration], swift_release(v15).n128_f64[0]);

  swift_bridgeObjectRelease(v8);
}

- (void)reportNotificationSettingsVisited
{
  sub_10032DA60(self, (uint64_t)a2, &OBJC_IVAR___BKSessionDonor_notificationSettingsVisited, &OBJC_IVAR___BKSessionDonor_notificationSettingsVisitedConfig);
}

- (void)reportSampleButtonUsed
{
  sub_10032DA60(self, (uint64_t)a2, &OBJC_IVAR___BKSessionDonor_sampleButtonUsed, &OBJC_IVAR___BKSessionDonor_sampleButtonUsedConfig);
}

- (void)reportPreviewButtonUsed
{
  sub_10032DA60(self, (uint64_t)a2, &OBJC_IVAR___BKSessionDonor_previewButtonUsed, &OBJC_IVAR___BKSessionDonor_previewButtonUsedConfig);
}

- (void)reportAddToWTRButtonUsed
{
  sub_10032DA60(self, (uint64_t)a2, &OBJC_IVAR___BKSessionDonor_addToWTRButtonUsed, &OBJC_IVAR___BKSessionDonor_addToWTRButtonUsedConfig);
}

- (void)reportAppleWatchAppUsed
{
  sub_10032DA60(self, (uint64_t)a2, &OBJC_IVAR___BKSessionDonor_everUsedAppleWatchApp, &OBJC_IVAR___BKSessionDonor_everUsedAppleWatchAppConfig);
}

- (void)reportCarplayAppUsed
{
  sub_10032DA60(self, (uint64_t)a2, &OBJC_IVAR___BKSessionDonor_everUsedCarplayApp, &OBJC_IVAR___BKSessionDonor_everUsedCarplayAppConfig);
}

- (void)reportProductPageViewed:(id)a3 :(id)a4 :(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BKSessionDonor *v14;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = self;
  sub_10032DA90(v8, v10, v11, v13, a5);

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v13);
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->sessionIdentifier[OBJC_IVAR___BKSessionDonor_sessionIdentifier]);
  v3 = &self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_sessionStartDate];
  v4 = type metadata accessor for Date(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy(&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_manager]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_productPageViewed]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_purchases]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_readingSessions]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_listeningSessions]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_recentBooks]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_sampleBooks]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_storeBooks]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_readingSessionInProgress]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_listeningSessionInProgress]);
  swift_unknownObjectRelease(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_rootBarCoordinator]);
  swift_release(*(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_currentTabPublisherCancellable]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->sessionIdentifier[OBJC_IVAR___BKSessionDonor_currentTab]);
}

- (void)timeTracker:(id)a3 didBeginTrackingSession:(id)a4 trackerEventType:(unint64_t)a5 asset:(id)a6 readingFeatureFlags:(int64_t)a7
{
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  id v16;
  BKSessionDonor *v17;
  uint64_t v18;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4, v13);
  v16 = a3;
  swift_unknownObjectRetain(a6);
  v17 = self;
  sub_10032EB74((uint64_t)v15, a6);

  swift_unknownObjectRelease(a6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
}

- (void)timeTracker:(id)a3 didEndTrackingSession:(id)a4 duration:(double)a5 trackerEventType:(unint64_t)a6 asset:(id)a7 readingFeatureFlags:(int64_t)a8
{
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char *v16;
  id v17;
  BKSessionDonor *v18;
  uint64_t v19;

  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4, v14);
  v17 = a3;
  swift_unknownObjectRetain(a7);
  v18 = self;
  sub_10032EED8((uint64_t)v16);

  swift_unknownObjectRelease(a7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  BKSessionDonor *v5;

  v4 = a3;
  v5 = self;
  sub_10032F008();

}

- (void)sessionDidDisconnect:(id)a3
{
  -[BKSessionDonor propertyDidChange:propertyConfiguration:](self, "propertyDidChange:propertyConfiguration:", self, *(_QWORD *)&self->BMBaseDonor_opaque[OBJC_IVAR___BKSessionDonor_connectedToCarplayConfig]);
}

- (void)userNotificationSettingsDidChange
{
  BKSessionDonor *v2;

  v2 = self;
  sub_10032E88C();

}

@end
