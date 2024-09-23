@implementation _UICompoundEffect

- (int64_t)_expectedUsage
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35___UICompoundEffect__expectedUsage__block_invoke;
  v4[3] = &unk_1E16B52B0;
  v4[4] = &v5;
  -[_UICompoundEffect _enumerateEffects:](self, "_enumerateEffects:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_enumerateEffects:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_effects;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (_UICompoundEffect)initWithEffects:(id)a3
{
  id v4;
  _UICompoundEffect *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *effects;
  id v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UICompoundEffect;
  v5 = -[_UICompoundEffect init](&v19, sel_init);
  if (v5)
  {
    v18 = v4;
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
          v20[0] = v12;
          v20[1] = 3221225472;
          v20[2] = ___UICompoundEffectFlatten_block_invoke;
          v20[3] = &unk_1E16B5300;
          v21 = v7;
          objc_msgSend(v14, "_enumerateEffects:", v20);

          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    v15 = objc_msgSend(v7, "copy");
    effects = v5->_effects;
    v5->_effects = (NSArray *)v15;

    v4 = v18;
  }

  return v5;
}

- (_UICompoundEffect)initWithCoder:(id)a3
{
  id v4;
  _UICompoundEffect *v5;
  uint64_t v6;
  NSArray *effects;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICompoundEffect;
  v5 = -[UIVisualEffect initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_UICompoundEffectSubEffects"));
    v6 = objc_claimAutoreleasedReturnValue();
    effects = v5->_effects;
    v5->_effects = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICompoundEffect;
  v4 = a3;
  -[UIVisualEffect encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_effects, CFSTR("_UICompoundEffectSubEffects"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_effects, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4[1], "isEqualToArray:", self->_effects);
  else
    v5 = 0;

  return v5;
}

- (id)_allEffects
{
  return self->_effects;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 changedTraits:(id)a5 usage:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96___UICompoundEffect__needsUpdateForTransitionFromEnvironment_toEnvironment_changedTraits_usage___block_invoke;
  v17[3] = &unk_1E16B5288;
  v13 = v10;
  v18 = v13;
  v14 = v11;
  v19 = v14;
  v15 = v12;
  v21 = &v23;
  v22 = a6;
  v20 = v15;
  -[_UICompoundEffect _enumerateEffects:](self, "_enumerateEffects:", v17);
  LOBYTE(a6) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return a6;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changedTraitsFromTraitCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[_UICompoundEffect _needsUpdateForTransitionFromEnvironment:toEnvironment:changedTraits:usage:](self, "_needsUpdateForTransitionFromEnvironment:toEnvironment:changedTraits:usage:", v9, v8, v12, a5);
  return a5;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> combinedEffects = %@"), v5, self, self->_effects);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effects, 0);
}

@end
