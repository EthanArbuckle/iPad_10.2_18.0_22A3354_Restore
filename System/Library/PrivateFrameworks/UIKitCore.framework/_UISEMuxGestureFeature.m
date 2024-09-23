@implementation _UISEMuxGestureFeature

- (void)_incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3->var4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_subfeatures, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    (*((void (**)(void))self->_createFeatureBlock + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subfeatures, "setObject:forKeyedSubscript:", v5, v6);
  }
  objc_msgSend(v5, "incorporateSample:", a3);

}

- (_UISEMuxGestureFeature)initWithSettings:(id)a3 createFeatureBlock:(id)a4
{
  _UISEMuxGestureFeature *v6;
  _UISEMuxGestureFeature *v7;
  void *v8;
  id createFeatureBlock;
  NSMutableDictionary *v10;
  NSMutableDictionary *subfeatures;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UISEMuxGestureFeature;
  v6 = -[_UISEMuxGestureFeature init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v8 = _Block_copy(a4);
    createFeatureBlock = v7->_createFeatureBlock;
    v7->_createFeatureBlock = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    subfeatures = v7->_subfeatures;
    v7->_subfeatures = v10;

    v7->_fails = 0;
    v7->_recognizes = 0;
  }
  return v7;
}

- (void)featureDidChangeState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (!-[_UISEGestureFeature state](self, "state"))
  {
    v5 = objc_msgSend(a3, "state");
    v6 = v5;
    if (v5 == 1)
    {
      v7 = self->_recognizes + 1;
      self->_recognizes = v7;
      v8 = -[_UISEGestureFeatureSettings minimumNumberOfSubfeatures](self->_settings, "minimumNumberOfSubfeatures");
    }
    else
    {
      if (v5 != 2)
        return;
      v7 = self->_fails + 1;
      self->_fails = v7;
      v8 = -[NSMutableDictionary count](self->_subfeatures, "count");
    }
    if (v7 >= v8)
      -[_UISEGestureFeature _setState:](self, "_setState:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subfeatures, 0);
  objc_storeStrong(&self->_createFeatureBlock, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (id)debugDictionary
{
  id v3;
  NSMutableDictionary *subfeatures;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  subfeatures = self->_subfeatures;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41___UISEMuxGestureFeature_debugDictionary__block_invoke;
  v10[3] = &unk_1E16C8EB0;
  v11 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subfeatures, "enumerateKeysAndObjectsUsingBlock:", v10);
  v9.receiver = self;
  v9.super_class = (Class)_UISEMuxGestureFeature;
  -[_UISEGestureFeature debugDictionary](&v9, sel_debugDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("subfeatures"));
  return v7;
}

- (NSDictionary)subfeatures
{
  return &self->_subfeatures->super;
}

@end
