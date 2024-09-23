@implementation RETrainingContext

- (RETrainingContext)init
{
  RETrainingContext *v2;
  REConcurrentDictionary *v3;
  REConcurrentDictionary *attributes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RETrainingContext;
  v2 = -[RETrainingContext init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(REConcurrentDictionary);
    attributes = v2->_attributes;
    v2->_attributes = v3;

  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_msgSend(WeakRetained, "removeTrainingContext:", self);

  v4.receiver = self;
  v4.super_class = (Class)RETrainingContext;
  -[RETrainingContext dealloc](&v4, sel_dealloc);
}

- (void)_trainElementWithIdentifier:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v6 = a4;
  v18 = a3;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_msgSend(WeakRetained, "trainingManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Training context must be added to a relevance engine before trying to train"), v11, v12, v13, v14, v15, v16, v17);
  objc_msgSend(v10, "performTrainingForElementWithIdentifier:isPositiveEvent:interaction:", v18, v6, v8);
  if (-[RETrainingContext _wantsAutomaticRemoteContextForwarding](self, "_wantsAutomaticRemoteContextForwarding"))
    -[RERemoteTrainingContext trainWithElement:isPositiveEvent:interaction:](self->_remoteContext, "trainWithElement:isPositiveEvent:interaction:", v18, v6, v8);

}

- (void)_trainElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v6 = a4;
  v18 = a3;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_msgSend(WeakRetained, "trainingManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("Training context must be added to a relevance engine before trying to train"), v11, v12, v13, v14, v15, v16, v17);
  objc_msgSend(v10, "performTrainingForElement:isPositiveEvent:interaction:", v18, v6, v8);
  if (-[RETrainingContext _wantsAutomaticRemoteContextForwarding](self, "_wantsAutomaticRemoteContextForwarding"))
    -[RETrainingContext trainWithUnmanagedElement:isPositiveEvent:interaction:](self->_remoteContext, "trainWithUnmanagedElement:isPositiveEvent:interaction:", v18, v6, v8);

}

- (RERelevanceEngine)relevanceEngine
{
  return (RERelevanceEngine *)objc_loadWeakRetained((id *)&self->_relevanceEngine);
}

- (BOOL)isCurrent
{
  RETrainingContext *v2;
  id WeakRetained;
  void *v4;
  RETrainingContext *v5;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_msgSend(WeakRetained, "trainingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTrainingContext");
  v5 = (RETrainingContext *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v5 == v2;

  return (char)v2;
}

- (void)becomeCurrent
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_msgSend(WeakRetained, "trainingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeContextCurrent:", self);

}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[REConcurrentDictionary setObject:forKeyedSubscript:](self->_attributes, "setObject:forKeyedSubscript:", v7, v6);
  -[RETrainingContext setCachedAttributeContext:](self, "setCachedAttributeContext:", 0);
  if (-[RETrainingContext _wantsAutomaticRemoteContextForwarding](self, "_wantsAutomaticRemoteContextForwarding"))
    -[RERemoteTrainingContext setAttribute:forKey:](self->_remoteContext, "setAttribute:forKey:", v7, v6);

}

- (id)attributeForKey:(id)a3
{
  return -[REConcurrentDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", a3);
}

- (BOOL)performSimulationCommand:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (RETrainingContext)cachedAttributeContext
{
  return (RETrainingContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedAttributeContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAttributeContext, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_destroyWeak((id *)&self->_relevanceEngine);
}

- (RETrainingContext)attributeContext
{
  RETrainingContext *v3;
  id WeakRetained;
  uint64_t v5;
  REConcurrentDictionary *attributes;

  -[RETrainingContext cachedAttributeContext](self, "cachedAttributeContext");
  v3 = (RETrainingContext *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(RETrainingContext);
    WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
    objc_storeWeak((id *)&v3->_relevanceEngine, WeakRetained);

    v5 = -[REConcurrentDictionary copy](self->_attributes, "copy");
    attributes = v3->_attributes;
    v3->_attributes = (REConcurrentDictionary *)v5;

    -[RETrainingContext setCachedAttributeContext:](self, "setCachedAttributeContext:", v3);
  }
  return v3;
}

- (void)_configureForRelevanceEngine:(id)a3
{
  RERelevanceEngine **p_relevanceEngine;
  id v5;
  RERemoteTrainingContext *remoteContext;
  id v7;
  id v8;

  p_relevanceEngine = &self->_relevanceEngine;
  v8 = a3;
  v5 = objc_storeWeak((id *)p_relevanceEngine, v8);
  remoteContext = self->_remoteContext;
  v7 = v5;
  -[RETrainingContext _configureForRelevanceEngine:](remoteContext, "_configureForRelevanceEngine:", v8);

}

- (BOOL)_wantsAutomaticRemoteContextForwarding
{
  return 1;
}

- (RERemoteTrainingContext)remoteContext
{
  return self->_remoteContext;
}

- (void)flushTraining
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  objc_msgSend(WeakRetained, "trainingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushTraining");

}

- (void)setRemoteContext:(id)a3
{
  RERemoteTrainingContext *v4;
  RERemoteTrainingContext *remoteContext;
  RERemoteTrainingContext *v6;
  RERemoteTrainingContext *v7;
  id WeakRetained;

  v4 = (RERemoteTrainingContext *)a3;
  -[RETrainingContext _configureForRelevanceEngine:](self->_remoteContext, "_configureForRelevanceEngine:", 0);
  remoteContext = self->_remoteContext;
  self->_remoteContext = v4;
  v6 = v4;

  v7 = self->_remoteContext;
  WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  -[RETrainingContext _configureForRelevanceEngine:](v7, "_configureForRelevanceEngine:", WeakRetained);

}

@end
