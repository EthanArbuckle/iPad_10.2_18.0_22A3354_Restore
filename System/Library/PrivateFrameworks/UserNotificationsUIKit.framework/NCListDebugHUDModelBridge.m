@implementation NCListDebugHUDModelBridge

+ (void)trackListView:(id)a3
{
  id v4;

  v4 = a3;
  sub_1CFD45F8C(a3);

}

+ (void)plotProperty:(double)a3 label:(id)a4 inListView:(id)a5
{
  sub_1CFD45E58(a3, (uint64_t)a1, (uint64_t)a2, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, double))sub_1CFD77DA0);
}

+ (void)plotRect:(CGRect)a3 label:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = sub_1CFD7C4C0();
  sub_1CFD78154(v8, v9, x, y, width, height);
  swift_bridgeObjectRelease();
}

+ (void)chartProperty:(double)a3 label:(id)a4 inListView:(id)a5
{
  sub_1CFD45E58(a3, (uint64_t)a1, (uint64_t)a2, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, double))sub_1CFD6EBEC);
}

+ (void)updateNotificationCount:(int64_t)a3
{
  sub_1CFD460F4();
}

- (NCListDebugHUDModelBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCListDebugHUDModelBridge;
  return -[NCListDebugHUDModelBridge init](&v3, sel_init);
}

@end
