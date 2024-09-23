@implementation TUIRenderUpdateChanges

- (id)copyWithZone:(_NSZone *)a3
{
  TUIRenderUpdateChanges *v4;
  NSSet *v5;
  NSSet *inserts;
  NSSet *v7;
  NSSet *updates;
  NSSet *v9;
  NSSet *deletes;

  v4 = -[TUIRenderUpdateChanges init](+[TUIRenderUpdateChanges allocWithZone:](TUIRenderUpdateChanges, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = (NSSet *)-[NSSet copy](self->_inserts, "copy");
    inserts = v4->_inserts;
    v4->_inserts = v5;

    v7 = (NSSet *)-[NSSet copy](self->_updates, "copy");
    updates = v4->_updates;
    v4->_updates = v7;

    v9 = (NSSet *)-[NSSet copy](self->_deletes, "copy");
    deletes = v4->_deletes;
    v4->_deletes = v9;

  }
  return v4;
}

- (void)unionChanges:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *v6;
  NSSet *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *inserts;
  NSSet *updates;
  NSSet *v13;
  NSSet *deletes;
  NSSet *v15;

  v4 = a3;
  v5 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
  v6 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
  v7 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
  -[NSSet unionSet:](v5, "unionSet:", self->_inserts);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inserts"));
  -[NSSet unionSet:](v5, "unionSet:", v8);

  -[NSSet unionSet:](v6, "unionSet:", self->_updates);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updates"));
  -[NSSet unionSet:](v6, "unionSet:", v9);

  -[NSSet unionSet:](v7, "unionSet:", self->_deletes);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deletes"));

  -[NSSet unionSet:](v7, "unionSet:", v10);
  inserts = self->_inserts;
  self->_inserts = v5;
  v15 = v5;

  updates = self->_updates;
  self->_updates = v6;
  v13 = v6;

  deletes = self->_deletes;
  self->_deletes = v7;

}

- (void)unionInserts:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *inserts;

  v4 = a3;
  v5 = (NSSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v4);

  -[NSSet unionSet:](v5, "unionSet:", self->_inserts);
  inserts = self->_inserts;
  self->_inserts = v5;

}

- (NSSet)inserts
{
  return self->_inserts;
}

- (void)setInserts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)deletes
{
  return self->_deletes;
}

- (void)setDeletes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
}

@end
