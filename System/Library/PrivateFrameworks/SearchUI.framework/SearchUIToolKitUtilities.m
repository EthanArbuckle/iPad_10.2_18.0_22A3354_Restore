@implementation SearchUIToolKitUtilities

+ (void)performOpenIntentForAnnotation:(SFAppEntityAnnotation *)a3 bundleId:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  SFAppEntityAnnotation *v17;
  NSString *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4410);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  v14 = sub_1DAE0D650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1F029DA18;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1F029DA20;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_1DADFDE48((uint64_t)v11, (uint64_t)&unk_1F029DA28, (uint64_t)v16);
  swift_release();
}

- (SearchUIToolKitUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIToolKitUtilities;
  return -[SearchUIToolKitUtilities init](&v3, sel_init);
}

@end
