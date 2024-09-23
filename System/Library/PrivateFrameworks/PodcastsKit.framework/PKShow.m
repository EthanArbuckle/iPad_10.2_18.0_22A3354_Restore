@implementation PKShow

- (BOOL)isInLibrary
{
  PKShow *v2;
  char v3;

  v2 = self;
  v3 = Show.isInLibrary.getter();

  return v3 & 1;
}

- (id)artworkUrlFor:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  PKShow *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  height = a3.height;
  width = a3.width;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E3C638);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  Show.artworkUrl(for:)((uint64_t)v8, width, height);

  v10 = sub_22FB37974();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    v12 = (void *)sub_22FB37950();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  return v12;
}

- (BOOL)isSubscribed
{
  PKShow *v2;
  char v3;

  v2 = self;
  v3 = Show.isSubscribed.getter();

  return v3 & 1;
}

- (PKShow)init
{
  _QWORD *v2;
  PKShow *result;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PKShow_podcastUuid);
  *v2 = 0;
  v2[1] = 0;

  result = (PKShow *)sub_22FB37D10();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_255E3C6B0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_255E3C6B0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PKShow *v5;

  v4 = a3;
  v5 = self;
  Show.encode(with:)((NSCoder)v4);

}

- (PKShow)initWithCoder:(id)a3
{
  return (PKShow *)Show.init(coder:)(a3);
}

- (NSString)title
{
  return (NSString *)sub_22FB306C8();
}

- (NSString)descriptionText
{
  return (NSString *)sub_22FB306C8();
}

- (PKShowStoreId)storeId
{
  return (PKShowStoreId *)*(id *)((char *)&self->super.isa + OBJC_IVAR___PKShow_storeId);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
