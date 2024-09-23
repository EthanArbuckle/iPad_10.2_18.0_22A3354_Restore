@implementation GenerativeStoryVisualDiagnosticsProvider

- (void)addVisualDiagnosticsToContext:(id)a3 completionHandler:(id)a4
{
  Class isa;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;

  isa = self->super.isa;
  sub_1A67ECCF8(0, (unint64_t *)&qword_1EE8D9360, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - v9;
  v11 = _Block_copy(a4);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = sub_1A7AE3BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = sub_1A687EE84;
  v14[7] = v12;
  v14[8] = isa;
  v15 = a3;
  swift_retain_n();
  v16 = v15;
  sub_1A7ADBF34();
  sub_1A686089C((uint64_t)v10, (uint64_t)&unk_1EE8DF8F8, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_release();

}

@end
