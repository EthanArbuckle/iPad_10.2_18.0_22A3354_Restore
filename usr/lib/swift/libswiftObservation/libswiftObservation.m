uint64_t _ManagedCriticalState.LockedBuffer.__deallocating_deinit()
{
  MEMORY[0x24BD2E3B4]();
  return swift_deallocClassInstance();
}

void protocol witness for Identifiable.id.getter in conformance _ManagedCriticalState<A>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t ObservationRegistrar.ValueObservationStorage.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t ObservationRegistrar.State.registerTracking(for:willSet:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *@<X8>);
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t result;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  v4 = v3;
  v8 = (*v3)++;
  swift_bridgeObjectRetain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v44 = v3[1];
  v3[1] = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2, a3, 0, a1, v8, isUniquelyReferenced_nonNull_native);
  v3[1] = v44;
  swift_bridgeObjectRelease();
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for AnyKeyPath();
    Set.Iterator.init(_cocoa:)();
    a1 = v44;
    v42 = v45;
    v10 = v46;
    v11 = v47;
    v12 = v48;
  }
  else
  {
    v13 = -1 << *(_BYTE *)(a1 + 32);
    v42 = a1 + 56;
    v14 = ~v13;
    v15 = -v13;
    if (v15 < 64)
      v16 = ~(-1 << v15);
    else
      v16 = -1;
    v12 = v16 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v10 = v14;
    v11 = 0;
  }
  v17 = 0;
  v41 = (unint64_t)(v10 + 64) >> 6;
  while (1)
  {
    if (a1 < 0)
    {
      if (!__CocoaSet.Iterator.next()())
        goto LABEL_43;
      type metadata accessor for AnyKeyPath();
      swift_dynamicCast();
      v21 = v43;
      v20 = v11;
      v18 = v12;
      if (!v43)
        goto LABEL_43;
    }
    else
    {
      if (v12)
      {
        v18 = (v12 - 1) & v12;
        v19 = __clz(__rbit64(v12)) | (v11 << 6);
        v20 = v11;
      }
      else
      {
        v22 = v11 + 1;
        if (__OFADD__(v11, 1))
          goto LABEL_46;
        if (v22 >= v41)
          goto LABEL_43;
        v23 = *(_QWORD *)(v42 + 8 * v22);
        v20 = v11 + 1;
        if (!v23)
        {
          v20 = v11 + 2;
          if (v11 + 2 >= v41)
            goto LABEL_43;
          v23 = *(_QWORD *)(v42 + 8 * v20);
          if (!v23)
          {
            v20 = v11 + 3;
            if (v11 + 3 >= v41)
              goto LABEL_43;
            v23 = *(_QWORD *)(v42 + 8 * v20);
            if (!v23)
            {
              v20 = v11 + 4;
              if (v11 + 4 >= v41)
                goto LABEL_43;
              v23 = *(_QWORD *)(v42 + 8 * v20);
              if (!v23)
              {
                v24 = v11 + 5;
                while (v41 != v24)
                {
                  v23 = *(_QWORD *)(v42 + 8 * v24++);
                  if (v23)
                  {
                    v20 = v24 - 1;
                    goto LABEL_29;
                  }
                }
LABEL_43:
                outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
                outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?((uint64_t)v17);
                return v8;
              }
            }
          }
        }
LABEL_29:
        v18 = (v23 - 1) & v23;
        v19 = __clz(__rbit64(v23)) + (v20 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v19);
      swift_retain();
      if (!v21)
        goto LABEL_43;
    }
    outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?((uint64_t)v17);
    v25 = swift_isUniquelyReferenced_nonNull_native();
    v43 = v4[2];
    v26 = v43;
    v4[2] = 0x8000000000000000;
    v28 = specialized __RawDictionaryStorage.find<A>(_:)(v21);
    v29 = *(_QWORD *)(v26 + 16);
    v30 = (v27 & 1) == 0;
    v31 = v29 + v30;
    if (__OFADD__(v29, v30))
      break;
    v32 = v27;
    if (*(_QWORD *)(v26 + 24) >= v31)
    {
      if ((v25 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        v26 = v43;
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v31, v25);
      type metadata accessor for AnyKeyPath();
      v26 = v43;
      v33 = specialized __RawDictionaryStorage.find<A>(_:)(v21);
      if ((v32 & 1) != (v34 & 1))
        goto LABEL_47;
      v28 = v33;
    }
    v4[2] = v26;
    swift_bridgeObjectRelease();
    v35 = (_QWORD *)v4[2];
    if ((v32 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_release();
    }
    else
    {
      v35[(v28 >> 6) + 8] |= 1 << v28;
      v36 = 8 * v28;
      *(_QWORD *)(v35[6] + v36) = v21;
      *(_QWORD *)(v35[7] + v36) = MEMORY[0x24BEE4B08];
      v37 = v35[2];
      v38 = v37 + 1;
      v39 = __OFADD__(v37, 1);
      swift_bridgeObjectRetain();
      if (v39)
        goto LABEL_45;
      v35[2] = v38;
    }
    swift_bridgeObjectRelease();
    specialized Set._Variant.insert(_:)(&v43, v8);
    v17 = specialized thunk for @callee_guaranteed () -> (@owned Set<Int>);
    v11 = v20;
    v12 = v18;
  }
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void specialized thunk for @callee_guaranteed () -> (@owned Set<Int>)(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4B08];
}

uint64_t ObservationRegistrar.State.registerTracking(for:didSet:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *@<X8>);
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t result;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  v4 = v3;
  v8 = (*v3)++;
  swift_bridgeObjectRetain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v44 = v3[1];
  v3[1] = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2, a3, 1, a1, v8, isUniquelyReferenced_nonNull_native);
  v3[1] = v44;
  swift_bridgeObjectRelease();
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for AnyKeyPath();
    Set.Iterator.init(_cocoa:)();
    a1 = v44;
    v42 = v45;
    v10 = v46;
    v11 = v47;
    v12 = v48;
  }
  else
  {
    v13 = -1 << *(_BYTE *)(a1 + 32);
    v42 = a1 + 56;
    v14 = ~v13;
    v15 = -v13;
    if (v15 < 64)
      v16 = ~(-1 << v15);
    else
      v16 = -1;
    v12 = v16 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v10 = v14;
    v11 = 0;
  }
  v17 = 0;
  v41 = (unint64_t)(v10 + 64) >> 6;
  while (1)
  {
    if (a1 < 0)
    {
      if (!__CocoaSet.Iterator.next()())
        goto LABEL_43;
      type metadata accessor for AnyKeyPath();
      swift_dynamicCast();
      v21 = v43;
      v20 = v11;
      v18 = v12;
      if (!v43)
        goto LABEL_43;
    }
    else
    {
      if (v12)
      {
        v18 = (v12 - 1) & v12;
        v19 = __clz(__rbit64(v12)) | (v11 << 6);
        v20 = v11;
      }
      else
      {
        v22 = v11 + 1;
        if (__OFADD__(v11, 1))
          goto LABEL_46;
        if (v22 >= v41)
          goto LABEL_43;
        v23 = *(_QWORD *)(v42 + 8 * v22);
        v20 = v11 + 1;
        if (!v23)
        {
          v20 = v11 + 2;
          if (v11 + 2 >= v41)
            goto LABEL_43;
          v23 = *(_QWORD *)(v42 + 8 * v20);
          if (!v23)
          {
            v20 = v11 + 3;
            if (v11 + 3 >= v41)
              goto LABEL_43;
            v23 = *(_QWORD *)(v42 + 8 * v20);
            if (!v23)
            {
              v20 = v11 + 4;
              if (v11 + 4 >= v41)
                goto LABEL_43;
              v23 = *(_QWORD *)(v42 + 8 * v20);
              if (!v23)
              {
                v24 = v11 + 5;
                while (v41 != v24)
                {
                  v23 = *(_QWORD *)(v42 + 8 * v24++);
                  if (v23)
                  {
                    v20 = v24 - 1;
                    goto LABEL_29;
                  }
                }
LABEL_43:
                outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
                outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?((uint64_t)v17);
                return v8;
              }
            }
          }
        }
LABEL_29:
        v18 = (v23 - 1) & v23;
        v19 = __clz(__rbit64(v23)) + (v20 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v19);
      swift_retain();
      if (!v21)
        goto LABEL_43;
    }
    outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?((uint64_t)v17);
    v25 = swift_isUniquelyReferenced_nonNull_native();
    v43 = v4[2];
    v26 = v43;
    v4[2] = 0x8000000000000000;
    v28 = specialized __RawDictionaryStorage.find<A>(_:)(v21);
    v29 = *(_QWORD *)(v26 + 16);
    v30 = (v27 & 1) == 0;
    v31 = v29 + v30;
    if (__OFADD__(v29, v30))
      break;
    v32 = v27;
    if (*(_QWORD *)(v26 + 24) >= v31)
    {
      if ((v25 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        v26 = v43;
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v31, v25);
      type metadata accessor for AnyKeyPath();
      v26 = v43;
      v33 = specialized __RawDictionaryStorage.find<A>(_:)(v21);
      if ((v32 & 1) != (v34 & 1))
        goto LABEL_47;
      v28 = v33;
    }
    v4[2] = v26;
    swift_bridgeObjectRelease();
    v35 = (_QWORD *)v4[2];
    if ((v32 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_release();
    }
    else
    {
      v35[(v28 >> 6) + 8] |= 1 << v28;
      v36 = 8 * v28;
      *(_QWORD *)(v35[6] + v36) = v21;
      *(_QWORD *)(v35[7] + v36) = MEMORY[0x24BEE4B08];
      v37 = v35[2];
      v38 = v37 + 1;
      v39 = __OFADD__(v37, 1);
      swift_bridgeObjectRetain();
      if (v39)
        goto LABEL_45;
      v35[2] = v38;
    }
    swift_bridgeObjectRelease();
    specialized Set._Variant.insert(_:)(&v43, v8);
    v17 = specialized thunk for @callee_guaranteed () -> (@owned Set<Int>);
    v11 = v20;
    v12 = v18;
  }
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

unint64_t ObservationRegistrar.State.cancel(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t result;
  char v4;
  uint64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  int v29;
  uint64_t v30;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  v2 = v1;
  result = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  if ((v4 & 1) == 0)
    return result;
  v5 = result;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = v1[1];
  v35 = v7;
  v1[1] = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
LABEL_54:
    specialized _NativeDictionary.copy()();
    v7 = v35;
  }
  v8 = *(_QWORD *)(v7 + 56) + 32 * v5;
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_BYTE *)(v8 + 16);
  v12 = *(_QWORD *)(v8 + 24);
  specialized _NativeDictionary._delete(at:)(v5, v7);
  v2[1] = v7;
  swift_bridgeObjectRelease();
  if ((v12 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v5 = __CocoaSet.makeIterator()();
    type metadata accessor for AnyKeyPath();
    Set.Iterator.init(_cocoa:)();
    outlined consume of ObservationRegistrar.State.ObservationKind(v9, v10, v11);
    swift_bridgeObjectRelease();
    v12 = v35;
    v33 = v36;
    v13 = v37;
    v14 = v38;
    v15 = v39;
  }
  else
  {
    outlined consume of ObservationRegistrar.State.ObservationKind(v9, v10, v11);
    v14 = 0;
    v16 = -1 << *(_BYTE *)(v12 + 32);
    v33 = v12 + 56;
    v13 = ~v16;
    v17 = -v16;
    if (v17 < 64)
      v18 = ~(-1 << v17);
    else
      v18 = -1;
    v15 = v18 & *(_QWORD *)(v12 + 56);
  }
  v32 = (unint64_t)(v13 + 64) >> 6;
  v2 += 2;
  v30 = v12;
  while (1)
  {
    if (v12 < 0)
    {
      if (!__CocoaSet.Iterator.next()())
        return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
      type metadata accessor for AnyKeyPath();
      swift_dynamicCast();
      v22 = v34;
      v21 = v14;
      v19 = v15;
      if (!v34)
        return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
      goto LABEL_32;
    }
    if (v15)
    {
      v19 = (v15 - 1) & v15;
      v20 = __clz(__rbit64(v15)) | (v14 << 6);
      v21 = v14;
      goto LABEL_31;
    }
    v23 = v14 + 1;
    if (__OFADD__(v14, 1))
      goto LABEL_53;
    if (v23 >= v32)
      return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
    v24 = *(_QWORD *)(v33 + 8 * v23);
    v21 = v14 + 1;
    if (!v24)
    {
      v21 = v14 + 2;
      if (v14 + 2 >= v32)
        return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
      v24 = *(_QWORD *)(v33 + 8 * v21);
      if (!v24)
      {
        v21 = v14 + 3;
        if (v14 + 3 >= v32)
          return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
        v24 = *(_QWORD *)(v33 + 8 * v21);
        if (!v24)
        {
          v21 = v14 + 4;
          if (v14 + 4 >= v32)
            return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
          v24 = *(_QWORD *)(v33 + 8 * v21);
          if (!v24)
            break;
        }
      }
    }
LABEL_30:
    v19 = (v24 - 1) & v24;
    v20 = __clz(__rbit64(v24)) + (v21 << 6);
LABEL_31:
    v22 = *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * v20);
    swift_retain();
    if (!v22)
      return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
LABEL_32:
    v26 = *v2;
    if (*(_QWORD *)(*v2 + 16))
    {
      v5 = specialized __RawDictionaryStorage.find<A>(_:)(v22);
      v28 = v27;
      swift_release();
      v14 = v21;
      v15 = v19;
      if ((v28 & 1) != 0)
      {
        v29 = *(_DWORD *)(v26 + 36);
        *v2 = 0x8000000000000000;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v34 = v26;
          specialized _NativeDictionary.copy()();
          v26 = v34;
          swift_bridgeObjectRelease();
        }
        if (v5 < 0 || v5 >= 1 << *(_BYTE *)(v26 + 32))
        {
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        if ((*(_QWORD *)(v26 + 64 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0)
          goto LABEL_48;
        if (v29 != *(_DWORD *)(v26 + 36))
          goto LABEL_49;
        specialized Set._Variant.remove(_:)(a1);
        *v2 = v26;
        if (v5 >= 1 << *(_BYTE *)(v26 + 32))
          goto LABEL_50;
        if ((*(_QWORD *)(v26 + 64 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0)
          goto LABEL_51;
        if (v29 != *(_DWORD *)(v26 + 36))
          goto LABEL_52;
        v14 = v21;
        v15 = v19;
        v12 = v30;
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v26 + 56) + 8 * v5) + 16))
        {
          specialized Dictionary._Variant.remove(at:)(&v34, v5, v29, 0);
          swift_release();
          swift_bridgeObjectRelease();
          v14 = v21;
          v15 = v19;
        }
      }
    }
    else
    {
      swift_release();
      v14 = v21;
      v15 = v19;
    }
  }
  v25 = v14 + 5;
  while (v32 != v25)
  {
    v24 = *(_QWORD *)(v33 + 8 * v25++);
    if (v24)
    {
      v21 = v25 - 1;
      goto LABEL_30;
    }
  }
  return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
}

void ObservationRegistrar.Context.didSet<A, B>(_:keyPath:)(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  int64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  os_unfair_lock_s *v56;
  unint64_t v57;
  int64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  int64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  int64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  _QWORD *v71;
  void (*v72)(uint64_t *);
  uint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  void (*v76)(uint64_t *);
  uint64_t v77;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  os_unfair_lock_t v84;
  uint64_t v85;
  int64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92[3];
  uint64_t v93;

  v85 = 0;
  v6 = *a2;
  v7 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + *a2 + 8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v82 = (char *)&v79 - v9;
  v84 = v10 + 10;
  _swift_observation_lock_lock(v10 + 10);
  v11 = *(_QWORD *)(*(_QWORD *)(a3 + 32) + 16);
  v88 = a2;
  if (v11 && (v12 = *(_QWORD *)(a3 + 24), specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2), (v13 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = swift_bridgeObjectRetain();
    v15 = v85;
    v16 = specialized _NativeSet.filter(_:)(v14, v12);
    v85 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = MEMORY[0x24BEE4B08];
  }
  v91 = v16;
  v17 = *(_QWORD *)(a3 + 32);
  v18 = *(_QWORD *)(v17 + 16);
  v80 = v8;
  v81 = v7;
  if (!v18 || (v19 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v88), (v20 & 1) == 0))
  {
    v28 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v56 = v84;
    if (v85)
      goto LABEL_80;
    goto LABEL_44;
  }
  v89 = v6;
  v90 = a1;
  v83 = a3 + 16;
  v21 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v19);
  v22 = v21 + 56;
  v23 = 1 << *(_BYTE *)(v21 + 32);
  v24 = -1;
  if (v23 < 64)
    v24 = ~(-1 << v23);
  v25 = v24 & *(_QWORD *)(v21 + 56);
  v26 = (unint64_t)(v23 + 63) >> 6;
  swift_bridgeObjectRetain();
  v27 = 0;
  v28 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v86 = v26;
  v87 = v21 + 56;
  while (v25)
  {
    v30 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    v31 = v30 | (v27 << 6);
LABEL_23:
    v35 = *(_QWORD *)(*(_QWORD *)(v21 + 48) + 8 * v31);
    v36 = *(_QWORD *)(a3 + 24);
    if (*(_QWORD *)(v36 + 16))
    {
      v37 = specialized __RawDictionaryStorage.find<A>(_:)(v35);
      if ((v38 & 1) != 0)
      {
        v39 = *(_QWORD *)(v36 + 56) + 32 * v37;
        if (*(_BYTE *)(v39 + 16) == 2)
        {
          v40 = *(_QWORD *)v39;
          v41 = *(_QWORD *)(v39 + 8);
          v42 = swift_allocObject();
          *(_QWORD *)(v42 + 16) = v40;
          *(_QWORD *)(v42 + 24) = v41;
          outlined copy of ObservationRegistrar.State.ObservationKind(v40, v41, 2u);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v29[2] + 1, 1, v29, (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
          v44 = v29[2];
          v43 = v29[3];
          if (v44 >= v43 >> 1)
            v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v43 > 1), v44 + 1, 1, v29, (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
          v29[2] = v44 + 1;
          v45 = &v29[2 * v44];
          v45[4] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any) -> ();
          v45[5] = v42;
          ObservationRegistrar.State.cancel(_:)(v35);
          v26 = v86;
          v22 = v87;
        }
      }
    }
    v46 = *(_QWORD *)(a3 + 24);
    if (*(_QWORD *)(v46 + 16))
    {
      v47 = specialized __RawDictionaryStorage.find<A>(_:)(v35);
      if ((v48 & 1) != 0)
      {
        v49 = *(_QWORD *)(v46 + 56) + 32 * v47;
        if (*(_BYTE *)(v49 + 16) == 1)
        {
          v51 = *(_QWORD *)v49;
          v50 = *(_QWORD *)(v49 + 8);
          v52 = swift_allocObject();
          *(_QWORD *)(v52 + 16) = v51;
          *(_QWORD *)(v52 + 24) = v50;
          outlined copy of ObservationRegistrar.State.ObservationKind(v51, v50, 1u);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v28[2] + 1, 1, v28, (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
          v54 = v28[2];
          v53 = v28[3];
          v26 = v86;
          if (v54 >= v53 >> 1)
            v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v53 > 1), v54 + 1, 1, v28, (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
          v28[2] = v54 + 1;
          v55 = &v28[2 * v54];
          v55[4] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed AnyKeyPath) -> ();
          v55[5] = v52;
          v22 = v87;
        }
      }
    }
  }
  v32 = __OFADD__(v27++, 1);
  if (v32)
    goto LABEL_84;
  if (v27 >= v26)
  {
    v6 = v89;
    a1 = v90;
    goto LABEL_79;
  }
  v33 = *(_QWORD *)(v22 + 8 * v27);
  v6 = v89;
  a1 = v90;
  if (v33)
  {
LABEL_22:
    v25 = (v33 - 1) & v33;
    v31 = __clz(__rbit64(v33)) + (v27 << 6);
    goto LABEL_23;
  }
  v34 = v27 + 1;
  if (v27 + 1 >= v26)
    goto LABEL_79;
  v33 = *(_QWORD *)(v22 + 8 * v34);
  if (v33)
    goto LABEL_21;
  v34 = v27 + 2;
  if (v27 + 2 >= v26)
    goto LABEL_79;
  v33 = *(_QWORD *)(v22 + 8 * v34);
  if (v33)
    goto LABEL_21;
  v34 = v27 + 3;
  if (v27 + 3 >= v26)
    goto LABEL_79;
  v33 = *(_QWORD *)(v22 + 8 * v34);
  if (v33)
  {
LABEL_21:
    v27 = v34;
    goto LABEL_22;
  }
  while (1)
  {
    v27 = v34 + 1;
    if (__OFADD__(v34, 1))
      goto LABEL_86;
    if (v27 >= v26)
      break;
    v33 = *(_QWORD *)(v22 + 8 * v27);
    ++v34;
    if (v33)
      goto LABEL_22;
  }
LABEL_79:
  v56 = v84;
  swift_release();
  if (v85)
  {
LABEL_80:
    MEMORY[0x24BD2E51C](v85);
    _swift_observation_lock_unlock(v56);
    __break(1u);
    goto LABEL_81;
  }
LABEL_44:
  _swift_observation_lock_unlock(v56);
  if (!*(_QWORD *)(v91 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_69:
    v68 = v28[2];
    v69 = (uint64_t)v88;
    if (v68)
    {
      v70 = 0;
      v71 = v28 + 5;
      while (v70 < v68)
      {
        ++v70;
        v72 = (void (*)(uint64_t *))*(v71 - 1);
        v92[0] = v69;
        swift_retain();
        v72(v92);
        swift_release();
        v68 = v28[2];
        v71 += 2;
        if (v70 == v68)
          goto LABEL_73;
      }
LABEL_81:
      __break(1u);
    }
    else
    {
LABEL_73:
      swift_bridgeObjectRelease();
      v73 = v29[2];
      if (!v73)
      {
LABEL_77:
        swift_bridgeObjectRelease();
        return;
      }
      v74 = 0;
      v75 = v29 + 5;
      while (v74 < v29[2])
      {
        ++v74;
        v76 = (void (*)(uint64_t *))*(v75 - 1);
        v93 = *(_QWORD *)(v6 + *MEMORY[0x24BEE46A8]);
        v77 = v93;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v92);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 16))(boxed_opaque_existential_0, a1, v77);
        swift_retain();
        v76(v92);
        swift_release();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v92);
        v75 += 2;
        if (v73 == v74)
          goto LABEL_77;
      }
    }
    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  swift_getAtKeyPath();
  _swift_observation_lock_lock(v56);
  v57 = v91;
  v58 = 0;
  v59 = v91 + 56;
  v60 = 1 << *(_BYTE *)(v91 + 32);
  v61 = -1;
  if (v60 < 64)
    v61 = ~(-1 << v60);
  v62 = v61 & *(_QWORD *)(v91 + 56);
  v63 = (unint64_t)(v60 + 63) >> 6;
  while (2)
  {
    if (v62)
    {
      v64 = __clz(__rbit64(v62));
      v62 &= v62 - 1;
      v65 = v64 | (v58 << 6);
      goto LABEL_61;
    }
    v32 = __OFADD__(v58++, 1);
    if (v32)
      goto LABEL_83;
    if (v58 >= v63)
    {
LABEL_67:
      swift_bridgeObjectRelease();
      _swift_observation_lock_unlock(v84);
      (*(void (**)(char *, uint64_t))(v80 + 8))(v82, v81);
      goto LABEL_69;
    }
    v66 = *(_QWORD *)(v59 + 8 * v58);
    if (v66)
    {
LABEL_60:
      v62 = (v66 - 1) & v66;
      v65 = __clz(__rbit64(v66)) + (v58 << 6);
LABEL_61:
      if (*(_QWORD *)(*(_QWORD *)(a3 + 24) + 16))
      {
        specialized __RawDictionaryStorage.find<A>(_:)(*(_QWORD *)(*(_QWORD *)(v57 + 48) + 8 * v65));
        v57 = v91;
      }
      continue;
    }
    break;
  }
  v67 = v58 + 1;
  if (v58 + 1 >= v63)
    goto LABEL_67;
  v66 = *(_QWORD *)(v59 + 8 * v67);
  if (v66)
    goto LABEL_59;
  v67 = v58 + 2;
  if (v58 + 2 >= v63)
    goto LABEL_67;
  v66 = *(_QWORD *)(v59 + 8 * v67);
  if (v66)
    goto LABEL_59;
  v67 = v58 + 3;
  if (v58 + 3 >= v63)
    goto LABEL_67;
  v66 = *(_QWORD *)(v59 + 8 * v67);
  if (v66)
  {
LABEL_59:
    v58 = v67;
    goto LABEL_60;
  }
  while (1)
  {
    v58 = v67 + 1;
    if (__OFADD__(v67, 1))
      break;
    if (v58 >= v63)
      goto LABEL_67;
    v66 = *(_QWORD *)(v59 + 8 * v58);
    ++v67;
    if (v66)
      goto LABEL_60;
  }
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
}

uint64_t ObservationRegistrar.Extent.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 16);
  _swift_observation_lock_lock((os_unfair_lock_t)(v1 + 40));
  v2 = 0;
  result = *(_QWORD *)(v1 + 24);
  v4 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (!v7)
    {
      v9 = v2 + 1;
      if (__OFADD__(v2, 1))
      {
        __break(1u);
        goto LABEL_23;
      }
      if (v9 >= v8)
        goto LABEL_21;
      v7 = *(_QWORD *)(v4 + 8 * v9);
      ++v2;
      if (!v7)
      {
        v2 = v9 + 1;
        if (v9 + 1 >= v8)
          goto LABEL_21;
        v7 = *(_QWORD *)(v4 + 8 * v2);
        if (!v7)
        {
          v2 = v9 + 2;
          if (v9 + 2 >= v8)
            goto LABEL_21;
          v7 = *(_QWORD *)(v4 + 8 * v2);
          if (!v7)
          {
            v2 = v9 + 3;
            if (v9 + 3 >= v8)
              goto LABEL_21;
            v7 = *(_QWORD *)(v4 + 8 * v2);
            if (!v7)
            {
              v10 = v9 + 4;
              if (v10 >= v8)
              {
LABEL_21:
                swift_release();
                v11 = MEMORY[0x24BEE4B00];
                *(_QWORD *)(v1 + 24) = MEMORY[0x24BEE4B00];
                swift_bridgeObjectRelease();
                *(_QWORD *)(v1 + 32) = v11;
                _swift_observation_lock_unlock((os_unfair_lock_t)(v1 + 40));
                swift_release();
                return swift_deallocClassInstance();
              }
              v7 = *(_QWORD *)(v4 + 8 * v10);
              v2 = v10;
              if (!v7)
                break;
            }
          }
        }
      }
    }
LABEL_4:
    v7 &= v7 - 1;
  }
  while (1)
  {
    v2 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v2 >= v8)
      goto LABEL_21;
    v7 = *(_QWORD *)(v4 + 8 * v2);
    ++v10;
    if (v7)
      goto LABEL_4;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t ObservationRegistrar.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for ObservationRegistrar.Extent();
  v2 = swift_allocObject();
  result = _swift_observation_lock_size();
  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationRegistrar.State>.LockedBuffer);
    v4 = swift_allocObject();
    result = (uint64_t)_swift_observation_lock_init((_DWORD *)(v4 + 40));
    v5 = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)(v4 + 24) = v5;
    *(_QWORD *)(v4 + 32) = v5;
    *(_QWORD *)(v2 + 16) = v4;
    *a1 = v2;
  }
  return result;
}

uint64_t type metadata accessor for ObservationRegistrar.Extent()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD2E54C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *ObservationRegistrar.access<A, B>(_:keyPath:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  v4 = *v2;
  result = (_QWORD *)_swift_observation_tls_get();
  if (result)
  {
    if (!*result)
      *result = MEMORY[0x24BEE4B00];
    v6 = *(_QWORD *)(v4 + 16);
    swift_retain();
    ObservationTracking._AccessList.addAccess<A>(keyPath:context:)(a2, v6);
    return (_QWORD *)swift_release();
  }
  return result;
}

uint64_t ObservationTracking._AccessList.addAccess<A>(keyPath:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  char v3;
  uint64_t *v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;

  v4 = v2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = *v2;
  v23 = v8;
  *v4 = 0x8000000000000000;
  v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_13;
  }
  v3 = v9;
  if (*(_QWORD *)(v8 + 24) >= v13)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_6;
LABEL_13:
    specialized _NativeDictionary.copy()();
    v8 = v23;
    goto LABEL_6;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v13, isUniquelyReferenced_nonNull_native);
  v8 = v23;
  v14 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  if ((v3 & 1) != (v15 & 1))
    goto LABEL_17;
  v10 = v14;
LABEL_6:
  *v4 = v8;
  swift_bridgeObjectRelease();
  v16 = (_QWORD *)*v4;
  swift_bridgeObjectRetain();
  if ((v3 & 1) != 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_retain();
    specialized Set._Variant.insert(_:)(&v23, a1);
    return swift_release();
  }
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter())
    v17 = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x24BEE4AF8]);
  else
    v17 = MEMORY[0x24BEE4B08];
  v16[(v10 >> 6) + 8] |= 1 << v10;
  *(_QWORD *)(v16[6] + 8 * v10) = a2;
  v18 = (uint64_t *)(v16[7] + 16 * v10);
  *v18 = a2;
  v18[1] = v17;
  v19 = v16[2];
  v20 = __OFADD__(v19, 1);
  v21 = v19 + 1;
  if (!v20)
  {
    v16[2] = v21;
    swift_retain();
    goto LABEL_11;
  }
  __break(1u);
LABEL_17:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)(uint64_t a1, uint64_t a2)
{
  return specialized ObservationRegistrar.willSet<A, B>(_:keyPath:)(a2);
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  swift_retain();
  ObservationRegistrar.Context.didSet<A, B>(_:keyPath:)(a1, a2, v5);
  return swift_release();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(uint64_t a1, _QWORD *a2, void (*a3)(uint64_t))
{
  uint64_t v6;

  v6 = specialized ObservationRegistrar.willSet<A, B>(_:keyPath:)((uint64_t)a2);
  a3(v6);
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)(a1, a2);
}

uint64_t ObservationRegistrar.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  type metadata accessor for ObservationRegistrar.Extent();
  v3 = swift_allocObject();
  result = _swift_observation_lock_size();
  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationRegistrar.State>.LockedBuffer);
    v5 = swift_allocObject();
    result = (uint64_t)_swift_observation_lock_init((_DWORD *)(v5 + 40));
    v6 = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v5 + 16) = 0;
    *(_QWORD *)(v5 + 24) = v6;
    *(_QWORD *)(v5 + 32) = v6;
    *(_QWORD *)(v3 + 16) = v5;
    *a2 = v3;
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance ObservationRegistrar@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  type metadata accessor for ObservationRegistrar.Extent();
  v3 = swift_allocObject();
  result = _swift_observation_lock_size();
  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationRegistrar.State>.LockedBuffer);
    v5 = swift_allocObject();
    result = (uint64_t)_swift_observation_lock_init((_DWORD *)(v5 + 40));
    v6 = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v5 + 16) = 0;
    *(_QWORD *)(v5 + 24) = v6;
    *(_QWORD *)(v5 + 32) = v6;
    *(_QWORD *)(v3 + 16) = v5;
    *a2 = v3;
  }
  return result;
}

uint64_t static ObservationRegistrar.== infix(_:_:)()
{
  return 1;
}

Swift::Int ObservationRegistrar.hashValue.getter()
{
  Hasher.init(_seed:)();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ObservationRegistrar()
{
  Hasher.init(_seed:)();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ObservationRegistrar()
{
  Hasher.init(_seed:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ObservationRegistrar()
{
  return 1;
}

uint64_t specialized Set.union<A>(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v2 = result;
  v19 = a2;
  if ((result & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    type metadata accessor for AnyKeyPath();
    result = Set.Iterator.init(_cocoa:)();
    v2 = v20;
    v17 = v21;
    v3 = v22;
    v4 = v23;
    v5 = v24;
  }
  else
  {
    v4 = 0;
    v6 = -1 << *(_BYTE *)(result + 32);
    v17 = result + 56;
    v3 = ~v6;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v5 = v8 & *(_QWORD *)(result + 56);
  }
  v9 = (unint64_t)(v3 + 64) >> 6;
  if (v2 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v4 << 6);
      v12 = v4;
      goto LABEL_29;
    }
    v14 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    if (v14 >= v9)
      goto LABEL_32;
    v15 = *(_QWORD *)(v17 + 8 * v14);
    v12 = v4 + 1;
    if (!v15)
    {
      v12 = v4 + 2;
      if (v4 + 2 >= v9)
        goto LABEL_32;
      v15 = *(_QWORD *)(v17 + 8 * v12);
      if (!v15)
      {
        v12 = v4 + 3;
        if (v4 + 3 >= v9)
          goto LABEL_32;
        v15 = *(_QWORD *)(v17 + 8 * v12);
        if (!v15)
        {
          v12 = v4 + 4;
          if (v4 + 4 >= v9)
            goto LABEL_32;
          v15 = *(_QWORD *)(v17 + 8 * v12);
          if (!v15)
          {
            v12 = v4 + 5;
            if (v4 + 5 >= v9)
              goto LABEL_32;
            v15 = *(_QWORD *)(v17 + 8 * v12);
            if (!v15)
            {
              v16 = v4 + 6;
              while (v9 != v16)
              {
                v15 = *(_QWORD *)(v17 + 8 * v16++);
                if (v15)
                {
                  v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
              return v19;
            }
          }
        }
      }
    }
LABEL_28:
    v10 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    v13 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v11);
    swift_retain();
    if (!v13)
      goto LABEL_32;
    while (1)
    {
      specialized Set._Variant.insert(_:)(&v18, v13);
      result = swift_release();
      v4 = v12;
      v5 = v10;
      if ((v2 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        type metadata accessor for AnyKeyPath();
        swift_dynamicCast();
        v13 = v18;
        v12 = v4;
        v10 = v5;
        if (v18)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
  return result;
}

void static ObservationTracking._installTracking(_:willSet:didSet:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = *a1;
  v10 = a1[1];
  outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
  outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
  swift_retain();
  v11 = swift_bridgeObjectRetain();
  v12 = specialized _NativeDictionary.mapValues<A>(_:)(v11, a2, a3, a4, a5, v9, v10);
  swift_bridgeObjectRelease();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
  _swift_observation_lock_lock((os_unfair_lock_t)(v9 + 40));
  if (*(_BYTE *)(v9 + 24) == 1)
  {
    swift_release();
  }
  else
  {
    *(_QWORD *)(v9 + 16) = v12;
    swift_bridgeObjectRelease();
  }
  _swift_observation_lock_unlock((os_unfair_lock_t)(v9 + 40));
}

void closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)(os_unfair_lock_s **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  os_unfair_lock_s *v13;
  _QWORD *v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v13 = *a1;
  if (a2)
  {
    v25 = (uint64_t)a1[1];
    if (a4)
    {
      v16 = (_QWORD *)swift_allocObject();
      v16[2] = a6;
      v16[3] = a7;
      v16[4] = a2;
      v16[5] = a3;
      v17 = v13 + 10;
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
      swift_retain();
      swift_bridgeObjectRetain();
      _swift_observation_lock_lock(v17);
      v18 = ObservationRegistrar.State.registerTracking(for:willSet:)(v25, (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v16);
      swift_release();
      _swift_observation_lock_unlock(v17);
      v19 = (_QWORD *)swift_allocObject();
      v19[2] = a6;
      v19[3] = a7;
      v19[4] = a4;
      v19[5] = a5;
      swift_retain();
      swift_bridgeObjectRetain();
      _swift_observation_lock_lock(v17);
      v20 = ObservationRegistrar.State.registerTracking(for:didSet:)(v25, (uint64_t)partial apply for closure #2 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v19);
      v21 = 2;
    }
    else
    {
      v24 = (_QWORD *)swift_allocObject();
      v24[2] = a6;
      v24[3] = a7;
      v24[4] = a2;
      v24[5] = a3;
      v17 = v13 + 10;
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
      swift_retain();
      swift_bridgeObjectRetain();
      _swift_observation_lock_lock(v17);
      v18 = ObservationRegistrar.State.registerTracking(for:willSet:)(v25, (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v24);
      v20 = 0;
      v21 = 0;
    }
    goto LABEL_7;
  }
  if (a4)
  {
    v22 = (uint64_t)a1[1];
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = a6;
    v23[3] = a7;
    v23[4] = a4;
    v23[5] = a5;
    v17 = v13 + 10;
    outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
    swift_retain();
    swift_bridgeObjectRetain();
    _swift_observation_lock_lock(v17);
    v18 = ObservationRegistrar.State.registerTracking(for:didSet:)(v22, (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v23);
    v20 = 0;
    v21 = 1;
LABEL_7:
    swift_release();
    _swift_observation_lock_unlock(v17);
    *(_QWORD *)a8 = v18;
    *(_QWORD *)(a8 + 8) = v20;
    *(_BYTE *)(a8 + 16) = v21;
    return;
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t closure #1 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD *))
{
  os_unfair_lock_s *v8;
  _QWORD v10[2];

  v8 = (os_unfair_lock_s *)(a2 + 40);
  _swift_observation_lock_lock((os_unfair_lock_t)(a2 + 40));
  *(_QWORD *)(a2 + 32) = a1;
  swift_retain();
  swift_release();
  _swift_observation_lock_unlock(v8);
  v10[0] = a2;
  v10[1] = a3;
  return a4(v10);
}

uint64_t ObservationTracking.init(_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  result = _swift_observation_lock_size();
  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    v5 = swift_allocObject();
    result = (uint64_t)_swift_observation_lock_init((_DWORD *)(v5 + 40));
    v6 = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v5 + 16) = MEMORY[0x24BEE4B00];
    *(_BYTE *)(v5 + 24) = 0;
    *(_QWORD *)(v5 + 32) = 0;
    if (v3)
      v6 = v3;
    *a2 = v5;
    a2[1] = v6;
  }
  return result;
}

Swift::Void __swiftcall ObservationTracking.cancel()()
{
  os_unfair_lock_s **v0;
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  os_unfair_lock_s *v24;
  os_unfair_lock_s *v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  int64_t v29;

  v2 = *v0;
  v1 = v0[1];
  v3 = *v0 + 10;
  _swift_observation_lock_lock(v3);
  LOBYTE(v2[6]._os_unfair_lock_opaque) = 1;
  v4 = *(_QWORD *)&v2[4]._os_unfair_lock_opaque;
  *(_QWORD *)&v2[4]._os_unfair_lock_opaque = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  _swift_observation_lock_unlock(v3);
  v5 = 0;
  v6 = v4 + 64;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(v4 + 64);
  v29 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v5 << 6);
      goto LABEL_21;
    }
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v5 << 6);
LABEL_21:
    v17 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13);
    v18 = *(_QWORD *)(v4 + 56) + 24 * v13;
    v19 = *(_QWORD *)v18;
    if (*(_BYTE *)(v18 + 16) && *(_BYTE *)(v18 + 16) != 1)
    {
      if (*(_QWORD *)&v1[4]._os_unfair_lock_opaque)
      {
        v28 = *(_QWORD *)(v18 + 8);
        v22 = specialized __RawDictionaryStorage.find<A>(_:)(v17);
        if ((v23 & 1) != 0)
        {
          v24 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)&v1[14]._os_unfair_lock_opaque + 16 * v22) + 40);
          swift_retain();
          swift_bridgeObjectRetain();
          _swift_observation_lock_lock(v24);
          ObservationRegistrar.State.cancel(_:)(v19);
          v25 = v24;
          v6 = v4 + 64;
          _swift_observation_lock_unlock(v25);
          swift_bridgeObjectRelease();
          swift_release();
        }
        if (*(_QWORD *)&v1[4]._os_unfair_lock_opaque)
        {
          v26 = specialized __RawDictionaryStorage.find<A>(_:)(v17);
          if ((v27 & 1) != 0)
          {
            v10 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)&v1[14]._os_unfair_lock_opaque + 16 * v26) + 40);
            swift_retain();
            swift_bridgeObjectRetain();
            _swift_observation_lock_lock(v10);
            v11 = v28;
LABEL_4:
            ObservationRegistrar.State.cancel(_:)(v11);
            _swift_observation_lock_unlock(v10);
            swift_bridgeObjectRelease();
            swift_release();
          }
        }
      }
    }
    else if (*(_QWORD *)&v1[4]._os_unfair_lock_opaque)
    {
      v20 = specialized __RawDictionaryStorage.find<A>(_:)(v17);
      if ((v21 & 1) != 0)
      {
        v10 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)&v1[14]._os_unfair_lock_opaque + 16 * v20) + 40);
        swift_retain();
        swift_bridgeObjectRetain();
        _swift_observation_lock_lock(v10);
        v11 = v19;
        goto LABEL_4;
      }
    }
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    swift_release();
    return;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_34:
  __break(1u);
}

uint64_t ObservationTracking.changed.getter()
{
  uint64_t *v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *v0;
  v2 = (os_unfair_lock_s *)(v1 + 40);
  _swift_observation_lock_lock((os_unfair_lock_t)(v1 + 40));
  v3 = *(_QWORD *)(v1 + 32);
  swift_retain();
  _swift_observation_lock_unlock(v2);
  return v3;
}

uint64_t generateAccessList<A>(_:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t CanonicalSpecializedMetadata;
  uint64_t v8;
  uint64_t result;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v14[0] = 0;
  v11 = a5;
  v12 = a3;
  v13 = a4;
  CanonicalSpecializedMetadata = swift_getCanonicalSpecializedMetadata();
  result = _ss24withUnsafeMutablePointer2to_q0_xz_q0_SpyxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF((uint64_t)v14, (uint64_t)partial apply for closure #1 in generateAccessList<A>(_:), (uint64_t)v10, CanonicalSpecializedMetadata, MEMORY[0x24BEE4078], a5, MEMORY[0x24BEE40A8], v8);
  *a2 = v14[0];
  return result;
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

uint64_t withObservationTracking<A>(_:onChange:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = generateAccessList<A>(_:)(a5, &v9, a1, a2, a4);
  if (v9)
  {
    v7 = a3(result);
    specialized static ObservationTracking._installTracking(_:onChange:)(&v9, v7, v8);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t withObservationTracking<A>(_:willSet:didSet:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  os_unfair_lock_s *v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[9];
  uint64_t v20;

  generateAccessList<A>(_:)(a8, &v20, a1, a2, a7);
  v12 = v20;
  result = _swift_observation_lock_size();
  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    v14 = swift_allocObject();
    v15 = (os_unfair_lock_s *)(v14 + 40);
    v16 = _swift_observation_lock_init((_DWORD *)(v14 + 40));
    v17 = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v14 + 16) = MEMORY[0x24BEE4B00];
    *(_BYTE *)(v14 + 24) = 0;
    *(_QWORD *)(v14 + 32) = 0;
    if (!v12)
      v12 = v17;
    MEMORY[0x24BDAC7A8](v16);
    v19[2] = a3;
    v19[3] = a4;
    v19[4] = a5;
    v19[5] = a6;
    v19[6] = v14;
    v19[7] = v12;
    v18 = specialized _NativeDictionary.mapValues<A>(_:)((void (*)(__int128 *__return_ptr, __int128 *))partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v19, v12);
    _swift_observation_lock_lock(v15);
    if (*(_BYTE *)(v14 + 24) == 1)
    {
      swift_release();
    }
    else
    {
      *(_QWORD *)(v14 + 16) = v18;
      swift_bridgeObjectRelease();
    }
    _swift_observation_lock_unlock(v15);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t withObservationTracking<A>(_:willSet:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  os_unfair_lock_s *v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[9];
  uint64_t v16;

  generateAccessList<A>(_:)(a6, &v16, a1, a2, a5);
  v8 = v16;
  result = _swift_observation_lock_size();
  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    v10 = swift_allocObject();
    v11 = (os_unfair_lock_s *)(v10 + 40);
    v12 = _swift_observation_lock_init((_DWORD *)(v10 + 40));
    v13 = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4B00];
    *(_BYTE *)(v10 + 24) = 0;
    *(_QWORD *)(v10 + 32) = 0;
    if (!v8)
      v8 = v13;
    MEMORY[0x24BDAC7A8](v12);
    v15[2] = a3;
    v15[3] = a4;
    v15[4] = 0;
    v15[5] = 0;
    v15[6] = v10;
    v15[7] = v8;
    v14 = specialized _NativeDictionary.mapValues<A>(_:)((void (*)(__int128 *__return_ptr, __int128 *))partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v15, v8);
    _swift_observation_lock_lock(v11);
    if (*(_BYTE *)(v10 + 24) == 1)
    {
      swift_release();
    }
    else
    {
      *(_QWORD *)(v10 + 16) = v14;
      swift_bridgeObjectRelease();
    }
    _swift_observation_lock_unlock(v11);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t withObservationTracking<A>(_:didSet:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  os_unfair_lock_s *v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[9];
  uint64_t v17;

  generateAccessList<A>(_:)(a6, &v17, a1, a2, a5);
  v8 = v17;
  result = _swift_observation_lock_size();
  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    v10 = swift_allocObject();
    v11 = (os_unfair_lock_s *)(v10 + 40);
    v12 = _swift_observation_lock_init((_DWORD *)(v10 + 40));
    v13 = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4B00];
    *(_BYTE *)(v10 + 24) = 0;
    *(_QWORD *)(v10 + 32) = 0;
    if (v8)
      v14 = v8;
    else
      v14 = v13;
    MEMORY[0x24BDAC7A8](v12);
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = a3;
    v16[5] = a4;
    v16[6] = v10;
    v16[7] = v14;
    v15 = specialized _NativeDictionary.mapValues<A>(_:)((void (*)(__int128 *__return_ptr, __int128 *))partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v16, v14);
    _swift_observation_lock_lock(v11);
    if (*(_BYTE *)(v10 + 24) == 1)
    {
      swift_release();
    }
    else
    {
      *(_QWORD *)(v10 + 16) = v15;
      swift_bridgeObjectRelease();
    }
    _swift_observation_lock_unlock(v11);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for AnyKeyPath();
  v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  uint64_t v2;

  v2 = static Hasher._hash(seed:_:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyKeyPath, Set<Int>>);
  v42 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_46:
    result = swift_release();
    *v3 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    if (v21 >= v40)
    {
      swift_release();
      v22 = (_QWORD *)(v5 + 64);
      if ((v42 & 1) == 0)
        goto LABEL_46;
LABEL_36:
      v32 = *(_BYTE *)(v5 + 32);
      v33 = 1 << v32;
      if (1 << v32 >= 64)
      {
        v34 = (unint64_t)(v33 + 63) >> 6;
        if ((v32 & 0x3Fu) >= 8)
        {
          v35 = v34 & 0x3FFFFFFFFFFFFFCLL;
          v36 = (_OWORD *)(v5 + 80);
          v37 = v34 & 0x3FFFFFFFFFFFFFCLL;
          do
          {
            *(v36 - 1) = 0uLL;
            *v36 = 0uLL;
            v36 += 2;
            v37 -= 4;
          }
          while (v37);
          if (v34 == v35)
            goto LABEL_45;
        }
        else
        {
          v35 = 0;
        }
        v38 = v34 - v35;
        v39 = (_QWORD *)(v5 + 8 * v35 + 64);
        do
        {
          *v39++ = 0;
          --v38;
        }
        while (v38);
      }
      else
      {
        *v22 = -1 << v33;
      }
LABEL_45:
      *(_QWORD *)(v5 + 16) = 0;
      goto LABEL_46;
    }
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v41 + 8 * v21);
    ++v13;
    if (v23)
      goto LABEL_30;
    v13 = v21 + 1;
    if (v21 + 1 >= v40)
      goto LABEL_33;
    v23 = *(_QWORD *)(v41 + 8 * v13);
    if (v23)
      goto LABEL_30;
    v24 = v21 + 2;
    if (v24 >= v40)
    {
LABEL_33:
      swift_release();
      if ((v42 & 1) == 0)
        goto LABEL_46;
      goto LABEL_36;
    }
    v23 = *(_QWORD *)(v41 + 8 * v24);
    if (!v23)
      break;
    v13 = v24;
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = 8 * v20;
    v30 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v29);
    v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
    if ((v42 & 1) == 0)
    {
      swift_retain();
      swift_bridgeObjectRetain();
    }
    type metadata accessor for AnyKeyPath();
    result = dispatch thunk of Hashable._rawHashValue(seed:)();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_47;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 8 * v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v31;
    ++*(_QWORD *)(v7 + 16);
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v13 >= v40)
      goto LABEL_33;
    v23 = *(_QWORD *)(v41 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_30;
  }
LABEL_48:
  __break(1u);
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _OWORD *v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  char v44;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, ObservationRegistrar.State.Observation>);
  v44 = a2;
  result = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = result;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_45:
    result = swift_release();
LABEL_46:
    *v3 = v7;
    return result;
  }
  v41 = v3;
  v8 = 0;
  v43 = (_QWORD *)(v5 + 64);
  v9 = 1 << *(_BYTE *)(v5 + 32);
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v42 = (unint64_t)(v9 + 63) >> 6;
  v12 = result + 64;
  while (1)
  {
    if (v11)
    {
      v18 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v19 = v18 | (v8 << 6);
      goto LABEL_31;
    }
    v20 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    if (v20 >= v42)
      goto LABEL_33;
    v21 = v43[v20];
    ++v8;
    if (!v21)
    {
      v8 = v20 + 1;
      if (v20 + 1 >= v42)
        goto LABEL_33;
      v21 = v43[v8];
      if (!v21)
        break;
    }
LABEL_30:
    v11 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v8 << 6);
LABEL_31:
    v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
    v28 = *(_QWORD *)(v5 + 56) + 32 * v19;
    v29 = *(_QWORD *)v28;
    v30 = *(_QWORD *)(v28 + 8);
    v31 = *(_BYTE *)(v28 + 16);
    v32 = *(_QWORD *)(v28 + 24);
    if ((v44 & 1) == 0)
    {
      outlined copy of ObservationRegistrar.State.ObservationKind(v29, v30, v31);
      swift_bridgeObjectRetain();
    }
    result = static Hasher._hash(seed:_:)();
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
          goto LABEL_47;
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
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v27;
    v17 = *(_QWORD *)(v7 + 56) + 32 * v16;
    *(_QWORD *)v17 = v29;
    *(_QWORD *)(v17 + 8) = v30;
    *(_BYTE *)(v17 + 16) = v31;
    *(_QWORD *)(v17 + 24) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  v22 = v20 + 2;
  if (v22 >= v42)
  {
LABEL_33:
    if ((v44 & 1) == 0)
    {
      result = swift_release();
      v3 = v41;
      goto LABEL_46;
    }
    v33 = *(_BYTE *)(v5 + 32);
    v34 = 1 << v33;
    if (1 << v33 >= 64)
    {
      v35 = (unint64_t)(v34 + 63) >> 6;
      if ((v33 & 0x3Fu) >= 8)
      {
        v36 = v35 & 0x3FFFFFFFFFFFFFCLL;
        v37 = (_OWORD *)(v5 + 80);
        v38 = v35 & 0x3FFFFFFFFFFFFFCLL;
        v3 = v41;
        do
        {
          *(v37 - 1) = 0uLL;
          *v37 = 0uLL;
          v37 += 2;
          v38 -= 4;
        }
        while (v38);
        if (v35 == v36)
          goto LABEL_44;
      }
      else
      {
        v36 = 0;
        v3 = v41;
      }
      v39 = v35 - v36;
      v40 = (_QWORD *)(v5 + 8 * v36 + 64);
      do
      {
        *v40++ = 0;
        --v39;
      }
      while (v39);
    }
    else
    {
      *v43 = -1 << v34;
      v3 = v41;
    }
LABEL_44:
    *(_QWORD *)(v5 + 16) = 0;
    goto LABEL_45;
  }
  v21 = v43[v22];
  if (v21)
  {
    v8 = v22;
    goto LABEL_30;
  }
  while (1)
  {
    v8 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v8 >= v42)
      goto LABEL_33;
    v21 = v43[v8];
    ++v22;
    if (v21)
      goto LABEL_30;
  }
LABEL_48:
  __break(1u);
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t *v37;
  __int128 v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, ObservationTracking.Entry>);
  result = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = result;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_45:
    result = swift_release();
LABEL_46:
    *v3 = v7;
    return result;
  }
  v37 = v3;
  v8 = 0;
  v9 = (_QWORD *)(v5 + 64);
  v10 = 1 << *(_BYTE *)(v5 + 32);
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v12 = v11 & *(_QWORD *)(v5 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  v14 = result + 64;
  while (1)
  {
    if (v12)
    {
      v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v20 = v19 | (v8 << 6);
      goto LABEL_31;
    }
    v21 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    if (v21 >= v13)
      goto LABEL_33;
    v22 = v9[v21];
    ++v8;
    if (!v22)
    {
      v8 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_33;
      v22 = v9[v8];
      if (!v22)
        break;
    }
LABEL_30:
    v12 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v8 << 6);
LABEL_31:
    v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v20);
    v38 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v20);
    if ((a2 & 1) == 0)
    {
      swift_retain();
      swift_bridgeObjectRetain();
    }
    result = static Hasher._hash(seed:_:)();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_47;
        }
        v26 = v17 == v25;
        if (v17 == v25)
          v17 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v14 + 8 * v17);
      }
      while (v27 == -1);
      v18 = __clz(__rbit64(~v27)) + (v17 << 6);
    }
    *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v18) = v28;
    *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v18) = v38;
    ++*(_QWORD *)(v7 + 16);
  }
  v23 = v21 + 2;
  if (v23 >= v13)
  {
LABEL_33:
    if ((a2 & 1) == 0)
    {
      result = swift_release();
      v3 = v37;
      goto LABEL_46;
    }
    v29 = *(_BYTE *)(v5 + 32);
    v30 = 1 << v29;
    if (1 << v29 >= 64)
    {
      v31 = (unint64_t)(v30 + 63) >> 6;
      if ((v29 & 0x3Fu) >= 8)
      {
        v32 = v31 & 0x3FFFFFFFFFFFFFCLL;
        v33 = (_OWORD *)(v5 + 80);
        v34 = v31 & 0x3FFFFFFFFFFFFFCLL;
        v3 = v37;
        do
        {
          *(v33 - 1) = 0uLL;
          *v33 = 0uLL;
          v33 += 2;
          v34 -= 4;
        }
        while (v34);
        if (v31 == v32)
          goto LABEL_44;
      }
      else
      {
        v32 = 0;
        v3 = v37;
      }
      v35 = v31 - v32;
      v36 = (_QWORD *)(v5 + 8 * v32 + 64);
      do
      {
        *v36++ = 0;
        --v35;
      }
      while (v35);
    }
    else
    {
      *v9 = -1 << v30;
      v3 = v37;
    }
LABEL_44:
    *(_QWORD *)(v5 + 16) = 0;
    goto LABEL_45;
  }
  v22 = v9[v23];
  if (v22)
  {
    v8 = v23;
    goto LABEL_30;
  }
  while (1)
  {
    v8 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v8 >= v13)
      goto LABEL_33;
    v22 = v9[v8];
    ++v23;
    if (v22)
      goto LABEL_30;
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v13;

  v3 = v2;
  v6 = *v2;
  v7 = static Hasher._hash(seed:_:)();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    while (*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v9) != a2)
    {
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_5;
    }
    result = 0;
  }
  else
  {
LABEL_5:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v3;
    *v3 = 0x8000000000000000;
    specialized _NativeSet.insertNew(_:at:isUnique:)(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v13;
    swift_bridgeObjectRelease();
    result = 1;
  }
  *a1 = a2;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    swift_retain();
    v8 = __CocoaSet.member(for:)();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for AnyKeyPath();
      swift_dynamicCast();
      result = 0;
      *a1 = v18;
      return result;
    }
    result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v16 = specialized _NativeSet.init(_:capacity:)(v7, result + 1);
    v20 = v16;
    if (*(_QWORD *)(v16 + 24) <= *(_QWORD *)(v16 + 16))
    {
      swift_retain();
      specialized _NativeSet.resize(capacity:)();
      v17 = v20;
    }
    else
    {
      v17 = v16;
      swift_retain();
    }
    specialized _NativeSet._unsafeInsertNew(_:)(a2, v17);
    *v3 = v17;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  type metadata accessor for AnyKeyPath();
  swift_bridgeObjectRetain();
  v10 = dispatch thunk of Hashable._rawHashValue(seed:)();
  v11 = -1 << *(_BYTE *)(v6 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *v2;
    *v2 = 0x8000000000000000;
    v15 = swift_retain();
    specialized _NativeSet.insertNew(_:at:isUnique:)(v15, v12, isUniquelyReferenced_nonNull_native);
    *v2 = v19;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  v13 = ~v11;
  while ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0)
  {
    v12 = (v12 + 1) & v13;
    if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      goto LABEL_11;
  }
  swift_release();
  swift_bridgeObjectRelease();
  *a1 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v12);
  swift_retain();
  return 0;
}

uint64_t specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
    v2 = static _SetStorage.convert(_:capacity:)();
    v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      type metadata accessor for AnyKeyPath();
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          specialized _NativeSet.resize(capacity:)();
          v2 = v14;
        }
        result = dispatch thunk of Hashable._rawHashValue(seed:)();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t *v35;
  uint64_t v36;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Int>);
  result = static _SetStorage.resize(original:capacity:move:)();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_43:
    result = swift_release();
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = (uint64_t *)(v2 + 56);
  v7 = *(_BYTE *)(v2 + 32);
  v34 = v7 & 0x3F;
  v35 = v1;
  v8 = 1 << v7;
  v9 = -1 << (1 << v7);
  v33 = v9;
  if (v8 < 64)
    v10 = ~v9;
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v2 + 56);
  v36 = v8;
  v12 = (unint64_t)(v8 + 63) >> 6;
  v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v16 = v15 | (v5 << 6);
      goto LABEL_24;
    }
    v17 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    if (v17 >= v12)
      goto LABEL_33;
    v18 = v6[v17];
    ++v5;
    if (!v18)
    {
      v5 = v17 + 1;
      if (v17 + 1 >= v12)
        goto LABEL_33;
      v18 = v6[v5];
      if (!v18)
      {
        v5 = v17 + 2;
        if (v17 + 2 >= v12)
          goto LABEL_33;
        v18 = v6[v5];
        if (!v18)
          break;
      }
    }
LABEL_23:
    v11 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v5 << 6);
LABEL_24:
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v16);
    result = static Hasher._hash(seed:_:)();
    v21 = -1 << *(_BYTE *)(v4 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v13 + 8 * v23);
      }
      while (v27 == -1);
      v14 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v14) = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_33:
    if (v36 >= 64)
    {
      if (v34 >= 8)
      {
        v28 = v12 & 0x3FFFFFFFFFFFFFCLL;
        v29 = (_OWORD *)(v2 + 72);
        v30 = v12 & 0x3FFFFFFFFFFFFFCLL;
        do
        {
          *(v29 - 1) = 0uLL;
          *v29 = 0uLL;
          v29 += 2;
          v30 -= 4;
        }
        while (v30);
        v1 = v35;
        if (v12 == v28)
          goto LABEL_42;
      }
      else
      {
        v28 = 0;
        v1 = v35;
      }
      v31 = v12 - v28;
      v32 = (_QWORD *)(v2 + 8 * v28 + 56);
      do
      {
        *v32++ = 0;
        --v31;
      }
      while (v31);
    }
    else
    {
      *v6 = v33;
      v1 = v35;
    }
LABEL_42:
    *(_QWORD *)(v2 + 16) = 0;
    goto LABEL_43;
  }
  v18 = v6[v19];
  if (v18)
  {
    v5 = v19;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v5 >= v12)
      goto LABEL_33;
    v18 = v6[v5];
    ++v19;
    if (v18)
      goto LABEL_23;
  }
LABEL_45:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  _QWORD *v34;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_43:
    result = swift_release();
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v34 = (_QWORD *)(v2 + 56);
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v7)
    {
      v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    if (v15 >= v8)
      goto LABEL_33;
    v16 = v34[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v8)
        goto LABEL_33;
      v16 = v34[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v8)
          goto LABEL_33;
        v16 = v34[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v7 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    type metadata accessor for AnyKeyPath();
    result = dispatch thunk of Hashable._rawHashValue(seed:)();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v9 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v9 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v8)
  {
LABEL_33:
    swift_release();
    v1 = v0;
    v26 = *(_BYTE *)(v2 + 32);
    v27 = 1 << v26;
    if (1 << v26 > 63)
    {
      v28 = (unint64_t)(v27 + 63) >> 6;
      if ((v26 & 0x3Fu) >= 8)
      {
        v29 = v28 & 0x3FFFFFFFFFFFFFCLL;
        v30 = (_OWORD *)(v2 + 72);
        v31 = v28 & 0x3FFFFFFFFFFFFFCLL;
        do
        {
          *(v30 - 1) = 0uLL;
          *v30 = 0uLL;
          v30 += 2;
          v31 -= 4;
        }
        while (v31);
        if (v28 == v29)
          goto LABEL_42;
      }
      else
      {
        v29 = 0;
      }
      v32 = v28 - v29;
      v33 = (_QWORD *)(v2 + 8 * v29 + 56);
      do
      {
        *v33++ = 0;
        --v32;
      }
      while (v32);
    }
    else
    {
      *v34 = -1 << v27;
    }
LABEL_42:
    *(_QWORD *)(v2 + 16) = 0;
    goto LABEL_43;
  }
  v16 = v34[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v8)
      goto LABEL_33;
    v16 = v34[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_45:
  __break(1u);
  return result;
}

unint64_t specialized _NativeSet._unsafeInsertNew(_:)(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  type metadata accessor for AnyKeyPath();
  dispatch thunk of Hashable._rawHashValue(seed:)();
  result = _HashTable.nextHole(atOrAfter:)();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)specialized _NativeSet.copy()();
      goto LABEL_12;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v8 = *v3;
  result = static Hasher._hash(seed:_:)();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = ~v9;
    while (*(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * a2) != v5)
    {
      a2 = (a2 + 1) & v10;
      if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_12;
    }
    goto LABEL_15;
  }
LABEL_12:
  v11 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * a2) = v5;
  v12 = *(_QWORD *)(v11 + 16);
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (!v13)
  {
    *(_QWORD *)(v11 + 16) = v14;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)specialized _NativeSet.copy()();
      goto LABEL_12;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v8 = *v3;
  type metadata accessor for AnyKeyPath();
  result = dispatch thunk of Hashable._rawHashValue(seed:)();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = ~v9;
    do
    {
      result = dispatch thunk of static Equatable.== infix(_:_:)();
      if ((result & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v10;
    }
    while (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v11 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * a2) = v5;
  v12 = *(_QWORD *)(v11 + 16);
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (!v13)
  {
    *(_QWORD *)(v11 + 16) = v14;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *specialized _NativeSet.copy()()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Int>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = (void *)swift_retain();
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Int>);
  result = static _SetStorage.resize(original:capacity:move:)();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = static Hasher._hash(seed:_:)();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
  v2 = static _SetStorage.resize(original:capacity:move:)();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
    result = swift_release();
LABEL_35:
    *v0 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v1 + 32);
  v24 = v1 + 56;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v1 + 56);
  v25 = (unint64_t)(v4 + 63) >> 6;
  v7 = v2 + 56;
  result = swift_retain_n();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v11 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v12 = v11 | (v9 << 6);
      goto LABEL_24;
    }
    v13 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v13 >= v25)
      goto LABEL_33;
    v14 = *(_QWORD *)(v24 + 8 * v13);
    ++v9;
    if (!v14)
    {
      v9 = v13 + 1;
      if (v13 + 1 >= v25)
        goto LABEL_33;
      v14 = *(_QWORD *)(v24 + 8 * v9);
      if (!v14)
      {
        v9 = v13 + 2;
        if (v13 + 2 >= v25)
          goto LABEL_33;
        v14 = *(_QWORD *)(v24 + 8 * v9);
        if (!v14)
          break;
      }
    }
LABEL_23:
    v6 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v9 << 6);
LABEL_24:
    v16 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v12);
    type metadata accessor for AnyKeyPath();
    swift_retain();
    result = dispatch thunk of Hashable._rawHashValue(seed:)();
    v17 = -1 << *(_BYTE *)(v3 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v7 + 8 * (v18 >> 6))) != 0)
    {
      v10 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v7 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v20 = 0;
      v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v22 = v19 == v21;
        if (v19 == v21)
          v19 = 0;
        v20 |= v22;
        v23 = *(_QWORD *)(v7 + 8 * v19);
      }
      while (v23 == -1);
      v10 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(_QWORD *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v10) = v16;
    ++*(_QWORD *)(v3 + 16);
  }
  v15 = v13 + 3;
  if (v15 >= v25)
  {
LABEL_33:
    result = swift_release_n();
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v24 + 8 * v15);
  if (v14)
  {
    v9 = v15;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v9 >= v25)
      goto LABEL_33;
    v14 = *(_QWORD *)(v24 + 8 * v9);
    ++v15;
    if (v14)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    type metadata accessor for AnyKeyPath();
    do
    {
      if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = ~v4;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * result) == a1)
        break;
      result = (result + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyKeyPath, Set<Int>>);
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
    swift_retain();
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, ObservationRegistrar.State.Observation>);
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    v19 = *(_QWORD *)(v2 + 56) + v18;
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(v19 + 8);
    v22 = *(_QWORD *)(v19 + 24);
    v23 = *(_BYTE *)(v19 + 16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v24 = *(_QWORD *)(v4 + 56) + v18;
    *(_QWORD *)v24 = v20;
    *(_QWORD *)(v24 + 8) = v21;
    *(_BYTE *)(v24 + 16) = v23;
    *(_QWORD *)(v24 + 24) = v22;
    outlined copy of ObservationRegistrar.State.ObservationKind(v20, v21, v23);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
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
  uint64_t v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, ObservationTracking.Entry>);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    swift_retain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(a2 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        result = static Hasher._hash(seed:_:)();
        v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 >= v8 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v3);
            if (v3 != v6 || v15 >= v11 + 1)
              *v15 = *v11;
            v16 = *(_QWORD *)(a2 + 56);
            v17 = (_OWORD *)(v16 + 32 * v3);
            v18 = (_OWORD *)(v16 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v17 >= v18 + 2))
            {
              v9 = v18[1];
              *v17 = *v18;
              v17[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v8 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      type metadata accessor for AnyKeyPath();
      do
      {
        result = dispatch thunk of Hashable._rawHashValue(seed:)();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 >= v8 && v3 >= (uint64_t)v9)
          {
LABEL_16:
            v12 = *(_QWORD *)(a2 + 48);
            v13 = (_QWORD *)(v12 + 8 * v3);
            v14 = (_QWORD *)(v12 + 8 * v6);
            if (v3 != v6 || v13 >= v14 + 1)
              *v13 = *v14;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v9 >= v8 || v3 >= (uint64_t)v9)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t result;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v7 = v6;
  v14 = *v6;
  v16 = specialized __RawDictionaryStorage.find<A>(_:)(a5);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= result && (a6 & 1) != 0)
    goto LABEL_7;
  if (v21 >= result && (a6 & 1) == 0)
  {
    result = (uint64_t)specialized _NativeDictionary.copy()();
LABEL_7:
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7] + 32 * v16;
      v24 = *(_QWORD *)v23;
      v25 = *(_QWORD *)(v23 + 8);
      *(_QWORD *)v23 = a1;
      *(_QWORD *)(v23 + 8) = a2;
      v26 = *(_BYTE *)(v23 + 16);
      *(_BYTE *)(v23 + 16) = a3;
      *(_QWORD *)(v23 + 24) = a4;
      outlined consume of ObservationRegistrar.State.ObservationKind(v24, v25, v26);
      return swift_bridgeObjectRelease();
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    *(_QWORD *)(v22[6] + 8 * v16) = a5;
    v28 = v22[7] + 32 * v16;
    *(_QWORD *)v28 = a1;
    *(_QWORD *)(v28 + 8) = a2;
    *(_BYTE *)(v28 + 16) = a3;
    *(_QWORD *)(v28 + 24) = a4;
    v29 = v22[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (!v30)
    {
      v22[2] = v31;
      return result;
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(result, a6 & 1);
  result = specialized __RawDictionaryStorage.find<A>(_:)(a5);
  if ((v20 & 1) == (v27 & 1))
  {
    v16 = result;
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.extractSubset(using:count:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Int>);
  result = static _SetStorage.allocate(capacity:)();
  v9 = result;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = a1[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = a1[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = a1[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = static Hasher._hash(seed:_:)();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = a1[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = a1[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.remove(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v13;

  v2 = v1;
  v4 = *v2;
  v5 = static Hasher._hash(seed:_:)();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
    return 0;
  v8 = ~v6;
  while (*(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v7) != a1)
  {
    v7 = (v7 + 1) & v8;
    if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
      return 0;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v2;
  v13 = *v2;
  *v2 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    specialized _NativeSet.copy()();
    v11 = v13;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v7);
  specialized _NativeSet._delete(at:)(v7);
  *v2 = v13;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t specialized Dictionary._Variant.remove(at:)(_QWORD *a1, unint64_t a2, int a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = v4;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    v13 = *v4;
    *v4 = 0x8000000000000000;
    specialized _NativeDictionary.copy()();
    *v4 = v13;
    result = swift_bridgeObjectRelease();
  }
  if ((a4 & 1) != 0)
    goto LABEL_12;
  if ((a2 & 0x8000000000000000) != 0 || (v11 = *v4, 1 << *(_BYTE *)(*v5 + 32) <= (uint64_t)a2))
  {
    __break(1u);
  }
  else if (((*(_QWORD *)(v11 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) != 0)
  {
    if (*(_DWORD *)(v11 + 36) == a3)
    {
      *v5 = 0x8000000000000000;
      v12 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * a2);
      *a1 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * a2);
      specialized _NativeDictionary._delete(at:)(a2, v11);
      *v5 = v11;
      swift_bridgeObjectRelease();
      return v12;
    }
    goto LABEL_11;
  }
  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t specialized _NativeSet._delete(at:)(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        v12 = static Hasher._hash(seed:_:)() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v2);
            if (v2 != v6 || (v2 = v6, v15 >= v11 + 1))
            {
              *v15 = *v11;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v16 = *(_QWORD *)(v3 + 16);
  v17 = __OFSUB__(v16, 1);
  v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = a4[3];
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = a4[2];
  if (v8 <= v9)
    v10 = a4[2];
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (_QWORD *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    v11[2] = v9;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[2 * v9 + 4])
      memmove(v11 + 4, a4 + 4, 16 * v9);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ());
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t result;

  v7 = specialized LazyMapSequence.Iterator.next()();
  if (!v8)
  {
LABEL_16:
    outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
    return swift_release();
  }
  v10 = v7;
  v11 = v8;
  v12 = v9;
  while (1)
  {
    v21 = (_QWORD *)*a5;
    v23 = specialized __RawDictionaryStorage.find<A>(_:)(v10);
    v24 = v21[2];
    v25 = (v22 & 1) == 0;
    v26 = v24 + v25;
    if (__OFADD__(v24, v25))
      break;
    v27 = v22;
    if (v21[3] >= v26)
    {
      if ((a4 & 1) != 0)
      {
        v30 = (_QWORD *)*a5;
        if ((v22 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        specialized _NativeDictionary.copy()();
        v30 = (_QWORD *)*a5;
        if ((v27 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v26, a4 & 1);
      v28 = specialized __RawDictionaryStorage.find<A>(_:)(v10);
      if ((v27 & 1) != (v29 & 1))
        goto LABEL_19;
      v23 = v28;
      v30 = (_QWORD *)*a5;
      if ((v27 & 1) != 0)
      {
LABEL_3:
        v13 = (uint64_t *)(v30[7] + 16 * v23);
        v14 = *v13;
        v15 = v13[1];
        swift_retain();
        swift_bridgeObjectRetain();
        v16 = swift_bridgeObjectRetain();
        v17 = specialized Set.union<A>(_:)(v16, v15);
        swift_bridgeObjectRelease();
        swift_release();
        v18 = (_QWORD *)(v30[7] + 16 * v23);
        *v18 = v14;
        v18[1] = v17;
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_4;
      }
    }
    v30[(v23 >> 6) + 8] |= 1 << v23;
    *(_QWORD *)(v30[6] + 8 * v23) = v10;
    v31 = (_QWORD *)(v30[7] + 16 * v23);
    *v31 = v11;
    v31[1] = v12;
    v32 = v30[2];
    v33 = __OFADD__(v32, 1);
    v34 = v32 + 1;
    if (v33)
      goto LABEL_18;
    v30[2] = v34;
LABEL_4:
    v10 = specialized LazyMapSequence.Iterator.next()();
    v11 = v19;
    v12 = v20;
    a4 = 1;
    if (!v19)
      goto LABEL_16;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.mapValues<A>(_:)(void (*a1)(__int128 *__return_ptr, __int128 *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t i;
  BOOL v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  __int128 v28;
  char v29;
  __int128 v30;
  uint64_t v31;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, ObservationTracking.Id>);
  result = static _DictionaryStorage.copy(original:)();
  v6 = (_QWORD *)result;
  v7 = 0;
  v31 = a3;
  v10 = *(_QWORD *)(a3 + 64);
  v9 = a3 + 64;
  v8 = v10;
  v11 = 1 << *(_BYTE *)(v9 - 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v8;
  v24 = v9;
  v25 = (unint64_t)(v11 + 63) >> 6;
  v26 = result + 64;
  if ((v12 & v8) == 0)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v14 | (v7 << 6); ; i = __clz(__rbit64(v17)) + (v7 << 6))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(v31 + 48) + 8 * i);
    v30 = *(_OWORD *)(*(_QWORD *)(v31 + 56) + 16 * i);
    swift_retain();
    swift_bridgeObjectRetain();
    a1(&v28, &v30);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      return (uint64_t)v6;
    }
    swift_bridgeObjectRelease();
    result = swift_release();
    *(_QWORD *)(v26 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(_QWORD *)(v6[6] + 8 * i) = v19;
    v20 = v6[7] + 24 * i;
    v21 = v29;
    *(_OWORD *)v20 = v28;
    *(_BYTE *)(v20 + 16) = v21;
    v22 = v6[2];
    v16 = __OFADD__(v22, 1);
    v23 = v22 + 1;
    if (v16)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v6[2] = v23;
    if (v13)
      goto LABEL_4;
LABEL_5:
    v16 = __OFADD__(v7++, 1);
    if (v16)
      goto LABEL_27;
    if (v7 >= v25)
      return (uint64_t)v6;
    v17 = *(_QWORD *)(v24 + 8 * v7);
    if (!v17)
      break;
LABEL_15:
    v13 = (v17 - 1) & v17;
  }
  v18 = v7 + 1;
  if (v7 + 1 >= v25)
    return (uint64_t)v6;
  v17 = *(_QWORD *)(v24 + 8 * v18);
  if (v17)
    goto LABEL_14;
  v18 = v7 + 2;
  if (v7 + 2 >= v25)
    return (uint64_t)v6;
  v17 = *(_QWORD *)(v24 + 8 * v18);
  if (v17)
    goto LABEL_14;
  v18 = v7 + 3;
  if (v7 + 3 >= v25)
    return (uint64_t)v6;
  v17 = *(_QWORD *)(v24 + 8 * v18);
  if (v17)
  {
LABEL_14:
    v7 = v18;
    goto LABEL_15;
  }
  while (1)
  {
    v7 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v7 >= v25)
      return (uint64_t)v6;
    v17 = *(_QWORD *)(v24 + 8 * v7);
    ++v18;
    if (v17)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  swift_retain();
  return swift_bridgeObjectRetain();
}

uint64_t specialized LazyMapSequence.Iterator.next()()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *__return_ptr, uint64_t *);
  __int128 v10;
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v8 = *(_QWORD *)(v1 + 48);
    v7 = *(_QWORD *)(v1 + 56);
    v9 = (void (*)(uint64_t *__return_ptr, uint64_t *))v0[5];
    v19 = *(_QWORD *)(v8 + 8 * v6);
    v10 = *(_OWORD *)(v7 + 16 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v20 = v10;
    swift_retain();
    swift_bridgeObjectRetain();
    v9(&v18, &v19);
    swift_bridgeObjectRelease();
    swift_release();
    return v18;
  }
  v12 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v13 = (unint64_t)(v0[2] + 64) >> 6;
    if (v12 < v13)
    {
      v14 = v0[1];
      v15 = *(_QWORD *)(v14 + 8 * v12);
      if (v15)
      {
LABEL_7:
        v5 = (v15 - 1) & v15;
        v6 = __clz(__rbit64(v15)) + (v12 << 6);
        v4 = v12;
        goto LABEL_3;
      }
      v16 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v13)
      {
        v15 = *(_QWORD *)(v14 + 8 * v16);
        if (v15)
        {
LABEL_10:
          v12 = v16;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v13)
        {
          v15 = *(_QWORD *)(v14 + 8 * (v3 + 3));
          if (v15)
          {
            v12 = v3 + 3;
            goto LABEL_7;
          }
          v16 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v13)
          {
            v15 = *(_QWORD *)(v14 + 8 * v16);
            if (v15)
              goto LABEL_10;
            v12 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v13)
            {
              v15 = *(_QWORD *)(v14 + 8 * v12);
              if (v15)
                goto LABEL_7;
              v4 = v13 - 1;
              v17 = v3 + 6;
              while (v13 != v17)
              {
                v15 = *(_QWORD *)(v14 + 8 * v17++);
                if (v15)
                {
                  v12 = v17 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

void specialized ObservationRegistrar.Context.willSet<A, B>(_:keyPath:)(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  void (*v36)(uint64_t *);
  uint64_t v37;
  os_unfair_lock_s *v38;
  uint64_t v39;

  v4 = (os_unfair_lock_s *)(a2 + 40);
  _swift_observation_lock_lock((os_unfair_lock_t)(a2 + 40));
  v5 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(v5 + 16))
  {
    v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
      v9 = v8 + 56;
      v10 = 1 << *(_BYTE *)(v8 + 32);
      v11 = -1;
      if (v10 < 64)
        v11 = ~(-1 << v10);
      v12 = v11 & *(_QWORD *)(v8 + 56);
      v13 = (unint64_t)(v10 + 63) >> 6;
      swift_bridgeObjectRetain();
      v14 = 0;
      v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
      while (1)
      {
        if (v12)
        {
          v16 = __clz(__rbit64(v12));
          v12 &= v12 - 1;
          v17 = v16 | (v14 << 6);
        }
        else
        {
          v18 = v14 + 1;
          if (__OFADD__(v14, 1))
            goto LABEL_38;
          if (v18 >= v13)
          {
LABEL_31:
            swift_release();
            goto LABEL_32;
          }
          v19 = *(_QWORD *)(v9 + 8 * v18);
          ++v14;
          if (!v19)
          {
            v14 = v18 + 1;
            if (v18 + 1 >= v13)
              goto LABEL_31;
            v19 = *(_QWORD *)(v9 + 8 * v14);
            if (!v19)
            {
              v14 = v18 + 2;
              if (v18 + 2 >= v13)
                goto LABEL_31;
              v19 = *(_QWORD *)(v9 + 8 * v14);
              if (!v19)
              {
                v20 = v18 + 3;
                if (v20 >= v13)
                  goto LABEL_31;
                v19 = *(_QWORD *)(v9 + 8 * v20);
                if (!v19)
                {
                  while (1)
                  {
                    v14 = v20 + 1;
                    if (__OFADD__(v20, 1))
                      goto LABEL_39;
                    if (v14 >= v13)
                      goto LABEL_31;
                    v19 = *(_QWORD *)(v9 + 8 * v14);
                    ++v20;
                    if (v19)
                      goto LABEL_21;
                  }
                }
                v14 = v20;
              }
            }
          }
LABEL_21:
          v12 = (v19 - 1) & v19;
          v17 = __clz(__rbit64(v19)) + (v14 << 6);
        }
        v21 = *(_QWORD *)(a2 + 24);
        if (*(_QWORD *)(v21 + 16))
        {
          v22 = specialized __RawDictionaryStorage.find<A>(_:)(*(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v17));
          if ((v23 & 1) != 0)
          {
            v24 = *(_QWORD *)(v21 + 56) + 32 * v22;
            if (!*(_BYTE *)(v24 + 16))
            {
              v38 = v4;
              v26 = *(_QWORD *)v24;
              v25 = *(_QWORD *)(v24 + 8);
              v27 = swift_allocObject();
              *(_QWORD *)(v27 + 16) = v26;
              *(_QWORD *)(v27 + 24) = v25;
              v37 = v27;
              outlined copy of ObservationRegistrar.State.ObservationKind(v26, v25, 0);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1, v15, (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
              v29 = v15[2];
              v28 = v15[3];
              v30 = v29 + 1;
              v4 = v38;
              if (v29 >= v28 >> 1)
              {
                v32 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v28 > 1), v29 + 1, 1, v15, (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
                v30 = v29 + 1;
                v15 = v32;
              }
              v15[2] = v30;
              v31 = &v15[2 * v29];
              v31[4] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed AnyKeyPath) -> ()partial apply;
              v31[5] = v37;
            }
          }
        }
      }
    }
  }
  v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_32:
  _swift_observation_lock_unlock(v4);
  v33 = v15[2];
  if (v33)
  {
    v34 = 0;
    v35 = v15 + 5;
    while (v34 < v15[2])
    {
      ++v34;
      v36 = (void (*)(uint64_t *))*(v35 - 1);
      v39 = a1;
      swift_retain();
      v36(&v39);
      swift_release();
      v35 += 2;
      if (v33 == v34)
        goto LABEL_36;
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
  }
  else
  {
LABEL_36:
    swift_bridgeObjectRelease();
  }
}

unint64_t specialized closure #1 in _NativeSet.filter(_:)(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  int64_t v18;
  char v19;

  v6 = (unint64_t *)result;
  v7 = 0;
  v8 = 0;
  v9 = a3 + 56;
  v10 = 1 << *(_BYTE *)(a3 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(a3 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    while (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v8 << 6);
      if (*(_QWORD *)(a4 + 16))
        goto LABEL_18;
    }
    v16 = __OFADD__(v8++, 1);
    if (v16)
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v8 >= v13)
      goto LABEL_27;
    v17 = *(_QWORD *)(v9 + 8 * v8);
    if (!v17)
      break;
LABEL_17:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v8 << 6);
    if (*(_QWORD *)(a4 + 16))
    {
LABEL_18:
      result = specialized __RawDictionaryStorage.find<A>(_:)(*(_QWORD *)(*(_QWORD *)(a3 + 48) + 8 * v15));
      if ((v19 & 1) != 0 && *(_BYTE *)(*(_QWORD *)(a4 + 56) + 32 * result + 16) == 3)
      {
        *(unint64_t *)((char *)v6 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        v16 = __OFADD__(v7++, 1);
        if (v16)
          goto LABEL_30;
      }
    }
  }
  v18 = v8 + 1;
  if (v8 + 1 >= v13)
    goto LABEL_27;
  v17 = *(_QWORD *)(v9 + 8 * v18);
  if (v17)
    goto LABEL_16;
  v18 = v8 + 2;
  if (v8 + 2 >= v13)
    goto LABEL_27;
  v17 = *(_QWORD *)(v9 + 8 * v18);
  if (v17)
    goto LABEL_16;
  v18 = v8 + 3;
  if (v8 + 3 >= v13)
  {
LABEL_27:
    swift_retain();
    return specialized _NativeSet.extractSubset(using:count:)(v6, a2, v7, a3);
  }
  v17 = *(_QWORD *)(v9 + 8 * v18);
  if (v17)
  {
LABEL_16:
    v8 = v18;
    goto LABEL_17;
  }
  while (1)
  {
    v8 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v8 >= v13)
      goto LABEL_27;
    v17 = *(_QWORD *)(v9 + 8 * v8);
    ++v18;
    if (v17)
      goto LABEL_17;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

unint64_t specialized _NativeSet.filter(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  if (v6 > 0xD && (swift_stdlib_isStackAllocationSafe() & 1) == 0)
  {
    v12 = swift_slowAlloc();
    v13 = v12;
    v14 = 0;
    while (1)
    {
      v15 = v14 + 1;
      if (__OFADD__(v14, 1))
        break;
      *(_QWORD *)(v12 + 8 * v14++) = 0;
      if (v15 == v7)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v11 = specialized closure #1 in _NativeSet.filter(_:)(v13, v7, a1, a2);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        MEMORY[0x24BD2E5B8](v13, -1, -1);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
LABEL_16:
    __break(1u);
  }
  MEMORY[0x24BDAC7A8]();
  v9 = 0;
  do
  {
    v10 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_16;
    }
    *(_QWORD *)((char *)&v17[v9++] - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)) = 0;
  }
  while (v10 != v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = specialized closure #1 in _NativeSet.filter(_:)((unint64_t)v17 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
    swift_willThrow();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_14:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v1 = result;
  v2 = result >> 62;
  if (result >> 62)
  {
    result = _CocoaArrayWrapper.endIndex.getter();
    if (result)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
      result = static _SetStorage.allocate(capacity:)();
      v3 = result;
      v17 = v1;
      if (!v2)
        goto LABEL_4;
LABEL_8:
      result = _CocoaArrayWrapper.endIndex.getter();
      v4 = result;
      if (!result)
        return v3;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  v17 = v1;
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return v3;
LABEL_9:
  v5 = 0;
  v6 = v3 + 56;
  v18 = v4;
  while (1)
  {
    if ((v17 & 0xC000000000000001) != 0)
    {
      v7 = MEMORY[0x24BD2E3A8](v5, v17);
      v8 = __OFADD__(v5++, 1);
      if (v8)
      {
LABEL_24:
        __break(1u);
        return v3;
      }
      goto LABEL_14;
    }
    if (v5 >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
      break;
    v7 = *(_QWORD *)(v17 + 32 + 8 * v5);
    swift_retain();
    v8 = __OFADD__(v5++, 1);
    if (v8)
      goto LABEL_24;
LABEL_14:
    type metadata accessor for AnyKeyPath();
    result = dispatch thunk of Hashable._rawHashValue(seed:)();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = result & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v6 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = ~v9;
      while (1)
      {
        result = dispatch thunk of static Equatable.== infix(_:_:)();
        if ((result & 1) != 0)
          break;
        v10 = (v10 + 1) & v14;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v6 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
        {
          v4 = v18;
          goto LABEL_19;
        }
      }
      result = swift_release();
      v4 = v18;
      if (v5 == v18)
        return v3;
    }
    else
    {
LABEL_19:
      *(_QWORD *)(v6 + 8 * v11) = v13 | v12;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v10) = v7;
      v15 = *(_QWORD *)(v3 + 16);
      v8 = __OFADD__(v15, 1);
      v16 = v15 + 1;
      if (v8)
        goto LABEL_27;
      *(_QWORD *)(v3 + 16) = v16;
      if (v5 == v4)
        return v3;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t specialized ObservationRegistrar.willSet<A, B>(_:keyPath:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  swift_retain();
  specialized ObservationRegistrar.Context.willSet<A, B>(_:keyPath:)(a1, v3);
  return swift_release();
}

uint64_t specialized _NativeDictionary.mapValues<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  os_unfair_lock_s **v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  _QWORD *v25;
  os_unfair_lock_s *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v39;
  int64_t v40;
  uint64_t v42;
  uint64_t v43;
  os_unfair_lock_s *lock;
  unint64_t v49;
  int64_t v50;
  uint64_t v51;
  _QWORD *v52;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, ObservationTracking.Id>);
  v8 = static _DictionaryStorage.copy(original:)();
  v9 = 0;
  v43 = a1;
  v12 = *(_QWORD *)(a1 + 64);
  v11 = a1 + 64;
  v10 = v12;
  v13 = 1 << *(_BYTE *)(v11 - 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v10;
  v39 = v11;
  v40 = (unint64_t)(v13 + 63) >> 6;
  v52 = (_QWORD *)v8;
  v42 = v8 + 64;
  if (!v15)
    goto LABEL_5;
LABEL_4:
  v16 = __clz(__rbit64(v15));
  v17 = (v15 - 1) & v15;
  for (i = v16 | (v9 << 6); ; i = __clz(__rbit64(v20)) + (v9 << 6))
  {
    v22 = (os_unfair_lock_s **)(*(_QWORD *)(v43 + 56) + 16 * i);
    v24 = *v22;
    v23 = (uint64_t)v22[1];
    v49 = v17;
    v50 = v9;
    v51 = *(_QWORD *)(*(_QWORD *)(v43 + 48) + 8 * i);
    if (a2)
    {
      lock = v24 + 10;
      v25 = (_QWORD *)swift_allocObject();
      v25[2] = a6;
      v25[3] = a7;
      v25[4] = a2;
      v25[5] = a3;
      swift_retain();
      swift_bridgeObjectRetain();
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
      if (a4)
      {
        outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
        swift_retain();
        swift_bridgeObjectRetain();
        v26 = v24 + 10;
        _swift_observation_lock_lock(lock);
        v27 = ObservationRegistrar.State.registerTracking(for:willSet:)(v23, (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v25);
        swift_release();
        _swift_observation_lock_unlock(lock);
        v28 = (_QWORD *)swift_allocObject();
        v28[2] = a6;
        v28[3] = a7;
        v28[4] = a4;
        v28[5] = a5;
        v29 = v27;
        swift_retain();
        swift_bridgeObjectRetain();
        _swift_observation_lock_lock(lock);
        v30 = ObservationRegistrar.State.registerTracking(for:didSet:)(v23, (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v28);
        v31 = 2;
      }
      else
      {
        swift_retain();
        swift_bridgeObjectRetain();
        v26 = v24 + 10;
        _swift_observation_lock_lock(lock);
        v29 = ObservationRegistrar.State.registerTracking(for:willSet:)(v23, (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v25);
        v30 = 0;
        v31 = 0;
      }
    }
    else
    {
      if (!a4)
        goto LABEL_32;
      v32 = (_QWORD *)swift_allocObject();
      v32[2] = a6;
      v32[3] = a7;
      v32[4] = a4;
      v32[5] = a5;
      swift_retain();
      swift_bridgeObjectRetain();
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
      v26 = v24 + 10;
      swift_retain();
      swift_bridgeObjectRetain();
      _swift_observation_lock_lock(v24 + 10);
      v29 = ObservationRegistrar.State.registerTracking(for:didSet:)(v23, (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v32);
      v30 = 0;
      v31 = 1;
    }
    swift_release();
    _swift_observation_lock_unlock(v26);
    swift_bridgeObjectRelease();
    swift_release();
    *(_QWORD *)(v42 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(_QWORD *)(v52[6] + 8 * i) = v51;
    v33 = v52[7] + 24 * i;
    *(_QWORD *)v33 = v29;
    *(_QWORD *)(v33 + 8) = v30;
    *(_BYTE *)(v33 + 16) = v31;
    v34 = v52[2];
    v35 = __OFADD__(v34, 1);
    v36 = v34 + 1;
    if (v35)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    v52[2] = v36;
    v15 = v49;
    v9 = v50;
    if (v49)
      goto LABEL_4;
LABEL_5:
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
      goto LABEL_30;
    if (v19 >= v40)
      return (uint64_t)v52;
    v20 = *(_QWORD *)(v39 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v40)
        return (uint64_t)v52;
      v20 = *(_QWORD *)(v39 + 8 * v9);
      if (!v20)
      {
        v9 = v19 + 2;
        if (v19 + 2 >= v40)
          return (uint64_t)v52;
        v20 = *(_QWORD *)(v39 + 8 * v9);
        if (!v20)
          break;
      }
    }
LABEL_18:
    v17 = (v20 - 1) & v20;
  }
  v21 = v19 + 3;
  if (v21 >= v40)
    return (uint64_t)v52;
  v20 = *(_QWORD *)(v39 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_18;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v40)
      return (uint64_t)v52;
    v20 = *(_QWORD *)(v39 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_18;
  }
LABEL_31:
  __break(1u);
LABEL_32:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t specialized static ObservationTracking._installTracking(_:onChange:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[10];

  v5 = *a1;
  swift_bridgeObjectRetain();
  result = _swift_observation_lock_size();
  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    v7 = swift_allocObject();
    _swift_observation_lock_init((_DWORD *)(v7 + 40));
    *(_QWORD *)(v7 + 16) = MEMORY[0x24BEE4B00];
    *(_BYTE *)(v7 + 24) = 0;
    *(_QWORD *)(v7 + 32) = 0;
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = a2;
    v8[3] = a3;
    v8[4] = v7;
    v8[5] = v5;
    v10[2] = partial apply for closure #1 in static ObservationTracking._installTracking(_:onChange:);
    v10[3] = MEMORY[0x24BDAC7A8]();
    v10[4] = 0;
    v10[5] = 0;
    v10[6] = v7;
    v10[7] = v5;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v9 = specialized _NativeDictionary.mapValues<A>(_:)((void (*)(__int128 *__return_ptr, __int128 *))partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:), (uint64_t)v10, v5);
    _swift_observation_lock_lock((os_unfair_lock_t)(v7 + 40));
    if (*(_BYTE *)(v7 + 24) == 1)
    {
      swift_release();
    }
    else
    {
      *(_QWORD *)(v7 + 16) = v9;
      swift_bridgeObjectRelease();
    }
    _swift_observation_lock_unlock((os_unfair_lock_t)(v7 + 40));
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  __int128 v13;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, ObservationTracking.Id>);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v4 = (unsigned __int8 *)(a1 + 56);
  do
  {
    v5 = *v4;
    if (v5 == 255)
      break;
    v6 = *((_QWORD *)v4 - 3);
    v13 = *((_OWORD *)v4 - 1);
    result = specialized __RawDictionaryStorage.find<A>(_:)(v6);
    if ((v8 & 1) != 0)
    {
      __break(1u);
LABEL_11:
      __break(1u);
      return result;
    }
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v6;
    v9 = v3[7] + 24 * result;
    *(_OWORD *)v9 = v13;
    *(_BYTE *)(v9 + 16) = v5;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v4 += 32;
    v3[2] = v12;
    --v1;
  }
  while (v1);
  return (unint64_t)v3;
}

void partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)(os_unfair_lock_s **a1@<X0>, uint64_t a2@<X8>)
{
  partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)(a1, a2);
}

{
  uint64_t *v2;

  closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], a2);
}

unint64_t lazy protocol witness table accessor for type ObservationRegistrar and conformance ObservationRegistrar()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ObservationRegistrar and conformance ObservationRegistrar;
  if (!lazy protocol witness table cache variable for type ObservationRegistrar and conformance ObservationRegistrar)
  {
    result = MEMORY[0x24BD2E558](&protocol conformance descriptor for ObservationRegistrar, &type metadata for ObservationRegistrar);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ObservationRegistrar and conformance ObservationRegistrar);
  }
  return result;
}

uint64_t type metadata completion function for _ManagedCriticalState.LockedBuffer()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for _ManagedCriticalState.LockedBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _ManagedCriticalState.LockedBuffer);
}

ValueMetadata *type metadata accessor for ObservationRegistrar()
{
  return &type metadata for ObservationRegistrar;
}

uint64_t type metadata accessor for ObservationRegistrar.ValueObservationStorage()
{
  return objc_opt_self();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ObservationTracking()
{
  return &type metadata for ObservationTracking;
}

ValueMetadata *type metadata accessor for ObservationTracking._AccessList()
{
  return &type metadata for ObservationTracking._AccessList;
}

uint64_t destroy for ObservationTracking.Entry()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for ObservationTracking(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ObservationTracking(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for ObservationTracking(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationTracking(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ObservationTracking(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ObservationTracking.Entry()
{
  return &type metadata for ObservationTracking.Entry;
}

ValueMetadata *type metadata accessor for ObservationRegistrar.Context()
{
  return &type metadata for ObservationRegistrar.Context;
}

uint64_t destroy for ObservationTracking.State()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeBufferWithCopyOfBuffer for ObservationTracking.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ObservationTracking.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ObservationTracking.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationTracking.State(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ObservationTracking.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ObservationTracking.State()
{
  return &type metadata for ObservationTracking.State;
}

uint64_t destroy for ObservationRegistrar.State()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for ObservationRegistrar.State(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ObservationRegistrar.State(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ObservationRegistrar.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationRegistrar.State(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ObservationRegistrar.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void *type metadata accessor for ObservationRegistrar.State()
{
  return &unk_251CDEBF8;
}

uint64_t type metadata instantiation function for _ManagedCriticalState()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for _ManagedCriticalState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _ManagedCriticalState);
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in _ManagedCriticalState<A>()
{
  return MEMORY[0x24BEE0948];
}

uint64_t partial apply for closure #2 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(uint64_t (**)(_QWORD *))(v1 + 32));
}

uint64_t outlined consume of ObservationRegistrar.State.ObservationKind(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 < 4u)
    return swift_release();
  return result;
}

uint64_t outlined copy of ObservationRegistrar.State.ObservationKind(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 < 4u)
    return swift_retain();
  return result;
}

uint64_t partial apply for closure #1 in generateAccessList<A>(_:)(uint64_t *a1)
{
  uint64_t v1;
  void (*v3)(uint64_t);
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v12;

  v3 = *(void (**)(uint64_t))(v1 + 24);
  v4 = (uint64_t *)_swift_observation_tls_get();
  v5 = _swift_observation_tls_set((uint64_t)a1);
  v3(v5);
  v6 = *a1;
  if (*a1)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = *v4;
    if (*v4)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v12 = v8;
      specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v6, (uint64_t)specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B), 0, isUniquelyReferenced_nonNull_native, &v12);
      v10 = v12;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *v4 = v10;
    }
    else
    {
      *v4 = v6;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
  }
  return _swift_observation_tls_set((uint64_t)v4);
}

uint64_t sub_24BC4ABF8()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

__n128 partial apply for closure #1 in static ObservationTracking._installTracking(_:onChange:)()
{
  uint64_t v0;
  __n128 result;

  (*(void (**)(void))(v0 + 16))();
  ObservationTracking.cancel()();
  return result;
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24BC4AD40()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed AnyKeyPath) -> ()(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24BD2E540](a1, v6, a5);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ObservationTracking.Id(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ObservationTracking.Id(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for ObservationTracking.Id(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for ObservationTracking.Id(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ObservationTracking.Id()
{
  return &type metadata for ObservationTracking.Id;
}

uint64_t initializeBufferWithCopyOfBuffer for ObservationRegistrar.State.Observation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ObservationRegistrar.State.Observation(uint64_t a1)
{
  outlined consume of ObservationRegistrar.State.ObservationKind(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ObservationRegistrar.State.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  outlined copy of ObservationRegistrar.State.ObservationKind(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ObservationRegistrar.State.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  outlined copy of ObservationRegistrar.State.ObservationKind(*(_QWORD *)a2, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v9 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  outlined consume of ObservationRegistrar.State.ObservationKind(v7, v8, v9);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for ObservationRegistrar.State.Observation(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v7 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  outlined consume of ObservationRegistrar.State.ObservationKind(v5, v6, v7);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationRegistrar.State.Observation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ObservationRegistrar.State.Observation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void *type metadata accessor for ObservationRegistrar.State.Observation()
{
  return &unk_251CDEF00;
}

uint64_t *initializeBufferWithCopyOfBuffer for Optional(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t destroy for Optional(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *initializeWithCopy for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithCopy for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

void *initializeWithTake for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithTake for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Optional(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  v8 = a2 - v6;
  if (a2 > v6)
  {
    v9 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v7);
      if (v10)
        goto LABEL_15;
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2)
          goto LABEL_24;
LABEL_8:
        v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_24;
LABEL_15:
        v12 = (v10 - 1) << v9;
        if (v7 > 3)
          v12 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v13 = v7;
          else
            v13 = 4;
          __asm { BR              X12 }
        }
        return v6 + v12 + 1;
      }
      v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_24:
  if (v5 < 2)
    return 0;
  v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

void storeEnumTagSinglePayload for Optional(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  v11 = a3 >= v9;
  v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 < a2)
        goto LABEL_14;
      goto LABEL_21;
    }
    v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }
            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }
            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }
        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }
        __asm { BR              X10 }
      }
LABEL_21:
      __asm { BR              X11 }
    }
    if (v13 >= 0x100)
      v6 = 2;
    else
      v6 = v13 > 1;
  }
  if (v9 < a2)
    goto LABEL_14;
  goto LABEL_21;
}

void sub_24BC4B7D8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_24BC4B7E0()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t getEnumTag for Optional(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 48))(a1, 1);
}

uint64_t destructiveInjectEnumTag for Optional(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 56))(a1, a2, 1);
}

uint64_t destroy for ObservationRegistrar.State.ObservationKind(uint64_t a1)
{
  return outlined consume of ObservationRegistrar.State.ObservationKind(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for ObservationRegistrar.State.ObservationKind(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of ObservationRegistrar.State.ObservationKind(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ObservationRegistrar.State.ObservationKind(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of ObservationRegistrar.State.ObservationKind(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of ObservationRegistrar.State.ObservationKind(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ObservationRegistrar.State.ObservationKind(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of ObservationRegistrar.State.ObservationKind(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationRegistrar.State.ObservationKind(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ObservationRegistrar.State.ObservationKind(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

void *type metadata accessor for ObservationRegistrar.State.ObservationKind()
{
  return &unk_251CDF040;
}

void *type metadata accessor for ObservationRegistrar.ValuesObserver()
{
  return &unk_251CDF068;
}

uint64_t _swift_observation_lock_size()
{
  return 4;
}

_DWORD *_swift_observation_lock_init(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t _swift_observation_tls_get()
{
  return *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 848);
}

uint64_t _swift_observation_tls_set(uint64_t result)
{
  *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 848) = result;
  return result;
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t type metadata accessor for AnyKeyPath()
{
  return MEMORY[0x24BEE20E8]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t ManagedBuffer.deinit()
{
  return MEMORY[0x24BEE27B0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
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

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x24BEE4CF8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

