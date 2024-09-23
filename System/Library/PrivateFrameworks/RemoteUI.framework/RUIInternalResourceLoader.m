@implementation RUIInternalResourceLoader

- (void)loadWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  RUIInternalResourceLoader *v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545BB428);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = self;
  v11 = sub_209F674B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2545BB438;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2545BB448;
  v13[5] = v12;
  v14 = self;
  sub_209EFE54C((uint64_t)v8, (uint64_t)&unk_2545BB458, (uint64_t)v13);
  swift_release();
}

+ (RUIInternalResourceLoader)shared
{
  if (qword_2545BEC70 != -1)
    swift_once();
  return (RUIInternalResourceLoader *)(id)qword_2545BEC78;
}

- (RUIInternalResourceLoader)init
{
  return (RUIInternalResourceLoader *)InternalResourceLoader.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR___RUIInternalResourceLoader___observationRegistrar;
  v4 = sub_209F66B50();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
