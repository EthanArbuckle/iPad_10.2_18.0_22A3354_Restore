@implementation PKAppIntentUIUtilities

+ (void)annotateView:(id)a3 withEntityForPass:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  _OWORD v13[4];
  uint64_t v14;
  _OWORD v15[4];
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494FF0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v10 = a4;
    v11 = a3;
    sub_19D2CC9E8(v10, 0, 0xF000000000000000, (uint64_t *)v15);
    v13[2] = v15[2];
    v13[3] = v15[3];
    v14 = v16;
    v13[0] = v15[0];
    v13[1] = v15[1];
    sub_19D19F9B8(v15);
    sub_19D19FA84();
    sub_19DE82C68();
    v12 = sub_19DE82C74();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 0, 1, v12);
    sub_19DE882FC();
    sub_19D19FAC8((uint64_t)v15);

  }
}

+ (void)annotateView:(id)a3 withEntityForTransaction:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  _OWORD v13[4];
  uint64_t v14;
  _OWORD v15[4];
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494FF0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a4;
  v11 = a3;
  sub_19D570BA4(v10, (uint64_t *)v15);
  v13[2] = v15[2];
  v13[3] = v15[3];
  v14 = v16;
  v13[0] = v15[0];
  v13[1] = v15[1];
  sub_19D19FB98((uint64_t)v15);
  sub_19D19FC20();
  sub_19DE82C68();
  v12 = sub_19DE82C74();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 0, 1, v12);
  sub_19DE882FC();
  sub_19D19FC64((uint64_t)v15);

}

- (PKAppIntentUIUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppIntentUIUtilities();
  return -[PKAppIntentUIUtilities init](&v3, sel_init);
}

@end
