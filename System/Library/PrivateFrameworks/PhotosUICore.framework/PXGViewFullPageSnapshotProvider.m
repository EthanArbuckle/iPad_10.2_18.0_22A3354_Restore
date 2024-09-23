@implementation PXGViewFullPageSnapshotProvider

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_1A687EE84;
  v8[5] = v7;
  v9 = a3;
  swift_retain_n();
  v10 = v9;
  sub_1A7ADBF34();
  sub_1A6C79FF8((uint64_t)sub_1A6C7CCD8, (uint64_t)v8);

  swift_release();
  swift_release();
  swift_release();
}

@end
