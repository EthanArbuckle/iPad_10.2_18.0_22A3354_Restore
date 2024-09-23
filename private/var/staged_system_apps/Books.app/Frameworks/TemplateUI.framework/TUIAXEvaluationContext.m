@implementation TUIAXEvaluationContext

- (TUIAXEvaluationContext)init
{
  TUIAXEvaluationContext *v2;
  uint64_t v3;
  NSMapTable *identifierToAXElementMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIAXEvaluationContext;
  v2 = -[TUIAXEvaluationContext init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    identifierToAXElementMap = v2->_identifierToAXElementMap;
    v2->_identifierToAXElementMap = (NSMapTable *)v3;

  }
  return v2;
}

- (TUIAXScreenOffsetProviding)screenOffsetProvider
{
  return (TUIAXScreenOffsetProviding *)objc_loadWeakRetained((id *)&self->_screenOffsetProvider);
}

- (void)setScreenOffsetProvider:(id)a3
{
  objc_storeWeak((id *)&self->_screenOffsetProvider, a3);
}

- (CGPoint)sectionOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_sectionOffset.x;
  y = self->_sectionOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSectionOffset:(CGPoint)a3
{
  self->_sectionOffset = a3;
}

- (double)totalContentHeight
{
  return self->_totalContentHeight;
}

- (void)setTotalContentHeight:(double)a3
{
  self->_totalContentHeight = a3;
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

- (TUIRenderModelSection)renderModelSection
{
  return self->_renderModelSection;
}

- (void)setRenderModelSection:(id)a3
{
  objc_storeStrong((id *)&self->_renderModelSection, a3);
}

- (NSMapTable)identifierToAXElementMap
{
  return self->_identifierToAXElementMap;
}

- (void)setIdentifierToAXElementMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToAXElementMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToAXElementMap, 0);
  objc_storeStrong((id *)&self->_renderModelSection, 0);
  objc_destroyWeak((id *)&self->_screenOffsetProvider);
}

@end
