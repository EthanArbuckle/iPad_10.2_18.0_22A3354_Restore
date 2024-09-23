@implementation ReadingActivityServiceFactory

- (void)deleteCloudDataWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (*v11)(char, uint64_t);
  __n128 v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    v9 = v8;
    v10 = swift_allocObject(&unk_100912638, 24, 7);
    *(_QWORD *)(v10 + 16) = v9;
    v11 = sub_1005534B4;
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  type metadata accessor for ReadingGoalsDataStore(0);
  v12 = swift_retain(self);
  static ReadingGoalsDataStore.clearCachedData(in:)(self->goalsLocalStore, v12);
  type metadata accessor for ReadingHistoryDataStore(0);
  static ReadingHistoryDataStore.clearCachedData(in:)(*(_QWORD *)self->historyDefaults);
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject(&unk_100912610, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v11;
  v14[5] = v10;
  sub_10002ACF0((uint64_t)v11, v10);
  v15 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009ED240, (uint64_t)v14);
  swift_release(v15);
  sub_10002AD00((uint64_t)v11, v10);
  swift_release(self);
}

@end
