@implementation SMMediaMoment

- (double)startTime
{
  SMMediaMoment *v2;
  double v3;
  double v4;

  v2 = self;
  sub_24A778B18();
  v4 = v3;

  return v4;
}

- (double)duration
{
  SMMediaMoment *v2;
  double v3;
  double v4;

  v2 = self;
  sub_24A778B0C();
  v4 = v3;

  return v4;
}

- (SMArtwork)artwork
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  SMMediaMoment *v7;
  objc_class *v8;
  id v9;
  SMMediaMoment *v10;
  objc_super v12;

  v3 = sub_24A778F38();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_24A778B00();
  v8 = (objc_class *)type metadata accessor for ArtworkBridge();
  v9 = objc_allocWithZone(v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v9 + OBJC_IVAR___SMArtwork_artwork, v6, v3);
  v12.receiver = v9;
  v12.super_class = v8;
  v10 = -[SMMediaMoment init](&v12, sel_init);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (SMArtwork *)v10;
}

- (SMMediaMoment)init
{
  SMMediaMoment *result;

  result = (SMMediaMoment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SMMediaMoment_mediaMoment;
  v3 = sub_24A778B24();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
