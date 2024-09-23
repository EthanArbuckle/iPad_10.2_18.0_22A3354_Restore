@implementation PhotosViewPersonBannerController

- (void)photosBannerProviderInvalidateLoadedBanner:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  sub_1A67ECD50(0, (unint64_t *)&qword_1EE8D9360, (void (*)(uint64_t))MEMORY[0x1E0DF0750]);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - v5;
  v7 = sub_1A7AE3BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_1A7AE3B9C();
  swift_retain_n();
  swift_unknownObjectRetain();
  v8 = sub_1A7AE3B90();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x1E0DF06E8];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = self;
  sub_1A686089C((uint64_t)v6, (uint64_t)&unk_1EE8F53A8, (uint64_t)v9);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

@end
