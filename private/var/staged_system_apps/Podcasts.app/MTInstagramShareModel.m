@implementation MTInstagramShareModel

- (MTInstagramShareModel)initWithShowName:(id)a3 episodeName:(id)a4 creatorName:(id)a5 publishDate:(id)a6 artwork:(id)a7
{
  objc_class *ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  id *v21;
  uint64_t *v22;
  uint64_t v23;
  id v24;
  id v25;
  objc_super v27;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v16 = v15;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___MTInstagramShareModel_showName);
  *v20 = v14;
  v20[1] = v16;
  v21 = (id *)((char *)&self->super.isa + OBJC_IVAR___MTInstagramShareModel_episodeName);
  *v21 = a4;
  v21[1] = v18;
  v22 = (uint64_t *)((char *)self + OBJC_IVAR___MTInstagramShareModel_creatorName);
  *v22 = v19;
  v22[1] = v23;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTInstagramShareModel_publishDate) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTInstagramShareModel_artwork) = (Class)a7;
  v27.receiver = self;
  v27.super_class = ObjectType;
  v24 = a6;
  v25 = a7;
  return -[MTInstagramShareModel init](&v27, "init");
}

- (MTInstagramShareModel)init
{
  MTInstagramShareModel *result;

  result = (MTInstagramShareModel *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.InstagramShareModel", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->showName[OBJC_IVAR___MTInstagramShareModel_showName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->showName[OBJC_IVAR___MTInstagramShareModel_episodeName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->showName[OBJC_IVAR___MTInstagramShareModel_creatorName]);

}

@end
