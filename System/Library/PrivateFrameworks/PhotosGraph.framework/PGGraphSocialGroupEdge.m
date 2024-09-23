@implementation PGGraphSocialGroupEdge

- (id)initFromMomentNode:(id)a3 toSocialGroupNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphSocialGroupEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphSocialGroupEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphSocialGroupEdge *)-[PGGraphSocialGroupEdge initFromMomentNode:toSocialGroupNode:](self, "initFromMomentNode:toSocialGroupNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("SOCIALGROUP");
  return CFSTR("SOCIALGROUP");
}

- (unsigned)domain
{
  return 302;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("SOCIALGROUP"), 302);
}

@end
