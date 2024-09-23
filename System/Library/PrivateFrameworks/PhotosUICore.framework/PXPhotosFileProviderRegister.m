@implementation PXPhotosFileProviderRegister

+ (NSString)urlQueryItemUUIDKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE9945F0);
}

+ (NSString)urlQueryItemIdentifierCodeKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE9945F8);
}

+ (NSString)urlQueryItemLibraryIdentifierKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE994600);
}

+ (NSString)urlQueryItemItemTypeKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE994608);
}

+ (NSString)urlQueryItemClientEncodingPolicyKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE994610);
}

+ (NSString)urlQueryItemDownscalingTargetDimensionKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE994618);
}

+ (NSString)urlQueryItemIncludeLocationKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE994620);
}

+ (NSString)urlQueryItemIncludeCaptionKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE994628);
}

+ (NSString)urlQueryItemThumbnailSizeKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, &qword_1EE994630);
}

+ (NSString)urlQueryItemVideoPresetKey
{
  return (NSString *)sub_1A6848288((uint64_t)a1, (uint64_t)a2, qword_1EE994638);
}

- (PXPhotosFileProviderRegister)initWithConfiguration:(id)a3 fileProviderManager:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v12;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegister_configuration) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegister_fileProviderManager) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegister_domain) = (Class)a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PhotosFileProviderRegister();
  v8 = a3;
  v9 = a4;
  v10 = a5;
  return -[PXPhotosFileProviderRegister init](&v12, sel_init);
}

- (id)registerFileRepresentationsWithItemProvider:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  PXPhotosFileProviderRegister *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A71D3D14(v6, v7);

  sub_1A7ADC8A0();
  v9 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)registerFolderRepresentationWithItemProvider:(id)a3 object:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  PXPhotosFileProviderRegister *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  sub_1A68D2808();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1A71D4EE4(v10, v11, (uint64_t)v9);

  v13 = sub_1A7ADC8A0();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) != 1)
  {
    v15 = (void *)sub_1A7ADC7C8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  }
  return v15;
}

- (id)registeredFolderRepresentationWithObject:(id)a3
{
  id v4;
  PXPhotosFileProviderRegister *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1A71D5684(v4);

  return v6;
}

- (id)registeredFileRepresentationsWithAsset:(id)a3
{
  id v4;
  PXPhotosFileProviderRegister *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1A71D58D4(v4);

  type metadata accessor for PhotosFileProviderRegister.FileRepresentation(0);
  v6 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return v6;
}

+ (BOOL)canRegisterFileRepresentationsFor:(id)a3 contentType:(id)a4 configuration:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  _BYTE v17[16];
  _BYTE *v18;

  v8 = sub_1A7ADFE1C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  sub_1A7ADFD74();

  sub_1A71DAF58(v12, v14);
  v18 = v11;
  LOBYTE(a4) = sub_1A71DCF70(v15, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD))sub_1A71DCF2C);

  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
  return a4 & 1;
}

- (id)registeredFileRepresentationWithContentType:(id)a3 uuid:(id)a4 identifierCode:(id)a5 libraryIdentifier:(id)a6 itemType:(unint64_t)a7 encodingPolicy:(int64_t)a8 hasLimitedVisibility:(BOOL)a9
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PXPhotosFileProviderRegister *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;

  v34 = (_QWORD *)a8;
  v35 = a7;
  HIDWORD(v33) = a9;
  v36 = sub_1A7ADFE1C();
  v14 = *(_QWORD *)(v36 - 8);
  MEMORY[0x1E0C80A78](v36);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = self;
  sub_1A7ADFD74();

  v22 = sub_1A7AE3764();
  v24 = v23;

  v25 = sub_1A7AE3764();
  v27 = v26;

  v28 = sub_1A7AE3764();
  v30 = v29;

  v31 = sub_1A71D5F38((uint64_t)v16, v22, v24, v25, v27, v28, v30, v35, v34, BYTE4(v33));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v36);
  return v31;
}

- (PXPhotosFileProviderRegister)init
{
  PXPhotosFileProviderRegister *result;

  result = (PXPhotosFileProviderRegister *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
