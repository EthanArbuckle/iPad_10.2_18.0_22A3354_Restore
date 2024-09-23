@implementation _UITraitTokenSet

- (void)enumerateAllTraitTokenValues:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateAllTraitTokenValues_, a1, CFSTR("_UITraitTokenSet_NonARC.mm"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));
    _UITraitTokenSetEnumerate((uint64_t *)(a1 + 16), a2);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (self && _UITraitTokenSetCount((uint64_t)&self->_storage))
    return objc_msgSend(-[_UITraitTokenSet allTraitTokens]((uint64_t)self), "countByEnumeratingWithState:objects:count:", a3, a4, a5);
  else
    return 0;
}

- (void)allTraitTokens
{
  uint64_t *v2;
  int8x16_t *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void (*v6[5])(_QWORD, _QWORD, _QWORD);

  v2 = (uint64_t *)(a1 + 16);
  v3 = _UITraitTokenSetCount(a1 + 16);
  if (!v3)
    return (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C9AA60];
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 8);
  if (!v4)
  {
    v4 = (void (*)(_QWORD, _QWORD, _QWORD))objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    v6[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v6[1] = (void (*)(_QWORD, _QWORD, _QWORD))3221225472;
    v6[2] = (void (*)(_QWORD, _QWORD, _QWORD))__34___UITraitTokenSet_allTraitTokens__block_invoke;
    v6[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E16CC810;
    v6[4] = v4;
    _UITraitTokenSetEnumerate(v2, v6);
    *(_QWORD *)(a1 + 8) = v4;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return _UITraitTokenSetIsEqualToSet((uint64_t)&self->_storage, (uint64_t)a3 + 16);
  }
  return 0;
}

+ (uint64_t)emptySet
{
  objc_opt_self();
  if (_MergedGlobals_1259 != -1)
    dispatch_once(&_MergedGlobals_1259, &__block_literal_global_563);
  return qword_1ECD81BD8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UITraitTokenSet *v4;
  __int128 v5;

  v4 = objc_alloc_init(_UITraitTokenSet);
  if (v4)
  {
    v4->_cachedArrayRepresentation = self->_cachedArrayRepresentation;
    v4->_storage.set = (_UIMutableFastIndexSet *)-[_UIMutableFastIndexSet mutableCopy](self->_storage.set, "mutableCopy");
    v5 = *(_OWORD *)&self->_storage.bitSet._chunks[2];
    *(_OWORD *)v4->_storage.bitSet._chunks = *(_OWORD *)self->_storage.bitSet._chunks;
    *(_OWORD *)&v4->_storage.bitSet._chunks[2] = v5;
  }
  return v4;
}

- (void)addTraitTokenValue:(__n128)a3
{
  void *v5;

  if (a1)
  {
    if (qword_1ECD81BD8 == a1)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_addTraitTokenValue_, a1, CFSTR("_UITraitTokenSet_NonARC.mm"), 210, CFSTR("Cannot mutate immutable empty set"));
    _UITraitTokenSetInsert((uint64_t *)(a1 + 16), a2, a3);
    v5 = *(void **)(a1 + 8);
    if (v5)
    {

      *(_QWORD *)(a1 + 8) = 0;
    }
  }
}

- (id)setByAddingTraitToken:(id)result
{
  void *v3;
  unint64_t v4;
  __n128 v5;

  if (result)
  {
    v3 = (void *)objc_msgSend(result, "copy");
    if (v3)
    {
      v4 = _UIGetTraitTokenValue(a2);
      -[_UITraitTokenSet addTraitTokenValue:]((uint64_t)v3, v4, v5);
    }
    return v3;
  }
  return result;
}

- (void)dealloc
{
  NSArray *cachedArrayRepresentation;
  _UIMutableFastIndexSet *set;
  objc_super v5;

  cachedArrayRepresentation = self->_cachedArrayRepresentation;
  if (cachedArrayRepresentation)

  set = self->_storage.set;
  if (set)

  v5.receiver = self;
  v5.super_class = (Class)_UITraitTokenSet;
  -[_UITraitTokenSet dealloc](&v5, sel_dealloc);
}

- (void)removeTraitTokenValue:(int8x16_t)a3
{
  void *v5;

  if (a1)
  {
    if (qword_1ECD81BD8 == a1)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_removeTraitTokenValue_, a1, CFSTR("_UITraitTokenSet_NonARC.mm"), 219, CFSTR("Cannot mutate immutable empty set"));
    _UITraitTokenSetRemove((uint16x8_t **)(a1 + 16), a2, a3);
    v5 = *(void **)(a1 + 8);
    if (v5)
    {

      *(_QWORD *)(a1 + 8) = 0;
    }
  }
}

- (unint64_t)hash
{
  return _UITraitTokenSetHash((uint64_t)&self->_storage);
}

- (id)setByRemovingTraitToken:(id)result
{
  void *v3;
  unint64_t v4;
  int8x16_t v5;

  if (result)
  {
    v3 = (void *)objc_msgSend(result, "copy");
    if (v3)
    {
      v4 = _UIGetTraitTokenValue(a2);
      -[_UITraitTokenSet removeTraitTokenValue:]((uint64_t)v3, v4, v5);
    }
    return v3;
  }
  return result;
}

- (uint64_t)initWithNSSetRepresentation:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __n128 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = objc_msgSend(a1, "init");
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(a2);
          v8 = _UIGetTraitTokenValue(*(const __CFNumber **)(*((_QWORD *)&v11 + 1) + 8 * v7));
          -[_UITraitTokenSet addTraitTokenValue:](v3, v8, v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }
  }
  return v3;
}

- (uint64_t)NSSetRepresentation
{
  if (result)
    return objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[_UITraitTokenSet allTraitTokens](result));
  return result;
}

@end
