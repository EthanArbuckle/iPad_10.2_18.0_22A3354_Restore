@implementation PFArtworkFormatter

+ (id)formatArtworkUrlWithString:(id)a3 for:(CGSize)a4 cropCode:(id)a5 fileExtension:(id)a6
{
  double height;
  double width;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  height = a4.height;
  width = a4.width;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AD3D0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F8040();
  if (a5)
  {
    sub_1A93F8040();
    a5 = v12;
  }
  sub_1A93F8040();
  static ArtworkFormatter.formatArtworkUrl(string:for:cropCode:fileExtension:)((uint64_t)a5, (uint64_t)v11, width, height);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = sub_1A93F726C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13) != 1)
  {
    v15 = (void *)sub_1A93F71A0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
  }
  return v15;
}

+ (id)formatArtworkUrlWithUrl:(id)a3 for:(CGSize)a4 cropCode:(id)a5 fileExtension:(id)a6
{
  double height;
  double width;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void (*v17)(char *, uint64_t);
  void *v19;
  uint64_t v20;

  height = a4.height;
  width = a4.width;
  v9 = sub_1A93F726C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AD3D0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7200();
  if (a5)
  {
    sub_1A93F8040();
    a5 = v16;
  }
  sub_1A93F8040();
  sub_1A93F7170();
  static ArtworkFormatter.formatArtworkUrl(string:for:cropCode:fileExtension:)((uint64_t)a5, (uint64_t)v15, width, height);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v12, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) == 1)
    return 0;
  v19 = (void *)sub_1A93F71A0();
  v17(v15, v9);
  return v19;
}

- (PFArtworkFormatter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkFormatter();
  return -[PFArtworkFormatter init](&v3, sel_init);
}

@end
