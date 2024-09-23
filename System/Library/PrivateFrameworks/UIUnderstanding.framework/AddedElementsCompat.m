@implementation AddedElementsCompat

- (NSString)groupID
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_24972CB94();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)dedupeElements
{
  void *v2;

  type metadata accessor for DedupeElement();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24972CCCC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (AddedElementsCompat)initWithGroupID:(id)a3 dedupeElements:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t *v9;
  objc_super v11;

  v5 = sub_24972CBB8();
  v7 = v6;
  type metadata accessor for DedupeElement();
  v8 = (objc_class *)sub_24972CCD8();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___AddedElementsCompat_groupID);
  *v9 = v5;
  v9[1] = v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AddedElementsCompat_dedupeElements) = v8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AddedElements();
  return -[AddedElementsCompat init](&v11, sel_init);
}

- (AddedElementsCompat)init
{
  AddedElementsCompat *result;

  result = (AddedElementsCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
