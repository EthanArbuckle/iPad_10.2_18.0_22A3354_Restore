@implementation ICSHomeDataController

- (ICSHomeDataController)initWithAccount:(id)a3
{
  return -[ICSHomeDataController initWithAccount:launchedFromRootLevel:](self, sel_initWithAccount_launchedFromRootLevel_, a3, 1);
}

- (ICSHomeDataController)initWithAccount:(id)a3 launchedFromRootLevel:(BOOL)a4
{
  id v5;
  ICSHomeDataController *v6;

  v5 = a3;
  v6 = (ICSHomeDataController *)sub_24B57DD04(v5, a4);

  return v6;
}

- (void)fetchiCloudHomeDataModelAllowingCache:(BOOL)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  ICSHomeDataController *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25799C350;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25799C358;
  v14[5] = v13;
  v15 = self;
  sub_24B57DBC0((uint64_t)v9, (uint64_t)&unk_25799C360, (uint64_t)v14);
  swift_release();
}

- (void)fetchCloudStorage:(BOOL)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  ICSHomeDataController *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25799C320;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_257999560;
  v14[5] = v13;
  v15 = self;
  sub_24B57DBC0((uint64_t)v9, (uint64_t)&unk_257999568, (uint64_t)v14);
  swift_release();
}

- (id)cachediCloudHomeDataModel
{
  uint64_t v2;
  ICSHomeDataController *v3;
  id result;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = qword_2544D8D48;
  v3 = self;
  if (v2 != -1)
    swift_once();
  result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v3->super.isa
                                                                 + OBJC_IVAR___ICSHomeDataController_account), sel_aa_altDSID));
  if (result)
  {
    v5 = result;
    v6 = sub_24B5E42F0();
    v8 = v7;

    v9 = sub_24B5273C4(v6, v8);
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)fetchCloudStorageInfo:(BOOL)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ICSHomeDataController *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = sub_24B57E430;
  }
  else
  {
    v11 = 0;
  }
  v12 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  *(_QWORD *)(v13 + 32) = self;
  *(_BYTE *)(v13 + 40) = a3;
  *(_QWORD *)(v13 + 48) = v10;
  *(_QWORD *)(v13 + 56) = v11;
  v14 = self;
  sub_24B57DF34((uint64_t)v10);
  sub_24B500D48((uint64_t)v9, (uint64_t)&unk_25799C310, v13);
  swift_release();
  sub_24B52FEBC((uint64_t)v10);

}

- (void)reportStatefulHeaderImpressionWithUrl:(id)a3 payload:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  ICSHomeDataController *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  ICSHomeDataController *v21;
  uint64_t v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24B5E2FF4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v22 - v13;
  sub_24B5E2FC4();
  v15 = sub_24B5E4290();
  v16 = self;
  sub_24B5E4434();
  v17 = sub_24B5E4464();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v7, 0, 1, v17);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  v18 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v19 = (v10 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = (char *)swift_allocObject();
  *((_QWORD *)v20 + 2) = 0;
  *((_QWORD *)v20 + 3) = 0;
  *((_QWORD *)v20 + 4) = v16;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v20[v18], v12, v8);
  *(_QWORD *)&v20[v19] = v15;
  v21 = v16;
  swift_bridgeObjectRetain();
  sub_24B500D48((uint64_t)v7, (uint64_t)&unk_25799C308, (uint64_t)v20);
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

- (ICSHomeDataController)init
{
  ICSHomeDataController *result;

  result = (ICSHomeDataController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
