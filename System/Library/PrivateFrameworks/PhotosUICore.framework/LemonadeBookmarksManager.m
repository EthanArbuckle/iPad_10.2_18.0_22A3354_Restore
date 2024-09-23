@implementation LemonadeBookmarksManager

- (void)preferencesDidChange
{
  Class isa;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  isa = self->super.isa;
  sub_1A67ECCF8(0, (unint64_t *)&qword_1EE8D9360, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - v4;
  v6 = sub_1A7AE3BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = swift_allocObject();
  swift_weakInit();
  sub_1A7AE3B9C();
  sub_1A7ADBF34();
  sub_1A7ADBF34();
  v8 = sub_1A7AE3B90();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x1E0DF06E8];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  v9[5] = isa;
  swift_release();
  sub_1A686089C((uint64_t)v5, (uint64_t)&unk_1EE8EF1E0, (uint64_t)v9);
  swift_release();
  swift_release();
}

@end
