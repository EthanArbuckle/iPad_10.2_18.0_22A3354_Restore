@implementation PGGraphBuilderMomentEnvelope

- (PGGraphBuilderMomentEnvelope)initWithMomentNode:(id)a3
{
  id v5;
  PGGraphBuilderMomentEnvelope *v6;
  PGGraphBuilderMomentEnvelope *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBuilderMomentEnvelope;
  v6 = -[PGGraphBuilderMomentEnvelope init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_momentNode, a3);

  return v7;
}

- (PGGraphMomentNode)momentNode
{
  return (PGGraphMomentNode *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)sceneEdges
{
  return self->_sceneEdges;
}

- (void)setSceneEdges:(id)a3
{
  objc_storeStrong((id *)&self->_sceneEdges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneEdges, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
}

@end
