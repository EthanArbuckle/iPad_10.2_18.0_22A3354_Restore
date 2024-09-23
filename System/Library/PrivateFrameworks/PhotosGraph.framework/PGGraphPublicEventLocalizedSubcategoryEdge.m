@implementation PGGraphPublicEventLocalizedSubcategoryEdge

- (id)initFromPublicEventNode:(id)a3 toLocalizedCategoryNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPublicEventLocalizedSubcategoryEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphPublicEventLocalizedSubcategoryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPublicEventLocalizedSubcategoryEdge *)-[PGGraphPublicEventLocalizedSubcategoryEdge initFromPublicEventNode:toLocalizedCategoryNode:](self, "initFromPublicEventNode:toLocalizedCategoryNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("LOCALIZED_SUBCATEGORY");
  return CFSTR("LOCALIZED_SUBCATEGORY");
}

- (unsigned)domain
{
  return 902;
}

@end
