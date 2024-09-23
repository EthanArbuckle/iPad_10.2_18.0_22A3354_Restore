@implementation _PKDistributedAppLauncher

+ (void)launchAppWithDistributorBundleID:(id)a3 itemID:(unint64_t)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49E4F0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = sub_19DE87BF4();
  v14 = v13;
  if (v11)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v11;
    v11 = sub_19D2A2A84;
  }
  else
  {
    v15 = 0;
  }
  v16 = sub_19DE87F30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v12;
  v17[5] = v14;
  v17[6] = a4;
  v17[7] = v11;
  v17[8] = v15;
  sub_19DE82F08();
  sub_19D1A9EC4((uint64_t)v11);
  sub_19D2060BC((uint64_t)v10, (uint64_t)&unk_1EE4B3548, (uint64_t)v17);
  swift_release();
  sub_19D1A9F60((uint64_t)v11);
  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI25_PKDistributedAppLauncher)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _PKDistributedAppLauncher();
  return -[_PKDistributedAppLauncher init](&v3, sel_init);
}

@end
