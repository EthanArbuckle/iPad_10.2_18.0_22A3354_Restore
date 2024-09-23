@implementation OntologyGraphCompatible

- (BOOL)isDescendentWithDescendent:(id)a3 ancestor:(id)a4
{
  id v6;
  id v7;
  _TtC18VisualIntelligence23OntologyGraphCompatible *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1D48384E4(v6, v7);

  return v9 & 1;
}

- (id)ontologyNodeWithKnowledgeGraphID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC18VisualIntelligence23OntologyGraphCompatible *v7;
  id v8;

  v4 = sub_1D492261C();
  v6 = v5;
  v7 = self;
  v8 = sub_1D483869C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (unint64_t)count
{
  return (*(_QWORD **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18VisualIntelligence23OntologyGraphCompatible_ontologyGraph))[2];
}

- (id)findLeastCommonAncestorWithNode1:(id)a3 node2:(id)a4
{
  id v6;
  id v7;
  _TtC18VisualIntelligence23OntologyGraphCompatible *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1D483886C(v6, v7);

  return v9;
}

- (_TtC18VisualIntelligence23OntologyGraphCompatible)init
{
  _TtC18VisualIntelligence23OntologyGraphCompatible *result;

  result = (_TtC18VisualIntelligence23OntologyGraphCompatible *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
