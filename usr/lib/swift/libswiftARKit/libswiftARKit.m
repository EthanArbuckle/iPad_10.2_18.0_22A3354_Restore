BOOL static ARPlaneAnchor.Classification.Status.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ARPlaneAnchor.Classification.Status.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int ARPlaneAnchor.Classification.Status.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ARPlaneAnchor.Classification.Status(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ARPlaneAnchor.Classification.Status()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ARPlaneAnchor.Classification.Status()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ARPlaneAnchor.Classification.Status()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

char *ARPlaneAnchor.classification.getter@<X0>(char *a1@<X8>)
{
  void *v1;
  char *result;
  char v4;

  result = (char *)objc_msgSend(v1, sel_classification);
  if ((unint64_t)(result - 1) >= 7)
  {
    result = (char *)objc_msgSend(v1, sel_classificationStatus);
    if (result == (char *)2)
      v4 = 2;
    else
      v4 = 1;
    if (!result)
      v4 = 0;
  }
  else
  {
    v4 = (_BYTE)result + 2;
  }
  *a1 = v4;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ARConfidenceLevel(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance MTLVertexFormat(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance ARConfidenceLevel@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL specialized static ARPlaneAnchor.Classification.== infix(_:_:)(_BYTE *a1, unsigned __int8 *a2)
{
  int v2;
  _BOOL8 result;

  v2 = *a2;
  switch(*a1)
  {
    case 3:
      if (v2 != 3)
        goto LABEL_18;
      result = 1;
      break;
    case 4:
      if (v2 != 4)
        goto LABEL_18;
      result = 1;
      break;
    case 5:
      if (v2 != 5)
        goto LABEL_18;
      result = 1;
      break;
    case 6:
      if (v2 != 6)
        goto LABEL_18;
      result = 1;
      break;
    case 7:
      if (v2 != 7)
        goto LABEL_18;
      result = 1;
      break;
    case 8:
      if (v2 != 8)
        goto LABEL_18;
      result = 1;
      break;
    case 9:
      if (v2 != 9)
        goto LABEL_18;
      result = 1;
      break;
    default:
      if ((v2 - 3) < 7)
LABEL_18:
        result = 0;
      else
        result = *a1 == v2;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ARPlaneAnchor.Classification.Status and conformance ARPlaneAnchor.Classification.Status()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ARPlaneAnchor.Classification.Status and conformance ARPlaneAnchor.Classification.Status;
  if (!lazy protocol witness table cache variable for type ARPlaneAnchor.Classification.Status and conformance ARPlaneAnchor.Classification.Status)
  {
    result = MEMORY[0x2348A19CC](&protocol conformance descriptor for ARPlaneAnchor.Classification.Status, &type metadata for ARPlaneAnchor.Classification.Status);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ARPlaneAnchor.Classification.Status and conformance ARPlaneAnchor.Classification.Status);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ARPlaneAnchor.Classification(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
  {
    v6 = *a1;
    if (v6 >= 3)
      v7 = v6 - 2;
    else
      v7 = 0;
    if (v7 >= 8)
      return v7 - 7;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 9;
    if (a2 + 9 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_22F6D5824 + 4 * byte_22F6D7507[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for ARPlaneAnchor.Classification(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 9;
  if (a3 + 9 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xF7)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_22F6D58D0 + 4 * byte_22F6D7511[v5]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_22F6D5904 + 4 * byte_22F6D750C[v5]))();
}

uint64_t sub_22F6D5904(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22F6D590C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22F6D5914);
  return result;
}

uint64_t sub_22F6D5920(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22F6D5928);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_22F6D592C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22F6D5934(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ARPlaneAnchor.Classification(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 3)
    return v1 - 2;
  else
    return 0;
}

_BYTE *destructiveInjectEnumTag for ARPlaneAnchor.Classification(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 2;
  return result;
}

ValueMetadata *type metadata accessor for ARPlaneAnchor.Classification()
{
  return &type metadata for ARPlaneAnchor.Classification;
}

uint64_t getEnumTagSinglePayload for ARPlaneAnchor.Classification.Status(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ARPlaneAnchor.Classification.Status(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_22F6D5A54 + 4 * byte_22F6D751B[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22F6D5A88 + 4 * byte_22F6D7516[v4]))();
}

uint64_t sub_22F6D5A88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22F6D5A90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22F6D5A98);
  return result;
}

uint64_t sub_22F6D5AA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22F6D5AACLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22F6D5AB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22F6D5AB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ARPlaneAnchor.Classification.Status(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ARPlaneAnchor.Classification.Status(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ARPlaneAnchor.Classification.Status()
{
  return &type metadata for ARPlaneAnchor.Classification.Status;
}

void type metadata accessor for ARConfidenceLevel(uint64_t a1)
{
  type metadata accessor for ARConfidenceLevel(a1, &lazy cache variable for type metadata for ARConfidenceLevel);
}

uint64_t initializeBufferWithCopyOfBuffer for simd_float4x4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for simd_float4x4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for simd_float4x4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
  type metadata accessor for ARConfidenceLevel(a1, &lazy cache variable for type metadata for simd_float4x4);
}

void type metadata accessor for ARConfidenceLevel(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

_QWORD *ARPointCloud.points.getter()
{
  void *v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(objc_msgSend(v0, sel_points), (uint64_t)objc_msgSend(v0, sel_count));
}

_QWORD *ARPointCloud.identifiers.getter()
{
  void *v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(objc_msgSend(v0, sel_identifiers), (uint64_t)objc_msgSend(v0, sel_count), &demangling cache variable for type metadata for _ContiguousArrayStorage<UInt64>);
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, uint64_t a2)
{
  size_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = 16 * a2;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SIMD3<Float>>);
    v4 = 16 * a2;
    v5 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 17;
    v5[2] = a2;
    v5[3] = 2 * (v7 >> 4);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

{
  return specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2, &demangling cache variable for type metadata for _ContiguousArrayStorage<SIMD2<Float>>);
}

{
  size_t v4;
  _QWORD *v5;
  int64_t v6;
  int64_t v7;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = 2 * a2;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int16>);
    v4 = 2 * a2;
    v5 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 31;
    v5[2] = a2;
    v5[3] = v7 & 0xFFFFFFFFFFFFFFFELL;
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

{
  size_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = a2 << 6;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<simd_float4x4>);
    v4 = a2 << 6;
    v5 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 + 31;
    v5[2] = a2;
    v5[3] = 2 * (v7 >> 6);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, uint64_t a2, uint64_t *a3)
{
  size_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v5 = 8 * a2;
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v5 = 8 * a2;
    v6 = (_QWORD *)swift_allocObject();
    v7 = _swift_stdlib_malloc_size(v6);
    v8 = v7 - 32;
    if (v7 < 32)
      v8 = v7 - 25;
    v6[2] = a2;
    v6[3] = 2 * (v8 >> 3);
  }
  memcpy(v6 + 4, a1, v5);
  return v6;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348A19C0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

BOOL static ARConfidenceLevel.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

unint64_t lazy protocol witness table accessor for type ARConfidenceLevel and conformance ARConfidenceLevel()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type ARConfidenceLevel and conformance ARConfidenceLevel;
  if (!lazy protocol witness table cache variable for type ARConfidenceLevel and conformance ARConfidenceLevel)
  {
    type metadata accessor for ARConfidenceLevel(255);
    result = MEMORY[0x2348A19CC](&protocol conformance descriptor for ARConfidenceLevel, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ARConfidenceLevel and conformance ARConfidenceLevel);
  }
  return result;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance ARConfidenceLevel(_QWORD *a1, _QWORD *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance ARConfidenceLevel(_QWORD *a1, _QWORD *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance ARConfidenceLevel(_QWORD *a1, _QWORD *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance ARConfidenceLevel(_QWORD *a1, _QWORD *a2)
{
  return *a2 < *a1;
}

uint64_t ARGeometrySource.subscript.getter(int a1)
{
  void *v1;
  uint64_t result;
  id v4;
  id v5;
  id v6;
  uint64_t v7;

  result = (uint64_t)objc_msgSend(v1, sel_format);
  if (result != 30)
  {
    __break(1u);
    goto LABEL_6;
  }
  v4 = objc_msgSend(v1, sel_buffer);
  objc_msgSend(v4, sel_contents);
  v5 = v4;
  v6 = objc_msgSend(v1, sel_offset);
  result = (uint64_t)objc_msgSend(v1, sel_stride);
  v7 = result * a1;
  if ((unsigned __int128)(result * (__int128)a1) >> 64 != v7 >> 63)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (__OFADD__(v6, v7))
LABEL_7:
    __break(1u);
  return result;
}

{
  void *v1;
  uint64_t result;
  id v4;
  id v5;
  id v6;
  char *v7;
  uint64_t v8;
  BOOL v9;
  char *v10;

  result = (uint64_t)objc_msgSend(v1, sel_format);
  if (result != 45)
  {
    __break(1u);
    goto LABEL_6;
  }
  v4 = objc_msgSend(v1, sel_buffer);
  v5 = objc_msgSend(v4, sel_contents);
  v6 = v4;
  v7 = (char *)objc_msgSend(v1, sel_offset);
  result = (uint64_t)objc_msgSend(v1, sel_stride);
  v8 = result * a1;
  if ((unsigned __int128)(result * (__int128)a1) >> 64 != v8 >> 63)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v9 = __OFADD__(v7, v8);
  v10 = &v7[v8];
  if (!v9)
    return v10[(_QWORD)v5];
LABEL_7:
  __break(1u);
  return result;
}

uint64_t ARGeometryElement.subscript.getter(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _DWORD *v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  unint64_t v16;

  result = (uint64_t)objc_msgSend(v1, sel_bytesPerIndex);
  if (result != 4)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v4 = (uint64_t)objc_msgSend(v1, sel_indexCountPerPrimitive);
  v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0, MEMORY[0x24BEE4AF8]);
  result = (uint64_t)objc_msgSend(v1, sel_indexCountPerPrimitive);
  if ((result & 0x8000000000000000) == 0)
  {
    v6 = result;
    if (!result)
      return (uint64_t)v5;
    v7 = 0;
    while (1)
    {
      v8 = objc_msgSend(v1, sel_buffer);
      v9 = objc_msgSend(v8, sel_contents);
      v10 = v8;
      result = (uint64_t)objc_msgSend(v1, sel_indexCountPerPrimitive);
      v11 = a1 * result;
      if ((unsigned __int128)(a1 * (__int128)result) >> 64 != (a1 * result) >> 63)
        break;
      v12 = __OFADD__(v11, v7);
      v13 = v11 + v7;
      if (v12)
        goto LABEL_13;
      if ((unint64_t)(v13 - 0x2000000000000000) >> 62 != 3)
        goto LABEL_14;
      v14 = v9[v13];
      v16 = *((_QWORD *)v5 + 2);
      v15 = *((_QWORD *)v5 + 3);
      if (v16 >= v15 >> 1)
        v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v15 > 1), v16 + 1, 1, v5);
      ++v7;
      *((_QWORD *)v5 + 2) = v16 + 1;
      *(_DWORD *)&v5[4 * v16 + 32] = v14;
      if (v6 == v7)
        return (uint64_t)v5;
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t ARPlaneGeometry.vertices.getter()
{
  return ARPlaneGeometry.vertices.getter((SEL *)&selRef_vertices, (SEL *)&selRef_vertexCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARPlaneGeometry.textureCoordinates.getter()
{
  return ARPlaneGeometry.vertices.getter((SEL *)&selRef_textureCoordinates, (SEL *)&selRef_textureCoordinateCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARPlaneGeometry.triangleIndices.getter()
{
  void *v0;
  id v1;
  uint64_t result;

  v1 = objc_msgSend(v0, sel_triangleIndices);
  result = (uint64_t)objc_msgSend(v0, sel_triangleCount);
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
    return (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(v1, 3 * result);
  __break(1u);
  return result;
}

uint64_t ARPlaneGeometry.boundaryVertices.getter()
{
  return ARPlaneGeometry.vertices.getter((SEL *)&selRef_boundaryVertices, (SEL *)&selRef_boundaryVertexCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARPlaneGeometry.vertices.getter(SEL *a1, SEL *a2, uint64_t (*a3)(id, id))
{
  void *v3;

  return a3(objc_msgSend(v3, *a1), objc_msgSend(v3, *a2));
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int32>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t ARSCNView.unprojectPoint(_:ontoPlane:)()
{
  void *v0;
  uint64_t v1;
  int v2;
  BOOL v3;
  BOOL v4;
  BOOL v5;

  objc_msgSend(v0, sel_unprojectPoint_ontoPlaneWithTransform_);
  v3 = (~(_DWORD)v1 & 0x7F800000) != 0 || (v1 & 0x7FFFFF) == 0;
  if (v3
    && ((~HIDWORD(v1) & 0x7F800000) == 0 ? (v4 = (v1 & 0x7FFFFF00000000) == 0) : (v4 = 1),
        v4 && ((~v2 & 0x7F800000) == 0 ? (v5 = (v2 & 0x7FFFFF) == 0) : (v5 = 1), v5)))
  {
    return v1;
  }
  else
  {
    return 0;
  }
}

ARGeoAnchor __swiftcall ARGeoAnchor.init(coordinate:altitude:)(CLLocationCoordinate2D coordinate, Swift::Double_optional altitude)
{
  char v2;
  double longitude;
  double latitude;
  double v5;
  id v6;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  if ((v2 & 1) == 0)
    return (ARGeoAnchor)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoordinate_altitude_, coordinate.latitude, coordinate.longitude, *(double *)&altitude.is_nil);
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (ARGeoAnchor)objc_msgSend(v6, sel_initWithCoordinate_, latitude, longitude, v5);
}

ARGeoAnchor __swiftcall ARGeoAnchor.init(name:coordinate:altitude:)(Swift::String name, CLLocationCoordinate2D coordinate, Swift::Double_optional altitude)
{
  char v3;
  double longitude;
  double latitude;
  void *object;
  uint64_t countAndFlagsBits;
  double v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  ARGeoAnchor v13;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  object = name._object;
  countAndFlagsBits = name._countAndFlagsBits;
  if ((v3 & 1) != 0)
  {
    v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    v10 = (void *)MEMORY[0x2348A1870](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
    v11 = (objc_class *)objc_msgSend(v12, sel_initWithName_coordinate_, v10, latitude, longitude);
  }
  else
  {
    v8 = *(double *)&altitude.is_nil;
    v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    v10 = (void *)MEMORY[0x2348A1870](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
    v11 = (objc_class *)objc_msgSend(v9, sel_initWithName_coordinate_altitude_, v10, latitude, longitude, v8);
  }
  v13.super.super.isa = v11;

  return v13;
}

double ARGeoAnchor.altitude.getter()
{
  void *v0;
  double result;

  if (objc_msgSend(v0, sel_altitudeSource))
    objc_msgSend(v0, sel_altitude);
  return result;
}

char *ARSkeletonDefinition.parentIndices.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = objc_msgSend(v0, sel_parentIndices);
  type metadata accessor for NSNumber();
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v12 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v12;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x2348A1888](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_integerValue);

      v11 = *(_QWORD *)(v12 + 16);
      v10 = *(_QWORD *)(v12 + 24);
      if (v11 >= v10 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v11 + 1;
      *(_QWORD *)(v12 + 8 * v11 + 32) = v9;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
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

Swift::Int __swiftcall ARSkeletonDefinition.index(for:)(ARSkeletonJointName a1)
{
  void *v1;

  return (Swift::Int)objc_msgSend(v1, sel_indexForJointName_, a1);
}

uint64_t ARSkeleton3D.jointModelTransforms.getter()
{
  return ARSkeleton3D.jointModelTransforms.getter((SEL *)&selRef_jointModelTransforms, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARSkeleton3D.jointLocalTransforms.getter()
{
  return ARSkeleton3D.jointModelTransforms.getter((SEL *)&selRef_jointLocalTransforms, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

void __swiftcall ARSkeleton3D.modelTransform(for:)(simd_float4x4_optional *__return_ptr retstr, ARSkeletonJointName a2)
{
  ARSkeleton3D.modelTransform(for:)((uint64_t)a2, (SEL *)&selRef_jointModelTransforms, (uint64_t)retstr);
}

void __swiftcall ARSkeleton3D.localTransform(for:)(simd_float4x4_optional *__return_ptr retstr, ARSkeletonJointName a2)
{
  ARSkeleton3D.modelTransform(for:)((uint64_t)a2, (SEL *)&selRef_jointLocalTransforms, (uint64_t)retstr);
}

void ARSkeleton3D.modelTransform(for:)(uint64_t a1@<X0>, SEL *a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v7 = objc_msgSend(v3, sel_definition);
  v8 = (unint64_t)objc_msgSend(v7, sel_indexForJointName_, a1);

  if ((v8 & 0x8000000000000000) != 0
    || (v9 = objc_msgSend(v3, sel_definition),
        v10 = objc_msgSend(v9, sel_jointCount),
        v9,
        (uint64_t)v8 >= (uint64_t)v10))
  {
    v14 = 0;
    v13 = 0;
    v16 = 0;
    v15 = 0;
    v18 = 0;
    v17 = 0;
    v20 = 0;
    v19 = 0;
    v21 = 1;
    goto LABEL_6;
  }
  v11 = specialized _copyCollectionToContiguousArray<A>(_:)(objc_msgSend(v3, *a2), (uint64_t)objc_msgSend(v3, sel_jointCount));
  if (v8 < v11[2])
  {
    v12 = &v11[8 * v8];
    v14 = v12[4];
    v13 = v12[5];
    v16 = v12[6];
    v15 = v12[7];
    v18 = v12[8];
    v17 = v12[9];
    v20 = v12[10];
    v19 = v12[11];
    swift_release();
    v21 = 0;
LABEL_6:
    *(_QWORD *)a3 = v14;
    *(_QWORD *)(a3 + 8) = v13;
    *(_QWORD *)(a3 + 16) = v16;
    *(_QWORD *)(a3 + 24) = v15;
    *(_QWORD *)(a3 + 32) = v18;
    *(_QWORD *)(a3 + 40) = v17;
    *(_QWORD *)(a3 + 48) = v20;
    *(_QWORD *)(a3 + 56) = v19;
    *(_BYTE *)(a3 + 64) = v21;
    return;
  }
  __break(1u);
}

uint64_t ARSkeleton2D.jointLandmarks.getter()
{
  return ARSkeleton3D.jointModelTransforms.getter((SEL *)&selRef_jointLandmarks, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARSkeleton3D.jointModelTransforms.getter(SEL *a1, uint64_t (*a2)(id, id))
{
  void *v2;

  return a2(objc_msgSend(v2, *a1), objc_msgSend(v2, sel_jointCount));
}

_QWORD *ARSkeleton2D.landmark(for:)(uint64_t a1)
{
  void *v1;
  id v3;
  unint64_t v4;
  id v5;
  id v6;
  _QWORD *result;
  uint64_t v8;

  v3 = objc_msgSend(v1, sel_definition);
  v4 = (unint64_t)objc_msgSend(v3, sel_indexForJointName_, a1);

  if ((v4 & 0x8000000000000000) != 0)
    return 0;
  v5 = objc_msgSend(v1, sel_definition);
  v6 = objc_msgSend(v5, sel_jointCount);

  if ((uint64_t)v4 >= (uint64_t)v6)
    return 0;
  result = specialized _copyCollectionToContiguousArray<A>(_:)(objc_msgSend(v1, sel_jointLandmarks), (uint64_t)objc_msgSend(v1, sel_jointCount));
  if (v4 < result[2])
  {
    v8 = result[v4 + 4];
    swift_release();
    return (_QWORD *)v8;
  }
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
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

uint64_t ARFaceGeometry.vertices.getter()
{
  return ARPlaneGeometry.vertices.getter((SEL *)&selRef_vertices, (SEL *)&selRef_vertexCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARFaceGeometry.textureCoordinates.getter()
{
  return ARPlaneGeometry.vertices.getter((SEL *)&selRef_textureCoordinates, (SEL *)&selRef_textureCoordinateCount, (uint64_t (*)(id, id))specialized _copyCollectionToContiguousArray<A>(_:));
}

uint64_t ARFaceGeometry.triangleIndices.getter()
{
  void *v0;
  id v1;
  uint64_t result;

  v1 = objc_msgSend(v0, sel_triangleIndices);
  result = (uint64_t)objc_msgSend(v0, sel_triangleCount);
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
    return (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(v1, 3 * result);
  __break(1u);
  return result;
}

BOOL static ARCamera.TrackingState.Reason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ARCamera.TrackingState.Reason.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int ARCamera.TrackingState.Reason.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

id ARCamera.trackingState.getter@<X0>(char *a1@<X8>)
{
  void *v1;
  id result;
  char v4;

  result = objc_msgSend(v1, sel_trackingState);
  if (!result)
  {
    v4 = 4;
LABEL_9:
    *a1 = v4;
    return result;
  }
  if (result == (id)1)
  {
    result = objc_msgSend(v1, sel_trackingStateReason);
    if ((unint64_t)result >= 5)
      v4 = 2;
    else
      v4 = 0x302010002uLL >> (8 * result);
    goto LABEL_9;
  }
  if (result == (id)2)
  {
    v4 = 5;
    goto LABEL_9;
  }
  result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ARCamera.unprojectPoint(_:ontoPlane:orientation:viewportSize:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  int v3;
  BOOL v4;
  BOOL v5;
  BOOL v6;

  objc_msgSend(v1, sel_unprojectPoint_ontoPlaneWithTransform_orientation_viewportSize_, a1);
  v4 = (~(_DWORD)v2 & 0x7F800000) != 0 || (v2 & 0x7FFFFF) == 0;
  if (v4
    && ((~HIDWORD(v2) & 0x7F800000) == 0 ? (v5 = (v2 & 0x7FFFFF00000000) == 0) : (v5 = 1),
        v5 && ((~v3 & 0x7F800000) == 0 ? (v6 = (v3 & 0x7FFFFF) == 0) : (v6 = 1), v6)))
  {
    return v2;
  }
  else
  {
    return 0;
  }
}

BOOL static ARCamera.TrackingState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 5)
    return v3 == 5;
  if (v2 == 4)
    return v3 == 4;
  if ((v3 & 0xFE) == 4)
    return 0;
  return v2 == v3;
}

unint64_t lazy protocol witness table accessor for type ARCamera.TrackingState.Reason and conformance ARCamera.TrackingState.Reason()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ARCamera.TrackingState.Reason and conformance ARCamera.TrackingState.Reason;
  if (!lazy protocol witness table cache variable for type ARCamera.TrackingState.Reason and conformance ARCamera.TrackingState.Reason)
  {
    result = MEMORY[0x2348A19CC](&protocol conformance descriptor for ARCamera.TrackingState.Reason, &type metadata for ARCamera.TrackingState.Reason);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ARCamera.TrackingState.Reason and conformance ARCamera.TrackingState.Reason);
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ARCamera.TrackingState(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 5)
    return v3 == 5;
  if (v2 == 4)
    return v3 == 4;
  if ((v3 & 0xFE) == 4)
    return 0;
  return v2 == v3;
}

uint64_t getEnumTagSinglePayload for ARCamera.TrackingState(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
  {
    v6 = *a1;
    if (v6 >= 4)
      v7 = v6 - 3;
    else
      v7 = 0;
    if (v7 >= 3)
      return v7 - 2;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 5;
    if (a2 + 5 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_22F6D70B4 + 4 * byte_22F6D76F8[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for ARCamera.TrackingState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 5;
  if (a3 + 5 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFB)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_22F6D7160 + 4 * byte_22F6D7702[v5]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_22F6D7194 + 4 * byte_22F6D76FD[v5]))();
}

uint64_t sub_22F6D7194(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22F6D719C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22F6D71A4);
  return result;
}

uint64_t sub_22F6D71B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22F6D71B8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_22F6D71BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22F6D71C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ARCamera.TrackingState(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 4)
    return v1 - 3;
  else
    return 0;
}

_BYTE *destructiveInjectEnumTag for ARCamera.TrackingState(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 3;
  return result;
}

ValueMetadata *type metadata accessor for ARCamera.TrackingState()
{
  return &type metadata for ARCamera.TrackingState;
}

uint64_t getEnumTagSinglePayload for ARCamera.TrackingState.Reason(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ARCamera.TrackingState.Reason(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_22F6D72E0 + 4 * byte_22F6D770C[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22F6D7314 + 4 * byte_22F6D7707[v4]))();
}

uint64_t sub_22F6D7314(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22F6D731C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22F6D7324);
  return result;
}

uint64_t sub_22F6D7330(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22F6D7338);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22F6D733C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22F6D7344(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ARCamera.TrackingState.Reason()
{
  return &type metadata for ARCamera.TrackingState.Reason;
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

