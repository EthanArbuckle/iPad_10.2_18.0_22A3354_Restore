@implementation VUWGallery

- (VUWGallery)initWithPath:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = sub_24A01EAA8();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A01EA60();
  return (VUWGallery *)sub_24A015AAC((uint64_t)v6);
}

- (BOOL)prewarmAndReturnError:(id *)a3
{
  VUWGallery *v3;

  v3 = self;
  sub_24A015CDC();

  return 1;
}

- (id)tokenEmbeddingsForTag:(id)a3 client:(int64_t)a4 type:(int64_t)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  VUWGallery *v12;
  void *v13;
  uint64_t v15;

  v8 = sub_24A01EBA4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A01EB98();
  v12 = self;
  v13 = (void *)sub_24A017280((uint64_t)v11, a5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v13;
}

- (id)tokenEmbeddingsForObservation:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v7;
  VUWGallery *v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = self;
  sub_24A015EF4((uint64_t)v7, a4);
  v10 = v9;

  return v10;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 error:(id *)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  VUWGallery *v16;
  uint64_t v18;

  v12 = sub_24A01EBA4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A01EB98();
  v16 = self;
  sub_24A017338(a3, a4, (uint64_t)v15, a7);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);

  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 randomizeWithSeed:(int64_t)a8 error:(id *)a9
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  VUWGallery *v18;
  uint64_t v20;

  v14 = sub_24A01EBA4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A01EB98();
  v18 = self;
  sub_24A01742C(a3, a4, (uint64_t)v17, a7, (void *)a8);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);

  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 context:(id)a6 type:(int64_t)a7 error:(id *)a8
{
  id v13;
  id v14;
  VUWGallery *v15;

  v13 = a5;
  v14 = a6;
  v15 = self;
  sub_24A017524(a3, a4, v13, a7);

  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 context:(id)a6 type:(int64_t)a7 randomizeWithSeed:(int64_t)a8 error:(id *)a9
{
  id v15;
  id v16;
  VUWGallery *v17;

  v15 = a5;
  v16 = a6;
  v17 = self;
  sub_24A017610(a3, a4, v15, a7, a8);

  return 1;
}

- (BOOL)updateForType:(int64_t)a3 withVectorStore:(id)a4 progressHandler:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  VUWGallery *v15;
  uint64_t v17;

  v9 = sub_24A01EAA8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  sub_24A01EA60();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  v15 = self;
  sub_24A016430(a3, (uint64_t)v12, (uint64_t)sub_24A01771C, v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();

  return 1;
}

- (BOOL)updateForType:(int64_t)a3 withVectorStore:(id)a4 mode:(int64_t)a5 progressHandler:(id)a6 error:(id *)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  VUWGallery *v17;
  uint64_t v19;

  v11 = sub_24A01EAA8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  sub_24A01EA60();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  v17 = self;
  sub_24A016738(a3, (uint64_t)v14, a5, (uint64_t)sub_24A01771C, v16);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_release();

  return 1;
}

- (BOOL)updateForType:(int64_t)a3 withVectorStore:(id)a4 force:(BOOL)a5 progressHandler:(id)a6 error:(id *)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  VUWGallery *v17;
  uint64_t v19;

  v11 = sub_24A01EAA8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  sub_24A01EA60();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  v17 = self;
  sub_24A016A78(a3, (uint64_t)v14, a5, (uint64_t)sub_24A01771C, v16);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_release();

  return 1;
}

- (BOOL)updatePlugin:(int64_t)a3 progressHandler:(id)a4 error:(id *)a5
{
  void *v7;
  uint64_t v8;
  VUWGallery *v9;

  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = self;
  sub_24A016DA4(a3, (uint64_t)sub_24A0171D8, v8);
  swift_release();

  return 1;
}

- (int64_t)assetCountForType:(int64_t)a3
{
  VUWGallery *v4;
  int64_t v5;

  v4 = self;
  v5 = sub_24A016F5C(a3);

  return v5;
}

- (VUWGallery)init
{
  VUWGallery *result;

  result = (VUWGallery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
