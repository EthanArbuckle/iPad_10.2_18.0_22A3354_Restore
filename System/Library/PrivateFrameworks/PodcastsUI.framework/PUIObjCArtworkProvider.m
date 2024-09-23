@implementation PUIObjCArtworkProvider

+ (PUIObjCArtworkProvider)shared
{
  return (PUIObjCArtworkProvider *)sub_1DA56E7A4((uint64_t)a1, (uint64_t)a2, qword_1EDADECC8, (id *)&qword_1EDADF970);
}

- (void)migrateLibraryArtworkFromImageStoreWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  PUIObjCArtworkProvider *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F026B030;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F026B8B0;
  v12[5] = v11;
  v13 = self;
  sub_1DA527E84((uint64_t)v7, (uint64_t)&unk_1F026B040, (uint64_t)v12);
  swift_release();
}

+ (PUIObjCArtworkProvider)uiShared
{
  return (PUIObjCArtworkProvider *)sub_1DA56E7A4((uint64_t)a1, (uint64_t)a2, qword_1F0268550, (id *)&qword_1F026AF28);
}

- (void)cacheArtwork:(id)a3 withDimension:(CGRect)a4 forShow:(id)a5 fromSource:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  PUIObjCArtworkProvider *v16;
  _QWORD v17[2];

  v8 = type metadata accessor for PreparedArtworkRequest();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1DA66F8BC();
  v12 = sub_1DA66F8BC();
  v14 = v13;
  v17[1] = a3;
  v15 = a3;
  v16 = self;
  sub_1DA572920(v11, v12, v14, (uint64_t)v10);
  sub_1DA4ED950();
  sub_1DA66CF10();
  sub_1DA47F880((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for PreparedArtworkRequest);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)hasArtworkForShow:(id)a3 withDimensions:(CGRect)a4 fromSource:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PUIObjCArtworkProvider *v13;
  uint64_t v15;

  v6 = type metadata accessor for PreparedArtworkRequest();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DA66F8BC();
  v10 = sub_1DA66F8BC();
  v12 = v11;
  v13 = self;
  sub_1DA572920(v9, v10, v12, (uint64_t)v8);
  sub_1DA4ED950();
  LOBYTE(v10) = sub_1DA66CEF8();
  sub_1DA47F880((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for PreparedArtworkRequest);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (void)artworkForShow:(NSString *)a3 size:(CGSize)a4 source:(NSString *)a5 completionHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  CGFloat *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSString *v20;
  NSString *v21;
  PUIObjCArtworkProvider *v22;
  uint64_t v23;

  height = a4.height;
  width = a4.width;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v16 + 2) = a3;
  v16[3] = width;
  v16[4] = height;
  *((_QWORD *)v16 + 5) = a5;
  *((_QWORD *)v16 + 6) = v15;
  *((_QWORD *)v16 + 7) = self;
  v17 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1F026B130;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1F026B138;
  v19[5] = v18;
  v20 = a3;
  v21 = a5;
  v22 = self;
  sub_1DA527E84((uint64_t)v14, (uint64_t)&unk_1F026B140, (uint64_t)v19);
  swift_release();
}

- (void)artworkForShow:(NSString *)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSString *v18;
  PUIObjCArtworkProvider *v19;
  uint64_t v20;

  height = a4.height;
  width = a4.width;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((_QWORD *)v14 + 5) = v13;
  *((_QWORD *)v14 + 6) = self;
  v15 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1F026B110;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1F026B118;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1DA527E84((uint64_t)v12, (uint64_t)&unk_1F026B120, (uint64_t)v17);
  swift_release();
}

- (void)keyedArtworkForShow:(NSString *)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSString *v18;
  PUIObjCArtworkProvider *v19;
  uint64_t v20;

  height = a4.height;
  width = a4.width;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((_QWORD *)v14 + 5) = v13;
  *((_QWORD *)v14 + 6) = self;
  v15 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1F026B0F0;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1F026B0F8;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1DA527E84((uint64_t)v12, (uint64_t)&unk_1F026B100, (uint64_t)v17);
  swift_release();
}

- (void)artworkPathForShow:(NSString *)a3 size:(CGSize)a4 source:(NSString *)a5 completionHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  CGFloat *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSString *v20;
  NSString *v21;
  PUIObjCArtworkProvider *v22;
  uint64_t v23;

  height = a4.height;
  width = a4.width;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v16 + 2) = a3;
  v16[3] = width;
  v16[4] = height;
  *((_QWORD *)v16 + 5) = a5;
  *((_QWORD *)v16 + 6) = v15;
  *((_QWORD *)v16 + 7) = self;
  v17 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1F026B0D0;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1F026B0D8;
  v19[5] = v18;
  v20 = a3;
  v21 = a5;
  v22 = self;
  sub_1DA527E84((uint64_t)v14, (uint64_t)&unk_1F026B0E0, (uint64_t)v19);
  swift_release();
}

- (void)artworkPathForShow:(NSString *)a3 size:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSString *v18;
  PUIObjCArtworkProvider *v19;
  uint64_t v20;

  height = a4.height;
  width = a4.width;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((_QWORD *)v14 + 5) = v13;
  *((_QWORD *)v14 + 6) = self;
  v15 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1F026B0B0;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1F026B0B8;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1DA527E84((uint64_t)v12, (uint64_t)&unk_1F026B0C0, (uint64_t)v17);
  swift_release();
}

- (id)legacyUICachedArtworkForPodcastUuid:(id)a3 withSize:(CGSize)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PUIObjCArtworkProvider *v15;
  id v17[2];

  v5 = sub_1DA66CEBC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreparedArtworkRequest();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DA66F8BC();
  v14 = v13;
  v15 = self;
  sub_1DA573098(v12, v14, (uint64_t)v8);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v8, v5);
  sub_1DA4ED950();
  sub_1DA66CF04();
  sub_1DA47F880((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for PreparedArtworkRequest);
  swift_bridgeObjectRelease();

  return v17[0];
}

- (id)cachedArtworkForMTPodcast:(id)a3 withSize:(CGSize)a4
{
  id v5;
  PUIObjCArtworkProvider *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1DA571140();

  return v7;
}

- (void)artworkForMTPodcast:(MTPodcast *)a3 withSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  MTPodcast *v18;
  PUIObjCArtworkProvider *v19;
  uint64_t v20;

  height = a4.height;
  width = a4.width;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((_QWORD *)v14 + 5) = v13;
  *((_QWORD *)v14 + 6) = self;
  v15 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1F026B090;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1F026B098;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1DA527E84((uint64_t)v12, (uint64_t)&unk_1F026B0A0, (uint64_t)v17);
  swift_release();
}

- (void)artworkForURL:(NSString *)a3 withSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  NSString *v18;
  PUIObjCArtworkProvider *v19;
  uint64_t v20;

  height = a4.height;
  width = a4.width;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((_QWORD *)v14 + 5) = v13;
  *((_QWORD *)v14 + 6) = self;
  v15 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1F026B070;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1F026B078;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  sub_1DA527E84((uint64_t)v12, (uint64_t)&unk_1F026B080, (uint64_t)v17);
  swift_release();
}

- (void)placeholderWithSize:(CGSize)a3 completionHandler:(id)a4
{
  CGFloat height;
  CGFloat width;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  CGFloat *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  PUIObjCArtworkProvider *v16;
  uint64_t v17;

  height = a3.height;
  width = a3.width;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (CGFloat *)swift_allocObject();
  v12[2] = width;
  v12[3] = height;
  *((_QWORD *)v12 + 4) = v11;
  *((_QWORD *)v12 + 5) = self;
  v13 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1F026B050;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1F026B058;
  v15[5] = v14;
  v16 = self;
  sub_1DA527E84((uint64_t)v10, (uint64_t)&unk_1F026B060, (uint64_t)v15);
  swift_release();
}

- (PUIObjCArtworkProvider)init
{
  PUIObjCArtworkProvider *result;

  result = (PUIObjCArtworkProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIObjCArtworkProvider_backingProvider);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIObjCArtworkProvider_bucketingStrategy);

}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 1;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4;
  PUIObjCArtworkProvider *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = ObjCArtworkProvider.existingRepresentation(for:)(v4);

  return v6;
}

- (void)loadRepresentationForArtworkCatalog:(MPArtworkCatalog *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  MPArtworkCatalog *v15;
  PUIObjCArtworkProvider *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1DA66FB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1F026B8A0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1F026B8B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1DA527E84((uint64_t)v9, (uint64_t)&unk_1F026B040, (uint64_t)v14);
  swift_release();
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  PUIObjCArtworkProvider *v4;
  PUIObjCArtworkProvider *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v4 = (PUIObjCArtworkProvider *)a3;
  v5 = self;
  sub_1DA58D7B4(v4);
  v7 = v6;
  if (v6)
  {
    v8 = objc_allocWithZone(MEMORY[0x1E0D7F290]);
    v9 = sub_1DA66F88C();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v8, sel_initWithArtworkIdentifier_, v9);

    v4 = v5;
    v5 = (PUIObjCArtworkProvider *)v9;
  }

  return v7;
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  id v7;
  PUIObjCArtworkProvider *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v7 = a4;
  v8 = self;
  if (a3 == 1 && (v9 = sub_1DA58D920(v7)) != 0)
  {
    v10 = v9;
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CC2490]), sel_init);
    objc_msgSend(v11, sel_setBackgroundColor_, v10);
    v12 = sub_1DA58DA40();
    v17 = v12;

    v16[0] = v11;
  }
  else
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE5130);
    v17 = v12;
    v13 = swift_allocObject();
    v16[0] = v13;
    *(_OWORD *)(v13 + 16) = 0u;
    *(_OWORD *)(v13 + 32) = 0u;

  }
  __swift_project_boxed_opaque_existential_1(v16, v12);
  v14 = (void *)sub_1DA6706C0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  return v14;
}

@end
