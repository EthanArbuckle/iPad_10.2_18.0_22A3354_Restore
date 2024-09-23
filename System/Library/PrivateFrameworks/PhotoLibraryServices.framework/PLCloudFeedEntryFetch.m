@implementation PLCloudFeedEntryFetch

- (PLCloudFeedEntryFetch)initWithPredicate:(id)a3 entity:(id)a4
{
  id v7;
  id v8;
  PLCloudFeedEntryFetch *v9;
  PLCloudFeedEntryFetch *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLCloudFeedEntryFetch;
  v9 = -[PLCloudFeedEntryFetch init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    objc_storeStrong((id *)&v10->_entity, a4);
  }

  return v10;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSEntityDescription)entity
{
  return self->_entity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
