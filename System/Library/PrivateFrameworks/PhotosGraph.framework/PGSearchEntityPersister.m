@implementation PGSearchEntityPersister

- (PGSearchEntityPersister)initWithPhotoLibrary:(id)a3
{
  id v3;
  PGSearchEntityPersister *v4;

  v3 = a3;
  v4 = (PGSearchEntityPersister *)sub_1CA479BD4(v3);

  return v4;
}

- (BOOL)persistSearchEntitiesFromSearchEntityProvider:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  PGSearchEntityPersister *v9;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  SearchEntityPersister.persistSearchEntities(from:progressReporter:)(a3);

  swift_unknownObjectRelease();
  return 1;
}

- (PGSearchEntityPersister)init
{
  PGSearchEntityPersister *result;

  result = (PGSearchEntityPersister *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PGSearchEntityPersister_logger;
  v4 = sub_1CA85B348();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
