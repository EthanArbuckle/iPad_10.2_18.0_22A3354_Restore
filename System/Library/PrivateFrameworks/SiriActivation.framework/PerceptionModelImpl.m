@implementation PerceptionModelImpl

- (void)performQuery:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC5A4B0);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = sub_1D1372F2C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EFC5A4C0;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EFC5A4D0;
  v13[5] = v12;
  swift_retain();
  sub_1D136FE58((uint64_t)v8, (uint64_t)&unk_1EFC5A4E0, (uint64_t)v13);
  swift_release();
}

@end
