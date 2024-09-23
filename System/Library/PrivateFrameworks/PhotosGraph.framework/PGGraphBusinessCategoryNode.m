@implementation PGGraphBusinessCategoryNode

- (PGGraphBusinessCategoryNode)initWithLabel:(id)a3
{
  id v4;
  PGGraphBusinessCategoryNode *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBusinessCategoryNode;
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
  return 504;
}

- (PGGraphBusinessCategoryNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphBusinessCategoryNodeCollection alloc], "initWithNode:", self);
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (MARelation)businessOfCategory
{
  void *v2;
  void *v3;

  +[PGGraphBusinessCategoryEdge filter](PGGraphBusinessCategoryEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 504);
}

+ (id)filterWithCategories:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithLabels:domain:properties:", v4, 504, MEMORY[0x1E0C9AA70]);

  return v6;
}

+ (id)filterWithCategory:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLabel:domain:", v4, 504);

  return v5;
}

@end
