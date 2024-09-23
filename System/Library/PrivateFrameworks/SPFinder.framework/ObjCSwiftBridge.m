@implementation ObjCSwiftBridge

+ (void)bootstrapWithContext:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSString *v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DEB078);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  v11 = sub_2159121E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_254DEB088;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_254DEB098;
  v13[5] = v12;
  v14 = a3;
  sub_215911A28((uint64_t)v8, (uint64_t)&unk_254DEB0A8, (uint64_t)v13);
  swift_release();
}

- (_TtC8SPFinder15ObjCSwiftBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ObjCSwiftBridge();
  return -[ObjCSwiftBridge init](&v3, sel_init);
}

@end
