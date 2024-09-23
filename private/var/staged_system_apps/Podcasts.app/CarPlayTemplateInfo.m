@implementation CarPlayTemplateInfo

- (_TtC8Podcasts19CarPlayTemplateInfo)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (char *)self + OBJC_IVAR____TtC8Podcasts19CarPlayTemplateInfo_type;
  v5 = type metadata accessor for CarPlayTemplateInfo.TemplateType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19CarPlayTemplateInfo_playbackSource) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[CarPlayTemplateInfo init](&v7, "init");
}

- (void).cxx_destruct
{
  sub_10034A36C((uint64_t)self + OBJC_IVAR____TtC8Podcasts19CarPlayTemplateInfo_type);
}

@end
