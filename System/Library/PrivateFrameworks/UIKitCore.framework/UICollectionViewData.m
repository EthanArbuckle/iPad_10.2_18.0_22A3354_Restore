@implementation UICollectionViewData

- (uint64_t)numberOfItemsBeforeSection:(uint64_t)result
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  if (result)
  {
    v3 = (_QWORD *)result;
    if ((*(_BYTE *)(result + 96) & 2) == 0)
      -[UICollectionViewData _updateItemCounts](result);
    v4 = (uint64_t)(v3[14] - v3[13]) >> 3;
    if (v4 < a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_numberOfItemsBeforeSection_, v3, CFSTR("UICollectionViewData.mm"), 511, CFSTR("request for number of items before section %ld when there are only %ld sections in the collection view"), a2, v4);

    }
    v5 = v3[8];
    if (v5 <= a2)
    {
      result = v3[9];
      v6 = (int)v5;
    }
    else
    {
      result = 0;
      v6 = 0;
    }
    v7 = a2 - v6;
    if (a2 > v6)
    {
      v8 = (uint64_t *)(v3[13] + 8 * v6);
      do
      {
        v9 = *v8++;
        result += v9;
        --v7;
      }
      while (v7);
    }
    v3[8] = a2;
    v3[9] = result;
  }
  return result;
}

- (_BYTE)validatedIndexPathForItemAtGlobalIndex:(_BYTE *)a1
{
  _BYTE *v3;

  if (a1)
  {
    v3 = a1;
    if ((a1[96] & 2) == 0)
      -[UICollectionViewData _updateItemCounts]((uint64_t)a1);
    a1 = 0;
    if ((a2 & 0x8000000000000000) == 0 && *((_QWORD *)v3 + 21) > a2)
    {
      -[UICollectionViewData indexPathForItemAtGlobalIndex:](v3, a2);
      a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (uint64_t)validatedGlobalIndexForItemAtIndexPath:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    if (-[UICollectionViewData _isIndexPathValid:validateItemCounts:](result, a2, 1))
    {
      v5 = 0;
      v6 = 0;
      objc_msgSend(a2, "ui_getSectionIndex:itemIndex:", &v6, &v5);
      v4 = -[UICollectionViewData numberOfItemsBeforeSection:](v3, v6);
      return v5 + v4;
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(uint64_t)a1
{
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if (!a1
    || (-[UICollectionViewData _prepareToLoadData](a1),
        !-[UICollectionViewData _isIndexPathValid:validateItemCounts:](a1, a2, 0)))
  {
LABEL_17:
    v6 = 0;
    return v6;
  }
  if (!-[UICollectionViewData _shouldUseReorderingLayoutAttributesForItemAtIndexPath:](a1, (uint64_t)a2)
    || (v4 = *(void **)(a1 + 16),
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 8)),
        objc_msgSend(WeakRetained, "_reorderingTargetPosition"),
        objc_msgSend(v4, "_layoutAttributesForReorderedItemAtIndexPath:withTargetPosition:", a2),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        !v6))
  {
    v7 = *(_QWORD *)(a1 + 168);
    v15 = 0;
    v16 = 0;
    objc_msgSend(a2, "ui_getSectionIndex:itemIndex:", &v16, &v15);
    v8 = -[UICollectionViewData numberOfItemsBeforeSection:](a1, v16);
    v9 = v15 + v8;
    if (v15 + v8 >= v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForItemAtIndexPath_, a1, CFSTR("UICollectionViewData.mm"), 704, CFSTR("attempting to access layout attributes at invalid index path: %@ globalIndex: %ld numItems: %ld"), a2, v9, v7);

    }
    -[UICollectionViewData _cachedLayoutAttributesForGlobalItemIndex:]((_QWORD *)a1, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if ((*(_BYTE *)(a1 + 96) & 0x10) != 0)
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 16), "layoutAttributesForItemAtIndexPath:", a2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewData _setLayoutAttributes:atGlobalItemIndex:](a1, v6, v9);
      }
    }
    v10 = dyld_program_sdk_at_least();
    v11 = v6 ? 1 : v10;
    if ((v11 & 1) == 0)
    {
      if ((*(_BYTE *)(a1 + 96) & 0x10) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForItemAtIndexPath_, a1, CFSTR("UICollectionViewData.mm"), 715, CFSTR("no UICollectionViewLayoutAttributes instance for -layoutAttributesForItemAtIndexPath: %@"), a2);

      }
      goto LABEL_17;
    }
  }
  return v6;
}

- (uint64_t)_isIndexPathValid:(int)a3 validateItemCounts:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v4 = result;
    if (a3 && (*(_BYTE *)(result + 96) & 2) == 0)
      -[UICollectionViewData _updateItemCounts](result);
    if ((unint64_t)objc_msgSend(a2, "length") >= 2)
    {
      v5 = *(_QWORD *)(v4 + 112) - *(_QWORD *)(v4 + 104);
      v7 = 0;
      v8 = 0;
      objc_msgSend(a2, "ui_getSectionIndex:itemIndex:", &v8, &v7);
      result = 0;
      if (v8 < v5 >> 3 && (v8 & 0x8000000000000000) == 0)
        return *(_QWORD *)(*(_QWORD *)(v4 + 104) + 8 * v8) > v7 && v7 >= 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (_QWORD)_cachedLayoutAttributesForGlobalItemIndex:(_QWORD *)a1
{
  if (a1)
  {
    a1 = std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::find<long>(a1 + 16, a2);
    if (a1)
      a1 = (id)a1[3];
  }
  return a1;
}

- (uint64_t)_prepareToLoadData
{
  uint64_t v1;
  char v2;
  NSObject *v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (result)
  {
    v1 = result;
    result = dyld_program_sdk_at_least();
    v2 = *(_BYTE *)(v1 + 96);
    if (!(_DWORD)result || (*(_BYTE *)(v1 + 96) & 4) == 0)
    {
      if ((*(_BYTE *)(v1 + 96) & 8) == 0)
      {
        if (os_variant_has_internal_diagnostics())
        {
          if ((*(_BYTE *)(v1 + 96) & 0x10) != 0)
          {
            __UIFaultDebugAssertLog();
            v3 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_185066000, v3, OS_LOG_TYPE_FAULT, "trying to load collection view layout data when layout is locked", buf, 2u);
            }

          }
        }
        else if ((*(_BYTE *)(v1 + 96) & 0x10) != 0)
        {
          v4 = -[UICollectionViewData _prepareToLoadData]::__s_category;
          if (!-[UICollectionViewData _prepareToLoadData]::__s_category)
          {
            v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v4, (unint64_t *)&-[UICollectionViewData _prepareToLoadData]::__s_category);
          }
          v5 = *(NSObject **)(v4 + 8);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v6 = 0;
            _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "trying to load collection view layout data when layout is locked", v6, 2u);
          }
        }
        *(_BYTE *)(v1 + 96) |= 4u;
        objc_msgSend(*(id *)(v1 + 16), "_prepareLayout");
        v2 = *(_BYTE *)(v1 + 96) & 0xF3 | 8;
        *(_BYTE *)(v1 + 96) = v2;
      }
      if ((v2 & 2) == 0)
        -[UICollectionViewData _updateItemCounts](v1);
      return -[UICollectionViewData _validateContentSize](v1);
    }
  }
  return result;
}

- (uint64_t)_validateContentSize
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 96) & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        if ((*(_BYTE *)(v1 + 96) & 0x10) != 0)
        {
          __UIFaultDebugAssertLog();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v4, OS_LOG_TYPE_FAULT, "trying to load collection view layout data when layout is locked", buf, 2u);
          }

        }
      }
      else if ((*(_BYTE *)(v1 + 96) & 0x10) != 0)
      {
        v5 = -[UICollectionViewData _validateContentSize]::__s_category;
        if (!-[UICollectionViewData _validateContentSize]::__s_category)
        {
          v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&-[UICollectionViewData _validateContentSize]::__s_category);
        }
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "trying to load collection view layout data when layout is locked", v7, 2u);
        }
      }
      result = objc_msgSend(*(id *)(v1 + 16), "collectionViewContentSize");
      *(_QWORD *)(v1 + 80) = v2;
      *(_QWORD *)(v1 + 88) = v3;
      *(_BYTE *)(v1 + 96) |= 1u;
    }
  }
  return result;
}

- (void)_setLayoutAttributes:(int64_t)a3 atGlobalItemIndex:
{
  void *v6;
  int8x16_t v7;

  if (a1 && *(_QWORD *)(a1 + 168) > a3)
  {
    if (a2)
    {
      -[_UICollectionViewDataAttributesMap pageInLayoutAttributes:forGlobalItemIndex:](*(_QWORD *)(a1 + 176), a2, a3);
      v6 = (void *)objc_msgSend(a2, "copy");
      -[UICollectionViewData _setCachedLayoutAttributes:forGlobalItemIndex:](a1, v6, a3);

      -[_UIMutableFastIndexSet removeIndex:](*(uint16x8_t **)(a1 + 24), a3, v7);
    }
    else
    {
      std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__erase_unique<long>((_QWORD *)(a1 + 128), a3);
    }
  }
}

- (void)_setCachedLayoutAttributes:(unint64_t)a3 forGlobalItemIndex:
{
  unint64_t v3;
  unint64_t v4;
  void **v5;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  void *i;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  int8x8_t prime;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  void *v34;

  v4 = a3;
  v5 = (void **)(a1 + 128);
  if (!obj)
  {
    std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__erase_unique<long>((_QWORD *)(a1 + 128), a3);
    return;
  }
  v8 = *(_QWORD *)(a1 + 136);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v3 = a3;
      if (v8 <= a3)
        v3 = a3 % v8;
    }
    else
    {
      v3 = (v8 - 1) & a3;
    }
    v10 = (void **)*((_QWORD *)*v5 + v3);
    if (v10)
    {
      for (i = *v10; i; i = *(void **)i)
      {
        v12 = *((_QWORD *)i + 1);
        if (v12 == a3)
        {
          if (*((_QWORD *)i + 2) == a3)
            goto LABEL_76;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v3)
            break;
        }
      }
    }
  }
  v13 = (_QWORD *)(a1 + 144);
  i = operator new(0x20uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v4;
  *((_QWORD *)i + 2) = v4;
  *((_QWORD *)i + 3) = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 152) + 1);
  v15 = *(float *)(a1 + 160);
  if (v8 && (float)(v15 * (float)v8) >= v14)
  {
    v4 = v3;
    goto LABEL_66;
  }
  v16 = 1;
  if (v8 >= 3)
    v16 = (v8 & (v8 - 1)) != 0;
  v17 = v16 | (2 * v8);
  v18 = vcvtps_u32_f32(v14 / v15);
  if (v17 <= v18)
    prime = (int8x8_t)v18;
  else
    prime = (int8x8_t)v17;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    v8 = *(_QWORD *)(a1 + 136);
  }
  if (*(_QWORD *)&prime <= v8)
  {
    if (*(_QWORD *)&prime >= v8)
      goto LABEL_62;
    v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 152) / *(float *)(a1 + 160));
    if (v8 < 3 || (v27 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
    {
      v26 = std::__next_prime(v26);
    }
    else
    {
      v28 = 1 << -(char)__clz(v26 - 1);
      if (v26 >= 2)
        v26 = v28;
    }
    if (*(_QWORD *)&prime <= v26)
      prime = (int8x8_t)v26;
    if (*(_QWORD *)&prime >= v8)
    {
      v8 = *(_QWORD *)(a1 + 136);
      goto LABEL_62;
    }
    if (!*(_QWORD *)&prime)
    {
      v34 = *v5;
      *v5 = 0;
      if (v34)
        operator delete(v34);
      v8 = 0;
      *(_QWORD *)(a1 + 136) = 0;
      goto LABEL_62;
    }
  }
  if (*(_QWORD *)&prime >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  v20 = operator new(8 * *(_QWORD *)&prime);
  v21 = *v5;
  *v5 = v20;
  if (v21)
    operator delete(v21);
  v22 = 0;
  *(int8x8_t *)(a1 + 136) = prime;
  do
    *((_QWORD *)*v5 + v22++) = 0;
  while (*(_QWORD *)&prime != v22);
  v23 = (_QWORD *)*v13;
  if (*v13)
  {
    v24 = v23[1];
    v25 = (uint8x8_t)vcnt_s8(prime);
    v25.i16[0] = vaddlv_u8(v25);
    if (v25.u32[0] > 1uLL)
    {
      if (v24 >= *(_QWORD *)&prime)
        v24 %= *(_QWORD *)&prime;
    }
    else
    {
      v24 &= *(_QWORD *)&prime - 1;
    }
    *((_QWORD *)*v5 + v24) = v13;
    v29 = (_QWORD *)*v23;
    if (*v23)
    {
      do
      {
        v30 = v29[1];
        if (v25.u32[0] > 1uLL)
        {
          if (v30 >= *(_QWORD *)&prime)
            v30 %= *(_QWORD *)&prime;
        }
        else
        {
          v30 &= *(_QWORD *)&prime - 1;
        }
        if (v30 != v24)
        {
          if (!*((_QWORD *)*v5 + v30))
          {
            *((_QWORD *)*v5 + v30) = v23;
            goto LABEL_58;
          }
          *v23 = *v29;
          *v29 = **((_QWORD **)*v5 + v30);
          **((_QWORD **)*v5 + v30) = v29;
          v29 = v23;
        }
        v30 = v24;
LABEL_58:
        v23 = v29;
        v29 = (_QWORD *)*v29;
        v24 = v30;
      }
      while (v29);
    }
  }
  v8 = (unint64_t)prime;
LABEL_62:
  if ((v8 & (v8 - 1)) != 0)
  {
    if (v8 <= v4)
      v4 %= v8;
  }
  else
  {
    v4 &= v8 - 1;
  }
LABEL_66:
  v31 = *v5;
  v32 = (_QWORD *)*((_QWORD *)*v5 + v4);
  if (v32)
  {
    *(_QWORD *)i = *v32;
  }
  else
  {
    *(_QWORD *)i = *v13;
    *v13 = i;
    v31[v4] = v13;
    if (!*(_QWORD *)i)
      goto LABEL_75;
    v33 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v33 >= v8)
        v33 %= v8;
    }
    else
    {
      v33 &= v8 - 1;
    }
    v32 = (char *)*v5 + 8 * v33;
  }
  *v32 = i;
LABEL_75:
  ++*(_QWORD *)(a1 + 152);
LABEL_76:
  objc_storeStrong((id *)i + 3, obj);
}

- (_BYTE)indexPathForItemAtGlobalIndex:(_BYTE *)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;

  if (a1)
  {
    v3 = (uint64_t)a1;
    if ((a1[96] & 2) == 0)
      -[UICollectionViewData _updateItemCounts]((uint64_t)a1);
    v4 = *(_QWORD *)(v3 + 104);
    v5 = *(_QWORD *)(v3 + 112) - v4;
    if (v5 < 1)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(_BYTE *)(v3 + 96) & 2) == 0)
        -[UICollectionViewData _updateItemCounts](v3);
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_indexPathForItemAtGlobalIndex_, v3, CFSTR("UICollectionViewData.mm"), 609, CFSTR("request for index path for global index %ld when there are only %ld items in the collection view"), a2, *(_QWORD *)(v3 + 168));

      a1 = 0;
    }
    else
    {
      v6 = 0;
      v7 = (unint64_t)v5 >> 3;
      if (v7 <= 1)
        v7 = 1;
      v8 = a2;
      while (1)
      {
        v9 = *(_QWORD *)(v4 + 8 * v6);
        v10 = __OFSUB__(v8, v9);
        v11 = v8 - v9;
        if (v11 < 0 != v10)
          break;
        ++v6;
        v8 = v11;
        if (v7 == v6)
          goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
      a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (id)layoutAttributesForDecorationViewOfKind:(void *)a3 atIndexPath:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v12;
  void *v13;

  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 112) - *(_QWORD *)(a1 + 104);
    v7 = objc_msgSend(a3, "section");
    if (v7 >= v6 >> 3)
    {
      v8 = v7;
      if (objc_msgSend(a3, "item") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = v6 >> 3;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForDecorationViewOfKind_atIndexPath_, a1, CFSTR("UICollectionViewData.mm"), 1006, CFSTR("request for layout attributes for decoration view of kind \"%@\" in section %ld when there are only %ld sections in the collection view"), a2, v8, v12);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if ((*(_BYTE *)(a1 + 96) & 0x10) != 0)
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 16), "layoutAttributesForDecorationViewOfKind:atIndexPath:", a2, a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (!v9)
          {
            v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:");
          }
          objc_msgSend(v9, "setObject:forKey:", v10, a3);
        }
      }
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)layoutAttributesForSupplementaryElementOfKind:(void *)a3 atIndexPath:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v16;
  void *v17;
  void *v18;

  if (a1)
  {
    v6 = objc_msgSend(a3, "section");
    v7 = *(_QWORD *)(a1 + 112) - *(_QWORD *)(a1 + 104);
    if (v6 >= v7 >> 3)
    {
      v8 = v6;
      if (objc_msgSend(a3, "item") != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = v7 >> 3;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForSupplementaryElementOfKind_atIndexPath_, a1, CFSTR("UICollectionViewData.mm"), 981, CFSTR("request for layout attributes for supplementary view \"%@\" in section %ld when there are only %ld sections in the collection view"), a2, v8, v16);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if ((*(_BYTE *)(a1 + 96) & 0x10) != 0
        || (objc_msgSend(*(id *)(a1 + 16), "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", a2, a3),
            (v11 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v10 = 0;
      }
      else
      {
        v12 = (void *)v11;
        if (!v9)
        {
          v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:");
        }
        objc_msgSend(v9, "setObject:forKey:", v12, a3);
        v10 = v12;
      }
    }
    v13 = dyld_program_sdk_at_least();
    if (v10)
      v14 = 1;
    else
      v14 = v13;
    if ((v14 & 1) == 0 && (*(_BYTE *)(a1 + 96) & 0x10) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_layoutAttributesForSupplementaryElementOfKind_atIndexPath_, a1, CFSTR("UICollectionViewData.mm"), 997, CFSTR("no UICollectionViewLayoutAttributes instance for -layoutAttributesForSupplementaryElementOfKind: %@ at path %@"), a2, a3);

    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)existingSupplementaryLayoutAttributesInSection:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  void *v22;
  void *v23;
  uint64_t v25;
  id obj;
  id obja;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v25 = a1;
  objc_msgSend(*(id *)(a1 + 32), "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v5)
  {
    v28 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v7, "objectEnumerator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v39 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              objc_msgSend(v12, "indexPath");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "section") == a2 && (unint64_t)objc_msgSend(v13, "length") >= 2)
                objc_msgSend(v4, "addObject:", v12);

            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
          }
          while (v9);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v5);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(*(id *)(v25 + 40), "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  obja = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v15)
  {
    v29 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(obja);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * k);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v17, "objectEnumerator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v31;
          do
          {
            for (m = 0; m != v19; ++m)
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v18);
              v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * m);
              objc_msgSend(v22, "indexPath");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v23, "section") == a2 && (unint64_t)objc_msgSend(v23, "length") >= 2)
                objc_msgSend(v4, "addObject:", v22);

            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
          }
          while (v19);
        }

      }
      v14 = obja;
      v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v15);
  }

  return v4;
}

- (void)invalidate:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  if (a1 && (*(_BYTE *)(a1 + 96) & 0x10) == 0)
  {
    if ((a2 & 1) == 0)
      *(_BYTE *)(a1 + 96) &= ~2u;
    -[_UICollectionViewDataAttributesMap invalidate](*(_QWORD *)(a1 + 176));
    *(_BYTE *)(a1 + 96) &= 0xF6u;
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v4 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v5 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::clear(a1 + 128);
  }
}

- (void)_attributesMapDidPageInAttributes:(unint64_t)a3 globalItemIndex:(int8x16_t)a4
{
  __int16 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;

  if (a1)
  {
    if (a2)
    {
      v6 = a2[144];
      if ((v6 & 1) != 0)
      {
        -[_UIMutableFastIndexSet removeIndex:](*(uint16x8_t **)(a1 + 24), a3, a4);
        -[UICollectionViewData _setCachedLayoutAttributes:forGlobalItemIndex:](a1, a2, a3);
        return;
      }
      v7 = (id)objc_msgSend(a2, "indexPath");
      v8 = 40;
      if ((v6 & 2) == 0)
        v8 = 32;
    }
    else
    {
      v7 = (id)objc_msgSend(0, "indexPath");
      v8 = 32;
    }
    v15 = *(id *)(a1 + v8);
    -[UIBarButtonItemGroup _items]((id *)a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__attributesMapDidPageInAttributes_globalItemIndex_, a1, CFSTR("UICollectionViewData.mm"), 115, CFSTR("%@ elementKind is nil. This probably means you created the UICollectionViewLayoutAttributes using +alloc/-init instead of one of the class constructors"), a2);

      v10 = v15;
    }
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      if (v11)
      {
        objc_msgSend(v11, "setObject:forKey:", a2, v7);
      }
      else
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", a2, v7, 0);
        objc_msgSend(v15, "setObject:forKey:", v11, v9);
      }
    }

  }
}

- (id)layoutAttributesForElementsInRect:(double)a3
{
  if (a1)
  {
    -[UICollectionViewData _layoutAttributesForElementsInRect:cellsOnly:validateIfNeeded:includeIndelibleElements:]((uint64_t)a1, 0, 1, 1, a2, a3, a4, a5);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)validateLayoutInRect:(CGFloat)a3
{
  char v10;
  char v11;
  uint64_t v12;

  if (a1)
  {
    v10 = *(_BYTE *)(a1 + 96);
    if ((v10 & 8) != 0)
    {
      if (-[_UIFastIndexSet count](*(int8x16_t **)(a1 + 24)) || *(_QWORD *)(a1 + 48))
        v11 = 0;
      else
        v11 = 8 * (*(_QWORD *)(a1 + 56) == 0);
      *(_BYTE *)(a1 + 96) = v11 | v10 & 0xF7;
    }
    -[UICollectionViewData _prepareToLoadData](a1);
    if (*(_QWORD *)(a1 + 48))
      -[UICollectionViewData validateSupplementaryViews](a1);
    if (*(_QWORD *)(a1 + 56))
      -[UICollectionViewData validateDecorationViews](a1);
    v12 = *(_QWORD *)(a1 + 176);
    if (v12)
      -[_UICollectionViewDataAttributesMap _validateLayoutInRect:](v12, a2, a3, a4, a5);
    if (-[_UIFastIndexSet count](*(int8x16_t **)(a1 + 24)))
      -[UICollectionViewData validateItems](a1);
  }
}

- (double)collectionViewContentRect
{
  if (!a1)
    return 0.0;
  -[UICollectionViewData _prepareToLoadData](a1);
  return *MEMORY[0x1E0C9D538];
}

- (id).cxx_construct
{
  *((_QWORD *)self + 19) = 0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 40) = 1065353216;
  return self;
}

- (id)existingSupplementaryLayoutAttributes
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v6), "allValues");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "objectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v9);
  }

  return v2;
}

- (id)layoutAttributesForGlobalItemIndex:(_BYTE *)a1
{
  id v2;
  void *v3;

  v2 = a1;
  if (a1)
  {
    -[UICollectionViewData indexPathForItemAtGlobalIndex:](a1, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewData layoutAttributesForItemAtIndexPath:]((uint64_t)v2, v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (uint64_t)globalIndexForItemAtIndexPath:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    v4 = 0;
    v5 = 0;
    objc_msgSend(a2, "ui_getSectionIndex:itemIndex:", &v5, &v4);
    v3 = -[UICollectionViewData numberOfItemsBeforeSection:](v2, v5);
    return v4 + v3;
  }
  return result;
}

- (uint64_t)numberOfSections
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if ((*(_BYTE *)(result + 96) & 2) == 0)
      -[UICollectionViewData _updateItemCounts](result);
    return (uint64_t)(*(_QWORD *)(v1 + 112) - *(_QWORD *)(v1 + 104)) >> 3;
  }
  return result;
}

- (uint64_t)numberOfItemsInSection:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    if ((*(_BYTE *)(result + 96) & 2) == 0)
      -[UICollectionViewData _updateItemCounts](result);
    return -[UICollectionViewData _existingNumberOfItemsInSection:](v3, a2);
  }
  return result;
}

- (uint64_t)_existingNumberOfItemsInSection:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 104);
    v5 = (*(_QWORD *)(result + 112) - v4) >> 3;
    if (v5 <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__existingNumberOfItemsInSection_, v3, CFSTR("UICollectionViewData.mm"), 497, CFSTR("request for number of items in section %ld when there are only %ld sections in the collection view"), a2, v5);

      v4 = *(_QWORD *)(v3 + 104);
    }
    return *(_QWORD *)(v4 + 8 * a2);
  }
  return result;
}

- (uint64_t)initWithCollectionView:(void *)a3 layout:
{
  id *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  objc_super v14;

  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)UICollectionViewData;
  v5 = (id *)objc_msgSendSuper2(&v14, sel_init);
  v6 = (uint64_t)v5;
  if (v5)
  {
    objc_storeWeak(v5 + 1, a2);
    objc_storeStrong((id *)(v6 + 16), a3);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v9;

    *(_QWORD *)(v6 + 64) = 0x7FFFFFFFFFFFFFFFLL;
    v11 = -[_UICollectionViewDataAttributesMap initWithCollectionViewData:]([_UICollectionViewDataAttributesMap alloc], v6);
    v12 = *(void **)(v6 + 176);
    *(_QWORD *)(v6 + 176) = v11;

  }
  return v6;
}

- (uint64_t)validateLayoutInRectImmediatelyValidatingContentSizeIgnoringSpecificInvalidations:(CGFloat)a3
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  if (result)
  {
    v9 = result;
    v10 = *(void **)(result + 24);
    *(_QWORD *)(result + 24) = 0;

    v11 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = 0;

    v12 = *(void **)(v9 + 56);
    *(_QWORD *)(v9 + 56) = 0;

    -[UICollectionViewData validateLayoutInRect:](v9, a2, a3, a4, a5);
    return -[UICollectionViewData _validateContentSize](v9);
  }
  return result;
}

- (id)knownSupplementaryElementKinds
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(a1[4], "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v1[5], "allKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setByAddingObjectsFromArray:", v5);
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v1[5], "allKeys");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v5);
    }
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)_updateItemCounts
{
  id WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  id v24;

  if (a1)
  {
    std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::clear(a1 + 128);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "_dataSourceProxy");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v3 = objc_loadWeakRetained((id *)(a1 + 8));
    if (objc_msgSend(v3, "_dataSourceImplementsNumberOfSections"))
    {
      v4 = objc_loadWeakRetained((id *)(a1 + 8));
      v5 = objc_msgSend(v24, "numberOfSectionsInCollectionView:", v4);

      v6 = v5 & ~(v5 >> 63);
    }
    else
    {
      v6 = 1;
    }

    v7 = (void **)(a1 + 104);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a1 + 104);
    std::vector<long>::reserve((void **)(a1 + 104), v6);
    if (v6)
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = objc_loadWeakRetained((id *)(a1 + 8));
        v11 = objc_msgSend(v24, "collectionView:numberOfItemsInSection:", v10, v8);

        v12 = v11 & ~(v11 >> 63);
        v14 = *(uint64_t **)(a1 + 112);
        v13 = *(_QWORD *)(a1 + 120);
        if ((unint64_t)v14 >= v13)
        {
          v16 = (uint64_t *)*v7;
          v17 = ((char *)v14 - (_BYTE *)*v7) >> 3;
          v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 61)
            abort();
          v19 = v13 - (_QWORD)v16;
          if (v19 >> 2 > v18)
            v18 = v19 >> 2;
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
            v20 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v20 = v18;
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(a1 + 120, v20);
            v16 = *(uint64_t **)(a1 + 104);
            v14 = *(uint64_t **)(a1 + 112);
          }
          else
          {
            v21 = 0;
          }
          v22 = (uint64_t *)&v21[8 * v17];
          *v22 = v12;
          v15 = v22 + 1;
          while (v14 != v16)
          {
            v23 = *--v14;
            *--v22 = v23;
          }
          *(_QWORD *)(a1 + 104) = v22;
          *(_QWORD *)(a1 + 112) = v15;
          *(_QWORD *)(a1 + 120) = &v21[8 * v20];
          if (v16)
            operator delete(v16);
        }
        else
        {
          *v14 = v12;
          v15 = v14 + 1;
        }
        *(_QWORD *)(a1 + 112) = v15;
        v9 += v12;
        ++v8;
      }
      while (v8 != v6);
    }
    else
    {
      v9 = 0;
    }
    *(_QWORD *)(a1 + 168) = v9;
    *(_BYTE *)(a1 + 96) |= 2u;
    *(_QWORD *)(a1 + 64) = 0x7FFFFFFFFFFFFFFFLL;

  }
}

- (id)layoutAttributesForCellsInRect:(double)a3 validateLayout:(double)a4
{
  if (a1)
  {
    -[UICollectionViewData _layoutAttributesForElementsInRect:cellsOnly:validateIfNeeded:includeIndelibleElements:]((uint64_t)a1, 1, a2, 0, a3, a4, a5, a6);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void).cxx_destruct
{
  void **value;
  int64_t *begin;

  objc_storeStrong((id *)&self->_clonedDecorationAttributes, 0);
  objc_storeStrong((id *)&self->_clonedSupplementaryAttributes, 0);
  objc_storeStrong((id *)&self->_clonedCellAttributes, 0);
  objc_storeStrong((id *)&self->_attributesMap, 0);
  std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__deallocate_node((uint64_t)&self->_globalItemMap, (id *)self->_globalItemMap.__table_.__p1_.__value_.__next_);
  value = self->_globalItemMap.__table_.__bucket_list_.__ptr_.__value_;
  self->_globalItemMap.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  begin = self->_sectionItemCounts.__begin_;
  if (begin)
  {
    self->_sectionItemCounts.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_invalidatedDecorationIndexPaths, 0);
  objc_storeStrong((id *)&self->_invalidatedSupplementaryIndexPaths, 0);
  objc_storeStrong((id *)&self->_decorationLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_supplementaryLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_globalIndexesOfItemsAwaitingValidation, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (uint64_t)finalizeCollectionViewUpdates
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 152);
    v3 = *(_QWORD *)(result + 184);
    if (v3 <= 0x64)
      v3 = 100;
    if (v2 > v3 && v2 / v3 >= 2)
    {
      v4 = -[UICollectionViewData finalizeCollectionViewUpdates]::__s_category;
      if (!-[UICollectionViewData finalizeCollectionViewUpdates]::__s_category)
      {
        v4 = __UILogCategoryGetNode("UICollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&-[UICollectionViewData finalizeCollectionViewUpdates]::__s_category);
      }
      if ((*(_BYTE *)v4 & 1) != 0)
      {
        v10 = v2;
        v5 = *(id *)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
          v7 = *(_QWORD *)(v1 + 184);
          v8 = WeakRetained;
          objc_msgSend(v8, "_currentUpdate");
          *(_DWORD *)buf = 134218754;
          v12 = v8;
          v13 = 2048;
          v14 = v7;
          v15 = 2048;
          v16 = v10;
          v17 = 2112;
          v18 = objc_claimAutoreleasedReturnValue();
          v9 = (void *)v18;
          _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "finalizeCollectionViewUpdates: cv == %p; UICollectionViewData clearing caches for large update. Cache size c"
            "hanged from %lu to %lu. Update: %@",
            buf,
            0x2Au);

        }
      }
      -[_UICollectionViewDataAttributesMap invalidate](*(_QWORD *)(v1 + 176));
      std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::clear(v1 + 128);
      objc_msgSend(*(id *)(v1 + 32), "removeAllObjects");
      return objc_msgSend(*(id *)(v1 + 40), "removeAllObjects");
    }
  }
  return result;
}

- (id)_layoutAttributesForElementsInRectForMapping:(double)a3
{
  void *v9;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  if (a1)
  {
    v9 = a1;
    if (os_variant_has_internal_diagnostics())
    {
      if ((*((_BYTE *)v9 + 96) & 0x10) != 0)
      {
        __UIFaultDebugAssertLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "trying to load collection view layout data when layout is locked", buf, 2u);
        }

      }
    }
    else if ((*((_BYTE *)v9 + 96) & 0x10) != 0)
    {
      v12 = -[UICollectionViewData _layoutAttributesForElementsInRectForMapping:]::__s_category;
      if (!-[UICollectionViewData _layoutAttributesForElementsInRectForMapping:]::__s_category)
      {
        v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v12, (unint64_t *)&-[UICollectionViewData _layoutAttributesForElementsInRectForMapping:]::__s_category);
      }
      v13 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "trying to load collection view layout data when layout is locked", v14, 2u);
      }
    }
    objc_msgSend(*((id *)v9 + 2), "layoutAttributesForElementsInRect:", a2, a3, a4, a5);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)invalidateSupplementaryIndexPaths:(uint64_t)result
{
  uint64_t v2;
  id v4;
  void *v5;
  _QWORD v6[5];

  if (result)
  {
    v2 = result;
    if ((*(_BYTE *)(result + 96) & 0x10) == 0)
    {
      result = objc_msgSend(a2, "count");
      if (result)
      {
        if (!*(_QWORD *)(v2 + 48))
        {
          v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v5 = *(void **)(v2 + 48);
          *(_QWORD *)(v2 + 48) = v4;

        }
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __58__UICollectionViewData_invalidateSupplementaryIndexPaths___block_invoke;
        v6[3] = &unk_1E16BDDC0;
        v6[4] = v2;
        return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);
      }
    }
  }
  return result;
}

- (void)invalidateItemsAtIndexPaths:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  uint64_t v25;
  unsigned int *v26;
  void *v27;
  unsigned int *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a1 && (*(_BYTE *)(a1 + 96) & 0x10) == 0)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v3 = a2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v34;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v34 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v6);
          v37 = 0;
          v38 = 0;
          objc_msgSend(v7, "ui_getSectionIndex:itemIndex:", &v38, &v37);
          v8 = -[UICollectionViewData numberOfItemsBeforeSection:](a1, v38);
          v9 = v37 + v8;
          v10 = *(_QWORD *)(a1 + 168);
          if (v37 + v8 >= v10)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v32 = v7;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel_invalidateItemsAtIndexPaths_, a1, CFSTR("UICollectionViewData.mm"), 151, CFSTR("attempting to invalidate an item at an invalid indexPath: %@ globalIndex: %ld numItems: %ld"), v32, v9, v10);

          }
          if (dyld_program_sdk_at_least())
          {
            v12 = *(_QWORD *)(a1 + 24);
            if (v12)
            {
              -[_UIMutableFastIndexSet addIndex:](v12, v9, v11);
            }
            else
            {
              v26 = -[_UIFastIndexSet initWithIndex:]((unsigned int *)[_UIMutableFastIndexSet alloc], v9);
              v27 = *(void **)(a1 + 24);
              *(_QWORD *)(a1 + 24) = v26;

            }
            std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__erase_unique<long>((_QWORD *)(a1 + 128), v9);
          }
          else
          {
            -[UICollectionViewData _cachedLayoutAttributesForGlobalItemIndex:]((_QWORD *)a1, v9);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              objc_msgSend(v13, "frame");
              v19 = *(_QWORD **)(a1 + 176);
              if (v19)
              {
                v20 = v19[6];
                v21 = v19[7];
                v22 = v19[8];
                v23 = v19[9];
              }
              else
              {
                v21 = 0;
                v22 = 0;
                v23 = 0;
                v20 = 0;
              }
              if (CGRectIntersectsRect(*(CGRect *)&v15, *(CGRect *)&v20))
              {
                v25 = *(_QWORD *)(a1 + 24);
                if (v25)
                {
                  -[_UIMutableFastIndexSet addIndex:](v25, v9, v24);
                }
                else
                {
                  v28 = -[_UIFastIndexSet initWithIndex:]((unsigned int *)[_UIMutableFastIndexSet alloc], v9);
                  v29 = *(void **)(a1 + 24);
                  *(_QWORD *)(a1 + 24) = v28;

                }
              }
              std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__erase_unique<long>((_QWORD *)(a1 + 128), v9);
            }

          }
          ++v6;
        }
        while (v4 != v6);
        v31 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        v4 = v31;
      }
      while (v31);
    }

  }
}

- (uint64_t)invalidateDecorationIndexPaths:(uint64_t)result
{
  uint64_t v2;
  id v4;
  void *v5;
  _QWORD v6[5];

  if (result)
  {
    v2 = result;
    if ((*(_BYTE *)(result + 96) & 0x10) == 0)
    {
      result = objc_msgSend(a2, "count");
      if (result)
      {
        if (!*(_QWORD *)(v2 + 56))
        {
          v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v5 = *(void **)(v2 + 56);
          *(_QWORD *)(v2 + 56) = v4;

        }
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __55__UICollectionViewData_invalidateDecorationIndexPaths___block_invoke;
        v6[3] = &unk_1E16BDDC0;
        v6[4] = v2;
        return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);
      }
    }
  }
  return result;
}

void __55__UICollectionViewData_invalidateDecorationIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
  {
    objc_msgSend(v6, "addObjectsFromArray:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v7, a2);

  }
}

void __58__UICollectionViewData_invalidateSupplementaryIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
  {
    objc_msgSend(v6, "addObjectsFromArray:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v7, a2);

  }
}

void __50__UICollectionViewData_validateSupplementaryViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "removeObjectForKey:", v11, (_QWORD)v13);
        v12 = -[UICollectionViewData layoutAttributesForSupplementaryElementOfKind:atIndexPath:](*(_QWORD *)(a1 + 32), a2, v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)validateSupplementaryViews
{
  void *v2;
  id v3;
  _QWORD v4[5];

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 96) & 0x10) == 0)
    {
      v3 = *(id *)(a1 + 48);
      v2 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __50__UICollectionViewData_validateSupplementaryViews__block_invoke;
      v4[3] = &unk_1E16BDDE8;
      v4[4] = a1;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

    }
  }
}

- (void)validateItems
{
  id v2;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  NSObject *log;
  void (*v10[5])(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1 && (*(_BYTE *)(a1 + 96) & 0x10) == 0)
  {
    v2 = *(id *)(a1 + 24);
    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    if ((*(_BYTE *)(a1 + 96) & 8) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
          *(_DWORD *)buf = 138412546;
          v12 = WeakRetained;
          v13 = 2112;
          v14 = v2;
          _os_log_fault_impl(&dword_185066000, log, OS_LOG_TYPE_FAULT, "UICollectionView internal error: layoutIsPrepared flag was unexpectedly reset after validating layout. Re-preparing layout before validating individually invalidated items. Collection view: %@; invalidated indexes: %@",
            buf,
            0x16u);

        }
      }
      else
      {
        v4 = -[UICollectionViewData validateItems]::__s_category;
        if (!-[UICollectionViewData validateItems]::__s_category)
        {
          v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v4, (unint64_t *)&-[UICollectionViewData validateItems]::__s_category);
        }
        v5 = *(NSObject **)(v4 + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v6 = v5;
          v7 = objc_loadWeakRetained((id *)(a1 + 8));
          *(_DWORD *)buf = 138412546;
          v12 = v7;
          v13 = 2112;
          v14 = v2;
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "UICollectionView internal error: layoutIsPrepared flag was unexpectedly reset after validating layout. Re-preparing layout before validating individually invalidated items. Collection view: %@; invalidated indexes: %@",
            buf,
            0x16u);

        }
      }
      -[UICollectionViewData _prepareToLoadData](a1);
    }
    v10[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v10[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
    v10[2] = (void (*)(_QWORD, _QWORD, _QWORD))__37__UICollectionViewData_validateItems__block_invoke;
    v10[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16B2AC8;
    v10[4] = (void (*)(_QWORD, _QWORD, _QWORD))a1;
    -[_UIFastIndexSet enumerateIndexesUsingBlock:]((uint64_t)v2, v10);

  }
}

void __37__UICollectionViewData_validateItems__block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  -[UICollectionViewData _cachedLayoutAttributesForGlobalItemIndex:](*(_QWORD **)(a1 + 32), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UICollectionViewData indexPathForItemAtGlobalIndex:](*(_BYTE **)(a1 + 32), a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "layoutAttributesForItemAtIndexPath:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewData _setLayoutAttributes:atGlobalItemIndex:](*(_QWORD *)(a1 + 32), v5, a2);

  }
}

- (void)validateDecorationViews
{
  void *v2;
  id v3;
  _QWORD v4[5];

  if (a1)
  {
    if ((*(_BYTE *)(a1 + 96) & 0x10) == 0)
    {
      v3 = *(id *)(a1 + 56);
      v2 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __47__UICollectionViewData_validateDecorationViews__block_invoke;
      v4[3] = &unk_1E16BDDE8;
      v4[4] = a1;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

    }
  }
}

void __47__UICollectionViewData_validateDecorationViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "removeObjectForKey:", v11, (_QWORD)v13);
        v12 = -[UICollectionViewData layoutAttributesForDecorationViewOfKind:atIndexPath:](*(_QWORD *)(a1 + 32), a2, v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (BOOL)dataSourceMatchesCurrentCounts
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  if (!a1)
    return 0;
  v2 = 0;
  if ((*(_BYTE *)(a1 + 96) & 2) != 0)
  {
    v4 = *(_QWORD *)(a1 + 104);
    v3 = *(_QWORD *)(a1 + 112);
    if (v3 != v4 && *(_QWORD *)(a1 + 168) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "_dataSourceProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7
        && ((v8 = objc_loadWeakRetained((id *)(a1 + 8)),
             !objc_msgSend(v8, "_dataSourceImplementsNumberOfSections"))
          ? (v11 = 1)
          : (v9 = objc_loadWeakRetained((id *)(a1 + 8)),
             v10 = objc_msgSend(v7, "numberOfSectionsInCollectionView:", v9),
             v9,
             v11 = v10 & ~(v10 >> 63)),
            v12 = v3 - v4,
            v8,
            v11 == v12 >> 3))
      {
        if (v12 < 1)
        {
          v2 = 1;
        }
        else
        {
          v13 = 0;
          if (v12 >> 3 <= 1)
            v14 = 1;
          else
            v14 = v12 >> 3;
          v15 = v14 - 1;
          do
          {
            v16 = objc_loadWeakRetained((id *)(a1 + 8));
            v17 = objc_msgSend(v7, "collectionView:numberOfItemsInSection:", v16, v13);

            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * v13);
            v2 = v17 == v18;
          }
          while (v17 == v18 && v15 != v13++);
        }
      }
      else
      {
        v2 = 0;
      }

    }
  }
  return v2;
}

- (id)dataSourceCountsDescription
{
  if (a1)
  {
    -[UICollectionViewData descriptionIncludingPointer:]((uint64_t)a1, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)descriptionIncludingPointer:(uint64_t)a1
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;

  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0CB37A0];
    if (a2)
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ - %p:"), v5, a1);
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = *(uint64_t **)(a1 + 104);
    v9 = *(uint64_t **)(a1 + 112);
    if (v8 != v9)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = *v8;
        if (v10)
          objc_msgSend(v7, "appendString:", CFSTR(","));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("(%@:%@)"), v13, v14);

        v11 += v12;
        ++v8;
        --v10;
      }
      while (v8 != v9);
    }
    if (a2)
      v15 = CFSTR(">");
    else
      v15 = CFSTR("]");
    objc_msgSend(v7, "appendString:", v15);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (double)rectForItemAtIndexPath:(uint64_t)a1
{
  void *v2;
  double v3;
  double v4;

  if (!a1)
    return 0.0;
  -[UICollectionViewData layoutAttributesForItemAtIndexPath:](a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;

  return v4;
}

- (uint64_t)_shouldUseReorderingLayoutAttributesForItemAtIndexPath:(uint64_t)a1
{
  id WeakRetained;
  uint64_t v4;

  if (!a1 || (*(_BYTE *)(a1 + 96) & 0x10) != 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v4 = objc_msgSend(WeakRetained, "_isReorderingItemAtIndexPath:includingDragAndDrop:", a2, 0);

  return v4;
}

- (id)_layoutAttributesForElementsInRect:(int)a3 cellsOnly:(int)a4 validateIfNeeded:(double)a5 includeIndelibleElements:(double)a6
{
  double height;
  double v12;
  double y;
  double x;
  id v16;
  id v17;
  double Width;
  CGFloat v19;
  char isKindOfClass;
  int8x16_t *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void (*v28)(uint64_t);
  void *v29;
  void (*v30)(uint64_t);
  void (*v31)(uint64_t);
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  id WeakRetained;
  int v43;
  uint64_t v44;
  void *v45;
  id v46;
  _QWORD v48[7];
  char v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  void (*v56)(uint64_t);
  double v57;
  double v58;
  double v59;
  double v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  double v67;
  double v68;
  double v69;
  double v70;
  char v71;
  void (*v72)(_QWORD, _QWORD, _QWORD);
  uint64_t v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  char *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  char v84;
  _BYTE v85[128];
  uint64_t v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v86 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    height = a8;
    v12 = a7;
    y = a6;
    x = a5;
    if (UIRectIsDiscrete(a5, a6, a7, a8))
    {
      if (objc_msgSend(*(id *)(a1 + 16), "_hasOrthogonalScrollingSections"))
      {
        objc_msgSend(*(id *)(a1 + 16), "_extendedAttributesQueryIncludingOrthogonalScrollingRegions:", x, y, v12, height);
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (_UICollectionViewShouldEnlargeLayoutAttributesQueryForEstimatedSizes()
          && objc_msgSend(*(id *)(a1 + 16), "_estimatesSizes"))
        {
          v87.origin.x = x;
          v87.origin.y = y;
          v87.size.width = v12;
          v87.size.height = height;
          Width = CGRectGetWidth(v87);
          v88.origin.x = x;
          v88.origin.y = y;
          v88.size.width = v12;
          v88.size.height = height;
          v19 = CGRectGetHeight(v88) * -0.1;
          v89.origin.x = x;
          v89.origin.y = y;
          v89.size.width = v12;
          v89.size.height = height;
          v90 = CGRectInset(v89, Width * -0.1, v19);
          x = v90.origin.x;
          y = v90.origin.y;
          v12 = v90.size.width;
          height = v90.size.height;
        }
        if (a3)
          -[UICollectionViewData validateLayoutInRect:](a1, x, y, v12, height);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        -[UICollectionViewData _prepareToLoadData](a1);
        v92.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
        v92.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
        v92.size.width = *(CGFloat *)(a1 + 80);
        v92.size.height = *(CGFloat *)(a1 + 88);
        v91.origin.x = x;
        v91.origin.y = y;
        v91.size.width = v12;
        v91.size.height = height;
        if (CGRectContainsRect(v91, v92))
          +[_UIFastIndexSet indexSetWithIndexesInRange:]((uint64_t)_UIFastIndexSet, 0, *(_QWORD *)(a1 + 168));
        else
          -[_UICollectionViewDataAttributesMap indexesOfItemsInRect:](*(_QWORD **)(a1 + 176), x, y, v12, height);
        v21 = (int8x16_t *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_UIFastIndexSet count](v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = isKindOfClass & 1;
        v24 = *(_QWORD *)(a1 + 168);
        v25 = MEMORY[0x1E0C809B0];
        v72 = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
        v73 = 3221225472;
        v74 = (uint64_t)__93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke;
        v75 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E16BDE38;
        v78 = v24;
        v79 = sel__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded_;
        v76 = (void (*)(uint64_t))a1;
        v80 = x;
        v81 = y;
        v82 = v12;
        v83 = height;
        v84 = isKindOfClass & 1;
        v16 = v22;
        v77 = v16;
        -[_UIFastIndexSet enumerateIndexesUsingBlock:]((uint64_t)v21, &v72);
        if (a2)
        {
          v26 = v16;
        }
        else
        {
          v27 = *(void **)(a1 + 32);
          v62 = v25;
          v63 = 3221225472;
          v64 = (uint64_t)__93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_2;
          v65 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E16BDE88;
          v67 = x;
          v68 = y;
          v69 = v12;
          v70 = height;
          v71 = isKindOfClass & 1;
          v28 = (void (*)(uint64_t))v16;
          v66 = v28;
          objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", &v62);
          v29 = *(void **)(a1 + 40);
          v55[0] = v25;
          v55[1] = 3221225472;
          v55[2] = __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_4;
          v55[3] = &unk_1E16BDE88;
          v57 = x;
          v58 = y;
          v59 = v12;
          v60 = height;
          v61 = v23;
          v30 = v28;
          v56 = v30;
          objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v55);
          if ((dyld_program_sdk_at_least() & 1) == 0)
            objc_msgSend(v30, "sortUsingComparator:", &__block_literal_global_112);
          v31 = v30;

        }
      }
      if (!objc_msgSend(v16, "count"))
      {
        v17 = v16;
LABEL_49:

        return v17;
      }
      v72 = 0;
      v73 = (uint64_t)&v72;
      v74 = 0x3032000000;
      v75 = __Block_byref_object_copy__41;
      v76 = __Block_byref_object_dispose__41;
      v77 = 0;
      if (a4)
      {
        objc_msgSend(*(id *)(a1 + 16), "_layoutAttributesForIndelibleElements");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32 && objc_msgSend(v32, "count"))
        {
          if (!*(_QWORD *)(v73 + 40))
          {
            v34 = objc_msgSend(v16, "mutableCopy");
            v35 = *(void **)(v73 + 40);
            *(_QWORD *)(v73 + 40) = v34;

            v36 = *(id *)(v73 + 40);
            v16 = v36;
          }
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v37 = v33;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v85, 16);
          if (v38)
          {
            v39 = *(_QWORD *)v52;
            do
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v52 != v39)
                  objc_enumerationMutation(v37);
                v41 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
                if ((objc_msgSend(*(id *)(v73 + 40), "containsObject:", v41) & 1) == 0)
                  objc_msgSend(*(id *)(v73 + 40), "addObject:", v41);
              }
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v51, v85, 16);
            }
            while (v38);
          }

        }
      }
      if ((*(_BYTE *)(a1 + 96) & 0x10) != 0)
      {
        v43 = 0;
        if ((a2 & 1) != 0)
          goto LABEL_43;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        v43 = objc_msgSend(WeakRetained, "_isReordering");

        if ((a2 & 1) != 0)
          goto LABEL_43;
      }
      if (!v43)
      {
LABEL_48:
        v17 = v16;
        _Block_object_dispose(&v72, 8);

        goto LABEL_49;
      }
LABEL_43:
      if (!*(_QWORD *)(v73 + 40))
      {
        v44 = objc_msgSend(v16, "mutableCopy");
        v45 = *(void **)(v73 + 40);
        *(_QWORD *)(v73 + 40) = v44;

        v46 = *(id *)(v73 + 40);
        v16 = v46;
      }
      v62 = 0;
      v63 = (uint64_t)&v62;
      v64 = 0x3032000000;
      v65 = __Block_byref_object_copy__41;
      v66 = __Block_byref_object_dispose__41;
      v67 = 0.0;
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __111__UICollectionViewData__layoutAttributesForElementsInRect_cellsOnly_validateIfNeeded_includeIndelibleElements___block_invoke;
      v48[3] = &unk_1E16BDE10;
      v49 = v43;
      v48[4] = a1;
      v48[5] = &v72;
      v50 = a2;
      v48[6] = &v62;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v48);
      if (*(_QWORD *)(v63 + 40))
        objc_msgSend(*(id *)(v73 + 40), "removeObjectsAtIndexes:");
      _Block_object_dispose(&v62, 8);

      goto LABEL_48;
    }
  }
  v17 = 0;
  return v17;
}

void __111__UICollectionViewData__layoutAttributesForElementsInRect_cellsOnly_validateIfNeeded_includeIndelibleElements___block_invoke(uint64_t a1, _WORD *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (a2 && (a2[144] & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(a2, "indexPath");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (-[UICollectionViewData _shouldUseReorderingLayoutAttributesForItemAtIndexPath:](*(_QWORD *)(a1 + 32), (uint64_t)v13))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 16);
        WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
        objc_msgSend(WeakRetained, "_reorderingTargetPosition");
        objc_msgSend(v7, "_layoutAttributesForReorderedItemAtIndexPath:withTargetPosition:", v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "replaceObjectAtIndex:withObject:", a3, v9);

      }
    }
  }
  else if (*(_BYTE *)(a1 + 57))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "addIndex:", a3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a3);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }
}

void __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke(uint64_t a1, unint64_t a2)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  id v13;
  CGRect v14;
  CGRect v15;

  if (*(_QWORD *)(a1 + 48) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("UICollectionViewData.mm"), 876, CFSTR("attempting to access layout attributes at invalid index %ld numItems: %ld"), a2, *(_QWORD *)(a1 + 48));

  }
  -[UICollectionViewData _cachedLayoutAttributesForGlobalItemIndex:](*(_QWORD **)(a1 + 32), a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v4 = *(double *)(a1 + 64);
    v5 = *(double *)(a1 + 72);
    v6 = *(double *)(a1 + 80);
    v7 = *(double *)(a1 + 88);
    objc_msgSend(v12, "frame");
    v15.origin.x = v8;
    v15.origin.y = v9;
    v15.size.width = v10;
    v15.size.height = v11;
    v14.origin.x = v4;
    v14.origin.y = v5;
    v14.size.width = v6;
    v14.size.height = v7;
    if (CGRectIntersectsRect(v14, v15) || *(_BYTE *)(a1 + 96))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  }

}

void __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;
  __int128 v6;
  __int128 v7;
  char v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_3;
  v4[3] = &unk_1E16BDE60;
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_BYTE *)(a1 + 72);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

uint64_t __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t result;
  CGRect v14;
  CGRect v15;

  v5 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  v7 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  objc_msgSend(a3, "frame");
  v15.origin.x = v9;
  v15.origin.y = v10;
  v15.size.width = v11;
  v15.size.height = v12;
  v14.origin.x = v5;
  v14.origin.y = v6;
  v14.size.width = v7;
  v14.size.height = v8;
  result = CGRectIntersectsRect(v14, v15);
  if ((result & 1) != 0 || *(_BYTE *)(a1 + 72))
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a3);
  return result;
}

void __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;
  __int128 v6;
  __int128 v7;
  char v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_5;
  v4[3] = &unk_1E16BDE60;
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_BYTE *)(a1 + 72);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

uint64_t __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  uint64_t result;
  CGRect v14;
  CGRect v15;

  v5 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  v7 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  objc_msgSend(a3, "frame");
  v15.origin.x = v9;
  v15.origin.y = v10;
  v15.size.width = v11;
  v15.size.height = v12;
  v14.origin.x = v5;
  v14.origin.y = v6;
  v14.size.width = v7;
  v14.size.height = v8;
  result = CGRectIntersectsRect(v14, v15);
  if ((result & 1) != 0 || *(_BYTE *)(a1 + 72))
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a3);
  return result;
}

uint64_t __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = objc_msgSend(a2, "zIndex");
  v6 = objc_msgSend(a3, "zIndex");
  if (v5 < v6)
    return -1;
  if (v6 < v5)
    return 1;
  objc_msgSend(a2, "indexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "compare:", v9);

  return v7;
}

- (id)knownDecorationElementKinds
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (CGRect)_TEST_validLayoutRect
{
  _UICollectionViewDataAttributesMap *attributesMap;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  attributesMap = self->_attributesMap;
  if (attributesMap)
  {
    x = attributesMap->_validLayoutRect.origin.x;
    y = attributesMap->_validLayoutRect.origin.y;
    width = attributesMap->_validLayoutRect.size.width;
    height = attributesMap->_validLayoutRect.size.height;
  }
  else
  {
    y = 0.0;
    width = 0.0;
    height = 0.0;
    x = 0.0;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)collectionView
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
  return WeakRetained;
}

@end
