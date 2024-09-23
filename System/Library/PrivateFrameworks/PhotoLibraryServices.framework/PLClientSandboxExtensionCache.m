@implementation PLClientSandboxExtensionCache

- (PLClientSandboxExtensionCache)initWithCacheLimit:(unint64_t)a3
{
  PLClientSandboxExtensionCache *v4;
  PLClientSandboxExtensionCache *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *sandboxExtensionURLs;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLClientSandboxExtensionCache;
  v4 = -[PLClientSandboxExtensionCache init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cacheLimit = a3;
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    sandboxExtensionURLs = v5->_sandboxExtensionURLs;
    v5->_sandboxExtensionURLs = v6;

  }
  return v5;
}

- (void)insertSandboxedURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSMutableOrderedSet *sandboxExtensionURLs;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v9;
    if (v5)
    {
      os_unfair_lock_lock(&self->_lock);
      v6 = -[NSMutableOrderedSet indexOfObject:](self->_sandboxExtensionURLs, "indexOfObject:", v9);
      sandboxExtensionURLs = self->_sandboxExtensionURLs;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSMutableOrderedSet insertObject:atIndex:](self->_sandboxExtensionURLs, "insertObject:atIndex:", v9, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:](sandboxExtensionURLs, "moveObjectsAtIndexes:toIndex:", v8, 0);

      }
      if (-[NSMutableOrderedSet count](self->_sandboxExtensionURLs, "count") > self->_cacheLimit)
        -[NSMutableOrderedSet removeObjectAtIndex:](self->_sandboxExtensionURLs, "removeObjectAtIndex:", -[NSMutableOrderedSet count](self->_sandboxExtensionURLs, "count") - 1);
      os_unfair_lock_unlock(&self->_lock);
      v4 = v9;
    }
  }

}

- (BOOL)containsURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  NSMutableOrderedSet *sandboxExtensionURLs;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSMutableOrderedSet *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "path"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    sandboxExtensionURLs = self->_sandboxExtensionURLs;
    -[PLClientSandboxExtensionCache urlByStrippingFragmentFromURL:](self, "urlByStrippingFragmentFromURL:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSMutableOrderedSet indexOfObject:](sandboxExtensionURLs, "indexOfObject:", v9);

    v11 = v10 != 0x7FFFFFFFFFFFFFFFLL;
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = self->_sandboxExtensionURLs;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:](v12, "moveObjectsAtIndexes:toIndex:", v13, 0);

    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)urlByStrippingFragmentFromURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "fragment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFragment:", 0);
    objc_msgSend(v6, "URL");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v3;
  }

  return v7;
}

- (unint64_t)cacheLimit
{
  return self->_cacheLimit;
}

- (NSMutableOrderedSet)sandboxExtensionURLs
{
  return self->_sandboxExtensionURLs;
}

- (void)setSandboxExtensionURLs:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtensionURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionURLs, 0);
}

@end
