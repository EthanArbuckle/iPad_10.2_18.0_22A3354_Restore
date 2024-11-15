@implementation TPSUserGuideTopic

- (NSString)productId
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setProductId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_19A990D58();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___TPSUserGuideTopic_productId);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)topicId
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuideTopic_topicId);
}

- (void)setTopicId:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSUserGuideTopic_topicId);
}

- (NSString)version
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuideTopic_version);
}

- (void)setVersion:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSUserGuideTopic_version);
}

+ (NSString)uti
{
  return (NSString *)(id)sub_19A990D34();
}

- (NSString)identifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  TPSUserGuideTopic *v8;
  TPSUserGuideTopic *v9;
  void *v10;
  uint64_t v12;

  v3 = sub_19A990B0C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___TPSUserGuideTopic_topicId;
  swift_beginAccess();
  if (*((_QWORD *)v7 + 1))
  {
    v8 = self;
  }
  else
  {
    v9 = self;
    sub_19A990B00();
    sub_19A990AE8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  swift_bridgeObjectRetain();

  v10 = (void *)sub_19A990D34();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (NSString)title
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuideTopic_title);
}

- (void)setTitle:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSUserGuideTopic_title);
}

- (NSString)body
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSUserGuideTopic_body);
}

- (void)setBody:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSUserGuideTopic_body);
}

+ (BOOL)isValidIdentifier:(id)a3
{
  id v3;
  id v4;

  sub_19A990D58();
  v3 = objc_allocWithZone((Class)type metadata accessor for UserGuideTopic());
  swift_bridgeObjectRetain();
  v4 = UserGuideTopic.init(searchableItemUniqueIdentifier:)();
  swift_bridgeObjectRelease();
  if (v4)

  return v4 != 0;
}

- (id)searchableItemUniqueIdentifierWith:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TPSUserGuideTopic *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = sub_19A990D58();
  v6 = v5;
  v7 = self;
  sub_19A97CD5C(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_19A990D34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (TPSUserGuideTopic)initWithProductIdentifier:(id)a3 topicIdentifier:(id)a4 version:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = sub_19A990D58();
  v9 = v8;
  if (!a4)
  {
    v11 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    v14 = 0;
    return (TPSUserGuideTopic *)UserGuideTopic.init(productIdentifier:topicIdentifier:version:)(v7, v9, (uint64_t)a4, v11, v12, v14);
  }
  a4 = (id)sub_19A990D58();
  v11 = v10;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v12 = sub_19A990D58();
  v14 = v13;
  return (TPSUserGuideTopic *)UserGuideTopic.init(productIdentifier:topicIdentifier:version:)(v7, v9, (uint64_t)a4, v11, v12, v14);
}

- (TPSUserGuideTopic)initWithSearchableItemUniqueIdentifier:(id)a3
{
  sub_19A990D58();
  return (TPSUserGuideTopic *)UserGuideTopic.init(searchableItemUniqueIdentifier:)();
}

- (TPSUserGuideTopic)init
{
  TPSUserGuideTopic *result;

  result = (TPSUserGuideTopic *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSURL)supportSiteURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  TPSUserGuideTopic *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D378);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  UserGuideTopic.supportSiteURL.getter((uint64_t)v5);

  v7 = sub_19A990A34();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_19A9909E0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

@end
