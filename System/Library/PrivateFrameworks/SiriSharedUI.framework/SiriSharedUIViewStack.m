@implementation SiriSharedUIViewStack

- (SiriSharedUIViewStack)initWithContentViews:(id)a3
{
  id v4;
  SiriSharedUIViewStack *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *mutableViews;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUIViewStack;
  v5 = -[SiriSharedUIViewStack init](&v9, sel_init);
  if (v5)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    mutableViews = v5->_mutableViews;
    v5->_mutableViews = v6;

    -[SiriSharedUIViewStack setContentViews:](v5, "setContentViews:", v4);
  }

  return v5;
}

- (void)setContentViews:(id)a3
{
  objc_class *v4;
  id v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *mutableViews;

  v4 = (objc_class *)MEMORY[0x1E0C99E10];
  v5 = a3;
  v6 = (NSMutableOrderedSet *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  mutableViews = self->_mutableViews;
  self->_mutableViews = v6;

}

- (NSArray)contentViews
{
  return (NSArray *)-[NSMutableOrderedSet array](self->_mutableViews, "array");
}

- (void)addContentView:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SiriSharedUIViewStack containsContentView:](self, "containsContentView:", v4))
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SiriSharedUIViewStack addContentView:].cold.1();
  }
  else
  {
    -[NSMutableOrderedSet addObject:](self->_mutableViews, "addObject:", v4);
  }

}

- (void)removeContentView:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SiriSharedUIViewStack containsContentView:](self, "containsContentView:", v4))
  {
    -[NSMutableOrderedSet removeObject:](self->_mutableViews, "removeObject:", v4);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
  {
    -[SiriSharedUIViewStack removeContentView:].cold.1();
  }

}

- (BOOL)containsContentView:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](self->_mutableViews, "containsObject:", a3);
}

- (id)nextViewAfterContentView:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[NSMutableOrderedSet indexOfObject:](self->_mutableViews, "indexOfObject:", a3);
  if (v4 > 0x7FFFFFFFFFFFFFFELL)
  {
    v5 = 0;
  }
  else
  {
    -[SiriSharedUIViewStack viewAtIndex:](self, "viewAtIndex:", v4 + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)viewAtIndex:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if (-[NSMutableOrderedSet count](self->_mutableViews, "count") <= (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_mutableViews, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)previousViewBeforeContentView:(id)a3
{
  void *v4;

  if ((unint64_t)(-[NSMutableOrderedSet indexOfObject:](self->_mutableViews, "indexOfObject:", a3) - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v4 = 0;
  }
  else
  {
    -[SiriSharedUIViewStack viewAtIndex:](self, "viewAtIndex:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)reset
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriSharedUIViewStack reset]";
    _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s #viewStack Resetting items in SiriSharedUIViewStack", (uint8_t *)&v4, 0xCu);
  }
  -[NSMutableOrderedSet removeAllObjects](self->_mutableViews, "removeAllObjects");
}

- (SiriSharedUIStackableContent)mostRecentlyAddedView
{
  return (SiriSharedUIStackableContent *)-[NSMutableOrderedSet lastObject](self->_mutableViews, "lastObject");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  SiriSharedUIViewStack *v5;

  -[SiriSharedUIViewStack contentViews](self, "contentViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SiriSharedUIViewStack initWithContentViews:](+[SiriSharedUIViewStack allocWithZone:](SiriSharedUIViewStack, "allocWithZone:", a3), "initWithContentViews:", v4);

  return v5;
}

- (NSMutableOrderedSet)mutableViews
{
  return self->_mutableViews;
}

- (void)setMutableViews:(id)a3
{
  objc_storeStrong((id *)&self->_mutableViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableViews, 0);
}

- (void)addContentView:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1DE0BF000, v0, v1, "%s #viewStack Attempting to add view (%@) that already exists in %@", v2);
}

- (void)removeContentView:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1DE0BF000, v0, v1, "%s #viewStack Attempting to remove view (%@) that doesn't even exist in %@", v2);
}

@end
