@implementation PXGBaseTexture

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (void)removeSpriteIndex:(unsigned int)a3
{
  -[NSMutableIndexSet removeIndex:](self->_spriteIndexes, "removeIndex:", a3);
}

uint64_t __41__PXGBaseTexture_enumerateSpriteIndexes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__PXGBaseTexture_getSpriteIndexes_maxSpriteCount___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2 + a3;
  if (a2 + a3 > a2)
  {
    v5 = *(_QWORD *)(result + 40);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
    while (1)
    {
      *(_DWORD *)(v5 + 4 * v6) = a2;
      v6 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
      if (v6 == *(_DWORD *)(result + 48))
        break;
      a2 = (a2 + 1);
      if (v4 <= a2)
        return result;
    }
    *a4 = 1;
  }
  return result;
}

- (void)setIsDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (BOOL)removePendingSpriteWithTextureRequestID:(int)a3 ifDeliveredBefore:(unsigned int)a4
{
  char v4;
  _QWORD v6[5];
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__PXGBaseTexture_removePendingSpriteWithTextureRequestID_ifDeliveredBefore___block_invoke;
  v6[3] = &unk_251A6EA90;
  v7 = a3;
  v8 = a4;
  v6[4] = &v9;
  -[PXGBaseTexture _filterPendingTextureRequestIDsWithPredicate:](self, "_filterPendingTextureRequestIDsWithPredicate:", v6);
  v4 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)_filterPendingTextureRequestIDsWithPredicate:(id)a3
{
  int64_t lock_pendingImageRequestInfoCount;
  unint64_t v5;
  int64_t v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  if (lock_pendingImageRequestInfoCount >= 1)
  {
    v5 = lock_pendingImageRequestInfoCount + 1;
    v6 = lock_pendingImageRequestInfoCount;
    do
    {
      if (((*((uint64_t (**)(id, _QWORD, _QWORD))v7 + 2))(v7, self->_lock_pendingImageRequestInfo[v6 - 1].var0, self->_lock_pendingImageRequestInfo[v6 - 1].var1) & 1) == 0)
      {
        _PXGArrayRemoveRange((uint64_t)self->_lock_pendingImageRequestInfo, 8, self->_lock_pendingImageRequestInfoCount, v5 - 2, 1);
        --self->_lock_pendingImageRequestInfoCount;
      }
      --v5;
      --v6;
    }
    while (v5 > 1);
  }
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __76__PXGBaseTexture_removePendingSpriteWithTextureRequestID_ifDeliveredBefore___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  unsigned int v4;
  uint64_t result;

  if (*(_DWORD *)(a1 + 40) != a2)
    return 1;
  v4 = *(_DWORD *)(a1 + 44);
  result = 1;
  if (v4 > a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_lock_pendingImageRequestInfo);
  v3.receiver = self;
  v3.super_class = (Class)PXGBaseTexture;
  -[PXGBaseTexture dealloc](&v3, sel_dealloc);
}

- (PXGBaseTexture)init
{
  PXGBaseTexture *v2;
  PXGBaseTexture *v3;
  NSMutableIndexSet *v4;
  NSMutableIndexSet *spriteIndexes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGBaseTexture;
  v2 = -[PXGBaseTexture init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    spriteIndexes = v3->_spriteIndexes;
    v3->_spriteIndexes = v4;

  }
  return v3;
}

- (BOOL)hasPendingTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4
{
  os_unfair_lock_s *p_lock;
  int64_t lock_pendingImageRequestInfoCount;
  uint64_t v9;
  unsigned int *p_var1;
  BOOL v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  if (lock_pendingImageRequestInfoCount < 1)
  {
    v11 = 0;
  }
  else
  {
    v9 = 0;
    p_var1 = &self->_lock_pendingImageRequestInfo->var1;
    v11 = 1;
    do
    {
      if (*(p_var1 - 1) == a3 && *p_var1 == a4)
        break;
      v11 = ++v9 < lock_pendingImageRequestInfoCount;
      p_var1 += 2;
    }
    while (lock_pendingImageRequestInfoCount != v9);
  }
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)enumerateSpriteIndexes:(id)a3
{
  id v4;
  NSMutableIndexSet *spriteIndexes;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  spriteIndexes = self->_spriteIndexes;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__PXGBaseTexture_enumerateSpriteIndexes___block_invoke;
  v7[3] = &unk_251A6EAE0;
  v8 = v4;
  v6 = v4;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](spriteIndexes, "enumerateIndexesUsingBlock:", v7);

}

- (void)addSpriteWithTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_pendingImageRequestInfoCount;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  self->_lock_pendingImageRequestInfoCount = lock_pendingImageRequestInfoCount + 1;
  -[PXGBaseTexture _lock_resizeStorageIfNeeded](self, "_lock_resizeStorageIfNeeded");
  v9 = &self->_lock_pendingImageRequestInfo[lock_pendingImageRequestInfoCount];
  v9->var0 = a3;
  v9->var1 = a4;
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_resizeStorageIfNeeded
{
  unint64_t lock_pendingImageRequestInfoCapacity;
  unint64_t lock_pendingImageRequestInfoCount;
  BOOL v5;

  os_unfair_lock_assert_owner(&self->_lock);
  lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  lock_pendingImageRequestInfoCapacity = self->_lock_pendingImageRequestInfoCapacity;
  if (lock_pendingImageRequestInfoCount > lock_pendingImageRequestInfoCapacity)
  {
    if (!lock_pendingImageRequestInfoCapacity)
    {
      lock_pendingImageRequestInfoCapacity = 4;
      self->_lock_pendingImageRequestInfoCapacity = 4;
    }
    if (lock_pendingImageRequestInfoCount > lock_pendingImageRequestInfoCapacity)
    {
      do
      {
        v5 = lock_pendingImageRequestInfoCount > 2 * lock_pendingImageRequestInfoCapacity;
        lock_pendingImageRequestInfoCapacity *= 2;
      }
      while (v5);
      self->_lock_pendingImageRequestInfoCapacity = lock_pendingImageRequestInfoCapacity;
    }
    self->_lock_pendingImageRequestInfo = ($7E3FC3C8846FD6918BD0D88F3AA609C8 *)malloc_type_realloc(self->_lock_pendingImageRequestInfo, 8* lock_pendingImageRequestInfoCapacity, 0xFA539D40uLL);
  }
}

- (NSIndexSet)spriteIndexes
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_spriteIndexes, "copy");
}

- (void)processPendingTextureRequestIDsWithHandler:(id)a3
{
  int64_t lock_pendingImageRequestInfoCount;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  if (lock_pendingImageRequestInfoCount >= 1)
  {
    v5 = 0;
    do
    {
      v6 = (*((uint64_t (**)(id, _QWORD, _QWORD))v7 + 2))(v7, self->_lock_pendingImageRequestInfo[v5].var0, self->_lock_pendingImageRequestInfo[v5].var1);
      if ((_DWORD)v6 != -1)
        -[PXGBaseTexture _addSpriteIndex:](self, "_addSpriteIndex:", v6);
      ++v5;
      --lock_pendingImageRequestInfoCount;
    }
    while (lock_pendingImageRequestInfoCount);
  }
  self->_lock_pendingImageRequestInfoCount = 0;
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_addSpriteIndex:(unsigned int)a3
{
  -[NSMutableIndexSet addIndex:](self->_spriteIndexes, "addIndex:", a3);
}

- (BOOL)hasSprites
{
  BOOL v3;
  os_unfair_lock_s *p_lock;

  if (-[NSMutableIndexSet count](self->_spriteIndexes, "count"))
    return 1;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = self->_lock_pendingImageRequestInfoCount != 0;
  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (void)getSpriteIndexes:(unsigned int *)a3 maxSpriteCount:(unsigned int)a4
{
  NSMutableIndexSet *spriteIndexes;
  void *v9;
  _QWORD v10[6];
  unsigned int v11;
  _QWORD v12[4];

  if (-[PXGBaseTexture spriteCount](self, "spriteCount") < a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGBaseTexture.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxSpriteCount <= self.spriteCount"));

  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  spriteIndexes = self->_spriteIndexes;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__PXGBaseTexture_getSpriteIndexes_maxSpriteCount___block_invoke;
  v10[3] = &unk_251A6EAB8;
  v10[4] = v12;
  v10[5] = a3;
  v11 = a4;
  -[NSMutableIndexSet enumerateRangesUsingBlock:](spriteIndexes, "enumerateRangesUsingBlock:", v10);
  _Block_object_dispose(v12, 8);
}

- (unsigned)spriteCount
{
  return -[NSMutableIndexSet count](self->_spriteIndexes, "count");
}

- (void)applyChangeDetails:(id)a3
{
  void *v4;
  NSMutableIndexSet *v5;
  NSMutableIndexSet *spriteIndexes;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "hasAnyInsertionsRemovalsOrMoves"))
  {
    objc_msgSend(v7, "indexSetAfterApplyingChangeDetails:", self->_spriteIndexes);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableIndexSet *)objc_msgSend(v4, "mutableCopy");
    spriteIndexes = self->_spriteIndexes;
    self->_spriteIndexes = v5;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteIndexes, 0);
}

- (void)addSpriteIndexRange:(_NSRange)a3
{
  -[NSMutableIndexSet addIndexesInRange:](self->_spriteIndexes, "addIndexesInRange:", a3.location, a3.length);
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t lock_pendingImageRequestInfoCount;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)PXGBaseTexture;
  -[PXGBaseTexture description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  -[NSMutableIndexSet px_shortDescription](self->_spriteIndexes, "px_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ pendingRequestIDs:%lu spriteIndexes:%@ >"), v4, lock_pendingImageRequestInfoCount, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)addSpriteIndexes:(id)a3
{
  -[NSMutableIndexSet addIndexes:](self->_spriteIndexes, "addIndexes:", a3);
}

- (void)removeAllSpriteIndexes
{
  -[NSMutableIndexSet removeAllIndexes](self->_spriteIndexes, "removeAllIndexes");
}

- (BOOL)containsSpriteIndex:(unsigned int)a3
{
  return -[NSMutableIndexSet containsIndex:](self->_spriteIndexes, "containsIndex:", a3);
}

- (int64_t)estimatedByteSize
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGBaseTexture.m"), 211, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGBaseTexture estimatedByteSize]", v6);

  abort();
}

- (unsigned)presentationType
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGBaseTexture.m"), 215, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGBaseTexture presentationType]", v6);

  abort();
}

- (CGImage)imageRepresentation
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGBaseTexture.m"), 219, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGBaseTexture imageRepresentation]", v6);

  abort();
}

- (CGSize)pixelSize
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGBaseTexture.m"), 223, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGBaseTexture pixelSize]", v6);

  abort();
}

- (BOOL)isOpaque
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGBaseTexture.m"), 227, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGBaseTexture isOpaque]", v6);

  abort();
}

@end
