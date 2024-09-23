@implementation SSMetricsLoadURLEvent

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  SSMetricsLoadURLEvent *v8;
  id v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100447E60, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  v9 = a3;
  sub_1000AF988(a3, v8, v8, (uint64_t)a3, (uint64_t)sub_1000B04B4, v7);

  swift_release(v7);
}

@end
