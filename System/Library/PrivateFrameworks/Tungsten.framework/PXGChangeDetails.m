@implementation PXGChangeDetails

- (unsigned)numberOfSpritesBeforeChange
{
  return self->_numberOfSpritesBeforeChange;
}

- (unsigned)numberOfSpritesAfterChange
{
  return self->_numberOfSpritesAfterChange;
}

- (void)setLayoutVersionBeforeChange:(int64_t)a3
{
  self->_layoutVersionBeforeChange = a3;
}

- (void)setLayoutVersionAfterChange:(int64_t)a3
{
  self->_layoutVersionAfterChange = a3;
}

- (NSIndexSet)removedSpriteIndexes
{
  return self->_spriteIndexesThatWereRemoved;
}

- (NSIndexSet)modifiedSpriteIndexes
{
  return self->_spriteIndexesThatWereModified;
}

- (const)spriteIndexAfterChangeBySpriteIndexBeforeChange
{
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
    return self->_nextSpriteIndexByPreviousSpriteIndex;
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_nextSpriteIndexByPreviousSpriteIndex);
  free(self->_tempBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PXGChangeDetails;
  -[PXGChangeDetails dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedArrayChangeDetails, 0);
  objc_storeStrong((id *)&self->_spriteIndexesThatWereModified, 0);
  objc_storeStrong((id *)&self->_spriteIndexesThatWereInserted, 0);
  objc_storeStrong((id *)&self->_spriteIndexesThatWereRemoved, 0);
}

- (void)applyToDictionary:(id)a3 removalHandler:(id)a4
{
  id v6;
  void *v7;
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  unsigned int *v13;

  v9 = a3;
  v6 = a4;
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    v7 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v9, "removeAllObjects");
    nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __53__PXGChangeDetails_applyToDictionary_removalHandler___block_invoke;
    v10[3] = &unk_251A6E5E0;
    v13 = nextSpriteIndexByPreviousSpriteIndex;
    v12 = v6;
    v11 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

- (void)configureWithNumberOfSpritesAfterChange:(unsigned int)a3 changeDetails:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  PXGChangeDetails *v20;
  void *v21;
  uint64_t numberOfSpritesBeforeChange;
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  uint64_t v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  NSIndexSet *spriteIndexesThatWereInserted;
  uint64_t v46;
  NSIndexSet *spriteIndexesThatWereModified;
  uint64_t v48;
  NSIndexSet *spriteIndexesThatWereRemoved;
  void *v50;
  PXGChangeDetails *v51;
  PXGChangeDetails *v52;
  uint64_t v53;
  unsigned int *v54;
  void *v55;
  void *v57;
  unsigned int v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[PXGChangeDetails _invalidateLayoutVersions](self, "_invalidateLayoutVersions");
  -[PXGChangeDetails _invalidateCachedArrayChangeDetails](self, "_invalidateCachedArrayChangeDetails");
  v51 = self;
  v58 = a3;
  self->_numberOfSpritesAfterChange = a3;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    LOBYTE(v11) = 0;
    v12 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v69 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v14, "insertedIndexes", v51);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        objc_msgSend(v14, "removedIndexes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if ((v11 & 1) != 0)
          v11 = 1;
        else
          v11 = objc_msgSend(v14, "hasAnyInsertionsRemovalsOrMoves");
        v10 = v16 + v10 - v18;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  v19 = v58 - v10;
  v20 = v51;
  if (v19 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v51, CFSTR("PXGChangeDetails.m"), 66, CFSTR("Invalid change details provided, numberOfSpritesBeforeChange would be < 0"));

  }
  v51->_numberOfSpritesBeforeChange = v19;
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet", v51);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[PXGChangeDetails _resizeStorageIfNeeded](v20, "_resizeStorageIfNeeded");
    numberOfSpritesBeforeChange = v20->_numberOfSpritesBeforeChange;
    nextSpriteIndexByPreviousSpriteIndex = v20->_nextSpriteIndexByPreviousSpriteIndex;
    v54 = nextSpriteIndexByPreviousSpriteIndex;
    if (v11)
    {
      objc_msgSend(v55, "addIndexesInRange:", 0, v20->_numberOfSpritesAfterChange);
      if ((_DWORD)numberOfSpritesBeforeChange)
      {
        v24 = 0;
        v25 = 0;
        v53 = numberOfSpritesBeforeChange;
        do
        {
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v26 = v7;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
          if (v27)
          {
            v28 = v27;
            LOBYTE(v29) = 0;
            v30 = *(_QWORD *)v65;
            v25 &= 1u;
            v59 = v24;
            v31 = v24;
            while (2)
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v65 != v30)
                  objc_enumerationMutation(v26);
                v33 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
                if ((v25 & 1) != 0 || (objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "hasMoves") & 1) != 0)
                  v25 = 1;
                else
                  v25 = objc_msgSend(v33, "hasIncrementalChanges") ^ 1;
                v34 = objc_msgSend(v33, "indexAfterApplyingChangesToIndex:", v31);
                if (v34 == 0x7FFFFFFFFFFFFFFFLL)
                {

                  v24 = v59;
                  objc_msgSend(v57, "addIndex:", v59);
                  LODWORD(v31) = -1;
                  numberOfSpritesBeforeChange = v53;
                  nextSpriteIndexByPreviousSpriteIndex = v54;
                  goto LABEL_39;
                }
                v31 = v34;
                if ((v29 & 1) != 0)
                {
                  v29 = 1;
                }
                else
                {
                  objc_msgSend(v33, "changedIndexes");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v35, "containsIndex:", v31);

                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
              if (v28)
                continue;
              break;
            }

            objc_msgSend(v55, "removeIndex:", v31);
            nextSpriteIndexByPreviousSpriteIndex = v54;
            if (v29)
              objc_msgSend(v21, "addIndex:", v31);
            numberOfSpritesBeforeChange = v53;
            v24 = v59;
          }
          else
          {

            objc_msgSend(v55, "removeIndex:", v24);
            LODWORD(v31) = v24;
          }
LABEL_39:
          nextSpriteIndexByPreviousSpriteIndex[v24++] = v31;
        }
        while (v24 != numberOfSpritesBeforeChange);
      }
      else
      {
        v25 = 0;
      }
      v43 = v25 & 1;
      goto LABEL_55;
    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v36 = v7;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v61 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "changedIndexes");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addIndexes:", v41);

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      }
      while (v38);
    }

    if (!(_DWORD)numberOfSpritesBeforeChange)
    {
      v43 = 0;
LABEL_55:
      v20 = v52;
      goto LABEL_56;
    }
    v42 = 0;
    v20 = v52;
    do
    {
      v54[v42] = v42;
      ++v42;
    }
    while (numberOfSpritesBeforeChange != v42);
  }
  v43 = 0;
LABEL_56:
  v44 = objc_msgSend(v55, "copy");
  spriteIndexesThatWereInserted = v20->_spriteIndexesThatWereInserted;
  v20->_spriteIndexesThatWereInserted = (NSIndexSet *)v44;

  v46 = objc_msgSend(v21, "copy");
  spriteIndexesThatWereModified = v20->_spriteIndexesThatWereModified;
  v20->_spriteIndexesThatWereModified = (NSIndexSet *)v46;

  v48 = objc_msgSend(v57, "copy");
  spriteIndexesThatWereRemoved = v20->_spriteIndexesThatWereRemoved;
  v20->_spriteIndexesThatWereRemoved = (NSIndexSet *)v48;

  v20->_hasMoves = v43;
}

- (void)applyToArray:(void *)a3 elementSize:(unint64_t)a4 countAfterChanges:(unint64_t)a5 insertionHandler:(id)a6 modifiedHandler:(id)a7
{
  id v13;
  uint64_t numberOfSpritesBeforeChange;
  int64_t v15;
  int64_t tempBufferCapacity;
  char *tempBuffer;
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  char *v19;
  uint64_t v20;
  unsigned int v21;
  NSIndexSet *spriteIndexesThatWereInserted;
  NSIndexSet *spriteIndexesThatWereModified;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;

  v25 = a6;
  v13 = a7;
  if (self->_numberOfSpritesAfterChange != a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGChangeDetails.m"), 425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("countAfterChanges == _numberOfSpritesAfterChange"));

  }
  numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    v15 = numberOfSpritesBeforeChange * a4;
    tempBufferCapacity = self->_tempBufferCapacity;
    if (tempBufferCapacity >= (uint64_t)(numberOfSpritesBeforeChange * a4))
    {
      tempBuffer = self->_tempBuffer;
    }
    else
    {
      if (!tempBufferCapacity)
      {
        tempBufferCapacity = 10;
        self->_tempBufferCapacity = 10;
      }
      if (tempBufferCapacity < v15)
      {
        do
          tempBufferCapacity *= 2;
        while (tempBufferCapacity < v15);
        self->_tempBufferCapacity = tempBufferCapacity;
      }
      tempBuffer = (char *)malloc_type_realloc(self->_tempBuffer, tempBufferCapacity, 0xB8FC66A4uLL);
      self->_tempBuffer = tempBuffer;
    }
    memcpy(tempBuffer, a3, numberOfSpritesBeforeChange * a4);
    if ((_DWORD)numberOfSpritesBeforeChange)
    {
      nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
      v19 = self->_tempBuffer;
      do
      {
        v21 = *nextSpriteIndexByPreviousSpriteIndex++;
        v20 = v21;
        if (v21 != -1)
          memcpy((char *)a3 + v20 * a4, v19, a4);
        v19 += a4;
        --numberOfSpritesBeforeChange;
      }
      while (numberOfSpritesBeforeChange);
    }
    if (v25)
    {
      spriteIndexesThatWereInserted = self->_spriteIndexesThatWereInserted;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __96__PXGChangeDetails_applyToArray_elementSize_countAfterChanges_insertionHandler_modifiedHandler___block_invoke;
      v28[3] = &unk_251A6E5B8;
      v29 = v25;
      -[NSIndexSet enumerateRangesUsingBlock:](spriteIndexesThatWereInserted, "enumerateRangesUsingBlock:", v28);

    }
  }
  if (v13)
  {
    spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __96__PXGChangeDetails_applyToArray_elementSize_countAfterChanges_insertionHandler_modifiedHandler___block_invoke_2;
    v26[3] = &unk_251A6E5B8;
    v27 = v13;
    -[NSIndexSet enumerateRangesUsingBlock:](spriteIndexesThatWereModified, "enumerateRangesUsingBlock:", v26);

  }
}

- (BOOL)hasAnyInsertionsRemovalsOrMoves
{
  return -[NSIndexSet count](self->_spriteIndexesThatWereRemoved, "count")
      || -[NSIndexSet count](self->_spriteIndexesThatWereInserted, "count")
      || self->_hasMoves;
}

- (void)_invalidateLayoutVersions
{
  self->_layoutVersionBeforeChange = 0;
  self->_layoutVersionAfterChange = 0;
}

- (void)_invalidateCachedArrayChangeDetails
{
  PXArrayChangeDetails *cachedArrayChangeDetails;

  cachedArrayChangeDetails = self->_cachedArrayChangeDetails;
  self->_cachedArrayChangeDetails = 0;

}

- (void)_resizeStorageIfNeeded
{
  int64_t numberOfSpritesBeforeChange;
  int64_t nextSpriteIndexByPreviousSpriteIndexCapacity;

  numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
  nextSpriteIndexByPreviousSpriteIndexCapacity = self->_nextSpriteIndexByPreviousSpriteIndexCapacity;
  if (nextSpriteIndexByPreviousSpriteIndexCapacity < numberOfSpritesBeforeChange)
  {
    if (!nextSpriteIndexByPreviousSpriteIndexCapacity)
    {
      nextSpriteIndexByPreviousSpriteIndexCapacity = 10;
      self->_nextSpriteIndexByPreviousSpriteIndexCapacity = 10;
    }
    if (nextSpriteIndexByPreviousSpriteIndexCapacity < numberOfSpritesBeforeChange)
    {
      do
        nextSpriteIndexByPreviousSpriteIndexCapacity *= 2;
      while (nextSpriteIndexByPreviousSpriteIndexCapacity < numberOfSpritesBeforeChange);
      self->_nextSpriteIndexByPreviousSpriteIndexCapacity = nextSpriteIndexByPreviousSpriteIndexCapacity;
    }
    self->_nextSpriteIndexByPreviousSpriteIndex = (unsigned int *)malloc_type_realloc(self->_nextSpriteIndexByPreviousSpriteIndex, 4 * nextSpriteIndexByPreviousSpriteIndexCapacity, 0xFA539D40uLL);
  }
}

- (id)indexSetAfterApplyingChangeDetails:(id)a3
{
  id v4;
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  void *v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  id v14;
  unsigned int *v15;

  v4 = a3;
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    if (self->_hasMoves)
    {
      nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = __55__PXGChangeDetails_indexSetAfterApplyingChangeDetails___block_invoke;
      v13 = &unk_251A6E570;
      v14 = v6;
      v15 = nextSpriteIndexByPreviousSpriteIndex;
      v7 = v6;
      objc_msgSend(v4, "enumerateRangesUsingBlock:", &v10);
      v8 = (id)objc_msgSend(v7, "copy", v10, v11, v12, v13);

    }
    else
    {
      -[PXGChangeDetails arrayChangeDetails](self, "arrayChangeDetails");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "indexSetAfterApplyingChangesToIndexSet:", v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (PXArrayChangeDetails)arrayChangeDetails
{
  PXArrayChangeDetails *cachedArrayChangeDetails;
  PXArrayChangeDetails **p_cachedArrayChangeDetails;
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  unsigned int *v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  __CFDictionary *Mutable;
  uint64_t numberOfSpritesBeforeChange;
  unsigned int *v16;
  unint64_t v17;
  unsigned int v18;
  unint64_t v19;
  unsigned int v20;
  const void *v21;
  void *v22;
  _QWORD v23[6];

  p_cachedArrayChangeDetails = &self->_cachedArrayChangeDetails;
  cachedArrayChangeDetails = self->_cachedArrayChangeDetails;
  if (cachedArrayChangeDetails)
    return cachedArrayChangeDetails;
  if (self->_hasMoves)
  {
    nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
    v7 = (unsigned int *)malloc_type_malloc(4 * self->_numberOfSpritesBeforeChange, 0x100004052888210uLL);
    v8 = -[NSIndexSet firstIndex](self->_spriteIndexesThatWereInserted, "firstIndex");
    if (self->_numberOfSpritesBeforeChange)
    {
      v9 = v8;
      v10 = 0;
      LODWORD(v11) = 0;
      do
      {
        v12 = nextSpriteIndexByPreviousSpriteIndex[v10];
        if (v12 != -1)
        {
          if (v9 == v11)
          {
            do
            {
              v11 = (v11 + 1);
              v9 = -[NSIndexSet indexGreaterThanIndex:](self->_spriteIndexesThatWereInserted, "indexGreaterThanIndex:");
            }
            while (v9 == v11);
          }
          v12 = v11;
          LODWORD(v11) = v11 + 1;
        }
        v7[v10++] = v12;
      }
      while (v10 < self->_numberOfSpritesBeforeChange);
    }
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
    if ((_DWORD)numberOfSpritesBeforeChange)
    {
      v16 = v7;
      do
      {
        v18 = *nextSpriteIndexByPreviousSpriteIndex++;
        v17 = v18;
        v20 = *v16++;
        v19 = v20;
        if ((_DWORD)v17 != v20)
        {
          objc_msgSend(v13, "addIndex:", v17);
          CFDictionarySetValue(Mutable, (const void *)v17, (const void *)v19);
        }
        --numberOfSpritesBeforeChange;
      }
      while (numberOfSpritesBeforeChange);
    }
    objc_msgSend(v13, "count");
    v21 = (const void *)PXCreateMutableIntegerArrayRef();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __38__PXGChangeDetails_arrayChangeDetails__block_invoke;
    v23[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
    v23[4] = Mutable;
    v23[5] = v21;
    objc_msgSend(v13, "enumerateIndexesUsingBlock:", v23);
    CFRelease(Mutable);
    free(v7);
  }
  else
  {
    v21 = 0;
    v13 = 0;
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72B60]), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", self->_spriteIndexesThatWereRemoved, self->_spriteIndexesThatWereInserted, v13, v21, self->_spriteIndexesThatWereModified);
  if (v21)
    CFRelease(v21);
  objc_storeStrong((id *)p_cachedArrayChangeDetails, v22);

  return (PXArrayChangeDetails *)v22;
}

- (int64_t)layoutVersionAfterChange
{
  return self->_layoutVersionAfterChange;
}

- (NSIndexSet)insertedSpriteIndexes
{
  return self->_spriteIndexesThatWereInserted;
}

uint64_t __96__PXGChangeDetails_applyToArray_elementSize_countAfterChanges_insertionHandler_modifiedHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGChangeDetails insertedSpriteIndexes](self, "insertedSpriteIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[PXGChangeDetails removedSpriteIndexes](self, "removedSpriteIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[PXGChangeDetails modifiedSpriteIndexes](self, "modifiedSpriteIndexes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (self->_hasMoves)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = v12;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; ins = %lu; del = %lu; mod = %lu; moves = %@>"),
    v5,
    self,
    v7,
    v9,
    v11,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (_PXGSpriteIndexRange)replaceRemovalsWithMovesToEndForIndexes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _PXGSpriteIndexRange *v7;
  NSIndexSet *v8;
  NSIndexSet *spriteIndexesThatWereRemoved;
  _PXGSpriteIndexRange v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  PXGChangeDetails *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  _PXGSpriteIndexRange *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  v4 = a3;
  v19 = 0;
  v20 = (_PXGSpriteIndexRange *)&v19;
  v21 = 0x2810000000;
  v22 = &unk_2494639D7;
  v23 = 0xFFFFFFFFLL;
  LODWORD(v23) = self->_numberOfSpritesAfterChange;
  v5 = (void *)-[NSIndexSet mutableCopy](self->_spriteIndexesThatWereRemoved, "mutableCopy");
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __60__PXGChangeDetails_replaceRemovalsWithMovesToEndForIndexes___block_invoke;
  v15 = &unk_251A6E4D0;
  v16 = self;
  v18 = &v19;
  v6 = v5;
  v17 = v6;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", &v12);
  v7 = v20;
  if (v20[4].var1)
  {
    -[PXGChangeDetails _invalidateLayoutVersions](self, "_invalidateLayoutVersions", v12, v13, v14, v15, v16);
    -[PXGChangeDetails _invalidateCachedArrayChangeDetails](self, "_invalidateCachedArrayChangeDetails");
    self->_numberOfSpritesAfterChange += v20[4].var1;
    v8 = (NSIndexSet *)objc_msgSend(v6, "count");
    if (v8)
      v8 = (NSIndexSet *)objc_msgSend(v6, "copy");
    spriteIndexesThatWereRemoved = self->_spriteIndexesThatWereRemoved;
    self->_spriteIndexesThatWereRemoved = v8;

    self->_hasMoves = 1;
    v7 = v20;
  }
  v10 = v7[4];

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)removeSpritesAtIndexes:(id)a3
{
  uint64_t numberOfSpritesAfterChange;
  NSIndexSet *spriteIndexesThatWereRemoved;
  NSIndexSet *v7;
  NSIndexSet *v8;
  NSIndexSet *v9;
  void *v10;
  unint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int v15;
  NSIndexSet *v16;
  NSIndexSet *v17;
  NSIndexSet *v18;
  NSIndexSet *v19;
  uint64_t v20;
  NSIndexSet *v21;
  id v22;
  id v23;
  NSIndexSet *v24;
  NSIndexSet *spriteIndexesThatWereModified;
  NSIndexSet *v26;
  NSIndexSet *spriteIndexesThatWereInserted;
  _DWORD *v28;
  unint64_t v29;
  int v30;
  unint64_t numberOfSpritesBeforeChange;
  unint64_t v32;
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  PXGChangeDetails *v40;

  v37 = a3;
  if (objc_msgSend(v37, "count"))
  {
    -[PXGChangeDetails _invalidateLayoutVersions](self, "_invalidateLayoutVersions");
    -[PXGChangeDetails _invalidateCachedArrayChangeDetails](self, "_invalidateCachedArrayChangeDetails");
    numberOfSpritesAfterChange = self->_numberOfSpritesAfterChange;
    if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
    {
      spriteIndexesThatWereRemoved = self->_spriteIndexesThatWereRemoved;
      if (spriteIndexesThatWereRemoved)
      {
        v7 = (NSIndexSet *)-[NSIndexSet mutableCopy](spriteIndexesThatWereRemoved, "mutableCopy");
        -[NSIndexSet addIndexes:](v7, "addIndexes:", v37);
        v8 = (NSIndexSet *)-[NSIndexSet copy](v7, "copy");
        v9 = self->_spriteIndexesThatWereRemoved;
        self->_spriteIndexesThatWereRemoved = v8;

      }
      else
      {
        v21 = (NSIndexSet *)objc_msgSend(v37, "copy");
        v7 = self->_spriteIndexesThatWereRemoved;
        self->_spriteIndexesThatWereRemoved = v21;
      }

      v22 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __43__PXGChangeDetails_removeSpritesAtIndexes___block_invoke;
      v38[3] = &unk_251A6E4F8;
      v23 = v22;
      v39 = v23;
      v40 = self;
      objc_msgSend(v37, "enumerateIndexesUsingBlock:", v38);
      objc_msgSend(v23, "removeIndex:", 0xFFFFFFFFLL);
      -[NSIndexSet px_indexSetAdjustedForDeletions:](self->_spriteIndexesThatWereModified, "px_indexSetAdjustedForDeletions:", v23);
      v24 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
      spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
      self->_spriteIndexesThatWereModified = v24;

      -[NSIndexSet px_indexSetAdjustedForDeletions:](self->_spriteIndexesThatWereInserted, "px_indexSetAdjustedForDeletions:", v23);
      v26 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
      spriteIndexesThatWereInserted = self->_spriteIndexesThatWereInserted;
      self->_spriteIndexesThatWereInserted = v26;

      v28 = malloc_type_malloc(4 * self->_numberOfSpritesAfterChange, 0x100004052888210uLL);
      if (self->_numberOfSpritesAfterChange)
      {
        v29 = 0;
        v30 = 0;
        do
        {
          v28[v29] = v30;
          v30 += objc_msgSend(v23, "containsIndex:", v29++) ^ 1;
        }
        while (v29 < self->_numberOfSpritesAfterChange);
      }
      numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
      if ((_DWORD)numberOfSpritesBeforeChange)
      {
        v32 = 0;
        nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
        do
        {
          v34 = nextSpriteIndexByPreviousSpriteIndex[v32];
          if ((_DWORD)v34 != -1)
          {
            nextSpriteIndexByPreviousSpriteIndex[v32] = v28[v34];
            numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
          }
          ++v32;
        }
        while (v32 < numberOfSpritesBeforeChange);
      }
      free(v28);
      v20 = objc_msgSend(v23, "count");

    }
    else
    {
      -[PXGChangeDetails _resizeStorageIfNeeded](self, "_resizeStorageIfNeeded");
      v10 = v37;
      if (self->_numberOfSpritesBeforeChange)
      {
        v11 = 0;
        v12 = 0;
        do
        {
          v13 = objc_msgSend(v37, "containsIndex:", v11);
          if (v13)
            v14 = -1;
          else
            v14 = v12;
          v15 = v13 ^ 1;
          v10 = v37;
          v12 += v15;
          self->_nextSpriteIndexByPreviousSpriteIndex[v11++] = v14;
        }
        while (v11 < self->_numberOfSpritesBeforeChange);
      }
      v16 = (NSIndexSet *)objc_msgSend(v10, "copy");
      v17 = self->_spriteIndexesThatWereRemoved;
      self->_spriteIndexesThatWereRemoved = v16;

      -[NSIndexSet px_indexSetAdjustedForDeletions:](self->_spriteIndexesThatWereModified, "px_indexSetAdjustedForDeletions:", v37);
      v18 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
      v19 = self->_spriteIndexesThatWereModified;
      self->_spriteIndexesThatWereModified = v18;

      v20 = objc_msgSend(v37, "count");
    }
    v35 = numberOfSpritesAfterChange - v20;
    if (v35 < 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGChangeDetails.m"), 219, CFSTR("Invalid removed indexes, numberOfSpritesAfterChange would be < 0"));

    }
    self->_numberOfSpritesAfterChange = v35;
  }

}

- (void)increaseNumberOfSpritesBy:(unsigned int)a3
{
  unint64_t numberOfSpritesBeforeChange;
  unsigned int v6;
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  unsigned int v8;

  -[PXGChangeDetails _invalidateLayoutVersions](self, "_invalidateLayoutVersions");
  -[PXGChangeDetails _invalidateCachedArrayChangeDetails](self, "_invalidateCachedArrayChangeDetails");
  numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
  self->_numberOfSpritesAfterChange += a3;
  self->_numberOfSpritesBeforeChange = numberOfSpritesBeforeChange + a3;
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    -[PXGChangeDetails _resizeStorageIfNeeded](self, "_resizeStorageIfNeeded");
    v6 = self->_numberOfSpritesBeforeChange;
    if (numberOfSpritesBeforeChange < v6)
    {
      nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
      v8 = self->_numberOfSpritesAfterChange - v6;
      do
      {
        nextSpriteIndexByPreviousSpriteIndex[numberOfSpritesBeforeChange] = v8 + numberOfSpritesBeforeChange;
        ++numberOfSpritesBeforeChange;
      }
      while (numberOfSpritesBeforeChange < self->_numberOfSpritesBeforeChange);
    }
  }
}

- (_PXGSpriteIndexRange)splitIndexesIntoMovesToEndAndReinsertions:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t numberOfSpritesAfterChange;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSIndexSet *v12;
  NSIndexSet *spriteIndexesThatWereInserted;
  void *v14;
  NSIndexSet *v15;
  NSIndexSet *spriteIndexesThatWereModified;
  unint64_t v17;
  unsigned int v18;
  int v19;
  unsigned int v20;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PXGChangeDetails _invalidateLayoutVersions](self, "_invalidateLayoutVersions");
    -[PXGChangeDetails _invalidateCachedArrayChangeDetails](self, "_invalidateCachedArrayChangeDetails");
    v5 = -[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves");
    numberOfSpritesAfterChange = self->_numberOfSpritesAfterChange;
    self->_numberOfSpritesAfterChange += objc_msgSend(v4, "count");
    v7 = (void *)-[NSIndexSet mutableCopy](self->_spriteIndexesThatWereInserted, "mutableCopy");
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = objc_alloc_init(MEMORY[0x24BDD1698]);
    v11 = v9;

    objc_msgSend(v11, "addIndexes:", v4);
    v12 = (NSIndexSet *)objc_msgSend(v11, "copy");
    spriteIndexesThatWereInserted = self->_spriteIndexesThatWereInserted;
    self->_spriteIndexesThatWereInserted = v12;

    v14 = (void *)-[NSIndexSet mutableCopy](self->_spriteIndexesThatWereModified, "mutableCopy");
    objc_msgSend(v14, "removeIndexes:", v4);
    v15 = (NSIndexSet *)objc_msgSend(v14, "copy");
    spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
    self->_spriteIndexesThatWereModified = v15;

    self->_hasMoves = 1;
    -[PXGChangeDetails _resizeStorageIfNeeded](self, "_resizeStorageIfNeeded");
    if (self->_numberOfSpritesBeforeChange)
    {
      v17 = 0;
      LODWORD(v10) = 0;
      do
      {
        if (v5)
          v18 = self->_nextSpriteIndexByPreviousSpriteIndex[v17];
        else
          v18 = v17;
        v19 = objc_msgSend(v4, "containsIndex:", v18);
        v20 = v10 + numberOfSpritesAfterChange;
        v10 = (v10 + v19);
        if (!v19)
          v20 = v18;
        self->_nextSpriteIndexByPreviousSpriteIndex[v17++] = v20;
      }
      while (v17 < self->_numberOfSpritesBeforeChange);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
    numberOfSpritesAfterChange = 0xFFFFFFFFLL;
  }

  return (_PXGSpriteIndexRange)(numberOfSpritesAfterChange | (v10 << 32));
}

- (void)applySpriteTransferMap:(const unsigned int *)a3
{
  void *v6;
  void *v7;
  void *v8;
  NSIndexSet *spriteIndexesThatWereRemoved;
  id v10;
  id v11;
  id v12;
  NSIndexSet *v13;
  NSIndexSet *v14;
  NSIndexSet *v15;
  NSIndexSet *spriteIndexesThatWereInserted;
  NSIndexSet *v17;
  NSIndexSet *spriteIndexesThatWereModified;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  PXGChangeDetails *v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  const unsigned int *v29;
  SEL v30;
  _QWORD v31[4];
  _QWORD v32[3];
  char v33;

  v6 = (void *)-[NSIndexSet mutableCopy](self->_spriteIndexesThatWereRemoved, "mutableCopy");
  v7 = (void *)-[NSIndexSet mutableCopy](self->_spriteIndexesThatWereInserted, "mutableCopy");
  v8 = (void *)-[NSIndexSet mutableCopy](self->_spriteIndexesThatWereModified, "mutableCopy");
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  spriteIndexesThatWereRemoved = self->_spriteIndexesThatWereRemoved;
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __43__PXGChangeDetails_applySpriteTransferMap___block_invoke;
  v22 = &unk_251A6E520;
  v28 = v32;
  v29 = a3;
  v27 = v31;
  v23 = self;
  v10 = v6;
  v24 = v10;
  v11 = v7;
  v25 = v11;
  v30 = a2;
  v12 = v8;
  v26 = v12;
  -[NSIndexSet enumerateIndexesUsingBlock:](spriteIndexesThatWereRemoved, "enumerateIndexesUsingBlock:", &v19);
  v13 = (NSIndexSet *)objc_msgSend(v10, "copy", v19, v20, v21, v22, v23);
  v14 = self->_spriteIndexesThatWereRemoved;
  self->_spriteIndexesThatWereRemoved = v13;

  v15 = (NSIndexSet *)objc_msgSend(v11, "copy");
  spriteIndexesThatWereInserted = self->_spriteIndexesThatWereInserted;
  self->_spriteIndexesThatWereInserted = v15;

  v17 = (NSIndexSet *)objc_msgSend(v12, "copy");
  spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
  self->_spriteIndexesThatWereModified = v17;

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);

}

- (PXGChangeDetails)inverse
{
  PXGChangeDetails *v3;
  uint64_t v4;
  NSIndexSet *spriteIndexesThatWereRemoved;
  uint64_t v6;
  NSIndexSet *spriteIndexesThatWereInserted;
  _DWORD *v8;
  _DWORD *v9;
  unint64_t v10;
  unint64_t numberOfSpritesAfterChange;
  uint64_t v12;
  NSIndexSet *v13;
  unint64_t numberOfSpritesBeforeChange;
  unint64_t v15;
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  uint64_t v17;
  id v18;
  NSIndexSet *spriteIndexesThatWereModified;
  uint64_t v20;
  NSIndexSet *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;
  _DWORD *v28;

  v3 = objc_alloc_init(PXGChangeDetails);
  v3->_numberOfSpritesBeforeChange = self->_numberOfSpritesAfterChange;
  v3->_numberOfSpritesAfterChange = self->_numberOfSpritesBeforeChange;
  v4 = -[NSIndexSet copy](self->_spriteIndexesThatWereInserted, "copy");
  spriteIndexesThatWereRemoved = v3->_spriteIndexesThatWereRemoved;
  v3->_spriteIndexesThatWereRemoved = (NSIndexSet *)v4;

  v6 = -[NSIndexSet copy](self->_spriteIndexesThatWereRemoved, "copy");
  spriteIndexesThatWereInserted = v3->_spriteIndexesThatWereInserted;
  v3->_spriteIndexesThatWereInserted = (NSIndexSet *)v6;

  v3->_hasMoves = self->_hasMoves;
  v3->_layoutVersionBeforeChange = self->_layoutVersionAfterChange;
  v3->_layoutVersionAfterChange = self->_layoutVersionBeforeChange;
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    v8 = malloc_type_malloc(4 * self->_numberOfSpritesAfterChange, 0x100004052888210uLL);
    v9 = v8;
    if (self->_numberOfSpritesAfterChange)
    {
      v10 = 0;
      do
      {
        v8[v10++] = -1;
        numberOfSpritesAfterChange = self->_numberOfSpritesAfterChange;
      }
      while (v10 < numberOfSpritesAfterChange);
    }
    else
    {
      LODWORD(numberOfSpritesAfterChange) = 0;
    }
    numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
    if ((_DWORD)numberOfSpritesBeforeChange)
    {
      v15 = 0;
      nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
      do
      {
        v17 = nextSpriteIndexByPreviousSpriteIndex[v15];
        if ((_DWORD)v17 != -1)
        {
          v8[v17] = v15;
          numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
        }
        ++v15;
      }
      while (v15 < numberOfSpritesBeforeChange);
      LODWORD(numberOfSpritesAfterChange) = self->_numberOfSpritesAfterChange;
    }
    v3->_nextSpriteIndexByPreviousSpriteIndex = v8;
    v3->_nextSpriteIndexByPreviousSpriteIndexCapacity = numberOfSpritesAfterChange;
    v18 = objc_alloc_init(MEMORY[0x24BDD1698]);
    spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __27__PXGChangeDetails_inverse__block_invoke;
    v26 = &unk_251A6E548;
    v27 = v18;
    v28 = v9;
    v13 = (NSIndexSet *)v18;
    -[NSIndexSet enumerateIndexesUsingBlock:](spriteIndexesThatWereModified, "enumerateIndexesUsingBlock:", &v23);
    -[NSIndexSet removeIndex:](v13, "removeIndex:", 0xFFFFFFFFLL, v23, v24, v25, v26);
    v20 = -[NSIndexSet copy](v13, "copy");
    v21 = v3->_spriteIndexesThatWereModified;
    v3->_spriteIndexesThatWereModified = (NSIndexSet *)v20;

  }
  else
  {
    v12 = -[NSIndexSet copy](self->_spriteIndexesThatWereModified, "copy");
    v13 = v3->_spriteIndexesThatWereModified;
    v3->_spriteIndexesThatWereModified = (NSIndexSet *)v12;
  }

  return v3;
}

- (void)applyToSpriteIndexes:(unsigned int *)a3 atIndexes:(id)a4
{
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  id v7;
  _QWORD v8[6];

  v7 = a4;
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__PXGChangeDetails_applyToSpriteIndexes_atIndexes___block_invoke;
    v8[3] = &__block_descriptor_48_e24_v32__0__NSRange_QQ_8_B24l;
    v8[4] = a3;
    v8[5] = nextSpriteIndexByPreviousSpriteIndex;
    objc_msgSend(v7, "enumerateRangesUsingBlock:", v8);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  *((_DWORD *)v4 + 21) = self->_numberOfSpritesBeforeChange;
  *((_DWORD *)v4 + 20) = self->_numberOfSpritesAfterChange;
  v5 = -[NSIndexSet copy](self->_spriteIndexesThatWereRemoved, "copy");
  v6 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v5;

  v7 = -[NSIndexSet copy](self->_spriteIndexesThatWereInserted, "copy");
  v8 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v7;

  v9 = -[NSIndexSet copy](self->_spriteIndexesThatWereModified, "copy");
  v10 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v9;

  *((_BYTE *)v4 + 48) = self->_hasMoves;
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    objc_msgSend(v4, "_resizeStorageIfNeeded");
    memcpy(*((void **)v4 + 1), self->_nextSpriteIndexByPreviousSpriteIndex, 4 * self->_numberOfSpritesBeforeChange);
  }
  *((_QWORD *)v4 + 11) = self->_layoutVersionBeforeChange;
  *((_QWORD *)v4 + 12) = self->_layoutVersionAfterChange;
  return v4;
}

- (NSString)diagnosticDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int *nextSpriteIndexByPreviousSpriteIndex;
  unint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("\tnumberOfSprites beforeChange:%li afterChange:%li\n"), self->_numberOfSpritesBeforeChange, self->_numberOfSpritesAfterChange);
  -[NSIndexSet px_shortDescription](self->_spriteIndexesThatWereRemoved, "px_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\tremovedSpriteIndexes: %@\n"), v7);

  -[NSIndexSet px_shortDescription](self->_spriteIndexesThatWereInserted, "px_shortDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\tinsertedSpriteIndexes: %@\n"), v8);

  -[NSIndexSet px_shortDescription](self->_spriteIndexesThatWereModified, "px_shortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\tmodifiedSpriteIndexes: %@\n"), v9);

  objc_msgSend(v6, "appendFormat:", CFSTR("\thasMoves: %i\n"), self->_hasMoves);
  if (-[PXGChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
    if (nextSpriteIndexByPreviousSpriteIndex)
    {
      if (self->_numberOfSpritesBeforeChange)
      {
        v11 = 0;
        do
        {
          if (nextSpriteIndexByPreviousSpriteIndex[v11] == -1)
          {
            objc_msgSend(v6, "appendFormat:", CFSTR("\t\t%li -> %@\n"), v11, CFSTR("-"));
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendFormat:", CFSTR("\t\t%li -> %@\n"), v11, v12);

          }
          ++v11;
        }
        while (v11 < self->_numberOfSpritesBeforeChange);
      }
    }
  }
  if (*(_OWORD *)&self->_layoutVersionBeforeChange != 0)
    objc_msgSend(v6, "appendFormat:", CFSTR("\tlayoutVersion: %li->%li\n"), self->_layoutVersionBeforeChange, self->_layoutVersionAfterChange);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (int64_t)layoutVersionBeforeChange
{
  return self->_layoutVersionBeforeChange;
}

void __38__PXGChangeDetails_arrayChangeDetails__block_invoke(uint64_t a1, const void *a2)
{
  const void *Value;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), Value);
}

void __53__PXGChangeDetails_applyToDictionary_removalHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (*(_DWORD *)(a1[6] + 4 * objc_msgSend(a2, "integerValue")) == -1)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v5 = (void *)a1[4];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

uint64_t __96__PXGChangeDetails_applyToArray_elementSize_countAfterChanges_insertionHandler_modifiedHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__PXGChangeDetails_applyToSpriteIndexes_atIndexes___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _DWORD *v4;

  if (a2 < a2 + a3)
  {
    v3 = *(_QWORD *)(result + 40);
    v4 = (_DWORD *)(*(_QWORD *)(result + 32) + 4 * a2);
    do
    {
      *v4 = *(_DWORD *)(v3 + 4 * *v4);
      ++v4;
      --a3;
    }
    while (a3);
  }
  return result;
}

uint64_t __55__PXGChangeDetails_indexSetAfterApplyingChangeDetails___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v3 = a2 + a3;
  if (a2 + a3 > (unint64_t)a2)
  {
    v4 = result;
    v5 = a2;
    v6 = a2 + 1;
    do
    {
      if (*(_DWORD *)(*(_QWORD *)(v4 + 40) + 4 * v5) != -1)
        result = objc_msgSend(*(id *)(v4 + 32), "addIndex:");
      v5 = v6;
    }
    while (v3 > v6++);
  }
  return result;
}

uint64_t __27__PXGChangeDetails_inverse__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 4 * a2));
}

uint64_t __43__PXGChangeDetails_applySpriteTransferMap___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 64) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  v4 = *(unsigned int *)(*(_QWORD *)(result + 80) + 4 * v3);
  if ((_DWORD)v4 != -1)
  {
    v6 = result;
    v7 = *(_QWORD *)(*(_QWORD *)(result + 72) + 8);
    if (!*(_BYTE *)(v7 + 24))
    {
      *(_BYTE *)(v7 + 24) = 1;
      objc_msgSend(*(id *)(result + 32), "_invalidateLayoutVersions");
      objc_msgSend(*(id *)(v6 + 32), "_invalidateCachedArrayChangeDetails");
      v8 = *(_QWORD *)(v6 + 32);
      if (!*(_BYTE *)(v8 + 48))
      {
        *(_BYTE *)(v8 + 48) = 1;
        objc_msgSend(*(id *)(v6 + 32), "_resizeStorageIfNeeded");
      }
    }
    objc_msgSend(*(id *)(v6 + 40), "removeIndex:", a2);
    if ((objc_msgSend(*(id *)(v6 + 48), "containsIndex:", v4) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v6 + 88), *(_QWORD *)(v6 + 32), CFSTR("PXGChangeDetails.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[spriteIndexesThatWereInserted containsIndex:mappedSpriteIndex]"));

    }
    objc_msgSend(*(id *)(v6 + 48), "removeIndex:", v4);
    result = objc_msgSend(*(id *)(v6 + 56), "addIndex:", v4);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 4 * a2) = v4;
    v2 = *(_QWORD *)(*(_QWORD *)(v6 + 64) + 8);
    v3 = *(_QWORD *)(v2 + 24);
  }
  *(_QWORD *)(v2 + 24) = v3 + 1;
  return result;
}

uint64_t __43__PXGChangeDetails_removeSpritesAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addIndex:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 4 * a2));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 4 * a2) = -1;
  return result;
}

uint64_t __60__PXGChangeDetails_replaceRemovalsWithMovesToEndForIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  int v7;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsIndex:", a2);
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(_DWORD *)(v5 + 36);
    v7 = v6 + *(_DWORD *)(v5 + 32);
    *(_DWORD *)(v5 + 36) = v6 + 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 4 * a2) = v7;
    return objc_msgSend(*(id *)(a1 + 40), "removeIndex:", a2);
  }
  return result;
}

@end
