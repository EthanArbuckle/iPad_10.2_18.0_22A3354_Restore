@implementation PXGEffect

- (PXGEffect)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEffect.m"), 48, CFSTR("%s is not available as initializer"), "-[PXGEffect init]");

  abort();
}

- (PXGEffect)initWithEntityManager:(id)a3
{
  id v5;
  PXGEffect *v6;
  PXGEffect *v7;
  unsigned int v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  void *v16;
  void *v18;
  objc_super v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEffect.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityManager != nil"));

  }
  v19.receiver = self;
  v19.super_class = (Class)PXGEffect;
  v6 = -[PXGEffect init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    do
      v8 = __ldaxr(initWithEntityManager__lastRequestID);
    while (__stlxr(v8 + 1, initWithEntityManager__lastRequestID));
    v6->_effectId = v8;
    objc_storeWeak((id *)&v6->_entityManager, v5);
    objc_msgSend(v5, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v7->_scale = _Q0;
    objc_msgSend(v5, "effectComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerEffect:withEffectId:", v7, v7->_effectId);

  }
  return v7;
}

- (void)dealloc
{
  unsigned int effectId;
  id WeakRetained;
  NSObject *queue;
  id v6;
  objc_super v7;
  _QWORD block[4];
  id v9;
  unsigned int v10;

  effectId = self->_effectId;
  WeakRetained = objc_loadWeakRetained((id *)&self->_entityManager);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__PXGEffect_dealloc__block_invoke;
  block[3] = &unk_251A6EB28;
  v9 = WeakRetained;
  v10 = effectId;
  v6 = WeakRetained;
  dispatch_async(queue, block);

  v7.receiver = self;
  v7.super_class = (Class)PXGEffect;
  -[PXGEffect dealloc](&v7, sel_dealloc);
}

- (unsigned)effectId
{
  void *v3;
  void *v4;

  if (!self->_didNotifyOfUse)
  {
    self->_didNotifyOfUse = 1;
    -[PXGEffect entityManager](self, "entityManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effectComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didUseEffect:", self);

  }
  return self->_effectId;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGEffect effectId](self, "effectId");
  -[PXGEffect shader](self, "shader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; effectId = %d, shader = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PXGShader)shader
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEffect.m"), 88, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGEffect shader]", v6);

  abort();
}

- (PXGKernel)kernel
{
  return 0;
}

- (id)createSiblingsTextureForMainSpriteTexture:(id)a3
{
  return 0;
}

- (void)configureSiblingSprites:(id *)a3 siblingsSpriteIndexRange:(_PXGSpriteIndexRange)a4 siblingsTexture:(id)a5 forMainRenderSpriteRef:(id *)a6 mainPresentationSpriteRef:(id *)a7 mainSpriteIndex:(unsigned int)a8 mainSpriteTexture:(id)a9 screenScale:(double)a10
{
  id v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v12 = a5;
  v13 = a9;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEffect.m"), 107, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGEffect configureSiblingSprites:siblingsSpriteIndexRange:siblingsTexture:forMainRenderSpriteRef:mainPresentationSpriteRef:mainSpriteIndex:mainSpriteTexture:screenScale:]", v16);

  abort();
}

- (PXGEntityManager)entityManager
{
  return (PXGEntityManager *)objc_loadWeakRetained((id *)&self->_entityManager);
}

- (unint64_t)numberOfSiblingSprites
{
  return self->_numberOfSiblingSprites;
}

- (void)setNumberOfSiblingSprites:(unint64_t)a3
{
  self->_numberOfSiblingSprites = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (void)setDrawingScale:(double)a3
{
  self->_drawingScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_entityManager);
}

void __20__PXGEffect_dealloc__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "effectComponent");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterEffectId:", *(unsigned int *)(a1 + 40));

}

+ (id)shaderSourceForFilename:(id)a3
{
  id v5;
  id v6;
  PXGShaderSource *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  id v16;

  v5 = a3;
  if (shaderSourceForFilename__onceToken != -1)
    dispatch_once(&shaderSourceForFilename__onceToken, &__block_literal_global_1891);
  v6 = a1;
  objc_sync_enter(v6);
  objc_msgSend((id)shaderSourceForFilename__sharedCache, "objectForKeyedSubscript:", v5);
  v7 = (PXGShaderSource *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForResource:withExtension:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v11, 4, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PXGEffect.m"), 39, CFSTR("Error:%@ loading file at path:%@"), v13, v11);

    }
    v7 = -[PXGShaderSource initWithSource:]([PXGShaderSource alloc], "initWithSource:", v12);
    objc_msgSend((id)shaderSourceForFilename__sharedCache, "setObject:forKeyedSubscript:", v7, v5);

  }
  objc_sync_exit(v6);

  return v7;
}

void __37__PXGEffect_shaderSourceForFilename___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)shaderSourceForFilename__sharedCache;
  shaderSourceForFilename__sharedCache = (uint64_t)v0;

}

@end
