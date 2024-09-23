@implementation MTSubscriptionController

+ (MTSubscriptionController)sharedInstance
{
  if (qword_1EEAB6CB0 != -1)
    swift_once();
  return (MTSubscriptionController *)(id)qword_1EEAB7730;
}

+ (int64_t)alreadySubscribedErrorCode
{
  return -1001;
}

+ (NSString)subscriptionControllerErrorDomain
{
  return (NSString *)(id)sub_1A93F8010();
}

- (void)subscribeToShowWithPodcastStoreId:(id)a3 account:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  MTSubscriptionController *v13;

  v7 = _Block_copy(a5);
  v8 = sub_1A93F8040();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = a4;
  v13 = self;
  sub_1A9110E1C(v8, v10, a4, (uint64_t)sub_1A9115814, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)podcastExistsInStoreWithFeedUrl:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  MTSubscriptionController *v9;

  v5 = _Block_copy(a4);
  v6 = sub_1A93F8040();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_1A9114E5C(v6, v8, (uint64_t)v9, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (MTSubscriptionController)init
{
  uint64_t v3;
  id v4;
  MTSubscriptionController *v5;
  objc_super v7;

  v3 = OBJC_IVAR___MTSubscriptionController_requestController;
  v4 = objc_allocWithZone((Class)type metadata accessor for MediaRequestController());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for SubscriptionController();
  return -[MTSubscriptionController init](&v7, sel_init);
}

- (void).cxx_destruct
{

}

@end
