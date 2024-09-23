@implementation ICAppStoreRatingObserver

- (ICAppStoreRatingObserver)initWithAccountIdentifier:(id)a3 managedObjectContext:(id)a4 userDefaults:(id)a5 windowScene:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  ICAppStoreRatingObserver *v15;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (ICAppStoreRatingObserver *)sub_10039D264(v9, v11, v12, v13, v14);

  return v15;
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICAppStoreRatingObserver_managedObjectContext));
}

- (NSString)accountIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->managedObjectContext[OBJC_IVAR___ICAppStoreRatingObserver_accountIdentifier];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (ICAppStoreRatingController)appStoreRatingController
{
  return (ICAppStoreRatingController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR___ICAppStoreRatingObserver_appStoreRatingController));
}

- (BOOL)isObserving
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingObserver_isObserving);
}

- (void)setIsObserving:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingObserver_isObserving) = a3;
}

- (void)startObserving
{
  ICAppStoreRatingObserver *v2;

  v2 = self;
  sub_10039C028();

}

- (void)stopObserving
{
  ICAppStoreRatingObserver *v2;

  v2 = self;
  sub_10039C580();

}

- (void)didRecognizeGesture
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  ICAppStoreRatingObserver *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _BYTE v12[24];

  v3 = sub_100012E18((uint64_t *)&unk_1005D7B20);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingObserver_appStoreRatingController);
  v7 = self;
  static Date.now.getter(v7);
  v8 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
  v9 = v6 + OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate;
  swift_beginAccess(v6 + OBJC_IVAR___ICAppStoreRatingController_lastInteractionDate, v12, 33, 0);
  sub_1001CE964((uint64_t)v5, v9);
  swift_endAccess(v12);
  v10 = sub_1003CE790();
  objc_msgSend(v10, "requestFire");

}

- (void)noteEditorDidEditNote
{
  ICAppStoreRatingObserver *v2;

  v2 = self;
  sub_1003CD93C();

}

- (void)sceneWillEnterForeground
{
  void *v3;
  ICAppStoreRatingObserver *v4;
  id v5;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, "sceneDidActivate", UISceneDidActivateNotification, 0);

}

- (void)sceneDidActivate
{
  ICAppStoreRatingObserver *v2;
  id v3;

  v2 = self;
  sub_1003CDBD4();
  v3 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", v2, UISceneDidActivateNotification, 0);

}

- (ICAppStoreRatingObserver)init
{
  ICAppStoreRatingObserver *result;

  result = (ICAppStoreRatingObserver *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.AppStoreRatingObserver", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->managedObjectContext[OBJC_IVAR___ICAppStoreRatingObserver_accountIdentifier]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICAppStoreRatingObserver_didRequestRatingObservation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICAppStoreRatingObserver____lazy_storage___tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICAppStoreRatingObserver____lazy_storage___panGestureRecognizer));

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)controller:(id)a3 didChangeContentWithDifference:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  ICAppStoreRatingObserver *v13;
  uint64_t v14;

  v7 = sub_100012E18((uint64_t *)&unk_1005DB680);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
  static CollectionDifference._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v12 = a3;
  v13 = self;
  sub_10039D3E4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
