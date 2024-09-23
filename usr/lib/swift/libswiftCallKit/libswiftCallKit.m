uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A0FCDC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t CXProviderConfiguration.supportedHandleTypes.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  int64_t v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void (*v24)(char *, _QWORD);
  uint64_t v25;
  char v26[32];
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v1 = objc_msgSend(v0, sel_supportedHandleTypes);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NSNumber and conformance NSObject(&lazy protocol witness table cache variable for type NSNumber and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for NSNumber, MEMORY[0x24BEE5BD8]);
  v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = v2 & 0xC000000000000001;
  if ((v2 & 0xC000000000000001) != 0)
  {
    v4 = __CocoaSet.count.getter();
    if (v4)
      goto LABEL_3;
LABEL_6:
    swift_bridgeObjectRelease();
    v8 = MEMORY[0x24BEE4AF8];
LABEL_21:
    v25 = specialized Set.init<A>(_:)(v8);
    swift_bridgeObjectRelease();
    return v25;
  }
  v4 = *(_QWORD *)(v2 + 16);
  if (!v4)
    goto LABEL_6;
LABEL_3:
  v30 = MEMORY[0x24BEE4AF8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if (v3)
  {
    result = __CocoaSet.startIndex.getter();
    v7 = 1;
  }
  else
  {
    result = specialized _NativeSet.startIndex.getter(v2);
    v7 = v9 & 1;
  }
  v27 = result;
  v28 = v6;
  v29 = v7;
  if ((v4 & 0x8000000000000000) == 0)
  {
    do
    {
      while (1)
      {
        v16 = v27;
        v15 = v28;
        v17 = v29;
        specialized Set.subscript.getter(v27, v28, v29, v2);
        v19 = v18;
        v20 = objc_msgSend(v18, sel_integerValue);

        v21 = v30;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v21 + 16) + 1, 1);
          v21 = v30;
        }
        v23 = *(_QWORD *)(v21 + 16);
        v22 = *(_QWORD *)(v21 + 24);
        if (v23 >= v22 >> 1)
        {
          result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v22 > 1), v23 + 1, 1);
          v21 = v30;
        }
        *(_QWORD *)(v21 + 16) = v23 + 1;
        *(_QWORD *)(v21 + 8 * v23 + 32) = v20;
        if (v3)
          break;
        v10 = specialized _NativeSet.index(after:)(v16, v15, v17, v2);
        v12 = v11;
        v14 = v13;
        outlined consume of Set<NSNumber>.Index._Variant(v16, v15, v17);
        v27 = v10;
        v28 = v12;
        v29 = v14 & 1;
        if (!--v4)
          goto LABEL_20;
      }
      if ((v17 & 1) == 0)
        goto LABEL_23;
      if (__CocoaSet.Index.handleBitPattern.getter())
        swift_isUniquelyReferenced_nonNull_native();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<NSNumber>.Index);
      v24 = (void (*)(char *, _QWORD))Set.Index._asCocoa.modify();
      __CocoaSet.formIndex(after:isUnique:)();
      v24(v26, 0);
      --v4;
    }
    while (v4);
LABEL_20:
    outlined consume of Set<NSNumber>.Index._Variant(v27, v28, v29);
    swift_bridgeObjectRelease();
    v8 = v30;
    goto LABEL_21;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

uint64_t key path getter for CXProviderConfiguration.supportedHandleTypes : CXProviderConfiguration@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CXProviderConfiguration.supportedHandleTypes.getter();
  *a1 = result;
  return result;
}

void key path setter for CXProviderConfiguration.supportedHandleTypes : CXProviderConfiguration(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  Class isa;

  v2 = *a2;
  v3 = swift_bridgeObjectRetain();
  specialized Set.init<A>(_:)(v3, closure #1 in CXProviderConfiguration.supportedHandleTypes.setter, 0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NSNumber and conformance NSObject(&lazy protocol witness table cache variable for type NSNumber and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for NSNumber, MEMORY[0x24BEE5BD8]);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setSupportedHandleTypes_, isa);

}

void CXProviderConfiguration.supportedHandleTypes.setter(uint64_t a1)
{
  void *v1;
  Class isa;

  specialized Set.init<A>(_:)(a1, closure #1 in CXProviderConfiguration.supportedHandleTypes.setter, 0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NSNumber and conformance NSObject(&lazy protocol witness table cache variable for type NSNumber and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for NSNumber, MEMORY[0x24BEE5BD8]);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setSupportedHandleTypes_, isa);

}

uint64_t specialized Set.init<A>(_:)(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v15[8];
  uint64_t v16;

  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NSNumber and conformance NSObject(&lazy protocol witness table cache variable for type NSNumber and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for NSNumber, MEMORY[0x24BEE5BD8]);
  v6 = Set.init(minimumCapacity:)();
  v16 = v6;
  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 56);
  v10 = -v7;
  v15[1] = (id)a1;
  v15[2] = (id)(a1 + 56);
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v15[3] = (id)v8;
  v15[4] = 0;
  v15[5] = (id)(v11 & v9);
  v15[6] = a2;
  v15[7] = a3;
  v12 = specialized LazyMapSequence.Iterator.next()();
  if (v12)
  {
    v13 = (void *)v12;
    do
    {
      specialized Set._Variant.insert(_:)(v15, v13);

      v13 = (void *)specialized LazyMapSequence.Iterator.next()();
    }
    while (v13);
    v6 = v16;
  }
  outlined consume of Set<CXHandleType>.Iterator._Variant();
  swift_release();
  return v6;
}

NSNumber closure #1 in CXProviderConfiguration.supportedHandleTypes.setter@<X0>(NSNumber *a1@<X8>)
{
  NSNumber result;

  result.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
  a1->super.super.isa = result.super.super.isa;
  return result;
}

void (*CXProviderConfiguration.supportedHandleTypes.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = CXProviderConfiguration.supportedHandleTypes.getter();
  return CXProviderConfiguration.supportedHandleTypes.modify;
}

void CXProviderConfiguration.supportedHandleTypes.modify(uint64_t *a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  Class isa;
  Class v7;

  v3 = *a1;
  v4 = (void *)a1[1];
  if ((a2 & 1) != 0)
  {
    v5 = swift_bridgeObjectRetain();
    specialized Set.init<A>(_:)(v5, closure #1 in CXProviderConfiguration.supportedHandleTypes.setter, 0);
    type metadata accessor for NSNumber();
    lazy protocol witness table accessor for type NSNumber and conformance NSObject(&lazy protocol witness table cache variable for type NSNumber and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for NSNumber, MEMORY[0x24BEE5BD8]);
    isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setSupportedHandleTypes_, isa);

    swift_bridgeObjectRelease();
  }
  else
  {
    specialized Set.init<A>(_:)(v3, closure #1 in CXProviderConfiguration.supportedHandleTypes.setter, 0);
    type metadata accessor for NSNumber();
    lazy protocol witness table accessor for type NSNumber and conformance NSObject(&lazy protocol witness table cache variable for type NSNumber and conformance NSObject, (uint64_t (*)(uint64_t))type metadata accessor for NSNumber, MEMORY[0x24BEE5BD8]);
    v7 = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setSupportedHandleTypes_, v7);

  }
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CXHandleType()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CXHandleType()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CXHandleType()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CXHandleType(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance CXHandleType@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CXHandleType(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t specialized Set._Variant.insert(_:)(Swift::UInt *a1, Swift::UInt a2)
{
  uint64_t *v2;
  uint64_t v5;
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a2);
  v6 = Hasher._finalize()();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    specialized _NativeSet.insertNew(_:at:isUnique:)(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 8 * v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v9 + 8 * v8) != a2);
  }
  result = 0;
  a2 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  Swift::Int v11;
  Swift::Int v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  void *v20;
  id v21;
  Swift::Int v22;
  _QWORD *v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for NSNumber();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v22 = specialized _NativeSet.init(_:capacity:)(v7, result + 1);
    v28 = (_QWORD *)v22;
    if (*(_QWORD *)(v22 + 24) <= *(_QWORD *)(v22 + 16))
    {
      v26 = v8;
      specialized _NativeSet.resize(capacity:)();
      v23 = v28;
    }
    else
    {
      v23 = (_QWORD *)v22;
      v24 = v8;
    }
    specialized _NativeSet._unsafeInsertNew(_:)((uint64_t)v8, v23);
    *v3 = (uint64_t)v23;
  }
  else
  {
    v11 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain();
    v12 = NSObject._rawHashValue(seed:)(v11);
    v13 = -1 << *(_BYTE *)(v6 + 32);
    v14 = v12 & ~v13;
    if (((*(_QWORD *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      type metadata accessor for NSNumber();
      v15 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v14);
      v16 = static NSObject.== infix(_:_:)();

      if ((v16 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v20 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        v21 = v20;
        return 0;
      }
      v17 = ~v13;
      while (1)
      {
        v14 = (v14 + 1) & v17;
        if (((*(_QWORD *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v14);
        v19 = static NSObject.== infix(_:_:)();

        if ((v19 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    specialized _NativeSet.insertNew(_:at:isUnique:)((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NSNumber>);
    v2 = static _SetStorage.convert(_:capacity:)();
    v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      type metadata accessor for NSNumber();
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          specialized _NativeSet.resize(capacity:)();
          v2 = v14;
        }
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
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
  _QWORD *v6;
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
  Swift::UInt v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<CXHandleType>);
  result = static _SetStorage.resize(original:capacity:move:)();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
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
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v18);
      result = Hasher._finalize()();
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
            goto LABEL_38;
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
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NSNumber>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t specialized _NativeSet._unsafeInsertNew(_:)(uint64_t a1, _QWORD *a2)
{
  unint64_t result;

  NSObject._rawHashValue(seed:)(a2[5]);
  result = _HashTable.nextHole(atOrAfter:)();
  *(_QWORD *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(_QWORD *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t *v3;
  Swift::UInt v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v8 = *v3;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v5);
  result = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for CXHandleType();
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v7 > v6)
    {
      specialized _NativeSet.copy()();
      goto LABEL_14;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v8 = *v3;
  v9 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    type metadata accessor for NSNumber();
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = static NSObject.== infix(_:_:)();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = static NSObject.== infix(_:_:)();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<CXHandleType>);
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

id specialized _NativeSet.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NSNumber>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
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
  Swift::UInt v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<CXHandleType>);
  result = static _SetStorage.resize(original:capacity:move:)();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
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
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v18);
    result = Hasher._finalize()();
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
    v1 = v0;
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
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  Swift::Int v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<NSNumber>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v28 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(_QWORD *)(v4 + 40);
    v20 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = NSObject._rawHashValue(seed:)(v19);
    v21 = -1 << *(_BYTE *)(v4 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v28;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<CXHandleType>);
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
  swift_release();
  return v10;
}

int64_t specialized _NativeSet.index(after:)(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void specialized Set.subscript.getter(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter() == *(_DWORD *)(a4 + 36))
      {
        __CocoaSet.Index.element.getter();
        type metadata accessor for NSNumber();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = static NSObject.== infix(_:_:)();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = static NSObject.== infix(_:_:)();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x219A0FB44](a1, a2, v7);
  type metadata accessor for NSNumber();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t outlined consume of Set<NSNumber>.Index._Variant(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t specialized _NativeSet.startIndex.getter(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t specialized LazyMapSequence.Iterator.next()()
{
  _QWORD *v0;
  unint64_t v1;
  int64_t v2;
  int64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t *__return_ptr, uint64_t *);
  uint64_t result;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v0[3];
  v1 = v0[4];
  v3 = v2;
  if (v1)
  {
    v4 = (v1 - 1) & v1;
    v5 = __clz(__rbit64(v1)) | (v2 << 6);
LABEL_3:
    v6 = *(_QWORD *)(*(_QWORD *)(*v0 + 48) + 8 * v5);
    v0[3] = v3;
    v0[4] = v4;
    v7 = (void (*)(uint64_t *__return_ptr, uint64_t *))v0[5];
    v16 = v6;
    v7(&v15, &v16);
    return v15;
  }
  v9 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v10 = (unint64_t)(v0[2] + 64) >> 6;
    if (v9 < v10)
    {
      v11 = v0[1];
      v12 = *(_QWORD *)(v11 + 8 * v9);
      if (v12)
      {
LABEL_7:
        v4 = (v12 - 1) & v12;
        v5 = __clz(__rbit64(v12)) + (v9 << 6);
        v3 = v9;
        goto LABEL_3;
      }
      v13 = v2 + 2;
      v3 = v2 + 1;
      if (v2 + 2 < v10)
      {
        v12 = *(_QWORD *)(v11 + 8 * v13);
        if (v12)
        {
LABEL_10:
          v9 = v13;
          goto LABEL_7;
        }
        v3 = v2 + 2;
        if (v2 + 3 < v10)
        {
          v12 = *(_QWORD *)(v11 + 8 * (v2 + 3));
          if (v12)
          {
            v9 = v2 + 3;
            goto LABEL_7;
          }
          v13 = v2 + 4;
          v3 = v2 + 3;
          if (v2 + 4 < v10)
          {
            v12 = *(_QWORD *)(v11 + 8 * v13);
            if (v12)
              goto LABEL_10;
            v9 = v2 + 5;
            v3 = v2 + 4;
            if (v2 + 5 < v10)
            {
              v12 = *(_QWORD *)(v11 + 8 * v9);
              if (v12)
                goto LABEL_7;
              v3 = v10 - 1;
              v14 = v2 + 6;
              while (v10 != v14)
              {
                v12 = *(_QWORD *)(v11 + 8 * v14++);
                if (v12)
                {
                  v9 = v14 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v3;
    v0[4] = 0;
  }
  return result;
}

uint64_t specialized Set.init<A>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  Swift::UInt *v4;
  Swift::UInt v5;
  Swift::UInt v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  type metadata accessor for CXHandleType();
  lazy protocol witness table accessor for type NSNumber and conformance NSObject(&lazy protocol witness table cache variable for type CXHandleType and conformance CXHandleType, (uint64_t (*)(uint64_t))type metadata accessor for CXHandleType, (uint64_t)&protocol conformance descriptor for CXHandleType);
  result = Set.init(minimumCapacity:)();
  v7 = result;
  if (v2)
  {
    v4 = (Swift::UInt *)(a1 + 32);
    do
    {
      v5 = *v4++;
      specialized Set._Variant.insert(_:)(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t outlined consume of Set<CXHandleType>.Iterator._Variant()
{
  return swift_release();
}

void type metadata accessor for CXHandleType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for CXHandleType)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for CXHandleType);
  }
}

uint64_t base witness table accessor for Equatable in CXHandleType()
{
  return lazy protocol witness table accessor for type NSNumber and conformance NSObject(&lazy protocol witness table cache variable for type CXHandleType and conformance CXHandleType, (uint64_t (*)(uint64_t))type metadata accessor for CXHandleType, (uint64_t)&protocol conformance descriptor for CXHandleType);
}

uint64_t lazy protocol witness table accessor for type NSNumber and conformance NSObject(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x219A0FCE8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x24BDCFCC0]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t Set.Index._asCocoa.modify()
{
  return MEMORY[0x24BEE1608]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFD28]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE5BB8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t __CocoaSet.element(at:)()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return MEMORY[0x24BEE2370]();
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

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

