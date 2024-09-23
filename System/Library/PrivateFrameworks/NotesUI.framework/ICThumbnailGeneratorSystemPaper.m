@implementation ICThumbnailGeneratorSystemPaper

- (ICThumbnailCaching)cache
{
  return (ICThumbnailCaching *)(id)swift_unknownObjectRetain();
}

- (ICThumbnailGeneratorSystemPaper)initWithManagedObjectContext:(id)a3 cache:(id)a4
{
  objc_class *ObjectType;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___ICThumbnailGeneratorSystemPaper_cache) = (Class)a4;
  v9.receiver = self;
  v9.super_class = ObjectType;
  swift_unknownObjectRetain();
  return -[ICThumbnailGenerator initWithManagedObjectContext:](&v9, sel_initWithManagedObjectContext_, a3);
}

+ (id)chromeBackdropImageUrlFor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;

  v4 = sub_1ACA3F81C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone((Class)ICThumbnailConfiguration);
  v9 = a3;
  v10 = objc_msgSend(v8, sel_initForSystemPaperChromeLayerWithThumbnailType_traitCollection_, 5, v9);
  v11 = objc_msgSend(v10, sel_uniqueKey);

  sub_1AC9AB07C((uint64_t)v7);
  v12 = (void *)sub_1ACA3F7D4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

+ (CGSize)chromeSize
{
  double v2;
  double v3;
  CGSize result;

  if (qword_1EEC9F4D0 != -1)
    swift_once();
  v3 = *((double *)&xmmword_1EECA5498 + 1);
  v2 = *(double *)&xmmword_1EECA5498;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)generateThumbnailWithConfiguration:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  ICThumbnailGeneratorSystemPaper *v9;
  NSManagedObjectContext *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  ICThumbnailGeneratorSystemPaper *v14;
  _QWORD v15[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = -[ICThumbnailGenerator managedObjectContext](v9, sel_managedObjectContext);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v9;
  v11[3] = v8;
  v11[4] = sub_1AC9A8EC0;
  v11[5] = v7;
  v15[4] = sub_1ACA17E44;
  v15[5] = v11;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1107296256;
  v15[2] = sub_1AC94AFB0;
  v15[3] = &block_descriptor_10_1;
  v12 = _Block_copy(v15);
  v13 = v8;
  v14 = v9;
  swift_retain();
  swift_release();
  -[NSManagedObjectContext performBlock:](v10, sel_performBlock_, v12);
  _Block_release(v12);

  swift_release();
}

- (id)thumbnailWith:(id)a3
{
  ICThumbnailConfiguration *v4;
  ICThumbnailGeneratorSystemPaper *v5;
  ICThumbnailDescription *v6;
  void *v7;
  void *v8;

  v4 = (ICThumbnailConfiguration *)a3;
  v5 = self;
  ThumbnailGeneratorSystemPaper.thumbnail(with:)(v6, v4);
  v8 = v7;

  return v8;
}

- (ICThumbnailGeneratorSystemPaper)initWithManagedObjectContext:(id)a3
{
  id v3;
  ICThumbnailGeneratorSystemPaper *result;

  v3 = a3;
  result = (ICThumbnailGeneratorSystemPaper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
