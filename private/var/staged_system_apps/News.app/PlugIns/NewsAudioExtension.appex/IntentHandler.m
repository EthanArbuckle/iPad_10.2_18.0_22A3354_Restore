@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4;
  _TtC18NewsAudioExtension13IntentHandler *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;

  v4 = a3;
  v5 = self;
  sub_100002928(v4, v10);

  v6 = v11;
  v7 = sub_1000035C4(v10, v11);
  v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  sub_1000035E8(v10);
  return v8;
}

- (void)confirmPlayMedia:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC18NewsAudioExtension13IntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100003364((uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
  void (**v6)(void *, id);
  id v7;
  id v8;
  id v9;
  _TtC18NewsAudioExtension13IntentHandler *v10;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = objc_allocWithZone((Class)INPlayMediaIntentResponse);
  v8 = a3;
  v10 = self;
  v9 = objc_msgSend(v7, "initWithCode:userActivity:", 5, 0);
  v6[2](v6, v9);

  _Block_release(v6);
}

- (_TtC18NewsAudioExtension13IntentHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[IntentHandler init](&v3, "init");
}

@end
