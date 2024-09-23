@implementation CRLSendACopyActivity_i

- (NSString)activityType
{
  uint64_t v2;
  _TtC8Freeform22CRLSendACopyActivity_i *v3;
  NSString *v4;

  v2 = qword_1013DCB78;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1013DCB78, sub_100637ECC);
  v4 = (NSString *)(id)qword_10147ECD8;

  return v4;
}

- (NSString)activityTitle
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_100637F50();
  if (v2)
  {
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (UIImage)activityImage
{
  void *v3;
  _TtC8Freeform22CRLSendACopyActivity_i *v4;
  NSString v5;
  id v6;

  v3 = (void *)objc_opt_self(UIImage);
  v4 = self;
  v5 = String._bridgeToObjectiveC()();
  v6 = objc_msgSend(v3, "systemImageNamed:", v5);

  return (UIImage *)v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v5 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_activityItems);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_activityItems) = v4;
  swift_bridgeObjectRelease(v5);
}

- (UIViewController)activityViewController
{
  _TtC8Freeform22CRLSendACopyActivity_i *v2;
  id v3;

  v2 = self;
  v3 = sub_1006376D4();

  return (UIViewController *)v3;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (SFCollaborationItem)collaborationItem
{
  return (SFCollaborationItem *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_collaborationItem));
}

- (void)setCollaborationItem:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_collaborationItem);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_collaborationItem) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (BOOL)canPerformWithCollaborationItem:(id)a3 activityItems:(id)a4
{
  return 0;
}

- (_TtC8Freeform22CRLSendACopyActivity_i)init
{
  _TtC8Freeform22CRLSendACopyActivity_i *result;

  result = (_TtC8Freeform22CRLSendACopyActivity_i *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSendACopyActivity_i", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004BBB8C((uint64_t)self + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_boardIdentifier);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_activityItems));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8Freeform22CRLSendACopyActivity_i_collaborationItem));
}

@end
