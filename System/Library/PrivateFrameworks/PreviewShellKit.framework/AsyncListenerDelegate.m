@implementation AsyncListenerDelegate

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _TtC15PreviewShellKit21AsyncListenerDelegate *v15;
  id v16;
  id v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25737D0D0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_244795220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a5;
  v14 = a4;
  swift_unknownObjectRetain_n();
  v15 = self;
  v16 = v14;
  v17 = a3;
  sub_244713B34((uint64_t)v11, (uint64_t)&unk_25737E600, (uint64_t)v13);

  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC15PreviewShellKit21AsyncListenerDelegate)init
{
  _TtC15PreviewShellKit21AsyncListenerDelegate *result;

  result = (_TtC15PreviewShellKit21AsyncListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
