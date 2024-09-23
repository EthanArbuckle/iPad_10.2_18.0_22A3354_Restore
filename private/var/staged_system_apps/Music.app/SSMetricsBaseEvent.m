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
  v7 = swift_allocObject(&unk_1010F09C0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject(&unk_1010F09E8, 48, 7);
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_100A2A018;
  v8[5] = v7;
  v9 = a3;
  v10 = self;
  v11 = v9;
  swift_retain();
  sub_100A293E4((uint64_t)sub_100A29D4C, (uint64_t)v8);

  swift_release();
  swift_release();
}

@end
