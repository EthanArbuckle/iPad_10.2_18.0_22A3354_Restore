uint64_t static Metadata.Kind.tuple.getter()
{
  return 769;
}

unint64_t FieldDescriptor.subscript.getter(unint64_t result, uint64_t a2)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(a2 + 12) > result)
  {
    return a2 + 12 * result + 16;
  }
  __break(1u);
  return result;
}

void one-time initialization function for typeCache()
{
  unint64_t v0;
  uint64_t v1;

  v0 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<[TypeCache.Key : Metadata?], os_unfair_lock_s>);
  v1 = swift_allocObject();
  *(_DWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 16) = v0;
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [TypeCache.Key : Metadata?]);
  Dictionary.reserveCapacity(_:)(25);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  typeCache = v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249535764]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  Swift::UInt8 *v20;
  Swift::UInt8 v21;
  uint64_t v22;
  int v23;
  Swift::UInt v24;
  Swift::UInt8 *v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  int64_t v36;
  _QWORD *v37;
  uint64_t v38;
  __int128 v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<TypeCache.Key, Metadata?>);
  result = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v8 = 0;
    v37 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v14 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v15 = v14 | (v8 << 6);
      }
      else
      {
        v16 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
          return result;
        }
        result = (uint64_t)v37;
        if (v16 >= v36)
          goto LABEL_50;
        v17 = v37[v16];
        ++v8;
        if (!v17)
        {
          v8 = v16 + 1;
          if (v16 + 1 >= v36)
            goto LABEL_50;
          v17 = v37[v8];
          if (!v17)
          {
            v18 = v16 + 2;
            if (v18 >= v36)
            {
LABEL_50:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_57;
              }
              v34 = 1 << *(_BYTE *)(v5 + 32);
              if (v34 >= 64)
                bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v37 = -1 << v34;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v17 = v37[v18];
            if (!v17)
            {
              while (1)
              {
                v8 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_59;
                if (v8 >= v36)
                  goto LABEL_50;
                v17 = v37[v8];
                ++v18;
                if (v17)
                  goto LABEL_21;
              }
            }
            v8 = v18;
          }
        }
LABEL_21:
        v11 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v8 << 6);
      }
      v39 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + 16 * v15);
      v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v15);
      Hasher.init(_seed:)();
      v20 = (Swift::UInt8 *)v39;
      v21 = *(_BYTE *)v39;
      if (!*(_BYTE *)v39)
      {
        Hasher._combine(_:)(0);
        goto LABEL_41;
      }
      v38 = v19;
      v22 = v5;
      v23 = 0;
      do
      {
        v25 = v20 + 1;
        if (v21 > 0x70u)
        {
          if (v21 == 120)
            v26 = 1;
          else
            v26 = v23;
          if (v21 == 113)
            v23 = 1;
          else
            v23 = v26;
        }
        else
        {
          if (v21 == 1)
          {
            v24 = (Swift::UInt)&v25[*(int *)(v20 + 1)];
LABEL_25:
            Hasher._combine(_:)(v24);
            v25 = v20 + 5;
            goto LABEL_26;
          }
          if (v21 == 2)
          {
            v24 = *(_QWORD *)&v25[*(int *)(v20 + 1)];
            goto LABEL_25;
          }
        }
        Hasher._combine(_:)(v21);
LABEL_26:
        v21 = *v25;
        v20 = v25;
      }
      while (*v25);
      Hasher._combine(_:)(0);
      v5 = v22;
      v19 = v38;
      if ((v23 & 1) != 0)
        Hasher._combine(_:)(*((Swift::UInt *)&v39 + 1));
LABEL_41:
      result = Hasher._finalize()();
      v27 = -1 << *(_BYTE *)(v7 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v12 + 8 * (v28 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v12 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_58;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v12 + 8 * v29);
        }
        while (v33 == -1);
        v13 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_OWORD *)(*(_QWORD *)(v7 + 48) + 16 * v13) = v39;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v13) = v19;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_57:
  *v3 = v7;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  Swift::UInt v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ProtocolDescriptor, [Any.Type]>);
  result = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v32 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v31 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v31)
          goto LABEL_33;
        v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v31)
            goto LABEL_33;
          v21 = v32[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v32 = -1 << v30;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v31)
                  goto LABEL_33;
                v21 = v32[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = 8 * v19;
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v27);
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v27);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v28);
      result = Hasher._finalize()();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 8 * v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v17) = v28;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v17) = v29;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t TypeMetadata._resolve(_:)(Swift::UInt8 *a1, unsigned __int8 *a2)
{
  uint64_t *v4;
  os_unfair_lock_s *v5;
  uint64_t v7;

  if (one-time initialization token for typeCache != -1)
    swift_once();
  v4 = (uint64_t *)(typeCache + 16);
  v5 = (os_unfair_lock_s *)(typeCache + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(typeCache + 24));
  closure #1 in TypeCache.getOrInsert(_:from:)(v4, a1, a2, a1, (uint64_t *)a2, &v7);
  os_unfair_lock_unlock(v5);
  return v7;
}

{
  uint64_t *v4;
  os_unfair_lock_s *v5;
  uint64_t v7;

  if (one-time initialization token for typeCache != -1)
    swift_once();
  v4 = (uint64_t *)(typeCache + 16);
  v5 = (os_unfair_lock_s *)(typeCache + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(typeCache + 24));
  closure #1 in TypeCache.getOrInsert(_:from:)(v4, a1, a2, a1, (uint64_t *)a2, &v7);
  os_unfair_lock_unlock(v5);
  return v7;
}

unint64_t closure #1 in TypeCache.getOrInsert(_:from:)@<X0>(uint64_t *a1@<X0>, Swift::UInt8 *a2@<X1>, unsigned __int8 *a3@<X2>, _BYTE *a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;

  v12 = *a1;
  if (*(_QWORD *)(*a1 + 16) && (result = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3), (v14 & 1) != 0))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * result);
  }
  else
  {
    v16 = getSymbolicMangledNameLength(_:)(a4);
    v17 = TypeMetadata.descriptor.getter(a5);
    v18 = TypeMetadata.genericArguments.getter(a5);
    v15 = MEMORY[0x249535758](a4, v16, v17, v18);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = *a1;
    *a1 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v15, a2, a3, isUniquelyReferenced_nonNull_native);
    *a1 = v20;
    result = swift_bridgeObjectRelease();
  }
  *a6 = v15;
  return result;
}

uint64_t TypeMetadata.descriptor.getter(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  uint64_t result;

  v2 = *a1;
  if ((unint64_t)*a1 <= 0x7FF)
  {
    if ((unint64_t)(v2 - 513) < 2)
    {
      swift_getKeyPath();
      v3 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      v5 = v4;
      swift_release();
      if ((v5 & 1) == 0)
        return *(uint64_t *)((char *)a1 + v3);
      __break(1u);
    }
    if (v2 != 512)
      goto LABEL_8;
    swift_getKeyPath();
    v3 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    v7 = v6;
    swift_release();
    if ((v7 & 1) != 0)
    {
      __break(1u);
      goto LABEL_8;
    }
    return *(uint64_t *)((char *)a1 + v3);
  }
LABEL_8:
  swift_getKeyPath();
  v3 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v9 = v8;
  result = swift_release();
  if ((v9 & 1) == 0)
    return *(uint64_t *)((char *)a1 + v3);
  __break(1u);
  return result;
}

_QWORD *TypeMetadata.genericArguments.getter(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  if ((unint64_t)(*a1 - 512) >= 3)
  {
    swift_getKeyPath();
    v3 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_release();
    v2 = ClassDescriptor.genericArgumentOffset.getter(*(_DWORD **)((char *)a1 + v3));
  }
  else
  {
    v2 = 2;
  }
  return &a1[v2];
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, Swift::UInt8 *a2, unsigned __int8 *a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  Swift::UInt8 **v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)specialized _NativeDictionary.copy()();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v18[7] + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (Swift::UInt8 **)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return result;
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(result, a4 & 1);
  result = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt8 *a1, unsigned __int8 *a2)
{
  Swift::Int v4;
  _BYTE v6[72];

  Hasher.init(_seed:)();
  TypeCache.Key.hash(into:)((uint64_t)v6, a1, (Swift::UInt)a2);
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

void TypeCache.Key.hash(into:)(uint64_t a1, Swift::UInt8 *a2, Swift::UInt a3)
{
  Swift::UInt8 v3;
  Swift::UInt8 *v5;
  int v6;
  Swift::UInt v7;
  Swift::UInt8 *v8;
  int v9;

  v3 = *a2;
  if (!*a2)
  {
    Hasher._combine(_:)(0);
    return;
  }
  v5 = a2;
  v6 = 0;
  do
  {
    v8 = v5 + 1;
    if (v3 > 0x70u)
    {
      if (v3 == 120)
        v9 = 1;
      else
        v9 = v6;
      if (v3 == 113)
        v6 = 1;
      else
        v6 = v9;
    }
    else
    {
      if (v3 == 1)
      {
        v7 = (Swift::UInt)&v8[*(int *)(v5 + 1)];
LABEL_4:
        Hasher._combine(_:)(v7);
        v8 = v5 + 5;
        goto LABEL_5;
      }
      if (v3 == 2)
      {
        v7 = *(_QWORD *)&v8[*(int *)(v5 + 1)];
        goto LABEL_4;
      }
    }
    Hasher._combine(_:)(v3);
LABEL_5:
    v3 = *v8;
    v5 = v8;
  }
  while (*v8);
  Hasher._combine(_:)(0);
  if ((v6 & 1) != 0)
    Hasher._combine(_:)(a3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  unsigned __int8 **v8;
  _BYTE *v9;
  char v10;
  unsigned __int8 *v11;
  int v12;
  unsigned __int8 *v13;
  int *v14;
  int *v15;

  v5 = -1 << *(_BYTE *)(v3 + 32);
  result = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = ~v5;
LABEL_4:
    v8 = (unsigned __int8 **)(*(_QWORD *)(v3 + 48) + 16 * result);
    v9 = *v8;
    if (**v8 != *a1)
      goto LABEL_3;
    if (!*a1)
      return result;
    v10 = 0;
    v11 = v8[1];
    v12 = *a1;
    v13 = a1;
    while (1)
    {
      v14 = (int *)(v13 + 1);
      v15 = (int *)(v9 + 1);
      if (v12 > 112)
      {
        if (v12 == 120)
          v10 = 1;
        if (v12 == 113)
          v10 = 1;
      }
      else
      {
        if (v12 == 1)
        {
          if ((char *)v15 + *v15 != (char *)v14 + *v14)
            goto LABEL_3;
          goto LABEL_18;
        }
        if (v12 == 2)
        {
          if (*(_QWORD *)((char *)v15 + *v15) != *(_QWORD *)((char *)v14 + *v14))
            goto LABEL_3;
LABEL_18:
          v9 += 5;
          v13 += 5;
          goto LABEL_19;
        }
      }
      ++v13;
      ++v9;
LABEL_19:
      v12 = *v9;
      if (v12 != *v13)
        goto LABEL_3;
      if (!*v9)
      {
        if ((v10 & (v11 != a2)) == 0)
          return result;
LABEL_3:
        result = (result + 1) & v7;
        if (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) == 0)
          return result;
        goto LABEL_4;
      }
    }
  }
  return result;
}

uint64_t getSymbolicMangledNameLength(_:)(_BYTE *a1)
{
  int v1;
  _BYTE *v2;
  unsigned int v3;
  uint64_t v4;

  v1 = *a1;
  v2 = a1;
  if (*a1)
  {
    v2 = a1;
    do
    {
      v3 = v1 - 24;
      if ((v1 - 32) < 0xFFFFFFF8)
        v4 = 1;
      else
        v4 = 9;
      if (v3 >= 0xFFFFFFE9)
        v4 = 5;
      v2 += v4;
      v1 = *v2;
    }
    while (*v2);
  }
  return v2 - a1;
}

uint64_t MangledTypeReference.standardSubstitution.getter(unsigned __int8 *a1)
{
  int v1;
  uint64_t result;
  int v3;

  v1 = a1[1];
  if (!a1[1] || a1[2])
    return 0;
  v3 = *a1;
  if (v3 == 121)
  {
    if (v1 == 112)
      return MEMORY[0x24BEE4AD8] + 8;
    return 0;
  }
  if (v3 != 83)
    return 0;
  result = MEMORY[0x24BEE1328];
  switch(v1)
  {
    case 'J':
      result = MEMORY[0x24BEE0718];
      break;
    case 'O':
      result = MEMORY[0x24BEE0940];
      break;
    case 'S':
      result = MEMORY[0x24BEE0D00];
      break;
    case 'V':
      result = MEMORY[0x24BEE0F60];
      break;
    case 'W':
      result = MEMORY[0x24BEE0F88];
      break;
    case 'b':
      return result;
    case 'd':
      result = MEMORY[0x24BEE13C8];
      break;
    case 'f':
      result = MEMORY[0x24BEE14E8];
      break;
    case 'i':
      result = MEMORY[0x24BEE1768];
      break;
    case 's':
      result = MEMORY[0x24BEE1E08];
      break;
    case 'u':
      result = MEMORY[0x24BEE1E88];
      break;
    case 'v':
      result = MEMORY[0x24BEE1EF0];
      break;
    case 'w':
      result = MEMORY[0x24BEE1F38];
      break;
    default:
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeCache.Key()
{
  return &type metadata for TypeCache.Key;
}

ValueMetadata *type metadata accessor for Metadata()
{
  return &type metadata for Metadata;
}

uint64_t TypeDescriptor.genericSignature.getter(_DWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 11;
  if ((*a1 & 0x1Fu) - 17 < 2)
    v1 = 7;
  v2 = (uint64_t)&a1[v1 + 2];
  if ((*a1 & 0x80) != 0)
    return v2;
  else
    return 0;
}

unint64_t GenericSignature.packShapeHeader.getter(unsigned __int16 *a1)
{
  unsigned __int16 v1;
  uint64_t v2;

  v1 = a1[3];
  if ((v1 & 1) != 0)
    v2 = *(unsigned int *)((char *)&a1[6 * a1[1] + 4] + (-*a1 & 3) + *a1);
  else
    v2 = 0;
  return v2 | ((unint64_t)((v1 & 1) == 0) << 32);
}

ValueMetadata *type metadata accessor for GenericSignature.ParameterDescriptor()
{
  return &type metadata for GenericSignature.ParameterDescriptor;
}

unint64_t lazy protocol witness table accessor for type TypeCache.Key and conformance TypeCache.Key()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TypeCache.Key and conformance TypeCache.Key;
  if (!lazy protocol witness table cache variable for type TypeCache.Key and conformance TypeCache.Key)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for TypeCache.Key, &type metadata for TypeCache.Key);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TypeCache.Key and conformance TypeCache.Key);
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
  }
}

uint64_t initializeProtocolConformanceLookup()
{
  return objc_addLoadImageFunc2();
}

uint64_t `anonymous namespace'::addImageCallback<&`anonymous namespace'::TextSegment,&`anonymous namespace'::ProtocolConformancesSection,(_dyld_section_location_kind)1,&(addImageProtocolConformanceBlockCallbackUnsafe)>(_DWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  if (*a1 != -17958193)
  result = _dyld_lookup_section_info();
  if (result)
    return addImageProtocolConformanceBlockCallbackUnsafe((uint64_t)a1, result, v3);
  return result;
}

uint64_t ValueWitnessTable.discriminator.getter()
{
  return 11839;
}

uint64_t protocol witness for SignedLayout.discriminator.getter in conformance ValueWitnessTable()
{
  return 11839;
}

uint64_t protocol witness for SignedLayout.ptr.getter in conformance ValueWitnessTable()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t protocol witness for SignedLayout.init(_:) in conformance ValueWitnessTable@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3);
}

{
  uint64_t v6;
  uint64_t v7;

  swift_getKeyPath();
  v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v7 = *a3;
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(v7 + v6))(a1, a2, a3 + 1);
}

uint64_t ValueWitnessTable.destroy(_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v5 = *a2;
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t *))(v5 + v4))(a1, a2 + 1);
}

uint64_t ValueWitnessTable.initializeWithCopy(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3);
}

uint64_t ValueWitnessTable.assignWithCopy(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3);
}

uint64_t ValueWitnessTable.initializeWithTake(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3);
}

uint64_t ValueWitnessTable.assignWithTake(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3);
}

uint64_t ValueWitnessTable.getEnumTagSinglePayload(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;

  swift_getKeyPath();
  v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v7 = *a3;
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(v7 + v6))(a1, a2, a3 + 1);
}

uint64_t ValueWitnessTable.storeEnumTagSinglePayload(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;

  swift_getKeyPath();
  v8 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v9 = *a4;
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v9 + v8))(a1, a2, a3, a4 + 1);
}

uint64_t ValueWitnessTable.size.getter(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 64);
}

uint64_t ValueWitnessTable.stride.getter(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 72);
}

uint64_t ValueWitnessTable.flags.getter(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)a1 + 80);
}

uint64_t ValueWitnessTable.extraInhabitantCount.getter(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)a1 + 84);
}

BOOL static ValueWitnessTable.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ValueWitnessTable(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void ValueWitnessTable.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ValueWitnessTable.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ValueWitnessTable()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ValueWitnessTable()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ValueWitnessTable()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ValueWitnessTable and conformance ValueWitnessTable()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ValueWitnessTable and conformance ValueWitnessTable;
  if (!lazy protocol witness table cache variable for type ValueWitnessTable and conformance ValueWitnessTable)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ValueWitnessTable, &type metadata for ValueWitnessTable);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ValueWitnessTable and conformance ValueWitnessTable);
  }
  return result;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ValueWitnessTable(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ValueWitnessTable(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ValueWitnessTable()
{
  return &type metadata for ValueWitnessTable;
}

uint64_t BufferView.count.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t BufferView.endAddress.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 + *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64) * a2;
}

uint64_t BufferView.startIndex.getter()
{
  return 0;
}

uint64_t BufferView.endIndex.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

Swift::Int __swiftcall BufferView.index(after:)(Swift::Int after)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFADD__(after, 1);
  result = after + 1;
  if (v1)
    __break(1u);
  return result;
}

Swift::Int __swiftcall BufferView.index(before:)(Swift::Int before)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFSUB__(before, 1);
  result = before - 1;
  if (v1)
    __break(1u);
  return result;
}

uint64_t BufferView.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
  result = a1 * v5;
  if ((unsigned __int128)(a1 * (__int128)v5) >> 64 == result >> 63)
    return UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(result, a2, a3, a4);
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance BufferView<A>()
{
  return RandomAccessCollection<>.index(_:offsetBy:)();
}

uint64_t protocol witness for RandomAccessCollection.distance(from:to:) in conformance BufferView<A>()
{
  return RandomAccessCollection<>.distance(from:to:)();
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance BufferView<A>@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    *a2 = *result - 1;
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.formIndex(before:) in conformance BufferView<A>(_QWORD *result)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    --*result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for BufferView<A>, a3);
  return RandomAccessCollection<>.index(_:offsetBy:)();
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:limitedBy:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for BufferView<A>, a4);
  return RandomAccessCollection.index(_:offsetBy:limitedBy:)();
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for BufferView<A>, a3);
  return RandomAccessCollection<>.distance(from:to:)();
}

void protocol witness for Collection.startIndex.getter in conformance BufferView<A>(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void protocol witness for Collection.endIndex.getter in conformance BufferView<A>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
}

void (*protocol witness for Collection.subscript.read in conformance BufferView<A>(uint64_t **a1, uint64_t *a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t *v3;
  uint64_t *v7;

  v7 = (uint64_t *)malloc(0x28uLL);
  *a1 = v7;
  v7[4] = BufferView.subscript.read(v7, *a2, *v3, v3[1], *(_QWORD *)(a3 + 16));
  return protocol witness for Collection.subscript.read in conformance BufferView<A>;
}

void protocol witness for Collection.subscript.read in conformance BufferView<A>(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t BufferView.subscript.read(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t result;

  v9 = *(_QWORD *)(a5 - 8);
  *a1 = a5;
  a1[1] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v11 = malloc(v10);
  a1[2] = (uint64_t)v11;
  result = a2 * v10;
  if ((unsigned __int128)(a2 * (__int128)v10) >> 64 == (a2 * v10) >> 63)
  {
    UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(result, a3, a5, (uint64_t)v11);
    return (uint64_t)BufferView.subscript.read;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance BufferView<A>(uint64_t a1)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for BufferView<A>, a1);
  return RandomAccessCollection<>.indices.getter();
}

uint64_t protocol witness for Collection.count.getter in conformance BufferView<A>()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance BufferView<A>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BEE1B68], MEMORY[0x24BEE07E0]);
}

{
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(a1, a2, a3, a4, MEMORY[0x24BEE08B8], (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE07F0]);
}

_QWORD *protocol witness for Collection.index(after:) in conformance BufferView<A>@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *protocol witness for Collection.formIndex(after:) in conformance BufferView<A>(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance BufferView<A>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = 0;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance BufferView<A>(uint64_t a1)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for BufferView<A>, a1);
  return Collection.underestimatedCount.getter();
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance BufferView<A>()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance BufferView<A>(uint64_t a1, uint64_t a2)
{
  return protocol witness for Sequence._copyToContiguousArray() in conformance BufferView<A>(a1, a2, (uint64_t)&protocol conformance descriptor for BufferView<A>);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance BufferView<A>()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t IndirectBufferView.count.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t IndirectBufferView.startIndex.getter()
{
  return 0;
}

uint64_t IndirectBufferView.endIndex.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

Swift::Int __swiftcall IndirectBufferView.index(after:)(Swift::Int after)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFADD__(after, 1);
  result = after + 1;
  if (v1)
    __break(1u);
  return result;
}

Swift::Int __swiftcall IndirectBufferView.index(before:)(Swift::Int before)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFSUB__(before, 1);
  result = before - 1;
  if (v1)
    __break(1u);
  return result;
}

uint64_t IndirectBufferView.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a5 + 24))(a2 + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) * a1, a4, a5);
}

void base witness table accessor for BidirectionalCollection in BufferView<A>()
{
  JUMPOUT(0x24953577CLL);
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in BufferView<A>()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BD0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249535770](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x24953577C](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x24953577C](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in BufferView<A>(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x24953577C](&protocol conformance descriptor for BufferView<A>);
  return MEMORY[0x24953577C](MEMORY[0x24BEE4230], a1, &v3);
}

void base witness table accessor for Collection in BufferView<A>()
{
  JUMPOUT(0x24953577CLL);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in BufferView<A>()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BA8]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in BufferView<A>(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x24953577C](&protocol conformance descriptor for BufferView<A>);
  return MEMORY[0x24953577C](MEMORY[0x24BEE4218], a1, &v3);
}

void base witness table accessor for Sequence in BufferView<A>()
{
  JUMPOUT(0x24953577CLL);
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in BufferView<A>()
{
  return MEMORY[0x24BEE1780];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in BufferView<A>()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BD8]);
}

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    v6 = lazy protocol witness table accessor for type Int and conformance Int();
    v7[0] = MEMORY[0x24BEE17A8];
    v7[1] = v6;
    result = MEMORY[0x24953577C](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

void associated type witness table accessor for Collection.SubSequence : Collection in BufferView<A>()
{
  JUMPOUT(0x24953577CLL);
}

void associated type witness table accessor for Sequence.Iterator : IteratorProtocol in BufferView<A>()
{
  JUMPOUT(0x24953577CLL);
}

void base witness table accessor for BidirectionalCollection in IndirectBufferView<A>()
{
  JUMPOUT(0x24953577CLL);
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in IndirectBufferView<A>(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x24953577C](&protocol conformance descriptor for IndirectBufferView<A>);
  return MEMORY[0x24953577C](MEMORY[0x24BEE4230], a1, &v3);
}

void base witness table accessor for Collection in IndirectBufferView<A>()
{
  JUMPOUT(0x24953577CLL);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in IndirectBufferView<A>(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x24953577C](&protocol conformance descriptor for IndirectBufferView<A>);
  return MEMORY[0x24953577C](MEMORY[0x24BEE4218], a1, &v3);
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance IndirectBufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for IndirectBufferView<A>, a3);
  return RandomAccessCollection<>.index(_:offsetBy:)();
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:limitedBy:) in conformance IndirectBufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for IndirectBufferView<A>, a4);
  return RandomAccessCollection.index(_:offsetBy:limitedBy:)();
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance IndirectBufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for IndirectBufferView<A>, a3);
  return RandomAccessCollection<>.distance(from:to:)();
}

void base witness table accessor for Sequence in IndirectBufferView<A>()
{
  JUMPOUT(0x24953577CLL);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance IndirectBufferView<A>(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  *a1 = v6;
  a1[1] = v7;
  a1[2] = malloc(*(_QWORD *)(v7 + 64));
  v8 = *a2;
  v9 = *v3;
  v10 = *(_QWORD *)(a3 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v9 + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) * v8, v6, v10);
  return BufferView.subscript.read;
}

void BufferView.subscript.read(_QWORD *a1)
{
  void *v1;

  v1 = (void *)a1[2];
  (*(void (**)(void *, _QWORD))(a1[1] + 8))(v1, *a1);
  free(v1);
}

uint64_t protocol witness for Collection.indices.getter in conformance IndirectBufferView<A>(uint64_t a1)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for IndirectBufferView<A>, a1);
  return RandomAccessCollection<>.indices.getter();
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance IndirectBufferView<A>(uint64_t a1)
{
  MEMORY[0x24953577C](&protocol conformance descriptor for IndirectBufferView<A>, a1);
  return Collection.underestimatedCount.getter();
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance IndirectBufferView<A>(uint64_t a1, uint64_t a2)
{
  return protocol witness for Sequence._copyToContiguousArray() in conformance BufferView<A>(a1, a2, (uint64_t)&protocol conformance descriptor for IndirectBufferView<A>);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v5 = v3[1];
  v8[0] = *v3;
  v8[1] = v5;
  v6 = MEMORY[0x24953577C](a3, a1);
  return specialized Collection._copyToContiguousArray()(v8, a1, v6);
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance BufferView<A>(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x2495354E8](a1, a2);
}

uint64_t type metadata instantiation function for BufferView()
{
  return swift_allocateGenericValueMetadata();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t type metadata accessor for BufferView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BufferView);
}

uint64_t type metadata instantiation function for IndirectBufferView()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for BufferView(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for BufferView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

uint64_t type metadata accessor for IndirectBufferView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IndirectBufferView);
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char v13;
  void (*v14)(char *, uint64_t);
  uint64_t result;
  void (*v16)(char *, uint64_t);
  uint64_t v17;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v4 = type metadata accessor for Range();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  v11 = dispatch thunk of static Comparable.<= infix(_:_:)();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, a1, v4);
  v12(v8, a2, v4);
  if ((v11 & 1) == 0)
  {
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    result = ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
    goto LABEL_5;
  }
  v13 = dispatch thunk of static Comparable.<= infix(_:_:)();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  result = ((uint64_t (*)(char *, uint64_t))v14)(v10, v4);
  if ((v13 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  char v20;
  uint64_t result;
  uint64_t v22;
  uint64_t (*v23)(char *, char *, uint64_t, uint64_t);

  v23 = a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = (char *)&v22 - v14;
  v16 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v22 - v17;
  v19 = dispatch thunk of static Comparable.<= infix(_:_:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x249535740](a1, v6, a5);
}

uint64_t BoxPair.buffer.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t swift_projectBox(_:)()
{
  uint64_t result;

  result = swift_projectBox();
  if (!result)
    __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for BoxPair()
{
  return &type metadata for BoxPair;
}

BOOL ExistentialMetadata.isClassConstrained.getter(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) >= 0;
}

uint64_t ExistentialMetadata.superclass.getter(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 11) & 0x40) != 0)
    return *(_QWORD *)(a1 + 16);
  else
    return 0;
}

uint64_t ExistentialMetadata.protocols.getter(uint64_t a1)
{
  uint64_t v1;

  v1 = 24;
  if ((*(_BYTE *)(a1 + 11) & 0x40) == 0)
    v1 = 16;
  return a1 + v1;
}

BOOL static ExistentialMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ExistentialMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ExistentialMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ExistentialMetadata and conformance ExistentialMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExistentialMetadata and conformance ExistentialMetadata;
  if (!lazy protocol witness table cache variable for type ExistentialMetadata and conformance ExistentialMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ExistentialMetadata, &type metadata for ExistentialMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExistentialMetadata and conformance ExistentialMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExistentialMetadata()
{
  return &type metadata for ExistentialMetadata;
}

uint64_t ExtensionDescriptor.extendedContext.getter(uint64_t a1)
{
  uint64_t v2;
  int v4;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return a1 + v2 + v4;
}

_BYTE *ExtensionDescriptor.genericSignature.getter(char *a1)
{
  _BYTE *result;
  char v2;

  v2 = *a1;
  result = a1 + 12;
  if ((v2 & 0x80) == 0)
    return 0;
  return result;
}

BOOL static ExtensionDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ExtensionDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ExtensionDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ExtensionDescriptor and conformance ExtensionDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExtensionDescriptor and conformance ExtensionDescriptor;
  if (!lazy protocol witness table cache variable for type ExtensionDescriptor and conformance ExtensionDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ExtensionDescriptor, &type metadata for ExtensionDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtensionDescriptor and conformance ExtensionDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionDescriptor()
{
  return &type metadata for ExtensionDescriptor;
}

uint64_t MetatypeMetadata.instanceMetadata.getter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

BOOL static MetatypeMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void MetatypeMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int MetatypeMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type MetatypeMetadata and conformance MetatypeMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MetatypeMetadata and conformance MetatypeMetadata;
  if (!lazy protocol witness table cache variable for type MetatypeMetadata and conformance MetatypeMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for MetatypeMetadata, &type metadata for MetatypeMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MetatypeMetadata and conformance MetatypeMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for MetatypeMetadata()
{
  return &type metadata for MetatypeMetadata;
}

uint64_t ExtendedExistentialMetadata.shape.getter(uint64_t a1)
{
  uint64_t result;
  char v3;
  uint64_t v4;

  swift_getKeyPath();
  result = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result;
    swift_release();
    return *(_QWORD *)(a1 + v4);
  }
  return result;
}

BOOL static ExtendedExistentialMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ExtendedExistentialMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ExtendedExistentialMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ExtendedExistentialMetadata and conformance ExtendedExistentialMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExtendedExistentialMetadata and conformance ExtendedExistentialMetadata;
  if (!lazy protocol witness table cache variable for type ExtendedExistentialMetadata and conformance ExtendedExistentialMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ExtendedExistentialMetadata, &type metadata for ExtendedExistentialMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtendedExistentialMetadata and conformance ExtendedExistentialMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtendedExistentialMetadata()
{
  return &type metadata for ExtendedExistentialMetadata;
}

uint64_t FieldDescriptor.Element.flags.getter(unsigned int *a1)
{
  return *a1;
}

uint64_t FieldDescriptor.Element.typeRef.getter(uint64_t a1)
{
  uint64_t v2;
  int v4;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return a1 + v2 + v4;
}

uint64_t FieldDescriptor.Element.referenceOwnership.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v9;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  v3 = MangledTypeReference.length.getter((_BYTE *)(a1 + v2 + v9));
  if (v3 >= 3)
  {
    v4 = v3;
    swift_getKeyPath();
    v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    if (*(_BYTE *)(v4 + a1 + v5 + v9 - 2) == 88)
    {
      swift_getKeyPath();
      v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_getAtKeyPath();
      swift_release();
      v7 = *(unsigned __int8 *)(v4 + a1 + v6 + v9 - 1);
      switch(v7)
      {
        case 'o':
          return 2;
        case 'w':
          return 1;
        case 'u':
          return 4;
      }
    }
  }
  return 0;
}

uint64_t FieldDescriptor.Element.name.getter()
{
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return String.init(cString:)();
}

uint64_t FieldDescriptor.startIndex.getter()
{
  return 0;
}

uint64_t FieldDescriptor.endIndex.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

Swift::Int __swiftcall FieldDescriptor.index(after:)(Swift::Int after)
{
  return after + 1;
}

Swift::Int __swiftcall FieldDescriptor.index(before:)(Swift::Int before)
{
  return before - 1;
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance FieldDescriptor@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result - 1;
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.formIndex(before:) in conformance FieldDescriptor(_QWORD *result)
{
  --*result;
  return result;
}

void protocol witness for Collection.endIndex.getter in conformance FieldDescriptor(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(unsigned int *)(*(_QWORD *)v1 + 12);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance FieldDescriptor(uint64_t (*result)(), unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)v2 + 12))
  {
    *(_QWORD *)result = *(_QWORD *)v2 + 12 * v3 + 16;
    return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for Collection.subscript.getter in conformance FieldDescriptor@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v3 = result[1];
    v4 = *v2;
    if (v3 <= *(unsigned int *)(*v2 + 12))
    {
      *a2 = *result;
      a2[1] = v3;
      a2[2] = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance FieldDescriptor(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned int *)(*(_QWORD *)v1 + 12);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance FieldDescriptor()
{
  uint64_t v0;

  return *(_DWORD *)(*(_QWORD *)v0 + 12) == 0;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance FieldDescriptor@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(unsigned int *)(*(_QWORD *)v3 + 12))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance FieldDescriptor@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  unint64_t result;
  char v7;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance FieldDescriptor(unint64_t *result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = *(unsigned int *)(*(_QWORD *)v2 + 12);
  if (*result <= v4 && v3 <= v4)
    return (unint64_t *)(v3 - *result);
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance FieldDescriptor(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = a2[1];
  if (*result >= *a2)
  {
    v5 = __OFSUB__(v2, v3);
    v4 = v2 - v3 < 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 == v5)
    __break(1u);
  return result;
}

_QWORD *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance FieldDescriptor(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < *result)
    __break(1u);
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1])
    __break(1u);
  return result;
}

_QWORD *protocol witness for Collection.index(after:) in conformance FieldDescriptor@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result + 1;
  return result;
}

_QWORD *protocol witness for Collection.formIndex(after:) in conformance FieldDescriptor(_QWORD *result)
{
  ++*result;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance FieldDescriptor(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance FieldDescriptor()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)v0 + 12);
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance FieldDescriptor()
{
  uint64_t *v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance FieldDescriptor(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3);
}

BOOL static FieldDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void FieldDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int FieldDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type FieldDescriptor and conformance FieldDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for FieldDescriptor, &type metadata for FieldDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for FieldDescriptor, &type metadata for FieldDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for FieldDescriptor, &type metadata for FieldDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for FieldDescriptor, &type metadata for FieldDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for FieldDescriptor, &type metadata for FieldDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in FieldDescriptor()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<FieldDescriptor> and conformance <> Slice<A>, (uint64_t (*)(void))lazy protocol witness table accessor for type FieldDescriptor and conformance FieldDescriptor, MEMORY[0x24BEE4230]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in FieldDescriptor()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<FieldDescriptor> and conformance <> Slice<A>, (uint64_t (*)(void))lazy protocol witness table accessor for type FieldDescriptor and conformance FieldDescriptor, MEMORY[0x24BEE4218]);
}

uint64_t lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance <> Slice<A>(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<FieldDescriptor>);
    v8 = a2();
    result = MEMORY[0x24953577C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in FieldDescriptor()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<FieldDescriptor> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<FieldDescriptor>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in FieldDescriptor()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<FieldDescriptor> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<FieldDescriptor>, MEMORY[0x24BEE2C18]);
}

uint64_t lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24953577C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FieldDescriptor()
{
  return &type metadata for FieldDescriptor;
}

ValueMetadata *type metadata accessor for FieldDescriptor.Element()
{
  return &type metadata for FieldDescriptor.Element;
}

uint64_t RelativeDirectPointerIntPair.intMask.getter()
{
  return 3;
}

BOOL RelativeDirectPointerIntPair.BOOL.getter(char a1)
{
  return (a1 & 3) != 0;
}

uint64_t RelativeDirectPointerIntPair.int.getter()
{
  lazy protocol witness table accessor for type Int and conformance Int();
  return dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
}

uint64_t RelativeDirectPointerIntPair.address(from:)(uint64_t a1, int a2)
{
  return a1 + (int)(a2 & 0xFFFFFFFC);
}

uint64_t protocol witness for RelativePointer.offset.getter in conformance RelativeDirectPointerIntPair<A, B>()
{
  unsigned int *v0;

  return *v0;
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeDirectPointerIntPair<A, B>(uint64_t a1)
{
  int *v1;

  return RelativeDirectPointerIntPair.address(from:)(a1, *v1);
}

uint64_t type metadata instantiation function for RelativeDirectPointerIntPair()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for RelativeDirectPointerIntPair(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RelativeDirectPointerIntPair);
}

uint64_t TypeMetadata.resolve(_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t result;
  uint64_t *v5;
  os_unfair_lock_s *v6;
  uint64_t v7;

  result = MangledTypeReference.standardSubstitution.getter(a1);
  if (!result)
  {
    if (one-time initialization token for typeCache != -1)
      swift_once();
    v5 = (uint64_t *)(typeCache + 16);
    v6 = (os_unfair_lock_s *)(typeCache + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(typeCache + 24));
    closure #1 in TypeCache.getOrInsert(_:from:)(v5, a1, a2, a1, (uint64_t *)a2, &v7);
    os_unfair_lock_unlock(v6);
    return v7;
  }
  return result;
}

{
  uint64_t result;
  uint64_t *v5;
  os_unfair_lock_s *v6;
  uint64_t v7;

  result = MangledTypeReference.standardSubstitution.getter(a1);
  if (!result)
  {
    if (one-time initialization token for typeCache != -1)
      swift_once();
    v5 = (uint64_t *)(typeCache + 16);
    v6 = (os_unfair_lock_s *)(typeCache + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(typeCache + 24));
    closure #1 in TypeCache.getOrInsert(_:from:)(v5, a1, a2, a1, (uint64_t *)a2, &v7);
    os_unfair_lock_unlock(v6);
    return v7;
  }
  return result;
}

BOOL static TypeMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void TypeMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int TypeMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type TypeMetadata and conformance TypeMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TypeMetadata and conformance TypeMetadata;
  if (!lazy protocol witness table cache variable for type TypeMetadata and conformance TypeMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for TypeMetadata, &type metadata for TypeMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TypeMetadata and conformance TypeMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeMetadata()
{
  return &type metadata for TypeMetadata;
}

unint64_t ConformanceDescriptor.protocol.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  v3 = *(int *)(a1 + v2);
  result = a1 + v2 + (v3 & 0xFFFFFFFFFFFFFFFELL);
  if ((v3 & 1) != 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t ConformanceDescriptor.descriptor.getter(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  v3 = (*(unsigned __int8 *)(a1 + 12) >> 3) & 7;
  result = a1 + v2 + *(int *)(a1 + v2);
  if (v3 == 1)
    return *(_QWORD *)result;
  if (v3)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ConformanceDescriptor.flags.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

BOOL static ConformanceDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ConformanceDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ConformanceDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ConformanceDescriptor and conformance ConformanceDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ConformanceDescriptor and conformance ConformanceDescriptor;
  if (!lazy protocol witness table cache variable for type ConformanceDescriptor and conformance ConformanceDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ConformanceDescriptor, &type metadata for ConformanceDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConformanceDescriptor and conformance ConformanceDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConformanceDescriptor()
{
  return &type metadata for ConformanceDescriptor;
}

uint64_t Metadata.AccessFunction.callAsFunction(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  return a3(a1, a2 + 32);
}

{
  return a3(a1, a2 + 32);
}

ValueMetadata *type metadata accessor for Metadata.AccessFunction()
{
  return &type metadata for Metadata.AccessFunction;
}

uint64_t EnumMetadata.valueWitnessTable.getter(uint64_t a1)
{
  return a1 - 8;
}

uint64_t EnumMetadata.descriptor.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(_QWORD *)(a1 + v2);
}

BOOL static EnumMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void EnumMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int EnumMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type EnumMetadata and conformance EnumMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnumMetadata and conformance EnumMetadata;
  if (!lazy protocol witness table cache variable for type EnumMetadata and conformance EnumMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for EnumMetadata, &type metadata for EnumMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnumMetadata and conformance EnumMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnumMetadata()
{
  return &type metadata for EnumMetadata;
}

uint64_t EnumDescriptor.numberOfPayloadCases.getter(uint64_t a1)
{
  return *(_DWORD *)(a1 + 20) & 0xFFFFFFLL;
}

uint64_t EnumDescriptor.numberOfEmptyCases.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

unint64_t EnumDescriptor.numberOfCases.getter(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(a1 + 24);
}

_BYTE *EnumDescriptor.genericSignature.getter(char *a1)
{
  _BYTE *result;
  char v2;

  v2 = *a1;
  result = a1 + 36;
  if ((v2 & 0x80) == 0)
    return 0;
  return result;
}

BOOL static EnumDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void EnumDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int EnumDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type EnumDescriptor and conformance EnumDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnumDescriptor and conformance EnumDescriptor;
  if (!lazy protocol witness table cache variable for type EnumDescriptor and conformance EnumDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for EnumDescriptor, &type metadata for EnumDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnumDescriptor and conformance EnumDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnumDescriptor()
{
  return &type metadata for EnumDescriptor;
}

uint64_t FunctionMetadata.convention.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 10);
}

uint64_t FunctionMetadata.throws.getter(uint64_t a1)
{
  return *(_BYTE *)(a1 + 11) & 1;
}

uint64_t FunctionMetadata.hasParameterFlags.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 1) & 1;
}

uint64_t FunctionMetadata.isEscaping.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 2) & 1;
}

uint64_t FunctionMetadata.isDifferential.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 3) & 1;
}

uint64_t FunctionMetadata.hasGlobalActor.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 4) & 1;
}

uint64_t FunctionMetadata.isAsync.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 5) & 1;
}

uint64_t FunctionMetadata.isSendable.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 6) & 1;
}

uint64_t FunctionMetadata.differentiableKind.getter(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if ((v1 & 0x8000000) != 0)
    return *(_QWORD *)(a1
                     + 8 * (unsigned __int16)v1
                     + (((uint64_t)(*(_QWORD *)(a1 + 8) << 38) >> 63) & (4 * (unsigned __int16)*(_QWORD *)(a1 + 8)))
                     + 24);
  else
    return 0;
}

uint64_t FunctionMetadata.parameterMetadata.getter(uint64_t a1)
{
  return a1 + 24;
}

uint64_t FunctionMetadata.parameterFlags.getter(uint64_t a1)
{
  return a1 + 8 * *(unsigned __int16 *)(a1 + 8) + 24;
}

uint64_t FunctionMetadata.resultMetadata.getter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

BOOL static FunctionMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void FunctionMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int FunctionMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type FunctionMetadata and conformance FunctionMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FunctionMetadata and conformance FunctionMetadata;
  if (!lazy protocol witness table cache variable for type FunctionMetadata and conformance FunctionMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for FunctionMetadata, &type metadata for FunctionMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionMetadata and conformance FunctionMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for FunctionMetadata()
{
  return &type metadata for FunctionMetadata;
}

uint64_t ExtendedExistentialShape.flags.getter(unsigned int *a1)
{
  return *a1;
}

uint64_t ExtendedExistentialShape.requirementSignatureHeader.getter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

BOOL static ExtendedExistentialShape.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ExtendedExistentialShape.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ExtendedExistentialShape.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ExtendedExistentialShape and conformance ExtendedExistentialShape()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExtendedExistentialShape and conformance ExtendedExistentialShape;
  if (!lazy protocol witness table cache variable for type ExtendedExistentialShape and conformance ExtendedExistentialShape)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ExtendedExistentialShape, &type metadata for ExtendedExistentialShape);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtendedExistentialShape and conformance ExtendedExistentialShape);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtendedExistentialShape()
{
  return &type metadata for ExtendedExistentialShape;
}

uint64_t TypeReference.descriptor(_:)(char a1, int *a2)
{
  uint64_t result;

  result = (uint64_t)a2 + *a2;
  if (a1)
  {
    if (a1 == 1)
    {
      return *(_QWORD *)result;
    }
    else
    {
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeReference()
{
  return &type metadata for TypeReference;
}

uint64_t StructMetadata.valueWitnessTable.getter(uint64_t a1)
{
  return a1 - 8;
}

uint64_t StructMetadata.descriptor.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(_QWORD *)(a1 + v2);
}

uint64_t StructMetadata.fieldOffsets.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  v3 = a1 + 8 * *(unsigned int *)(*(_QWORD *)(a1 + v2) + 24);
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return v3;
}

BOOL static StructMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void StructMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int StructMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type StructMetadata and conformance StructMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type StructMetadata and conformance StructMetadata;
  if (!lazy protocol witness table cache variable for type StructMetadata and conformance StructMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for StructMetadata, &type metadata for StructMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StructMetadata and conformance StructMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for StructMetadata()
{
  return &type metadata for StructMetadata;
}

uint64_t ForeignClassMetadata.descriptor.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(_QWORD *)(a1 + v2);
}

uint64_t ForeignClassMetadata.superclass.getter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

BOOL static ForeignClassMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ForeignClassMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ForeignClassMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ForeignClassMetadata and conformance ForeignClassMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ForeignClassMetadata and conformance ForeignClassMetadata;
  if (!lazy protocol witness table cache variable for type ForeignClassMetadata and conformance ForeignClassMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ForeignClassMetadata, &type metadata for ForeignClassMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ForeignClassMetadata and conformance ForeignClassMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ForeignClassMetadata()
{
  return &type metadata for ForeignClassMetadata;
}

uint64_t WitnessTable.conformanceDescriptor.getter(uint64_t a1)
{
  return *(_QWORD *)a1;
}

BOOL static WitnessTable.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void WitnessTable.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int WitnessTable.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type WitnessTable and conformance WitnessTable()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type WitnessTable and conformance WitnessTable;
  if (!lazy protocol witness table cache variable for type WitnessTable and conformance WitnessTable)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for WitnessTable, &type metadata for WitnessTable);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WitnessTable and conformance WitnessTable);
  }
  return result;
}

ValueMetadata *type metadata accessor for WitnessTable()
{
  return &type metadata for WitnessTable;
}

uint64_t ModuleDescriptor.name.getter()
{
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return String.init(cString:)();
}

BOOL static ModuleDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ModuleDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ModuleDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ModuleDescriptor and conformance ModuleDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModuleDescriptor and conformance ModuleDescriptor;
  if (!lazy protocol witness table cache variable for type ModuleDescriptor and conformance ModuleDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ModuleDescriptor, &type metadata for ModuleDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModuleDescriptor and conformance ModuleDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for ModuleDescriptor()
{
  return &type metadata for ModuleDescriptor;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance TypeCache.Key(uint64_t a1, uint64_t a2)
{
  return specialized static TypeCache.Key.== infix(_:_:)(*(_BYTE **)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 **)a2, *(_QWORD *)(a2 + 8));
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TypeCache.Key()
{
  uint64_t v0;
  Swift::UInt8 *v1;
  Swift::UInt v2;
  _BYTE v4[72];

  v1 = *(Swift::UInt8 **)v0;
  v2 = *(_QWORD *)(v0 + 8);
  Hasher.init(_seed:)();
  TypeCache.Key.hash(into:)((uint64_t)v4, v1, v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance TypeCache.Key(uint64_t a1)
{
  uint64_t v1;

  TypeCache.Key.hash(into:)(a1, *(Swift::UInt8 **)v1, *(_QWORD *)(v1 + 8));
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TypeCache.Key()
{
  uint64_t v0;
  Swift::UInt8 *v1;
  Swift::UInt v2;
  _BYTE v4[72];

  v1 = *(Swift::UInt8 **)v0;
  v2 = *(_QWORD *)(v0 + 8);
  Hasher.init(_seed:)();
  TypeCache.Key.hash(into:)((uint64_t)v4, v1, v2);
  return Hasher._finalize()();
}

uint64_t specialized static TypeCache.Key.== infix(_:_:)(_BYTE *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  int v4;
  int v5;
  int *v6;
  int *v7;

  v4 = *a1;
  if (v4 != *a3)
    return 0;
  if (*a1)
  {
    v5 = 0;
    while (1)
    {
      v6 = (int *)(a3 + 1);
      v7 = (int *)(a1 + 1);
      if (v4 > 112)
      {
        if (v4 == 120)
          v5 = 1;
        if (v4 == 113)
          v5 = 1;
      }
      else
      {
        if (v4 == 1)
        {
          if ((char *)v7 + *v7 != (char *)v6 + *v6)
            return 0;
          goto LABEL_15;
        }
        if (v4 == 2)
        {
          if (*(_QWORD *)((char *)v7 + *v7) != *(_QWORD *)((char *)v6 + *v6))
            return 0;
LABEL_15:
          a1 += 5;
          a3 += 5;
          goto LABEL_16;
        }
      }
      ++a3;
      ++a1;
LABEL_16:
      v4 = *a1;
      if (v4 != *a3)
        return 0;
      if (!*a1)
        return (v5 ^ 1) & 1 | (a2 == a4);
    }
  }
  return 1;
}

ValueMetadata *type metadata accessor for TypeCache()
{
  return &type metadata for TypeCache;
}

uint64_t MangledTypeReference.length.getter(_BYTE *a1)
{
  int v1;
  _BYTE *v2;
  unsigned int v3;
  uint64_t v4;

  v1 = *a1;
  v2 = a1;
  if (*a1)
  {
    v2 = a1;
    do
    {
      v3 = v1 - 24;
      if ((v1 - 32) < 0xFFFFFFF8)
        v4 = 1;
      else
        v4 = 9;
      if (v3 >= 0xFFFFFFE9)
        v4 = 5;
      v2 += v4;
      v1 = *v2;
    }
    while (*v2);
  }
  return v2 - a1;
}

ValueMetadata *type metadata accessor for MangledTypeReference()
{
  return &type metadata for MangledTypeReference;
}

uint64_t Metadata.kind.getter(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t Metadata.valueWitnessTable.getter(uint64_t a1)
{
  return a1 - 8;
}

BOOL static Metadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void Metadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int Metadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

uint64_t Metadata.description.getter()
{
  return _typeName(_:qualified:)();
}

unint64_t lazy protocol witness table accessor for type Metadata and conformance Metadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Metadata and conformance Metadata;
  if (!lazy protocol witness table cache variable for type Metadata and conformance Metadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for Metadata, &type metadata for Metadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Metadata and conformance Metadata);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Metadata()
{
  return _typeName(_:qualified:)();
}

char *UnsafeRawPointer.relativeDirectAddress<A>(as:)(uint64_t a1, int *a2)
{
  return (char *)a2 + *a2;
}

uint64_t RelativeDirectPointer.address(from:)(uint64_t a1, int a2)
{
  return a1 + a2;
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeDirectPointer<A>(uint64_t a1)
{
  int *v1;

  return RelativeDirectPointer.address(from:)(a1, *v1);
}

uint64_t type metadata accessor for RelativeDirectPointer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RelativeDirectPointer);
}

uint64_t OpaqueDescriptor.numberOfUnderlyingTypes.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

BOOL static OpaqueDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void OpaqueDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int OpaqueDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type OpaqueDescriptor and conformance OpaqueDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type OpaqueDescriptor and conformance OpaqueDescriptor;
  if (!lazy protocol witness table cache variable for type OpaqueDescriptor and conformance OpaqueDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for OpaqueDescriptor, &type metadata for OpaqueDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OpaqueDescriptor and conformance OpaqueDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpaqueDescriptor()
{
  return &type metadata for OpaqueDescriptor;
}

uint64_t ClassMetadata.descriptor.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(_QWORD *)(a1 + v2);
}

uint64_t ClassMetadata.valueWitnessTable.getter(uint64_t a1)
{
  return a1 - 8;
}

uint64_t ClassMetadata.superclass.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(_QWORD *)(a1 + v2);
}

uint64_t ClassMetadata.isSwiftClass.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 32) >> 1) & 1;
}

uint64_t ClassMetadata.fieldOffsets.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  v3 = a1 + 8 * *(unsigned int *)(*(_QWORD *)(a1 + v2) + 40);
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return v3;
}

BOOL static ClassMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ClassMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ClassMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ClassMetadata and conformance ClassMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ClassMetadata and conformance ClassMetadata;
  if (!lazy protocol witness table cache variable for type ClassMetadata and conformance ClassMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ClassMetadata, &type metadata for ClassMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ClassMetadata and conformance ClassMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClassMetadata()
{
  return &type metadata for ClassMetadata;
}

uint64_t static PtrAuth.SpecialDiscriminator.valueWitnessTable.getter()
{
  return 11839;
}

uint64_t UnsafeRawPointer.signedVWTInitializeBufferWithCopyOfBuffer.getter(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t static PtrAuth.authDescriptor<A>(_:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD))(a3 + 24))(*a1);
}

uint64_t static PtrAuth.relativeContext<A>(_:)(int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v4 = (_QWORD *)((char *)a1 + (v3 & 0xFFFFFFFFFFFFFFFELL));
  if ((v3 & 1) != 0)
    v4 = (_QWORD *)*v4;
  return (*(uint64_t (**)(_QWORD *))(a3 + 24))(v4);
}

uint64_t static PtrAuth.Key.processIndependentCode.getter()
{
  return 0;
}

uint64_t static PtrAuth.Key.processDependentCode.getter()
{
  return 1;
}

uint64_t static PtrAuth.Key.processIndependentData.getter()
{
  return 2;
}

uint64_t static PtrAuth.Key.processDependentData.getter()
{
  return 3;
}

uint64_t static PtrAuth.SpecialDiscriminator.nonUniqueExtendedExistentialTypeShape.getter()
{
  return 59288;
}

uint64_t static PtrAuth.SpecialDiscriminator.objcIsa.getter()
{
  return 27361;
}

uint64_t static PtrAuth.SpecialDiscriminator.objcSuperclass.getter()
{
  return 46507;
}

uint64_t static PtrAuth.SpecialDiscriminator.typeDescriptor.getter()
{
  return 44678;
}

uint64_t static PtrAuth.SpecialDiscriminator.protocolConformanceDescriptor.getter()
{
  return 50923;
}

uint64_t static PtrAuth.SpecialDiscriminator.contextDescriptorAsArgument.getter()
{
  return 46563;
}

uint64_t static PtrAuth.SpecialDiscriminator.initializeBufferWithCopyOfBuffer.getter()
{
  return 55882;
}

uint64_t static PtrAuth.SpecialDiscriminator.destroy.getter()
{
  return 1272;
}

uint64_t static PtrAuth.SpecialDiscriminator.initializeWithCopy.getter()
{
  return 58298;
}

uint64_t static PtrAuth.SpecialDiscriminator.assignWithCopy.getter()
{
  return 34641;
}

uint64_t static PtrAuth.SpecialDiscriminator.initializeWithTake.getter()
{
  return 18648;
}

uint64_t static PtrAuth.SpecialDiscriminator.assignWithTake.getter()
{
  return 61402;
}

uint64_t static PtrAuth.SpecialDiscriminator.getEnumTagSinglePayload.getter()
{
  return 24816;
}

uint64_t static PtrAuth.SpecialDiscriminator.storeEnumTagSinglePayload.getter()
{
  return 41169;
}

uint64_t static PtrAuth.SpecialDiscriminator.getEnumTag.getter()
{
  return 41909;
}

uint64_t static PtrAuth.SpecialDiscriminator.destructiveProjectEnumData.getter()
{
  return 1053;
}

uint64_t static PtrAuth.SpecialDiscriminator.destructiveInjectEnumTag.getter()
{
  return 45796;
}

uint64_t static PtrAuth.auth(_:as:)(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t static PtrAuth.authObjcISA(_:)(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t static PtrAuth.relativeContextIntPair<A, B>(_:as:)(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v9;
  uint64_t v10;

  v9 = RelativeIndirectablePointerIntPair.init(offset:)(*a1, a3, a4, a6);
  v10 = RelativeIndirectablePointerIntPair.address(from:)((uint64_t)a1, v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a5 + 24))(v10, a3, a5);
}

char *static PtrAuth.relativeConformance(_:)(int *a1)
{
  uint64_t v1;
  char *result;

  v1 = *a1;
  result = (char *)a1 + (v1 & 0xFFFFFFFFFFFFFFFELL);
  if ((v1 & 1) != 0)
    return *(char **)result;
  return result;
}

ValueMetadata *type metadata accessor for PtrAuth()
{
  return &type metadata for PtrAuth;
}

ValueMetadata *type metadata accessor for PtrAuth.Key()
{
  return &type metadata for PtrAuth.Key;
}

ValueMetadata *type metadata accessor for PtrAuth.SpecialDiscriminator()
{
  return &type metadata for PtrAuth.SpecialDiscriminator;
}

uint64_t UnsafeRawPointer.relativeIndirectAddress<A>(as:)(uint64_t a1, int *a2)
{
  return *(_QWORD *)((char *)a2 + *a2);
}

uint64_t RelativeIndirectPointer.address(from:)(uint64_t a1, int a2)
{
  return *(_QWORD *)(a1 + a2);
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeIndirectPointer<A>(uint64_t a1)
{
  int *v1;

  return RelativeIndirectPointer.address(from:)(a1, *v1);
}

uint64_t type metadata accessor for RelativeIndirectPointer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RelativeIndirectPointer);
}

uint64_t RelativeIndirectablePointer.address(from:)(uint64_t a1, int a2)
{
  uint64_t result;

  result = a1 + (int)(a2 & 0xFFFFFFFE);
  if ((a2 & 1) != 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t RelativeIndirectablePointer.isIndirect.getter(char a1)
{
  return a1 & 1;
}

uint64_t RelativeIndirectablePointer.directAddress(from:)(uint64_t a1, int a2)
{
  return a1 + (int)(a2 & 0xFFFFFFFE);
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeIndirectablePointer<A>(uint64_t a1)
{
  int *v1;

  return RelativeIndirectablePointer.address(from:)(a1, *v1);
}

uint64_t type metadata accessor for RelativeIndirectablePointer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RelativeIndirectablePointer);
}

uint64_t EnumValueWitnessTable.discriminator.getter()
{
  return 11839;
}

uint64_t EnumValueWitnessTable.getEnumTag(_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v5 = *a2;
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t *))(v5 + v4))(a1, a2 + 1);
}

uint64_t EnumValueWitnessTable.destructiveProjectEnumData(_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v5 = *a2;
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t *))(v5 + v4))(a1, a2 + 1);
}

uint64_t EnumValueWitnessTable.destructiveInjectEnumTag(_:into:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;

  swift_getKeyPath();
  v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v7 = *a3;
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(v7 + v6))(a2, a1, a3 + 1);
}

BOOL static EnumValueWitnessTable.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void EnumValueWitnessTable.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int EnumValueWitnessTable.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type EnumValueWitnessTable and conformance EnumValueWitnessTable()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type EnumValueWitnessTable and conformance EnumValueWitnessTable;
  if (!lazy protocol witness table cache variable for type EnumValueWitnessTable and conformance EnumValueWitnessTable)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for EnumValueWitnessTable, &type metadata for EnumValueWitnessTable);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnumValueWitnessTable and conformance EnumValueWitnessTable);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnumValueWitnessTable()
{
  return &type metadata for EnumValueWitnessTable;
}

uint64_t RelativeIndirectablePointerIntPair.address(from:)(uint64_t a1, int a2)
{
  uint64_t result;

  result = a1 + (int)(a2 & 0xFFFFFFFC);
  if ((a2 & 1) != 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t RelativeIndirectablePointerIntPair.intMask.getter()
{
  return 2;
}

uint64_t RelativeIndirectablePointerIntPair.BOOL.getter(unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t RelativeIndirectablePointerIntPair.int.getter()
{
  lazy protocol witness table accessor for type Int and conformance Int();
  return dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
}

uint64_t RelativeIndirectablePointerIntPair.unresolved.getter(int a1)
{
  return (int)(a1 & 0xFFFFFFFD);
}

uint64_t RelativeIndirectablePointerIntPair.isIndirect.getter(char a1)
{
  return a1 & 1;
}

uint64_t RelativeIndirectablePointerIntPair.directAddress(from:)(uint64_t a1, int a2)
{
  return a1 + (int)(a2 & 0xFFFFFFFC);
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeIndirectablePointerIntPair<A, B>(uint64_t a1)
{
  int *v1;

  return RelativeIndirectablePointerIntPair.address(from:)(a1, *v1);
}

char *UnsafeRawPointer.relativeIndirectablePointerIntPairAddress<A, B>(as:and:)(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  char *result;

  v3 = *a3;
  result = (char *)a3 + (v3 & 0xFFFFFFFFFFFFFFFCLL);
  if ((v3 & 1) != 0)
    return *(char **)result;
  return result;
}

uint64_t type metadata accessor for RelativeIndirectablePointerIntPair(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RelativeIndirectablePointerIntPair);
}

uint64_t static ReferenceOwnership.strong.getter()
{
  return 0;
}

uint64_t static ReferenceOwnership.weak.getter()
{
  return 1;
}

uint64_t static ReferenceOwnership.unmanaged.getter()
{
  return 4;
}

uint64_t static ReferenceOwnership.unowned.getter()
{
  return 2;
}

uint64_t ConformanceDescriptor.Flags.typeReferenceKind.getter(unsigned int a1)
{
  return (a1 >> 3) & 7;
}

uint64_t static TypeReference.Kind.directDescriptor.getter()
{
  return 0;
}

uint64_t static TypeReference.Kind.indirectDescriptor.getter()
{
  return 1;
}

uint64_t ContextDescriptor.Flags.kindSpecificFlags.getter(unsigned int a1)
{
  return HIWORD(a1);
}

uint64_t static AnonymousDescriptor.Flags.hasMangledNameMask.getter()
{
  return 1;
}

uint64_t static ConformanceDescriptor.Flags.typeReferenceKindMask.getter()
{
  return 56;
}

uint64_t static ConformanceDescriptor.Flags.typeReferenceKindShift.getter()
{
  return 3;
}

uint64_t static ConformanceDescriptor.Flags.isRetroactiveMask.getter()
{
  return 64;
}

uint64_t static ConformanceDescriptor.Flags.isSynthesizedNonUniqueMask.getter()
{
  return 128;
}

uint64_t static ConformanceDescriptor.Flags.numberOfConditionalRequirementsMask.getter()
{
  return 65280;
}

uint64_t static ConformanceDescriptor.Flags.numberOfConditionalRequirementsShift.getter()
{
  return 8;
}

uint64_t static ConformanceDescriptor.Flags.hasResilientWitnessesMask.getter()
{
  return 0x10000;
}

uint64_t static ConformanceDescriptor.Flags.hasGenericWitnessTableMask.getter()
{
  return 0x20000;
}

uint64_t ConformanceDescriptor.Flags.numberOfConditionalRequirements.getter(__int16 a1)
{
  return HIBYTE(a1);
}

uint64_t ConformanceDescriptor.Flags.hasResilientWitnesses.getter(unsigned int a1)
{
  return HIWORD(a1) & 1;
}

uint64_t ConformanceDescriptor.Flags.hasGenericWitnessTable.getter(unsigned int a1)
{
  return (a1 >> 17) & 1;
}

uint64_t static ContextDescriptor.Kind.module.getter()
{
  return 0;
}

uint64_t static ContextDescriptor.Kind.extension.getter()
{
  return 1;
}

uint64_t static ContextDescriptor.Kind.anonymous.getter()
{
  return 2;
}

uint64_t static ContextDescriptor.Kind.protocol.getter()
{
  return 3;
}

uint64_t static ContextDescriptor.Kind.opaqueType.getter()
{
  return 4;
}

uint64_t static ContextDescriptor.Kind.class.getter()
{
  return 16;
}

uint64_t static ContextDescriptor.Kind.struct.getter()
{
  return 17;
}

uint64_t static ContextDescriptor.Kind.enum.getter()
{
  return 18;
}

uint64_t ContextDescriptor.Kind.description.getter(unsigned __int8 a1)
{
  int v1;
  uint64_t result;

  v1 = a1;
  result = 0x656C75646F6DLL;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x6F69736E65747865;
      break;
    case 2:
      result = 0x756F6D796E6F6E61;
      break;
    case 3:
      result = 0x6C6F636F746F7270;
      break;
    case 4:
      result = 0x795465757161706FLL;
      break;
    case 16:
      result = 0x7373616C63;
      break;
    case 17:
      result = 0x746375727473;
      break;
    case 18:
      result = 1836412517;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContextDescriptor.Kind()
{
  unsigned __int8 *v0;

  return ContextDescriptor.Kind.description.getter(*v0);
}

uint64_t static ContextDescriptor.Flags.kindMask.getter()
{
  return 31;
}

uint64_t static ContextDescriptor.Flags.isUniqueMask.getter()
{
  return 64;
}

uint64_t static ContextDescriptor.Flags.isGenericMask.getter()
{
  return 128;
}

uint64_t static ContextDescriptor.Flags.versionMask.getter()
{
  return 65280;
}

uint64_t static ContextDescriptor.Flags.versionShift.getter()
{
  return 8;
}

uint64_t static ContextDescriptor.Flags.kindSpecificFlagsMask.getter()
{
  return 4294901760;
}

uint64_t static ContextDescriptor.Flags.kindSpecificFlagsShift.getter()
{
  return 16;
}

uint64_t ContextDescriptor.Flags.isUnique.getter(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t ContextDescriptor.Flags.version.getter(unsigned int a1)
{
  return a1 >> 8;
}

uint64_t static ExtendedExistentialShape.SpecialKind.none.getter()
{
  return 0;
}

uint64_t static ExtendedExistentialShape.SpecialKind.class.getter()
{
  return 1;
}

uint64_t static ExtendedExistentialShape.SpecialKind.metatype.getter()
{
  return 2;
}

uint64_t static ExtendedExistentialShape.SpecialKind.explicitLayout.getter()
{
  return 3;
}

uint64_t ExtendedExistentialShape.SpecialKind.description.getter(unsigned __int8 a1)
{
  int v1;
  uint64_t result;

  v1 = a1;
  result = 1701736302;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x7373616C63;
      break;
    case 2:
      result = 0x657079746174656DLL;
      break;
    case 3:
      result = 0x746963696C707865;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExtendedExistentialShape.SpecialKind()
{
  _BYTE *v0;
  uint64_t result;

  result = 1701736302;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      result = 0x7373616C63;
      break;
    case 2:
      result = 0x657079746174656DLL;
      break;
    case 3:
      result = 0x746963696C707865;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t static ExtendedExistentialShape.Flags.specialKindMask.getter()
{
  return 255;
}

uint64_t static ExtendedExistentialShape.Flags.hasGeneralizationSignatureMask.getter()
{
  return 256;
}

uint64_t static ExtendedExistentialShape.Flags.hasTypeExpressionMask.getter()
{
  return 512;
}

uint64_t static ExtendedExistentialShape.Flags.hasSuggestedValueWitnessesMask.getter()
{
  return 1024;
}

uint64_t static ExtendedExistentialShape.Flags.hasImplicitRequirementSignatureParametersMask.getter()
{
  return 2048;
}

uint64_t static ExtendedExistentialShape.Flags.hasImplicitGeneralizationSignatureParametersMask.getter()
{
  return 4096;
}

uint64_t ExtendedExistentialShape.Flags.hasGenerializationSignature.getter(unsigned int a1)
{
  return (a1 >> 8) & 1;
}

uint64_t ExtendedExistentialShape.Flags.hasTypeExpression.getter(unsigned int a1)
{
  return (a1 >> 9) & 1;
}

uint64_t ExtendedExistentialShape.Flags.hasSuggestedValueWitnesses.getter(unsigned int a1)
{
  return (a1 >> 10) & 1;
}

uint64_t ExtendedExistentialShape.Flags.hasImplicitRequirementSignatureParameters.getter(unsigned int a1)
{
  return (a1 >> 11) & 1;
}

uint64_t ExtendedExistentialShape.Flags.hasImplicitGeneralizationSignatureParameters.getter(unsigned int a1)
{
  return (a1 >> 12) & 1;
}

uint64_t static FieldDescriptor.Element.Flags.isIndirectCaseMask.getter()
{
  return 1;
}

uint64_t static FieldDescriptor.Element.Flags.isVarMask.getter()
{
  return 2;
}

uint64_t FieldDescriptor.Element.Flags.isIndirectCase.getter(char a1)
{
  return a1 & 1;
}

uint64_t FieldDescriptor.Element.Flags.isVar.getter(unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t static GenericSignature.Flags.hasTypePacksMask.getter()
{
  return 1;
}

uint64_t GenericSignature.Flags.hasTypePacks.getter(char a1)
{
  return a1 & 1;
}

uint64_t static GenericSignature.LayoutKind.class.getter()
{
  return 0;
}

BOOL static GenericSignature.LayoutKind.== infix(_:_:)(int a1, int a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GenericSignature.LayoutKind(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void GenericSignature.LayoutKind.hash(into:)(int a1, Swift::UInt32 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int GenericSignature.LayoutKind.hashValue.getter(Swift::UInt32 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GenericSignature.LayoutKind()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GenericSignature.LayoutKind()
{
  Swift::UInt32 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GenericSignature.LayoutKind()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t GenericSignature.LayoutKind.description.getter(int a1)
{
  if (a1)
    return 0x6E776F6E6B6E75;
  else
    return 0x7373616C63;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GenericSignature.LayoutKind()
{
  _DWORD *v0;

  if (*v0)
    return 0x6E776F6E6B6E75;
  else
    return 0x7373616C63;
}

uint64_t static GenericSignature.PackShapeDescriptor.Kind.metadata.getter()
{
  return 0;
}

uint64_t static GenericSignature.PackShapeDescriptor.Kind.witnessTable.getter()
{
  return 1;
}

BOOL static GenericSignature.PackShapeDescriptor.Kind.== infix(_:_:)(__int16 a1, __int16 a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GenericSignature.PackShapeDescriptor.Kind(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

void GenericSignature.PackShapeDescriptor.Kind.hash(into:)(int a1, Swift::UInt16 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int GenericSignature.PackShapeDescriptor.Kind.hashValue.getter(Swift::UInt16 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GenericSignature.PackShapeDescriptor.Kind()
{
  Swift::UInt16 *v0;
  Swift::UInt16 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GenericSignature.PackShapeDescriptor.Kind()
{
  Swift::UInt16 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GenericSignature.PackShapeDescriptor.Kind()
{
  Swift::UInt16 *v0;
  Swift::UInt16 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t GenericSignature.PackShapeDescriptor.Kind.description.getter(__int16 a1)
{
  if (!a1)
    return 0x617461646174656DLL;
  if (a1 == 1)
    return 0x547373656E746977;
  return 0x6E776F6E6B6E75;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GenericSignature.PackShapeDescriptor.Kind()
{
  _WORD *v0;
  uint64_t v1;

  v1 = 0x617461646174656DLL;
  if (*v0)
    v1 = 0x6E776F6E6B6E75;
  if (*v0 == 1)
    return 0x547373656E746977;
  else
    return v1;
}

uint64_t static GenericSignature.ParameterDescriptor.kindMask.getter()
{
  return 63;
}

uint64_t static GenericSignature.ParameterDescriptor.hasKeyArgumentMask.getter()
{
  return 128;
}

uint64_t GenericSignature.ParameterDescriptor.kind.getter(char a1)
{
  return a1 & 0x3F;
}

uint64_t GenericSignature.ParameterDescriptor.hasKeyArgument.getter(unsigned int a1)
{
  return (a1 >> 7) & 1;
}

uint64_t static GenericSignature.ParameterDescriptor.Kind.type.getter()
{
  return 0;
}

uint64_t static GenericSignature.ParameterDescriptor.Kind.pack.getter()
{
  return 1;
}

uint64_t GenericSignature.ParameterDescriptor.Kind.description.getter(char a1)
{
  if (!a1)
    return 1701869940;
  if (a1 == 1)
    return 1801675120;
  return 0x6E776F6E6B6E75;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GenericSignature.ParameterDescriptor.Kind()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1701869940;
  if (*v0)
    v1 = 0x6E776F6E6B6E75;
  if (*v0 == 1)
    return 1801675120;
  else
    return v1;
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.protocol.getter()
{
  return 0;
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.sameType.getter()
{
  return 1;
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.baseClass.getter()
{
  return 2;
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.sameConformance.getter()
{
  return 3;
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.layout.getter()
{
  return 31;
}

uint64_t GenericSignature.RequirementDescriptor.Kind.description.getter(unsigned __int8 a1)
{
  int v1;
  uint64_t result;

  v1 = a1;
  result = 0x6C6F636F746F7270;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x65707954656D6173;
      break;
    case 2:
      result = 0x73616C4365736162;
      break;
    case 3:
      result = 0x666E6F43656D6173;
      break;
    case 31:
      result = 0x74756F79616CLL;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GenericSignature.RequirementDescriptor.Kind()
{
  unsigned __int8 *v0;

  return GenericSignature.RequirementDescriptor.Kind.description.getter(*v0);
}

uint64_t static GenericSignature.RequirementDescriptor.Flags.kindMask.getter()
{
  return 31;
}

uint64_t static GenericSignature.RequirementDescriptor.Flags.isPackRequirementMask.getter()
{
  return 32;
}

uint64_t static GenericSignature.RequirementDescriptor.Flags.hasKeyArgumentMask.getter()
{
  return 128;
}

uint64_t GenericSignature.RequirementDescriptor.Flags.kind.getter(char a1)
{
  return a1 & 0x1F;
}

uint64_t GenericSignature.RequirementDescriptor.Flags.isPackRequirement.getter(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

uint64_t GenericSignature.RequirementDescriptor.Flags.hasKeyArgument.getter(unsigned int a1)
{
  return (a1 >> 7) & 1;
}

uint64_t static MetadataInitializationKind.none.getter()
{
  return 0;
}

uint64_t static MetadataInitializationKind.single.getter()
{
  return 1;
}

uint64_t static MetadataInitializationKind.foreign.getter()
{
  return 2;
}

uint64_t MetadataInitializationKind.description.getter(char a1)
{
  uint64_t v1;

  if (!a1)
    return 1701736302;
  v1 = 0x6E776F6E6B6E75;
  if (a1 == 1)
    v1 = 0x656C676E6973;
  if (a1 == 2)
    return 0x6E676965726F66;
  else
    return v1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MetadataInitializationKind()
{
  _BYTE *v0;
  int v1;
  uint64_t v2;

  v1 = *v0;
  v2 = 1701736302;
  if (*v0)
    v2 = 0x6E776F6E6B6E75;
  if (v1 == 1)
    v2 = 0x656C676E6973;
  if (v1 == 2)
    return 0x6E676965726F66;
  else
    return v2;
}

uint64_t static ProtocolDescriptor.Flags.hasClassConstraintMask.getter()
{
  return 1;
}

uint64_t static ProtocolDescriptor.Flags.isResilientMask.getter()
{
  return 2;
}

uint64_t static ProtocolDescriptor.Flags.specialProtocolMask.getter()
{
  return 252;
}

uint64_t static ProtocolDescriptor.Flags.specialProtocolShift.getter()
{
  return 2;
}

BOOL ProtocolDescriptor.Flags.isClassConstrained.getter(char a1)
{
  return (a1 & 1) == 0;
}

uint64_t ProtocolDescriptor.Flags.isResilient.getter(unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t ProtocolDescriptor.Flags.specialProtocol.getter(unsigned __int8 a1)
{
  return a1 >> 2;
}

uint64_t static ProtocolRequirement.Kind.baseProtocol.getter()
{
  return 0;
}

uint64_t static ProtocolRequirement.Kind.method.getter()
{
  return 1;
}

uint64_t static ProtocolRequirement.Kind.init.getter()
{
  return 2;
}

uint64_t static ProtocolRequirement.Kind.getter.getter()
{
  return 3;
}

uint64_t static ProtocolRequirement.Kind.setter.getter()
{
  return 4;
}

uint64_t static ProtocolRequirement.Kind.readCoroutine.getter()
{
  return 5;
}

uint64_t static ProtocolRequirement.Kind.modifyCoroutine.getter()
{
  return 6;
}

uint64_t static ProtocolRequirement.Kind.associatedTypeAccessFunction.getter()
{
  return 7;
}

uint64_t static ProtocolRequirement.Kind.associatedConformanceAccessFunction.getter()
{
  return 8;
}

unint64_t ProtocolRequirement.Kind.description.getter(unsigned __int8 a1)
{
  int v1;
  unint64_t result;

  v1 = a1;
  result = 0x746F725065736162;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x646F6874656DLL;
      break;
    case 2:
      result = 1953066601;
      break;
    case 3:
      result = 0x726574746567;
      break;
    case 4:
      result = 0x726574746573;
      break;
    case 5:
      result = 0x6F726F4364616572;
      break;
    case 6:
      result = 0x6F43796669646F6DLL;
      break;
    case 7:
      result = 0xD00000000000001CLL;
      break;
    case 8:
      result = 0xD000000000000023;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance ProtocolRequirement.Kind()
{
  unsigned __int8 *v0;

  return ProtocolRequirement.Kind.description.getter(*v0);
}

uint64_t static ProtocolRequirement.Flags.kindMask.getter()
{
  return 15;
}

uint64_t static ProtocolRequirement.Flags.isInstanceMask.getter()
{
  return 16;
}

uint64_t static ProtocolRequirement.Flags.isAsyncMask.getter()
{
  return 32;
}

uint64_t static ProtocolRequirement.Flags.extraDiscriminatorShift.getter()
{
  return 16;
}

uint64_t ProtocolRequirement.Flags.kind.getter(char a1)
{
  return a1 & 0xF;
}

uint64_t ProtocolRequirement.Flags.isInstance.getter(unsigned int a1)
{
  return (a1 >> 4) & 1;
}

uint64_t ProtocolRequirement.Flags.extraDiscriminator.getter(unsigned int a1)
{
  return HIWORD(a1);
}

uint64_t ReferenceOwnership.description.getter(unsigned __int8 a1)
{
  int v1;
  uint64_t result;

  v1 = a1;
  result = 0x676E6F727473;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 1801545079;
      break;
    case 2:
      result = 0x64656E776F6E75;
      break;
    case 4:
      result = 0x6567616E616D6E75;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ReferenceOwnership()
{
  _BYTE *v0;
  uint64_t result;

  result = 0x676E6F727473;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      result = 1801545079;
      break;
    case 2:
      result = 0x64656E776F6E75;
      break;
    case 4:
      result = 0x6567616E616D6E75;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t static SpecialProtocol.none.getter()
{
  return 0;
}

uint64_t static SpecialProtocol.error.getter()
{
  return 1;
}

uint64_t SpecialProtocol.description.getter(char a1)
{
  if (!a1)
    return 1701736302;
  if (a1 == 1)
    return 0x726F727265;
  return 0x6E776F6E6B6E75;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpecialProtocol()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1701736302;
  if (*v0)
    v1 = 0x6E776F6E6B6E75;
  if (*v0 == 1)
    return 0x726F727265;
  else
    return v1;
}

uint64_t static TypeDescriptor.Flags.metadataInitializationKindMask.getter()
{
  return 3;
}

uint64_t static TypeDescriptor.Flags.hasImportInfoMask.getter()
{
  return 4;
}

uint64_t static TypeDescriptor.Flags.hasCanonicalMetadataPrespecializationsMask.getter()
{
  return 8;
}

uint64_t static TypeDescriptor.Flags.classIsActorMask.getter()
{
  return 128;
}

uint64_t static TypeDescriptor.Flags.classIsDefaultActorMask.getter()
{
  return 256;
}

uint64_t static TypeDescriptor.Flags.classResilientSuperclassReferenceKindMask.getter()
{
  return 3584;
}

uint64_t static TypeDescriptor.Flags.classResilientSuperclassReferenceKindShift.getter()
{
  return 9;
}

uint64_t static TypeDescriptor.Flags.classAreImmediateMembersNegativeMask.getter()
{
  return 4096;
}

uint64_t static TypeDescriptor.Flags.classHasResilientSuperclassMask.getter()
{
  return 0x2000;
}

uint64_t static TypeDescriptor.Flags.classHasOverrideTableMask.getter()
{
  return 0x4000;
}

uint64_t static TypeDescriptor.Flags.classHasVtableMask.getter()
{
  return 0x8000;
}

uint64_t TypeDescriptor.Flags.metadataInitializationKind.getter(char a1)
{
  return a1 & 3;
}

uint64_t TypeDescriptor.Flags.hasImportInfo.getter(unsigned int a1)
{
  return (a1 >> 2) & 1;
}

uint64_t TypeDescriptor.Flags.hasCanonicalMetadataPrespecializations.getter(unsigned int a1)
{
  return (a1 >> 3) & 1;
}

uint64_t TypeDescriptor.Flags.classIsActor.getter(unsigned int a1)
{
  return (a1 >> 7) & 1;
}

uint64_t TypeDescriptor.Flags.classIsDefaultActor.getter(unsigned int a1)
{
  return (a1 >> 8) & 1;
}

uint64_t TypeDescriptor.Flags.classResilientSuperclassReferenceKind.getter(unsigned int a1)
{
  return (a1 >> 9) & 7;
}

uint64_t TypeDescriptor.Flags.classAreImmediateMembersNegative.getter(unsigned int a1)
{
  return (a1 >> 12) & 1;
}

uint64_t TypeDescriptor.Flags.classHasResilientSuperclass.getter(unsigned int a1)
{
  return (a1 >> 13) & 1;
}

uint64_t TypeDescriptor.Flags.classHasOverrideTable.getter(unsigned int a1)
{
  return (a1 >> 14) & 1;
}

uint64_t TypeDescriptor.Flags.classHasVtable.getter(unsigned int a1)
{
  return (a1 >> 15) & 1;
}

uint64_t static TypeReference.Kind.directObjCClass.getter()
{
  return 2;
}

uint64_t static TypeReference.Kind.indirectObjCClass.getter()
{
  return 3;
}

BOOL static TypeReference.Kind.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TypeReference.Kind(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void TypeReference.Kind.hash(into:)(int a1, Swift::UInt8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ContextDescriptor.Kind.hashValue.getter(Swift::UInt8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ContextDescriptor.Kind()
{
  Swift::UInt8 *v0;
  Swift::UInt8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance TypeReference.Kind()
{
  Swift::UInt8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ContextDescriptor.Kind()
{
  Swift::UInt8 *v0;
  Swift::UInt8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t TypeReference.Kind.description.getter(unsigned __int8 a1)
{
  int v1;
  unint64_t result;

  v1 = a1;
  result = 0xD000000000000010;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0xD000000000000012;
      break;
    case 2:
      result = 0x624F746365726964;
      break;
    case 3:
      result = 0xD000000000000011;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContextDescriptor.Kind and conformance ContextDescriptor.Kind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContextDescriptor.Kind and conformance ContextDescriptor.Kind;
  if (!lazy protocol witness table cache variable for type ContextDescriptor.Kind and conformance ContextDescriptor.Kind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ContextDescriptor.Kind, &type metadata for ContextDescriptor.Kind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContextDescriptor.Kind and conformance ContextDescriptor.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExtendedExistentialShape.SpecialKind and conformance ExtendedExistentialShape.SpecialKind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ExtendedExistentialShape.SpecialKind and conformance ExtendedExistentialShape.SpecialKind;
  if (!lazy protocol witness table cache variable for type ExtendedExistentialShape.SpecialKind and conformance ExtendedExistentialShape.SpecialKind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ExtendedExistentialShape.SpecialKind, &type metadata for ExtendedExistentialShape.SpecialKind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtendedExistentialShape.SpecialKind and conformance ExtendedExistentialShape.SpecialKind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericSignature.LayoutKind and conformance GenericSignature.LayoutKind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GenericSignature.LayoutKind and conformance GenericSignature.LayoutKind;
  if (!lazy protocol witness table cache variable for type GenericSignature.LayoutKind and conformance GenericSignature.LayoutKind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for GenericSignature.LayoutKind, &type metadata for GenericSignature.LayoutKind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericSignature.LayoutKind and conformance GenericSignature.LayoutKind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericSignature.PackShapeDescriptor.Kind and conformance GenericSignature.PackShapeDescriptor.Kind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GenericSignature.PackShapeDescriptor.Kind and conformance GenericSignature.PackShapeDescriptor.Kind;
  if (!lazy protocol witness table cache variable for type GenericSignature.PackShapeDescriptor.Kind and conformance GenericSignature.PackShapeDescriptor.Kind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for GenericSignature.PackShapeDescriptor.Kind, &type metadata for GenericSignature.PackShapeDescriptor.Kind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericSignature.PackShapeDescriptor.Kind and conformance GenericSignature.PackShapeDescriptor.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericSignature.ParameterDescriptor.Kind and conformance GenericSignature.ParameterDescriptor.Kind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GenericSignature.ParameterDescriptor.Kind and conformance GenericSignature.ParameterDescriptor.Kind;
  if (!lazy protocol witness table cache variable for type GenericSignature.ParameterDescriptor.Kind and conformance GenericSignature.ParameterDescriptor.Kind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for GenericSignature.ParameterDescriptor.Kind, &type metadata for GenericSignature.ParameterDescriptor.Kind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericSignature.ParameterDescriptor.Kind and conformance GenericSignature.ParameterDescriptor.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericSignature.RequirementDescriptor.Kind and conformance GenericSignature.RequirementDescriptor.Kind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GenericSignature.RequirementDescriptor.Kind and conformance GenericSignature.RequirementDescriptor.Kind;
  if (!lazy protocol witness table cache variable for type GenericSignature.RequirementDescriptor.Kind and conformance GenericSignature.RequirementDescriptor.Kind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for GenericSignature.RequirementDescriptor.Kind, &type metadata for GenericSignature.RequirementDescriptor.Kind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericSignature.RequirementDescriptor.Kind and conformance GenericSignature.RequirementDescriptor.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MetadataInitializationKind and conformance MetadataInitializationKind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type MetadataInitializationKind and conformance MetadataInitializationKind;
  if (!lazy protocol witness table cache variable for type MetadataInitializationKind and conformance MetadataInitializationKind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for MetadataInitializationKind, &type metadata for MetadataInitializationKind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MetadataInitializationKind and conformance MetadataInitializationKind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ProtocolRequirement.Kind and conformance ProtocolRequirement.Kind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ProtocolRequirement.Kind and conformance ProtocolRequirement.Kind;
  if (!lazy protocol witness table cache variable for type ProtocolRequirement.Kind and conformance ProtocolRequirement.Kind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ProtocolRequirement.Kind, &type metadata for ProtocolRequirement.Kind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProtocolRequirement.Kind and conformance ProtocolRequirement.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ReferenceOwnership and conformance ReferenceOwnership()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ReferenceOwnership and conformance ReferenceOwnership;
  if (!lazy protocol witness table cache variable for type ReferenceOwnership and conformance ReferenceOwnership)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ReferenceOwnership, &type metadata for ReferenceOwnership);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ReferenceOwnership and conformance ReferenceOwnership);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpecialProtocol and conformance SpecialProtocol()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SpecialProtocol and conformance SpecialProtocol;
  if (!lazy protocol witness table cache variable for type SpecialProtocol and conformance SpecialProtocol)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for SpecialProtocol, &type metadata for SpecialProtocol);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpecialProtocol and conformance SpecialProtocol);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TypeReference.Kind and conformance TypeReference.Kind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TypeReference.Kind and conformance TypeReference.Kind;
  if (!lazy protocol witness table cache variable for type TypeReference.Kind and conformance TypeReference.Kind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for TypeReference.Kind, &type metadata for TypeReference.Kind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TypeReference.Kind and conformance TypeReference.Kind);
  }
  return result;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance TypeReference.Kind()
{
  unsigned __int8 *v0;

  return TypeReference.Kind.description.getter(*v0);
}

ValueMetadata *type metadata accessor for AnonymousDescriptor.Flags()
{
  return &type metadata for AnonymousDescriptor.Flags;
}

ValueMetadata *type metadata accessor for ConformanceDescriptor.Flags()
{
  return &type metadata for ConformanceDescriptor.Flags;
}

ValueMetadata *type metadata accessor for ContextDescriptor.Kind()
{
  return &type metadata for ContextDescriptor.Kind;
}

ValueMetadata *type metadata accessor for ContextDescriptor.Flags()
{
  return &type metadata for ContextDescriptor.Flags;
}

ValueMetadata *type metadata accessor for ExtendedExistentialShape.SpecialKind()
{
  return &type metadata for ExtendedExistentialShape.SpecialKind;
}

ValueMetadata *type metadata accessor for ExtendedExistentialShape.Flags()
{
  return &type metadata for ExtendedExistentialShape.Flags;
}

ValueMetadata *type metadata accessor for FieldDescriptor.Element.Flags()
{
  return &type metadata for FieldDescriptor.Element.Flags;
}

ValueMetadata *type metadata accessor for GenericSignature.Flags()
{
  return &type metadata for GenericSignature.Flags;
}

ValueMetadata *type metadata accessor for GenericSignature.LayoutKind()
{
  return &type metadata for GenericSignature.LayoutKind;
}

ValueMetadata *type metadata accessor for GenericSignature.PackShapeDescriptor.Kind()
{
  return &type metadata for GenericSignature.PackShapeDescriptor.Kind;
}

ValueMetadata *type metadata accessor for GenericSignature.ParameterDescriptor.Kind()
{
  return &type metadata for GenericSignature.ParameterDescriptor.Kind;
}

ValueMetadata *type metadata accessor for GenericSignature.RequirementDescriptor.Kind()
{
  return &type metadata for GenericSignature.RequirementDescriptor.Kind;
}

ValueMetadata *type metadata accessor for GenericSignature.RequirementDescriptor.Flags()
{
  return &type metadata for GenericSignature.RequirementDescriptor.Flags;
}

ValueMetadata *type metadata accessor for MetadataInitializationKind()
{
  return &type metadata for MetadataInitializationKind;
}

ValueMetadata *type metadata accessor for ProtocolDescriptor.Flags()
{
  return &type metadata for ProtocolDescriptor.Flags;
}

ValueMetadata *type metadata accessor for ProtocolRequirement.Kind()
{
  return &type metadata for ProtocolRequirement.Kind;
}

ValueMetadata *type metadata accessor for ProtocolRequirement.Flags()
{
  return &type metadata for ProtocolRequirement.Flags;
}

ValueMetadata *type metadata accessor for ReferenceOwnership()
{
  return &type metadata for ReferenceOwnership;
}

ValueMetadata *type metadata accessor for SpecialProtocol()
{
  return &type metadata for SpecialProtocol;
}

ValueMetadata *type metadata accessor for TypeDescriptor.Flags()
{
  return &type metadata for TypeDescriptor.Flags;
}

ValueMetadata *type metadata accessor for TypeReference.Kind()
{
  return &type metadata for TypeReference.Kind;
}

void protocol witness for Collection.endIndex.getter in conformance ConformanceSection(uint64_t *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8) / 4;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ConformanceSection(uint64_t (*result)(), uint64_t *a2))()
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *a2;
  if (*a2 < 0 || v3 >= v2[1] / 4)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)result = *v2 + 4 * v3 + *(int *)(*v2 + 4 * v3);
    return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
  }
  return result;
}

_QWORD *protocol witness for Collection.subscript.getter in conformance ConformanceSection@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = v2[1];
  if (v3 >= 0)
    v4 = v2[1];
  else
    v4 = v3 + 3;
  if (v3 < -3)
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v5 = result[1];
  if (v4 >> 2 >= v5)
  {
    v6 = *v2;
    *a2 = *result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v3;
    return result;
  }
LABEL_10:
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance ConformanceSection(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v2 + 3;
  if (v2 >= 0)
    v3 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = 0;
  a1[3] = v3 >> 2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance ConformanceSection()
{
  uint64_t v0;

  return (unint64_t)(*(_QWORD *)(v0 + 8) + 3) < 7;
}

_QWORD *protocol witness for Collection.index(_:offsetBy:) in conformance ConformanceSection@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  if (a2 < 0)
    __break(1u);
  else
    *a3 = *result + a2;
  return result;
}

uint64_t protocol witness for Collection.index(_:offsetBy:limitedBy:) in conformance ConformanceSection@<X0>(uint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = specialized Collection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *protocol witness for Collection.distance(from:to:) in conformance ConformanceSection(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t *v4;
  unint64_t v5;

  v2 = *result;
  v4 = (uint64_t *)(*a2 - *result);
  v3 = *a2 == *result;
  if (*a2 < *result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  result = 0;
  if (!v3)
  {
    v5 = *a2 + ~v2;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      result = (uint64_t *)((char *)result + 1);
      if (v4 == result)
        return result;
    }
    __break(1u);
    goto LABEL_8;
  }
  return result;
}

unint64_t protocol witness for Collection.count.getter in conformance ConformanceSection()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t result;

  v1 = *(_QWORD *)(v0 + 8);
  if (v1 < -3)
  {
    __break(1u);
  }
  else
  {
    v2 = v1 + 3;
    v3 = v1 / 4 - 1;
    if (v3 >= 0x7FFFFFFFFFFFFFFFLL)
      v3 = 0x7FFFFFFFFFFFFFFFLL;
    if (v2 >= 7)
      return v3 + 1;
    else
      return 0;
  }
  return result;
}

int *protocol witness for Sequence._copyToContiguousArray() in conformance ConformanceSection()
{
  uint64_t v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(*(int **)v0, *(_QWORD *)(v0 + 8));
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance ConformanceSection(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *(int **)v3, *(_QWORD *)(v3 + 8));
}

uint64_t one-time initialization function for initializeConformanceLookup()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v0 = MEMORY[0x24BEE4AF8];
  v1 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(conformers: [ProtocolDescriptor : [Any.Type]], lastSectionCount: Int), os_unfair_lock_s>);
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = 0;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 10, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<ContiguousArray<ConformanceSection>, os_unfair_lock_s>);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 16) = v0;
  v4 = conformances;
  conformances = v3;
  qword_25747C8A8 = v2;
  outlined consume of ConformanceCache?(v4);
  result = initializeProtocolConformanceLookup();
  initializeConformanceLookup = (uint64_t)protocol witness for Collection.subscript.read in conformance FieldDescriptor;
  *(_QWORD *)algn_25747C898 = 0;
  return result;
}

uint64_t addImageProtocolConformanceBlockCallbackUnsafe(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;

  v3 = conformances;
  if (conformances)
  {
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
    closure #1 in addImageProtocolConformanceBlockCallbackUnsafe(baseAddress:start:size:)((uint64_t *)(v3 + 16), a2, a3);
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in addImageProtocolConformanceBlockCallbackUnsafe(baseAddress:start:size:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v6 = *a1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v6;
  if ((result & 1) == 0)
  {
    result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v6 + 16) + 1, 1);
    v6 = *a1;
  }
  v9 = *(_QWORD *)(v6 + 16);
  v8 = *(_QWORD *)(v6 + 24);
  if (v9 >= v8 >> 1)
  {
    result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1);
    v6 = *a1;
  }
  *(_QWORD *)(v6 + 16) = v9 + 1;
  v10 = v6 + 16 * v9;
  *(_QWORD *)(v10 + 32) = a2;
  *(_QWORD *)(v10 + 40) = a3;
  *a1 = v6;
  return result;
}

uint64_t _withConformanceCache(for:do:)(Swift::UInt a1, void (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  os_unfair_lock_s *v7;
  _BYTE v9[9];

  if (one-time initialization token for initializeConformanceLookup != -1)
    swift_once();
  initializeConformanceLookup();
  v4 = conformances;
  if (!conformances)
    return ((uint64_t (*)(_QWORD))a2)(MEMORY[0x24BEE4AF8]);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 24));
  v5 = *(_QWORD *)(v4 + 16);
  swift_retain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 24));
  swift_release();
  if (!conformances)
    return swift_release();
  v6 = (_QWORD *)(qword_25747C8A8 + 16);
  v7 = (os_unfair_lock_s *)(qword_25747C8A8 + 32);
  swift_retain();
  os_unfair_lock_lock(v7);
  closure #2 in _withConformanceCache(for:do:)(v6, v5, a1, a2, v9);
  os_unfair_lock_unlock(v7);
  swift_release();
  return swift_release();
}

uint64_t closure #2 in _withConformanceCache(for:do:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, Swift::UInt a3@<X2>, void (*a4)(uint64_t)@<X3>, _BYTE *a5@<X8>)
{
  _QWORD *v7;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _DWORD *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  _DWORD *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char isUniquelyReferenced_nonNull_native;
  void (*v47)(uint64_t);
  _QWORD *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  int v55;

  v7 = a1;
  v51 = *(_QWORD *)(a2 + 16);
  if (a1[1] >= v51)
  {
    if (*(_QWORD *)(*a1 + 16))
    {
      specialized __RawDictionaryStorage.find<A>(_:)(a3);
      if ((v9 & 1) != 0)
      {
        v10 = swift_bridgeObjectRetain();
        a4(v10);
        result = swift_bridgeObjectRelease();
LABEL_40:
        *a5 = 0;
        return result;
      }
    }
  }
  if (!v51)
  {
    v44 = MEMORY[0x24BEE4AF8];
LABEL_39:
    v45 = swift_bridgeObjectRetain();
    a4(v45);
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v54 = *v7;
    *v7 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v44, a3, isUniquelyReferenced_nonNull_native);
    *v7 = v54;
    result = swift_bridgeObjectRelease();
    v7[1] = v51;
    goto LABEL_40;
  }
  v47 = a4;
  v48 = v7;
  v50 = a2 + 32;
  swift_retain();
  v12 = 0;
  v49 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v52 = v12;
    v13 = (uint64_t *)(v50 + 16 * v12);
    v14 = v13[1];
    v15 = v14 + 3;
    v16 = v14 + (v14 < 0 ? 3uLL : 0);
    if (v15 >= 7)
      break;
LABEL_7:
    v12 = v52 + 1;
    if (v52 + 1 == v51)
    {
      swift_release();
      a4 = v47;
      v7 = v48;
      v44 = (uint64_t)v49;
      goto LABEL_39;
    }
  }
  v17 = 0;
  v18 = *v13;
  v19 = v16 >> 2;
  v20 = 4 * ((v16 >> 2) & ~(v16 >> 63));
  while (v20 != v17)
  {
    v21 = *(int *)(v18 + v17);
    v22 = v18 + v17 + v21;
    if ((*(_BYTE *)(v22 + 12) & 0x30) == 0)
    {
      swift_getKeyPath();
      v23 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_release();
      v24 = *(int *)(v18 + v23 + v21 + v17);
      v25 = v23 + v21 + (v24 & 0xFFFFFFFFFFFFFFFELL);
      v26 = (v24 & 1) != 0 ? *(_QWORD *)(v18 + v25 + v17) : v18 + v17 + v25;
      if (v26 == a3)
      {
        swift_getKeyPath();
        v27 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
        swift_release();
        v28 = (*(unsigned __int8 *)(v22 + 12) >> 3) & 7;
        v29 = v27 + v21 + *(int *)(v18 + v27 + v21 + v17);
        if (v28 == 1)
        {
          v30 = *(_DWORD **)(v18 + v29 + v17);
        }
        else
        {
          if (v28)
            goto LABEL_42;
          v30 = (_DWORD *)(v18 + v17 + v29);
        }
        if ((*v30 & 0x1Fu) - 16 < 3)
        {
          swift_getKeyPath();
          v31 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
          swift_release();
          v32 = (*(_DWORD *)(v22 + 12) >> 3) & 7;
          v33 = v31 + v21 + *(int *)(v18 + v31 + v21 + v17);
          if (v32 == 1)
          {
            v34 = *(_DWORD **)(v18 + v33 + v17);
          }
          else
          {
            if (v32)
              goto LABEL_42;
            v34 = (_DWORD *)(v18 + v17 + v33);
          }
          if (!(*v34 & 0x80 | *(_DWORD *)(v22 + 12) & 0xFF00))
          {
            swift_getKeyPath();
            v35 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
            swift_release();
            v36 = (*(unsigned __int8 *)(v22 + 12) >> 3) & 7;
            v37 = v35 + v21 + *(int *)(v18 + v35 + v21 + v17);
            if (v36 == 1)
            {
              v38 = *(_QWORD *)(v18 + v37 + v17);
            }
            else
            {
              if (v36)
                goto LABEL_42;
              v38 = v18 + v17 + v37;
            }
            swift_getKeyPath();
            v39 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
            swift_getAtKeyPath();
            swift_release();
            v40 = ((uint64_t (*)(_QWORD))(v38 + v39 + v55))(0);
            if (v40)
            {
              v41 = v40;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v49 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v49 + 2) + 1, 1, v49);
              v43 = *((_QWORD *)v49 + 2);
              v42 = *((_QWORD *)v49 + 3);
              if (v43 >= v42 >> 1)
                v49 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v42 > 1), v43 + 1, 1, v49);
              *((_QWORD *)v49 + 2) = v43 + 1;
              *(_QWORD *)&v49[8 * v43 + 32] = v41;
            }
          }
        }
      }
    }
    v17 += 4;
    if (!--v19)
      goto LABEL_7;
  }
  __break(1u);
LABEL_42:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ConformanceSection()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<ConformanceSection> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<ConformanceSection>, MEMORY[0x24BEE2C18]);
}

unint64_t lazy protocol witness table accessor for type ConformanceSection and conformance ConformanceSection()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ConformanceSection and conformance ConformanceSection;
  if (!lazy protocol witness table cache variable for type ConformanceSection and conformance ConformanceSection)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ConformanceSection, &type metadata for ConformanceSection);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConformanceSection and conformance ConformanceSection);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in ConformanceSection()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type DefaultIndices<ConformanceSection> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<ConformanceSection>, MEMORY[0x24BEE0670]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ConformanceSection()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<ConformanceSection> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<ConformanceSection>, MEMORY[0x24BEE4238]);
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(unsigned int *)(a1 + 12);
  if (!(_DWORD)v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FieldDescriptor.Element>);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  if (specialized Sequence._copyContents(initializing:)(&v7, v3 + 4, v1, a1) != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = result[1];
  if ((v1 & 0x8000000000000000) == 0)
  {
    if (v1)
    {
      v2 = (uint64_t)result;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<TupleMetadata.Elements.Element>);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 17;
      v3[2] = v1;
      v3[3] = 2 * (v5 >> 4);
      if (specialized Sequence._copyContents(initializing:)(&v6, v3 + 4, v1, v2) == (_QWORD *)v1)
        return v3;
      __break(1u);
    }
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  __break(1u);
  return result;
}

int *specialized _copyCollectionToContiguousArray<A>(_:)(int *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  int *v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  _QWORD v10[3];

  if (a2 >= 0)
    v2 = a2;
  else
    v2 = a2 + 3;
  if (a2 < -3)
  {
    __break(1u);
  }
  else
  {
    if ((unint64_t)(a2 + 3) <= 6)
      return (int *)MEMORY[0x24BEE4AF8];
    v5 = result;
    v6 = (v2 >> 2) - 1;
    if (v6 >= 0x7FFFFFFFFFFFFFFFLL)
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = v6 + 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ConformanceDescriptor>);
    v3 = (_QWORD *)swift_allocObject();
    v8 = _swift_stdlib_malloc_size(v3);
    v9 = v8 - 32;
    if (v8 < 32)
      v9 = v8 - 25;
    v3[2] = v7;
    v3[3] = 2 * (v9 >> 3);
    result = (int *)specialized Sequence._copySequenceContents(initializing:)(v10, v3 + 4, v7, v5, a2);
    if (result == (int *)v7)
      return (int *)v3;
  }
  __break(1u);
  return result;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, _QWORD *a2, uint64_t a3, int *a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64x2_t *v16;
  int64x2_t v17;
  int32x4_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int32x4_t v21;
  int64x2_t v22;
  uint64_t v23;
  int *v24;
  _QWORD *v25;

  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *result = a4;
    result[1] = a5;
    result[2] = a3;
    return (_QWORD *)a3;
  }
  if (a3 < 0)
    goto LABEL_36;
  if (a5 >= 0)
    v5 = a5;
  else
    v5 = a5 + 3;
  if ((unint64_t)(a5 + 3) < 7)
    goto LABEL_8;
  if (a5 >= 4)
  {
    *a2 = (char *)a4 + *a4;
    v6 = a3 - 1;
    if (a3 == 1)
      goto LABEL_9;
    v7 = v5 >> 2;
    v8 = a3 - 2;
    if (a3 - 2 >= (unint64_t)(v7 - 1))
      v9 = v7 - 1;
    else
      v9 = a3 - 2;
    if (v9 >= v6)
      v9 = a3 - 1;
    v10 = v9 + 1;
    if (v10 <= 0x10)
      goto LABEL_24;
    if (v8 >= v7 - 1)
      v8 = v7 - 1;
    if (v8 < v6)
      v6 = v8;
    if (a2 + 1 >= (_QWORD *)&a4[v6 + 2] || a4 + 1 >= (int *)&a2[v6 + 2])
    {
      v13 = v10 & 7;
      if ((v10 & 7) == 0)
        v13 = 8;
      v14 = v10 - v13;
      v11 = v10 - v13 + 1;
      v12 = &a2[v14];
      v15 = (uint64_t)(a4 + 8);
      v16 = (int64x2_t *)(a2 + 5);
      do
      {
        v17.i64[0] = v15 - 20;
        v17.i64[1] = v15 - 16;
        v18 = *(int32x4_t *)(v15 - 28);
        v19.i64[0] = v15 - 28;
        v19.i64[1] = v15 - 24;
        v20.i64[0] = v15 - 4;
        v20.i64[1] = v15;
        v21 = *(int32x4_t *)(v15 - 12);
        v22.i64[0] = v15 - 12;
        v22.i64[1] = v15 - 8;
        v16[-2] = vaddw_s32(v19, *(int32x2_t *)v18.i8);
        v16[-1] = vaddw_high_s32(v17, v18);
        *v16 = vaddw_s32(v22, *(int32x2_t *)v21.i8);
        v16[1] = vaddw_high_s32(v20, v21);
        v16 += 4;
        v15 += 32;
        v14 -= 8;
      }
      while (v14);
    }
    else
    {
LABEL_24:
      v11 = 1;
      v12 = a2;
    }
    v23 = -v11;
    v24 = &a4[v11];
    v25 = v12 + 1;
    while (a3 + v23)
    {
      if (!(v7 + v23))
      {
        a3 = v7;
        goto LABEL_9;
      }
      *v25++ = (char *)v24 + *v24;
      --v23;
      ++v24;
      if (!(a3 + v23))
        goto LABEL_9;
    }
    __break(1u);
LABEL_36:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt a1)
{
  Swift::Int v2;

  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, Swift::UInt a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)specialized _NativeDictionary.copy()();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(result, a3 & 1);
  result = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<TypeCache.Key, Metadata?>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v22 = __clz(__rbit64(v20));
    v12 = (v20 - 1) & v20;
    v15 = v22 + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = 8 * v15;
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v17);
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_OWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v17) = v18;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ProtocolDescriptor, [Any.Type]>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ConformanceSection>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_release();
  return v10;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any.Type>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *i;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<TypeCache.Key, Metadata?>);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
    for (i = (_QWORD *)(a1 + 48); ; i += 3)
    {
      v5 = *i;
      v11 = *((_OWORD *)i - 1);
      result = specialized __RawDictionaryStorage.find<A>(_:)((Swift::UInt8 *)*(i - 2), (unsigned __int8 *)*(i - 1));
      if ((v7 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_OWORD *)(v3[6] + 16 * result) = v11;
      *(_QWORD *)(v3[7] + 8 * result) = v5;
      v8 = v3[2];
      v9 = __OFADD__(v8, 1);
      v10 = v8 + 1;
      if (v9)
        goto LABEL_10;
      v3[2] = v10;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

{
  uint64_t v1;
  _QWORD *v3;
  unint64_t result;
  char v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  char v12;
  __int128 v13;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ProtocolDescriptor, [Any.Type]>);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v13 = *(_OWORD *)(a1 + 32);
  result = specialized __RawDictionaryStorage.find<A>(_:)(*(_QWORD *)(a1 + 32));
  if ((v5 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v6 = (__int128 *)(a1 + 48);
  v7 = v1 - 1;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v13;
    *(_QWORD *)(v3[7] + 8 * result) = *((_QWORD *)&v13 + 1);
    v8 = v3[2];
    v9 = __OFADD__(v8, 1);
    v10 = v8 + 1;
    if (v9)
      break;
    v3[2] = v10;
    if (!v7)
      goto LABEL_8;
    v11 = *v6++;
    v13 = v11;
    swift_bridgeObjectRetain();
    result = specialized __RawDictionaryStorage.find<A>(_:)(v11);
    --v7;
    if ((v12 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t specialized Collection.index(_:offsetBy:limitedBy:)(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (a2)
  {
    if (result == a3)
    {
      return 0;
    }
    else
    {
      v3 = result + 1;
      v4 = a2 - 2;
      if (a2 < 2)
      {
        ++result;
      }
      else
      {
        if (~result + a3 < v4)
          v4 = ~result + a3;
        v5 = v4 + 1;
        if (v5 >= 0x21)
        {
          v7 = v5 & 0x1F;
          if ((v5 & 0x1F) == 0)
            v7 = 32;
          v8 = v5 - v7;
          v6 = v8 + 1;
          v3 += v8;
          do
            v8 -= 32;
          while (v8);
        }
        else
        {
          v6 = 1;
        }
        v9 = a2 - v6;
        result = v3;
        while (a3 != result)
        {
          ++result;
          if (!--v9)
            return result;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t outlined consume of ConformanceCache?(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

ValueMetadata *type metadata accessor for ConformanceSection()
{
  return &type metadata for ConformanceSection;
}

uint64_t HeapObject.type.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(_QWORD *)(a1 + v2);
}

BOOL static HeapObject.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void HeapObject.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int HeapObject.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type HeapObject and conformance HeapObject()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type HeapObject and conformance HeapObject;
  if (!lazy protocol witness table cache variable for type HeapObject and conformance HeapObject)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for HeapObject, &type metadata for HeapObject);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HeapObject and conformance HeapObject);
  }
  return result;
}

ValueMetadata *type metadata accessor for HeapObject()
{
  return &type metadata for HeapObject;
}

uint64_t type metadata accessor for Lock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Lock);
}

uint64_t StructDescriptor.fieldOffsetVectorOffset.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t StructDescriptor.numberOfFields.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

_BYTE *StructDescriptor.genericSignature.getter(char *a1)
{
  _BYTE *result;
  char v2;

  v2 = *a1;
  result = a1 + 36;
  if ((v2 & 0x80) == 0)
    return 0;
  return result;
}

BOOL static StructDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void StructDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int StructDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type StructDescriptor and conformance StructDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type StructDescriptor and conformance StructDescriptor;
  if (!lazy protocol witness table cache variable for type StructDescriptor and conformance StructDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for StructDescriptor, &type metadata for StructDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StructDescriptor and conformance StructDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for StructDescriptor()
{
  return &type metadata for StructDescriptor;
}

uint64_t SignedLayout.address<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;

  v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v6 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  return *v6 + v5;
}

uint64_t SignedLayout.trailing.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))() + 8;
}

uint64_t SignedLayout.layout.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;

  v6 = (uint64_t *)(*(uint64_t (**)(void))(a2 + 24))();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  v7 = *v6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a3, v7, AssociatedTypeWitness);
}

uint64_t PublicLayout.address<A>(for:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a4;
  v22 = a2;
  v5 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE46A8] + 8);
  v23 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v20 - v7;
  v10 = *v9;
  v11 = *(_QWORD *)(*v9 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v13 = (char *)&v20 - v12;
  v21 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v14 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 16);
  v15 = v22;
  v16 = v14(v22, a3);
  UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(0, v16, v10, (uint64_t)v13);
  swift_getAtKeyPath();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v17 = v14(v15, a3);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 24))(v17 + v21, v5);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v5);
  return v18;
}

uint64_t PublicLayout.trailing.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = (*(uint64_t (**)(void))(a2 + 16))();
  return v2 + *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
}

uint64_t PublicLayout.layout.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t AssociatedTypeWitness;

  v3 = (*(uint64_t (**)(void))(a1 + 16))();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(0, v3, AssociatedTypeWitness, a2);
}

uint64_t PublicLayout.unappliedAddress<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3) + v5;
}

uint64_t PublicLayout.address<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3) + v5;
}

uint64_t PublicLayout.address<A, B>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  v7 = type metadata accessor for UnsafePointer();
  UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(0, v6, v7, (uint64_t)&v9);
  return v9 + v5;
}

uint64_t SignedLayout.authedPtr.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = (*(uint64_t (**)(void))(a2 + 24))();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  return *(_QWORD *)v4;
}

uint64_t dispatch thunk of PublicLayout.ptr.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PublicLayout.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SignedLayout.ptr.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SignedLayout.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

BOOL static ProtocolDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t ProtocolDescriptor.flags.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

uint64_t ProtocolDescriptor.name.getter()
{
  return ProtocolDescriptor.name.getter();
}

{
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return String.init(cString:)();
}

uint64_t ProtocolDescriptor.requirementSignature.getter(uint64_t a1)
{
  return a1 + 24;
}

uint64_t ProtocolDescriptor.requirements.getter(uint64_t a1)
{
  return a1 + 12 * *(unsigned int *)(a1 + 12) + 24;
}

uint64_t ProtocolDescriptor.associatedTypeNames.getter()
{
  return ProtocolDescriptor.name.getter();
}

uint64_t ProtocolRequirement.flags.getter(unsigned int *a1)
{
  return *a1;
}

void ProtocolDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ProtocolDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ProtocolDescriptor and conformance ProtocolDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ProtocolDescriptor and conformance ProtocolDescriptor;
  if (!lazy protocol witness table cache variable for type ProtocolDescriptor and conformance ProtocolDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ProtocolDescriptor, &type metadata for ProtocolDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProtocolDescriptor and conformance ProtocolDescriptor);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ProtocolRequirement and conformance ProtocolRequirement()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ProtocolRequirement and conformance ProtocolRequirement;
  if (!lazy protocol witness table cache variable for type ProtocolRequirement and conformance ProtocolRequirement)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ProtocolRequirement, &type metadata for ProtocolRequirement);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProtocolRequirement and conformance ProtocolRequirement);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProtocolDescriptor()
{
  return &type metadata for ProtocolDescriptor;
}

ValueMetadata *type metadata accessor for ProtocolRequirement()
{
  return &type metadata for ProtocolRequirement;
}

uint64_t ClassDescriptor.genericArgumentOffset.getter(_DWORD *a1)
{
  int v2;
  uint64_t v4;

  v2 = HIWORD(*a1);
  if ((v2 & 0x2000) != 0)
  {
    swift_getKeyPath();
    v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_release();
    return *(_QWORD *)((char *)a1 + v4 + *(int *)((char *)a1 + v4)) / 8;
  }
  else if ((v2 & 0x1000) != 0)
  {
    return -(uint64_t)a1[6];
  }
  else
  {
    return (a1[7] - a1[8]);
  }
}

uint64_t ClassDescriptor.fieldOffsetVectorOffset.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t ClassDescriptor.numberOfFields.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

_BYTE *ClassDescriptor.genericSignature.getter(char *a1)
{
  _BYTE *result;
  char v2;

  v2 = *a1;
  result = a1 + 52;
  if ((v2 & 0x80) == 0)
    return 0;
  return result;
}

uint64_t ClassDescriptor.resilientImmediateMembersOffset.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(_QWORD *)(a1 + v2 + *(int *)(a1 + v2));
}

uint64_t ClassDescriptor.nonResilientImmediateMembersOffset.getter(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 3) & 0x10) != 0)
    return -(uint64_t)*(unsigned int *)(a1 + 24);
  else
    return (*(_DWORD *)(a1 + 28) - *(_DWORD *)(a1 + 32));
}

BOOL static ClassDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ClassDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ClassDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ClassDescriptor and conformance ClassDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ClassDescriptor and conformance ClassDescriptor;
  if (!lazy protocol witness table cache variable for type ClassDescriptor and conformance ClassDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ClassDescriptor, &type metadata for ClassDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ClassDescriptor and conformance ClassDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClassDescriptor()
{
  return &type metadata for ClassDescriptor;
}

uint64_t AnonymousDescriptor.anonymousFlags.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

_BYTE *AnonymousDescriptor.genericSignature.getter(char *a1)
{
  _BYTE *result;
  char v2;

  v2 = *a1;
  result = a1 + 8;
  if ((v2 & 0x80) == 0)
    return 0;
  return result;
}

BOOL static AnonymousDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void AnonymousDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int AnonymousDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type AnonymousDescriptor and conformance AnonymousDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AnonymousDescriptor and conformance AnonymousDescriptor;
  if (!lazy protocol witness table cache variable for type AnonymousDescriptor and conformance AnonymousDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for AnonymousDescriptor, &type metadata for AnonymousDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnonymousDescriptor and conformance AnonymousDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnonymousDescriptor()
{
  return &type metadata for AnonymousDescriptor;
}

uint64_t TypeDescriptor.accessor.getter(uint64_t a1)
{
  return TypeDescriptor.accessor.getter(a1);
}

{
  uint64_t v2;
  int v4;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return a1 + v2 + v4;
}

uint64_t TypeDescriptor.flags.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

uint64_t TypeDescriptor.name.getter()
{
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return String.init(cString:)();
}

uint64_t TypeDescriptor.fields.getter(uint64_t a1)
{
  return TypeDescriptor.accessor.getter(a1);
}

uint64_t TypeDescriptor.sizeOfSelf.getter(_DWORD *a1)
{
  if ((*a1 & 0x1Fu) - 17 >= 2)
    return 44;
  else
    return 28;
}

BOOL static TypeDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void TypeDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int TypeDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type TypeDescriptor and conformance TypeDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TypeDescriptor and conformance TypeDescriptor;
  if (!lazy protocol witness table cache variable for type TypeDescriptor and conformance TypeDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for TypeDescriptor, &type metadata for TypeDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TypeDescriptor and conformance TypeDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeDescriptor()
{
  return &type metadata for TypeDescriptor;
}

uint64_t AnyExistentialContainer.storage.setter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  *v4 = result;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t (*AnyExistentialContainer.storage.modify())()
{
  return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
}

uint64_t AnyExistentialContainer.metadata.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a4;
}

uint64_t AnyExistentialContainer.init(metadata:)()
{
  return 0;
}

uint64_t AnyExistentialContainer.init(type:)()
{
  return 0;
}

uint64_t AnyExistentialContainer.allocateBox(_:)(uint64_t (*a1)(uint64_t *))
{
  uint64_t *v1;
  uint64_t *v3;
  uint64_t *v4;

  if ((*(_BYTE *)(*(_QWORD *)(v1[3] - 8) + 82) & 2) != 0)
  {
    *v1 = swift_allocBox();
    v3 = v4;
  }
  else
  {
    v3 = v1;
  }
  return a1(v3);
}

uint64_t _ss24withUnsafeMutablePointer2to_q0_xz_q0_SpyxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(uint64_t, char *);
  uint64_t result;
  uint64_t v17;

  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v15(v12, v14);
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  return result;
}

uint64_t AnyExistentialContainer.projectValue<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 24) - 8) + 80) & 0x20000) != 0)
  {
    v13 = a3;
    v14 = MEMORY[0x24BDAC7A8](a1);
    v15 = v9;
    v16 = v10;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v8 = partial apply for closure #2 in AnyExistentialContainer.projectValue<A>(_:);
  }
  else
  {
    v13 = a3;
    v14 = MEMORY[0x24BDAC7A8](a1);
    v15 = v6;
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v8 = partial apply for closure #1 in AnyExistentialContainer.projectValue<A>(_:);
  }
  return _ss24withUnsafeMutablePointer2to_q0_xz_q0_SpyxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(v4, (uint64_t)v8, (uint64_t)&v12, (uint64_t)&type metadata for AnyExistentialContainer, v7, a3, MEMORY[0x24BEE3F20], (uint64_t)&v17);
}

Swift::Void __swiftcall AnyExistentialContainer.deallocate()()
{
  uint64_t v0;

  if ((*(_BYTE *)(*(_QWORD *)(v0 - 8) + 82) & 2) != 0)
    swift_deallocBox();
}

__n128 ExistentialContainer.storage.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  v2 = *(_QWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_QWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(v1 + 24);
  *(__n128 *)(a1 + 24) = result;
  return result;
}

uint64_t ExistentialContainer.storage.setter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  *v5 = result;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  v5[4] = a5;
  return result;
}

uint64_t (*ExistentialContainer.storage.modify())()
{
  return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
}

uint64_t ExistentialContainer.base.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ExistentialContainer.witnessTable.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t partial apply for closure #2 in AnyExistentialContainer.projectValue<A>(_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v2 + 24))(*a1 + *(_QWORD *)(v2 + 40));
  if (v3)
    *a2 = v3;
  return result;
}

uint64_t partial apply for closure #1 in AnyExistentialContainer.projectValue<A>(_:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v2 + 24))();
  if (v3)
    *a2 = v3;
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AnyExistentialContainer(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 24))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyExistentialContainer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyExistentialContainer()
{
  return &type metadata for AnyExistentialContainer;
}

uint64_t initializeBufferWithCopyOfBuffer for ExistentialContainer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ExistentialContainer(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 24))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ExistentialContainer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ExistentialContainer()
{
  return &type metadata for ExistentialContainer;
}

uint64_t ContextDescriptor.flags.getter(unsigned int *a1)
{
  return *a1;
}

BOOL ContextDescriptor.isType.getter(_DWORD *a1)
{
  return (*a1 & 0x1Fu) - 16 < 3;
}

unint64_t ContextDescriptor.parent.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;

  if (!*(_DWORD *)(a1 + 4))
    return 0;
  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  v3 = *(int *)(a1 + v2);
  result = a1 + v2 + (v3 & 0xFFFFFFFFFFFFFFFELL);
  if ((v3 & 1) != 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t ContextDescriptor.sizeOfSelf.getter(_DWORD *a1)
{
  int v1;
  uint64_t result;

  v1 = *a1 & 0x1F;
  result = 12;
  switch(v1)
  {
    case 0:
    case 1:
      return result;
    case 2:
    case 4:
      result = 8;
      break;
    case 3:
      result = 24;
      break;
    case 16:
      result = 44;
      break;
    default:
      result = 28;
      break;
  }
  return result;
}

_DWORD *ContextDescriptor.genericSignature.getter(_DWORD *a1)
{
  _DWORD *result;

  if ((*a1 & 0x80) == 0)
    return 0;
  switch(*a1 & 0x1F)
  {
    case 0:
    case 1:
      result = a1 + 3;
      break;
    case 2:
    case 4:
      result = a1 + 2;
      break;
    case 3:
      result = a1 + 6;
      break;
    case 0x10:
      result = a1 + 11;
      break;
    default:
      result = a1 + 7;
      break;
  }
  return result;
}

BOOL static ContextDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ContextDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ContextDescriptor.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ContextDescriptor and conformance ContextDescriptor()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContextDescriptor and conformance ContextDescriptor;
  if (!lazy protocol witness table cache variable for type ContextDescriptor and conformance ContextDescriptor)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ContextDescriptor, &type metadata for ContextDescriptor);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContextDescriptor and conformance ContextDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextDescriptor()
{
  return &type metadata for ContextDescriptor;
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  BOOL v7;

  v4 = *(unsigned int *)(a4 + 12);
  if (v4 < result || v4 < a3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = a3 - result;
  if (a2 >= 1)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2)
      goto LABEL_13;
    return 0;
  }
  if (v6 <= 0 && v6 > a2)
    return 0;
LABEL_13:
  v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
    goto LABEL_16;
  if (result > v4)
LABEL_17:
    __break(1u);
  return result;
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v4 = *(_QWORD *)(a4 + 8);
  if (v4 < a3 || (a3 | result) < 0 || v4 < result)
  {
    __break(1u);
    goto LABEL_16;
  }
  v5 = a3 - result;
  if (a2 >= 1)
  {
    if (v5 < 0 || v5 >= a2)
      goto LABEL_11;
    return 0;
  }
  if (v5 <= 0 && v5 > a2)
    return 0;
LABEL_11:
  v6 = __OFADD__(result, a2);
  result += a2;
  if (v6)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (result < 0 || v4 < result)
    goto LABEL_17;
  return result;
}

_QWORD *specialized Sequence._copyContents(initializing:)(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a2)
    goto LABEL_9;
  if (!a3)
  {
LABEL_10:
    *result = a4;
    result[1] = a3;
    return (_QWORD *)a3;
  }
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *(_QWORD *)(a4 + 8);
  if (!v4)
  {
LABEL_9:
    a3 = 0;
    goto LABEL_10;
  }
  if (v4 < 1)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  *a2 = a4 + 24;
  a2[1] = 0;
  if (a3 == 1)
    goto LABEL_10;
  v5 = *(_QWORD *)(a4 + 8);
  if (v5 == 1)
  {
    a3 = 1;
    goto LABEL_10;
  }
  if (v5 >= 2)
  {
    a2[2] = a4 + 40;
    a2[3] = 1;
    if (a3 == 2)
      goto LABEL_10;
    v6 = *(_QWORD *)(a4 + 8);
    if (v6 == 2)
    {
      a3 = 2;
      goto LABEL_10;
    }
    v7 = a2 + 4;
    v8 = a4 + 56;
    v9 = 3;
    while (v9 - 1 < v6)
    {
      *v7 = v8;
      v7[1] = v9 - 1;
      if (a3 == v9)
        goto LABEL_10;
      v10 = v9 + 1;
      v6 = *(_QWORD *)(a4 + 8);
      v8 += 16;
      v7 += 2;
      if (v9++ == v6)
      {
        a3 = v10 - 1;
        goto LABEL_10;
      }
    }
    goto LABEL_23;
  }
LABEL_24:
  __break(1u);
  return result;
}

{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  if (!a2)
  {
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
    goto LABEL_9;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v4 = *(unsigned int *)(a4 + 12);
    if (!(_DWORD)v4)
    {
LABEL_7:
      a3 = v4;
      goto LABEL_9;
    }
    *a2 = a4 + 16;
    if (a3 != 1)
    {
      if ((_DWORD)v4 != 1)
      {
        a2[1] = a4 + 28;
        if (a3 == 2)
          goto LABEL_9;
        if ((_DWORD)v4 != 2)
        {
          v5 = a2 + 2;
          v6 = a3 - 3;
          if (a3 - 3 >= (unint64_t)(v4 - 3))
            v6 = v4 - 3;
          v7 = v6 + 1;
          if (v7 >= 3)
          {
            v10 = v7 & 1;
            if ((v7 & 1) == 0)
              v10 = 2;
            v11 = v7 - v10;
            v9 = v7 - v10 + 3;
            v8 = v11 + 2;
            v5 += v11;
            v12 = a4 + 52;
            v13 = a2 + 3;
            do
            {
              *(v13 - 1) = v12 - 12;
              *v13 = v12;
              v12 += 24;
              v13 += 2;
              v11 -= 2;
            }
            while (v11);
          }
          else
          {
            v8 = 2;
            v9 = 3;
          }
          while (1)
          {
            *v5 = a4 + 16 + 12 * v8;
            if (a3 == v9)
              goto LABEL_9;
            v8 = v9;
            ++v5;
            if (v4 + 1 == ++v9)
              goto LABEL_7;
          }
        }
      }
      goto LABEL_7;
    }
LABEL_9:
    *result = a4;
    result[1] = a3;
    return (_QWORD *)a3;
  }
  __break(1u);
  return result;
}

unint64_t TupleMetadata.Elements.Element.label.getter(unint64_t result, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];

  if (__OFSUB__(0, 16 * a2))
  {
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  if (!*(_QWORD *)(result - 16 * a2 - 8))
    return 0;
  result = String.init(cString:)();
  v4 = a2 + 1;
  if (__OFADD__(a2, 1))
    goto LABEL_66;
  if (v4 < 0)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v5 = result;
  v6 = v3;
  if (a2 != -1)
  {
    v7 = 0;
    v8 = (result >> 59) & 1;
    if ((v3 & 0x1000000000000000) == 0)
      LODWORD(v8) = 1;
    v9 = 4 << v8;
    if ((v3 & 0x2000000000000000) != 0)
      v10 = HIBYTE(v3) & 0xF;
    else
      v10 = result & 0xFFFFFFFFFFFFLL;
    v11 = (_DWORD)v8 == 0;
    v12 = 11;
    if (!v11)
      v12 = 7;
    v13 = 4 * v10;
    v14 = v12 & 0xC;
    v40 = v3 & 0xFFFFFFFFFFFFFFLL;
    v15 = 15;
    v16 = 15;
    v17 = v12 | (v10 << 16);
    v37 = v14;
    v38 = v17;
    v39 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
    v36 = v4;
    while (1)
    {
      if (v7 == v4)
        goto LABEL_62;
      if (v7)
      {
        if ((v15 & 0xC) == v9)
        {
          v26 = v4;
          result = _StringGuts._slowEnsureMatchingEncoding(_:)(v15, v5, v6);
          v14 = v37;
          v13 = 4 * v10;
          v4 = v26;
          v15 = result;
          v17 = v38;
          if ((v6 & 0x1000000000000000) == 0)
          {
LABEL_20:
            v16 = (v15 & 0xFFFFFFFFFFFF0000) + 65540;
            goto LABEL_21;
          }
        }
        else if ((v6 & 0x1000000000000000) == 0)
        {
          goto LABEL_20;
        }
        if (v10 <= v15 >> 16)
          goto LABEL_69;
        v27 = v4;
        result = String.UTF8View._foreignIndex(after:)();
        v16 = result;
        v4 = v27;
        v14 = v37;
        v13 = 4 * v10;
        v17 = v38;
      }
LABEL_21:
      v18 = v16 >> 14;
      if (v13 < v16 >> 14)
        goto LABEL_63;
      v19 = v17;
      if (v14 == v9)
      {
        v24 = v4;
        result = _StringGuts._slowEnsureMatchingEncoding(_:)(v38, v5, v6);
        v14 = v37;
        v13 = 4 * v10;
        v4 = v24;
        v19 = result;
        v17 = v38;
      }
      v15 = v16;
      if ((v16 & 0xC) == v9)
      {
        v25 = v4;
        result = _StringGuts._slowEnsureMatchingEncoding(_:)(v16, v5, v6);
        v14 = v37;
        v13 = 4 * v10;
        v4 = v25;
        v15 = result;
        v17 = v38;
        v18 = result >> 14;
      }
      v20 = v19 >> 14;
      if (v13 < v19 >> 14 || v20 < v18)
      {
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      if (v18 != v20)
      {
        swift_bridgeObjectRetain();
        result = Substring.UTF8View.subscript.getter();
        while (1)
        {
          if (result == 32)
            goto LABEL_51;
          if ((v15 & 0xC) == v9)
          {
            result = _StringGuts._slowEnsureMatchingEncoding(_:)(v15, v5, v6);
            v15 = result;
            if ((v6 & 0x1000000000000000) == 0)
            {
LABEL_34:
              v15 = (v15 & 0xFFFFFFFFFFFF0000) + 65540;
              goto LABEL_38;
            }
          }
          else if ((v6 & 0x1000000000000000) == 0)
          {
            goto LABEL_34;
          }
          if (v10 <= v15 >> 16)
            goto LABEL_61;
          result = String.UTF8View._foreignIndex(after:)();
          v15 = result;
LABEL_38:
          v21 = v15 >> 14;
          if (v15 >> 14 == v20)
          {
            v15 = 0;
LABEL_51:
            result = swift_bridgeObjectRelease();
            v4 = v36;
            v14 = v37;
            v13 = 4 * v10;
            v17 = v38;
            goto LABEL_15;
          }
          v22 = v15;
          if ((v15 & 0xC) == v9)
          {
            result = _StringGuts._slowEnsureMatchingEncoding(_:)(v15, v5, v6);
            v22 = result;
            v21 = result >> 14;
            if (result >> 14 < v18)
            {
LABEL_60:
              __break(1u);
LABEL_61:
              __break(1u);
LABEL_62:
              __break(1u);
LABEL_63:
              __break(1u);
              goto LABEL_64;
            }
          }
          else if (v21 < v18)
          {
            goto LABEL_60;
          }
          if (v21 >= v20)
            goto LABEL_60;
          if ((v6 & 0x1000000000000000) != 0)
          {
            result = String.UTF8View._foreignSubscript(position:)();
          }
          else if ((v6 & 0x2000000000000000) != 0)
          {
            v41[0] = v5;
            v41[1] = v40;
            result = *((unsigned __int8 *)v41 + (v22 >> 16));
          }
          else
          {
            v23 = v39;
            if ((v5 & 0x1000000000000000) == 0)
              v23 = _StringObject.sharedUTF8.getter();
            result = *(unsigned __int8 *)(v23 + (v22 >> 16));
          }
        }
      }
      v15 = 0;
LABEL_15:
      if (++v7 == v4)
        goto LABEL_57;
    }
  }
  v15 = 15;
  v16 = 15;
LABEL_57:
  if (v15 >> 14 >= v16 >> 14)
  {
    v29 = String.subscript.getter();
    v31 = v30;
    v33 = v32;
    v35 = v34;
    swift_bridgeObjectRelease();
    v28 = MEMORY[0x249535494](v29, v31, v33, v35);
    swift_bridgeObjectRelease();
    return v28;
  }
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
  return result;
}

uint64_t TupleMetadata.Elements.Element.metadata.getter(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t TupleMetadata.Elements.Element.offset.getter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t TupleMetadata.Elements.startIndex.getter()
{
  return 0;
}

uint64_t TupleMetadata.Elements.endIndex.getter(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

Swift::Int __swiftcall TupleMetadata.Elements.index(after:)(Swift::Int after)
{
  return after + 1;
}

Swift::Int __swiftcall TupleMetadata.Elements.index(before:)(Swift::Int before)
{
  return before - 1;
}

uint64_t TupleMetadata.Elements.subscript.getter(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(a2 + 8) > result)
  {
    return a2 + 16 * result + 24;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.endIndex.getter in conformance TupleMetadata.Elements(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 8);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance TupleMetadata.Elements(uint64_t (*result)(), uint64_t *a2))()
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  if (*a2 < 0)
  {
    __break(1u);
  }
  else if (v3 < *(_QWORD *)(*(_QWORD *)v2 + 8))
  {
    *(_QWORD *)result = *(_QWORD *)v2 + 16 * v3 + 24;
    *((_QWORD *)result + 1) = v3;
    return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for Collection.subscript.getter in conformance TupleMetadata.Elements@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 8);
  if (v4 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v5 = result[1];
  if (v4 >= v5)
  {
    *a2 = *result;
    a2[1] = v5;
    a2[2] = v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance TupleMetadata.Elements(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 8);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = v2;
  }
}

BOOL protocol witness for Collection.isEmpty.getter in conformance TupleMetadata.Elements()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 8) == 0;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance TupleMetadata.Elements@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0 && *(_QWORD *)(*(_QWORD *)v3 + 8) >= v4)
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance TupleMetadata.Elements@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t result;
  char v7;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance TupleMetadata.Elements(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 8);
  if (v4 >= *a2)
  {
    v5 = *result;
    if (((v3 | *result) & 0x8000000000000000) == 0 && v4 >= v5)
      return (uint64_t *)(v3 - v5);
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.count.getter in conformance TupleMetadata.Elements()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)v0 + 8);
  if (result < 0)
    __break(1u);
  return result;
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance TupleMetadata.Elements()
{
  _QWORD **v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance TupleMetadata.Elements(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3);
}

BOOL static TupleMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void TupleMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int TupleMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = String.UTF16View.index(_:offsetBy:)();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2495354B8](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unint64_t lazy protocol witness table accessor for type TupleMetadata.Elements and conformance TupleMetadata.Elements()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements;
  if (!lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for TupleMetadata.Elements, &type metadata for TupleMetadata.Elements);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements;
  if (!lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for TupleMetadata.Elements, &type metadata for TupleMetadata.Elements);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements;
  if (!lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for TupleMetadata.Elements, &type metadata for TupleMetadata.Elements);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements;
  if (!lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for TupleMetadata.Elements, &type metadata for TupleMetadata.Elements);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in TupleMetadata.Elements()
{
  return lazy protocol witness table accessor for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>, (uint64_t (*)(void))lazy protocol witness table accessor for type TupleMetadata.Elements and conformance TupleMetadata.Elements, MEMORY[0x24BEE4230]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in TupleMetadata.Elements()
{
  return lazy protocol witness table accessor for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>, (uint64_t (*)(void))lazy protocol witness table accessor for type TupleMetadata.Elements and conformance TupleMetadata.Elements, MEMORY[0x24BEE4218]);
}

uint64_t lazy protocol witness table accessor for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<TupleMetadata.Elements>);
    v8 = a2();
    result = MEMORY[0x24953577C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in TupleMetadata.Elements()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<TupleMetadata.Elements> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<TupleMetadata.Elements>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in TupleMetadata.Elements()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<TupleMetadata.Elements> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<TupleMetadata.Elements>, MEMORY[0x24BEE2C18]);
}

unint64_t lazy protocol witness table accessor for type TupleMetadata and conformance TupleMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TupleMetadata and conformance TupleMetadata;
  if (!lazy protocol witness table cache variable for type TupleMetadata and conformance TupleMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for TupleMetadata, &type metadata for TupleMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata and conformance TupleMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for TupleMetadata()
{
  return &type metadata for TupleMetadata;
}

ValueMetadata *type metadata accessor for TupleMetadata.Elements()
{
  return &type metadata for TupleMetadata.Elements;
}

ValueMetadata *type metadata accessor for TupleMetadata.Elements.Element()
{
  return &type metadata for TupleMetadata.Elements.Element;
}

uint64_t GenericSignature.numberOfParameters.getter(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t GenericSignature.numberOfRequirements.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

uint64_t GenericSignature.numberOfKeyArguments.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 4);
}

uint64_t GenericSignature.flags.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 6);
}

uint64_t GenericSignature.parameters.getter(uint64_t a1)
{
  return a1 + 8;
}

uint64_t GenericSignature.requirementStart.getter(unsigned __int16 *a1)
{
  return (uint64_t)a1 + (-*a1 & 3) + *a1 + 8;
}

uint64_t GenericSignature.requirements.getter(unsigned __int16 *a1)
{
  return (uint64_t)a1 + (-*a1 & 3) + *a1 + 8;
}

uint64_t GenericSignature.packShapeHeaderStart.getter(unsigned __int16 *a1)
{
  return (uint64_t)&a1[6 * a1[1] + 4] + (-*a1 & 3) + *a1;
}

uint64_t GenericSignature.packShapesStart.getter(unsigned __int16 *a1)
{
  return (uint64_t)&a1[6 * a1[1] + 6] + (-*a1 & 3) + *a1;
}

uint64_t GenericSignature.packShapes.getter(unsigned __int16 *a1)
{
  if ((a1[3] & 1) != 0)
    return (uint64_t)&a1[6 * a1[1] + 6] + (-*a1 & 3) + *a1;
  else
    return 0;
}

uint64_t GenericSignature.PackShapeHeader.numberOfPacks.getter(uint64_t result)
{
  return (unsigned __int16)result;
}

uint64_t GenericSignature.RequirementDescriptor.flags.getter(unsigned int *a1)
{
  return *a1;
}

uint64_t GenericSignature.RequirementDescriptor.parameter.getter(uint64_t a1)
{
  uint64_t v2;
  int v4;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return a1 + v2 + v4;
}

unint64_t GenericSignature.RequirementDescriptor.protocol.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t result;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  v3 = *(int *)(a1 + v2);
  result = a1 + v2 + (v3 & 0xFFFFFFFFFFFFFFFCLL);
  if ((v3 & 1) != 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t GenericSignature.RequirementDescriptor.sameType.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return a1 + v2 + *(int *)(a1 + v2);
}

uint64_t GenericSignature.RequirementDescriptor.layoutKind.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(unsigned int *)(a1 + v2);
}

uint64_t GenericSignature.RequirementDescriptor.baseClass.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return a1 + v2 + *(int *)(a1 + v2);
}

uint64_t GenericSignature.RequirementDescriptor.parameterType(in:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;

  swift_getKeyPath();
  v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  swift_getKeyPath();
  v7 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  v8 = MangledTypeReference.length.getter((_BYTE *)(a3 + v7 + v10));
  return MEMORY[0x249535758](a3 + v6 + v10, v8, a1, a2);
}

uint64_t GenericSignature.RequirementDescriptor.checkProtocolConformance(in:with:)(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  if ((*a3 & 0x1F) != 0)
    return 0;
  result = GenericSignature.RequirementDescriptor.parameterType(in:with:)(a1, a2, (uint64_t)a3);
  if (result)
  {
    swift_getKeyPath();
    dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_release();
    return swift_conformsToProtocol();
  }
  return result;
}

uint64_t GenericSignature.RequirementDescriptor.checkSameType(in:with:)(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  if ((*a3 & 0x1F) != 1)
    return 0;
  v6 = GenericSignature.RequirementDescriptor.parameterType(in:with:)(a1, a2, (uint64_t)a3);
  if (!v6)
    return 1;
  v7 = v6;
  swift_getKeyPath();
  v8 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  v9 = (_DWORD *)((char *)a3 + v8);
  v10 = *v9;
  swift_getKeyPath();
  v11 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  result = MangledTypeReference.length.getter((_BYTE *)a3 + v11 + *(int *)((char *)a3 + v11));
  if ((result & 0x8000000000000000) == 0)
  {
    v13 = MEMORY[0x249535758]((char *)v9 + v10, result, a1, a2);
    if (v13)
      return v7 == v13;
    return 1;
  }
  __break(1u);
  return result;
}

uint64_t GenericSignature.RequirementDescriptor.checkLayout(in:with:)(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  if ((~*a3 & 0x1F) != 0)
    return 0;
  result = GenericSignature.RequirementDescriptor.parameterType(in:with:)(a1, a2, (uint64_t)a3);
  if (result)
  {
    v5 = (uint64_t *)result;
    swift_getKeyPath();
    v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_release();
    if (*(_DWORD *)((char *)a3 + v6))
      return 0;
    v7 = *v5;
    result = 1;
    if ((unint64_t)*v5 <= 0x7FF && (unint64_t)(v7 - 515) >= 2 && v7 && v7 != 773)
      return 0;
  }
  return result;
}

uint64_t GenericSignature.RequirementDescriptor.checkBaseClass(in:with:)(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  if ((*a3 & 0x1F) != 2)
    return 0;
  v6 = (uint64_t *)GenericSignature.RequirementDescriptor.parameterType(in:with:)(a1, a2, (uint64_t)a3);
  if (!v6)
    return 0;
  v7 = *v6;
  if ((unint64_t)*v6 <= 0x7FF && (unint64_t)(v7 - 515) >= 2 && v7 != 773 && v7)
    return 0;
  swift_getKeyPath();
  v8 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  v9 = (_DWORD *)((char *)a3 + v8);
  v10 = *v9;
  swift_getKeyPath();
  v11 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  result = MangledTypeReference.length.getter((_BYTE *)a3 + v11 + *(int *)((char *)a3 + v11));
  if ((result & 0x8000000000000000) == 0)
  {
    if (MEMORY[0x249535758]((char *)v9 + v10, result, a1, a2))
      return _swift_class_isSubclass();
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t GenericSignature.PackShapeHeader.numberOfShapeClasses.getter(unsigned int a1)
{
  return HIWORD(a1);
}

uint64_t GenericSignature.PackShapeDescriptor.index.getter(int a1)
{
  return HIWORD(a1);
}

uint64_t GenericSignature.PackShapeDescriptor.shapeClass.getter(uint64_t a1)
{
  return WORD2(a1);
}

ValueMetadata *type metadata accessor for GenericSignature()
{
  return &type metadata for GenericSignature;
}

ValueMetadata *type metadata accessor for GenericSignature.RequirementDescriptor()
{
  return &type metadata for GenericSignature.RequirementDescriptor;
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GenericSignature.PackShapeHeader(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for GenericSignature.PackShapeHeader(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GenericSignature.PackShapeHeader()
{
  return &type metadata for GenericSignature.PackShapeHeader;
}

_QWORD *__swift_memcpy8_2(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GenericSignature.PackShapeDescriptor(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for GenericSignature.PackShapeDescriptor(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GenericSignature.PackShapeDescriptor()
{
  return &type metadata for GenericSignature.PackShapeDescriptor;
}

uint64_t static Metadata.Kind.struct.getter()
{
  return 512;
}

uint64_t static Metadata.Kind.enum.getter()
{
  return 513;
}

uint64_t static Metadata.Kind.optional.getter()
{
  return 514;
}

uint64_t static FunctionMetadata.DifferentiableKind.nonDifferentiable.getter()
{
  return 0;
}

uint64_t static Metadata.Kind.class.getter()
{
  return 0;
}

uint64_t static Metadata.Kind.objcClassWrapper.getter()
{
  return 773;
}

uint64_t static Metadata.Kind.foreignClass.getter()
{
  return 515;
}

uint64_t static Metadata.Kind.foreignReferenceType.getter()
{
  return 516;
}

uint64_t static Metadata.Request.complete.getter()
{
  return 0;
}

BOOL ValueWitnessTable.Flags.isValueInline.getter(int a1)
{
  return (a1 & 0x20000) == 0;
}

uint64_t ValueWitnessTable.Flags.alignmentMask.getter(uint64_t result)
{
  return result;
}

uint64_t static Metadata.Kind.isRuntimePrivate.getter()
{
  return 256;
}

uint64_t static Metadata.Kind.isNonHeap.getter()
{
  return 512;
}

uint64_t static Metadata.Kind.isNonType.getter()
{
  return 1024;
}

uint64_t static Metadata.Kind.opaque.getter()
{
  return 768;
}

uint64_t static Metadata.Kind.function.getter()
{
  return 770;
}

uint64_t static Metadata.Kind.existential.getter()
{
  return 771;
}

uint64_t static Metadata.Kind.metatype.getter()
{
  return 772;
}

uint64_t static Metadata.Kind.existentialMetatype.getter()
{
  return 774;
}

uint64_t static Metadata.Kind.extendedExistential.getter()
{
  return 775;
}

uint64_t static Metadata.Kind.heapLocalVariable.getter()
{
  return 1024;
}

uint64_t static Metadata.Kind.heapGenericLocalVariable.getter()
{
  return 1280;
}

uint64_t static Metadata.Kind.errorObject.getter()
{
  return 1281;
}

uint64_t static Metadata.Kind.task.getter()
{
  return 1282;
}

uint64_t static Metadata.Kind.job.getter()
{
  return 1283;
}

BOOL static Metadata.Kind.== infix(_:_:)(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  if (a2 >= 0x800)
    v2 = 0;
  else
    v2 = a2;
  if (a1 >= 0x800)
    v3 = 0;
  else
    v3 = a1;
  return v3 == v2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Metadata.Kind(unint64_t *a1, uint64_t *a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  if ((unint64_t)*a2 >= 0x800)
    v3 = 0;
  if (v2 >= 0x800)
    v2 = 0;
  return v2 == v3;
}

void Metadata.Kind.hash(into:)(uint64_t a1, unint64_t a2)
{
  Swift::UInt v2;

  if (a2 >= 0x800)
    v2 = 0;
  else
    v2 = a2;
  Hasher._combine(_:)(v2);
}

Swift::Int Metadata.Kind.hashValue.getter(unint64_t a1)
{
  Swift::UInt v2;

  Hasher.init(_seed:)();
  if (a1 >= 0x800)
    v2 = 0;
  else
    v2 = a1;
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Metadata.Kind()
{
  unint64_t *v0;
  unint64_t v1;
  Swift::UInt v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  if (v1 >= 0x800)
    v2 = 0;
  else
    v2 = v1;
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Metadata.Kind()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  if (*v0 >= 0x800)
    v1 = 0;
  else
    v1 = *v0;
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Metadata.Kind()
{
  unint64_t *v0;
  unint64_t v1;
  Swift::UInt v2;

  v1 = *v0;
  Hasher.init(_seed:)();
  if (v1 >= 0x800)
    v2 = 0;
  else
    v2 = v1;
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t Metadata.Kind.description.getter(uint64_t a1)
{
  unint64_t result;

  result = 0x7373616C63;
  if ((unint64_t)a1 <= 0x7FF)
  {
    if (a1 <= 767)
    {
      switch(a1)
      {
        case 512:
          result = 0x746375727473;
          break;
        case 513:
          result = 1836412517;
          break;
        case 514:
          result = 0x6C616E6F6974706FLL;
          break;
        case 515:
          result = 0x436E676965726F66;
          break;
        case 516:
          result = 0xD000000000000014;
          break;
        default:
          if (a1)
LABEL_27:
            result = 0x6E776F6E6B6E75;
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 768:
          result = 0x65757161706FLL;
          break;
        case 769:
          result = 0x656C707574;
          break;
        case 770:
          result = 0x6E6F6974636E7566;
          break;
        case 771:
          result = 0x746E657473697865;
          break;
        case 772:
          result = 0x657079746174656DLL;
          break;
        case 773:
          result = 0xD000000000000010;
          break;
        case 774:
        case 775:
          result = 0xD000000000000013;
          break;
        default:
          switch(a1)
          {
            case 1280:
              result = 0xD000000000000018;
              break;
            case 1281:
              result = 0x6A624F726F727265;
              break;
            case 1282:
              result = 1802723700;
              break;
            case 1283:
              result = 6451050;
              break;
            default:
              if (a1 != 1024)
                goto LABEL_27;
              result = 0xD000000000000011;
              break;
          }
          break;
      }
    }
  }
  return result;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance Metadata.Kind()
{
  uint64_t *v0;

  return Metadata.Kind.description.getter(*v0);
}

uint64_t static Metadata.Request.isNonBlockingMask.getter()
{
  return 256;
}

uint64_t Metadata.Request.init(state:isBlocking:)(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return result & 0x100;
  return result;
}

uint64_t static Metadata.State.complete.getter()
{
  return 0;
}

uint64_t static Metadata.State.nonTransitiveComplete.getter()
{
  return 1;
}

uint64_t static Metadata.State.layoutComplete.getter()
{
  return 63;
}

uint64_t static Metadata.State.abstract.getter()
{
  return 255;
}

uint64_t static FunctionMetadata.Convention.swift.getter()
{
  return 0;
}

uint64_t static FunctionMetadata.Convention.block.getter()
{
  return 1;
}

uint64_t static FunctionMetadata.Convention.thin.getter()
{
  return 2;
}

uint64_t static FunctionMetadata.Convention.c.getter()
{
  return 3;
}

BOOL static FunctionMetadata.Convention.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void FunctionMetadata.Convention.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

uint64_t FunctionMetadata.Convention.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0x7466697773;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x6B636F6C62;
      break;
    case 2:
      result = 1852401780;
      break;
    case 3:
      result = 99;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FunctionMetadata.Convention()
{
  _QWORD *v0;
  uint64_t result;

  result = 0x7466697773;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      result = 0x6B636F6C62;
      break;
    case 2:
      result = 1852401780;
      break;
    case 3:
      result = 99;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t static FunctionMetadata.DifferentiableKind.forward.getter()
{
  return 1;
}

uint64_t static FunctionMetadata.DifferentiableKind.reverse.getter()
{
  return 2;
}

uint64_t static FunctionMetadata.DifferentiableKind.normal.getter()
{
  return 3;
}

uint64_t static FunctionMetadata.DifferentiableKind.linear.getter()
{
  return 4;
}

unint64_t FunctionMetadata.DifferentiableKind.description.getter(uint64_t a1)
{
  unint64_t result;

  result = 0xD000000000000011;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x64726177726F66;
      break;
    case 2:
      result = 0x65737265766572;
      break;
    case 3:
      result = 0x6C616D726F6ELL;
      break;
    case 4:
      result = 0x7261656E696CLL;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance FunctionMetadata.DifferentiableKind()
{
  uint64_t *v0;

  return FunctionMetadata.DifferentiableKind.description.getter(*v0);
}

uint64_t static ValueWitnessTable.Flags.alignmentMaskMask.getter()
{
  return 255;
}

uint64_t static ValueWitnessTable.Flags.isNonPODMask.getter()
{
  return 0x10000;
}

uint64_t static ValueWitnessTable.Flags.isNonInlineMask.getter()
{
  return 0x20000;
}

uint64_t static ValueWitnessTable.Flags.hasSpareBitsMask.getter()
{
  return 0x80000;
}

uint64_t static ValueWitnessTable.Flags.isNonBitwiseTakableMask.getter()
{
  return 0x100000;
}

uint64_t static ValueWitnessTable.Flags.hasEnumWitnessesMask.getter()
{
  return 0x200000;
}

uint64_t static ValueWitnessTable.Flags.isIncompleteMask.getter()
{
  return 0x400000;
}

uint64_t ValueWitnessTable.Flags.alignment.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL ValueWitnessTable.Flags.isPOD.getter(int a1)
{
  return (a1 & 0x10000) == 0;
}

uint64_t ValueWitnessTable.Flags.hasSpareBits.getter(unsigned int a1)
{
  return (a1 >> 19) & 1;
}

BOOL ValueWitnessTable.Flags.isBitwiseTakable.getter(int a1)
{
  return (a1 & 0x100000) == 0;
}

uint64_t ValueWitnessTable.Flags.hasEnumWitnesses.getter(unsigned int a1)
{
  return (a1 >> 21) & 1;
}

uint64_t ValueWitnessTable.Flags.isIncomplete.getter(unsigned int a1)
{
  return (a1 >> 22) & 1;
}

unint64_t lazy protocol witness table accessor for type Metadata.Kind and conformance Metadata.Kind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Metadata.Kind and conformance Metadata.Kind;
  if (!lazy protocol witness table cache variable for type Metadata.Kind and conformance Metadata.Kind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for Metadata.Kind, &type metadata for Metadata.Kind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Metadata.Kind and conformance Metadata.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FunctionMetadata.Convention and conformance FunctionMetadata.Convention()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FunctionMetadata.Convention and conformance FunctionMetadata.Convention;
  if (!lazy protocol witness table cache variable for type FunctionMetadata.Convention and conformance FunctionMetadata.Convention)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for FunctionMetadata.Convention, &type metadata for FunctionMetadata.Convention);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionMetadata.Convention and conformance FunctionMetadata.Convention);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FunctionMetadata.DifferentiableKind and conformance FunctionMetadata.DifferentiableKind()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FunctionMetadata.DifferentiableKind and conformance FunctionMetadata.DifferentiableKind;
  if (!lazy protocol witness table cache variable for type FunctionMetadata.DifferentiableKind and conformance FunctionMetadata.DifferentiableKind)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for FunctionMetadata.DifferentiableKind, &type metadata for FunctionMetadata.DifferentiableKind);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionMetadata.DifferentiableKind and conformance FunctionMetadata.DifferentiableKind);
  }
  return result;
}

ValueMetadata *type metadata accessor for Metadata.Kind()
{
  return &type metadata for Metadata.Kind;
}

ValueMetadata *type metadata accessor for Metadata.Request()
{
  return &type metadata for Metadata.Request;
}

ValueMetadata *type metadata accessor for Metadata.Response()
{
  return &type metadata for Metadata.Response;
}

ValueMetadata *type metadata accessor for Metadata.State()
{
  return &type metadata for Metadata.State;
}

ValueMetadata *type metadata accessor for FunctionMetadata.Convention()
{
  return &type metadata for FunctionMetadata.Convention;
}

ValueMetadata *type metadata accessor for FunctionMetadata.DifferentiableKind()
{
  return &type metadata for FunctionMetadata.DifferentiableKind;
}

ValueMetadata *type metadata accessor for ValueWitnessTable.Flags()
{
  return &type metadata for ValueWitnessTable.Flags;
}

ValueMetadata *type metadata accessor for FunctionMetadata.Flags()
{
  return &type metadata for FunctionMetadata.Flags;
}

ValueMetadata *type metadata accessor for ExistentialMetadata.Flags()
{
  return &type metadata for ExistentialMetadata.Flags;
}

uint64_t ForeignReferenceTypeMetadata.descriptor.getter(uint64_t a1)
{
  uint64_t v2;

  swift_getKeyPath();
  v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(_QWORD *)(a1 + v2);
}

BOOL static ForeignReferenceTypeMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ForeignReferenceTypeMetadata.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int ForeignReferenceTypeMetadata.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ForeignReferenceTypeMetadata and conformance ForeignReferenceTypeMetadata()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ForeignReferenceTypeMetadata and conformance ForeignReferenceTypeMetadata;
  if (!lazy protocol witness table cache variable for type ForeignReferenceTypeMetadata and conformance ForeignReferenceTypeMetadata)
  {
    result = MEMORY[0x24953577C](&protocol conformance descriptor for ForeignReferenceTypeMetadata, &type metadata for ForeignReferenceTypeMetadata);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ForeignReferenceTypeMetadata and conformance ForeignReferenceTypeMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ForeignReferenceTypeMetadata()
{
  return &type metadata for ForeignReferenceTypeMetadata;
}

uint64_t UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(a4, a2 + a1, a3);
}

uint64_t RelativePointer.pointee(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((*(unsigned int (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3))
  {
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 24))(a1, a2, a3);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(0, v8, AssociatedTypeWitness, a4);
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56);
    v11 = a4;
    v12 = 0;
    v13 = AssociatedTypeWitness;
  }
  else
  {
    v13 = swift_getAssociatedTypeWitness();
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
    v11 = a4;
    v12 = 1;
  }
  return v10(v11, v12, 1, v13);
}

BOOL RelativePointer.isNull.getter(uint64_t a1, uint64_t a2)
{
  return (*(unsigned int (**)(void))(a2 + 16))() == 0;
}

uint64_t dispatch thunk of RelativePointer.offset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RelativePointer.address(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of RelativePointer.pointee(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void `anonymous namespace'::addImageCallback<&`anonymous namespace'::TextSegment,&`anonymous namespace'::ProtocolConformancesSection,(_dyld_section_location_kind)1,&(addImageProtocolConformanceBlockCallbackUnsafe)>()
{
  __assert_rtn("addImageCallback", "ImageInspection.h", 90, "mh->magic == MH_MAGIC_64 && \"loaded non-64-bit image?!\"");
}

Swift::Void __swiftcall Dictionary.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE0298](a1);
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t type metadata accessor for UnsafePointer()
{
  return MEMORY[0x24BEE0960]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t RandomAccessCollection.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x24BEE1870]();
}

uint64_t RandomAccessCollection<>.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE1888]();
}

uint64_t RandomAccessCollection<>.indices.getter()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t RandomAccessCollection<>.distance(from:to:)()
{
  return MEMORY[0x24BEE1898]();
}

uint64_t Collection.underestimatedCount.getter()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t Collection<>.subscript.getter()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t Substring.UTF8View.subscript.getter()
{
  return MEMORY[0x24BEE1DE8]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t dispatch thunk of AnyKeyPath._storedInlineOffset.getter()
{
  return MEMORY[0x24BEE20D0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _copyCollectionToContiguousArray<A>(_:)()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
  MEMORY[0x24BEE4300](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
  MEMORY[0x24BEE4308](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x24BEE4310](*(_QWORD *)&a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _dyld_lookup_section_info()
{
  return MEMORY[0x24BDACA90]();
}

uint64_t _swift_class_isSubclass()
{
  return MEMORY[0x24BEE4B10]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t objc_addLoadImageFunc2()
{
  return MEMORY[0x24BEDCF60]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_conformsToProtocol()
{
  return MEMORY[0x24BEE4BE8]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x24BEE4BF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getTypeByMangledNameInContext()
{
  return MEMORY[0x24BEE4E08]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

