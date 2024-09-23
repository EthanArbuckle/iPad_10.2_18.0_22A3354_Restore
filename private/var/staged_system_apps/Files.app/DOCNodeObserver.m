@implementation DOCNodeObserver

- (DOCNode)node
{
  return (DOCNode *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC5Files15DOCNodeObserver_node)));
}

- (void)setNode:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files15DOCNodeObserver_node);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files15DOCNodeObserver_node) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (_TtC5Files15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5
{
  uint64_t ObjectType;
  id v10;

  ObjectType = swift_getObjectType(a3);
  swift_unknownObjectRetain(a3);
  v10 = a4;
  return (_TtC5Files15DOCNodeObserver *)sub_100452ED0(a3, a4, a5, (char *)self, ObjectType);
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC5Files15DOCNodeObserver *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  sub_1001626AC();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[DOCNodeObserver dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files15DOCNodeObserver_node));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files15DOCNodeObserver_subscribers));
}

- (_TtC5Files15DOCNodeObserver)init
{
  _TtC5Files15DOCNodeObserver *result;

  result = (_TtC5Files15DOCNodeObserver *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCNodeObserver", 21, "init()", 6, 0);
  __break(1u);
  return result;
}

- (id)addSubscriber:(id)a3
{
  return sub_100451978(self, (int)a2, a3, (uint64_t)&unk_1005ED6E8, (uint64_t)sub_100241430, (uint64_t (*)(uint64_t, uint64_t))sub_100451560);
}

- (id)addDidFinishGatheringSubscriber:(id)a3
{
  return sub_100451978(self, (int)a2, a3, (uint64_t)&unk_1005ED6C0, (uint64_t)sub_100453558, (uint64_t (*)(uint64_t, uint64_t))sub_100451428);
}

- (void)removeSubscriber:(id)a3
{
  uint64_t *v5;
  uint64_t v6;
  _TtC5Files15DOCNodeObserver *v7;
  _TtC5Files15DOCNodeObserver *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  _BYTE v14[32];
  _BYTE v15[24];

  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files15DOCNodeObserver_subscribers);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files15DOCNodeObserver_subscribers, v15, 0, 0);
  v6 = *v5;
  v7 = (_TtC5Files15DOCNodeObserver *)a3;
  v8 = self;
  swift_bridgeObjectRetain(v6);
  v10 = sub_100453090(v9, (uint64_t)v7);
  v12 = v11;
  swift_bridgeObjectRelease(v6);
  if ((v12 & 1) == 0)
  {
    swift_beginAccess(v5, v14, 33, 0);
    v13 = sub_100088620(v10);
    swift_endAccess(v14);

    v7 = v8;
    v8 = (_TtC5Files15DOCNodeObserver *)v13;
  }

}

@end
