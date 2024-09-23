@implementation SMCatalogWorkout

- (BOOL)isPartOfAStack
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___SMCatalogWorkout_isPartOfAStack);
}

- (NSDateComponents)dateReleased
{
  return (NSDateComponents *)sub_24A694784(self, (uint64_t)a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCBDE0], (void (*)(void))MEMORY[0x24BE89528], MEMORY[0x24BDCBCA0]);
}

- (NSString)identifier
{
  return (NSString *)sub_24A693DB4(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE894F8]);
}

- (NSString)title
{
  return (NSString *)sub_24A693DB4(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE89578]);
}

- (SMContributor)narrator
{
  SMCatalogWorkout *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_24A693E70();

  return (SMContributor *)v3;
}

- (NSString)location
{
  return (NSString *)sub_24A694CE4(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE895B0]);
}

- (NSSet)artwork
{
  return (NSSet *)sub_24A694D98(self, (uint64_t)a2, (void (*)(void))sub_24A6944A8, (uint64_t (*)(uint64_t))type metadata accessor for ArtworkBridge, &qword_257949CB8);
}

- (NSURL)streamingURL
{
  return (NSURL *)sub_24A694784(self, (uint64_t)a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], (void (*)(void))MEMORY[0x24BE89538], MEMORY[0x24BDCD8D0]);
}

- (double)duration
{
  SMCatalogWorkout *v2;
  double v3;
  double v4;

  v2 = self;
  sub_24A778CD4();
  v4 = v3;

  return v4;
}

- (NSString)summary
{
  return (NSString *)sub_24A694CE4(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE89598]);
}

- (NSArray)musicTracks
{
  SMCatalogWorkout *v2;
  void *v3;

  v2 = self;
  sub_24A694950();

  type metadata accessor for MusicTrackBridge();
  v3 = (void *)sub_24A77BB0C();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSURL)musicPlaylistURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  SMCatalogWorkout *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257949CB0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_24A778C98();

  v7 = sub_24A7786B0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_24A778698();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (NSString)musicPlaylistIdentifier
{
  return (NSString *)sub_24A694CE4(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE89560]);
}

- (NSSet)mediaMoments
{
  return (NSSet *)sub_24A694D98(self, (uint64_t)a2, (void (*)(void))sub_24A694E10, (uint64_t (*)(uint64_t))type metadata accessor for MediaMomentBridge, &qword_257949CA8);
}

- (BOOL)isGuidedWalk
{
  return sub_24A6950F8(self);
}

- (BOOL)isGuidedRun
{
  return sub_24A6950F8(self);
}

- (BOOL)isGuidedVideo
{
  return sub_24A6950F8(self);
}

- (NSNumber)mediaTypeRawValue
{
  SMCatalogWorkout *v2;
  id v3;

  v2 = self;
  v3 = sub_24A69526C();

  return (NSNumber *)v3;
}

- (SMCatalogWorkout)init
{
  SMCatalogWorkout *result;

  result = (SMCatalogWorkout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SMCatalogWorkout_workout;
  v3 = sub_24A778CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
