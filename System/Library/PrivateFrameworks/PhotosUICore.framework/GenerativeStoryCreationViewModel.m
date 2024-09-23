@implementation GenerativeStoryCreationViewModel

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  sub_1A67ECCF8(0, (unint64_t *)&qword_1EE8D9360, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - v6;
  swift_unknownObjectRetain();
  sub_1A7ADBF34();
  v8 = (void *)sub_1A7AE3734();
  v9 = objc_msgSend(a3, sel_beginCollectionOperationWithName_timeout_, v8, 100.0);

  v10 = sub_1A7AE3BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = v9;
  swift_unknownObjectRetain();
  sub_1A7ADBF34();
  sub_1A686089C((uint64_t)v7, (uint64_t)&unk_1EE8FE4C0, (uint64_t)v11);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

@end
