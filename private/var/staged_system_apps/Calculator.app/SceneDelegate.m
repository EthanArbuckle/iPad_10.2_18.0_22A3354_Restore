@implementation SceneDelegate

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void (**v8)(void *, _QWORD);
  id v9;
  id v10;
  char v11;
  _TtC10Calculator13SceneDelegate *v12;

  v8 = (void (**)(void *, _QWORD))_Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v12 = self;
  v11 = sub_1000583C8(v10);
  v8[2](v8, v11 & 1);
  _Block_release(v8);

}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  _TtC10Calculator13SceneDelegate *v8;

  v5 = (void *)objc_opt_self(_UIKBFeedbackGeneratorPartner);
  v6 = a3;
  v8 = self;
  objc_msgSend(v5, "preheatSystemSoundsForObject:");
  if (qword_100113ED0 != -1)
    swift_once(&qword_100113ED0, sub_1000A5238);
  v7 = (void *)qword_10011FE78;
  if ((objc_msgSend((id)qword_10011FE78, "isActive") & 1) == 0)
    objc_msgSend(v7, "activateWithCompletionBlock:", 0);

}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  _TtC10Calculator13SceneDelegate *v7;

  v4 = qword_100113ED0;
  v5 = a3;
  v7 = self;
  if (v4 != -1)
    swift_once(&qword_100113ED0, sub_1000A5238);
  v6 = (void *)qword_10011FE78;
  if (objc_msgSend((id)qword_10011FE78, "isActive"))
    objc_msgSend(v6, "deactivate");
  objc_msgSend((id)objc_opt_self(_UIKBFeedbackGeneratorPartner), "cooldownSystemSoundsForObject:", v7);

}

- (_TtC10Calculator13SceneDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SceneDelegate();
  return -[SceneDelegate init](&v3, "init");
}

- (void)sceneWillResignActive:
{
  id v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSArray v11;
  uint64_t v12;

  sub_10005651C();
  v0 = sub_100058778();
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
    v3 = objc_msgSend(v2, "shortcutItems");
    if (v3)
    {
      v4 = v3;
      v5 = sub_100058B2C();
      v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

      v12 = v6;
      v7 = v1;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v9 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v8 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v9 >= v8 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1);
      v10 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v7);
      specialized Array._endMutation()(v10);
      if (v12)
      {
        v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v12);
      }
      else
      {
        v11.super.isa = 0;
      }
      objc_msgSend(v2, "setShortcutItems:", v11.super.isa);

    }
    else
    {
      objc_msgSend(v2, "setShortcutItems:", 0);
      swift_bridgeObjectRelease(0);

    }
  }
}

@end
