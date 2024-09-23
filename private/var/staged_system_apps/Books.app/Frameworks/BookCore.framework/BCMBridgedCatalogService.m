@implementation BCMBridgedCatalogService

+ (BCMBridgedCatalogService)sharedInstance
{
  if (qword_30AB20 != -1)
    swift_once(&qword_30AB20, sub_19BF90);
  return (BCMBridgedCatalogService *)(id)qword_30C8F0;
}

- (void)fetchStoreURLForAdamID:(NSString *)a3 type:(int64_t)a4 metadata:(BFMRequestMetadata *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  BFMRequestMetadata *v20;
  BCMBridgedCatalogService *v21;
  uint64_t v22;
  uint64_t v23;

  v11 = sub_16B968(&qword_30C8A0);
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_2951B0, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_2951D8, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_30CAE8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_295200, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_30CAF0;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  v22 = sub_19FFA0((uint64_t)v13, (uint64_t)&unk_30CAF8, (uint64_t)v18);
  swift_release(v22);
}

- (void)fetchStoreURLOfUnknownTypeForAdamID:(NSString *)a3 metadata:(BFMRequestMetadata *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  BFMRequestMetadata *v18;
  BCMBridgedCatalogService *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_16B968(&qword_30C8A0);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_295138, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_295160, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_30CAC8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_295188, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_30CAD0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_19FFA0((uint64_t)v11, (uint64_t)&unk_30CAD8, (uint64_t)v16);
  swift_release(v20);
}

- (BOOL)checkAvailabilityForStoreID:(id)a3 type:(int64_t)a4 metadata:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  BCMBridgedCatalogService *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = a4;
  v8 = type metadata accessor for MResourceType(0);
  v30 = *(_QWORD *)(v8 - 8);
  v31 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MCatalogService(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for MRequestMetadata(0);
  v27 = *(_QWORD *)(v29 - 8);
  __chkstk_darwin(v29);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v19 = v18;
  v20 = a5;
  v21 = self;
  static MRequestMetadata._unconditionallyBridgeFromObjectiveC(_:)(a5);

  if (qword_30AB30 != -1)
    swift_once(&qword_30AB30, sub_19F0F0);
  v22 = sub_178770(v11, (uint64_t)qword_30C910);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v22, v11);
  MResourceType.init(_:)(v28);
  v23 = sub_19F464(v17, v19, (unint64_t)v10, (unint64_t)v16);
  v24 = v23;
  if (v23)

  (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v31);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);

  swift_bridgeObjectRelease(v19);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v29);
  return v24 != 0;
}

- (BCMBridgedCatalogService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MBridgedCatalogService();
  return -[BCMBridgedCatalogService init](&v3, "init");
}

- (void)fetchMixedAssetsWithBookIds:(NSArray *)a3 audiobookIds:(NSArray *)a4 relationships:(NSArray *)a5 views:(NSArray *)a6 additionalParameters:(NSDictionary *)a7 batchSize:(int64_t)a8 metadata:(BFMRequestMetadata *)a9 completionHandler:(id)a10
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  int64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  NSArray *v25;
  NSArray *v26;
  NSArray *v27;
  NSArray *v28;
  NSDictionary *v29;
  BFMRequestMetadata *v30;
  BCMBridgedCatalogService *v31;
  uint64_t v32;
  int64_t v33;
  NSArray *v34;

  v33 = a8;
  v34 = a3;
  v16 = sub_16B968(&qword_30C8A0);
  __chkstk_darwin(v16);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  v20 = (_QWORD *)swift_allocObject(&unk_2950C0, 88, 7);
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v21 = v33;
  v20[6] = a7;
  v20[7] = v21;
  v20[8] = a9;
  v20[9] = v19;
  v20[10] = self;
  v22 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v18, 1, 1, v22);
  v23 = (_QWORD *)swift_allocObject(&unk_2950E8, 48, 7);
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_30CAA0;
  v23[5] = v20;
  v24 = (_QWORD *)swift_allocObject(&unk_295110, 48, 7);
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_30CAA8;
  v24[5] = v23;
  v25 = v34;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v30 = a9;
  v31 = self;
  v32 = sub_19FFA0((uint64_t)v18, (uint64_t)&unk_30CAB0, (uint64_t)v24);
  swift_release(v32);
}

- (void)fetchMixedSeriesWithBookSeriesIds:(NSArray *)a3 audiobookSeriesIds:(NSArray *)a4 relationships:(NSArray *)a5 views:(NSArray *)a6 additionalParameters:(NSDictionary *)a7 batchSize:(int64_t)a8 metadata:(BFMRequestMetadata *)a9 completionHandler:(id)a10
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  int64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  NSArray *v25;
  NSArray *v26;
  NSArray *v27;
  NSArray *v28;
  NSDictionary *v29;
  BFMRequestMetadata *v30;
  BCMBridgedCatalogService *v31;
  uint64_t v32;
  int64_t v33;
  NSArray *v34;

  v33 = a8;
  v34 = a3;
  v16 = sub_16B968(&qword_30C8A0);
  __chkstk_darwin(v16);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  v20 = (_QWORD *)swift_allocObject(&unk_295048, 88, 7);
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v21 = v33;
  v20[6] = a7;
  v20[7] = v21;
  v20[8] = a9;
  v20[9] = v19;
  v20[10] = self;
  v22 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v18, 1, 1, v22);
  v23 = (_QWORD *)swift_allocObject(&unk_295070, 48, 7);
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_30CA78;
  v23[5] = v20;
  v24 = (_QWORD *)swift_allocObject(&unk_295098, 48, 7);
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_30CA80;
  v24[5] = v23;
  v25 = v34;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v30 = a9;
  v31 = self;
  v32 = sub_19FFA0((uint64_t)v18, (uint64_t)&unk_30CA88, (uint64_t)v24);
  swift_release(v32);
}

- (void)fetchResourcesWithAdamIDs:(NSArray *)a3 relationships:(NSArray *)a4 views:(NSArray *)a5 additionalParameters:(NSDictionary *)a6 batchSize:(int64_t)a7 metadata:(BFMRequestMetadata *)a8 completionHandler:(id)a9
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSArray *v24;
  NSArray *v25;
  NSArray *v26;
  NSDictionary *v27;
  BFMRequestMetadata *v28;
  BCMBridgedCatalogService *v29;
  uint64_t v30;
  uint64_t v31;

  v16 = sub_16B968(&qword_30C8A0);
  __chkstk_darwin(v16);
  v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a9);
  v20 = (_QWORD *)swift_allocObject(&unk_294FA8, 80, 7);
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = self;
  v21 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject(&unk_294FD0, 48, 7);
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_30CA30;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject(&unk_294FF8, 48, 7);
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_30C6F0;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a8;
  v29 = self;
  v30 = sub_19FFA0((uint64_t)v18, (uint64_t)&unk_30C8C0, (uint64_t)v23);
  swift_release(v30);
}

@end
