@implementation BKEngagementManager

- (BKEngagementManager)initWithConfiguration:(id)a3 configurationContainer:(id)a4
{
  return (BKEngagementManager *)EngagementManager.init(configuration:configurationContainer:)(a3, a4);
}

- (void)setupPersonalizationEventDonor:(id)a3
{
  BKEngagementManager *v4;
  id v5;

  v5 = a3;
  v4 = self;
  EngagementManager.setup(personalizationEventDonor:)(v5);

}

- (BKSessionDonor)sessionDonor
{
  void *v2;
  BKEngagementManager *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  v3 = self;
  v4 = v2;
  v5 = Manager.donor(type:)(0x2D6E6F6973736573, 0xED0000726F6E6F64);

  if (v5)
  {
    v6 = type metadata accessor for SessionDonor(0);
    v7 = (void *)swift_dynamicCastClass(v5, v6);

    if (!v7)
      swift_unknownObjectRelease(v5);
  }
  else
  {

    v7 = 0;
  }
  return (BKSessionDonor *)v7;
}

- (void)fetchDialogRequestsFor:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BKEngagementManager *v9;

  v6 = _Block_copy(a4);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &protocol witness table for String);
  if (v6)
  {
    v8 = swift_allocObject(&unk_1008FC3D0, 24, 7);
    *(_QWORD *)(v8 + 16) = v6;
    v6 = sub_100065210;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  _s5Books17EngagementManagerC19fetchDialogRequests3for10completionyShySSG_ySDySSSo16AMSDialogRequestCG_s5Error_pSgtcSgtF_0(v7, (uint64_t)v6, v8);
  sub_10002AD00((uint64_t)v6, v8);

  swift_bridgeObjectRelease(v7);
}

- (void)engagementEventDataForEventWithEventName:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  BKEngagementManager *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_1008FC4C0, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  v8 = self;
  v9 = v7;
  v10 = Manager.collector.getter();

  v11 = static Context.submitEvent.getter();
  v13 = v12;
  v14 = swift_allocObject(&unk_1008FC4E8, 32, 7);
  *(_QWORD *)(v14 + 16) = sub_100065218;
  *(_QWORD *)(v14 + 24) = v6;
  swift_retain(v6);
  dispatch thunk of Collector.collect(_:completion:)(v11, v13, sub_1003173D8, v14);

  swift_release(v6);
  swift_release(v10);
  swift_bridgeObjectRelease(v13);
  swift_release(v14);
}

- (void)reportAppOpenEvent
{
  BKEngagementManager *v2;

  v2 = self;
  EngagementManager.reportAppOpenEvent()();

}

- (void)setupSessionDonor
{
  BKEngagementManager *v2;

  v2 = self;
  EngagementManager.setupSessionDonor()();

}

- (BCEngagementEventController)eventController
{
  return (BCEngagementEventController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___BKEngagementManager_eventController));
}

- (void)setEventController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_eventController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_eventController) = (Class)a3;
  v3 = a3;

}

- (BKEngagementManagerMetadata)metadata
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_metadata);
  swift_beginAccess((char *)self + OBJC_IVAR___BKEngagementManager_metadata, v4, 0, 0);
  return (BKEngagementManagerMetadata *)*v2;
}

- (void)setMetadata:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_metadata);
  swift_beginAccess((char *)self + OBJC_IVAR___BKEngagementManager_metadata, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BKEngagementManagerAnalyticsHelper)analyticsHelper
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_analyticsHelper);
  swift_beginAccess((char *)self + OBJC_IVAR___BKEngagementManager_analyticsHelper, v4, 0, 0);
  return (BKEngagementManagerAnalyticsHelper *)*v2;
}

- (void)setAnalyticsHelper:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_analyticsHelper);
  swift_beginAccess((char *)self + OBJC_IVAR___BKEngagementManager_analyticsHelper, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

+ (void)destroyPersistentStorageInDirectory:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  type metadata accessor for Manager(0);
  dispatch thunk of static Manager.destroyPersistentStore(directory:)(v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)forceSyncFromCloudKit
{
  BKEngagementManager *v2;

  v2 = self;
  _s5Books17EngagementManagerC21forceSyncFromCloudKityyF_0();

}

- (void)forceSyncToCloudKit
{
  BKEngagementManager *v2;

  v2 = self;
  EngagementManager.syncToCloudKit(completion:)((void (*)(_QWORD, _QWORD))BKAppDelegate.enableMetricsInspectorOnDebugMode(), 0);

}

- (void)onDidReceiveAppDidBackground:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  BKEngagementManager *v10;
  id v11;
  uint64_t v12;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  v10 = self;
  v11 = v9;
  Manager.updateLocalStorage(completion:)(sub_100012908, 0);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)onCloudUpdate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  BKEngagementManager *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___BKEngagementManager_cloudKitSyncEnabled) == 1)
  {
    v9 = self;
    _s5Books17EngagementManagerC21forceSyncFromCloudKityyF_0();

  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)forcePurgeAll
{
  void *v2;
  BKEngagementManager *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  v3 = self;
  v4 = v2;
  Manager.forcePurgeLocalStorage()();

}

- (id)donorWithType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BKEngagementManager *v8;
  id v9;
  void *v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  v8 = self;
  v9 = v7;
  v10 = (void *)Manager.donor(type:)(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v10;
}

- (BKEngagementManager)init
{
  BKEngagementManager *result;

  result = (BKEngagementManager *)_swift_stdlib_reportUnimplementedInitializer("Books.EngagementManager", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4
{
  id v6;
  id v7;
  BKEngagementManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100315F1C(a4);

}

- (void)sendReaderEventNewSectionViaToC
{
  void *v2;
  BKEngagementManager *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_eventController);
  v3 = self;
  v4 = v2;
  dispatch thunk of EngagementEventController.submitEvent(_:_:)(0xD00000000000001BLL, 0x80000001007BE700, 0);

}

- (void)onConfigurationChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  BKEngagementManager *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100312D94();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
