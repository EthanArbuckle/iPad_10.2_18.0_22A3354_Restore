@implementation SSFlowHostCache

+ (id)sharedInstance
{
  if (qword_253E96FB8 != -1)
    dispatch_once(&qword_253E96FB8, &__block_literal_global_4);
  return (id)_MergedGlobals_57;
}

void __33__SSFlowHostCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_57;
  _MergedGlobals_57 = v0;

}

- (SSFlowHostCache)init
{
  SSFlowHostCache *v2;
  uint64_t v3;
  NSMutableDictionary *dict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSFlowHostCache;
  v2 = -[SSFlowHostCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_dict, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary setObject:forKey:](self->_dict, "setObject:forKey:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
