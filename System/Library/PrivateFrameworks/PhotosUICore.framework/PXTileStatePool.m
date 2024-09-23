@implementation PXTileStatePool

- (PXTileStatePool)init
{
  PXTileStatePool *v2;
  uint64_t v3;
  NSMutableIndexSet *usedIndexes;
  uint64_t v5;
  NSMutableIndexSet *unusedIndexes;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMapTable *tileIndexesByPageKey;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXTileStatePool;
  v2 = -[PXTileStatePool init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3 = objc_claimAutoreleasedReturnValue();
    usedIndexes = v2->_usedIndexes;
    v2->_usedIndexes = (NSMutableIndexSet *)v3;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v5 = objc_claimAutoreleasedReturnValue();
    unusedIndexes = v2->_unusedIndexes;
    v2->_unusedIndexes = (NSMutableIndexSet *)v5;

    objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 1282);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v7, v8, 0);
    tileIndexesByPageKey = v2->_tileIndexesByPageKey;
    v2->_tileIndexesByPageKey = (NSMapTable *)v9;

  }
  return v2;
}

- (void)dealloc
{
  NSMutableIndexSet *usedIndexes;
  PXTileState *states;
  objc_super v5;
  _QWORD v6[5];

  usedIndexes = self->_usedIndexes;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__PXTileStatePool_dealloc__block_invoke;
  v6[3] = &unk_1E5148928;
  v6[4] = self;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](usedIndexes, "enumerateIndexesUsingBlock:", v6);
  states = self->_states;
  if (states)
  {
    free(states);
    self->_states = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PXTileStatePool;
  -[PXTileStatePool dealloc](&v5, sel_dealloc);
}

- (int64_t)count
{
  return -[NSMutableIndexSet count](self->_usedIndexes, "count");
}

- (unint64_t)checkOutIndexWithInitialConfiguration:(id)a3
{
  void (**v4)(id, PXTileState *);
  int64_t statesMaxCount;
  int64_t v6;
  unint64_t v7;
  PXTileState *v8;

  v4 = (void (**)(id, PXTileState *))a3;
  if (!-[NSMutableIndexSet count](self->_unusedIndexes, "count"))
  {
    statesMaxCount = self->_statesMaxCount;
    v6 = 2 * statesMaxCount;
    if (!statesMaxCount)
      v6 = 10;
    self->_statesMaxCount = v6;
    self->_states = (PXTileState *)malloc_type_realloc(self->_states, 712 * v6, 0x108004092BF69EFuLL);
    -[NSMutableIndexSet addIndexesInRange:](self->_unusedIndexes, "addIndexesInRange:", statesMaxCount, self->_statesMaxCount - statesMaxCount);
  }
  v7 = -[NSMutableIndexSet firstIndex](self->_unusedIndexes, "firstIndex");
  -[NSMutableIndexSet removeIndex:](self->_unusedIndexes, "removeIndex:", v7);
  -[NSMutableIndexSet addIndex:](self->_usedIndexes, "addIndex:", v7);
  bzero(&self->_states[v7], 0x2C8uLL);
  v8 = &self->_states[v7];
  v4[2](v4, v8);
  -[PXTileStatePool _storeCurrentFrameLookupForTileState:withIndex:](self, "_storeCurrentFrameLookupForTileState:withIndex:", v8, v7);
  -[PXTileStatePool _storeTargetIdentifierLookupForTileState:withIndex:](self, "_storeTargetIdentifierLookupForTileState:withIndex:", v8, v7);

  return v7;
}

- (void)checkInIndex:(unint64_t)a3
{
  -[PXTileStatePool _cleanupStateAtIndex:](self, "_cleanupStateAtIndex:");
  -[NSMutableIndexSet removeIndex:](self->_usedIndexes, "removeIndex:", a3);
  -[NSMutableIndexSet addIndex:](self->_unusedIndexes, "addIndex:", a3);
}

- (void)checkInIndexes:(id)a3
{
  id v4;
  _QWORD v5[5];

  v5[1] = 3221225472;
  v5[2] = __34__PXTileStatePool_checkInIndexes___block_invoke;
  v5[3] = &unk_1E5148928;
  v5[4] = self;
  v4 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v5);
  -[NSMutableIndexSet removeIndexes:](self->_usedIndexes, "removeIndexes:", v4);
  -[NSMutableIndexSet addIndexes:](self->_unusedIndexes, "addIndexes:", v4);

}

- (void)_cleanupStateAtIndex:(unint64_t)a3
{
  PXTileState *states;
  PXTileState *v6;
  void *var10;
  void **p_var10;
  PXTileState *v9;
  void *var11;
  void **p_var11;
  PXTileState *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  _OWORD v18[5];
  unint64_t v19;

  states = self->_states;
  v6 = &states[a3];
  var10 = v6->var10;
  if (var10)
  {
    p_var10 = &v6->var10;

    *p_var10 = 0;
  }
  v9 = &states[a3];
  var11 = v9->var11;
  if (var11)
  {
    p_var11 = &v9->var11;

    *p_var11 = 0;
  }
  v12 = &states[a3];
  v13 = *(_OWORD *)&v12->var2.index[1];
  v18[0] = *(_OWORD *)&v12->var2.length;
  v18[1] = v13;
  v14 = *(_OWORD *)&v12->var2.index[3];
  v15 = *(_OWORD *)&v12->var2.index[5];
  v16 = *(_OWORD *)&v12->var2.index[7];
  v19 = v12->var2.index[9];
  v18[3] = v15;
  v18[4] = v16;
  v18[2] = v14;
  v17 = -[PXTileStatePool indexOfStateWithTargetIdentifier:](self, "indexOfStateWithTargetIdentifier:", v18);
  if (v17 == a3 && v17 != 0x7FFFFFFFFFFFFFFFLL)
    std::__hash_table<std::__hash_value_type<PXTileIdentifier,unsigned long>,std::__unordered_map_hasher<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::hash<PXTileIdentifier>,std::equal_to<PXTileIdentifier>,true>,std::__unordered_map_equal<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::equal_to<PXTileIdentifier>,std::hash<PXTileIdentifier>,true>,std::allocator<std::__hash_value_type<PXTileIdentifier,unsigned long>>>::__erase_unique<PXTileIdentifier>(&self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_, &v12->var2.length);
  PXEnumeratePageKeysForRect();
}

- (PXTileState)_mutableStateAtIndex:(unint64_t)a3
{
  return &self->_states[a3];
}

- (void)enumerateStatesUsingBlock:(id)a3
{
  -[PXTileStatePool enumerateStatesAtIndexes:usingBlock:](self, "enumerateStatesAtIndexes:usingBlock:", self->_usedIndexes, a3);
}

- (void)enumerateStatesAtIndexes:(id)a3 usingBlock:(id)a4
{
  id v5;
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PXTileStatePool_enumerateStatesAtIndexes_usingBlock___block_invoke;
  v6[3] = &unk_1E511E850;
  v6[4] = self;
  v6[5] = a4;
  v5 = a4;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v6);

}

- (void)enumerateStatesInRect:(CGRect)a3 usingBlock:(id)a4
{
  id v4;
  id v5;
  _QWORD v6[3];
  char v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v5 = a4;
  v4 = v5;
  PXEnumeratePageKeysForRect();

  _Block_object_dispose(v6, 8);
}

- (unint64_t)indexOfFirstStatePassingTest:(id)a3
{
  id v4;
  NSMutableIndexSet *usedIndexes;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  usedIndexes = self->_usedIndexes;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__PXTileStatePool_indexOfFirstStatePassingTest___block_invoke;
  v9[3] = &unk_1E512C130;
  v9[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](usedIndexes, "enumerateIndexesUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)indexesOfStatesPassingTest:(id)a3
{
  id v4;
  void *v5;
  NSMutableIndexSet *usedIndexes;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  usedIndexes = self->_usedIndexes;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__PXTileStatePool_indexesOfStatesPassingTest___block_invoke;
  v12[3] = &unk_1E5121628;
  v12[4] = self;
  v7 = v4;
  v14 = v7;
  v8 = v5;
  v13 = v8;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](usedIndexes, "enumerateIndexesUsingBlock:", v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

- (unint64_t)indexOfStateWithTargetIdentifier:(PXTileIdentifier *)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;

  v4 = std::__hash_table<std::__hash_value_type<PXTileIdentifier,unsigned long>,std::__unordered_map_hasher<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::hash<PXTileIdentifier>,std::equal_to<PXTileIdentifier>,true>,std::__unordered_map_equal<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::equal_to<PXTileIdentifier>,std::hash<PXTileIdentifier>,true>,std::allocator<std::__hash_value_type<PXTileIdentifier,unsigned long>>>::find<PXTileIdentifier>(&self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_, &a3->length);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    v6 = v4[13];
    if (-[NSMutableIndexSet containsIndex:](self->_usedIndexes, "containsIndex:", v6))
      return v6;
  }
  return v5;
}

- (void)setTargetIdentifier:(PXTileIdentifier *)a3 forTileStateAtIndex:(unint64_t)a4
{
  PXTileState *states;
  PXTileState *v8;
  unint64_t length;
  unint64_t *p_length;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  unint64_t v14;
  unint64_t index;
  uint64_t v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;
  _OWORD v27[5];
  unint64_t v28;

  states = self->_states;
  v8 = &states[a4];
  p_length = &v8->var2.length;
  length = v8->var2.length;
  v11 = a3->length;
  v12 = length == a3->length;
  if (length)
    v13 = length == v11;
  else
    v13 = 0;
  if (v13)
  {
    v14 = 0;
    index = (unint64_t)states[a4].var2.index;
    do
    {
      v16 = *(_QWORD *)(index + 8 * v14);
      v17 = a3->index[v14];
      v12 = v16 == v17;
      ++v14;
    }
    while (v14 < length && v16 == v17);
  }
  if (!v12)
  {
    if (v11)
      goto LABEL_11;
    v22 = *(_OWORD *)&v8->var2.index[1];
    v27[0] = *(_OWORD *)p_length;
    v27[1] = v22;
    v23 = *(_OWORD *)&v8->var2.index[3];
    v24 = *(_OWORD *)&v8->var2.index[5];
    v25 = *(_OWORD *)&v8->var2.index[7];
    v28 = v8->var2.index[9];
    v27[3] = v24;
    v27[4] = v25;
    v27[2] = v23;
    v26 = -[PXTileStatePool indexOfStateWithTargetIdentifier:](self, "indexOfStateWithTargetIdentifier:", v27);
    if (v26 == 0x7FFFFFFFFFFFFFFFLL || v26 == a4)
LABEL_11:
      std::__hash_table<std::__hash_value_type<PXTileIdentifier,unsigned long>,std::__unordered_map_hasher<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::hash<PXTileIdentifier>,std::equal_to<PXTileIdentifier>,true>,std::__unordered_map_equal<PXTileIdentifier,std::__hash_value_type<PXTileIdentifier,unsigned long>,std::equal_to<PXTileIdentifier>,std::hash<PXTileIdentifier>,true>,std::allocator<std::__hash_value_type<PXTileIdentifier,unsigned long>>>::__erase_unique<PXTileIdentifier>(&self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_, p_length);
    v18 = *(_OWORD *)&a3->index[1];
    *(_OWORD *)p_length = *(_OWORD *)&a3->length;
    *(_OWORD *)&v8->var2.index[1] = v18;
    v19 = *(_OWORD *)&a3->index[3];
    v20 = *(_OWORD *)&a3->index[5];
    v21 = *(_OWORD *)&a3->index[7];
    v8->var2.index[9] = a3->index[9];
    *(_OWORD *)&v8->var2.index[5] = v20;
    *(_OWORD *)&v8->var2.index[7] = v21;
    *(_OWORD *)&v8->var2.index[3] = v19;
    -[PXTileStatePool _storeTargetIdentifierLookupForTileState:withIndex:](self, "_storeTargetIdentifierLookupForTileState:withIndex:", v8, a4);
  }
}

- (void)setCurrentGeometry:(const PXTileGeometry *)a3 forTileStateAtIndex:(unint64_t)a4
{
  PXTileState *v7;
  CGPoint *p_origin;
  CGPoint origin;
  CGSize size;
  CGSize v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGPoint v18;
  CGSize v19;
  CGSize v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v7 = &self->_states[a4];
  p_origin = &v7->var6.frame.origin;
  if ((PXRectIdenticalToRect() & 1) != 0)
  {
    origin = a3->frame.origin;
    size = a3->frame.size;
    v11 = a3->size;
    v7->var6.center = a3->center;
    v7->var6.size = v11;
    *p_origin = origin;
    v7->var6.frame.size = size;
    v12 = *(_OWORD *)&a3->transform.a;
    v13 = *(_OWORD *)&a3->transform.c;
    v14 = *(_OWORD *)&a3->alpha;
    *(_OWORD *)&v7->var6.transform.tx = *(_OWORD *)&a3->transform.tx;
    *(_OWORD *)&v7->var6.alpha = v14;
    *(_OWORD *)&v7->var6.transform.a = v12;
    *(_OWORD *)&v7->var6.transform.c = v13;
    v15 = *(_OWORD *)&a3->hidden;
    v16 = *(_OWORD *)&a3->contentSize.height;
    v17 = *(_OWORD *)&a3->contentsRect.size.height;
    *(_OWORD *)&v7->var6.contentsRect.origin.y = *(_OWORD *)&a3->contentsRect.origin.y;
    *(_OWORD *)&v7->var6.contentsRect.size.height = v17;
    *(_OWORD *)&v7->var6.hidden = v15;
    *(_OWORD *)&v7->var6.contentSize.height = v16;
  }
  else
  {
    v27 = MEMORY[0x1E0C809B0];
    PXEnumeratePageKeysForRect();
    v18 = a3->frame.origin;
    v19 = a3->frame.size;
    v20 = a3->size;
    v7->var6.center = a3->center;
    v7->var6.size = v20;
    *p_origin = v18;
    v7->var6.frame.size = v19;
    v21 = *(_OWORD *)&a3->transform.a;
    v22 = *(_OWORD *)&a3->transform.c;
    v23 = *(_OWORD *)&a3->alpha;
    *(_OWORD *)&v7->var6.transform.tx = *(_OWORD *)&a3->transform.tx;
    *(_OWORD *)&v7->var6.alpha = v23;
    *(_OWORD *)&v7->var6.transform.a = v21;
    *(_OWORD *)&v7->var6.transform.c = v22;
    v24 = *(_OWORD *)&a3->hidden;
    v25 = *(_OWORD *)&a3->contentSize.height;
    v26 = *(_OWORD *)&a3->contentsRect.size.height;
    *(_OWORD *)&v7->var6.contentsRect.origin.y = *(_OWORD *)&a3->contentsRect.origin.y;
    *(_OWORD *)&v7->var6.contentsRect.size.height = v26;
    *(_OWORD *)&v7->var6.hidden = v24;
    *(_OWORD *)&v7->var6.contentSize.height = v25;
    -[PXTileStatePool _storeCurrentFrameLookupForTileState:withIndex:](self, "_storeCurrentFrameLookupForTileState:withIndex:", v7, a4, v27, 3221225472, __58__PXTileStatePool_setCurrentGeometry_forTileStateAtIndex___block_invoke, &unk_1E51479F0, self, a4);
  }
}

- (void)_storeTargetIdentifierLookupForTileState:(PXTileState *)a3 withIndex:(unint64_t)a4
{
  unint64_t v4;
  unint64_t length;
  PXTileIdentifier *p_var2;
  uint64_t v9;
  unint64_t v10;
  unint64_t value;
  uint8x8_t v12;
  void ***v13;
  void **i;
  unint64_t v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  __int128 v22;
  unint64_t v23;
  __int128 v24;
  float v25;
  float v26;
  _BOOL8 v27;
  unint64_t v28;
  unint64_t v29;
  int8x8_t prime;
  void **v31;
  void **v32;
  uint64_t v33;
  _QWORD *next;
  unint64_t v35;
  uint8x8_t v36;
  unint64_t v37;
  uint8x8_t v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  void **v42;
  void **v43;
  void **v44;
  unint64_t v45;
  void **v46;

  p_var2 = &a3->var2;
  length = a3->var2.length;
  if (!length)
    return;
  v9 = 0;
  v10 = a3->var2.length;
  do
  {
    v10 ^= a3->var2.index[v9] << v9;
    ++v9;
  }
  while (length != v9);
  value = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= value)
        v4 = v10 % value;
    }
    else
    {
      v4 = (value - 1) & v10;
    }
    v13 = (void ***)self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v4];
    if (v13)
    {
      for (i = *v13; i; i = (void **)*i)
      {
        v15 = (unint64_t)i[1];
        if (v15 == v10)
        {
          v16 = i[2];
          v17 = v16 == (void *)length;
          if (v16)
            v18 = v16 == (void *)length;
          else
            v18 = 0;
          if (v18)
          {
            v19 = 0;
            do
            {
              v20 = i[v19 + 3];
              v21 = a3->var2.index[v19];
              v17 = v20 == (void *)v21;
              ++v19;
            }
            while (v19 < length && v20 == (void *)v21);
          }
          if (v17)
            goto LABEL_85;
        }
        else
        {
          if (v12.u32[0] > 1uLL)
          {
            if (v15 >= value)
              v15 %= value;
          }
          else
          {
            v15 &= value - 1;
          }
          if (v15 != v4)
            break;
        }
      }
    }
  }
  i = (void **)operator new(0x70uLL);
  *i = 0;
  i[1] = (void *)v10;
  v22 = *(_OWORD *)&p_var2->index[5];
  *((_OWORD *)i + 3) = *(_OWORD *)&p_var2->index[3];
  *((_OWORD *)i + 4) = v22;
  *((_OWORD *)i + 5) = *(_OWORD *)&p_var2->index[7];
  v23 = p_var2->index[9];
  v24 = *(_OWORD *)&p_var2->index[1];
  *((_OWORD *)i + 1) = *(_OWORD *)&p_var2->length;
  *((_OWORD *)i + 2) = v24;
  i[12] = (void *)v23;
  i[13] = 0;
  v25 = (float)(self->_indexByTargetIdentifier.__table_.__p2_.__value_ + 1);
  v26 = self->_indexByTargetIdentifier.__table_.__p3_.__value_;
  if (!value || (float)(v26 * (float)value) < v25)
  {
    v27 = 1;
    if (value >= 3)
      v27 = (value & (value - 1)) != 0;
    v28 = v27 | (2 * value);
    v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29)
      prime = (int8x8_t)v29;
    else
      prime = (int8x8_t)v28;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      value = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(_QWORD *)&prime > value)
      goto LABEL_41;
    if (*(_QWORD *)&prime < value)
    {
      v37 = vcvtps_u32_f32((float)self->_indexByTargetIdentifier.__table_.__p2_.__value_/ self->_indexByTargetIdentifier.__table_.__p3_.__value_);
      if (value < 3 || (v38 = (uint8x8_t)vcnt_s8((int8x8_t)value), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        v37 = std::__next_prime(v37);
      }
      else
      {
        v39 = 1 << -(char)__clz(v37 - 1);
        if (v37 >= 2)
          v37 = v39;
      }
      if (*(_QWORD *)&prime <= v37)
        prime = (int8x8_t)v37;
      if (*(_QWORD *)&prime >= value)
      {
        value = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_41:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v31 = (void **)operator new(8 * *(_QWORD *)&prime);
          v32 = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
          self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_ = v31;
          if (v32)
            operator delete(v32);
          v33 = 0;
          self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v33++] = 0;
          while (*(_QWORD *)&prime != v33);
          next = self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_;
          if (next)
          {
            v35 = next[1];
            v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(_QWORD *)&prime)
                v35 %= *(_QWORD *)&prime;
            }
            else
            {
              v35 &= *(_QWORD *)&prime - 1;
            }
            self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v35] = &self->_indexByTargetIdentifier.__table_.__p1_;
            v40 = (_QWORD *)*next;
            if (*next)
            {
              do
              {
                v41 = v40[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v41 >= *(_QWORD *)&prime)
                    v41 %= *(_QWORD *)&prime;
                }
                else
                {
                  v41 &= *(_QWORD *)&prime - 1;
                }
                if (v41 != v35)
                {
                  v42 = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v42[v41])
                  {
                    v42[v41] = next;
                    goto LABEL_66;
                  }
                  *next = *v40;
                  *v40 = *(_QWORD *)self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v41];
                  *(_QWORD *)self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v41] = v40;
                  v40 = next;
                }
                v41 = v35;
LABEL_66:
                next = v40;
                v40 = (_QWORD *)*v40;
                v35 = v41;
              }
              while (v40);
            }
          }
          value = (unint64_t)prime;
          goto LABEL_70;
        }
        v46 = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
        self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v46)
          operator delete(v46);
        value = 0;
        self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_70:
    if ((value & (value - 1)) != 0)
    {
      if (v10 >= value)
        v4 = v10 % value;
      else
        v4 = v10;
    }
    else
    {
      v4 = (value - 1) & v10;
    }
  }
  v43 = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
  v44 = (void **)v43[v4];
  if (v44)
  {
    *i = *v44;
  }
  else
  {
    *i = self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_;
    self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_ = i;
    v43[v4] = &self->_indexByTargetIdentifier.__table_.__p1_;
    if (!*i)
      goto LABEL_84;
    v45 = *((_QWORD *)*i + 1);
    if ((value & (value - 1)) != 0)
    {
      if (v45 >= value)
        v45 %= value;
    }
    else
    {
      v45 &= value - 1;
    }
    v44 = &self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_[v45];
  }
  *v44 = i;
LABEL_84:
  ++self->_indexByTargetIdentifier.__table_.__p2_.__value_;
LABEL_85:
  i[13] = (void *)a4;
}

- (void)_storeCurrentFrameLookupForTileState:(PXTileState *)a3 withIndex:(unint64_t)a4
{
  PXEnumeratePageKeysForRect();
}

- (id)description
{
  void *v3;
  id v4;
  _OWORD *i;
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v10[5];
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p;\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __30__PXTileStatePool_description__block_invoke;
  v12[3] = &unk_1E5129270;
  v4 = v3;
  v13 = v4;
  -[PXTileStatePool enumerateStatesUsingBlock:](self, "enumerateStatesUsingBlock:", v12);
  objc_msgSend(v4, "appendString:", CFSTR("* targetIdentifier -> index lookup\n"));
  for (i = self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_; i; i = *(_OWORD **)i)
  {
    v6 = i[4];
    v10[2] = i[3];
    v10[3] = v6;
    v10[4] = i[5];
    v11 = *((_QWORD *)i + 12);
    v7 = i[2];
    v10[0] = i[1];
    v10[1] = v7;
    PXTileIdentifierDescription((unint64_t *)v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("%@ -> %lu\n"), v8, *((_QWORD *)i + 13));

  }
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));

  return v4;
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;

  objc_storeStrong((id *)&self->_pageKeysToRemove, 0);
  objc_storeStrong((id *)&self->_unusedIndexes, 0);
  objc_storeStrong((id *)&self->_usedIndexes, 0);
  objc_storeStrong((id *)&self->_tileIndexesByPageKey, 0);
  next = self->_indexByTargetIdentifier.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_;
  self->_indexByTargetIdentifier.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  return self;
}

void __30__PXTileStatePool_description__block_invoke(uint64_t a1, uint64_t a2, void *__src)
{
  void *v4;
  id v5;
  unsigned __int8 __dst[712];

  v4 = *(void **)(a1 + 32);
  memcpy(__dst, __src, sizeof(__dst));
  PXTileStateDescription(__dst);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%lu: %@\n"), a2, v5);

}

void __66__PXTileStatePool__storeCurrentFrameLookupForTileState_withIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:");
  }
  objc_msgSend(v3, "addIndex:", *(_QWORD *)(a1 + 40));

}

void __58__PXTileStatePool_setCurrentGeometry_forTileStateAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeIndex:", *(_QWORD *)(a1 + 40));

}

uint64_t __46__PXTileStatePool_indexesOfStatesPassingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  return result;
}

uint64_t __48__PXTileStatePool_indexOfFirstStatePassingTest___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

void __52__PXTileStatePool_enumerateStatesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __52__PXTileStatePool_enumerateStatesInRect_usingBlock___block_invoke_2;
  v10[3] = &unk_1E511E878;
  v5 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[1] = 3221225472;
  v6 = *(_OWORD *)(a1 + 72);
  v13 = *(_OWORD *)(a1 + 56);
  v14 = v6;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 48);
  v11 = v7;
  v12 = v8;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v10);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;

}

uint64_t __52__PXTileStatePool_enumerateStatesInRect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = CGRectIntersectsRect(*(CGRect *)(a1 + 56), *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 712 * a2 + 288));
  if ((_DWORD)result)
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a3 = 1;
  }
  return result;
}

uint64_t __55__PXTileStatePool_enumerateStatesAtIndexes_usingBlock___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a2 < a2 + a3)
  {
    v3 = a3;
    v4 = a2;
    v5 = result;
    v6 = 712 * a2;
    do
    {
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v5 + 40) + 16))();
      ++v4;
      v6 += 712;
      --v3;
    }
    while (v3);
  }
  return result;
}

void __40__PXTileStatePool__cleanupStateAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeIndex:", *(_QWORD *)(a1 + 40));

}

uint64_t __34__PXTileStatePool_checkInIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupStateAtIndex:", a2);
}

void __26__PXTileStatePool_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v3 + 712 * a2;
  v5 = *(void **)(v4 + 688);
  if (v5)
  {
    v6 = (_QWORD *)(v4 + 688);

    *v6 = 0;
  }
  v7 = v3 + 712 * a2;
  v8 = *(void **)(v7 + 680);
  if (v8)
  {
    v9 = (_QWORD *)(v7 + 680);

    *v9 = 0;
  }
}

@end
