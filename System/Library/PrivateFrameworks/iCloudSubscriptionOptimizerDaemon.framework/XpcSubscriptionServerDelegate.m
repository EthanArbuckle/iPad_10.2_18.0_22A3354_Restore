@implementation XpcSubscriptionServerDelegate

- (_TtC33iCloudSubscriptionOptimizerDaemon29XpcSubscriptionServerDelegate)init
{
  _TtC33iCloudSubscriptionOptimizerDaemon29XpcSubscriptionServerDelegate *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for XpcSubscriptionServerDelegate();
  v2 = -[XpcSubscriptionServerDelegate init](&v5, sel_init);
  if (qword_2540D55C8 != -1)
    swift_once();
  v3 = sub_21DB968C0();
  __swift_project_value_buffer(v3, (uint64_t)qword_2540D55B0);
  sub_21DB96884();
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  _TtC33iCloudSubscriptionOptimizerDaemon29XpcSubscriptionServerDelegate *v3;
  uint64_t v4;
  objc_super v5;

  v2 = qword_2540D55C8;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_21DB968C0();
  __swift_project_value_buffer(v4, (uint64_t)qword_2540D55B0);
  sub_21DB96884();
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for XpcSubscriptionServerDelegate();
  -[XpcSubscriptionServerDelegate dealloc](&v5, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC33iCloudSubscriptionOptimizerDaemon29XpcSubscriptionServerDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_21DB949B4(v7);

  return v9 & 1;
}

@end
