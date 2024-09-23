@implementation BKSeriesManagerUpdaterHelper

+ (void)gatherAllAssetAdamIDsInSeries:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSDictionary *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_16B968(&qword_30C8A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_294E78, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_294EA0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_30C8B0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_294EC8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_30C6F0;
  v14[5] = v13;
  v15 = a3;
  v16 = sub_19FFA0((uint64_t)v9, (uint64_t)&unk_30C8C0, (uint64_t)v14);
  swift_release(v16);
}

+ (void)updateSeries:(id)a3 withResource:(id)a4 inMoc:(id)a5
{
  id v7;
  id v8;

  v7 = a3;
  swift_unknownObjectRetain(a4);
  v8 = a5;
  _s8BookCore26SeriesManagerUpdaterHelperC6update_4with2inySo12BKSeriesItemC_So9BFMSeries_pSo0J28DatabaseManagedObjectContextCtFZ_0(v7, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (BKSeriesManagerUpdaterHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SeriesManagerUpdaterHelper();
  return -[BKSeriesManagerUpdaterHelper init](&v3, "init");
}

@end
