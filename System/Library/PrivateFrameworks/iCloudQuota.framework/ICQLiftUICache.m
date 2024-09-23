@implementation ICQLiftUICache

+ (ICQLiftUICache)sharedCache
{
  if (qword_1ED2B9C60 != -1)
    swift_once();
  return (ICQLiftUICache *)(id)swift_retain();
}

- (void)cacheResponseFromURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE v8[16];
  ICQLiftUICache *v9;
  _BYTE *v10;

  v4 = sub_1CDF32A00();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v8[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1CDF329D0();
  sub_1CDF32B68();
  v9 = self;
  v10 = v7;
  swift_retain();
  sub_1CDF32B50();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)fetchResponseForURL:(NSURL *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSURL *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EFA5AF00;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EFA5AF10;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1CDF24FC4((uint64_t)v9, (uint64_t)&unk_1EFA5AF20, (uint64_t)v14);
  swift_release();
}

- (void)discardCaches
{
  sub_1CDF32B68();
  swift_retain();
  sub_1CDF32B50();
  swift_release();
}

@end
