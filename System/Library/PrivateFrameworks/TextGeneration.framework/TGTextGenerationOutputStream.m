@implementation TGTextGenerationOutputStream

- (TGTextGenerationOutputStream)init
{
  TGTextGenerationOutputStream *v2;
  uint64_t v3;
  NSMutableArray *textFragments;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TGTextGenerationOutputStream;
  v2 = -[TGTextGenerationOutputStream init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    textFragments = v2->_textFragments;
    v2->_textFragments = (NSMutableArray *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)addOutput:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "score");
  -[TGTextGenerationOutputStream setScore:](self, "setScore:");
  -[TGTextGenerationOutputStream textFragments](self, "textFragments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
  os_unfair_lock_unlock(p_lock);
}

- (NSString)mostRecentTextUpdate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[TGTextGenerationOutputStream textFragments](self, "textFragments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[TGTextGenerationOutputStream textFragments](self, "textFragments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v7;
}

- (NSString)text
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TGTextGenerationOutputStream textFragments](self, "textFragments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "appendString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSMutableArray)textFragments
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFragments, 0);
}

@end
