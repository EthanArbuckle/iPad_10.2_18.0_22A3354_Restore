@implementation PXGCombinedEffect

- (PXGCombinedEffect)initWithEntityManager:(id)a3
{
  return -[PXGCombinedEffect initWithEffects:](self, "initWithEffects:", MEMORY[0x24BDBD1A8]);
}

- (PXGCombinedEffect)initWithEffects:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  id v7;
  void *v8;
  void *v9;
  PXGCombinedEffect *v10;
  uint64_t v11;
  NSArray *effects;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  unint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PXGShader *v32;
  PXGShader *combinedShader;
  void *v35;
  SEL v36;
  PXGCombinedEffect *v37;
  id v38;
  id obj;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGCombinedEffect.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("effects.count > 0"));

  }
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46.receiver = self;
  v46.super_class = (Class)PXGCombinedEffect;
  v10 = -[PXGEffect initWithEntityManager:](&v46, sel_initWithEntityManager_, v9);

  if (v10)
  {
    v36 = a2;
    v11 = objc_msgSend(v7, "copy");
    effects = v10->_effects;
    v37 = v10;
    v10->_effects = (NSArray *)v11;

    v13 = PXGShaderOpcodesNull;
    v14 = dword_2578659D0;
    v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v38 = v7;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v16)
    {
      v17 = v16;
      v41 = *(_QWORD *)v43;
      obj = v15;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v41)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v19, "shader");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "opcodes");
          v23 = v22;

          if ((_DWORD)v21 == (_DWORD)PXGShaderOpcodesNull
            && HIDWORD(v21) == HIDWORD(PXGShaderOpcodesNull)
            && dword_2578659D0 == v23)
          {
            continue;
          }
          v3 = v3 & 0xFFFFFFFF00000000 | v14;
          v4 = v23 | v4 & 0xFFFFFFFF00000000;
          v13 = PXGShaderOpcodesAppending(v13, v3, v21, v4);
          v14 = v25;
          objc_msgSend(v19, "shader");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "uniforms");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObjectsFromArray:", v27);

        }
        v15 = obj;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v17);
    }

    +[PXGCombinedEffect combinedShaderSourceForEffects:](PXGCombinedEffect, "combinedShaderSourceForEffects:", v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v10 = v37;
    if (v28)
    {
      objc_msgSend(v28, "aliasedUniformsForEffects:", v15);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObjectsFromArray:", v30);

      if (v13 != PXGShaderOpcodesNull || v14 != dword_2578659D0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", v36, v37, CFSTR("PXGCombinedEffect.m"), 96, CFSTR("Mixing opcode and source backed shaders isn't currently supported: %@"), v15);

      }
    }
    v32 = -[PXGShader initWithOpcodes:source:uniforms:components:]([PXGShader alloc], "initWithOpcodes:source:uniforms:components:", v13, v14, v29, v40, 0);
    combinedShader = v37->_combinedShader;
    v37->_combinedShader = v32;

    v7 = v38;
  }

  return v10;
}

- (id)shader
{
  return self->_combinedShader;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[PXGCombinedEffect effects](self, "effects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p; effectId = %d, subEffects = %@>"),
    v8,
    self,
    -[PXGEffect effectId](self, "effectId"),
    v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)effects
{
  return self->_effects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effects, 0);
  objc_storeStrong((id *)&self->_combinedShader, 0);
}

+ (id)combinedShaderSourceForEffects:(id)a3
{
  id v4;
  id v5;
  PXGCombinedShaderSource *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (combinedShaderSourceForEffects__onceToken != -1)
    dispatch_once(&combinedShaderSourceForEffects__onceToken, &__block_literal_global_2360);
  v5 = a1;
  objc_sync_enter(v5);
  if (objc_msgSend((id)combinedShaderSourceForEffects__lastReturned, "isValidForEffects:", v4))
  {
    v6 = (PXGCombinedShaderSource *)(id)combinedShaderSourceForEffects__lastReturned;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (id)combinedShaderSourceForEffects__sharedCache;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if ((objc_msgSend(v11, "isValidForEffects:", v4, (_QWORD)v13) & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v8)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v6 = v11;

      if (v6)
        goto LABEL_16;
    }
    else
    {
LABEL_13:

    }
    v6 = -[PXGCombinedShaderSource initWithEffects:]([PXGCombinedShaderSource alloc], "initWithEffects:", v4);
    objc_msgSend((id)combinedShaderSourceForEffects__sharedCache, "addObject:", v6);
LABEL_16:
    objc_storeStrong((id *)&combinedShaderSourceForEffects__lastReturned, v6);
  }
  objc_sync_exit(v5);

  if (-[PXGCombinedShaderSource isEmpty](v6, "isEmpty"))
  {

    v6 = 0;
  }

  return v6;
}

void __52__PXGCombinedEffect_combinedShaderSourceForEffects___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v1 = (void *)combinedShaderSourceForEffects__sharedCache;
  combinedShaderSourceForEffects__sharedCache = (uint64_t)v0;

}

@end
