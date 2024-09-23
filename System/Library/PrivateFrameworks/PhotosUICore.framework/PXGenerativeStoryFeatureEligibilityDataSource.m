@implementation PXGenerativeStoryFeatureEligibilityDataSource

+ (void)generateFeatureEligibilityStateUsingProcessingAvailabilityReporter:(PHPhotoLibraryFeatureAvailabilityReporter *)a3 photoLibrary:(PHPhotoLibrary *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  PHPhotoLibraryFeatureAvailabilityReporter *v17;
  PHPhotoLibrary *v18;
  uint64_t v19;

  sub_1A67ECCF8(0, (unint64_t *)&qword_1EE8D9360, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - v10;
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  v14 = sub_1A7AE3BD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE8E2368;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE8E2370;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_1A6A7BFAC((uint64_t)v11, (uint64_t)&unk_1EE8E2378, (uint64_t)v16);
  swift_release();
}

+ (void)renderImageWithFeatureAvailability:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  swift_getObjCClassMetadata();
  v7 = a3;
  sub_1A6A7B948(a3, (uint64_t)sub_1A6A7D9DC, v6);

  swift_release();
}

+ (id)fullDescriptionWithFeatureEligibilityState:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_1A6A7CBCC((uint64_t)v3);

  return v4;
}

- (PXGenerativeStoryFeatureEligibilityDataSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeStoryFeatureEligibilityDataSource();
  return -[PXGenerativeStoryFeatureEligibilityDataSource init](&v3, sel_init);
}

@end
