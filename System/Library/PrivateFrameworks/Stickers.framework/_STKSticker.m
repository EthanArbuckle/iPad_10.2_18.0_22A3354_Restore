@implementation _STKSticker

- (NSUUID)identifier
{
  return (NSUUID *)(id)sub_247A1AC50();
}

- (NSArray)representations
{
  void *v2;

  type metadata accessor for _STKStickerRepresentation(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_247A1B028();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)name
{
  return (NSString *)sub_2479D35C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_name);
}

- (int64_t)effectType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____STKSticker_effectType);
}

- (NSString)externalURI
{
  return (NSString *)sub_2479D35C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_externalURI);
}

- (NSString)accessibilityName
{
  return (NSString *)sub_2479D35C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_accessibilityName);
}

- (NSData)metadata
{
  uint64_t *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____STKSticker_metadata);
  v3 = *(_QWORD *)&self->_anon_0[OBJC_IVAR____STKSticker_metadata];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    v5 = *v2;
    sub_2479D9370(*v2, v3);
    v4 = (void *)sub_247A1ABB4();
    sub_2479D96E0(v5, v3);
  }
  return (NSData *)v4;
}

- (_STKStickerAttributionInfo)attributionInfo
{
  return (_STKStickerAttributionInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____STKSticker_attributionInfo));
}

- (NSString)searchText
{
  return (NSString *)sub_2479D35C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_searchText);
}

- (NSString)sanitizedPrompt
{
  return (NSString *)sub_2479D35C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____STKSticker_sanitizedPrompt);
}

- (NSString)description
{
  return (NSString *)sub_2479D475C(self, (uint64_t)a2, (void (*)(void))sub_2479D3814);
}

- (_STKSticker)init
{
  _STKSticker *result;

  result = (_STKSticker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____STKSticker_identifier;
  v4 = sub_247A1AC8C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2479D96E0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____STKSticker_metadata), *(_QWORD *)&self->_anon_0[OBJC_IVAR____STKSticker_metadata]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
