@implementation PMPasswordManager

- (void)accountStoreDidChange
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572B59C0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2438504A4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_243850480();
  swift_retain_n();
  v7 = sub_243850474();
  v8 = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = self;
  sub_2436AE150((uint64_t)v5, (uint64_t)&unk_2572BDB48, (uint64_t)v8);
  swift_release();
  swift_release();
}

@end
