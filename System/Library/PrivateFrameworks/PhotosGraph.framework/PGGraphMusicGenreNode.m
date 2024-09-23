@implementation PGGraphMusicGenreNode

- (PGGraphMusicGenreNode)initWithLabel:(id)a3
{
  id v4;
  PGGraphMusicGenreNode *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMusicGenreNode;
  v5 = -[PGGraphNode init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

  }
  return v5;
}

- (unsigned)domain
{
  return 1001;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
