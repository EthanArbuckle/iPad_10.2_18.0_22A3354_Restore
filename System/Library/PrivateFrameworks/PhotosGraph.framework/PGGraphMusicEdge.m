@implementation PGGraphMusicEdge

- (id)initFromMomentNode:(id)a3 toMusicSessionNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphMusicEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphMusicEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphMusicEdge *)-[PGGraphMusicEdge initFromMomentNode:toMusicSessionNode:](self, "initFromMomentNode:toMusicSessionNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("MUSIC_SESSION");
  return CFSTR("MUSIC_SESSION");
}

- (unsigned)domain
{
  return 1000;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("MUSIC_SESSION"), 1000);
}

@end
