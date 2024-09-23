@implementation ServiceProvider

- (void)legacyStorytellingServiceAt:(id)a3 reply:(id)a4
{
  sub_1CAC43374((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E8517E78, (uint64_t)sub_1CAC46F14, (void (*)(char *, uint64_t, uint64_t))sub_1CAC42138);
}

- (void)photoLibraryServiceAt:(id)a3 reply:(id)a4
{
  sub_1CAC43374((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E8517DB0, (uint64_t)sub_1CAC473B4, (void (*)(char *, uint64_t, uint64_t))sub_1CAC42568);
}

- (void)momentGraphServiceAt:(id)a3 reply:(id)a4
{
  sub_1CAC43374((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E8517CE8, (uint64_t)sub_1CAC473B4, (void (*)(char *, uint64_t, uint64_t))sub_1CAC427CC);
}

- (void)testServiceAt:(id)a3 reply:(id)a4
{
  sub_1CAC43374((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E8517C20, (uint64_t)sub_1CAC4683C, (void (*)(char *, uint64_t, uint64_t))sub_1CAC42A84);
}

- (void)executiveServiceAt:(id)a3 reply:(id)a4
{
  sub_1CAC43374((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E8517B58, (uint64_t)sub_1CAC473B4, (void (*)(char *, uint64_t, uint64_t))sub_1CAC42CF0);
}

- (void)wallpaperServiceAt:(id)a3 reply:(id)a4
{
  sub_1CAC43374((int)self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E8517A90, (uint64_t)sub_1CAC473B4, (void (*)(char *, uint64_t, uint64_t))sub_1CAC43030);
}

- (void)notifyLibraryAvailableAtURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_1CADC2AD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CADC2A8C();
  swift_retain();
  sub_1CAC434C0((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
