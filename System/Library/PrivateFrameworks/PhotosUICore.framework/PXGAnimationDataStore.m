@implementation PXGAnimationDataStore

- ($5DCE149552560A4ED0B95FAFFDAC89D8)groupInfos
{
  return self->_groupInfos;
}

- (NSIndexSet)activeGroupIndexes
{
  return (NSIndexSet *)(id)-[NSMutableIndexSet copy](self->_activeGroupIndexes, "copy");
}

- (void)increaseMappedSpriteCountBy:(unsigned int)a3 usingAnimationIndex:(unsigned __int16)a4
{
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 *v10;

  v7 = -[PXGAnimationDataStore mappedSpriteCount](self, "mappedSpriteCount");
  v8 = v7 + a3;
  -[PXGAnimationDataStore setMappedSpriteCount:](self, "setMappedSpriteCount:", v8);
  if (v7 < v8)
  {
    v9 = v8 - v7;
    v10 = &self->_animationIndexBySpriteIndex[v7];
    do
    {
      *v10++ = a4;
      --v9;
    }
    while (v9);
  }
}

- (void)setMappedSpriteCount:(unsigned int)a3
{
  unsigned int mappedSpriteCapacity;

  self->_mappedSpriteCount = a3;
  mappedSpriteCapacity = self->_mappedSpriteCapacity;
  if (mappedSpriteCapacity < a3)
  {
    if (mappedSpriteCapacity)
    {
      do
        mappedSpriteCapacity *= 2;
      while (mappedSpriteCapacity < a3);
    }
    else
    {
      mappedSpriteCapacity = a3;
    }
    self->_mappedSpriteCapacity = mappedSpriteCapacity;
    _PXGArrayResize();
  }
}

- (unsigned)mappedSpriteCount
{
  return self->_mappedSpriteCount;
}

- (void)setMappedAnimationCount:(unsigned __int16)a3
{
  unsigned int v3;
  uint64_t mappedAnimationCount;
  unsigned int mappedAnimationCapacity;

  v3 = a3;
  mappedAnimationCount = self->_mappedAnimationCount;
  self->_mappedAnimationCount = a3;
  mappedAnimationCapacity = self->_mappedAnimationCapacity;
  if (mappedAnimationCapacity < a3)
  {
    if (self->_mappedAnimationCapacity)
    {
      do
        LOWORD(mappedAnimationCapacity) = 2 * mappedAnimationCapacity;
      while ((mappedAnimationCapacity & 0xFFFE) < a3);
    }
    else
    {
      LOWORD(mappedAnimationCapacity) = a3;
    }
    self->_mappedAnimationCapacity = mappedAnimationCapacity;
    _PXGArrayResize();
  }
  if (mappedAnimationCount < v3)
    bzero(&self->_groupIndexByAnimationIndex[mappedAnimationCount], 2 * (v3 - mappedAnimationCount));
}

- ($B9FCB62F45F53760786F5E5547902FDF)spriteInfos
{
  return self->_spriteInfos;
}

- (unsigned)animationIndexBySpriteIndex
{
  return self->_animationIndexBySpriteIndex;
}

- (unsigned)groupIndexByAnimationIndex
{
  return self->_groupIndexByAnimationIndex;
}

- (void)applySpriteChangeDetails:(id)a3
{
  id v4;
  $B9FCB62F45F53760786F5E5547902FDF *spriteInfos;
  unsigned int v6;
  _QWORD v7[5];

  v4 = a3;
  -[PXGAnimationDataStore setSpriteCount:](self, "setSpriteCount:", objc_msgSend(v4, "numberOfSpritesAfterChange")- objc_msgSend(v4, "numberOfSpritesBeforeChange")+ -[PXGAnimationDataStore spriteCount](self, "spriteCount"));
  spriteInfos = self->_spriteInfos;
  v6 = -[PXGAnimationDataStore spriteCount](self, "spriteCount");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PXGAnimationDataStore_applySpriteChangeDetails___block_invoke;
  v7[3] = &unk_1E5139EE8;
  v7[4] = self;
  objc_msgSend(v4, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", spriteInfos, 307, v6, v7, 0);

}

- (unsigned)spriteCount
{
  return self->_spriteCount;
}

- (void)setSpriteCount:(unsigned int)a3
{
  unsigned int spriteCapacity;

  self->_spriteCount = a3;
  spriteCapacity = self->_spriteCapacity;
  if (spriteCapacity < a3)
  {
    if (spriteCapacity)
    {
      do
        spriteCapacity *= 2;
      while (spriteCapacity < a3);
    }
    else
    {
      spriteCapacity = a3;
    }
    self->_spriteCapacity = spriteCapacity;
    _PXGArrayResize();
  }
}

- (PXGAnimationDataStore)init
{
  PXGAnimationDataStore *v2;
  NSMutableIndexSet *v3;
  NSMutableIndexSet *activeGroupIndexes;
  $5DCE149552560A4ED0B95FAFFDAC89D8 *groupInfos;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGAnimationDataStore;
  v2 = -[PXGAnimationDataStore init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    activeGroupIndexes = v2->_activeGroupIndexes;
    v2->_activeGroupIndexes = v3;

    -[PXGAnimationDataStore _resizeStorageToGroupIndex:](v2, "_resizeStorageToGroupIndex:", 0);
    groupInfos = v2->_groupInfos;
    *(_OWORD *)((char *)&groupInfos->var6 + 4) = 0u;
    *(_OWORD *)&groupInfos->var4.var1 = 0u;
    *(_OWORD *)&groupInfos->var5 = 0u;
    *(_OWORD *)&groupInfos->var0 = 0u;
    *(_OWORD *)&groupInfos->var2 = 0u;
  }
  return v2;
}

- (unsigned)checkOutGroup
{
  int v3;
  uint64_t v4;
  char v5;

  v3 = 1;
  do
  {
    v4 = (unsigned __int16)v3;
    v5 = -[NSMutableIndexSet containsIndex:](self->_activeGroupIndexes, "containsIndex:", (unsigned __int16)v3++);
  }
  while ((v5 & 1) != 0);
  -[PXGAnimationDataStore _resizeStorageToGroupIndex:](self, "_resizeStorageToGroupIndex:", v4);
  -[NSMutableIndexSet addIndex:](self->_activeGroupIndexes, "addIndex:", v4);
  return v4;
}

- (void)_resizeStorageToGroupIndex:(unsigned __int16)a3
{
  unsigned __int16 v3;
  unsigned int groupCapacity;

  v3 = a3 + 1;
  groupCapacity = self->_groupCapacity;
  if (groupCapacity < (unsigned __int16)(a3 + 1))
  {
    if (!self->_groupCapacity)
    {
      groupCapacity = 10;
      self->_groupCapacity = 10;
    }
    if (groupCapacity < v3)
    {
      do
        LOWORD(groupCapacity) = 2 * groupCapacity;
      while ((groupCapacity & 0xFFFE) < v3);
      self->_groupCapacity = groupCapacity;
    }
    _PXGArrayResize();
  }
}

uint64_t __50__PXGAnimationDataStore_applySpriteChangeDetails___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (HIDWORD(a2) + a2);
  if (v2 > a2)
  {
    v3 = v2 - a2;
    v4 = 307 * a2;
    do
    {
      v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 48) + v4;
      *(_OWORD *)(v5 + 272) = 0uLL;
      *(_OWORD *)(v5 + 288) = 0uLL;
      *(_OWORD *)(v5 + 240) = 0uLL;
      *(_OWORD *)(v5 + 256) = 0uLL;
      *(_OWORD *)(v5 + 208) = 0uLL;
      *(_OWORD *)(v5 + 224) = 0uLL;
      *(_OWORD *)(v5 + 176) = 0uLL;
      *(_OWORD *)(v5 + 192) = 0uLL;
      *(_OWORD *)(v5 + 144) = 0uLL;
      *(_OWORD *)(v5 + 160) = 0uLL;
      *(_OWORD *)(v5 + 112) = 0uLL;
      *(_OWORD *)(v5 + 128) = 0uLL;
      *(_OWORD *)(v5 + 80) = 0uLL;
      *(_OWORD *)(v5 + 96) = 0uLL;
      *(_OWORD *)(v5 + 48) = 0uLL;
      *(_OWORD *)(v5 + 64) = 0uLL;
      *(_OWORD *)(v5 + 16) = 0uLL;
      *(_OWORD *)(v5 + 32) = 0uLL;
      *(_OWORD *)v5 = 0uLL;
      *(_DWORD *)(v5 + 303) = 0;
      v4 += 307;
      --v3;
    }
    while (v3);
  }
  return result;
}

- (void)checkInGroupAtIndexes:(id)a3
{
  -[NSMutableIndexSet removeIndexes:](self->_activeGroupIndexes, "removeIndexes:", a3);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_spriteInfos);
  free(self->_groupInfos);
  free(self->_animationIndexBySpriteIndex);
  free(self->_groupIndexByAnimationIndex);
  v3.receiver = self;
  v3.super_class = (Class)PXGAnimationDataStore;
  -[PXGAnimationDataStore dealloc](&v3, sel_dealloc);
}

- (id)spriteIndexesExpiringAtTime:(double)a3
{
  unsigned int v5;
  PXGAnimationDataStore *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;

  v5 = -[PXGAnimationDataStore spriteCount](self, "spriteCount");
  v6 = objc_retainAutorelease(self);
  v7 = -[PXGAnimationDataStore spriteInfos](v6, "spriteInfos");
  v8 = -[PXGAnimationDataStore groupInfos](objc_retainAutorelease(v6), "groupInfos");
  if (v5)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = (_BYTE *)(v7 + 306);
    do
    {
      if ((*v12 & 1) != 0
        && *(double *)(v9 + 76 * *((unsigned __int16 *)v12 - 1) + 16) <= a3
        && !*(_QWORD *)(v9 + 76 * *((unsigned __int16 *)v12 - 1) + 52))
      {
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "addIndex:", v10);
      }
      ++v10;
      v12 += 307;
    }
    while (v5 != v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSString)diagnosticDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  PXGAnimationDataStore *v9;
  uint64_t v10;
  char *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  NSMutableIndexSet *activeGroupIndexes;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  PXGAnimationDataStore *v21;
  _BYTE __dst[307];

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXGAnimationDataStore spriteCount](self, "spriteCount");
  v8 = v7;
  objc_msgSend(v6, "appendFormat:", CFSTR("%li sprites:\n"), v7);
  v9 = objc_retainAutorelease(self);
  v10 = -[PXGAnimationDataStore spriteInfos](v9, "spriteInfos");
  if (v7)
  {
    v11 = (char *)v10;
    for (i = 0; i != v7; ++i)
    {
      memcpy(__dst, v11, sizeof(__dst));
      PXGAnimationSpriteInfoDescription(__dst);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("\t%li\t%@\n"), i, v13);

      v11 += 307;
    }
    objc_msgSend(v6, "appendFormat:", CFSTR("Animation indexes:\n"));
    v14 = 0;
    do
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("\t%li\t%hu\n"), v14, v9->_animationIndexBySpriteIndex[v14]);
      ++v14;
    }
    while (v8 != v14);
  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("Animation indexes:\n"));
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("%li active groups:\n"), -[NSMutableIndexSet count](v9->_activeGroupIndexes, "count"));
  activeGroupIndexes = v9->_activeGroupIndexes;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__PXGAnimationDataStore_diagnosticDescription__block_invoke;
  v19[3] = &unk_1E51460E8;
  v16 = v6;
  v20 = v16;
  v21 = v9;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](activeGroupIndexes, "enumerateIndexesUsingBlock:", v19);
  objc_msgSend(v16, "appendString:", CFSTR(">"));
  v17 = v16;

  return (NSString *)v17;
}

- (unsigned)mappedAnimationCount
{
  return self->_mappedAnimationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeGroupIndexes, 0);
}

void __46__PXGAnimationDataStore_diagnosticDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  id v7;
  _OWORD v8[3];
  _OWORD v9[2];

  v3 = *(void **)(a1 + 32);
  v4 = (_OWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "groupInfos") + 76 * a2);
  v5 = v4[3];
  v8[2] = v4[2];
  v9[0] = v5;
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)((char *)v4 + 60);
  v6 = v4[1];
  v8[0] = *v4;
  v8[1] = v6;
  PXGAnimationGroupInfoDescription((uint64_t)v8);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\t%li\t%@\n"), a2, v7);

}

@end
