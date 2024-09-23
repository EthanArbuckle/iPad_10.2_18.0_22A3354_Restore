@implementation PMDeviceProvider

+ (void)fetchListsOfSharingDevicesSeparatedByAvailability:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572B59C0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_2438504A4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2572B9E10;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2572B9228;
  v12[5] = v11;
  sub_24368DF4C((uint64_t)v7, (uint64_t)&unk_2572B9230, (uint64_t)v12);
  swift_release();
}

- (PMDeviceProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMDeviceProvider;
  return -[PMDeviceProvider init](&v3, sel_init);
}

@end
