@implementation PGGraphSubmeaningOfEdge

- (id)initFromSubmeaningNode:(id)a3 toParentMeaningNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphSubmeaningOfEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphSubmeaningOfEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphSubmeaningOfEdge *)-[PGGraphSubmeaningOfEdge initFromSubmeaningNode:toParentMeaningNode:](self, "initFromSubmeaningNode:toParentMeaningNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("SUBMEANING_OF");
  return CFSTR("SUBMEANING_OF");
}

- (unsigned)domain
{
  return 700;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("SUBMEANING_OF"), 700);
}

@end
