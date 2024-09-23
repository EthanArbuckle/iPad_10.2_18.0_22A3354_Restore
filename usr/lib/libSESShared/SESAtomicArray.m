@implementation SESAtomicArray

- (SESAtomicArray)init
{
  SESAtomicArray *v2;
  SESAtomicArray *v3;
  uint64_t v4;
  NSMutableArray *objects;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SESAtomicArray;
  v2 = -[SESAtomicArray init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    objects = v3->_objects;
    v3->_objects = (NSMutableArray *)v4;

  }
  return v3;
}

- (id)snapshot
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_objects, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addObject:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_objects, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObject:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeObject:](self->_objects, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeAllObjects](self->_objects, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (id)firstWhere:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray find:](self->_objects, "find:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
