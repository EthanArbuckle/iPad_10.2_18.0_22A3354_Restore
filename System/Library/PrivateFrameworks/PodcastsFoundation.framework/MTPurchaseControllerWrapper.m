@implementation MTPurchaseControllerWrapper

- (MTPurchaseControllerWrapper)init
{
  id v3;
  MTPurchaseControllerWrapper *v4;
  objc_super v6;
  _OWORD v7[2];
  uint64_t v8;

  v8 = 0;
  memset(v7, 0, sizeof(v7));
  v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED2A2860));
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___MTPurchaseControllerWrapper_purchaseController) = (Class)sub_1A90D0BEC((uint64_t)v7);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PurchaseControllerWrapper();
  return -[MTPurchaseControllerWrapper init](&v6, sel_init);
}

- (void)fetchChannelUpdatesCheckingEntitlementsNotification
{
  MTPurchaseControllerWrapper *v2;

  v2 = self;
  sub_1A9077658();

}

- (void)syncMusicSubscriptionInformation
{
  void *v3;
  uint64_t v4;
  MTPurchaseControllerWrapper *v5;
  id v6;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTPurchaseControllerWrapper_purchaseController);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  v5 = self;
  v6 = v3;
  sub_1A90C52A0(0, (uint64_t)sub_1A918CD00, v4);

  swift_release();
}

- (void)forceFetchLatestChannelUpdates
{
  MTPurchaseControllerWrapper *v2;

  v2 = self;
  sub_1A90CA850();

}

+ (MTPurchaseControllerWrapper)sharedInstance
{
  if (qword_1ED2A3388 != -1)
    swift_once();
  return (MTPurchaseControllerWrapper *)(id)qword_1ED2A3378;
}

- (void).cxx_destruct
{

}

@end
