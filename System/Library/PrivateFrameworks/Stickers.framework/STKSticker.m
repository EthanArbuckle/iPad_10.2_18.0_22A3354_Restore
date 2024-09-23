@implementation STKSticker

- (NSUUID)identifier
{
  return (NSUUID *)(id)sub_247A1AC50();
}

- (NSArray)representations
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for Sticker.Representation();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_247A1B028();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setRepresentations:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  STKSticker *v6;

  type metadata accessor for Sticker.Representation();
  v4 = sub_247A1B034();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___STKSticker_representations);
  swift_beginAccess();
  *v5 = v4;
  v6 = self;
  swift_bridgeObjectRelease();
  sub_2479FDA28();

}

- (NSString)accessibilityName
{
  return (NSString *)sub_2479FB96C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKSticker_accessibilityName);
}

- (void)setAccessibilityName:(id)a3
{
  sub_2479FBA48((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___STKSticker_accessibilityName);
}

- (int64_t)byteCount
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKSticker_byteCount);
  swift_beginAccess();
  return *v2;
}

- (void)setByteCount:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___STKSticker_byteCount);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)name
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_247A1AEC0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_247A1AEE4();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___STKSticker_name);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)searchText
{
  return (NSString *)sub_2479FB96C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKSticker_searchText);
}

- (void)setSearchText:(id)a3
{
  sub_2479FBA48((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___STKSticker_searchText);
}

- (NSString)sanitizedPrompt
{
  return (NSString *)sub_2479FB96C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKSticker_sanitizedPrompt);
}

- (void)setSanitizedPrompt:(id)a3
{
  sub_2479FBA48((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___STKSticker_sanitizedPrompt);
}

- (BOOL)isGeneratedSticker
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___STKSticker_searchText);
  swift_beginAccess();
  v3 = v2[1];
  if (!v3)
    return 0;
  if ((v3 & 0x2000000000000000) != 0)
    v4 = HIBYTE(v3) & 0xF;
  else
    v4 = *v2 & 0xFFFFFFFFFFFFLL;
  return v4 != 0;
}

- (int64_t)effect
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___STKSticker_effect);
  swift_beginAccess();
  return *v2;
}

- (void)setEffect:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___STKSticker_effect);
  swift_beginAccess();
  *v4 = a3;
}

- (NSData)metadata
{
  uint64_t *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___STKSticker_metadata);
  swift_beginAccess();
  v3 = 0;
  v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    v5 = *v2;
    sub_2479D9370(v5, v4);
    v3 = (void *)sub_247A1ABB4();
    sub_2479D96E0(v5, v4);
  }
  return (NSData *)v3;
}

- (void)setMetadata:(id)a3
{
  void *v3;
  STKSticker *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  STKSticker *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v3 = a3;
  if (a3)
  {
    v5 = self;
    v6 = v3;
    v3 = (void *)sub_247A1ABCC();
    v8 = v7;

  }
  else
  {
    v9 = self;
    v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___STKSticker_metadata);
  swift_beginAccess();
  v11 = *v10;
  v12 = v10[1];
  *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_2479D96E0(v11, v12);

}

- (NSString)externalURI
{
  return (NSString *)sub_2479FB96C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKSticker_externalURI);
}

- (void)setExternalURI:(id)a3
{
  sub_2479FBA48((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___STKSticker_externalURI);
}

- (STKStickerAttributionInfo)attributionInfo
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___STKSticker_attributionInfo);
  swift_beginAccess();
  return (STKStickerAttributionInfo *)*v2;
}

- (void)setAttributionInfo:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___STKSticker_attributionInfo);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (double)creationDate
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___STKSticker_creationDate);
  swift_beginAccess();
  return *v2;
}

- (void)setCreationDate:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___STKSticker_creationDate);
  swift_beginAccess();
  *v4 = a3;
}

- (double)lastUsedDate
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___STKSticker_lastUsedDate);
  swift_beginAccess();
  return *v2;
}

- (void)setLastUsedDate:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___STKSticker_lastUsedDate);
  swift_beginAccess();
  *v4 = a3;
}

- (double)libraryIndex
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___STKSticker_libraryIndex);
  swift_beginAccess();
  return *v2;
}

- (void)setLibraryIndex:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___STKSticker_libraryIndex);
  swift_beginAccess();
  *v4 = a3;
}

- (NSUUID)_companionRecentUUID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254450A70);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___STKSticker__companionRecentUUID;
  swift_beginAccess();
  sub_2479F77A4((uint64_t)v6, (uint64_t)v5, &qword_254450A70);
  v7 = sub_247A1AC8C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_247A1AC50();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (void)set_companionRecentUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  STKSticker *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254450A70);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_247A1AC68();
    v8 = sub_247A1AC8C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_247A1AC8C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___STKSticker__companionRecentUUID;
  swift_beginAccess();
  v11 = self;
  sub_2479EA85C((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (NSString)description
{
  STKSticker *v2;
  void *v3;

  v2 = self;
  sub_2479FC840();

  v3 = (void *)sub_247A1AEC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  STKSticker *v4;
  STKSticker *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_247A1B244();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_2479FD1CC((uint64_t)v8);

  sub_2479D045C((uint64_t)v8, &qword_254450C30);
  return v6;
}

- (int64_t)hash
{
  STKSticker *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_247A1AC74();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STKSticker)initWithCoder:(id)a3
{
  return (STKSticker *)Sticker.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  STKSticker *v5;

  v4 = a3;
  v5 = self;
  sub_2479FEA6C(v4);

}

- (STKSticker)init
{
  STKSticker *result;

  result = (STKSticker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___STKSticker_identifier;
  v4 = sub_247A1AC8C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2479D96E0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___STKSticker_metadata), *(_QWORD *)&self->type[OBJC_IVAR___STKSticker_metadata]);
  swift_bridgeObjectRelease();

  sub_2479D045C((uint64_t)self + OBJC_IVAR___STKSticker__companionRecentUUID, &qword_254450A70);
}

@end
