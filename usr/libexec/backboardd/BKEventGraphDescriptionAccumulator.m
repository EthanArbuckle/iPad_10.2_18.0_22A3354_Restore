@implementation BKEventGraphDescriptionAccumulator

- (BKEventGraphDescriptionAccumulator)init
{
  BKEventGraphDescriptionAccumulator *v2;
  _BKGraphStructureNode *v3;
  _BKGraphStructureNode *topLevel;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKEventGraphDescriptionAccumulator;
  v2 = -[BKEventGraphDescriptionAccumulator init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(_BKGraphStructureNode);
    topLevel = v2->_topLevel;
    v2->_topLevel = v3;

    objc_storeStrong((id *)&v2->_current, v2->_topLevel);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_topLevel, 0);
}

@end
