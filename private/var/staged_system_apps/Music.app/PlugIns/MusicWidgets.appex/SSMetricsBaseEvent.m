@implementation SSMetricsBaseEvent

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  SSMetricsBaseEvent *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_100506C60, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject(&unk_100506C88, 48, 7);
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_100150E28;
  v8[5] = v7;
  v9 = a3;
  v10 = self;
  v11 = v9;
  swift_retain(v7);
  sub_1001501B8((uint64_t)sub_100150B20, (uint64_t)v8);

  swift_release(v7);
  swift_release(v8);
}

@end
