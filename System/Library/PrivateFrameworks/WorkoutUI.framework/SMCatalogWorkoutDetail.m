@implementation SMCatalogWorkoutDetail

- (int64_t)assetLoadStatus
{
  SMCatalogWorkoutDetail *v2;
  int64_t v3;

  v2 = self;
  v3 = CatalogWorkoutDetailBridge.assetLoadStatus.getter();

  return v3;
}

- (SMCatalogWorkout)workout
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  SMCatalogWorkoutDetail *v7;
  objc_class *v8;
  _BYTE *v9;
  SMCatalogWorkoutDetail *v10;
  objc_super v12;

  v3 = sub_24A778CF8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_24A778E48();
  v8 = (objc_class *)type metadata accessor for CatalogWorkoutBridge();
  v9 = objc_allocWithZone(v8);
  (*(void (**)(_BYTE *, char *, uint64_t))(v4 + 16))(&v9[OBJC_IVAR___SMCatalogWorkout_workout], v6, v3);
  v9[OBJC_IVAR___SMCatalogWorkout_isPartOfAStack] = 0;
  v12.receiver = v9;
  v12.super_class = v8;
  v10 = -[SMCatalogWorkoutDetail init](&v12, sel_init);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (SMCatalogWorkout *)v10;
}

- (int64_t)completedCount
{
  SMCatalogWorkoutDetail *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_24A778E30();

  return v3;
}

- (NSNumber)mediaTypeRawValue
{
  SMCatalogWorkoutDetail *v2;
  id v3;

  v2 = self;
  v3 = CatalogWorkoutDetailBridge.mediaTypeRawValue.getter();

  return (NSNumber *)v3;
}

- (SMCatalogWorkoutDetail)init
{
  SMCatalogWorkoutDetail *result;

  result = (SMCatalogWorkoutDetail *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SMCatalogWorkoutDetail_workoutDetail;
  v3 = sub_24A778E60();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

+ (id)canonical
{
  objc_class *ObjCClassMetadata;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  objc_super v10;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v3 = sub_24A778E60();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A778E54();
  v7 = objc_allocWithZone(ObjCClassMetadata);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v7 + OBJC_IVAR___SMCatalogWorkoutDetail_workoutDetail, v6, v3);
  v10.receiver = v7;
  v10.super_class = ObjCClassMetadata;
  v8 = objc_msgSendSuper2(&v10, sel_init);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

@end
