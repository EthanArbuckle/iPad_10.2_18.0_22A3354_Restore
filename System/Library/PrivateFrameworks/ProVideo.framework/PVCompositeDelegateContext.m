@implementation PVCompositeDelegateContext

- (PVCompositeDelegateContext)initWithNode:(id)a3
{
  id v4;
  PVCompositeDelegateContext *v5;
  PVCompositeDelegateContext *v6;
  id preprocessData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PVCompositeDelegateContext;
  v5 = -[PVCompositeDelegateContext init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceNode, v4);
    preprocessData = v6->_preprocessData;
    v6->_preprocessData = 0;

  }
  return v6;
}

- (void)setPreprocessData:(id)a3
{
  objc_storeStrong(&self->_preprocessData, a3);
}

- (void)setRenderColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_renderingColorSpace, a3);
}

- (PVInstructionGraphSourceNode)sourceNode
{
  return (PVInstructionGraphSourceNode *)objc_loadWeakRetained((id *)&self->_sourceNode);
}

- (id)preprocessData
{
  return self->_preprocessData;
}

- (PVColorSpace)renderingColorSpace
{
  return self->_renderingColorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingColorSpace, 0);
  objc_storeStrong(&self->_preprocessData, 0);
  objc_destroyWeak((id *)&self->_sourceNode);
}

@end
