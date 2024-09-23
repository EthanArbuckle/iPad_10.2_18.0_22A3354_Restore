@implementation _SEServiceManager

+ (id)sharedInstance
{
  if (qword_25751C200 != -1)
    swift_once();
  return (id)qword_25751C780;
}

- (void)gpuProcessWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  _SEServiceManager *v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C368);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = sub_245DC4D18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = sub_245DB3C38;
  v12[6] = v10;
  v13 = a3;
  v14 = self;
  swift_retain();
  sub_245DB9934((uint64_t)v8, (uint64_t)&unk_25751C3E0, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)networkProcessWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  _SEServiceManager *v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C368);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = sub_245DC4D18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = sub_245DB3C20;
  v12[6] = v10;
  v13 = a3;
  v14 = self;
  swift_retain();
  sub_245DB9934((uint64_t)v8, (uint64_t)&unk_25751C400, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)contentProcessWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  _SEServiceManager *v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C368);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = sub_245DC4D18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = sub_245DB3C20;
  v12[6] = v10;
  v13 = a3;
  v14 = self;
  swift_retain();
  sub_245DB9934((uint64_t)v8, (uint64_t)&unk_25751C410, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (_SEServiceManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _SEServiceManager();
  return -[_SEServiceManager init](&v3, sel_init);
}

@end
