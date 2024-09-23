@implementation TPSUserGuide

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TPSUserGuide *v5;

  v4 = a3;
  v5 = self;
  UserGuide.encode(with:)((NSCoder)v4);

}

- (TPSUserGuide)initWithCoder:(id)a3
{
  return (TPSUserGuide *)UserGuide.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)getUserGuideFromURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v9;

  v3 = sub_19A990A34();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A9909EC();
  v7 = _s8TipsCore9UserGuideC03getcD7FromURL0G0ACSg10FoundationAEV_tFZ_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

+ (id)privateURLWithBookIdentifier:(id)a3 topicIdentifier:(id)a4 version:(id)a5 referrer:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_19A990D58();
    a3 = v13;
    if (a4)
      goto LABEL_3;
  }
  else if (a4)
  {
LABEL_3:
    v14 = sub_19A990D58();
    a4 = v15;
    if (a5)
      goto LABEL_4;
LABEL_8:
    v16 = 0;
    if (a6)
      goto LABEL_5;
    goto LABEL_9;
  }
  v14 = 0;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  v16 = sub_19A990D58();
  a5 = v17;
  if (a6)
  {
LABEL_5:
    v18 = sub_19A990D58();
    a6 = v19;
    goto LABEL_10;
  }
LABEL_9:
  v18 = 0;
LABEL_10:
  swift_getObjCClassMetadata();
  static UserGuide.privateURL(bookIdentifier:topicIdentifier:version:referrer:)((uint64_t)a3, v14, (uint64_t)a4, v16, (uint64_t)a5, v18, (uint64_t)a6, (uint64_t)v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v20 = sub_19A990A34();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v12, 1, v20) != 1)
  {
    v22 = (void *)sub_19A9909E0();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v12, v20);
  }
  return v22;
}

+ (id)urlWithBook:(id)a3 topic:(id)a4 anchor:(id)a5 version:(id)a6 referrer:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v31 = sub_19A990D58();
    a3 = v15;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v31 = 0;
    if (a4)
    {
LABEL_3:
      v30 = sub_19A990D58();
      a4 = v16;
      if (a5)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  v30 = 0;
  if (a5)
  {
LABEL_4:
    v17 = sub_19A990D58();
    a5 = v18;
    if (a6)
      goto LABEL_5;
LABEL_10:
    v19 = 0;
    v21 = a7;
    if (v21)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v17 = 0;
  if (!a6)
    goto LABEL_10;
LABEL_5:
  v19 = sub_19A990D58();
  a6 = v20;
  v21 = a7;
  if (v21)
  {
LABEL_6:
    v22 = v21;
    v23 = sub_19A990D58();
    v25 = v24;

    goto LABEL_12;
  }
LABEL_11:
  v23 = 0;
  v25 = 0;
LABEL_12:
  static UserGuide.url(book:topic:anchor:version:referrer:)((uint64_t)a3, v30, (uint64_t)a4, v17, (uint64_t)a5, v19, (uint64_t)a6, (uint64_t)v14, v23, v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v26 = sub_19A990A34();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v14, 1, v26) != 1)
  {
    v28 = (void *)sub_19A9909E0();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v26);
  }
  return v28;
}

- (BOOL)platformIndependent
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TPSUserGuide_platformIndependent);
}

- (NSString)identifier
{
  return (NSString *)sub_19A968FFC();
}

- (NSString)text
{
  return (NSString *)sub_19A968FFC();
}

- (NSString)symbol
{
  return (NSString *)sub_19A968FFC();
}

- (NSArray)gradientColorStrings
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (TPSGradient)gradient
{
  return (TPSGradient *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR___TPSUserGuide_gradient));
}

- (NSString)platform
{
  void *v2;

  if (*(_QWORD *)&self->platformIndependent[OBJC_IVAR___TPSUserGuide_platform])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)referrer
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuide_referrer);
}

- (void)setReferrer:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSUserGuide_referrer);
}

- (NSString)version
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuide_version);
}

- (void)setVersion:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSUserGuide_version);
}

- (NSString)topicIdentifier
{
  TPSUserGuide *v3;
  char *v4;
  uint64_t v5;
  void *v6;

  swift_getKeyPath();
  sub_19A95CC28();
  v3 = self;
  sub_19A990B3C();
  swift_release();
  v4 = (char *)v3 + OBJC_IVAR___TPSUserGuide__topicIdentifier;
  swift_beginAccess();
  v5 = *((_QWORD *)v4 + 1);
  swift_bridgeObjectRetain();

  if (!v5)
    return (NSString *)0;
  v6 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)setTopicIdentifier:(id)a3
{
  uint64_t KeyPath;
  TPSUserGuide *v5;

  if (a3)
    sub_19A990D58();
  KeyPath = swift_getKeyPath();
  MEMORY[0x1E0C80A78](KeyPath);
  sub_19A95CC28();
  v5 = self;
  sub_19A990B30();

  swift_release();
  swift_bridgeObjectRelease();
}

- (TPSUserGuide)initWithIdentifier:(id)a3 version:(id)a4 text:(id)a5 symbol:(id)a6 platform:(id)a7 platformIndependent:(BOOL)a8 gradientColorStrings:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  v27 = sub_19A990D58();
  v13 = v12;
  if (a4)
  {
    v14 = sub_19A990D58();
    v16 = v15;
    if (a5)
    {
LABEL_3:
      v17 = sub_19A990D58();
      v19 = v18;
      goto LABEL_6;
    }
  }
  else
  {
    v14 = 0;
    v16 = 0;
    if (a5)
      goto LABEL_3;
  }
  v17 = 0;
  v19 = 0;
LABEL_6:
  v20 = sub_19A990D58();
  v22 = v21;
  if (a7)
  {
    a7 = (id)sub_19A990D58();
    v24 = v23;
  }
  else
  {
    v24 = 0;
  }
  v25 = sub_19A990E3C();
  return (TPSUserGuide *)UserGuide.init(identifier:version:text:symbol:platform:platformIndependent:gradientColorStrings:)(v27, v13, v14, v16, v17, v19, v20, v22, (uint64_t)a7, v24, a8, v25);
}

- (NSString)displayName
{
  return (NSString *)sub_19A962970(self, (uint64_t)a2, (void (*)(void))UserGuide.displayName.getter);
}

- (NSString)description
{
  return (NSString *)sub_19A962970(self, (uint64_t)a2, (void (*)(void))UserGuide.description.getter);
}

- (TPSUserGuide)init
{
  TPSUserGuide *result;

  result = (TPSUserGuide *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TPSUserGuide___observationRegistrar;
  v4 = sub_19A990B6C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (id)copyWithZone:(void *)a3
{
  TPSUserGuide *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  UserGuide.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_19A99128C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  TPSUserGuide *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_19A990E00();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  TPSUserGuide *v4;
  TPSUserGuide *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19A9910A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = UserGuide.isEqual(_:)((uint64_t)v8);

  sub_19A90A538((uint64_t)v8, &qword_1ED03D570);
  return v6 & 1;
}

@end
