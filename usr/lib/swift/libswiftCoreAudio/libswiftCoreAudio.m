_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0C0158]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0C0164](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

__n128 __swift_memcpy28_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(__n128 *)a1 = result;
  return result;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioBufferList(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AudioBufferList(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for AudioBufferList(uint64_t a1)
{
  type metadata accessor for AudioBufferList(a1, &lazy cache variable for type metadata for AudioBufferList);
}

__n128 __swift_memcpy20_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioChannelDescription(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 20))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AudioChannelDescription(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 20) = v3;
  return result;
}

void type metadata accessor for AudioChannelDescription(uint64_t a1)
{
  type metadata accessor for AudioBufferList(a1, &lazy cache variable for type metadata for AudioChannelDescription);
}

uint64_t initializeBufferWithCopyOfBuffer for AudioChannelLayout(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t getEnumTagSinglePayload for AudioChannelLayout(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AudioChannelLayout(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for AudioChannelLayout(uint64_t a1)
{
  type metadata accessor for AudioBufferList(a1, &lazy cache variable for type metadata for AudioChannelLayout);
}

uint64_t getEnumTagSinglePayload for AudioBuffer(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AudioBuffer(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for AudioBuffer(uint64_t a1)
{
  type metadata accessor for AudioBufferList(a1, &lazy cache variable for type metadata for AudioBuffer);
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance AudioChannelFlags@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance AudioChannelFlags(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

void type metadata accessor for AudioChannelBitmap(uint64_t a1)
{
  type metadata accessor for AudioBufferList(a1, &lazy cache variable for type metadata for AudioChannelBitmap);
}

void type metadata accessor for AudioChannelFlags(uint64_t a1)
{
  type metadata accessor for AudioBufferList(a1, &lazy cache variable for type metadata for AudioChannelFlags);
}

void type metadata accessor for AudioBufferList(uint64_t a1, unint64_t *a2)
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

uint64_t UnsafeBufferPointer.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)(a3 - 8) + 72))
    return UnsafeBufferPointer.init(start:count:)();
  __break(1u);
  return result;
}

uint64_t UnsafeMutableBufferPointer.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)(a3 - 8) + 72))
    return UnsafeMutableBufferPointer.init(start:count:)();
  __break(1u);
  return result;
}

unint64_t AudioBuffer.init<A>(_:numberOfChannels:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a4 - 8) + 72);
  v5 = a2 * v4;
  if ((unsigned __int128)(a2 * (__int128)v4) >> 64 != (a2 * v4) >> 63)
  {
    __break(1u);
    goto LABEL_7;
  }
  v6 = a3;
  if (a3 > 0xFFFFFFFFLL)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if ((v5 | a3) < 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v5 <= 0xFFFFFFFFLL)
  {
    MEMORY[0x1DF0C00B0]();
    return v6 | ((unint64_t)v5 << 32);
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t static AudioBufferList.sizeInBytes(maximumBuffers:)(uint64_t result)
{
  uint64_t v1;

  if (result < 1)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((unint64_t)(result - 0x800000000000001) >> 60 != 15)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v1 = 16 * result - 16;
  result = 16 * result + 8;
  if (__OFADD__(v1, 24))
LABEL_7:
    __break(1u);
  return result;
}

int64_t static AudioBufferList.allocate(maximumBuffers:)@<X0>(int64_t result@<X0>, int64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v4;

  if (result < 1)
  {
    __break(1u);
    goto LABEL_8;
  }
  v2 = result;
  if ((unint64_t)(result - 0x800000000000001) >> 60 != 15)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v4 = 16 * result - 16;
  result = 16 * result + 8;
  if (__OFADD__(v4, 24))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = (int64_t)calloc(result, 1uLL);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!HIDWORD(v2))
  {
    *(_DWORD *)result = v2;
    *a2 = result;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t UnsafeMutableAudioBufferListPointer.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

{
  *a2 = result;
  return result;
}

unint64_t UnsafeMutableAudioBufferListPointer.count.setter(unint64_t result)
{
  _DWORD **v1;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(result))
  {
    **v1 = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t UnsafeMutableAudioBufferListPointer.count.getter()
{
  unsigned int **v0;

  return **v0;
}

unint64_t *(*UnsafeMutableAudioBufferListPointer.count.modify(_QWORD *a1))(unint64_t *result, char a2)
{
  unsigned int **v1;
  unsigned int *v2;

  v2 = *v1;
  a1[1] = *v1;
  *a1 = *v2;
  return UnsafeMutableAudioBufferListPointer.count.modify;
}

unint64_t *UnsafeMutableAudioBufferListPointer.count.modify(unint64_t *result, char a2)
{
  unint64_t v2;

  v2 = *result;
  if ((a2 & 1) != 0)
  {
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (!HIDWORD(v2))
    {
LABEL_7:
      *(_DWORD *)result[1] = v2;
      return result;
    }
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (!HIDWORD(v2))
    goto LABEL_7;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t UnsafeMutableAudioBufferListPointer.unsafePointer.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify())()
{
  return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
}

uint64_t UnsafeMutableAudioBufferListPointer.startIndex.getter()
{
  return 0;
}

uint64_t (*UnsafeMutableAudioBufferListPointer.subscript.read(uint64_t a1, unint64_t a2))()
{
  unsigned int **v2;
  uint64_t (*result)();

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (**v2 > a2)
  {
    return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
  }
  __break(1u);
  return result;
}

uint64_t (*UnsafeMutableAudioBufferListPointer.subscript.modify(uint64_t a1, unint64_t a2))()
{
  unsigned int **v2;
  uint64_t (*result)();

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (**v2 > a2)
  {
    return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
  }
  __break(1u);
  return result;
}

uint64_t UnsafeMutableAudioBufferListPointer.subscript.setter(uint64_t result, uint64_t a2, unint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)*v3 > a3)
  {
    v4 = *v3 + 16 * a3;
    *(_QWORD *)(v4 + 8) = result;
    *(_QWORD *)(v4 + 16) = a2;
    return result;
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableAudioBufferListPointer(_QWORD *result, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)*v2)
  {
    v4 = result[1];
    v5 = *v2 + 16 * v3;
    *(_QWORD *)(v5 + 8) = *result;
    *(_QWORD *)(v5 + 16) = v4;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableAudioBufferListPointer(uint64_t a1, _QWORD *a2))()
{
  unsigned int **v2;
  uint64_t (*result)();

  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*a2 < (unint64_t)**v2)
  {
    return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
  }
  __break(1u);
  return result;
}

unsigned int **protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableAudioBufferListPointer(uint64_t a1, uint64_t *a2)
{
  unsigned int **v2;

  return specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned int **)(a1 + 16));
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableAudioBufferListPointer(void (***a1)(uint64_t a1, uint64_t a2), uint64_t *a2))()
{
  void (**v4)(uint64_t, uint64_t);

  v4 = (void (**)(uint64_t, uint64_t))malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableAudioBufferListPointer;
}

void (*specialized MutableCollection<>.subscript.modify(void (**a1)(uint64_t a1, uint64_t a2), uint64_t a2, uint64_t a3))(uint64_t a1, uint64_t a2)
{
  unsigned int **v3;
  void (*result)(uint64_t, uint64_t);
  uint64_t v8;

  result = (void (*)(uint64_t, uint64_t))malloc(0x30uLL);
  *a1 = result;
  *((_QWORD *)result + 4) = a3;
  *((_QWORD *)result + 5) = v3;
  *((_QWORD *)result + 3) = a2;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = (uint64_t)*v3;
    if (**v3 >= a3)
    {
      *((_QWORD *)result + 1) = a3;
      *((_QWORD *)result + 2) = v8;
      *(_QWORD *)result = a2;
      return MutableCollection<>.subscript.modifyspecialized ;
    }
  }
  __break(1u);
  return result;
}

{
  uint64_t *v3;
  void (*result)(uint64_t, uint64_t);
  uint64_t v8;

  result = (void (*)(uint64_t, uint64_t))malloc(0x30uLL);
  *a1 = result;
  *((_QWORD *)result + 4) = a3;
  *((_QWORD *)result + 5) = v3;
  *((_QWORD *)result + 3) = a2;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = *v3;
    if (*(unsigned int *)(*v3 + 8) >= a3)
    {
      *((_QWORD *)result + 1) = a3;
      *((_QWORD *)result + 2) = v8;
      *(_QWORD *)result = a2;
      return MutableCollection<>.subscript.modifyspecialized ;
    }
  }
  __break(1u);
  return result;
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t a1, uint64_t a2)
{
  MutableCollection<>.subscript.modifyspecialized (a1, a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))specialized _writeBackMutableSlice<A, B>(_:bounds:slice:));
}

{
  MutableCollection<>.subscript.modifyspecialized (a1, a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))specialized _writeBackMutableSlice<A, B>(_:bounds:slice:));
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  v3 = *(_QWORD **)a1;
  a3(*(_QWORD *)(*(_QWORD *)a1 + 40), v3[3], *(_QWORD *)(*(_QWORD *)a1 + 32), *v3, v3[1], v3[2]);
  free(v3);
}

void (*specialized MutableCollection<>.subscript.modify(void (**a1)(unint64_t **a1, char a2), uint64_t a2, uint64_t a3))(unint64_t **a1, char a2)
{
  _BYTE *v3;
  void (*result)(unint64_t **, char);
  void (*v8)(unint64_t **, char);
  char v9;

  result = (void (*)(unint64_t **, char))malloc(0x38uLL);
  *a1 = result;
  *((_QWORD *)result + 5) = a3;
  *((_QWORD *)result + 6) = v3;
  *((_QWORD *)result + 4) = a2;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = result;
    result = *(void (**)(unint64_t **, char))v3;
    if (*(unsigned int *)(*(_QWORD *)(*(_QWORD *)v3 + 16) + 8) >= a3)
    {
      v9 = v3[8];
      *((_QWORD *)v8 + 1) = a3;
      *((_QWORD *)v8 + 2) = result;
      *((_BYTE *)v8 + 24) = v9;
      *(_QWORD *)v8 = a2;
      swift_retain();
      return MutableCollection<>.subscript.modifyspecialized ;
    }
  }
  __break(1u);
  return result;
}

void MutableCollection<>.subscript.modifyspecialized (unint64_t **a1, char a2)
{
  unint64_t *v2;
  unint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;

  v2 = *a1;
  v3 = **a1;
  v4 = (*a1)[1];
  v5 = (*a1)[2];
  v6 = (*a1)[5];
  v7 = (_QWORD *)(*a1)[6];
  v8 = (*a1)[4];
  if ((a2 & 1) != 0)
  {
    swift_retain();
    specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v7, v8, v6, v3, v4, v5);
    swift_release();
  }
  else
  {
    specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)((_QWORD *)(*a1)[6], v8, v6, v3, v4, v5);
  }
  swift_release();
  free(v2);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance UnsafeMutableAudioBufferListPointer@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance UnsafeMutableAudioBufferListPointer(unint64_t *a1, uint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

unint64_t specialized MutableCollection.swapAt(_:_:)(unint64_t result, uint64_t a2)
{
  unsigned int **v2;
  unsigned int *v3;
  unint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  uint64_t v9;

  if (result != a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v3 = *v2;
      v4 = **v2;
      if (v4 > result)
      {
        if (v4 > a2)
        {
          v5 = &v3[4 * result + 2];
          v6 = *(_QWORD *)v5;
          v7 = &v3[4 * a2 + 2];
          *(_QWORD *)v5 = *(_QWORD *)v7;
          v8 = v5;
          v9 = *((_QWORD *)v5 + 1);
          *((_QWORD *)v8 + 1) = *((_QWORD *)v7 + 1);
          if (*v3 > a2)
          {
            *(_QWORD *)v7 = v6;
            *((_QWORD *)v7 + 1) = v9;
            return result;
          }
LABEL_11:
          __break(1u);
          return result;
        }
LABEL_10:
        __break(1u);
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
  return result;
}

{
  _BYTE *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (result != a2)
  {
    v3 = result;
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v4 = *(_QWORD *)(*(_QWORD *)v2 + 16);
      v5 = *(unsigned int *)(v4 + 8);
      if (v5 > result)
      {
        if (v5 > a2)
        {
          v7 = v4 + 12 + 20 * result;
          v8 = *(_QWORD *)v7;
          v9 = *(_QWORD *)(v7 + 8);
          v10 = *(_DWORD *)(v7 + 16);
          v11 = v4 + 12 + 20 * a2;
          v12 = *(_QWORD *)v11;
          v13 = *(_QWORD *)(v11 + 8);
          v14 = *(_DWORD *)(v11 + 16);
          if ((v2[8] & 1) == 0)
          {
            result = ManagedAudioChannelLayout.ensureUniqueMutableReference()();
            v4 = *(_QWORD *)(*(_QWORD *)v2 + 16);
            v5 = *(unsigned int *)(v4 + 8);
          }
          if (v5 > v3)
          {
            v15 = v4 + 20 * v3;
            *(_QWORD *)(v15 + 12) = v12;
            *(_QWORD *)(v15 + 20) = v13;
            *(_DWORD *)(v15 + 28) = v14;
            if ((v2[8] & 1) == 0)
              result = ManagedAudioChannelLayout.ensureUniqueMutableReference()();
            v16 = *(_QWORD *)(*(_QWORD *)v2 + 16);
            if (*(unsigned int *)(v16 + 8) > a2)
            {
              v17 = v16 + 20 * a2;
              *(_QWORD *)(v17 + 12) = v8;
              *(_QWORD *)(v17 + 20) = v9;
              *(_DWORD *)(v17 + 28) = v10;
              return result;
            }
LABEL_17:
            __break(1u);
            return result;
          }
LABEL_16:
          __break(1u);
          goto LABEL_17;
        }
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  return result;
}

{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;

  if (result != a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v3 = *v2;
      v4 = *(unsigned int *)(*v2 + 8);
      if (v4 > result)
      {
        if (v4 > a2)
        {
          v5 = v3 + 12 + 20 * result;
          v6 = *(_QWORD *)v5;
          v7 = v3 + 12 + 20 * a2;
          *(_QWORD *)v5 = *(_QWORD *)v7;
          v8 = *(_QWORD *)(v5 + 8);
          v9 = *(_DWORD *)(v5 + 16);
          v10 = *(_DWORD *)(v7 + 16);
          *(_QWORD *)(v5 + 8) = *(_QWORD *)(v7 + 8);
          *(_DWORD *)(v5 + 16) = v10;
          if (*(unsigned int *)(v3 + 8) > a2)
          {
            *(_QWORD *)v7 = v6;
            *(_QWORD *)(v7 + 8) = v8;
            *(_DWORD *)(v7 + 16) = v9;
            return result;
          }
LABEL_11:
          __break(1u);
          return result;
        }
LABEL_10:
        __break(1u);
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
  return result;
}

uint64_t protocol witness for MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:) in conformance UnsafeMutableAudioBufferListPointer()
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t protocol witness for MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:) in conformance UnsafeMutableAudioBufferListPointer()
{
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)();
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, unsigned int *a4)
{
  unint64_t v4;
  uint64_t v6;
  BOOL v7;

  v4 = *a4;
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

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  BOOL v7;

  v4 = *(unsigned int *)(a4 + 8);
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

{
  unint64_t v4;
  uint64_t v6;
  BOOL v7;

  v4 = *(unsigned int *)(*(_QWORD *)(a4 + 16) + 8);
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

void protocol witness for Collection.startIndex.getter in conformance UnsafeMutableAudioBufferListPointer(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void protocol witness for Collection.endIndex.getter in conformance UnsafeMutableAudioBufferListPointer(_QWORD *a1@<X8>)
{
  unsigned int **v1;

  *a1 = **v1;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance UnsafeMutableAudioBufferListPointer(uint64_t (*result)(), unint64_t *a2))()
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)*v2)
  {
    v4 = *v2 + 16 * v3;
    v5 = *(_QWORD *)(v4 + 16);
    *(_QWORD *)result = *(_QWORD *)(v4 + 8);
    *((_QWORD *)result + 1) = v5;
    return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance UnsafeMutableAudioBufferListPointer@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  unsigned int **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  if (*result < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result[1];
    v5 = (uint64_t)*v2;
    if (v4 <= **v2)
    {
      a2[1] = v4;
      a2[2] = v5;
      *a2 = v3;
      return result;
    }
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance UnsafeMutableAudioBufferListPointer(_QWORD *a1@<X8>)
{
  unsigned int **v1;
  uint64_t v2;

  v2 = **v1;
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance UnsafeMutableAudioBufferListPointer()
{
  _DWORD **v0;

  return **v0 == 0;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance UnsafeMutableAudioBufferListPointer(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

unint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableAudioBufferListPointer@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unsigned int **v4;
  unint64_t result;
  char v7;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t *protocol witness for Collection.index(after:) in conformance UnsafeMutableAudioBufferListPointer@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  unsigned int **v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v3 = *result;
  if (*result >= (unint64_t)**v2)
  {
    __break(1u);
  }
  else
  {
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (!v4)
    {
      *a2 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.formIndex(after:) in conformance UnsafeMutableAudioBufferListPointer(uint64_t *result)
{
  unsigned int **v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = *result;
  if (*result >= (unint64_t)**v1)
  {
    __break(1u);
  }
  else
  {
    v3 = __OFADD__(v2, 1);
    v4 = v2 + 1;
    if (!v3)
    {
      *result = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance UnsafeMutableAudioBufferListPointer@<X0>(_QWORD *result@<X0>, unint64_t *a2@<X8>)
{
  unsigned int **v2;
  unint64_t v3;

  v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v3 < **v2)
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance UnsafeMutableAudioBufferListPointer(unint64_t *result)
{
  unsigned int **v1;
  unint64_t v2;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v2 < **v1)
  {
    *result = v2;
    return result;
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance UnsafeMutableAudioBufferListPointer@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unsigned int **v3;
  unint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= **v3)
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance UnsafeMutableAudioBufferListPointer(unint64_t *result, unint64_t *a2)
{
  unsigned int **v2;
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = **v2;
  if (*result <= v4 && v3 <= v4)
    return (unint64_t *)(v3 - *result);
  __break(1u);
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance UnsafeMutableAudioBufferListPointer(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance UnsafeMutableAudioBufferListPointer()
{
  unsigned int **v0;

  return **v0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance UnsafeMutableAudioBufferListPointer()
{
  return 2;
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance UnsafeMutableAudioBufferListPointer()
{
  unsigned int **v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance UnsafeMutableAudioBufferListPointer(_QWORD *a1, _QWORD *a2, unint64_t a3)
{
  unsigned int **v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance UnsafeMutableAudioBufferListPointer()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t static AudioChannelLayout.sizeInBytes(maximumDescriptions:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result - 1;
  if (result < 1)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = (unsigned __int128)(v1 * (__int128)20) >> 64;
  v3 = 20 * v1;
  if (v2 != v3 >> 63)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  result = v3 + 32;
  if (__OFADD__(v3, 32))
LABEL_7:
    __break(1u);
  return result;
}

int64_t static AudioChannelLayout.allocate(maximumDescriptions:)@<X0>(int64_t result@<X0>, int64_t *a2@<X8>)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = result - 1;
  if (result < 1)
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = (unsigned __int128)(v3 * (__int128)20) >> 64;
  v5 = 20 * v3;
  if (v4 != v5 >> 63)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v6 = result;
  result = v5 + 32;
  if (__OFADD__(v5, 32))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = (int64_t)calloc(result, 1uLL);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!HIDWORD(v6))
  {
    *(_DWORD *)(result + 8) = v6;
    *a2 = result;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

unint64_t AudioChannelLayout.UnsafeMutablePointer.count.setter(unint64_t result)
{
  uint64_t v1;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(result))
  {
    *(_DWORD *)(*(_QWORD *)v1 + 8) = result;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *(*AudioChannelLayout.UnsafeMutablePointer.count.modify(_QWORD *a1))(unint64_t *result, char a2)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  a1[1] = *v1;
  *a1 = *(unsigned int *)(v2 + 8);
  return AudioChannelLayout.UnsafeMutablePointer.count.modify;
}

unint64_t *AudioChannelLayout.UnsafeMutablePointer.count.modify(unint64_t *result, char a2)
{
  unint64_t v2;

  v2 = *result;
  if ((a2 & 1) != 0)
  {
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (!HIDWORD(v2))
    {
LABEL_7:
      *(_DWORD *)(result[1] + 8) = v2;
      return result;
    }
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (!HIDWORD(v2))
    goto LABEL_7;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t AudioChannelLayout.UnsafeMutablePointer.unsafePointer.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t AudioChannelLayout.UnsafeMutablePointer.unsafeMutablePointer.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t (*AudioChannelLayout.UnsafeMutablePointer.unsafeMutablePointer.modify())()
{
  return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
}

uint64_t AudioChannelLayout.UnsafeMutablePointer.startIndex.getter()
{
  return 0;
}

uint64_t (*AudioChannelLayout.UnsafeMutablePointer.subscript.read(uint64_t (*result)(), unint64_t a2))()
{
  uint64_t v2;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(*(_QWORD *)v2 + 8) > a2)
  {
    *(_QWORD *)result = *(_QWORD *)(*(_QWORD *)v2 + 20 * a2 + 24);
    return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
  }
  __break(1u);
  return result;
}

uint64_t (*AudioChannelLayout.UnsafeMutablePointer.subscript.modify(uint64_t a1, unint64_t a2))()
{
  uint64_t v2;
  uint64_t (*result)();

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(*(_QWORD *)v2 + 8) > a2)
  {
    return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
  }
  __break(1u);
  return result;
}

uint64_t AudioChannelLayout.UnsafeMutablePointer.subscript.setter(uint64_t result, unint64_t a2, float a3, float a4, float a5)
{
  uint64_t v5;
  uint64_t v6;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(*(_QWORD *)v5 + 8) > a2)
  {
    v6 = *(_QWORD *)v5 + 20 * a2;
    *(_QWORD *)(v6 + 12) = result;
    *(float *)(v6 + 20) = a3;
    *(float *)(v6 + 24) = a4;
    *(float *)(v6 + 28) = a5;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance AudioChannelLayout.UnsafeMutablePointer(uint64_t result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)v2 + 8))
  {
    v4 = *(_QWORD *)(result + 8);
    v5 = *(_DWORD *)(result + 16);
    v6 = *(_QWORD *)v2 + 20 * v3;
    *(_QWORD *)(v6 + 12) = *(_QWORD *)result;
    *(_QWORD *)(v6 + 20) = v4;
    *(_DWORD *)(v6 + 28) = v5;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance AudioChannelLayout.UnsafeMutablePointer(uint64_t a1, _QWORD *a2))()
{
  uint64_t v2;
  uint64_t (*result)();

  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*a2 < (unint64_t)*(unsigned int *)(*(_QWORD *)v2 + 8))
  {
    return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for MutableCollection.subscript.setter in conformance AudioChannelLayout.UnsafeMutablePointer(uint64_t a1, int64_t *a2)
{
  uint64_t *v2;

  return specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance AudioChannelLayout.UnsafeMutablePointer(void (***a1)(uint64_t a1, uint64_t a2), uint64_t *a2))()
{
  void (**v4)(uint64_t, uint64_t);

  v4 = (void (**)(uint64_t, uint64_t))malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableAudioBufferListPointer;
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance AudioChannelLayout.UnsafeMutablePointer@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance AudioChannelLayout.UnsafeMutablePointer(unint64_t *a1, uint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

unint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:limitedBy:) in conformance AudioChannelLayout.UnsafePointer@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  unint64_t result;
  char v7;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance AudioChannelLayout.UnsafeMutablePointer(uint64_t (*result)(), unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)v2 + 8))
  {
    v4 = *(_QWORD *)v2 + 20 * v3;
    v5 = *(_DWORD *)(v4 + 28);
    v6 = *(_QWORD *)(v4 + 20);
    *(_QWORD *)result = *(_QWORD *)(v4 + 12);
    *((_QWORD *)result + 1) = v6;
    *((_DWORD *)result + 4) = v5;
    return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
  }
  __break(1u);
  return result;
}

uint64_t AudioChannelLayout.UnsafePointer.count.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)v0 + 8);
}

uint64_t AudioChannelLayout.UnsafePointer.unsafePointer.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t (*AudioChannelLayout.UnsafePointer.unsafePointer.modify())()
{
  return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
}

uint64_t AudioChannelLayout.UnsafePointer.startIndex.getter()
{
  return 0;
}

uint64_t (*AudioChannelLayout.UnsafePointer.subscript.read(uint64_t (*result)(), unint64_t a2))()
{
  uint64_t v2;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(*(_QWORD *)v2 + 8) > a2)
  {
    *(_QWORD *)result = *(_QWORD *)(*(_QWORD *)v2 + 20 * a2 + 24);
    return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.endIndex.getter in conformance AudioChannelLayout.UnsafePointer(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(unsigned int *)(*(_QWORD *)v1 + 8);
}

uint64_t *protocol witness for Collection.subscript.getter in conformance AudioChannelLayout.UnsafeMutablePointer@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  if (*result < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result[1];
    v5 = *v2;
    if (v4 <= *(unsigned int *)(*v2 + 8))
    {
      a2[1] = v4;
      a2[2] = v5;
      *a2 = v3;
      return result;
    }
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance AudioChannelLayout.UnsafePointer(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned int *)(*(_QWORD *)v1 + 8);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance AudioChannelLayout.UnsafePointer()
{
  uint64_t v0;

  return *(_DWORD *)(*(_QWORD *)v0 + 8) == 0;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance UnsafeMutableAudioBufferListPointer(uint64_t *result, uint64_t *a2)
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

_QWORD *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance UnsafeMutableAudioBufferListPointer(_QWORD *result, _QWORD *a2)
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

uint64_t *protocol witness for Collection.index(after:) in conformance AudioChannelLayout.UnsafeMutablePointer@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v3 = *result;
  if (*result >= (unint64_t)*(unsigned int *)(*(_QWORD *)v2 + 8))
  {
    __break(1u);
  }
  else
  {
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (!v4)
    {
      *a2 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.formIndex(after:) in conformance AudioChannelLayout.UnsafeMutablePointer(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = *result;
  if (*result >= (unint64_t)*(unsigned int *)(*(_QWORD *)v1 + 8))
  {
    __break(1u);
  }
  else
  {
    v3 = __OFADD__(v2, 1);
    v4 = v2 + 1;
    if (!v3)
    {
      *result = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance AudioChannelLayout.UnsafePointer()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)v0 + 8);
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance AudioChannelLayout.UnsafePointer()
{
  uint64_t *v0;

  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance AudioChannelLayout.UnsafePointer(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance AudioChannelLayout.UnsafeMutablePointer@<X0>(_QWORD *result@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;

  v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)v2 + 8))
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance AudioChannelLayout.UnsafeMutablePointer(unint64_t *result)
{
  uint64_t v1;
  unint64_t v2;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v2 < *(unsigned int *)(*(_QWORD *)v1 + 8))
  {
    *result = v2;
    return result;
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance AudioChannelLayout.UnsafeMutablePointer@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(unsigned int *)(*(_QWORD *)v3 + 8))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance AudioChannelLayout.UnsafeMutablePointer(unint64_t *result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = *(unsigned int *)(*(_QWORD *)v2 + 8);
  if (*result <= v4 && v3 <= v4)
    return (unint64_t *)(v3 - *result);
  __break(1u);
  return result;
}

uint64_t ManagedAudioChannelLayout.Storage.__deallocating_deinit()
{
  uint64_t v0;
  void (*v1)(uint64_t *);
  uint64_t v3;

  v1 = *(void (**)(uint64_t *))(v0 + 24);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 16);
    swift_retain();
    v1(&v3);
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed AudioChannelLayout.UnsafePointer) -> ())?((uint64_t)v1);
  }
  else
  {
    free(*(void **)(v0 + 16));
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed AudioChannelLayout.UnsafePointer) -> ())?(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance();
}

int64_t ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(int64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = result - 1;
  if (result < 1)
  {
    __break(1u);
    goto LABEL_8;
  }
  v3 = (unsigned __int128)(v2 * (__int128)20) >> 64;
  v4 = 20 * v2;
  if (v3 != v4 >> 63)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v5 = result;
  result = v4 + 32;
  if (__OFADD__(v4, 32))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = (int64_t)calloc(result, 1uLL);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!HIDWORD(v5))
  {
    *(_DWORD *)(result + 8) = v5;
    v1[3] = 0;
    v1[4] = 0;
    v1[2] = result;
    return (int64_t)v1;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t ManagedAudioChannelLayout.ensureUniqueMutableReference()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t result;
  uint64_t v3;
  unsigned int *v4;
  int64_t v5;
  uint64_t v6;

  v1 = v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  v3 = *v0;
  if (!(_DWORD)result || *(_QWORD *)(v3 + 24))
  {
    v4 = *(unsigned int **)(v3 + 16);
    v5 = v4[2];
    type metadata accessor for ManagedAudioChannelLayout.Storage();
    swift_allocObject();
    result = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v5);
    if ((_DWORD)v5)
    {
      v6 = result;
      memcpy(*(void **)(result + 16), v4, 20 * v5 + 12);
      *v1 = v6;
      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

_QWORD *ManagedAudioChannelLayout.init(audioChannelLayoutPointer:deallocator:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *result;

  v7 = *a1;
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  result = (_QWORD *)swift_allocObject();
  result[2] = v7;
  result[3] = a2;
  result[4] = a3;
  *(_QWORD *)a4 = result;
  *(_DWORD *)(a4 + 8) = -1;
  *(_QWORD *)(a4 + 20) = 0;
  *(_QWORD *)(a4 + 12) = 0;
  return result;
}

uint64_t type metadata accessor for ManagedAudioChannelLayout.Storage()
{
  return objc_opt_self();
}

uint64_t ManagedAudioChannelLayout.init(tag:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;

  type metadata accessor for ManagedAudioChannelLayout.Storage();
  v4 = (_QWORD *)swift_allocObject();
  result = (uint64_t)calloc(0x20uLL, 1uLL);
  if (result)
  {
    *(_DWORD *)(result + 8) = 1;
    v4[3] = 0;
    v4[4] = 0;
    v4[2] = result;
    ManagedAudioChannelLayout.tag.setter(a1);
    result = ManagedAudioChannelLayout.bitmap.setter(0);
    v6 = v4[2];
    if (*(_DWORD *)(v6 + 8))
    {
      *(_DWORD *)(v6 + 12) = -1;
      *(_DWORD *)(v6 + 16) = 0;
      *(_DWORD *)(v6 + 20) = 0;
      *(_QWORD *)(v6 + 24) = 0;
      *(_QWORD *)a2 = v4;
      *(_DWORD *)(a2 + 8) = -1;
      *(_DWORD *)(a2 + 12) = 0;
      *(_DWORD *)(a2 + 16) = 0;
      *(_QWORD *)(a2 + 20) = 0;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t ManagedAudioChannelLayout.tag.setter(int a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t result;
  uint64_t v5;
  unsigned int *v6;
  int64_t v7;
  uint64_t v8;

  v2 = v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  v5 = *v1;
  if ((_DWORD)result && !*(_QWORD *)(v5 + 24))
    goto LABEL_5;
  v6 = *(unsigned int **)(v5 + 16);
  v7 = v6[2];
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  swift_allocObject();
  result = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v7);
  if ((_DWORD)v7)
  {
    v8 = result;
    memcpy(*(void **)(result + 16), v6, 20 * v7 + 12);
    *v2 = v8;
    result = swift_release();
    v5 = *v2;
LABEL_5:
    **(_DWORD **)(v5 + 16) = a1;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t ManagedAudioChannelLayout.bitmap.setter(int a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t result;
  uint64_t v5;
  unsigned int *v6;
  int64_t v7;
  uint64_t v8;

  v2 = v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  v5 = *v1;
  if ((_DWORD)result && !*(_QWORD *)(v5 + 24))
    goto LABEL_5;
  v6 = *(unsigned int **)(v5 + 16);
  v7 = v6[2];
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  swift_allocObject();
  result = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v7);
  if ((_DWORD)v7)
  {
    v8 = result;
    memcpy(*(void **)(result + 16), v6, 20 * v7 + 12);
    *v2 = v8;
    result = swift_release();
    v5 = *v2;
LABEL_5:
    *(_DWORD *)(*(_QWORD *)(v5 + 16) + 4) = a1;
    return result;
  }
  __break(1u);
  return result;
}

void ManagedAudioChannelLayout.init(maximumDescriptions:)(int64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = -1;
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  *(_QWORD *)(a2 + 20) = 0;
  *(_QWORD *)(a2 + 12) = 0;
  swift_allocObject();
  *(_QWORD *)a2 = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(a1);
  ManagedAudioChannelLayout.setAllToUnknown()();
}

Swift::Void __swiftcall ManagedAudioChannelLayout.setAllToUnknown()()
{
  _DWORD *v0;
  uint64_t v1;
  unint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  unint64_t v13;
  unint64_t v14;
  _DWORD *v15;

  ManagedAudioChannelLayout.ensureUniqueMutableReference()();
  ManagedAudioChannelLayout.tag.setter(0);
  ManagedAudioChannelLayout.bitmap.setter(0);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  v2 = *(unsigned int *)(v1 + 8);
  if ((_DWORD)v2)
  {
    v3 = v0[2];
    v4 = v0[3];
    v5 = v0[4];
    v6 = v0[5];
    v7 = v0[6];
    v8 = v2 - 1;
    if (v2 - 1 >= v2)
      v8 = *(unsigned int *)(v1 + 8);
    if (v8 >= 2)
    {
      v10 = v8 + 1;
      v11 = v10 & 1;
      if ((v10 & 1) == 0)
        v11 = 2;
      v9 = v10 - v11;
      v12 = (_DWORD *)(v1 + 24);
      v13 = v9;
      do
      {
        *(v12 - 3) = v3;
        *(v12 - 2) = v4;
        v12[2] = v3;
        v12[3] = v4;
        *(v12 - 1) = v5;
        *v12 = v6;
        v12[4] = v5;
        v12[5] = v6;
        v12[1] = v7;
        v12[6] = v7;
        v12 += 10;
        v13 -= 2;
      }
      while (v13);
    }
    else
    {
      v9 = 0;
    }
    v14 = v2 - v9;
    v15 = (_DWORD *)(v1 + 20 * v9 + 28);
    while (v14)
    {
      *(v15 - 4) = v3;
      *(v15 - 3) = v4;
      *(v15 - 2) = v5;
      *(v15 - 1) = v6;
      *v15 = v7;
      v15 += 5;
      if (!--v14)
        return;
    }
    __break(1u);
  }
}

uint64_t ManagedAudioChannelLayout.init(channelDescriptions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;

  v4 = *(_QWORD *)(a1 + 16);
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  swift_allocObject();
  v13 = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v4);
  ManagedAudioChannelLayout.tag.setter(0);
  result = ManagedAudioChannelLayout.bitmap.setter(0);
  v6 = *(_QWORD *)(v13 + 16);
  v7 = *(unsigned int *)(v6 + 8);
  if ((_DWORD)v7)
  {
    if (*(_QWORD *)(a1 + 16) >= v7)
    {
      v8 = 0;
      v9 = 20 * v7;
      while (v9 != v8)
      {
        v10 = *(_DWORD *)(a1 + v8 + 48);
        v11 = v6 + v8;
        v12 = *(_QWORD *)(a1 + v8 + 40);
        *(_QWORD *)(v11 + 12) = *(_QWORD *)(a1 + v8 + 32);
        *(_QWORD *)(v11 + 20) = v12;
        *(_DWORD *)(v11 + 28) = v10;
        v8 += 20;
        if (v9 == v8)
          goto LABEL_6;
      }
      __break(1u);
    }
    __break(1u);
  }
  else
  {
LABEL_6:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a2 = v13;
    *(_OWORD *)(a2 + 8) = 0xFFFFFFFFuLL;
    *(_DWORD *)(a2 + 24) = 0;
  }
  return result;
}

uint64_t ManagedAudioChannelLayout.tag.getter()
{
  uint64_t v0;

  return **(unsigned int **)(*(_QWORD *)v0 + 16);
}

uint64_t (*ManagedAudioChannelLayout.tag.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_DWORD *)(a1 + 8) = **(_DWORD **)(*(_QWORD *)v1 + 16);
  return ManagedAudioChannelLayout.tag.modify;
}

uint64_t ManagedAudioChannelLayout.tag.modify(uint64_t a1, char a2)
{
  uint64_t *v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  unsigned int *v6;
  int64_t v7;
  uint64_t v8;

  v2 = *(uint64_t **)a1;
  v3 = *(_DWORD *)(a1 + 8);
  if ((a2 & 1) != 0)
    return ManagedAudioChannelLayout.tag.setter(v3);
  result = swift_isUniquelyReferenced_nonNull_native();
  v5 = *v2;
  if ((_DWORD)result && !*(_QWORD *)(v5 + 24))
    goto LABEL_7;
  v6 = *(unsigned int **)(v5 + 16);
  v7 = v6[2];
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  swift_allocObject();
  result = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v7);
  if ((_DWORD)v7)
  {
    v8 = result;
    memcpy(*(void **)(result + 16), v6, 20 * v7 + 12);
    *v2 = v8;
    result = swift_release();
    v5 = *v2;
LABEL_7:
    **(_DWORD **)(v5 + 16) = v3;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t ManagedAudioChannelLayout.bitmap.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v0 + 16) + 4);
}

uint64_t (*ManagedAudioChannelLayout.bitmap.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 16) + 4);
  return ManagedAudioChannelLayout.bitmap.modify;
}

uint64_t ManagedAudioChannelLayout.bitmap.modify(uint64_t a1, char a2)
{
  uint64_t *v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  unsigned int *v6;
  int64_t v7;
  uint64_t v8;

  v2 = *(uint64_t **)a1;
  v3 = *(_DWORD *)(a1 + 8);
  if ((a2 & 1) != 0)
    return ManagedAudioChannelLayout.bitmap.setter(v3);
  result = swift_isUniquelyReferenced_nonNull_native();
  v5 = *v2;
  if ((_DWORD)result && !*(_QWORD *)(v5 + 24))
    goto LABEL_7;
  v6 = *(unsigned int **)(v5 + 16);
  v7 = v6[2];
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  swift_allocObject();
  result = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v7);
  if ((_DWORD)v7)
  {
    v8 = result;
    memcpy(*(void **)(result + 16), v6, 20 * v7 + 12);
    *v2 = v8;
    result = swift_release();
    v5 = *v2;
LABEL_7:
    *(_DWORD *)(*(_QWORD *)(v5 + 16) + 4) = v3;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t ManagedAudioChannelLayout.channelDescriptions.getter@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = 0;
  return swift_retain();
}

uint64_t (*ManagedAudioChannelLayout.channelDescriptions.read(uint64_t a1))()
{
  _QWORD *v1;

  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = 0;
  swift_retain();
  return ManagedAudioChannelLayout.channelDescriptions.read;
}

uint64_t ManagedAudioChannelLayout.channelDescriptions.read()
{
  return swift_release();
}

uint64_t key path setter for ManagedAudioChannelLayout.channelDescriptions : ManagedAudioChannelLayout(uint64_t *a1)
{
  uint64_t v1;
  char v2;
  void **v3;
  uint64_t v4;
  _BYTE v6[32];

  v1 = *a1;
  v2 = *((_BYTE *)a1 + 8);
  swift_retain();
  v3 = ManagedAudioChannelLayout.channelDescriptions.modify((uint64_t)v6);
  *(_QWORD *)v4 = v1;
  *(_BYTE *)(v4 + 8) = v2;
  swift_release();
  return ((uint64_t (*)(_BYTE *, _QWORD))v3)(v6, 0);
}

void **ManagedAudioChannelLayout.channelDescriptions.modify(uint64_t a1)
{
  void ***v1;
  void ***v2;
  int isUniquelyReferenced_nonNull_native;
  void **v5;
  unsigned int *v6;
  int64_t v7;
  void **result;
  void **v9;

  v2 = v1;
  *(_QWORD *)(a1 + 16) = v1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v5 = *v1;
  if (isUniquelyReferenced_nonNull_native && !v5[3])
    goto LABEL_5;
  v6 = (unsigned int *)v5[2];
  v7 = v6[2];
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  swift_allocObject();
  result = (void **)ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v7);
  if ((_DWORD)v7)
  {
    v9 = result;
    memcpy(result[2], v6, 20 * v7 + 12);
    *v2 = v9;
    swift_release();
    v5 = *v2;
LABEL_5:
    *(_QWORD *)a1 = v5;
    *(_BYTE *)(a1 + 8) = 1;
    swift_retain();
    return (void **)ManagedAudioChannelLayout.channelDescriptions.modify;
  }
  __break(1u);
  return result;
}

int64_t ManagedAudioChannelLayout.channelDescriptions.modify(_QWORD *a1, char a2)
{
  uint64_t v2;
  int *v3;
  int v4;
  int v5;
  unsigned int *v6;
  int64_t v7;
  int64_t result;
  int64_t v9;

  if ((a2 & 1) != 0)
    return swift_release();
  v2 = a1[2];
  if (*(_QWORD *)v2 == *a1)
    return swift_release();
  v3 = *(int **)(*(_QWORD *)v2 + 16);
  v5 = *v3;
  v4 = v3[1];
  v6 = *(unsigned int **)(*a1 + 16);
  v7 = v6[2];
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  swift_allocObject();
  swift_retain();
  result = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v7);
  if ((_DWORD)v7)
  {
    v9 = result;
    memcpy(*(void **)(result + 16), v6, 20 * v7 + 12);
    swift_release();
    swift_release();
    *(_QWORD *)v2 = v9;
    ManagedAudioChannelLayout.tag.setter(v5);
    ManagedAudioChannelLayout.bitmap.setter(v4);
    return swift_release();
  }
  __break(1u);
  return result;
}

int64_t ManagedAudioChannelLayout.channelDescriptions.setter(uint64_t *a1)
{
  int64_t *v1;
  int64_t *v2;
  uint64_t v3;
  int isUniquelyReferenced_nonNull_native;
  int64_t v5;
  unsigned int *v6;
  int64_t v7;
  int64_t result;
  int64_t v9;
  int *v10;
  int v11;
  int v12;
  unsigned int *v13;
  int64_t v14;
  int64_t v15;

  v2 = v1;
  v3 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v5 = *v1;
  if (!isUniquelyReferenced_nonNull_native || *(_QWORD *)(v5 + 24))
  {
    v6 = *(unsigned int **)(v5 + 16);
    v7 = v6[2];
    type metadata accessor for ManagedAudioChannelLayout.Storage();
    swift_allocObject();
    result = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v7);
    if (!(_DWORD)v7)
    {
      __break(1u);
      goto LABEL_10;
    }
    v9 = result;
    memcpy(*(void **)(result + 16), v6, 20 * v7 + 12);
    *v2 = v9;
    swift_release();
    v5 = *v2;
  }
  if (v5 == v3)
    return swift_release();
  v10 = *(int **)(v5 + 16);
  v12 = *v10;
  v11 = v10[1];
  v13 = *(unsigned int **)(v3 + 16);
  v14 = v13[2];
  type metadata accessor for ManagedAudioChannelLayout.Storage();
  swift_allocObject();
  swift_retain();
  result = ManagedAudioChannelLayout.Storage.init(maximumDescriptions:)(v14);
  if ((_DWORD)v14)
  {
    v15 = result;
    memcpy(*(void **)(result + 16), v13, 20 * v14 + 12);
    swift_release();
    swift_release();
    *v2 = v15;
    ManagedAudioChannelLayout.tag.setter(v12);
    ManagedAudioChannelLayout.bitmap.setter(v11);
    return swift_release();
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t ManagedAudioChannelLayout.sizeInBytes.getter()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t result;

  v1 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 16) + 8);
  if (v1)
    return 20 * v1 + 12;
  __break(1u);
  return result;
}

uint64_t ManagedAudioChannelLayout.numberOfChannels.getter()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t v2;
  Swift::String_optional v3;
  void *object;
  uint64_t countAndFlagsBits;
  Swift::String_optional v6;

  v1 = *(_DWORD **)(*(_QWORD *)v0 + 16);
  if (*v1 == 0x10000)
  {
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    String.init<A>(_:radix:uppercase:)();
    v3 = String.Iterator.next()();
    object = v3.value._object;
    if (v3.value._object)
    {
      countAndFlagsBits = v3.value._countAndFlagsBits;
      do
      {
        if (countAndFlagsBits == 49 && object == (void *)0xE100000000000000
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          MEMORY[0x1DF0C0080](countAndFlagsBits, object);
        }
        swift_bridgeObjectRelease();
        v6 = String.Iterator.next()();
        countAndFlagsBits = v6.value._countAndFlagsBits;
        object = v6.value._object;
      }
      while (v6.value._object);
    }
    swift_bridgeObjectRelease();
    v2 = String.count.getter();
    swift_bridgeObjectRelease();
  }
  else if (*v1)
  {
    return (unsigned __int16)*v1;
  }
  else
  {
    return v1[2];
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    result = MEMORY[0x1DF0C0170](MEMORY[0x1E0DEE138], MEMORY[0x1E0DEE0F8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
  }
  return result;
}

uint64_t ManagedAudioChannelLayout.withUnsafePointer<A>(_:)(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  return a1(*(_QWORD *)(*(_QWORD *)v1 + 16));
}

uint64_t ManagedAudioChannelLayout.withUnsafeMutablePointer<A>(_:)(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;

  ManagedAudioChannelLayout.ensureUniqueMutableReference()();
  return a1(*(_QWORD *)(*(_QWORD *)v1 + 16));
}

uint64_t ManagedAudioChannelLayout.ChannelDescriptions.startIndex.getter()
{
  return 0;
}

uint64_t ManagedAudioChannelLayout.ChannelDescriptions.count.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v0 + 16) + 8);
}

unint64_t ManagedAudioChannelLayout.ChannelDescriptions.subscript.getter(unint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
    if (*(unsigned int *)(v2 + 8) > result)
      return *(_QWORD *)(v2 + 20 * result + 12);
  }
  __break(1u);
  return result;
}

uint64_t key path getter for ManagedAudioChannelLayout.ChannelDescriptions.subscript(_:) : ManagedAudioChannelLayout.ChannelDescriptions@<X0>(uint64_t result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)result + 16);
    if (v3 < *(unsigned int *)(v4 + 8))
    {
      v5 = v4 + 20 * v3;
      v6 = *(_DWORD *)(v5 + 28);
      v7 = *(_QWORD *)(v5 + 20);
      *(_QWORD *)a3 = *(_QWORD *)(v5 + 12);
      *(_QWORD *)(a3 + 8) = v7;
      *(_DWORD *)(a3 + 16) = v6;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t (*ManagedAudioChannelLayout.ChannelDescriptions.subscript.read(uint64_t (*result)(), unint64_t a2))()
{
  uint64_t v2;
  uint64_t v3;

  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)(*(_QWORD *)v2 + 16);
    if (*(unsigned int *)(v3 + 8) > a2)
    {
      *(_QWORD *)result = *(_QWORD *)(v3 + 20 * a2 + 24);
      return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
    }
  }
  __break(1u);
  return result;
}

uint64_t key path setter for ManagedAudioChannelLayout.ChannelDescriptions.subscript(_:) : ManagedAudioChannelLayout.ChannelDescriptions(uint64_t result, _BYTE *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a3;
  v5 = *(_QWORD *)result;
  v6 = *(_QWORD *)(result + 8);
  v7 = *(_DWORD *)(result + 16);
  if ((a2[8] & 1) == 0)
    result = ManagedAudioChannelLayout.ensureUniqueMutableReference()();
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)a2 + 16);
    if (v4 < *(unsigned int *)(v8 + 8))
    {
      v9 = v8 + 20 * v4;
      *(_QWORD *)(v9 + 12) = v5;
      *(_QWORD *)(v9 + 20) = v6;
      *(_DWORD *)(v9 + 28) = v7;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t (*ManagedAudioChannelLayout.ChannelDescriptions.subscript.modify(_QWORD *a1, unint64_t a2))()
{
  _BYTE *v2;
  _QWORD *v5;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  if ((v2[8] & 1) == 0)
    ManagedAudioChannelLayout.ensureUniqueMutableReference()();
  v5[4] = *(_QWORD *)(*(_QWORD *)v2 + 16);
  v5[5] = AudioChannelLayout.UnsafeMutablePointer.subscript.modify((uint64_t)v5, a2);
  return ManagedAudioChannelLayout.ChannelDescriptions.subscript.modify;
}

uint64_t ManagedAudioChannelLayout.ChannelDescriptions.subscript.setter(uint64_t result, unint64_t a2, float a3, float a4, float a5)
{
  _BYTE *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = result;
  if ((v5[8] & 1) == 0)
    result = ManagedAudioChannelLayout.ensureUniqueMutableReference()();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v11 = *(_QWORD *)(*(_QWORD *)v5 + 16);
    if (*(unsigned int *)(v11 + 8) > a2)
    {
      v12 = v11 + 20 * a2;
      *(_QWORD *)(v12 + 12) = v10;
      *(float *)(v12 + 20) = a3;
      *(float *)(v12 + 24) = a4;
      *(float *)(v12 + 28) = a5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance ManagedAudioChannelLayout.ChannelDescriptions(uint64_t a1, unint64_t *a2)
{
  return ManagedAudioChannelLayout.ChannelDescriptions.subscript.setter(*(_QWORD *)a1, *a2, *(float *)(a1 + 8), *(float *)(a1 + 12), *(float *)(a1 + 16));
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ManagedAudioChannelLayout.ChannelDescriptions(_QWORD *a1, unint64_t *a2))()
{
  _BYTE *v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v6 = *a2;
  if ((v2[8] & 1) == 0)
    ManagedAudioChannelLayout.ensureUniqueMutableReference()();
  v5[4] = *(_QWORD *)(*(_QWORD *)v2 + 16);
  v5[5] = AudioChannelLayout.UnsafeMutablePointer.subscript.modify((uint64_t)v5, v6);
  return ManagedAudioChannelLayout.ChannelDescriptions.subscript.modify;
}

void ManagedAudioChannelLayout.ChannelDescriptions.subscript.modify(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  free(v1);
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance ManagedAudioChannelLayout.ChannelDescriptions(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  return swift_release();
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ManagedAudioChannelLayout.ChannelDescriptions(void (***a1)(unint64_t **a1, char a2), uint64_t *a2))()
{
  void (**v4)(unint64_t **, char);

  v4 = (void (**)(unint64_t **, char))malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableAudioBufferListPointer;
}

void protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableAudioBufferListPointer(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance ManagedAudioChannelLayout.ChannelDescriptions@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance ManagedAudioChannelLayout.ChannelDescriptions(unint64_t *a1, uint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

void protocol witness for Collection.endIndex.getter in conformance ManagedAudioChannelLayout.ChannelDescriptions(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v1 + 16) + 8);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ManagedAudioChannelLayout.ChannelDescriptions(uint64_t (*result)(), unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)v2 + 16);
    if (v3 < *(unsigned int *)(v4 + 8))
    {
      v5 = v4 + 20 * v3;
      v6 = *(_DWORD *)(v5 + 28);
      v7 = *(_QWORD *)(v5 + 20);
      *(_QWORD *)result = *(_QWORD *)(v5 + 12);
      *((_QWORD *)result + 1) = v7;
      *((_DWORD *)result + 4) = v6;
      return UnsafeMutableAudioBufferListPointer.unsafeMutablePointer.modify;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance ManagedAudioChannelLayout.ChannelDescriptions@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *result;
  if (*result < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = result[1];
    result = *(uint64_t **)v2;
    if (v4 <= *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v2 + 16) + 8))
    {
      v5 = v2[8];
      *(_QWORD *)(a2 + 8) = v4;
      *(_QWORD *)(a2 + 16) = result;
      *(_BYTE *)(a2 + 24) = v5;
      *(_QWORD *)a2 = v3;
      return (uint64_t *)swift_retain();
    }
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance ManagedAudioChannelLayout.ChannelDescriptions(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v1 + 16) + 8);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance ManagedAudioChannelLayout.ChannelDescriptions()
{
  uint64_t v0;

  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 16) + 8) == 0;
}

uint64_t *protocol witness for Collection.index(after:) in conformance ManagedAudioChannelLayout.ChannelDescriptions@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v3 = *result;
  if (*result >= (unint64_t)*(unsigned int *)(*(_QWORD *)(*(_QWORD *)v2 + 16) + 8))
  {
    __break(1u);
  }
  else
  {
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (!v4)
    {
      *a2 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.formIndex(after:) in conformance ManagedAudioChannelLayout.ChannelDescriptions(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = *result;
  if (*result >= (unint64_t)*(unsigned int *)(*(_QWORD *)(*(_QWORD *)v1 + 16) + 8))
  {
    __break(1u);
  }
  else
  {
    v3 = __OFADD__(v2, 1);
    v4 = v2 + 1;
    if (!v3)
    {
      *result = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance ManagedAudioChannelLayout.ChannelDescriptions@<X0>(_QWORD *result@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;

  v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v2 + 16) + 8))
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance ManagedAudioChannelLayout.ChannelDescriptions(unint64_t *result)
{
  uint64_t v1;
  unint64_t v2;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v2 < *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v1 + 16) + 8))
  {
    *result = v2;
    return result;
  }
  __break(1u);
  return result;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance ManagedAudioChannelLayout.ChannelDescriptions@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;

  v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v3 + 16) + 8))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ManagedAudioChannelLayout.ChannelDescriptions@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  unint64_t result;
  char v7;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance ManagedAudioChannelLayout.ChannelDescriptions(unint64_t *result, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v2 + 16) + 8);
  if (*result <= v4 && v3 <= v4)
    return (unint64_t *)(v3 - *result);
  __break(1u);
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance ManagedAudioChannelLayout.ChannelDescriptions(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = 0;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance ManagedAudioChannelLayout.ChannelDescriptions()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v0 + 16) + 8);
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance ManagedAudioChannelLayout.ChannelDescriptions()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
  swift_release();
  return v1;
}

unint64_t protocol witness for Sequence._copyContents(initializing:) in conformance ManagedAudioChannelLayout.ChannelDescriptions(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *(_QWORD *)v3, *(_BYTE *)(v3 + 8));
}

BOOL static AudioChannelDescription.== infix(_:_:)(uint64_t a1, uint64_t a2, float a3, float a4, float a5, float a6, float a7, float a8)
{
  _BOOL4 v9;

  v9 = a3 == a6 && a1 == a2;
  if (a4 != a7)
    v9 = 0;
  return a5 == a8 && v9;
}

unsigned int **specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(unsigned int **result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  unsigned int *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int *v13;

  if (a2 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v6 = *result;
  v7 = **result;
  if (v7 < a3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (a2 >= a3)
    {
LABEL_29:
      __break(1u);
      return result;
    }
    v8 = 0;
    v9 = 0;
    v10 = &a6[4 * a4];
    v11 = ~a2 + a3;
    while (1)
    {
      v12 = a4 + v9;
      if (a4 + v9 >= a5)
        break;
      if (a4 < 0)
        goto LABEL_20;
      if (v12 >= *a6)
        goto LABEL_21;
      if (a2 + v9 >= (unint64_t)v7)
        goto LABEL_22;
      result = *(unsigned int ***)&v10[v8 + 4];
      v13 = &v6[4 * a2 + v8];
      *((_QWORD *)v13 + 1) = *(_QWORD *)&v10[v8 + 2];
      *((_QWORD *)v13 + 2) = result;
      v7 = *v6;
      if (a2 + v9 >= v7)
        goto LABEL_23;
      if (v12 >= *a6)
        goto LABEL_24;
      if (v11 == v9)
        goto LABEL_16;
      ++v9;
      v8 += 4;
      if (!(a4 - a5 + v9))
      {
        __break(1u);
LABEL_16:
        a4 += v9 + 1;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_17:
  if (a4 != a5)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

uint64_t *specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(uint64_t *result, int64_t a2, uint64_t a3, unint64_t a4, int64_t a5, uint64_t a6)
{
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  if (a2 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v6 = *result;
  v7 = *(unsigned int *)(*result + 8);
  if (v7 < a3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (a2 >= a3)
    {
LABEL_29:
      __break(1u);
      return result;
    }
    v8 = 0;
    v9 = a6 + 20 * a4;
    v10 = v6 + 20 * a2;
    v11 = a4;
    while ((uint64_t)v11 < a5)
    {
      if ((a4 & 0x8000000000000000) != 0)
        goto LABEL_20;
      if (v11 >= *(unsigned int *)(a6 + 8))
        goto LABEL_21;
      if (a2 >= (unint64_t)v7)
        goto LABEL_22;
      v12 = *(_DWORD *)(v9 + v8 + 28);
      v13 = v10 + v8;
      v14 = *(_QWORD *)(v9 + v8 + 20);
      *(_QWORD *)(v13 + 12) = *(_QWORD *)(v9 + v8 + 12);
      *(_QWORD *)(v13 + 20) = v14;
      *(_DWORD *)(v13 + 28) = v12;
      v7 = *(unsigned int *)(v6 + 8);
      if (a2 >= v7)
        goto LABEL_23;
      if (v11 >= *(unsigned int *)(a6 + 8))
        goto LABEL_24;
      ++v11;
      if (a3 - 1 == a2)
        goto LABEL_16;
      v8 += 20;
      ++a2;
      if (a5 == v11)
      {
        __break(1u);
LABEL_16:
        a4 = v11;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_17:
  if (a4 != a5)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

_QWORD *specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(_QWORD *result, unint64_t a2, uint64_t a3, unint64_t a4, int64_t a5, uint64_t a6)
{
  _BYTE *v6;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int isUniquelyReferenced_nonNull_native;
  _DWORD *v20;
  unsigned int v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;

  if ((a2 & 0x8000000000000000) != 0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v6 = result;
  result = (_QWORD *)*result;
  if (*(unsigned int *)(result[2] + 8) < a3)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v8 = a4;
  v9 = a2;
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_35:
      __break(1u);
      return result;
    }
    v10 = 0;
    v11 = *(_QWORD *)(a6 + 16);
    v12 = v11 + 20 * a4;
    v13 = a3 - 1;
    v14 = 20 * a2;
    v15 = a4;
    v27 = v12;
    v28 = v6;
    v25 = 20 * a2;
    v26 = a3 - 1;
    while ((uint64_t)v15 < a5)
    {
      if ((v8 & 0x8000000000000000) != 0)
        goto LABEL_25;
      if (v15 >= *(unsigned int *)(v11 + 8))
        goto LABEL_26;
      v16 = *(_QWORD *)(v12 + v10 + 12);
      v17 = *(_QWORD *)(v12 + v10 + 20);
      v18 = *(_DWORD *)(v12 + v10 + 28);
      if ((v6[8] & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        result = *(_QWORD **)v6;
        if (!isUniquelyReferenced_nonNull_native || result[3])
        {
          v20 = (_DWORD *)result[2];
          v21 = v20[2];
          type metadata accessor for ManagedAudioChannelLayout.Storage();
          result = (_QWORD *)swift_allocObject();
          if (!v21)
            goto LABEL_30;
          v22 = result;
          result = calloc(20 * v21 + 12, 1uLL);
          if (!result)
            goto LABEL_31;
          *((_DWORD *)result + 2) = v21;
          v22[3] = 0;
          v22[4] = 0;
          v22[2] = result;
          memcpy(result, v20, 20 * v21 + 12);
          v6 = v28;
          *v28 = v22;
          swift_release();
          result = (_QWORD *)*v28;
          v13 = v26;
          v12 = v27;
          v14 = v25;
        }
      }
      v23 = result[2];
      if (v9 >= *(unsigned int *)(v23 + 8))
        goto LABEL_27;
      v24 = v23 + v14 + v10;
      *(_QWORD *)(v24 + 12) = v16;
      *(_QWORD *)(v24 + 20) = v17;
      *(_DWORD *)(v24 + 28) = v18;
      result = *(_QWORD **)v6;
      if (v9 >= *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v6 + 16) + 8))
        goto LABEL_28;
      if (v15 >= *(unsigned int *)(v11 + 8))
        goto LABEL_29;
      ++v15;
      if (v13 == v9)
        goto LABEL_21;
      v10 += 20;
      ++v9;
      if (a5 == v15)
      {
        __break(1u);
LABEL_21:
        v8 = v15;
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
LABEL_22:
  if (v8 != a5)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  return result;
}

unint64_t specialized MutableCollection<>._partitionImpl(by:)(unint64_t result)
{
  unsigned int **v1;
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t *);
  int64_t v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned int *i;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v3 = *v1;
  v4 = **v1;
  if ((_DWORD)v4)
  {
    v5 = (uint64_t (*)(uint64_t *))result;
    v6 = 0;
    v7 = **v1;
    while (v6 < (unint64_t)v4)
    {
      v8 = &v3[4 * v6 + 2];
      v9 = *((_QWORD *)v8 + 1);
      v13 = *(_QWORD *)v8;
      v14 = v9;
      result = v5(&v13);
      if (v2)
        return v6;
      v4 = *v3;
      if ((result & 1) != 0)
      {
        if (v7 > v4)
          goto LABEL_27;
        if (v6 >= v7 - 1)
          return v6;
        for (i = &v3[4 * v7--]; ; i -= 4)
        {
          if (v7 >= v4)
          {
            __break(1u);
LABEL_25:
            __break(1u);
            goto LABEL_26;
          }
          v11 = *(_QWORD *)i;
          v13 = *((_QWORD *)i - 1);
          v14 = v11;
          result = v5(&v13);
          if ((result & 1) == 0)
            break;
          v4 = *v3;
          if (v7 > v4)
            goto LABEL_25;
          if (v6 >= --v7)
            return v6;
        }
        result = specialized MutableCollection.swapAt(_:_:)(v6, v7);
        v4 = *v3;
        if (v6 >= v4)
          goto LABEL_30;
        if (++v6 >= v7)
          return v6;
      }
      else
      {
        if (v6 >= v4)
          goto LABEL_28;
        if (__OFADD__(v6++, 1))
          goto LABEL_29;
        if (v6 >= v7)
          return v6;
      }
    }
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t *);
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t *i;
  int v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  int v17;

  v3 = *v1;
  v4 = *(unsigned int *)(*v1 + 8);
  if ((_DWORD)v4)
  {
    v5 = (uint64_t (*)(uint64_t *))result;
    v6 = 0;
    v7 = *(unsigned int *)(*v1 + 8);
    while (v6 < (unint64_t)v4)
    {
      v8 = v3 + 12 + 20 * v6;
      v9 = *(_DWORD *)(v8 + 16);
      v10 = *(_QWORD *)(v8 + 8);
      v15 = *(_QWORD *)v8;
      v16 = v10;
      v17 = v9;
      result = v5(&v15);
      if (v2)
        return v6;
      v4 = *(unsigned int *)(v3 + 8);
      if ((result & 1) != 0)
      {
        if (v7 > v4)
          goto LABEL_27;
        if (v6 >= v7 - 1)
          return v6;
        for (i = (uint64_t *)(v3 + 20 * v7--); ; i = (uint64_t *)((char *)i - 20))
        {
          if (v7 >= v4)
          {
            __break(1u);
LABEL_25:
            __break(1u);
            goto LABEL_26;
          }
          v12 = *((_DWORD *)i + 2);
          v13 = *i;
          v15 = *(i - 1);
          v16 = v13;
          v17 = v12;
          result = v5(&v15);
          if ((result & 1) == 0)
            break;
          v4 = *(unsigned int *)(v3 + 8);
          if (v7 > v4)
            goto LABEL_25;
          if (v6 >= --v7)
            return v6;
        }
        result = specialized MutableCollection.swapAt(_:_:)(v6, v7);
        v4 = *(unsigned int *)(v3 + 8);
        if (v6 >= v4)
          goto LABEL_30;
        if (++v6 >= v7)
          return v6;
      }
      else
      {
        if (v6 >= v4)
          goto LABEL_28;
        if (__OFADD__(v6++, 1))
          goto LABEL_29;
        if (v6 >= v7)
          return v6;
      }
    }
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t *);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int64_t v11;
  uint64_t *i;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  v3 = *v1;
  v4 = *(unsigned int *)(*(_QWORD *)(*v1 + 16) + 8);
  if ((_DWORD)v4)
  {
    v5 = (uint64_t (*)(uint64_t *))result;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(v3 + 16);
      if (v6 >= *(unsigned int *)(v7 + 8))
        break;
      v8 = v7 + 20 * v6;
      v9 = *(_DWORD *)(v8 + 28);
      v10 = *(_QWORD *)(v8 + 20);
      v15 = *(_QWORD *)(v8 + 12);
      v16 = v10;
      v17 = v9;
      result = v5(&v15);
      if (v2)
        return v6;
      v11 = *(unsigned int *)(v7 + 8);
      if ((result & 1) != 0)
      {
        if (v4 > v11)
          goto LABEL_25;
        if ((uint64_t)v6 >= v4 - 1)
          return v6;
        for (i = (uint64_t *)(v7 + 20 * v4--); ; i = (uint64_t *)((char *)i - 20))
        {
          if (v4 >= v11)
          {
            __break(1u);
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
          v13 = *((_DWORD *)i + 2);
          v14 = *i;
          v15 = *(i - 1);
          v16 = v14;
          v17 = v13;
          result = v5(&v15);
          if ((result & 1) == 0)
            break;
          v11 = *(unsigned int *)(v7 + 8);
          if (v4 > v11)
            goto LABEL_23;
          if ((uint64_t)v6 >= --v4)
            return v6;
        }
        result = specialized MutableCollection.swapAt(_:_:)(v6, v4);
        v3 = *v1;
        if (v6 >= *(unsigned int *)(*(_QWORD *)(*v1 + 16) + 8))
          goto LABEL_27;
      }
      else if (v6 >= v11)
      {
        goto LABEL_26;
      }
      if ((uint64_t)++v6 >= v4)
        return v6;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(unsigned int *a1)
{
  unint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *a1;
  if (!(_DWORD)v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AudioBuffer>);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  if (specialized Sequence._copySequenceContents(initializing:)(&v7, v3 + 4, v1, a1) != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  unint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v6;

  v1 = *(unsigned int *)(a1 + 8);
  if (!(_DWORD)v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AudioChannelDescription>);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 20);
  if (specialized Sequence._copySequenceContents(initializing:)(&v6, (uint64_t)(v3 + 4), v1, a1) != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, char a2)
{
  unint64_t v2;
  _QWORD *v5;
  size_t v6;
  unint64_t v7;
  _QWORD v9[3];

  v2 = *(unsigned int *)(*(_QWORD *)(a1 + 16) + 8);
  if (!(_DWORD)v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AudioChannelDescription>);
  v5 = (_QWORD *)swift_allocObject();
  v6 = _swift_stdlib_malloc_size(v5);
  v5[2] = v2;
  v5[3] = 2 * ((uint64_t)(v6 - 32) / 20);
  v7 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v9, (uint64_t)(v5 + 4), v2, a1, a2 & 1);
  swift_retain();
  swift_release();
  if (v7 != v2)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v5;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, _QWORD *a2, unint64_t a3, unsigned int *a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!a2)
    goto LABEL_12;
  if (!a3)
    goto LABEL_13;
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (*a4)
    {
      v4 = *((_QWORD *)a4 + 2);
      *a2 = *((_QWORD *)a4 + 1);
      a2[1] = v4;
      if (a3 != 1)
      {
        v5 = 0;
        v6 = 1;
        while (a3 != v6)
        {
          v7 = *a4;
          if (v6 == v7)
          {
            a3 = v6;
            goto LABEL_13;
          }
          if (v6 >= v7)
            goto LABEL_16;
          ++v6;
          v8 = *(_QWORD *)&a4[v5 / 4 + 8];
          a2[v5 / 8 + 2] = *(_QWORD *)&a4[v5 / 4 + 6];
          a2[v5 / 8 + 3] = v8;
          v5 += 16;
          if (a3 == v6)
            goto LABEL_13;
        }
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
LABEL_13:
      *result = a4;
      result[1] = a3;
      return (_QWORD *)a3;
    }
LABEL_12:
    a3 = 0;
    goto LABEL_13;
  }
LABEL_17:
  __break(1u);
  return result;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  _DWORD *v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;

  if (!a2)
  {
LABEL_11:
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    *(_QWORD *)result = a4;
    *(_BYTE *)(result + 8) = a5 & 1;
    *(_QWORD *)(result + 16) = a3;
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(a4 + 16);
    if (*(_DWORD *)(v5 + 8))
    {
      v6 = (_DWORD *)(v5 + 28);
      v7 = 1;
      while (1)
      {
        v8 = *v6;
        v9 = *((_QWORD *)v6 - 1);
        *(_QWORD *)a2 = *((_QWORD *)v6 - 2);
        *(_QWORD *)(a2 + 8) = v9;
        *(_DWORD *)(a2 + 16) = v8;
        if (a3 == v7)
          goto LABEL_12;
        v10 = *(unsigned int *)(v5 + 8);
        if (v7 == v10)
        {
          a3 = v7;
          goto LABEL_12;
        }
        v6 += 5;
        a2 += 20;
        if (v7++ >= v10)
        {
          __break(1u);
          goto LABEL_11;
        }
      }
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  if (!a2)
    goto LABEL_12;
  if (!a3)
    goto LABEL_13;
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (*(_DWORD *)(a4 + 8))
    {
      v4 = *(_DWORD *)(a4 + 28);
      v5 = *(_QWORD *)(a4 + 20);
      *(_QWORD *)a2 = *(_QWORD *)(a4 + 12);
      *(_QWORD *)(a2 + 8) = v5;
      *(_DWORD *)(a2 + 16) = v4;
      if (a3 != 1)
      {
        v6 = 0;
        v7 = 1;
        while (a3 != v7)
        {
          v8 = *(unsigned int *)(a4 + 8);
          if (v7 == v8)
          {
            a3 = v7;
            goto LABEL_13;
          }
          if (v7 >= v8)
            goto LABEL_16;
          ++v7;
          v9 = *(_DWORD *)(a4 + v6 + 48);
          v10 = a2 + v6;
          v11 = *(_QWORD *)(a4 + v6 + 40);
          *(_QWORD *)(a2 + v6 + 20) = *(_QWORD *)(a4 + v6 + 32);
          *(_QWORD *)(v10 + 28) = v11;
          *(_DWORD *)(v10 + 36) = v9;
          v6 += 20;
          if (a3 == v7)
            goto LABEL_13;
        }
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
LABEL_13:
      *result = a4;
      result[1] = a3;
      return (_QWORD *)a3;
    }
LABEL_12:
    a3 = 0;
    goto LABEL_13;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t specialized static ManagedAudioChannelLayout.ChannelDescriptions.== infix(_:_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int32x2_t v7;
  int32x2_t v8;
  BOOL v9;

  v2 = *(_QWORD *)(*(_QWORD *)result + 16);
  v3 = *(unsigned int *)(v2 + 8);
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  if ((_DWORD)v3 != *(_DWORD *)(v4 + 8))
    return 0;
  if (!(_DWORD)v3)
    return 1;
  v5 = 0;
  v6 = 20 * v3;
  while (v6 != v5)
  {
    v7 = vceq_s32(*(int32x2_t *)(v2 + v5 + 12), *(int32x2_t *)(v4 + v5 + 12));
    v8 = vceq_f32(*(float32x2_t *)(v2 + v5 + 24), *(float32x2_t *)(v4 + v5 + 24));
    result = (v7.i8[0] & (*(float *)(v2 + v5 + 20) == *(float *)(v4 + v5 + 20)) & v8.i8[0] & v7.i8[4]) & v8.i8[4];
    v9 = (_DWORD)result != 1 || v6 - 20 == v5;
    v5 += 20;
    if (v9)
      return result;
  }
  __break(1u);
  return result;
}

_DWORD *specialized static ManagedAudioChannelLayout.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  _DWORD *result;
  unsigned int v3;
  _DWORD *v4;
  int v5;

  result = *(_DWORD **)(*(_QWORD *)a1 + 16);
  v3 = result[2];
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = *(_DWORD **)(*(_QWORD *)a2 + 16);
  v5 = v4[2];
  if (!v5)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  if (v3 == v5)
    return (_DWORD *)(memcmp(result, v4, 20 * v3 + 12) == 0);
  else
    return 0;
}

unint64_t lazy protocol witness table accessor for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for UnsafeMutableAudioBufferListPointer, &type metadata for UnsafeMutableAudioBufferListPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for UnsafeMutableAudioBufferListPointer, &type metadata for UnsafeMutableAudioBufferListPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for UnsafeMutableAudioBufferListPointer, &type metadata for UnsafeMutableAudioBufferListPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for UnsafeMutableAudioBufferListPointer, &type metadata for UnsafeMutableAudioBufferListPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for UnsafeMutableAudioBufferListPointer, &type metadata for UnsafeMutableAudioBufferListPointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in UnsafeMutableAudioBufferListPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableAudioBufferListPointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer, MEMORY[0x1E0DEDE30]);
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in UnsafeMutableAudioBufferListPointer()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x1E0DEB8B8]);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    result = MEMORY[0x1DF0C0170](MEMORY[0x1E0DEB440], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in UnsafeMutableAudioBufferListPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableAudioBufferListPointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer, MEMORY[0x1E0DEDE40]);
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in UnsafeMutableAudioBufferListPointer()
{
  return MEMORY[0x1E0DEB430];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in UnsafeMutableAudioBufferListPointer()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x1E0DEB8C0]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in UnsafeMutableAudioBufferListPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableAudioBufferListPointer>, MEMORY[0x1E0DEDE48]);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in UnsafeMutableAudioBufferListPointer()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x1E0DEB890]);
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
    v7[0] = MEMORY[0x1E0DEB458];
    v7[1] = v6;
    result = MEMORY[0x1DF0C0170](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in UnsafeMutableAudioBufferListPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableAudioBufferListPointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type UnsafeMutableAudioBufferListPointer and conformance UnsafeMutableAudioBufferListPointer, MEMORY[0x1E0DEDE28]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in UnsafeMutableAudioBufferListPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<UnsafeMutableAudioBufferListPointer> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<UnsafeMutableAudioBufferListPointer>, MEMORY[0x1E0DEC908]);
}

unint64_t lazy protocol witness table accessor for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer;
  if (!lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for AudioChannelLayout.UnsafeMutablePointer, &type metadata for AudioChannelLayout.UnsafeMutablePointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer;
  if (!lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for AudioChannelLayout.UnsafeMutablePointer, &type metadata for AudioChannelLayout.UnsafeMutablePointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer;
  if (!lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for AudioChannelLayout.UnsafeMutablePointer, &type metadata for AudioChannelLayout.UnsafeMutablePointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer;
  if (!lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for AudioChannelLayout.UnsafeMutablePointer, &type metadata for AudioChannelLayout.UnsafeMutablePointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer;
  if (!lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for AudioChannelLayout.UnsafeMutablePointer, &type metadata for AudioChannelLayout.UnsafeMutablePointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in AudioChannelLayout.UnsafeMutablePointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<AudioChannelLayout.UnsafeMutablePointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<AudioChannelLayout.UnsafeMutablePointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer, MEMORY[0x1E0DEDE30]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in AudioChannelLayout.UnsafeMutablePointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<AudioChannelLayout.UnsafeMutablePointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<AudioChannelLayout.UnsafeMutablePointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer, MEMORY[0x1E0DEDE40]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in AudioChannelLayout.UnsafeMutablePointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<AudioChannelLayout.UnsafeMutablePointer> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<AudioChannelLayout.UnsafeMutablePointer>, MEMORY[0x1E0DEDE48]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in AudioChannelLayout.UnsafeMutablePointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<AudioChannelLayout.UnsafeMutablePointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<AudioChannelLayout.UnsafeMutablePointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type AudioChannelLayout.UnsafeMutablePointer and conformance AudioChannelLayout.UnsafeMutablePointer, MEMORY[0x1E0DEDE28]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in AudioChannelLayout.UnsafeMutablePointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<AudioChannelLayout.UnsafeMutablePointer> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<AudioChannelLayout.UnsafeMutablePointer>, MEMORY[0x1E0DEC908]);
}

unint64_t lazy protocol witness table accessor for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer;
  if (!lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for AudioChannelLayout.UnsafePointer, &type metadata for AudioChannelLayout.UnsafePointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer;
  if (!lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for AudioChannelLayout.UnsafePointer, &type metadata for AudioChannelLayout.UnsafePointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer;
  if (!lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for AudioChannelLayout.UnsafePointer, &type metadata for AudioChannelLayout.UnsafePointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer;
  if (!lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for AudioChannelLayout.UnsafePointer, &type metadata for AudioChannelLayout.UnsafePointer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in AudioChannelLayout.UnsafePointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<AudioChannelLayout.UnsafePointer> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<AudioChannelLayout.UnsafePointer>, MEMORY[0x1E0DEDE48]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in AudioChannelLayout.UnsafePointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<AudioChannelLayout.UnsafePointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<AudioChannelLayout.UnsafePointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer, MEMORY[0x1E0DEDE40]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in AudioChannelLayout.UnsafePointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<AudioChannelLayout.UnsafePointer> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<AudioChannelLayout.UnsafePointer>, MEMORY[0x1E0DEC908]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in AudioChannelLayout.UnsafePointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<AudioChannelLayout.UnsafePointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<AudioChannelLayout.UnsafePointer>, (uint64_t (*)(void))lazy protocol witness table accessor for type AudioChannelLayout.UnsafePointer and conformance AudioChannelLayout.UnsafePointer, MEMORY[0x1E0DEDE28]);
}

unint64_t lazy protocol witness table accessor for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions;
  if (!lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for ManagedAudioChannelLayout.ChannelDescriptions, &type metadata for ManagedAudioChannelLayout.ChannelDescriptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions;
  if (!lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for ManagedAudioChannelLayout.ChannelDescriptions, &type metadata for ManagedAudioChannelLayout.ChannelDescriptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions;
  if (!lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for ManagedAudioChannelLayout.ChannelDescriptions, &type metadata for ManagedAudioChannelLayout.ChannelDescriptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions;
  if (!lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for ManagedAudioChannelLayout.ChannelDescriptions, &type metadata for ManagedAudioChannelLayout.ChannelDescriptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions;
  if (!lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions)
  {
    result = MEMORY[0x1DF0C0170](&protocol conformance descriptor for ManagedAudioChannelLayout.ChannelDescriptions, &type metadata for ManagedAudioChannelLayout.ChannelDescriptions);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in ManagedAudioChannelLayout.ChannelDescriptions()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ManagedAudioChannelLayout.ChannelDescriptions> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<ManagedAudioChannelLayout.ChannelDescriptions>, (uint64_t (*)(void))lazy protocol witness table accessor for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions, MEMORY[0x1E0DEDE30]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ManagedAudioChannelLayout.ChannelDescriptions()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ManagedAudioChannelLayout.ChannelDescriptions> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<ManagedAudioChannelLayout.ChannelDescriptions>, (uint64_t (*)(void))lazy protocol witness table accessor for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions, MEMORY[0x1E0DEDE40]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ManagedAudioChannelLayout.ChannelDescriptions()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<ManagedAudioChannelLayout.ChannelDescriptions> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<ManagedAudioChannelLayout.ChannelDescriptions>, MEMORY[0x1E0DEDE48]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ManagedAudioChannelLayout.ChannelDescriptions()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ManagedAudioChannelLayout.ChannelDescriptions> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<ManagedAudioChannelLayout.ChannelDescriptions>, (uint64_t (*)(void))lazy protocol witness table accessor for type ManagedAudioChannelLayout.ChannelDescriptions and conformance ManagedAudioChannelLayout.ChannelDescriptions, MEMORY[0x1E0DEDE28]);
}

uint64_t lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance <> Slice<A>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x1DF0C0170](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ManagedAudioChannelLayout.ChannelDescriptions()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<ManagedAudioChannelLayout.ChannelDescriptions> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<ManagedAudioChannelLayout.ChannelDescriptions>, MEMORY[0x1E0DEC908]);
}

uint64_t lazy protocol witness table accessor for type Slice<UnsafeMutableAudioBufferListPointer> and conformance Slice<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0C0170](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unsigned int **sub_1DC07AD1C@<X0>(unsigned int **result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = **result;
  return result;
}

unint64_t *sub_1DC07AD2C(unint64_t *result, _DWORD **a2)
{
  unint64_t v2;

  v2 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(v2))
  {
    **a2 = v2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DC07AD50@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(unsigned int *)(*(_QWORD *)result + 8);
  return result;
}

unint64_t *sub_1DC07AD60(unint64_t *result, uint64_t a2)
{
  unint64_t v2;

  v2 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(v2))
  {
    *(_DWORD *)(*(_QWORD *)a2 + 8) = v2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DC07AD84@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = **(_DWORD **)(*(_QWORD *)result + 16);
  return result;
}

uint64_t sub_1DC07AD98(int *a1)
{
  return ManagedAudioChannelLayout.tag.setter(*a1);
}

uint64_t sub_1DC07ADBC@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)result + 16) + 4);
  return result;
}

uint64_t sub_1DC07ADD0(int *a1)
{
  return ManagedAudioChannelLayout.bitmap.setter(*a1);
}

uint64_t sub_1DC07ADF4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *a1;
  *(_BYTE *)(a2 + 8) = 0;
  return swift_retain();
}

uint64_t sub_1DC07AE10()
{
  return 0;
}

ValueMetadata *type metadata accessor for UnsafeMutableAudioBufferListPointer()
{
  return &type metadata for UnsafeMutableAudioBufferListPointer;
}

ValueMetadata *type metadata accessor for AudioChannelLayout.UnsafeMutablePointer()
{
  return &type metadata for AudioChannelLayout.UnsafeMutablePointer;
}

uint64_t getEnumTagSinglePayload for UnsafeMutableAudioBufferListPointer(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for UnsafeMutableAudioBufferListPointer(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AudioChannelLayout.UnsafePointer()
{
  return &type metadata for AudioChannelLayout.UnsafePointer;
}

uint64_t initializeWithCopy for ManagedAudioChannelLayout(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ManagedAudioChannelLayout(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for ManagedAudioChannelLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManagedAudioChannelLayout(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 28))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ManagedAudioChannelLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 28) = 1;
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
    *(_BYTE *)(result + 28) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ManagedAudioChannelLayout()
{
  return &type metadata for ManagedAudioChannelLayout;
}

uint64_t initializeBufferWithCopyOfBuffer for ManagedAudioChannelLayout.ChannelDescriptions(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ManagedAudioChannelLayout.ChannelDescriptions(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for ManagedAudioChannelLayout.ChannelDescriptions(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManagedAudioChannelLayout.ChannelDescriptions(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 9))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ManagedAudioChannelLayout.ChannelDescriptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
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
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ManagedAudioChannelLayout.ChannelDescriptions()
{
  return &type metadata for ManagedAudioChannelLayout.ChannelDescriptions;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@in_guaranteed AudioChannelLayout.UnsafePointer) -> ())?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1E0DEA428]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x1E0DEA430]();
}

uint64_t UnsafeBufferPointer.init(start:count:)()
{
  return MEMORY[0x1E0DEA588]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x1E0DEA7B8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA7F8](a1._countAndFlagsBits, a1._object);
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = MEMORY[0x1E0DEA840]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x1E0DEA9C0]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t UnsafeMutableBufferPointer.baseAddress.getter()
{
  return MEMORY[0x1E0DEB980]();
}

uint64_t UnsafeMutableBufferPointer.init(start:count:)()
{
  return MEMORY[0x1E0DEB988]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1E0C81828](__count, __size);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

