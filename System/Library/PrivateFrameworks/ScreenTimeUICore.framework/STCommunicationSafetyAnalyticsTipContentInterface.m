@implementation STCommunicationSafetyAnalyticsTipContentInterface

+ (id)makeCommunicationSafetyAnalyticsTipViewControllerWithActionBlock:(id)a3 dismissTipBlock:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  v9 = sub_20DDE7058((uint64_t)sub_20DDE7200, v7, (uint64_t)sub_20DDE7230, v8);
  swift_release();
  swift_release();
  return v9;
}

- (_TtC16ScreenTimeUICore49STCommunicationSafetyAnalyticsTipContentInterface)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STCommunicationSafetyAnalyticsTipContentInterface();
  return -[STCommunicationSafetyAnalyticsTipContentInterface init](&v3, sel_init);
}

@end
