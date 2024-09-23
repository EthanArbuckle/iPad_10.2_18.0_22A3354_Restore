@implementation PGGraphBusinessCategoryEdge

- (id)initFromBusinessNode:(id)a3 toBusinessCategoryNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphBusinessCategoryEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphBusinessCategoryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphBusinessCategoryEdge *)-[PGGraphBusinessCategoryEdge initFromBusinessNode:toBusinessCategoryNode:](self, "initFromBusinessNode:toBusinessCategoryNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("BUSINESSCATEGORY");
  return CFSTR("BUSINESSCATEGORY");
}

- (unsigned)domain
{
  return 504;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("BUSINESSCATEGORY"), 504);
}

@end
