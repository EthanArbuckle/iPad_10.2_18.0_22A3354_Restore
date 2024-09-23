@implementation SGGraph

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGGraph_name);
  v3 = *(_QWORD *)&self->name[OBJC_IVAR___SGGraph_name];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x24954AF98](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (SGNode)argumentsNode
{
  return (SGNode *)*(id *)((char *)&self->super.isa + OBJC_IVAR___SGGraph_argumentsNode);
}

- (SGNode)resultsNode
{
  return (SGNode *)*(id *)((char *)&self->super.isa + OBJC_IVAR___SGGraph_resultsNode);
}

- (NSArray)childNodes
{
  return (NSArray *)@objc SGGraph.childNodes.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGGraph_nodes, (void (*)(_QWORD))type metadata accessor for SGNode);
}

- (NSArray)edges
{
  return (NSArray *)@objc SGGraph.childNodes.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGGraph_edges, (void (*)(_QWORD))type metadata accessor for SGEdge);
}

- (void)setEdges:(id)a3
{
  @objc SGGraph.edges.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for SGEdge, &OBJC_IVAR___SGGraph_edges);
}

- (NSArray)inputs
{
  return (NSArray *)@objc SGGraph.childNodes.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGGraph_inputs, (void (*)(_QWORD))type metadata accessor for SGInput);
}

- (void)setInputs:(id)a3
{
  @objc SGGraph.edges.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for SGInput, &OBJC_IVAR___SGGraph_inputs);
}

- (NSArray)outputs
{
  return (NSArray *)@objc SGGraph.childNodes.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGGraph_outputs, (void (*)(_QWORD))type metadata accessor for SGOutput);
}

- (void)setOutputs:(id)a3
{
  @objc SGGraph.edges.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for SGOutput, &OBJC_IVAR___SGGraph_outputs);
}

- (SGGraph)init
{
  SGGraph *result;

  result = (SGGraph *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)graphWithName:(id)a3 inputs:(id)a4 outputs:(id)a5
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (unint64_t)a4;
  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  v9 = 0;
  if (a4)
  {
LABEL_3:
    type metadata accessor for SGInput();
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_4:
  if (a5)
  {
    type metadata accessor for SGOutput();
    a5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v10 = (void *)specialized static SGGraph.create(name:inputs:outputs:)(v7, v9, v6, (unint64_t)a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)graphWithData:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v4 = (uint64_t)a3;
  if (a3)
  {
    v5 = a3;
    v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;

  }
  else
  {
    v7 = 0xF000000000000000;
  }
  v8 = specialized static SGGraph.create(data:)(v4, v7);
  outlined consume of Data?(v4, v7);
  return v8;
}

- (BOOL)connect:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  SGGraph *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  SGGraph.connect(_:to:)((char *)a3, (char *)a4);

  return 1;
}

- (BOOL)connectOutputInputPairs:(id)a3 error:(id *)a4
{
  void *v6;
  SGGraph *v7;
  void *v8;
  void *v9;
  id v10;
  Swift::OpaquePointer_optional v12;

  if (a3)
    v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v6 = 0;
  v7 = self;
  v12.value._rawValue = v6;
  SGGraph.connect(outputInputPairs:)(v12);

  swift_bridgeObjectRelease();
  if (v8)
  {
    if (a4)
    {
      v9 = (void *)_convertErrorToNSError(_:)();

      v10 = v9;
      *a4 = v9;
    }
    else
    {

    }
  }
  return v8 == 0;
}

- (BOOL)insertNodes:(id)a3 error:(id *)a4
{
  void *v6;
  SGGraph *v7;
  void *v8;
  void *v9;
  id v10;
  Swift::OpaquePointer_optional v12;

  if (a3)
  {
    type metadata accessor for SGNode();
    v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v6 = 0;
  }
  v7 = self;
  v12.value._rawValue = v6;
  SGGraph.insert(_:)(v12);

  swift_bridgeObjectRelease();
  if (v8)
  {
    if (a4)
    {
      v9 = (void *)_convertErrorToNSError(_:)();

      v10 = v9;
      *a4 = v9;
    }
    else
    {

    }
  }
  return v8 == 0;
}

- (id)nodeNamed:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  SGGraph *v7;
  void *v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = (void *)SGGraph.node(named:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)createDotRepresentationWithError:(id *)a3
{
  SGGraph *v3;
  void *v4;

  v3 = self;
  createDotText(representing:)((char *)v3);
  v4 = (void *)MEMORY[0x24954AF98]();

  swift_bridgeObjectRelease();
  return v4;
}

@end
