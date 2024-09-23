@implementation PGGraphLanguageEdge

- (id)initFromLocationNode:(id)a3 toLanguageNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphLanguageEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphLanguageEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphLanguageEdge *)-[PGGraphLanguageEdge initFromLocationNode:toLanguageNode:](self, "initFromLocationNode:toLanguageNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("POPULAR_LANGUAGE");
  return CFSTR("POPULAR_LANGUAGE");
}

- (unsigned)domain
{
  return 205;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("POPULAR_LANGUAGE"), 205);
}

@end
