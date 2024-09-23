@implementation PXGPersonTextureProvider

- (PXGPersonTextureProvider)init
{
  return (PXGPersonTextureProvider *)PersonTextureProvider.init()();
}

- (void)viewEnvironmentDidChange:(id)a3
{
  PXGPersonTextureProvider *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A6847DBC(a3);

}

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  id v12;
  PXGPersonTextureProvider *v13;
  char *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  v12 = a7;
  v13 = self;
  v14 = sub_1A6896EBC(*(_QWORD *)&a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v12);
  v16 = v15;

  v17 = (NSUInteger)v14;
  v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

- (void)cancelTextureRequests:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  PXGPersonTextureProvider *v18;
  void *v19;
  objc_class *v20;
  objc_super v21;

  sub_1A67ECCF8(0, (unint64_t *)&qword_1EE8D9360, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v21 - v5;
  v7 = sub_1A7ADCC0C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v21 - v12;
  sub_1A7ADCBA0();
  v14 = sub_1A7AE3BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v6, 1, 1, v14);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v16 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_QWORD *)v17 + 4) = v15;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v17[v16], v11, v7);
  v18 = self;
  sub_1A6897A44((uint64_t)v6, (uint64_t)&unk_1EE8DABE8, (uint64_t)v17);
  swift_release();
  v19 = (void *)sub_1A7ADCB7C();
  v20 = (objc_class *)type metadata accessor for PersonTextureProvider();
  v21.receiver = v18;
  v21.super_class = v20;
  -[PXGTextureProvider cancelTextureRequests:](&v21, sel_cancelTextureRequests_, v19);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void).cxx_destruct
{
  sub_1A689AA4C(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR___PXGPersonTextureProvider____lazy_storage___requestIDController));

}

@end
