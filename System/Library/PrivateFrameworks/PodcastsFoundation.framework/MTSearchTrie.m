@implementation MTSearchTrie

- (void)addMatchCandidate:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  MTSearchTrie *v9;

  v5 = sub_1A93F8040();
  v7 = v6;
  v8 = a3;
  v9 = self;
  sub_1A9059F34(v5, v7);

  swift_bridgeObjectRelease();
}

- (MTSearchTrie)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR___MTSearchTrie_rootNode;
  type metadata accessor for SearchTrie.Node();
  v5 = swift_allocObject();
  *(_BYTE *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = MEMORY[0x1E0DEE9E0];
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[MTSearchTrie init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
