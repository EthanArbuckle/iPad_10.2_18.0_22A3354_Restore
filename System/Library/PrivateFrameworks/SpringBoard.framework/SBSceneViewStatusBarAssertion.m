@implementation SBSceneViewStatusBarAssertion

- (void)_notifyObserversDidInvalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "statusBarAssertionDidInvalidate:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversDidUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "statusBarAssertionDidUpdate:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (SBStatusBarSettings)settings
{
  return self->_settings;
}

- (BOOL)isStatusBarHidden
{
  void *v3;
  void *v4;
  char IsZero;

  -[SBStatusBarSettings alpha](self->_settings, "alpha");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SBStatusBarSettings alpha](self->_settings, "alpha");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  IsZero = BSFloatIsZero();

  return IsZero;
}

- (void)setSettings:(id)a3
{
  SBStatusBarSettings *v4;
  SBStatusBarSettings *settings;
  id v6;

  v6 = a3;
  if (!-[SBStatusBarSettings isEqual:](self->_settings, "isEqual:"))
  {
    v4 = (SBStatusBarSettings *)objc_msgSend(v6, "copy");
    settings = self->_settings;
    self->_settings = v4;

    -[SBSceneViewStatusBarAssertion _notifyObserversDidUpdate](self, "_notifyObserversDidUpdate");
  }

}

- (void)setNubViewHidden:(int64_t)a3
{
  if (self->_nubViewHidden != a3)
  {
    self->_nubViewHidden = a3;
    -[SBSceneViewStatusBarAssertion _notifyObserversDidUpdate](self, "_notifyObserversDidUpdate");
  }
}

- (void)setStatusBarHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[SBSceneViewStatusBarAssertion isStatusBarHidden](self, "isStatusBarHidden") != a3)
  {
    v6 = (id)-[SBStatusBarSettings mutableCopy](self->_settings, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", v5);

    -[SBSceneViewStatusBarAssertion setSettings:](self, "setSettings:", v6);
  }
}

- (void)addObserver:(id)a3
{
  BOOL v4;
  void *v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ cannot be observed by a nil object"), objc_opt_class());
LABEL_7:
    v5 = v9;
    goto LABEL_8;
  }
  v4 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v9);
  v5 = v9;
  if (!v4)
  {
    observers = self->_observers;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (SBSceneViewStatusBarAssertion)initWithStatusBarSettings:(id)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  id v8;
  SBSceneViewStatusBarAssertion *v9;
  uint64_t v10;
  SBStatusBarSettings *settings;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSceneViewStatusBarAssertion;
  v9 = -[SBSceneViewStatusBarAssertion init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    settings = v9->_settings;
    v9->_settings = (SBStatusBarSettings *)v10;

    v9->_nubViewHidden = a4;
    v9->_level = a5;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSceneViewStatusBarAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSceneViewStatusBarAssertion;
  -[SBSceneViewStatusBarAssertion dealloc](&v3, sel_dealloc);
}

- (int64_t)nubViewHidden
{
  return self->_nubViewHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (SBSceneViewStatusBarAssertion)initWithStatusBarHidden:(BOOL)a3 nubViewHidden:(int64_t)a4 atLevel:(unint64_t)a5
{
  _BOOL4 v7;
  SBMutableStatusBarSettings *v9;
  double v10;
  void *v11;
  SBSceneViewStatusBarAssertion *v12;

  v7 = a3;
  v9 = objc_alloc_init(SBMutableStatusBarSettings);
  v10 = 1.0;
  if (v7)
    v10 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMutableStatusBarSettings setAlpha:](v9, "setAlpha:", v11);

  v12 = -[SBSceneViewStatusBarAssertion initWithStatusBarSettings:nubViewHidden:atLevel:](self, "initWithStatusBarSettings:nubViewHidden:atLevel:", v9, a4, a5);
  return v12;
}

- (NSString)description
{
  return (NSString *)-[SBSceneViewStatusBarAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSceneViewStatusBarAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  unint64_t level;
  __CFString *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  level = self->_level;
  if (level >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown %lu)"), self->_level);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E8EA5540[level];
  }
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("level"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBSceneViewStatusBarAssertion isStatusBarHidden](self, "isStatusBarHidden"), CFSTR("statusBarHidden"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", BSSettingFlagIsYes(), CFSTR("nubHidden"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneViewStatusBarAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSceneViewStatusBarAssertion *v11;

  v4 = a3;
  -[SBSceneViewStatusBarAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SBSceneViewStatusBarAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __71__SBSceneViewStatusBarAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("settings"));
}

- (unint64_t)level
{
  return self->_level;
}

@end
