@implementation ODDIteratorSpecification

- (ODDIteratorSpecification)init
{
  ODDIteratorSpecification *v2;
  NSMutableArray *v3;
  NSMutableArray *mAttributesList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ODDIteratorSpecification;
  v2 = -[ODDIteratorSpecification init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mAttributesList = v2->mAttributesList;
    v2->mAttributesList = v3;

  }
  return v2;
}

- (id)attributesList
{
  return self->mAttributesList;
}

- (void)addAttributes:(id)a3
{
  -[NSMutableArray addObject:](self->mAttributesList, "addObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAttributesList, 0);
}

@end
