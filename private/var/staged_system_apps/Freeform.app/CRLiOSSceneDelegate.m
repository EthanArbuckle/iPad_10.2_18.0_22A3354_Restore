@implementation CRLiOSSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  _TtC8Freeform19CRLiOSSceneDelegate *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  sub_10090440C(v11, v8, v9);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8Freeform19CRLiOSSceneDelegate *v10;
  id v11;

  v7 = sub_1004B8930(0, &qword_1013FA4F0, UIOpenURLContext_ptr);
  v8 = sub_1005A15B8(&qword_1013FA4F8, &qword_1013FA4F0, UIOpenURLContext_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v11 = a3;
  v10 = self;
  sub_100920D64(v9);
  swift_bridgeObjectRelease();

}

- (void)sceneDidDisconnect:(id)a3
{
  _TtC8Freeform19CRLiOSSceneDelegate *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100921014();

}

- (void)sceneDidBecomeActive:(id)a3
{
  _TtC8Freeform19CRLiOSSceneDelegate *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1009087C4((uint64_t)v5);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC8Freeform19CRLiOSSceneDelegate *v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = self;
  v6 = sub_1009093FC();
  objc_msgSend(v6, "resignCurrent");

  v7 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v8 = v7;
  if (qword_1013DD520 != -1)
  {
    swift_once(&qword_1013DD520, sub_100902F64);
    v7 = v8;
  }
  objc_msgSend(v7, "postNotificationName:object:", qword_10147FF58, v4);

}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v5;
  id v6;
  _TtC8Freeform19CRLiOSSceneDelegate *v7;
  id v8;
  id v9;

  v5 = (void *)objc_opt_self(NSNotificationCenter);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "defaultCenter");
  v9 = v8;
  if (qword_1013DD528 != -1)
  {
    swift_once(&qword_1013DD528, sub_100902FA4);
    v8 = v9;
  }
  objc_msgSend(v8, "postNotificationName:object:", qword_10147FF60, v6);

}

- (void)sceneDidEnterBackground:(id)a3
{
  _TtC8Freeform19CRLiOSSceneDelegate *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100908C18((uint64_t)v5);

}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  _TtC8Freeform19CRLiOSSceneDelegate *v10;
  id v11;

  v8 = _Block_copy(a5);
  v11 = a3;
  v9 = a4;
  v10 = self;
  sub_1009213F8(v9);
  _Block_release(v8);

}

- (NSUserActivity)userActivity
{
  return (NSUserActivity *)0;
}

- (void)setUserActivity:(id)a3
{
  _TtC8Freeform19CRLiOSSceneDelegate *v4;
  id v5;

  v5 = a3;
  v4 = self;

}

- (id)stateRestorationActivityForScene:(id)a3
{
  void *v5;
  id v6;
  _TtC8Freeform19CRLiOSSceneDelegate *v7;
  id v8;
  id v9;

  v5 = (void *)objc_opt_self(NSThread);
  v6 = a3;
  v7 = self;
  if (objc_msgSend(v5, "isMainThread"))
  {
    v8 = sub_1009093EC();
    sub_1009099BC(v8);

  }
  else
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"stateRestorationActivity(for:)", 30, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/App/CRLiOSSceneDelegate.swift", 87, 2, 415, "Expected stateRestorationActivity(for:) to be called on the main thread.", 72, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"stateRestorationActivity(for:)", 30, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/App/CRLiOSSceneDelegate.swift", 87, 2u, 415, (uint64_t)"Expected stateRestorationActivity(for:) to be called on the main thread.", 72, 2u);
  }
  v9 = sub_1009093EC();

  return v9;
}

- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v6;
  _TtC8Freeform19CRLiOSSceneDelegate *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_10090CFDC(v6);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  _TtC8Freeform19CRLiOSSceneDelegate *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_10091F384(v6);

}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC8Freeform19CRLiOSSceneDelegate *v12;
  id v13;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = a3;
  v13 = a5;
  v12 = self;
  sub_100921530(v8, v10, (uint64_t)v13);

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform19CRLiOSSceneDelegate)init
{
  return (_TtC8Freeform19CRLiOSSceneDelegate *)sub_100910764();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_navigationStack));
  sub_1004CB49C(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___boardLibrary));
  sub_1004CB49C(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___boardPreviewImageCache));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___splitViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___sidebarViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_boardViewControllerTransitioningDelegate));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_welcomeController);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_welcomeControllerDidDismissContinuation, &qword_1013FA358);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_handleUserActivityTaskQueue));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___stateRestorationUserActivity));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate____lazy_storage___handoffUserActivity));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_downloadSharedCopyAttempt));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_acceptCloudKitShareAttempt));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_acceptCloudKitShareAlertController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSSceneDelegate_downloadSharedCopyAlertController));
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v9;
  id v10;
  _TtC8Freeform19CRLiOSSceneDelegate *v11;

  v9 = a3;
  swift_unknownObjectRetain(a4);
  v10 = a6;
  v11 = self;
  sub_1009194E0();

  swift_unknownObjectRelease(a4);
}

- (void)didTapWelcomeContinueButton:(id)a3
{
  _TtC8Freeform19CRLiOSSceneDelegate *v5;
  uint64_t v6;
  _TtC8Freeform19CRLiOSSceneDelegate *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100919854();

  sub_1004CB800((uint64_t)v8, &qword_1013E0230);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC8Freeform19CRLiOSSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10091D4A0(v4);

}

- (void)qa_importFileFor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform19CRLiOSSceneDelegate *v10;
  id v11;
  _TtC8Freeform19CRLiOSSceneDelegate *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor(0);
  v9 = a3;
  v10 = self;
  v11 = v9;
  v12 = v10;
  v13 = static MainActor.shared.getter(v12);
  v14 = (_QWORD *)swift_allocObject(&unk_101287EC0, 48, 7);
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v11;
  v14[5] = v12;
  v15 = sub_100521B98((uint64_t)v7, (uint64_t)&unk_1013FA448, (uint64_t)v14);

  swift_release(v15);
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  _TtC8Freeform19CRLiOSSceneDelegate *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_10091E9B0();
  v4 = v3;

  return (UIActivityItemsConfigurationReading *)v4;
}

@end
