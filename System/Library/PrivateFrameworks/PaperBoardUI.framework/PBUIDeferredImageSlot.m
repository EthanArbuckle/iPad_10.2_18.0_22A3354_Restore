@implementation PBUIDeferredImageSlot

- (PBUIDeferredImageSlot)initWithLifetimeToken:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIDeferredImageSlot;
  return (PBUIDeferredImageSlot *)-[PBUIImageSlot _initWithImage:lifetimeToken:](&v4, sel__initWithImage_lifetimeToken_, 0, a3);
}

- (void)updateWithImage:(id)a3
{
  _QWORD block[5];

  -[PBUIImageSlot _setImage:](self, "_setImage:", a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PBUIDeferredImageSlot_updateWithImage___block_invoke;
  block[3] = &unk_1E6B94728;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __41__PBUIDeferredImageSlot_updateWithImage___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(v8, "image", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "deferredImageSlot:didUpdateImage:", v8, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)addImageSlotObserver:(id)a3
{
  id v4;
  NSHashTable *imageSlotObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  imageSlotObservers = self->_imageSlotObservers;
  v8 = v4;
  if (!imageSlotObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_imageSlotObservers;
    self->_imageSlotObservers = v6;

    v4 = v8;
    imageSlotObservers = self->_imageSlotObservers;
  }
  -[NSHashTable addObject:](imageSlotObservers, "addObject:", v4);

}

- (void)removeImageSlotObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_imageSlotObservers, "removeObject:", a3);
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (void)setFallbackColor:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_imageSlotObservers, 0);
}

@end
