@implementation TLKAsyncCache

- (TLKAsyncCache)init
{
  return (TLKAsyncCache *)TLKAsyncCache.init()();
}

- (id)getCachedObjectIfAvailableForKey:(id)a3
{
  id v4;
  TLKAsyncCache *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1AC77C9DC(v4);

  return v6;
}

- (void)getObjectForKey:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)();
  uint64_t v10;
  id v11;
  TLKAsyncCache *v12;
  unint64_t v13;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v7;
    v9 = sub_1AC783A3C;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97290);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1AC789B20;
  *(_QWORD *)(v10 + 32) = a3;
  v13 = v10;
  sub_1AC784630();
  v11 = a3;
  sub_1AC782AA8((uint64_t)v9);
  v12 = self;
  sub_1AC781778(v13, (char *)v12, (void (*)(void))v9, v8);
  sub_1AC783A00((uint64_t)v9);
  swift_bridgeObjectRelease();
  sub_1AC783A00((uint64_t)v9);

}

- (void)getObjectsForKeys:(id)a3 completionHandler:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *);
  TLKAsyncCache *v10;

  v5 = _Block_copy(a4);
  sub_1AC783994();
  v6 = sub_1AC784618();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v8 = swift_allocObject();
    v5 = sub_1AC783A34;
    *(_QWORD *)(v8 + 16) = sub_1AC783A34;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = (void (*)(uint64_t *))sub_1AC7845A4;
  }
  else
  {
    v8 = 0;
    v9 = (void (*)(uint64_t *))nullsub_1;
  }
  swift_retain();
  v10 = self;
  sub_1AC782AA8((uint64_t)v5);
  sub_1AC782110(v6, (char *)v10, v9, v8);
  swift_release_n();
  sub_1AC783A00((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)clear
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  TLKAsyncCache *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97298);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1AC7846F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_1AC7846CC();
  v8 = self;
  v9 = sub_1AC7846C0();
  v10 = (_QWORD *)swift_allocObject();
  v11 = MEMORY[0x1E0DF06E8];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = v8;
  sub_1AC77D810((uint64_t)v6, (uint64_t)&unk_1EEC97860, (uint64_t)v10);

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)computeObjectForKey:(NSObject *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSObject *v16;
  TLKAsyncCache *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97298);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_1AC7846F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EEC97828;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EEC97838;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1AC77E548((uint64_t)v10, (uint64_t)&unk_1EEC97848, (uint64_t)v15);
  swift_release();
}

@end
