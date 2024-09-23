@implementation _PLExpirableSet

- (void)dealloc
{
  NSMutableSet *set;
  NSMutableDictionary *recentTouches;
  objc_super v5;

  set = self->_set;
  self->_set = 0;

  recentTouches = self->_recentTouches;
  self->_recentTouches = 0;

  v5.receiver = self;
  v5.super_class = (Class)_PLExpirableSet;
  -[_PLExpirableSet dealloc](&v5, sel_dealloc);
}

- (_PLExpirableSet)initWithSecondsToExpire:(double)a3
{
  _PLExpirableSet *v4;
  _PLExpirableSet *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *recentTouches;
  NSMutableSet *v8;
  NSMutableSet *set;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_PLExpirableSet;
  v4 = -[_PLExpirableSet init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_secondsToExpire = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recentTouches = v5->_recentTouches;
    v5->_recentTouches = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    set = v5->_set;
    v5->_set = v8;

  }
  return v5;
}

- (void)_touch:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0C99D68];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentTouches, "setObject:forKeyedSubscript:", v6, v5);

}

- (BOOL)_didExpireObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_recentTouches, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dateByAddingTimeInterval:", self->_secondsToExpire);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v8 = objc_msgSend(v7, "compare:", v6) == 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  _PLExpirableSet *v5;
  BOOL v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[_PLExpirableSet _didExpireObject:](v5, "_didExpireObject:", v4))
  {
    -[_PLExpirableSet removeObject:](v5, "removeObject:", v4);
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!-[NSMutableSet containsObject:](v5->_set, "containsObject:", v4))
    goto LABEL_5;
  -[_PLExpirableSet _touch:](v5, "_touch:", v4);
  v6 = 1;
LABEL_6:
  objc_sync_exit(v5);

  return v6;
}

- (void)addObject:(id)a3
{
  _PLExpirableSet *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](v4->_set, "addObject:", v5);
  -[_PLExpirableSet _touch:](v4, "_touch:", v5);
  objc_sync_exit(v4);

}

- (void)removeObject:(id)a3
{
  _PLExpirableSet *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](v4->_set, "removeObject:", v5);
  -[NSMutableDictionary removeObjectForKey:](v4->_recentTouches, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentTouches, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

@end
