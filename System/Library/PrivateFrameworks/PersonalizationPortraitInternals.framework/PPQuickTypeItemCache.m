@implementation PPQuickTypeItemCache

- (PPQuickTypeItemCache)init
{
  PPQuickTypeItemCache *v2;
  uint64_t v3;
  NSMutableOrderedSet *keys;
  uint64_t v5;
  NSMutableDictionary *entries;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPQuickTypeItemCache;
  v2 = -[PPQuickTypeItemCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    keys = v2->_keys;
    v2->_keys = (NSMutableOrderedSet *)v3;

    v5 = objc_opt_new();
    entries = v2->_entries;
    v2->_entries = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setEntry:(id)a3 key:(id)a4
{
  NSMutableOrderedSet *keys;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  keys = self->_keys;
  v8 = a4;
  v9 = a3;
  if ((-[NSMutableOrderedSet containsObject:](keys, "containsObject:", v8) & 1) == 0
    && (unint64_t)-[NSMutableOrderedSet count](self->_keys, "count") >= 3)
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_keys, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entries, "setObject:forKeyedSubscript:", 0, v10);
    -[NSMutableOrderedSet removeObjectAtIndex:](self->_keys, "removeObjectAtIndex:", 0);

  }
  -[NSMutableOrderedSet removeObject:](self->_keys, "removeObject:", v8);
  -[NSMutableOrderedSet addObject:](self->_keys, "addObject:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entries, "setObject:forKeyedSubscript:", v9, v8);

  v11 = -[NSMutableOrderedSet count](self->_keys, "count");
  if (v11 != -[NSMutableDictionary count](self->_entries, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalQuickTypeBroker.m"), 81, CFSTR("PQT cache count mismatch"));

  }
  if ((unint64_t)-[NSMutableOrderedSet count](self->_keys, "count") >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalQuickTypeBroker.m"), 82, CFSTR("PQT cache key set too big"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
