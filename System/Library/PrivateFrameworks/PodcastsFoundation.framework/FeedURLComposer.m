@implementation FeedURLComposer

- (_TtC18PodcastsFoundation15FeedURLComposer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FeedURLComposer();
  return -[FeedURLComposer init](&v3, sel_init);
}

+ (int64_t)errorURLDoesNotExist
{
  return 0;
}

+ (int64_t)errorURLInvalid
{
  return 1;
}

+ (int64_t)errorCannotGenerateInternalURL
{
  return 2;
}

- (id)feedURLForOptionalURL:(id)a3 adamID:(int64_t)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _TtC18PodcastsFoundation15FeedURLComposer *v16;
  void *v17;
  _BYTE v19[16];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AD3D0);
  MEMORY[0x1E0C80A78](v8);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_1A93F726C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a3)
  {
    sub_1A93F7200();
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, v15, 1, v11);
  v16 = self;
  sub_1A915C7C4((uint64_t)v10, a4, (uint64_t)v14);
  sub_1A914149C((uint64_t)v10);

  v17 = (void *)sub_1A93F71A0();
  (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
  return v17;
}

@end
