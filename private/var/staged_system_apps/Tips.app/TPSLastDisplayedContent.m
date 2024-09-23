@implementation TPSLastDisplayedContent

- (TPSLastDisplayedContent)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSLastDisplayedContent_tipId) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSLastDisplayedContent_collectionId) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[TPSLastDisplayedContent init](&v5, "init");
}

- (BOOL)hasContent
{
  TPSLastDisplayedContent *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = TPSLastDisplayedContent.hasContent()();

  return v3;
}

- (NSString)tipId
{
  return (NSString *)sub_10005A9B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLastDisplayedContent_tipId);
}

- (void)setTipId:(id)a3
{
  sub_10005AA4C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TPSLastDisplayedContent_tipId);
}

- (NSString)collectionId
{
  return (NSString *)sub_10005A9B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLastDisplayedContent_collectionId);
}

- (void)setCollectionId:(id)a3
{
  sub_10005AA4C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TPSLastDisplayedContent_collectionId);
}

- (TPSLastDisplayedContent)initWithCollectionId:(id)a3 tipId:(id)a4
{
  id v6;
  id v7;
  TPSLastDisplayedContent *v8;

  v6 = a3;
  v7 = a4;
  v8 = (TPSLastDisplayedContent *)sub_10005B288(a3, a4);

  return v8;
}

- (NSString)description
{
  TPSLastDisplayedContent *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  TPSLastDisplayedContent.description.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void).cxx_destruct
{

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TPSLastDisplayedContent *v5;

  v4 = a3;
  v5 = self;
  TPSLastDisplayedContent.encode(with:)((NSCoder)v4);

}

- (TPSLastDisplayedContent)initWithCoder:(id)a3
{
  return (TPSLastDisplayedContent *)TPSLastDisplayedContent.init(coder:)(a3);
}

@end
