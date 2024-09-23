@implementation ATPersonalizationServer

- (_TtC12textcontextd23ATPersonalizationServer)init
{
  return (_TtC12textcontextd23ATPersonalizationServer *)sub_100004400();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC12textcontextd23ATPersonalizationServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100005598(v7);

  return v9 & 1;
}

- (void)freeNowWithExcludeAllDayEvents:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _TtC12textcontextd23ATPersonalizationServer *v14;
  uint64_t v15;
  uint64_t v16;

  sub_10000355C(&qword_10000CEC0);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = swift_allocObject(&unk_1000088B8, 40, 7);
  *(_BYTE *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = v9;
  *(_QWORD *)(v10 + 32) = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_1000088E0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10000CF38;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_100008908, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10000CF40;
  v13[5] = v12;
  v14 = self;
  v15 = sub_1000051C0((uint64_t)v8, (uint64_t)&unk_10000CF48, (uint64_t)v13);
  swift_release(v15);
}

- (void)topPlayedMediaWithK:(int64_t)a3 start:(int64_t)a4 end:(int64_t)a5 mediaType:(NSString *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSString *v20;
  _TtC12textcontextd23ATPersonalizationServer *v21;
  uint64_t v22;
  uint64_t v23;

  sub_10000355C(&qword_10000CEC0);
  __chkstk_darwin();
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a7);
  v16 = (_QWORD *)swift_allocObject(&unk_100008840, 64, 7);
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = v15;
  v16[7] = self;
  v17 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject(&unk_100008868, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10000CF10;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject(&unk_100008890, 48, 7);
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_10000CF18;
  v19[5] = v18;
  v20 = a6;
  v21 = self;
  v22 = sub_1000051C0((uint64_t)v14, (uint64_t)&unk_10000CF20, (uint64_t)v19);
  swift_release(v22);
}

- (void)currentLocationWithEffectiveBundleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSString *v14;
  _TtC12textcontextd23ATPersonalizationServer *v15;
  uint64_t v16;
  uint64_t v17;

  sub_10000355C(&qword_10000CEC0);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject(&unk_1000087A0, 40, 7);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_1000087C8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10000CED0;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject(&unk_1000087F0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10000CEE0;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  v16 = sub_1000051C0((uint64_t)v8, (uint64_t)&unk_10000CEF0, (uint64_t)v13);
  swift_release(v16);
}

- (void).cxx_destruct
{

}

@end
