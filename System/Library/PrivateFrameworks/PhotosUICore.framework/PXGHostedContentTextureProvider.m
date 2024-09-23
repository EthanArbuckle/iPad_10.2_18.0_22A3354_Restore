@implementation PXGHostedContentTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  id v12;
  PXGHostedContentTextureProvider *v13;
  char *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  v12 = a7;
  v13 = self;
  v14 = sub_1A6A798F8(*(_QWORD *)&a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v12);
  v16 = v15;

  v17 = (NSUInteger)v14;
  v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

- (void)cancelTextureRequests:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  PXGHostedContentTextureProvider *v8;
  uint64_t v9;

  v4 = sub_1A7ADCC0C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A7ADCBA0();
  v8 = self;
  sub_1A6A79F9C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (PXGHostedContentTextureProvider)init
{
  uint64_t v3;
  objc_super v5;

  v3 = OBJC_IVAR___PXGHostedContentTextureProvider_requestQueue_requestByID;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_1A6A7B0EC(MEMORY[0x1E0DEE9D8]);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HostedContentTextureProvider();
  return -[PXGTextureProvider init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
