@implementation StoryAsyncPlayer

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  uint64_t v16;

  sub_1A689FC34();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = sub_1A7AE3BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_1A687EE84;
  v13[7] = v11;
  v14 = a3;
  swift_retain_n();
  v15 = v14;
  sub_1A7ADBF34();
  sub_1A686089C((uint64_t)v9, (uint64_t)&unk_1EE8DD670, (uint64_t)v13);

  swift_release();
  swift_release();
  swift_release();
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  sub_1A6F4B574((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A6F49870);
}

@end
