@implementation PGOneUpRelatedRequestHandler

- (PGOneUpRelatedRequestHandler)initWithGraphManager:(id)a3 error:(id *)a4
{
  objc_class *ObjectType;
  id v7;
  PGOneUpRelatedRequestHandler *v8;
  objc_class *v9;
  PGOneUpRelatedRequestHandler *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGOneUpRelatedRequestHandler__graphManager) = 0;
  v7 = a3;
  v8 = self;
  v9 = (objc_class *)objc_msgSend(v7, sel_photoLibrary);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___PGOneUpRelatedRequestHandler_photoLibrary) = v9;

  v12.receiver = v8;
  v12.super_class = ObjectType;
  v10 = -[PGOneUpRelatedRequestHandler init](&v12, sel_init);

  return v10;
}

- (void)requestAssetLocalIdentifiersTakenNearCoordinatesFromAssetLocalIdentifier:(NSString *)a3 error:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  PGOneUpRelatedRequestHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872E00);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1CA85B8E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF94B678;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF94B680;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1CA47A6E8((uint64_t)v9, (uint64_t)&unk_1EF94B688, (uint64_t)v14);
  swift_release();
}

- (void)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(NSString *)a3 error:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  PGOneUpRelatedRequestHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872E00);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1CA85B8E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF94B658;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF94B660;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1CA47A6E8((uint64_t)v9, (uint64_t)&unk_1EF958100, (uint64_t)v14);
  swift_release();
}

- (PGOneUpRelatedRequestHandler)init
{
  PGOneUpRelatedRequestHandler *result;

  result = (PGOneUpRelatedRequestHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
