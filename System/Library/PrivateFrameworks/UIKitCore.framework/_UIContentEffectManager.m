@implementation _UIContentEffectManager

+ (id)sharedManager
{
  if (_MergedGlobals_1254 != -1)
    dispatch_once(&_MergedGlobals_1254, &__block_literal_global_547);
  return (id)qword_1ECD81B70;
}

- (id)compatibleEffectForKey:(id)a3 descriptor:(id)a4 constructor:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id *v26;
  uint64_t *v27;
  id location;
  id *p_location;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__199;
  v38 = __Block_byref_object_dispose__199;
  -[_UIContentEffectManager objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v8);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)v35[5];
  if (v11)
    goto LABEL_5;
  location = 0;
  p_location = &location;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__199;
  v32 = __Block_byref_object_dispose__199;
  v33 = 0;
  -[_UIContentEffectManager effects](self, "effects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __73___UIContentEffectManager_compatibleEffectForKey_descriptor_constructor___block_invoke;
  v24[3] = &unk_1E16E5220;
  v25 = v9;
  v26 = &location;
  v27 = &v34;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v24);

  if (p_location[5])
  {
    -[_UIContentEffectManager setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", 0);
    -[_UIContentEffectManager setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v35[5], v8);
  }

  _Block_object_dispose(&location, 8);
  v11 = (void *)v35[5];
  if (v11)
  {
LABEL_5:
    objc_msgSend(v11, "setDescriptor:andKey:", v9, v8);
  }
  else
  {
    v10[2](v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v35[5];
    v35[5] = v16;

    objc_initWeak(&location, self);
    v18 = (void *)v35[5];
    v19 = v13;
    v20 = 3221225472;
    v21 = __73___UIContentEffectManager_compatibleEffectForKey_descriptor_constructor___block_invoke_2;
    v22 = &unk_1E16E5248;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v18, "addCompletion:", &v19);
    -[_UIContentEffectManager setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v35[5], v8, v19, v20, v21, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  v14 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v14;
}

- (id)compatibleEffectForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int canTransitionBetweenEffects;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_UIContentEffectManager effects](self, "effects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "descriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        canTransitionBetweenEffects = _canTransitionBetweenEffects(v11, v4);

        if (canTransitionBetweenEffects)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_stopManagingEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIContentEffectManager effects](self, "effects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeysForObject:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    -[_UIContentEffectManager effects](self, "effects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsForKeys:", v7);

  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_UIContentEffectManager effects](self, "effects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_UIContentEffectManager effects](self, "effects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (NSMutableDictionary)effects
{
  return self->_effects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effects, 0);
}

@end
