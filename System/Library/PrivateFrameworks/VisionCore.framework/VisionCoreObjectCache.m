@implementation VisionCoreObjectCache

- (VisionCoreObjectCache)init
{
  VisionCoreObjectCache *v2;
  VisionCoreObjectCache *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *objects;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VisionCoreObjectCache;
  v2 = -[VisionCoreObjectCache init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    objects = v3->_objects;
    v3->_objects = v4;

  }
  return v3;
}

- (id)objectForIdentifier:(id)a3 creationBlock:(id)a4 error:(id *)a5
{
  id v8;
  void (**v9)(id, id *);
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v17;

  v8 = a3;
  v9 = (void (**)(id, id *))a4;
  os_unfair_lock_lock(&self->_accessLock);
  -[NSMutableDictionary objectForKey:](self->_objects, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
LABEL_12:

    os_unfair_lock_unlock(&self->_accessLock);
    goto LABEL_13;
  }
  if (v9)
  {
    v12 = (void *)MEMORY[0x2207A6494]();
    v17 = 0;
    v9[2](v9, &v17);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    objc_autoreleasePoolPop(v12);
    if (v11)
    {
      -[NSMutableDictionary setObject:forKey:](self->_objects, "setObject:forKey:", v11, v8);
      v14 = v11;
    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease(v13);
    }

    goto LABEL_12;
  }
  os_unfair_lock_unlock(&self->_accessLock);
  if (a5)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("could not locate object '%@'"), v8);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_accessLock;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[NSMutableDictionary removeAllObjects](self->_objects, "removeAllObjects");
  os_unfair_lock_unlock(p_accessLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
