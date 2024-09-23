@implementation MTSingleton

+ (id)sharedInstance
{
  void *v3;
  id v4;
  MTSingletonHolder *v5;
  void *v6;
  objc_super v8;

  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_19);
  NSStringFromClass((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)_instanceMap;
  objc_sync_enter(v4);
  objc_msgSend((id)_instanceMap, "objectForKey:", v3);
  v5 = (MTSingletonHolder *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MTSingletonHolder);
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend((id)_instanceMap, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_sync_exit(v4);

  os_unfair_lock_lock(&v5->_lock);
  -[MTSingletonHolder instance](v5, "instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___MTSingleton;
    v6 = (void *)objc_msgSend(objc_msgSendSuper2(&v8, sel_allocWithZone_, 0), "init");
    -[MTSingletonHolder setInstance:](v5, "setInstance:", v6);
  }
  os_unfair_lock_unlock(&v5->_lock);

  return v6;
}

void __29__MTSingleton_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_instanceMap;
  _instanceMap = (uint64_t)v0;

}

@end
