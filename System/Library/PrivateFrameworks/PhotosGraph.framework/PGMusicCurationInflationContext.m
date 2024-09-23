@implementation PGMusicCurationInflationContext

- (NSString)actionSource
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (id)contextWithMusicCache:(id)a3 actionSource:(id)a4 shouldForceMetadataRefetch:(BOOL)a5
{
  objc_class *ObjCClassMetadata;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t *v12;
  id v13;
  objc_super v15;

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v8 = sub_1CA85B534();
  v10 = v9;
  v11 = objc_allocWithZone(ObjCClassMetadata);
  *(_QWORD *)&v11[OBJC_IVAR___PGMusicCurationInflationContext_cache] = a3;
  v11[OBJC_IVAR___PGMusicCurationInflationContext_shouldForceMetadataRefetch] = a5;
  v12 = (uint64_t *)&v11[OBJC_IVAR___PGMusicCurationInflationContext_actionSource];
  *v12 = v8;
  v12[1] = v10;
  v15.receiver = v11;
  v15.super_class = ObjCClassMetadata;
  v13 = a3;
  return objc_msgSendSuper2(&v15, sel_init);
}

- (PGMusicCurationInflationContext)init
{
  PGMusicCurationInflationContext *result;

  result = (PGMusicCurationInflationContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
