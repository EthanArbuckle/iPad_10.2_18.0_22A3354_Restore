@implementation PGGraphTripFeatureEdge

- (id)initFromHighlightGroupNode:(id)a3 toFeatureNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphTripFeatureEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphTripFeatureEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphTripFeatureEdge *)-[PGGraphTripFeatureEdge initFromHighlightGroupNode:toFeatureNode:](self, "initFromHighlightGroupNode:toFeatureNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("TRIP_FEATURES");
  return CFSTR("TRIP_FEATURES");
}

- (unsigned)domain
{
  return 200;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("TRIP_FEATURES"), 200);
}

@end
