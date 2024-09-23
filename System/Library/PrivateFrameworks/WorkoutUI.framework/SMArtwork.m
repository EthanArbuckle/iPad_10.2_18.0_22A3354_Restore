@implementation SMArtwork

- (NSString)backgroundColor
{
  return (NSString *)sub_24A63F9F0(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE8D658]);
}

- (NSString)template
{
  return (NSString *)sub_24A63F9F0(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE8D680]);
}

- (NSString)textColor
{
  return (NSString *)sub_24A63F9F0(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE8D690]);
}

- (SMArtwork)init
{
  SMArtwork *result;

  result = (SMArtwork *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SMArtwork_artwork;
  v3 = sub_24A778F38();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (int64_t)hash
{
  SMArtwork *v3;
  int64_t v4;

  sub_24A77C268();
  sub_24A778F38();
  sub_24A63FEC8();
  v3 = self;
  sub_24A77B914();
  sub_24A778F08();
  sub_24A77BA1C();
  swift_bridgeObjectRelease();
  sub_24A778F20();
  sub_24A77BA1C();
  swift_bridgeObjectRelease();
  sub_24A778F2C();
  sub_24A77BA1C();
  swift_bridgeObjectRelease();
  v4 = sub_24A77C250();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SMArtwork *v4;
  SMArtwork *v5;
  char v6;
  void *v8;
  _BYTE v9[24];
  uint64_t v10;
  _OWORD v11[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24A77BE90();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_24A63FFA0((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_24A63FFE8((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for ArtworkBridge();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  v6 = sub_24A640104((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_24A63FFE8((uint64_t)v11);
  return v6 & 1;
}

@end
