@implementation WFImageCache

- (WFImageCache)init
{
  WFImageCache *v2;
  uint64_t v3;
  NSMutableDictionary *backingStore;
  WFImageCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFImageCache;
  v2 = -[WFImageCache init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    backingStore = v2->_backingStore;
    v2->_backingStore = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (void)setImage:(CGImage *)a3 forKey:(id)a4
{
  id v7;
  WFPurgeableImage *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a4;
  v13 = v7;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFImageCache.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

    if (v13)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFImageCache.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v8 = -[WFPurgeableImage initWithCGImage:]([WFPurgeableImage alloc], "initWithCGImage:", a3);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WFImageCache backingStore](self, "backingStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v13);

  os_unfair_lock_unlock(p_lock);
}

- (CGImage)imageForKey:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  CGImage *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFImageCache.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WFImageCache backingStore](self, "backingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    v9 = (CGImage *)objc_msgSend(v8, "copyImage");
    if (!v9)
    {
      os_unfair_lock_lock(&self->_lock);
      -[WFImageCache backingStore](self, "backingStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v5);

      os_unfair_lock_unlock(p_lock);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[WFImageCache backingStore](self, "backingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableDictionary)backingStore
{
  return self->_backingStore;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
}

@end
