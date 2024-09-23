@implementation PPU16CountedSet

- (PPU16CountedSet)init
{
  return -[PPU16CountedSet initWithCapacity:](self, "initWithCapacity:", 0);
}

- (PPU16CountedSet)initWithCapacity:(unint64_t)a3
{
  PPU16CountedSet *v4;
  PPU16CountedSet *v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  int v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PPU16CountedSet;
  v4 = -[PPU16CountedSet init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)v4->_vectorInlineStorage.__lx = 0;
    *(_QWORD *)&v4->_vectorInlineStorage.__lx[8] = 0;
    *(_QWORD *)&v4->_vectorInlineStorage.__lx[16] = 0;
    v4->_vectorStorage = &v4->_vectorInlineStorage;
    if (a3)
    {
      if (a3 >= 0x80)
        v6 = 128;
      else
        v6 = a3;
      v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v6);
      v10 = *(char **)v5->_vectorInlineStorage.__lx;
      v9 = *(char **)&v5->_vectorInlineStorage.__lx[8];
      v11 = v7;
      if (v9 != v10)
      {
        do
        {
          v12 = *((_DWORD *)v9 - 1);
          v9 -= 4;
          *((_DWORD *)v11 - 1) = v12;
          v11 -= 4;
        }
        while (v9 != v10);
        v9 = *(char **)v5->_vectorInlineStorage.__lx;
      }
      *(_QWORD *)v5->_vectorInlineStorage.__lx = v11;
      *(_QWORD *)&v5->_vectorInlineStorage.__lx[8] = v7;
      *(_QWORD *)&v5->_vectorInlineStorage.__lx[16] = &v7[4 * v8];
      if (v9)
        operator delete(v9);
    }
  }
  return v5;
}

- (void)dealloc
{
  void **vectorStorage;
  void *v4;
  objc_super v5;

  vectorStorage = (void **)self->_vectorStorage;
  if (vectorStorage)
  {
    v4 = *vectorStorage;
    if (*vectorStorage)
    {
      vectorStorage[1] = v4;
      operator delete(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)PPU16CountedSet;
  -[PPU16CountedSet dealloc](&v5, sel_dealloc);
}

- (void)addValue:(unsigned __int16)a3
{
  uint64_t v3;
  unsigned __int16 **vectorStorage;
  char *v6;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  int v9;
  __int16 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *dictStorage;
  unint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  unsigned __int16 *v28;
  int v29;
  id v30;
  id v31;

  v3 = a3;
  vectorStorage = (unsigned __int16 **)self->_vectorStorage;
  if (vectorStorage)
  {
    v6 = (char *)*vectorStorage;
    v7 = vectorStorage[1];
    v8 = *vectorStorage;
    if (*vectorStorage != v7)
    {
      while (*v8 != a3)
      {
        v8 += 2;
        if (v8 == v7)
          goto LABEL_14;
      }
    }
    if (v8 == v7)
    {
LABEL_14:
      v15 = (char *)v7 - v6;
      if ((unint64_t)((char *)v7 - v6) < 0x1FD)
      {
        v17 = (unint64_t)vectorStorage[2];
        if ((unint64_t)v7 >= v17)
        {
          v19 = v15 >> 2;
          v20 = v17 - (_QWORD)v6;
          if (v20 >> 1 <= (unint64_t)((v15 >> 2) + 1))
            v21 = v19 + 1;
          else
            v21 = v20 >> 1;
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
            v22 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v22 = v21;
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v22);
          v24 = &v23[4 * v19];
          v26 = &v23[4 * v25];
          *(_WORD *)v24 = v3;
          *((_WORD *)v24 + 1) = 1;
          v18 = (unsigned __int16 *)(v24 + 4);
          v28 = *vectorStorage;
          v27 = (char *)vectorStorage[1];
          if (v27 != (char *)*vectorStorage)
          {
            do
            {
              v29 = *((_DWORD *)v27 - 1);
              v27 -= 4;
              *((_DWORD *)v24 - 1) = v29;
              v24 -= 4;
            }
            while (v27 != (char *)v28);
            v27 = (char *)*vectorStorage;
          }
          *vectorStorage = (unsigned __int16 *)v24;
          vectorStorage[1] = v18;
          vectorStorage[2] = (unsigned __int16 *)v26;
          if (v27)
            operator delete(v27);
        }
        else
        {
          *v7 = a3;
          v7[1] = 1;
          v18 = v7 + 2;
        }
        vectorStorage[1] = v18;
      }
      else
      {
        -[PPU16CountedSet _convertToDictionaryRepresentation]((uint64_t)self);
        dictStorage = self->_dictStorage;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](dictStorage, "setObject:forKeyedSubscript:", &unk_1E7E59120);

      }
    }
    else
    {
      v9 = v8[1];
      if (v9 == 0xFFFF)
        v10 = -1;
      else
        v10 = v9 + 1;
      v8[1] = v10;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_dictStorage, "objectForKeyedSubscript:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (objc_msgSend(v12, "unsignedIntValue") <= 0xFFFE)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "unsignedIntValue") + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictStorage, "setObject:forKeyedSubscript:", v14, v30);

      }
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictStorage, "setObject:forKeyedSubscript:", &unk_1E7E59120, v30);
    }

    objc_autoreleasePoolPop(v11);
  }
}

- (unsigned)countForValue:(unsigned __int16)a3
{
  uint64_t v3;
  unsigned __int16 **vectorStorage;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  unsigned __int16 v7;
  void *v9;
  NSMutableDictionary *dictStorage;
  void *v11;
  void *v12;

  v3 = a3;
  vectorStorage = (unsigned __int16 **)self->_vectorStorage;
  if (vectorStorage)
  {
    v5 = *vectorStorage;
    v6 = vectorStorage[1];
    if (v5 != v6)
    {
      while (*v5 != a3)
      {
        v5 += 2;
        if (v5 == v6)
          return 0;
      }
    }
    if (v5 == v6)
      return 0;
    else
      return v5[1];
  }
  else
  {
    v9 = (void *)MEMORY[0x1C3BD6630]();
    dictStorage = self->_dictStorage;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](dictStorage, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v7 = objc_msgSend(v12, "unsignedIntValue");
    else
      v7 = 0;

    objc_autoreleasePoolPop(v9);
  }
  return v7;
}

- (unint64_t)uniqueValueCount
{
  _QWORD *vectorStorage;

  vectorStorage = self->_vectorStorage;
  if (vectorStorage)
    return (uint64_t)(vectorStorage[1] - *vectorStorage) >> 2;
  else
    return -[NSMutableDictionary count](self->_dictStorage, "count");
}

- (id)dictionary
{
  NSMutableDictionary *dictStorage;

  dictStorage = self->_dictStorage;
  if (!dictStorage)
  {
    -[PPU16CountedSet _convertToDictionaryRepresentation]((uint64_t)self);
    dictStorage = self->_dictStorage;
  }
  return dictStorage;
}

- (void)enumerateValuesAndCountsUsingBlock:(id)a3
{
  id v5;
  id v6;
  unsigned __int16 **vectorStorage;
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  void *v10;
  int v11;
  id v12;
  NSMutableDictionary *dictStorage;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v15 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPCompactCountedSets.mm"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    v5 = 0;
  }
  if (self->_vectorStorage)
  {
    v6 = v5;
    vectorStorage = (unsigned __int16 **)self->_vectorStorage;
    v8 = *vectorStorage;
    v9 = vectorStorage[1];
    while (v8 != v9)
    {
      v10 = (void *)MEMORY[0x1C3BD6630]();
      LOBYTE(v16[0]) = 0;
      (*((void (**)(id, _QWORD, _QWORD, _QWORD *))v6 + 2))(v6, *v8, v8[1], v16);
      v11 = LOBYTE(v16[0]);
      objc_autoreleasePoolPop(v10);
      if (v11)
        break;
      v8 += 2;
    }
  }
  else
  {
    v12 = v5;
    dictStorage = self->_dictStorage;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__PPU16CountedSet__dictEnumerateValuesAndCountsUsingBlock___block_invoke;
    v16[3] = &unk_1E7E158A0;
    v6 = v12;
    v17 = v6;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dictStorage, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
}

- (BOOL)isEqual:(id)a3
{
  PPU16CountedSet *v4;
  PPU16CountedSet *v5;
  PPU16CountedSet *v6;
  BOOL v7;
  id *v8;
  id *v9;

  v4 = (PPU16CountedSet *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      v8 = (id *)-[PPU16CountedSet copy](self, "copy");
      v9 = (id *)-[PPU16CountedSet copy](v6, "copy");
      -[PPU16CountedSet _convertToDictionaryRepresentation]((uint64_t)v8);
      -[PPU16CountedSet _convertToDictionaryRepresentation]((uint64_t)v9);
      if ((objc_msgSend(v8[2], "isEqualToDictionary:", v9[2]) & 1) != 0)
      {
        v7 = 1;
      }
      else if (objc_msgSend(v8[2], "count"))
      {
        v7 = 0;
      }
      else
      {
        v7 = objc_msgSend(v9[2], "count") == 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  int **vectorStorage;
  int *v7;
  int *v8;
  int v9;
  void **v10;
  unint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  char *v20;
  char *v21;
  int v22;
  uint64_t v23;
  void *v24;

  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    vectorStorage = (int **)self->_vectorStorage;
    v7 = *vectorStorage;
    v8 = vectorStorage[1];
    if (*vectorStorage != v8)
    {
      do
      {
        v9 = *v7;
        v10 = (void **)v5[1];
        v12 = v10[1];
        v11 = (unint64_t)v10[2];
        if ((unint64_t)v12 >= v11)
        {
          v14 = ((char *)v12 - (_BYTE *)*v10) >> 2;
          if ((unint64_t)(v14 + 1) >> 62)
            std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
          v15 = v11 - (_QWORD)*v10;
          v16 = v15 >> 1;
          if (v15 >> 1 <= (unint64_t)(v14 + 1))
            v16 = v14 + 1;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
            v17 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v17 = v16;
          if (v17)
            v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v17);
          else
            v18 = 0;
          v19 = (_DWORD *)(v17 + 4 * v14);
          *v19 = v9;
          v13 = v19 + 1;
          v21 = (char *)*v10;
          v20 = (char *)v10[1];
          if (v20 != *v10)
          {
            do
            {
              v22 = *((_DWORD *)v20 - 1);
              v20 -= 4;
              *--v19 = v22;
            }
            while (v20 != v21);
            v20 = (char *)*v10;
          }
          *v10 = v19;
          v10[1] = v13;
          v10[2] = (void *)(v17 + 4 * v18);
          if (v20)
            operator delete(v20);
        }
        else
        {
          *v12 = v9;
          v13 = v12 + 1;
        }
        v10[1] = v13;
        ++v7;
      }
      while (v7 != v8);
    }
    v23 = -[NSMutableDictionary copyWithZone:](self->_dictStorage, "copyWithZone:", a3);
    v24 = (void *)v5[2];
    v5[2] = v23;

  }
  return v5;
}

- (id)description
{
  void *v3;
  unsigned __int16 **vectorStorage;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  char v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  unsigned __int16 v14;
  void *v15;
  unsigned __int16 v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("["));
  vectorStorage = (unsigned __int16 **)self->_vectorStorage;
  if (vectorStorage)
  {
    v5 = *vectorStorage;
    v6 = vectorStorage[1];
    if (*vectorStorage != v6)
    {
      v7 = 1;
      do
      {
        if ((v7 & 1) == 0)
          objc_msgSend(v3, "appendString:", CFSTR(", "));
        objc_msgSend(v3, "appendFormat:", CFSTR("%u [%u]"), *v5, v5[1]);
        v7 = 0;
        v5 += 2;
      }
      while (v5 != v6);
    }
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_dictStorage;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v20;
      v11 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((v11 & 1) == 0)
            objc_msgSend(v3, "appendString:", CFSTR(", "));
          v14 = objc_msgSend(v13, "intValue");
          -[NSMutableDictionary objectForKeyedSubscript:](self->_dictStorage, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "intValue");
          objc_msgSend(v3, "appendFormat:", CFSTR("%u [%u]"), v14, v16, (_QWORD)v19);

          v11 = 0;
        }
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v11 = 0;
      }
      while (v9);
    }

  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictStorage, 0);
}

- (void)_convertToDictionaryRepresentation
{
  uint64_t v2;
  void *v3;
  unsigned __int16 **v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 8) || *(_QWORD *)(a1 + 16))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__convertToDictionaryRepresentation, a1, CFSTR("PPCompactCountedSets.mm"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_vectorStorage && !_dictStorage"));

    }
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", (uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8) - **(_QWORD **)(a1 + 8)) >> 1);
    v3 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v2;

    v4 = *(unsigned __int16 ***)(a1 + 8);
    v5 = *v4;
    v6 = v4[1];
    if (*v4 != v6)
    {
      do
      {
        v7 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5[1]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 16);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

        objc_autoreleasePoolPop(v7);
        v5 += 2;
      }
      while (v5 != v6);
      v4 = *(unsigned __int16 ***)(a1 + 8);
      v5 = *v4;
    }
    if (v5)
    {
      v4[1] = v5;
      operator delete(v5);
    }
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void __59__PPU16CountedSet__dictEnumerateValuesAndCountsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1C3BD6630]();
  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (unsigned __int16)objc_msgSend(v9, "unsignedIntValue"), (unsigned __int16)objc_msgSend(v7, "unsignedIntValue"), a4);
  objc_autoreleasePoolPop(v8);

}

@end
