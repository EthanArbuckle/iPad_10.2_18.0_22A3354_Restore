@implementation SUIAppIntentsQueryHelper

- (SUIAppIntentsQueryHelper)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SUIAppIntentsQueryHelper_searchString);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AppIntentsQueryHelper();
  return -[SUIAppIntentsQueryHelper init](&v4, sel_init);
}

- (void)updateSearchString:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSString *v14;
  SUIAppIntentsQueryHelper *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254124FF0);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = sub_2217DF0F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_255709928;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_255709938;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_2217DA95C((uint64_t)v8, (uint64_t)&unk_255709948, (uint64_t)v13);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
