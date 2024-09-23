@implementation MTCoreDataKeyRequestStorage

- (MTCoreDataKeyRequestStorage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreDataKeyRequestStorage();
  return -[MTCoreDataKeyRequestStorage init](&v3, sel_init);
}

- (BOOL)saveKeyDataFor:(id)a3
{
  char *v3;
  id v5;
  MTCoreDataKeyRequestStorage *v6;

  v3 = (char *)a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_1A92D73F0(v3);

  return v3 & 1;
}

- (void)saveKeyDataWithKeyIdentifier:(id)a3 storeTrackID:(int64_t)a4 keyData:(id)a5 renewalDate:(id)a6 dsid:(int64_t)a7 responseQueue:(id)a8 completion:(id)a9
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  MTCoreDataKeyRequestStorage *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = a4;
  v29 = a7;
  v13 = sub_1A93F738C();
  v30 = *(_QWORD *)(v13 - 8);
  v31 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a9);
  v17 = sub_1A93F8040();
  v19 = v18;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v23 = self;
  v24 = sub_1A93F72B4();
  v26 = v25;

  sub_1A93F7368();
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v16;
  sub_1A92D7D98(v17, v19, v28, v24, v26, (uint64_t)v15, v29, v22, (uint64_t)sub_1A92DB4E8, v27);
  swift_release();
  sub_1A905F180(v24, v26);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v31);
}

- (void)removeKeyDataFor:(id)a3
{
  id v5;
  MTCoreDataKeyRequestStorage *v6;

  v5 = a3;
  v6 = self;
  sub_1A92D8424((uint64_t)a3);

}

- (void)removeKeyDataForStoreTrackID:(int64_t)a3
{
  MTCoreDataKeyRequestStorage *v4;

  v4 = self;
  sub_1A92D8864(a3);

}

- (void)removeAllKeyDataWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  MTCoreDataKeyRequestStorage *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A92DB134((uint64_t)sub_1A90D7FF8, v5);

  swift_release();
}

- (id)retrieveKeyDataFor:(id)a3
{
  id v5;
  MTCoreDataKeyRequestStorage *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = self;
  sub_1A92D8F1C(a3);
  v8 = v7;

  return v8;
}

- (BOOL)keyExistsInStorageFor:(int64_t)a3
{
  MTCoreDataKeyRequestStorage *v4;

  v4 = self;
  LOBYTE(a3) = sub_1A92D994C(a3);

  return a3 & 1;
}

- (void)markOfflineKeyFor:(int64_t)a3 pendingDeletion:(BOOL)a4
{
  MTCoreDataKeyRequestStorage *v6;

  v6 = self;
  sub_1A92D9B0C(a3, a4);

}

@end
