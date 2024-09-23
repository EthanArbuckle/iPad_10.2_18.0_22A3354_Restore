@implementation TTRIWindowSceneController

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  TTRIWindowSceneController *v5;

  v4 = a3;
  v5 = self;
  sub_100014F0C(v4);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  TTRIWindowSceneController *v5;

  v4 = a3;
  v5 = self;
  sub_100013C58(v4);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  TTRIWindowSceneController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100018B98(v8, v9, v10);

}

- (TTRIWindowSceneController)init
{
  TTRIWindowSceneController *result;

  sub_1000117C8((uint64_t)self, (uint64_t)a2);
  return result;
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR___TTRIWindowSceneController_delegate);

  sub_1000073A0((uint64_t)self + OBJC_IVAR___TTRIWindowSceneController_rootModuleInterface, &qword_100651F38);
  sub_1000073A0((uint64_t)self + OBJC_IVAR___TTRIWindowSceneController_lastEnterForegroundDate, (uint64_t *)&unk_100653A90);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___TTRIWindowSceneController_lastSelectedListStorage));

  swift_release();
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___TTRIWindowSceneController_hashtagAssociationModule));
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  TTRIWindowSceneController *v5;

  v4 = a3;
  v5 = self;
  sub_10050DA2C(v4);

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  TTRIWindowSceneController *v5;

  v4 = a3;
  v5 = self;
  sub_10050DE90(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  TTRIWindowSceneController *v5;

  v4 = a3;
  v5 = self;
  sub_10050E10C(v4);

}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  TTRIWindowSceneController *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10050E670(v4);

  return v6;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  TTRIWindowSceneController *v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_10050F4A4(v9, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  TTRIWindowSceneController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10050EB54(v6, v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  TTRIWindowSceneController *v11;

  v7 = sub_100005ED8(0, &qword_100660C90, UIOpenURLContext_ptr);
  v8 = sub_1000199A0(&qword_1006655D0, &qword_100660C90, UIOpenURLContext_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10050EEC0(v10, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void (**v8)(void *, _QWORD);
  id v9;
  id v10;
  BOOL v11;
  TTRIWindowSceneController *v12;

  v8 = (void (**)(void *, _QWORD))_Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v12 = self;
  v11 = sub_10050A584(v10);
  ((void (**)(void *, BOOL))v8)[2](v8, v11);
  _Block_release(v8);

}

- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v6;
  id v7;
  TTRIWindowSceneController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10050F71C(v7);

}

@end
