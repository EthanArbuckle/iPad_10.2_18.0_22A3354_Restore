void protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAHeaderTraits(AAHeader *a1)
{
  AAHeaderDestroy(*a1);
}

uint64_t ArchiveHeader.__allocating_init()()
{
  uint64_t v0;
  AAHeader v1;
  uint64_t result;

  v0 = swift_allocObject();
  v1 = AAHeaderCreate();
  if (v1)
  {
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveHeader.init()()
{
  uint64_t v0;
  AAHeader v1;
  uint64_t result;

  v1 = AAHeaderCreate();
  if (v1)
  {
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveHeader.__allocating_init(keySet:directory:path:flags:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  return ArchiveHeader.init(keySet:directory:path:flags:)(a1, a2, a3);
}

uint64_t ArchiveHeader.init(keySet:directory:path:flags:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v10;

  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  FilePath.withCString<A>(_:)();
  swift_release();
  v7 = type metadata accessor for FilePath();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(a2, v7);
  if (v10)
  {
    *(_QWORD *)(v4 + 16) = v10;
    *(_BYTE *)(v4 + 24) = 1;
    v8(a3, v7);
  }
  else
  {
    v8(a3, v7);
    type metadata accessor for ArchiveHeader();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v4;
}

uint64_t partial apply for closure #1 in ArchiveHeader.init(keySet:directory:path:flags:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  return FilePath.withCString<A>(_:)();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207DD47C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for ArchiveHeader()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ArchiveHeader;
  if (!type metadata singleton initialization cache for ArchiveHeader)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ArchiveHeader.__allocating_init(copying:)(uint64_t a1)
{
  uint64_t v2;
  AAHeader v3;
  AAHeader v4;
  uint64_t result;

  v2 = swift_allocObject();
  v3 = AAHeaderClone(*(AAHeader *)(a1 + 16));
  if (v3)
  {
    v4 = v3;
    swift_release();
    *(_QWORD *)(v2 + 16) = v4;
    *(_BYTE *)(v2 + 24) = 1;
    return v2;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveHeader.init(copying:)(uint64_t a1)
{
  uint64_t v1;
  AAHeader v2;
  AAHeader v3;
  uint64_t result;

  v2 = AAHeaderClone(*(AAHeader *)(a1 + 16));
  if (v2)
  {
    v3 = v2;
    swift_release();
    *(_QWORD *)(v1 + 16) = v3;
    *(_BYTE *)(v1 + 24) = 1;
    return v1;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

unsigned int ArchiveHeader.field(forKey:)@<W0>(AAFieldKey *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  AAFieldKey v4;
  unsigned int result;
  __int128 v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  uint64_t v10;
  char v11;

  v4 = *a1;
  result = AAHeaderGetKeyIndex(*(AAHeader *)(v2 + 16), v4);
  if ((result & 0x80000000) != 0)
  {
    v7 = 0;
    v6 = 0uLL;
    v8 = -1;
  }
  else
  {
    result = ArchiveHeader._field(at:)(result, (uint64_t)&v9).ikey;
    v6 = v9;
    v7 = v10;
    v8 = v11;
  }
  *(_OWORD *)a2 = v6;
  *(_QWORD *)(a2 + 16) = v7;
  *(_BYTE *)(a2 + 24) = v8;
  return result;
}

AAFieldKey ArchiveHeader._field(at:)@<W0>(unint64_t i@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  AAHeader_impl *v5;
  int FieldType;
  int v7;
  AAFieldKey result;
  BOOL v9;
  AAFieldKey v10;
  BOOL v11;
  char v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __darwin_time_t tv_sec;
  __darwin_time_t v20;
  uint64_t v21;
  timespec value;
  uint64_t offset[2];

  offset[1] = *MEMORY[0x24BDAC8D0];
  if ((i & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }
  if (HIDWORD(i))
    goto LABEL_30;
  v5 = *(AAHeader_impl **)(v2 + 16);
  FieldType = AAHeaderGetFieldType(v5, i);
  if (FieldType < 0
    || ((v7 = FieldType, result = AAHeaderGetFieldKey(v5, i), (int)(result.ikey << 8) >> 24 >= 32)
      ? (v9 = HIBYTE(result.ikey) == 0)
      : (v9 = 0),
        !v9 || ((v10 = result, result.skey[0] >= 32) ? (v11 = *(__int16 *)result.skey >> 8 <= 31) : (v11 = 1), v11)))
  {
    while (1)
    {
LABEL_33:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  switch(v7)
  {
    case 0:
      *(_QWORD *)(a2 + 8) = 0;
      *(_QWORD *)(a2 + 16) = 0;
      *(_QWORD *)a2 = result.ikey;
      *(_BYTE *)(a2 + 24) = 0;
      return result;
    case 1:
      value.tv_sec = 0;
      result.ikey = AAHeaderGetFieldUInt(v5, i, (uint64_t *)&value);
      if ((result.ikey & 0x80000000) != 0)
        goto LABEL_33;
      tv_sec = value.tv_sec;
      *(_QWORD *)a2 = v10.ikey;
      *(_QWORD *)(a2 + 8) = tv_sec;
      *(_QWORD *)(a2 + 16) = 0;
      v12 = 1;
      goto LABEL_27;
    case 2:
      value.tv_sec = 0;
      if (AAHeaderGetFieldString(v5, i, 0, 0, (size_t *)&value) < 0)
        goto LABEL_33;
      if (__OFADD__(value.tv_sec, 1))
        goto LABEL_31;
      v13 = (char *)swift_slowAlloc();
      if (__OFADD__(value.tv_sec, 1))
        goto LABEL_32;
      v14 = v13;
      if (AAHeaderGetFieldString(v5, i, value.tv_sec + 1, v13, 0) < 0)
      {
        MEMORY[0x2207DD50C](v14, -1, -1);
        goto LABEL_33;
      }
      v15 = String.init(cString:)();
      v17 = v16;
      result.ikey = MEMORY[0x2207DD50C](v14, -1, -1);
      *(_QWORD *)a2 = v10.ikey;
      *(_QWORD *)(a2 + 8) = v15;
      *(_QWORD *)(a2 + 16) = v17;
      v12 = 2;
LABEL_27:
      *(_BYTE *)(a2 + 24) = v12;
      return result;
    case 3:
      LODWORD(value.tv_sec) = 0;
      swift_retain();
      v18 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(64, v2, i, (AAHashFunction *)&value);
      result.ikey = swift_release();
      *(_QWORD *)a2 = v10.ikey | ((unint64_t)LODWORD(value.tv_sec) << 32);
      *(_QWORD *)(a2 + 8) = v18;
      *(_QWORD *)(a2 + 16) = 0;
      v12 = 3;
      goto LABEL_27;
    case 4:
      value.tv_sec = 0;
      value.tv_nsec = 0;
      result.ikey = AAHeaderGetFieldTimespec(v5, i, &value);
      if ((result.ikey & 0x80000000) != 0)
        goto LABEL_33;
      *(_QWORD *)a2 = v10.ikey;
      *(timespec *)(a2 + 8) = value;
      v12 = 4;
      goto LABEL_27;
    case 5:
      value.tv_sec = 0;
      offset[0] = 0;
      result.ikey = AAHeaderGetFieldBlob(v5, i, (uint64_t *)&value, offset);
      if ((result.ikey & 0x80000000) != 0)
        goto LABEL_33;
      v20 = value.tv_sec;
      v21 = offset[0];
      *(_QWORD *)a2 = v10.ikey;
      *(_QWORD *)(a2 + 8) = v20;
      *(_QWORD *)(a2 + 16) = v21;
      v12 = 5;
      goto LABEL_27;
    default:
      goto LABEL_33;
  }
}

uint64_t closure #1 in ArchiveHeader._field(at:)(uint8_t **a1, _QWORD *a2, uint64_t a3, unint64_t i, AAHashFunction *hash_function)
{
  uint64_t result;
  AAHashFunction v8;
  uint64_t v9;

  if ((i & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (HIDWORD(i))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  result = AAHeaderGetFieldHash(*(AAHeader *)(a3 + 16), i, 0x40uLL, hash_function, *a1);
  if ((result & 0x80000000) != 0)
  {
LABEL_10:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v8 = *hash_function - 1;
  if (v8 > 4)
    v9 = 0;
  else
    v9 = qword_220078098[v8];
  *a2 = v9;
  return result;
}

void ArchiveHeader._append(_:)(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_220062F48(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11, timespec value, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21)
{
  uint64_t v21;
  AAFieldKey v22;
  AAFieldKey v23;
  uint64_t result;

  v23 = v22;
  result = AAHeaderSetFieldFlag(*(AAHeader *)(v21 + 16), 0xFFFFFFFF, v23);
  if ((result & 0x80000000) != 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void ArchiveHeader._set(at:field:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_220063114(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11, timespec value, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21)
{
  unint64_t v21;
  uint64_t v22;
  AAFieldKey v23;
  AAFieldKey v24;
  uint64_t result;

  if ((v21 & 0x8000000000000000) != 0)
  {
    __break(1u);
    JUMPOUT(0x220063290);
  }
  if (HIDWORD(v21))
  {
    __break(1u);
    JUMPOUT(0x2200632A8);
  }
  v24 = v23;
  result = AAHeaderSetFieldFlag(*(AAHeader *)(v22 + 16), v21, v24);
  if ((result & 0x80000000) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    JUMPOUT(0x220063308);
  }
  return result;
}

uint64_t ArchiveHeader.__allocating_init(withAAEncodedData:)(const uint8_t *a1, size_t a2)
{
  uint64_t result;
  uint64_t v5;
  AAHeader v6;

  result = swift_allocObject();
  if (a1)
  {
    v5 = result;
    v6 = AAHeaderCreateWithEncodedData(a2, a1);
    if (v6)
    {
      *(_QWORD *)(v5 + 16) = v6;
      *(_BYTE *)(v5 + 24) = 1;
    }
    else
    {
      swift_deallocPartialClassInstance();
      return 0;
    }
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

const uint8_t *ArchiveHeader.init(withAAEncodedData:)(const uint8_t *data, size_t data_size)
{
  uint64_t v2;
  AAHeader v3;

  if (data)
  {
    v3 = AAHeaderCreateWithEncodedData(data_size, data);
    if (v3)
    {
      *(_QWORD *)(v2 + 16) = v3;
      *(_BYTE *)(v2 + 24) = 1;
    }
    else
    {
      type metadata accessor for ArchiveHeader();
      swift_deallocPartialClassInstance();
      return 0;
    }
    return (const uint8_t *)v2;
  }
  else
  {
    __break(1u);
  }
  return data;
}

uint64_t ArchiveHeader.withAAEncodedData<A>(_:)(uint64_t (*a1)(const uint8_t *, size_t))
{
  uint64_t v1;
  AAHeader_impl *v3;
  size_t EncodedSize;
  const uint8_t *EncodedData;

  v3 = *(AAHeader_impl **)(v1 + 16);
  EncodedSize = AAHeaderGetEncodedSize(v3);
  EncodedData = AAHeaderGetEncodedData(v3);
  return a1(EncodedData, EncodedSize);
}

void ArchiveHeader.__allocating_init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ArchiveHeader.init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ArchiveHeader.deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
    AAHeaderDestroy(*(AAHeader *)(v0 + 16));
  return v0;
}

uint64_t ArchiveHeader.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
    AAHeaderDestroy(*(AAHeader *)(v0 + 16));
  return swift_deallocClassInstance();
}

void vtable thunk for _AAObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveHeader.__allocating_init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t protocol witness for _AAEncodableProtocol.init(withAAEncodedData:) in conformance ArchiveHeader@<X0>(const uint8_t *a1@<X0>, size_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v7;

  type metadata accessor for ArchiveHeader();
  result = swift_allocObject();
  if (a1)
  {
    v7 = result;
    result = (uint64_t)AAHeaderCreateWithEncodedData(a2, a1);
    if (result)
    {
      *(_QWORD *)(v7 + 16) = result;
      *(_BYTE *)(v7 + 24) = 1;
    }
    else
    {
      result = swift_deallocPartialClassInstance();
      v7 = 0;
    }
    *a3 = v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for _AAEncodableProtocol.withAAEncodedData<A>(_:) in conformance ArchiveHeader(uint64_t (*a1)(const uint8_t *, size_t))
{
  return ArchiveHeader.withAAEncodedData<A>(_:)(a1);
}

uint64_t ArchiveHeader.startIndex.getter()
{
  return 0;
}

uint64_t ArchiveHeader.endIndex.getter()
{
  uint64_t v0;

  return AAHeaderGetFieldCount(*(AAHeader *)(v0 + 16));
}

double key path getter for ArchiveHeader.subscript(_:) : ArchiveHeader@<D0>(unint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char v4;
  double result;
  __int128 v6;
  uint64_t v7;
  char v8;

  ArchiveHeader._field(at:)(*a1, (uint64_t)&v6);
  v3 = v7;
  v4 = v8;
  result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(_QWORD *)(a2 + 16) = v3;
  *(_BYTE *)(a2 + 24) = v4;
  return result;
}

uint64_t key path setter for ArchiveHeader.subscript(_:) : ArchiveHeader(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD v9[3];
  char v10;

  v3 = *a3;
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_BYTE *)(a1 + 24);
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = v6;
  v10 = v7;
  outlined copy of ArchiveHeader.Field(v4, v5, v6, v7);
  ArchiveHeader._set(at:field:)(v3, (uint64_t)v9);
  return outlined consume of ArchiveHeader.Field(v4, v5, v6, v7);
}

uint64_t ArchiveHeader.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD v7[3];
  char v8;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_BYTE *)(a1 + 24);
  v7[0] = *(_QWORD *)a1;
  v2 = v7[0];
  v7[1] = v3;
  v7[2] = v4;
  v8 = v5;
  ArchiveHeader._set(at:field:)(a2, (uint64_t)v7);
  return outlined consume of ArchiveHeader.Field(v2, v3, v4, v5);
}

uint64_t outlined consume of ArchiveHeader.Field(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (a4 == 3)
    return swift_release();
  if (a4 == 2)
    return swift_bridgeObjectRelease();
  return result;
}

void (*ArchiveHeader.subscript.modify(_QWORD *a1, unint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v5[4] = a2;
  v5[5] = v2;
  ArchiveHeader._field(at:)(a2, (uint64_t)v5);
  return ArchiveHeader.subscript.modify;
}

void ArchiveHeader.subscript.modify(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD v12[3];
  char v13;

  v2 = *a1;
  v4 = **a1;
  v3 = (*a1)[1];
  v5 = (*a1)[2];
  v6 = *((_BYTE *)*a1 + 24);
  v7 = (*a1)[4];
  v12[0] = v4;
  v12[1] = v3;
  v12[2] = v5;
  v13 = v6;
  if ((a2 & 1) != 0)
  {
    outlined copy of ArchiveHeader.Field(v4, v3, v5, v6);
    ArchiveHeader._set(at:field:)(v7, (uint64_t)v12);
    outlined consume of ArchiveHeader.Field(v4, v3, v5, v6);
    v8 = *v2;
    v9 = v2[1];
    v10 = v2[2];
    v11 = *((_BYTE *)v2 + 24);
  }
  else
  {
    ArchiveHeader._set(at:field:)(v7, (uint64_t)v12);
    v8 = v4;
    v9 = v3;
    v10 = v5;
    v11 = v6;
  }
  outlined consume of ArchiveHeader.Field(v8, v9, v10, v11);
  free(v2);
}

uint64_t outlined copy of ArchiveHeader.Field(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (a4 == 3)
    return swift_retain();
  if (a4 == 2)
    return swift_bridgeObjectRetain();
  return result;
}

Swift::Void __swiftcall ArchiveHeader.removeAll()()
{
  uint64_t v0;

  if (AAHeaderClear(*(AAHeader *)(v0 + 16)))
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t ArchiveHeader.remove(at:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v10[3];
  char v11;

  ArchiveHeader._field(at:)(a1, (uint64_t)v10);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (HIDWORD(a1))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v6 = v10[0];
  v5 = v10[1];
  v4 = v10[2];
  v3 = v11;
  result = AAHeaderRemoveField(*(AAHeader *)(v2 + 16), a1);
  if (!(_DWORD)result)
  {
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v4;
    *(_BYTE *)(a2 + 24) = v3;
    return result;
  }
LABEL_7:
  outlined consume of ArchiveHeader.Field(v6, v5, v4, v3);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void ArchiveHeader.append(_:)(__int128 *a1)
{
  uint64_t v1;
  char v2;
  __int128 v3;
  uint64_t v4;
  char v5;

  v1 = *((_QWORD *)a1 + 2);
  v2 = *((_BYTE *)a1 + 24);
  v3 = *a1;
  v4 = v1;
  v5 = v2;
  ArchiveHeader._append(_:)((uint64_t)&v3);
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance ArchiveHeader(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD v8[3];
  char v9;

  v2 = *a2;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_BYTE *)(a1 + 24);
  v8[0] = *(_QWORD *)a1;
  v3 = v8[0];
  v8[1] = v4;
  v8[2] = v5;
  v9 = v6;
  ArchiveHeader._set(at:field:)(v2, (uint64_t)v8);
  return outlined consume of ArchiveHeader.Field(v3, v4, v5, v6);
}

{
  uint64_t *v2;

  specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  return swift_release();
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader(_QWORD *a1, unint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = ArchiveHeader.subscript.modify(v4, *a2);
  return protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader;
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader;
}

void protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance ArchiveHeader@<X0>(uint64_t (*a1)(uint64_t *)@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t result;

  result = specialized MutableCollection<>._partitionImpl(by:)(a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance ArchiveHeader(unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

uint64_t protocol witness for MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:) in conformance ArchiveHeader()
{
  type metadata accessor for ArchiveHeader();
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t protocol witness for MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:) in conformance ArchiveHeader()
{
  type metadata accessor for ArchiveHeader();
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)();
}

void protocol witness for Collection.startIndex.getter in conformance ArchiveHeader(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader(uint64_t a1, unint64_t *a2))(uint64_t a1)
{
  ArchiveHeader._field(at:)(*a2, a1);
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader;
}

uint64_t protocol witness for Collection.subscript.read in conformance ArchiveHeader(uint64_t a1)
{
  return outlined consume of ArchiveHeader.Field(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t protocol witness for Collection.subscript.getter in conformance ArchiveHeader@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = *a1;
  v5 = a1[1];
  v6 = *v2;
  result = AAHeaderGetFieldCount(*(AAHeader *)(v6 + 16));
  if (v4 < 0)
  {
    __break(1u);
  }
  else if (v5 <= result)
  {
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
    return swift_retain();
  }
  __break(1u);
  return result;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance ArchiveHeader(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance ArchiveHeader(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance ArchiveHeader(uint64_t a1)
{
  MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader, a1);
  return Collection.underestimatedCount.getter();
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance ArchiveHeader()
{
  return 2;
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance ArchiveHeader()
{
  type metadata accessor for ArchiveHeader();
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t ArchiveHeader._FieldTypes.startIndex.getter()
{
  return 0;
}

uint64_t ArchiveHeader._FieldTypes.subscript.getter@<X0>(unint64_t i@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  if ((i & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (HIDWORD(i))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  result = AAHeaderGetFieldType(*(AAHeader *)(*(_QWORD *)v2 + 16), i);
  if ((result & 0x80000000) == 0)
  {
    *a2 = result;
    return result;
  }
LABEL_7:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader._FieldTypes@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  return protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader._FieldTypes(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))specialized RandomAccessCollection.index(_:offsetBy:limitedBy:), a4);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes(int *a1, unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;
  int FieldType;
  uint64_t (*result)();

  v3 = *a2;
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (HIDWORD(v3))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  FieldType = AAHeaderGetFieldType(*(AAHeader *)(*(_QWORD *)v2 + 16), v3);
  if ((FieldType & 0x80000000) == 0)
  {
    *a1 = FieldType;
    return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
  }
LABEL_7:
  result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader._FieldTypes()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader._FieldTypes(_QWORD *a1, int *a2, unint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance ArchiveHeader._FieldTypes()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t ArchiveHeader._FieldKeys.base.getter()
{
  return swift_retain();
}

uint64_t ArchiveHeader._FieldKeys.startIndex.getter()
{
  return 0;
}

uint64_t ArchiveHeader._FieldKeys.endIndex.getter()
{
  uint64_t v0;

  return AAHeaderGetFieldCount(*(AAHeader *)(*(_QWORD *)v0 + 16));
}

AAFieldKey ArchiveHeader._FieldKeys.subscript.getter@<W0>(unint64_t i@<X0>, AAFieldKey *a2@<X8>)
{
  uint64_t v2;
  AAFieldKey result;

  if ((i & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (HIDWORD(i))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  result = AAHeaderGetFieldKey(*(AAHeader *)(*(_QWORD *)v2 + 16), i);
  if ((int)(result.ikey << 8) >> 24 >= 32
    && HIBYTE(result.ikey) == 0
    && result.skey[0] >= 32
    && *(__int16 *)result.skey >> 8 > 31)
  {
    *a2 = result;
    return result;
  }
LABEL_15:
  result.ikey = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveHeader._FieldKeys._customIndexOfEquatableElement(_:)(AAFieldKey *a1)
{
  uint64_t v1;
  AAFieldKey v2;
  int KeyIndex;

  v2 = *a1;
  KeyIndex = AAHeaderGetKeyIndex(*(AAHeader *)(*(_QWORD *)v1 + 16), v2);
  return KeyIndex & ~(KeyIndex >> 31);
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance ArchiveHeader@<X0>(_QWORD *result@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t v4;

  v4 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    result = (_QWORD *)AAHeaderGetFieldCount(*(AAHeader *)(*(_QWORD *)v2 + 16));
    if (v4 < result)
    {
      *a2 = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance ArchiveHeader(unint64_t *result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t *v3;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    result = (unint64_t *)AAHeaderGetFieldCount(*(AAHeader *)(*(_QWORD *)v1 + 16));
    if (v2 < result)
    {
      *v3 = v2;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.endIndex.getter in conformance ArchiveHeader._FieldKeys@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AAHeaderGetFieldCount(*(AAHeader *)(*(_QWORD *)v1 + 16));
  *a1 = result;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldKeys(AAFieldKey *a1, unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;
  AAFieldKey FieldKey;
  uint64_t (*result)();

  v3 = *a2;
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (HIDWORD(v3))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  FieldKey = AAHeaderGetFieldKey(*(AAHeader *)(*(_QWORD *)v2 + 16), v3);
  if ((int)(FieldKey.ikey << 8) >> 24 >= 32
    && HIBYTE(FieldKey.ikey) == 0
    && FieldKey.skey[0] >= 32
    && *(__int16 *)FieldKey.skey >> 8 > 31)
  {
    *a1 = FieldKey;
    return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
  }
LABEL_15:
  result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.subscript.getter in conformance ArchiveHeader._FieldTypes@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = *a1;
  v5 = a1[1];
  v6 = *v2;
  result = AAHeaderGetFieldCount(*(AAHeader *)(v6 + 16));
  if (v4 < 0)
  {
    __break(1u);
  }
  else if (v5 <= result)
  {
    a2[1] = v5;
    a2[2] = v6;
    *a2 = v4;
    return swift_retain();
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance ArchiveHeader._FieldKeys@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AAHeaderGetFieldCount(*(AAHeader *)(*(_QWORD *)v1 + 16));
  *a1 = 0;
  a1[1] = result;
  return result;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance ArchiveHeader._FieldKeys()
{
  uint64_t v0;

  return AAHeaderGetFieldCount(*(AAHeader *)(*(_QWORD *)v0 + 16)) == 0;
}

uint64_t protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance ArchiveHeader._FieldKeys@<X0>(AAFieldKey *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  AAFieldKey v4;
  uint64_t result;

  v4 = *a1;
  result = AAHeaderGetKeyIndex(*(AAHeader *)(*(_QWORD *)v2 + 16), v4);
  *(_QWORD *)a2 = result & ~((int)result >> 31);
  *(_BYTE *)(a2 + 8) = (int)result < 0;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance ArchiveHeader@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v5;

  v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    result = (_QWORD *)AAHeaderGetFieldCount(*(AAHeader *)(*(_QWORD *)v3 + 16));
    if (v5 <= result)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader._FieldTypes@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(_QWORD, uint64_t, _QWORD, _QWORD)@<X5>, uint64_t a5@<X8>)
{
  _QWORD *v5;
  uint64_t result;
  char v8;

  result = a4(*a1, a2, *a3, *v5);
  *(_QWORD *)a5 = result;
  *(_BYTE *)(a5 + 8) = v8 & 1;
  return result;
}

unint64_t protocol witness for RandomAccessCollection.distance(from:to:) in conformance ArchiveHeader(unint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  AAHeader_impl *v5;
  unint64_t result;

  v3 = *a1;
  v4 = *a2;
  v5 = *(AAHeader_impl **)(*(_QWORD *)v2 + 16);
  result = AAHeaderGetFieldCount(v5);
  if (v3 > result)
  {
    __break(1u);
  }
  else
  {
    result = AAHeaderGetFieldCount(v5);
    if (v4 <= result)
      return v4 - v3;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance ArchiveHeader(uint64_t *result, uint64_t *a2)
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

_QWORD *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance ArchiveHeader(_QWORD *result, _QWORD *a2)
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

uint64_t protocol witness for Collection.index(after:) in conformance ArchiveHeader@<X0>(unint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v4;
  uint64_t result;

  v4 = *a1;
  result = AAHeaderGetFieldCount(*(AAHeader *)(*(_QWORD *)v2 + 16));
  if (v4 >= result)
  {
    __break(1u);
  }
  else if (!__OFADD__(v4, 1))
  {
    *a2 = v4 + 1;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.formIndex(after:) in conformance ArchiveHeader(unint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  v3 = *v1;
  v4 = *a1;
  result = AAHeaderGetFieldCount(*(AAHeader *)(v3 + 16));
  if (v4 >= result)
  {
    __break(1u);
  }
  else if (!__OFADD__(v4, 1))
  {
    *a1 = v4 + 1;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.count.getter in conformance ArchiveHeader._FieldTypes()
{
  uint64_t v0;
  AAHeader_impl *v1;
  uint32_t FieldCount;
  uint64_t result;

  v1 = *(AAHeader_impl **)(*(_QWORD *)v0 + 16);
  FieldCount = AAHeaderGetFieldCount(v1);
  AAHeaderGetFieldCount(v1);
  result = AAHeaderGetFieldCount(v1);
  if (result >= FieldCount)
    return FieldCount;
  __break(1u);
  return result;
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader._FieldKeys()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader._FieldKeys(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v3;

  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t ArchiveHeader.fieldKey.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_retain();
}

unsigned int ArchiveHeader.entryType.getter@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  AAFieldKey v3;
  unsigned int result;
  uint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  AAFieldKey v12;

  ArchiveHeader.FieldKey.init(_:)((int *)&v12.ikey);
  v3 = v12;
  result = AAHeaderGetKeyIndex(*(AAHeader *)(v1 + 16), v3);
  if ((result & 0x80000000) != 0)
    goto LABEL_6;
  result = ArchiveHeader._field(at:)(result, (uint64_t)&v8).ikey;
  v5 = v9;
  v6 = v11;
  if (v11 != 1)
  {
LABEL_5:
    result = outlined consume of ArchiveHeader.Field(v8, v5, v10, v6);
LABEL_6:
    LODWORD(v5) = 0;
    LOBYTE(v7) = 1;
    goto LABEL_7;
  }
  v7 = HIDWORD(v9);
  if (HIDWORD(v9))
  {
    __break(1u);
    goto LABEL_5;
  }
LABEL_7:
  *(_DWORD *)a1 = v5;
  *(_BYTE *)(a1 + 4) = v7;
  return result;
}

uint64_t ArchiveHeader.entryPath.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  AAFieldKey v3;
  unsigned int KeyIndex;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8[3];
  char v9;
  AAFieldKey v10;

  ArchiveHeader.FieldKey.init(_:)((int *)&v10.ikey);
  v3 = v10;
  KeyIndex = AAHeaderGetKeyIndex(*(AAHeader *)(v1 + 16), v3);
  if ((KeyIndex & 0x80000000) == 0)
  {
    ArchiveHeader._field(at:)(KeyIndex, (uint64_t)v8);
    if (v9 == 2)
    {
      FilePath.init(_:)();
      v5 = type metadata accessor for FilePath();
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 0, 1, v5);
    }
    outlined consume of ArchiveHeader.Field(v8[0], v8[1], v8[2], v9);
  }
  v7 = type metadata accessor for FilePath();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, 1, 1, v7);
}

uint64_t base witness table accessor for BidirectionalCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader(&lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader, (uint64_t)&protocol conformance descriptor for ArchiveHeader);
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BD0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207DD488](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
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
    result = MEMORY[0x2207DD494](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader> and conformance <> Slice<A>, &lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader, (uint64_t)&protocol conformance descriptor for ArchiveHeader, MEMORY[0x24BEE4230]);
}

uint64_t base witness table accessor for Collection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader(&lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader, (uint64_t)&protocol conformance descriptor for ArchiveHeader);
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader> and conformance <> Slice<A>, &lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader, (uint64_t)&protocol conformance descriptor for ArchiveHeader, MEMORY[0x24BEE4220]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance <> Slice<A>(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<ArchiveHeader>);
    v10 = lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader(a2, a3);
    result = MEMORY[0x2207DD494](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>, MEMORY[0x24BEE1BA8]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader> and conformance <> Slice<A>, &lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader, (uint64_t)&protocol conformance descriptor for ArchiveHeader, MEMORY[0x24BEE4218]);
}

uint64_t base witness table accessor for Sequence in ArchiveHeader()
{
  return lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader(&lazy protocol witness table cache variable for type ArchiveHeader and conformance ArchiveHeader, (uint64_t)&protocol conformance descriptor for ArchiveHeader);
}

uint64_t lazy protocol witness table accessor for type ArchiveHeader and conformance ArchiveHeader(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ArchiveHeader();
    result = MEMORY[0x2207DD494](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in ArchiveHeader()
{
  return MEMORY[0x24BEE1780];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in ArchiveHeader()
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
    result = MEMORY[0x2207DD494](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<ArchiveHeader>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader>, MEMORY[0x24BEE2C18]);
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader._FieldTypes, &type metadata for ArchiveHeader._FieldTypes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader._FieldTypes, &type metadata for ArchiveHeader._FieldTypes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader._FieldTypes, &type metadata for ArchiveHeader._FieldTypes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader._FieldTypes, &type metadata for ArchiveHeader._FieldTypes);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader._FieldTypes()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldTypes> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldTypes>, (uint64_t (*)(void))lazy protocol witness table accessor for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes, MEMORY[0x24BEE4230]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x2207DD494](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader._FieldTypes()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldTypes> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldTypes>, (uint64_t (*)(void))lazy protocol witness table accessor for type ArchiveHeader._FieldTypes and conformance ArchiveHeader._FieldTypes, MEMORY[0x24BEE4218]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader._FieldTypes()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldTypes> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldTypes>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader._FieldTypes()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader._FieldTypes> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader._FieldTypes>, MEMORY[0x24BEE2C18]);
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader._FieldKeys, &type metadata for ArchiveHeader._FieldKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader._FieldKeys, &type metadata for ArchiveHeader._FieldKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader._FieldKeys, &type metadata for ArchiveHeader._FieldKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys;
  if (!lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader._FieldKeys, &type metadata for ArchiveHeader._FieldKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader._FieldKeys()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldKeys>, (uint64_t (*)(void))lazy protocol witness table accessor for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys, MEMORY[0x24BEE4230]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader._FieldKeys()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldKeys> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldKeys>, (uint64_t (*)(void))lazy protocol witness table accessor for type ArchiveHeader._FieldKeys and conformance ArchiveHeader._FieldKeys, MEMORY[0x24BEE4218]);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader._FieldKeys()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader._FieldKeys> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<ArchiveHeader._FieldKeys>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader._FieldKeys()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader._FieldKeys> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader._FieldKeys>, MEMORY[0x24BEE2C18]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2207DD494](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_220064F84()
{
  return 0;
}

ValueMetadata *type metadata accessor for _AAHeaderTraits()
{
  return &type metadata for _AAHeaderTraits;
}

uint64_t type metadata completion function for ArchiveHeader()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ArchiveHeader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveHeader.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ArchiveHeader.__allocating_init(keySet:directory:path:flags:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArchiveHeader.__allocating_init(copying:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of ArchiveHeader.field(forKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ArchiveHeader.__allocating_init(withAAEncodedData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of ArchiveHeader.withAAEncodedData<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

ValueMetadata *type metadata accessor for ArchiveHeader._FieldTypes()
{
  return &type metadata for ArchiveHeader._FieldTypes;
}

ValueMetadata *type metadata accessor for ArchiveHeader._FieldKeys()
{
  return &type metadata for ArchiveHeader._FieldKeys;
}

void type metadata accessor for AAFieldKey(uint64_t a1)
{
  type metadata accessor for AAFieldKey(a1, &lazy cache variable for type metadata for AAFieldKey);
}

uint64_t initializeBufferWithCopyOfBuffer for AAEntryAttributes(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AAEntryAttributes(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 72))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AAEntryAttributes(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
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
  *(_BYTE *)(result + 72) = v3;
  return result;
}

void type metadata accessor for AAEntryAttributes(uint64_t a1)
{
  type metadata accessor for AAFieldKey(a1, &lazy cache variable for type metadata for AAEntryAttributes);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for timespec(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for timespec(uint64_t result, int a2, int a3)
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

void type metadata accessor for timespec(uint64_t a1)
{
  type metadata accessor for AAFieldKey(a1, &lazy cache variable for type metadata for timespec);
}

uint64_t specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(uint64_t result, uint64_t a2, unint64_t a3, AAHashFunction *a4)
{
  uint64_t v4;
  uint8_t *v8;
  uint64_t v9;
  uint8_t *v10[2];
  uint64_t v11;

  if (result < 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v8 = (uint8_t *)result;
  if (result)
  {
    v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v9 + 16) = v8;
  }
  else
  {
    v9 = MEMORY[0x24BEE4AF8];
  }
  v10[1] = v8;
  v11 = 0;
  v10[0] = (uint8_t *)(v9 + 32);
  result = closure #1 in ArchiveHeader._field(at:)(v10, &v11, a2, a3, a4);
  if (v4)
  {
    if (v11 <= (uint64_t)v8)
    {
      *(_QWORD *)(v9 + 16) = v11;
      swift_bridgeObjectRelease();
      return v9;
    }
    goto LABEL_12;
  }
  if (v11 <= (uint64_t)v8)
  {
    *(_QWORD *)(v9 + 16) = v11;
    return v9;
  }
LABEL_13:
  __break(1u);
  return result;
}

AAHeader partial apply for closure #1 in closure #1 in ArchiveHeader.init(keySet:directory:path:flags:)@<X0>(char *path@<X0>, AAHeader *a2@<X8>)
{
  uint64_t v2;
  AAHeader result;

  result = AAHeaderCreateWithPath(*(AAFieldKeySet *)(*(_QWORD *)(v2 + 16) + 16), *(const char **)(v2 + 24), path, *(_QWORD *)(v2 + 32));
  *a2 = result;
  return result;
}

void type metadata accessor for AAEntryAttributes.__Unnamed_union___Anonymous_field0(uint64_t a1)
{
  type metadata accessor for AAFieldKey(a1, &lazy cache variable for type metadata for AAEntryAttributes.__Unnamed_union___Anonymous_field0);
}

void type metadata accessor for AAFieldKey(uint64_t a1, unint64_t *a2)
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

BOOL static ArchiveError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void ArchiveError.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int ArchiveError.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ArchiveError()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ArchiveError()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ArchiveError()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError;
  if (!lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveError, &type metadata for ArchiveError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError;
  if (!lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveError, &type metadata for ArchiveError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveError and conformance ArchiveError);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ArchiveError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ArchiveError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2200655A4 + 4 * byte_2200780C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2200655D8 + 4 * byte_2200780C0[v4]))();
}

uint64_t sub_2200655D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2200655E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2200655E8);
  return result;
}

uint64_t sub_2200655F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2200655FCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_220065600(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_220065608(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ArchiveError(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ArchiveError(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ArchiveError()
{
  return &type metadata for ArchiveError;
}

void static ArchiveHeader.EntryMessage.searchPruneDirectory.getter(_DWORD *a1@<X8>)
{
  *a1 = 10;
}

void static ArchiveHeader.EntryMessage.searchExclude.getter(_DWORD *a1@<X8>)
{
  *a1 = 11;
}

void static ArchiveHeader.EntryMessage.searchFail.getter(_DWORD *a1@<X8>)
{
  *a1 = 12;
}

void static ArchiveHeader.EntryMessage.extractBegin.getter(_DWORD *a1@<X8>)
{
  *a1 = 20;
}

void static ArchiveHeader.EntryMessage.extractEnd.getter(_DWORD *a1@<X8>)
{
  *a1 = 21;
}

void static ArchiveHeader.EntryMessage.extractFail.getter(_DWORD *a1@<X8>)
{
  *a1 = 22;
}

void static ArchiveHeader.EntryMessage.extractAttributes.getter(_DWORD *a1@<X8>)
{
  *a1 = 23;
}

void static ArchiveHeader.EntryMessage.extractXAT.getter(_DWORD *a1@<X8>)
{
  *a1 = 24;
}

void static ArchiveHeader.EntryMessage.extractACL.getter(_DWORD *a1@<X8>)
{
  *a1 = 25;
}

void static ArchiveHeader.EntryMessage.convertExclude.getter(_DWORD *a1@<X8>)
{
  *a1 = 40;
}

void static ArchiveHeader.EntryMessage.encodeScanning.getter(_DWORD *a1@<X8>)
{
  *a1 = 30;
}

void static ArchiveHeader.EntryMessage.encodeWriting.getter(_DWORD *a1@<X8>)
{
  *a1 = 31;
}

void static ArchiveHeader.EntryMessage.decodeReading.getter(_DWORD *a1@<X8>)
{
  *a1 = 60;
}

void static ArchiveHeader.EntryMessage.processExclude.getter(_DWORD *a1@<X8>)
{
  *a1 = 50;
}

uint64_t ArchiveHeader.EntryMessage.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveHeader.EntryMessage.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveHeader.EntryMessage.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveHeader.EntryMessage.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

unint64_t ArchiveHeader.EntryMessage.description.getter()
{
  _DWORD *v0;
  unint64_t result;

  result = 0xD000000000000014;
  switch(*v0)
  {
    case 0xA:
      return result;
    case 0xB:
      result = 0x7845686372616573;
      break;
    case 0xC:
      result = 0x6146686372616573;
      break;
    case 0x14:
      result = 0x4274636172747865;
      break;
    case 0x15:
      result = 0x4574636172747865;
      break;
    case 0x16:
      result = 0x4674636172747865;
      break;
    case 0x17:
      result = 0xD000000000000011;
      break;
    case 0x18:
      result = 0x5874636172747865;
      break;
    case 0x19:
      result = 0x4174636172747865;
      break;
    case 0x1E:
      result = 0x635365646F636E65;
      break;
    case 0x1F:
      result = 0x725765646F636E65;
      break;
    case 0x28:
      result = 0x45747265766E6F63;
      break;
    case 0x3C:
      result = 0x655265646F636564;
      break;
    default:
      result = 4144959;
      break;
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveHeader.EntryMessage(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryMessage and conformance ArchiveHeader.EntryMessage()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader.EntryMessage and conformance ArchiveHeader.EntryMessage;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.EntryMessage and conformance ArchiveHeader.EntryMessage)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader.EntryMessage, &type metadata for ArchiveHeader.EntryMessage);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.EntryMessage and conformance ArchiveHeader.EntryMessage);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ArchiveHeader.EntryMessage()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ArchiveHeader.EntryMessage()
{
  Swift::UInt32 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ArchiveHeader.EntryMessage()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance ArchiveHeader.EntryMessage@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ArchiveHeader.EntryMessage(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

ValueMetadata *type metadata accessor for ArchiveHeader.EntryMessage()
{
  return &type metadata for ArchiveHeader.EntryMessage;
}

void ArchiveHeader.Field.type.getter(_DWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(unsigned __int8 *)(v1 + 24);
}

void ArchiveHeader.Field.key.getter(_DWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t initializeWithCopy for ArchiveHeader.Field(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  outlined copy of ArchiveHeader.Field(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ArchiveHeader.Field(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  outlined copy of ArchiveHeader.Field(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  outlined consume of ArchiveHeader.Field(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ArchiveHeader.Field(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  outlined consume of ArchiveHeader.Field(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArchiveHeader.Field(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ArchiveHeader.Field(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for ArchiveHeader.Field(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t destructiveInjectEnumTag for ArchiveHeader.Field(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.Field()
{
  return &type metadata for ArchiveHeader.Field;
}

uint64_t dispatch thunk of ArchiveStreamProtocol.writeHeader(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.writeBlob(key:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.readHeader()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.readBlob(key:into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ArchiveStreamProtocol.close()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

unint64_t ArchiveHeader.EntryAttributes.uid.getter()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_getter(*(_BYTE *)v1);
  if (v2)
    v3 = *(unsigned int *)(v1 + 4);
  else
    v3 = 0;
  return v3 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_getter(char a1)
{
  return a1 & 1;
}

uint64_t ArchiveHeader.EntryAttributes.uid.setter(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _DWORD *v3;
  uint64_t result;
  _DWORD *v5;
  _BYTE v6[4];
  _BYTE v7[4];

  if ((a1 & 0x100000000) != 0)
  {
    v5 = *(_DWORD **)(v1 + 16);
    v7[0] = *v5;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter(0, v7);
    *(_BYTE *)v5 = v7[0];
  }
  else
  {
    v2 = a1;
    v3 = *(_DWORD **)(v1 + 16);
    v6[0] = *v3;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter(1, v6);
    *(_BYTE *)v3 = v6[0];
    *(_DWORD *)(*(_QWORD *)(v1 + 16) + 4) = v2;
  }
  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter(uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xFE | result & 1;
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.uid.modify(uint64_t a1))(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  int v5;

  *(_QWORD *)a1 = v1;
  v3 = *(_QWORD *)(v1 + 16);
  v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_getter(*(_BYTE *)v3);
  if (v4)
    v5 = *(_DWORD *)(v3 + 4);
  else
    v5 = 0;
  *(_DWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 12) = v4 == 0;
  return ArchiveHeader.EntryAttributes.uid.modify;
}

uint64_t ArchiveHeader.EntryAttributes.uid.modify(uint64_t *a1)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t result;
  int v4;
  _DWORD *v5;
  _BYTE v6[4];

  v1 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
  {
    v2 = *(_DWORD **)(v1 + 16);
    v6[0] = *v2;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter(0, v6);
    *(_BYTE *)v2 = v6[0];
  }
  else
  {
    v4 = *((_DWORD *)a1 + 2);
    v5 = *(_DWORD **)(v1 + 16);
    v6[0] = *v5;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_setter(1, v6);
    *(_BYTE *)v5 = v6[0];
    *(_DWORD *)(*(_QWORD *)(v1 + 16) + 4) = v4;
  }
  return result;
}

unint64_t ArchiveHeader.EntryAttributes.gid.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;

  v1 = *(unsigned __int8 **)(v0 + 16);
  v2 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_getter(*v1);
  if (v2)
    v3 = *((unsigned int *)v1 + 2);
  else
    v3 = 0;
  return v3 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_getter(unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.gid.setter(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _DWORD *v3;
  uint64_t result;
  _DWORD *v5;
  _BYTE v6[4];
  _BYTE v7[4];

  if ((a1 & 0x100000000) != 0)
  {
    v5 = *(_DWORD **)(v1 + 16);
    v7[0] = *v5;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter(0, v7);
    *(_BYTE *)v5 = v7[0];
  }
  else
  {
    v2 = a1;
    v3 = *(_DWORD **)(v1 + 16);
    v6[0] = *v3;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter(1, v6);
    *(_BYTE *)v3 = v6[0];
    *(_DWORD *)(*(_QWORD *)(v1 + 16) + 8) = v2;
  }
  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter(uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xFD | (2 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.gid.modify(uint64_t a1))(uint64_t *a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  int v4;
  int v5;

  *(_QWORD *)a1 = v1;
  v3 = *(unsigned __int8 **)(v1 + 16);
  v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_getter(*v3);
  if (v4)
    v5 = *((_DWORD *)v3 + 2);
  else
    v5 = 0;
  *(_DWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 12) = v4 == 0;
  return ArchiveHeader.EntryAttributes.gid.modify;
}

uint64_t ArchiveHeader.EntryAttributes.gid.modify(uint64_t *a1)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t result;
  int v4;
  _DWORD *v5;
  _BYTE v6[4];

  v1 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
  {
    v2 = *(_DWORD **)(v1 + 16);
    v6[0] = *v2;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter(0, v6);
    *(_BYTE *)v2 = v6[0];
  }
  else
  {
    v4 = *((_DWORD *)a1 + 2);
    v5 = *(_DWORD **)(v1 + 16);
    v6[0] = *v5;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_setter(1, v6);
    *(_BYTE *)v5 = v6[0];
    *(_DWORD *)(*(_QWORD *)(v1 + 16) + 8) = v4;
  }
  return result;
}

unint64_t ArchiveHeader.EntryAttributes.flg.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;

  v1 = *(unsigned __int8 **)(v0 + 16);
  v2 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_getter(*v1);
  if (v2)
    v3 = *((unsigned int *)v1 + 3);
  else
    v3 = 0;
  return v3 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_getter(unsigned int a1)
{
  return (a1 >> 2) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.flg.setter(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _DWORD *v3;
  uint64_t result;
  _DWORD *v5;
  _BYTE v6[4];
  _BYTE v7[4];

  if ((a1 & 0x100000000) != 0)
  {
    v5 = *(_DWORD **)(v1 + 16);
    v7[0] = *v5;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter(0, v7);
    *(_BYTE *)v5 = v7[0];
  }
  else
  {
    v2 = a1;
    v3 = *(_DWORD **)(v1 + 16);
    v6[0] = *v3;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter(1, v6);
    *(_BYTE *)v3 = v6[0];
    *(_DWORD *)(*(_QWORD *)(v1 + 16) + 12) = v2;
  }
  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter(uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xFB | (4 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.flg.modify(uint64_t a1))(uint64_t *a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  int v4;
  int v5;

  *(_QWORD *)a1 = v1;
  v3 = *(unsigned __int8 **)(v1 + 16);
  v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_getter(*v3);
  if (v4)
    v5 = *((_DWORD *)v3 + 3);
  else
    v5 = 0;
  *(_DWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 12) = v4 == 0;
  return ArchiveHeader.EntryAttributes.flg.modify;
}

uint64_t ArchiveHeader.EntryAttributes.flg.modify(uint64_t *a1)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t result;
  int v4;
  _DWORD *v5;
  _BYTE v6[4];

  v1 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
  {
    v2 = *(_DWORD **)(v1 + 16);
    v6[0] = *v2;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter(0, v6);
    *(_BYTE *)v2 = v6[0];
  }
  else
  {
    v4 = *((_DWORD *)a1 + 2);
    v5 = *(_DWORD **)(v1 + 16);
    v6[0] = *v5;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_setter(1, v6);
    *(_BYTE *)v5 = v6[0];
    *(_DWORD *)(*(_QWORD *)(v1 + 16) + 12) = v4;
  }
  return result;
}

unint64_t ArchiveHeader.EntryAttributes.mod.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;
  int v2;
  uint64_t v3;

  v1 = *(unsigned __int8 **)(v0 + 16);
  v2 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_getter(*v1);
  if (v2)
    v3 = *((unsigned int *)v1 + 4);
  else
    v3 = 0;
  return v3 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_getter(unsigned int a1)
{
  return (a1 >> 3) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.mod.setter(uint64_t a1)
{
  uint64_t v1;
  int v2;
  _DWORD *v3;
  uint64_t result;
  _DWORD *v5;
  _BYTE v6[4];
  _BYTE v7[4];

  if ((a1 & 0x100000000) != 0)
  {
    v5 = *(_DWORD **)(v1 + 16);
    v7[0] = *v5;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter(0, v7);
    *(_BYTE *)v5 = v7[0];
  }
  else
  {
    v2 = a1;
    v3 = *(_DWORD **)(v1 + 16);
    v6[0] = *v3;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter(1, v6);
    *(_BYTE *)v3 = v6[0];
    *(_DWORD *)(*(_QWORD *)(v1 + 16) + 16) = v2;
  }
  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter(uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xF7 | (8 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.mod.modify(uint64_t a1))(uint64_t *a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  int v4;
  int v5;

  *(_QWORD *)a1 = v1;
  v3 = *(unsigned __int8 **)(v1 + 16);
  v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_getter(*v3);
  if (v4)
    v5 = *((_DWORD *)v3 + 4);
  else
    v5 = 0;
  *(_DWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 12) = v4 == 0;
  return ArchiveHeader.EntryAttributes.mod.modify;
}

uint64_t ArchiveHeader.EntryAttributes.mod.modify(uint64_t *a1)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t result;
  int v4;
  _DWORD *v5;
  _BYTE v6[4];

  v1 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
  {
    v2 = *(_DWORD **)(v1 + 16);
    v6[0] = *v2;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter(0, v6);
    *(_BYTE *)v2 = v6[0];
  }
  else
  {
    v4 = *((_DWORD *)a1 + 2);
    v5 = *(_DWORD **)(v1 + 16);
    v6[0] = *v5;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_setter(1, v6);
    *(_BYTE *)v5 = v6[0];
    *(_DWORD *)(*(_QWORD *)(v1 + 16) + 16) = v4;
  }
  return result;
}

uint64_t ArchiveHeader.EntryAttributes.mtm.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = *(unsigned __int8 **)(v0 + 16);
  if (_So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_getter(*v1))
    return *((_QWORD *)v1 + 7);
  else
    return 0;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_getter(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.mtm.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t result;
  uint64_t v8;
  _BYTE v9[4];
  _BYTE v10[4];

  v4 = *(_DWORD **)(v3 + 16);
  if ((a3 & 1) != 0)
  {
    v10[0] = *v4;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter(0, v10);
    *(_BYTE *)v4 = v10[0];
  }
  else
  {
    v9[0] = *v4;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter(1, v9);
    *(_BYTE *)v4 = v9[0];
    v8 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)(v8 + 56) = a1;
    *(_QWORD *)(v8 + 64) = a2;
  }
  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter(uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xBF | ((result & 1) << 6);
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.mtm.modify(uint64_t a1))(uint64_t *a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  int v4;
  __int128 v5;

  *(_QWORD *)(a1 + 24) = v1;
  v3 = *(unsigned __int8 **)(v1 + 16);
  v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_getter(*v3);
  if (v4)
    v5 = *(_OWORD *)(v3 + 56);
  else
    v5 = 0uLL;
  *(_OWORD *)a1 = v5;
  *(_BYTE *)(a1 + 16) = v4 == 0;
  return ArchiveHeader.EntryAttributes.mtm.modify;
}

uint64_t ArchiveHeader.EntryAttributes.mtm.modify(uint64_t *a1)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  _BYTE v8[4];

  v1 = a1[3];
  if ((a1[2] & 1) != 0)
  {
    v2 = *(_DWORD **)(v1 + 16);
    v8[0] = *v2;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter(0, v8);
    *(_BYTE *)v2 = v8[0];
  }
  else
  {
    v5 = *a1;
    v4 = a1[1];
    v6 = *(_DWORD **)(v1 + 16);
    v8[0] = *v6;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_setter(1, v8);
    *(_BYTE *)v6 = v8[0];
    v7 = *(_QWORD *)(v1 + 16);
    *(_QWORD *)(v7 + 56) = v5;
    *(_QWORD *)(v7 + 64) = v4;
  }
  return result;
}

uint64_t ArchiveHeader.EntryAttributes.ctm.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = *(unsigned __int8 **)(v0 + 16);
  if (_So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_getter(*v1))
    return *((_QWORD *)v1 + 5);
  else
    return 0;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_getter(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.ctm.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t result;
  uint64_t v8;
  _BYTE v9[4];
  _BYTE v10[4];

  v4 = *(_DWORD **)(v3 + 16);
  if ((a3 & 1) != 0)
  {
    v10[0] = *v4;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter(0, v10);
    *(_BYTE *)v4 = v10[0];
  }
  else
  {
    v9[0] = *v4;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter(1, v9);
    *(_BYTE *)v4 = v9[0];
    v8 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)(v8 + 40) = a1;
    *(_QWORD *)(v8 + 48) = a2;
  }
  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter(uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xDF | (32 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.ctm.modify(uint64_t a1))(uint64_t *a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  int v4;
  __int128 v5;

  *(_QWORD *)(a1 + 24) = v1;
  v3 = *(unsigned __int8 **)(v1 + 16);
  v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_getter(*v3);
  if (v4)
    v5 = *(_OWORD *)(v3 + 40);
  else
    v5 = 0uLL;
  *(_OWORD *)a1 = v5;
  *(_BYTE *)(a1 + 16) = v4 == 0;
  return ArchiveHeader.EntryAttributes.ctm.modify;
}

uint64_t ArchiveHeader.EntryAttributes.ctm.modify(uint64_t *a1)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  _BYTE v8[4];

  v1 = a1[3];
  if ((a1[2] & 1) != 0)
  {
    v2 = *(_DWORD **)(v1 + 16);
    v8[0] = *v2;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter(0, v8);
    *(_BYTE *)v2 = v8[0];
  }
  else
  {
    v5 = *a1;
    v4 = a1[1];
    v6 = *(_DWORD **)(v1 + 16);
    v8[0] = *v6;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_setter(1, v8);
    *(_BYTE *)v6 = v8[0];
    v7 = *(_QWORD *)(v1 + 16);
    *(_QWORD *)(v7 + 40) = v5;
    *(_QWORD *)(v7 + 48) = v4;
  }
  return result;
}

uint64_t ArchiveHeader.EntryAttributes.btm.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = *(unsigned __int8 **)(v0 + 16);
  if (_So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_getter(*v1))
    return *((_QWORD *)v1 + 3);
  else
    return 0;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_getter(unsigned int a1)
{
  return (a1 >> 4) & 1;
}

uint64_t ArchiveHeader.EntryAttributes.btm.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t result;
  uint64_t v8;
  _BYTE v9[4];
  _BYTE v10[4];

  v4 = *(_DWORD **)(v3 + 16);
  if ((a3 & 1) != 0)
  {
    v10[0] = *v4;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter(0, v10);
    *(_BYTE *)v4 = v10[0];
  }
  else
  {
    v9[0] = *v4;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter(1, v9);
    *(_BYTE *)v4 = v9[0];
    v8 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)(v8 + 24) = a1;
    *(_QWORD *)(v8 + 32) = a2;
  }
  return result;
}

uint64_t _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter(uint64_t result, _BYTE *a2)
{
  *a2 = *a2 & 0xEF | (16 * (result & 1));
  return result;
}

uint64_t (*ArchiveHeader.EntryAttributes.btm.modify(uint64_t a1))(uint64_t *a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  int v4;
  __int128 v5;

  *(_QWORD *)(a1 + 24) = v1;
  v3 = *(unsigned __int8 **)(v1 + 16);
  v4 = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_getter(*v3);
  if (v4)
    v5 = *(_OWORD *)(v3 + 24);
  else
    v5 = 0uLL;
  *(_OWORD *)a1 = v5;
  *(_BYTE *)(a1 + 16) = v4 == 0;
  return ArchiveHeader.EntryAttributes.btm.modify;
}

uint64_t ArchiveHeader.EntryAttributes.btm.modify(uint64_t *a1)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  _BYTE v8[4];

  v1 = a1[3];
  if ((a1[2] & 1) != 0)
  {
    v2 = *(_DWORD **)(v1 + 16);
    v8[0] = *v2;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter(0, v8);
    *(_BYTE *)v2 = v8[0];
  }
  else
  {
    v5 = *a1;
    v4 = a1[1];
    v6 = *(_DWORD **)(v1 + 16);
    v8[0] = *v6;
    result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_setter(1, v8);
    *(_BYTE *)v6 = v8[0];
    v7 = *(_QWORD *)(v1 + 16);
    *(_QWORD *)(v7 + 24) = v5;
    *(_QWORD *)(v7 + 32) = v4;
  }
  return result;
}

uint64_t ArchiveHeader.EntryAttributes.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ArchiveHeader.EntryAttributes.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_220066930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  int v5;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_UID_getter(*(_BYTE *)v3);
  if ((_DWORD)result)
    v5 = *(_DWORD *)(v3 + 4);
  else
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_22006697C(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(unint64_t))ArchiveHeader.EntryAttributes.uid.setter);
}

uint64_t sub_220066988@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v3;
  uint64_t result;
  int v5;

  v3 = *(unsigned __int8 **)(*(_QWORD *)a1 + 16);
  result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_GID_getter(*v3);
  if ((_DWORD)result)
    v5 = *((_DWORD *)v3 + 2);
  else
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_2200669D4(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(unint64_t))ArchiveHeader.EntryAttributes.gid.setter);
}

uint64_t sub_2200669E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v3;
  uint64_t result;
  int v5;

  v3 = *(unsigned __int8 **)(*(_QWORD *)a1 + 16);
  result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_FLG_getter(*v3);
  if ((_DWORD)result)
    v5 = *((_DWORD *)v3 + 3);
  else
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_220066A2C(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(unint64_t))ArchiveHeader.EntryAttributes.flg.setter);
}

uint64_t sub_220066A38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v3;
  uint64_t result;
  int v5;

  v3 = *(unsigned __int8 **)(*(_QWORD *)a1 + 16);
  result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MOD_getter(*v3);
  if ((_DWORD)result)
    v5 = *((_DWORD *)v3 + 4);
  else
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_220066A84(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(unint64_t))ArchiveHeader.EntryAttributes.mod.setter);
}

uint64_t keypath_setTm(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(unint64_t))
{
  return a5(*a1 | ((unint64_t)*((unsigned __int8 *)a1 + 4) << 32));
}

uint64_t sub_220066ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v3;
  uint64_t result;
  __int128 v5;

  v3 = *(unsigned __int8 **)(*(_QWORD *)a1 + 16);
  result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_MTM_getter(*v3);
  if ((_DWORD)result)
    v5 = *(_OWORD *)(v3 + 56);
  else
    v5 = 0uLL;
  *(_OWORD *)a2 = v5;
  *(_BYTE *)(a2 + 16) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_220066B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD))ArchiveHeader.EntryAttributes.mtm.setter);
}

uint64_t sub_220066B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v3;
  uint64_t result;
  __int128 v5;

  v3 = *(unsigned __int8 **)(*(_QWORD *)a1 + 16);
  result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_CTM_getter(*v3);
  if ((_DWORD)result)
    v5 = *(_OWORD *)(v3 + 40);
  else
    v5 = 0uLL;
  *(_OWORD *)a2 = v5;
  *(_BYTE *)(a2 + 16) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_220066B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD))ArchiveHeader.EntryAttributes.ctm.setter);
}

uint64_t sub_220066B7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v3;
  uint64_t result;
  __int128 v5;

  v3 = *(unsigned __int8 **)(*(_QWORD *)a1 + 16);
  result = _So17AAEntryAttributesa34__Unnamed_union___Anonymous_field0V02__c10_struct___E7_field1V_BTM_getter(*v3);
  if ((_DWORD)result)
    v5 = *(_OWORD *)(v3 + 24);
  else
    v5 = 0uLL;
  *(_OWORD *)a2 = v5;
  *(_BYTE *)(a2 + 16) = (_DWORD)result == 0;
  return result;
}

uint64_t sub_220066BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_8Tm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD))ArchiveHeader.EntryAttributes.btm.setter);
}

uint64_t keypath_set_8Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD, _QWORD))
{
  return a5(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

uint64_t type metadata accessor for ArchiveHeader.EntryAttributes()
{
  return objc_opt_self();
}

uint64_t method lookup function for ArchiveHeader.EntryAttributes()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.uid.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.uid.setter(unint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)v1 + 96))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.uid.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.gid.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.gid.setter(unint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)v1 + 120))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.gid.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.flg.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.flg.setter(unint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)v1 + 144))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.flg.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mod.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mod.setter(unint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)v1 + 168))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mod.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mtm.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mtm.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v3 + 192))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.mtm.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.ctm.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.ctm.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v3 + 216))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.ctm.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.btm.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.btm.setter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v3 + 240))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of ArchiveHeader.EntryAttributes.btm.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

unint64_t ArchiveHeader.EntryFilterData.init(message:data:)@<X0>(int *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  int v4;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    v4 = *a1;
    result = 0xF000000000000007;
    switch(v4)
    {
      case 20:
      case 40:
      case 50:
        type metadata accessor for ArchiveHeader();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = a2;
        *(_BYTE *)(result + 24) = 0;
        break;
      case 23:
        type metadata accessor for ArchiveHeader.EntryAttributes();
        v7 = swift_allocObject();
        *(_QWORD *)(v7 + 16) = a2;
        result = v7 | 0x4000000000000000;
        break;
      case 24:
        type metadata accessor for ArchiveHeader.EntryXATBlob();
        v8 = swift_allocObject();
        *(_QWORD *)(v8 + 16) = a2;
        *(_BYTE *)(v8 + 24) = 0;
        result = v8 | 0x8000000000000000;
        break;
      default:
        break;
    }
  }
  else
  {
    result = 0xF000000000000007;
  }
  *a3 = result;
  return result;
}

unint64_t closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:)(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  uint64_t v10;
  char *v11;
  void (*v12)(unsigned int *__return_ptr, unsigned int *, char *, uint64_t *);
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;

  v7 = type metadata accessor for FilePath();
  v8 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_retain();
    FilePath.init(platformString:)();
    v15 = a2;
    result = ArchiveHeader.EntryFilterData.init(message:data:)((int *)&v15, a4, (unint64_t *)&v16);
    v12 = *(void (**)(unsigned int *__return_ptr, unsigned int *, char *, uint64_t *))(a1 + 16);
    if (v12)
    {
      v13 = v16;
      v14 = a2;
      v12(&v15, &v14, v11, &v16);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      swift_release();
      outlined consume of ArchiveHeader.EntryFilterData?(v13);
      return v15;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t ArchiveHeader._EntryFilterWrapper.deinit()
{
  uint64_t v0;

  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(*(_QWORD *)(v0 + 16));
  return v0;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t ArchiveHeader._EntryFilterWrapper.__deallocating_deinit()
{
  uint64_t v0;

  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance();
}

_QWORD *initializeBufferWithCopyOfBuffer for ArchiveHeader.EntryFilterData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for ArchiveHeader.EntryFilterData()
{
  return swift_release();
}

_QWORD *assignWithCopy for ArchiveHeader.EntryFilterData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for ArchiveHeader.EntryFilterData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArchiveHeader.EntryFilterData(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 126);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ArchiveHeader.EntryFilterData(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t getEnumTag for ArchiveHeader.EntryFilterData(_QWORD *a1)
{
  return *a1 >> 62;
}

_QWORD *destructiveProjectEnumData for ArchiveHeader.EntryFilterData(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *destructiveInjectEnumTag for ArchiveHeader.EntryFilterData(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.EntryFilterData()
{
  return &type metadata for ArchiveHeader.EntryFilterData;
}

uint64_t type metadata accessor for ArchiveHeader._EntryFilterWrapper()
{
  return objc_opt_self();
}

uint64_t method lookup function for ArchiveHeader._EntryFilterWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t outlined consume of ArchiveHeader.EntryFilterData?(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return swift_release();
  return result;
}

uint64_t ArchiveHash.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ArchiveHash.size.getter()
{
  _DWORD *v0;
  int v1;

  v1 = *v0 - 1;
  if (v1 > 4)
    return 0;
  else
    return qword_2200784A0[v1];
}

void static ArchiveHash.crc32.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveHash.sha1.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ArchiveHash.sha256.getter(_DWORD *a1@<X8>)
{
  *a1 = 3;
}

void static ArchiveHash.sha384.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ArchiveHash.sha512.getter(_DWORD *a1@<X8>)
{
  *a1 = 5;
}

uint64_t ArchiveHash.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveHash.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveHash.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t static ArchiveHash.maxSize.getter()
{
  return 64;
}

uint64_t ArchiveHash.description.getter()
{
  _DWORD *v0;
  uint64_t result;

  result = 0x3233637263;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      result = 828467315;
      break;
    case 3:
      result = 0x363532616873;
      break;
    case 4:
      result = 0x343833616873;
      break;
    case 5:
      result = 0x323135616873;
      break;
    default:
      result = 4144959;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHash and conformance ArchiveHash()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHash and conformance ArchiveHash;
  if (!lazy protocol witness table cache variable for type ArchiveHash and conformance ArchiveHash)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHash, &type metadata for ArchiveHash);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHash and conformance ArchiveHash);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArchiveHash()
{
  return &type metadata for ArchiveHash;
}

uint64_t ArchiveEncryptionContext.EncryptionMode.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveEncryptionContext.EncryptionMode.none.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveEncryptionContext.EncryptionMode.symmetric.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveEncryptionContext.EncryptionMode.ecdhe_p256.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ArchiveEncryptionContext.EncryptionMode.scrypt.getter(_DWORD *a1@<X8>)
{
  *a1 = 3;
}

uint64_t ArchiveEncryptionContext.EncryptionMode.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveEncryptionContext.EncryptionMode.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveEncryptionContext.EncryptionMode.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveEncryptionContext.EncryptionMode.description.getter()
{
  _DWORD *v0;
  uint64_t result;

  result = 1701736302;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      result = 0x697274656D6D7973;
      break;
    case 2:
      result = 0x32705F6568646365;
      break;
    case 3:
      result = 0x747079726373;
      break;
    default:
      result = 4144959;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveEncryptionContext.EncryptionMode and conformance ArchiveEncryptionContext.EncryptionMode()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveEncryptionContext.EncryptionMode and conformance ArchiveEncryptionContext.EncryptionMode;
  if (!lazy protocol witness table cache variable for type ArchiveEncryptionContext.EncryptionMode and conformance ArchiveEncryptionContext.EncryptionMode)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveEncryptionContext.EncryptionMode, &type metadata for ArchiveEncryptionContext.EncryptionMode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveEncryptionContext.EncryptionMode and conformance ArchiveEncryptionContext.EncryptionMode);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArchiveEncryptionContext.EncryptionMode()
{
  return &type metadata for ArchiveEncryptionContext.EncryptionMode;
}

uint64_t ArchiveHeader.EntryMessageStatus.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveHeader.EntryMessageStatus.ok.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveHeader.EntryMessageStatus.skip.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveHeader.EntryMessageStatus.cancel.getter(_DWORD *a1@<X8>)
{
  *a1 = -1;
}

uint64_t ArchiveHeader.EntryMessageStatus.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveHeader.EntryMessageStatus.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveHeader.EntryMessageStatus.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveHeader.EntryMessageStatus.description.getter()
{
  int *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = 27503;
  v3 = 4144959;
  if (*v0 == 1)
    v3 = 1885956979;
  if (v1)
    v2 = v3;
  if (v1 == -1)
    return 0x6C65636E6163;
  else
    return v2;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryMessageStatus and conformance ArchiveHeader.EntryMessageStatus()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader.EntryMessageStatus and conformance ArchiveHeader.EntryMessageStatus;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.EntryMessageStatus and conformance ArchiveHeader.EntryMessageStatus)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader.EntryMessageStatus, &type metadata for ArchiveHeader.EntryMessageStatus);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.EntryMessageStatus and conformance ArchiveHeader.EntryMessageStatus);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveHeader.EntryMessageStatus()
{
  int *v0;
  int v1;
  uint64_t v2;

  v1 = *v0;
  v2 = 27503;
  if (*v0)
    v2 = 4144959;
  if (v1 == 1)
    v2 = 1885956979;
  if (v1 == -1)
    return 0x6C65636E6163;
  else
    return v2;
}

ValueMetadata *type metadata accessor for ArchiveHeader.EntryMessageStatus()
{
  return &type metadata for ArchiveHeader.EntryMessageStatus;
}

uint64_t static ArchiveStream._withStream<A>(stream:_:)@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  _BYTE *v9;
  _BYTE *v10;

  if (a1)
  {
    result = a2();
    if (!v4)
    {
      swift_beginAccess();
      result = *(_QWORD *)(a1 + 16);
      if (result)
      {
        result = AAArchiveStreamClose((AAArchiveStream)result);
        *(_QWORD *)(a1 + 16) = 0;
        if ((_DWORD)result)
        {
          lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
          swift_allocError();
          *v9 = 0;
          swift_willThrow();
          return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a4, a3);
        }
      }
    }
  }
  else
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v10 = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t static ArchiveStream.withEncodeStream<A>(writingTo:selectUsing:flags:threadCount:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t (*a5)(void)@<X5>, uint64_t a6@<X7>, uint64_t a7@<X8>)
{
  return static ArchiveStream.withEncodeStream<A>(writingTo:selectUsing:flags:threadCount:_:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:));
}

uint64_t static ArchiveStream.withDecodeStream<A>(readingFrom:selectUsing:flags:threadCount:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t (*a5)(void)@<X5>, uint64_t a6@<X7>, uint64_t a7@<X8>)
{
  return static ArchiveStream.withEncodeStream<A>(writingTo:selectUsing:flags:threadCount:_:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))specialized static ArchiveStream.decodeStream(readingFrom:selectUsing:flags:threadCount:));
}

uint64_t static ArchiveStream.withEncodeStream<A>(writingTo:selectUsing:flags:threadCount:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t (*a5)(void)@<X5>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t *))
{
  uint64_t v11;
  uint64_t v13;

  v13 = *a4;
  v11 = a8(a1, a2, a3, &v13);
  static ArchiveStream._withStream<A>(stream:_:)(v11, a5, a6, a7);
  return swift_release();
}

uint64_t static ArchiveStream.withExtractStream<A>(extractingTo:selectUsing:flags:threadCount:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void)@<X5>, uint64_t a5@<X7>, uint64_t a6@<X8>)
{
  uint64_t v9;

  v9 = specialized static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)(a1, a2, a3);
  static ArchiveStream._withStream<A>(stream:_:)(v9, a4, a5, a6);
  return swift_release();
}

uint64_t static ArchiveStream.withConvertStream<A>(writingTo:insertKeySet:removeKeySet:selectUsing:flags:threadCount:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, AAFlagSet *a6@<X5>, uint64_t a7@<X6>, uint64_t (*a8)(void)@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v13;
  AAFlagSet v15;

  v15 = *a6;
  v13 = specialized static ArchiveStream.convertStream(writingTo:insertKeySet:removeKeySet:selectUsing:flags:threadCount:)(a1, a2, a3, a4, a5, &v15, a7);
  static ArchiveStream._withStream<A>(stream:_:)(v13, a8, a11, a9);
  return swift_release();
}

uint64_t static ArchiveStream.withStream<A, B>(wrapping:_:)@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v9;

  v9 = static ArchiveStream.customStream<A>(instance:)(a1, a3, a5);
  static ArchiveStream._withStream<A>(stream:_:)(v9, a2, a4, a6);
  return swift_release();
}

uint64_t ArchiveCompression.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveCompression.none.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveCompression.lz4.getter(_DWORD *a1@<X8>)
{
  *a1 = 256;
}

void static ArchiveCompression.zlib.getter(_DWORD *a1@<X8>)
{
  *a1 = 1285;
}

void static ArchiveCompression.lzma.getter(_DWORD *a1@<X8>)
{
  *a1 = 774;
}

void static ArchiveCompression.lzfse.getter(_DWORD *a1@<X8>)
{
  *a1 = 2049;
}

void static ArchiveCompression.lzbitmap.getter(_DWORD *a1@<X8>)
{
  *a1 = 1794;
}

uint64_t ArchiveCompression.init(algo:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v4;
  uint64_t v5;
  uint64_t result;

  v4 = Algorithm.rawValue.getter();
  v5 = type metadata accessor for Algorithm();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  *a2 = v4;
  return result;
}

uint64_t ArchiveCompression.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveCompression.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveCompression.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveCompression.description.getter()
{
  int *v0;
  int v1;

  v1 = *v0;
  if (*v0 > 1284)
  {
    switch(v1)
    {
      case 1285:
        return 1651076218;
      case 1794:
        return 0x70616D7469627A6CLL;
      case 2049:
        return 0x6573667A6CLL;
    }
  }
  else
  {
    switch(v1)
    {
      case 0:
        return 1701736302;
      case 256:
        return 3439212;
      case 774:
        return 1634564716;
    }
  }
  return 4144959;
}

unint64_t lazy protocol witness table accessor for type ArchiveCompression and conformance ArchiveCompression()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveCompression and conformance ArchiveCompression;
  if (!lazy protocol witness table cache variable for type ArchiveCompression and conformance ArchiveCompression)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveCompression, &type metadata for ArchiveCompression);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveCompression and conformance ArchiveCompression);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArchiveCompression()
{
  return &type metadata for ArchiveCompression;
}

uint64_t ArchiveHeader.EntryType.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveHeader.EntryType.regularFile.getter(_DWORD *a1@<X8>)
{
  *a1 = 70;
}

void static ArchiveHeader.EntryType.directory.getter(_DWORD *a1@<X8>)
{
  *a1 = 68;
}

void static ArchiveHeader.EntryType.link.getter(_DWORD *a1@<X8>)
{
  *a1 = 76;
}

void static ArchiveHeader.EntryType.fifo.getter(_DWORD *a1@<X8>)
{
  *a1 = 80;
}

void static ArchiveHeader.EntryType.characterSpecial.getter(_DWORD *a1@<X8>)
{
  *a1 = 67;
}

void static ArchiveHeader.EntryType.blockSpecial.getter(_DWORD *a1@<X8>)
{
  *a1 = 66;
}

void static ArchiveHeader.EntryType.socket.getter(_DWORD *a1@<X8>)
{
  *a1 = 83;
}

void static ArchiveHeader.EntryType.whiteout.getter(_DWORD *a1@<X8>)
{
  *a1 = 87;
}

void static ArchiveHeader.EntryType.door.getter(_DWORD *a1@<X8>)
{
  *a1 = 82;
}

void static ArchiveHeader.EntryType.port.getter(_DWORD *a1@<X8>)
{
  *a1 = 84;
}

void static ArchiveHeader.EntryType.metadata.getter(_DWORD *a1@<X8>)
{
  *a1 = 77;
}

uint64_t ArchiveHeader.EntryType.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveHeader.EntryType.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveHeader.EntryType.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

unint64_t ArchiveHeader.EntryType.description.getter()
{
  _DWORD *v0;
  unint64_t result;

  result = 0x4672616C75676572;
  switch(*v0)
  {
    case 'B':
      result = 0x6570536B636F6C62;
      break;
    case 'C':
      result = 0xD000000000000010;
      break;
    case 'D':
      result = 0x726F746365726964;
      break;
    case 'F':
      return result;
    case 'L':
      result = 1802398060;
      break;
    case 'M':
      result = 0x617461646174656DLL;
      break;
    case 'P':
      result = 1868982630;
      break;
    case 'R':
      result = 1919905636;
      break;
    case 'S':
      result = 0x74656B636F73;
      break;
    case 'T':
      result = 1953656688;
      break;
    case 'W':
      result = 0x74756F6574696877;
      break;
    default:
      result = 4144959;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryType and conformance ArchiveHeader.EntryType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader.EntryType and conformance ArchiveHeader.EntryType;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.EntryType and conformance ArchiveHeader.EntryType)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader.EntryType, &type metadata for ArchiveHeader.EntryType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.EntryType and conformance ArchiveHeader.EntryType);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.EntryType()
{
  return &type metadata for ArchiveHeader.EntryType;
}

void (*specialized MutableCollection<>.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t *v3;
  _QWORD *v7;
  uint64_t v8;
  void (*result)(uint64_t **, char);

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = *v3;
  result = (void (*)(uint64_t **, char))AAHeaderGetFieldCount(*(AAHeader *)(*v3 + 16));
  if (a2 < 0)
  {
    __break(1u);
  }
  else if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    swift_retain();
    return MutableCollection<>.subscript.modifyspecialized ;
  }
  __break(1u);
  return result;
}

{
  uint64_t *v3;
  _QWORD *v7;
  uint64_t v8;
  void (*result)(uint64_t **, char);

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = *v3;
  result = (void (*)(uint64_t **, char))AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*v3 + 16));
  if (a2 < 0)
  {
    __break(1u);
  }
  else if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    swift_retain();
    return MutableCollection<>.subscript.modifyspecialized ;
  }
  __break(1u);
  return result;
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t **a1, char a2)
{
  MutableCollection<>.subscript.modifyspecialized (a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))specialized _writeBackMutableSlice<A, B>(_:bounds:slice:));
}

{
  MutableCollection<>.subscript.modifyspecialized (a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))specialized _writeBackMutableSlice<A, B>(_:bounds:slice:));
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t **a1, char a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *a1;
  v5 = **a1;
  v6 = (*a1)[1];
  v7 = (*a1)[4];
  v8 = (*a1)[5];
  v9 = (*a1)[2];
  v10 = (*a1)[3];
  if ((a2 & 1) != 0)
  {
    swift_retain();
    a3(v8, v10, v7, v5, v6, v9);
    swift_release();
  }
  else
  {
    a3((*a1)[5], v10, v7, v5, v6, v9);
  }
  swift_release();
  free(v4);
}

unint64_t specialized MutableCollection.swapAt(_:_:)(unint64_t result, unint64_t a2)
{
  uint64_t *v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (result != a2)
  {
    v4 = result;
    v5 = *v2;
    ArchiveHeader.EntryXATBlob._attribute(at:)(result, &v10);
    v6 = v11;
    ArchiveHeader.EntryXATBlob._attribute(at:)(a2, &v10);
    v7 = v11;
    v8 = String.utf8CString.getter();
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (!HIDWORD(v4))
    {
      if (AAEntryXATBlobSetEntry(*(AAEntryXATBlob *)(v5 + 16), v4, (const char *)(v8 + 32), (const uint8_t *)(v7 + 32), *(_QWORD *)(v7 + 16)))
      {
LABEL_13:
        result = _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return result;
      }
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      v9 = String.utf8CString.getter();
      if ((a2 & 0x8000000000000000) == 0)
      {
        if (!HIDWORD(a2))
        {
          if (!AAEntryXATBlobSetEntry(*(AAEntryXATBlob *)(v5 + 16), a2, (const char *)(v9 + 32), (const uint8_t *)(v6 + 32), *(_QWORD *)(v6 + 16)))
          {
            swift_release();
            swift_bridgeObjectRelease();
            return swift_release();
          }
          goto LABEL_13;
        }
        goto LABEL_12;
      }
LABEL_11:
      __break(1u);
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _QWORD v14[3];
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;

  if (result != a2)
  {
    v20 = v2;
    v21 = v3;
    v5 = result;
    ArchiveHeader._field(at:)(result, (uint64_t)&v16);
    v6 = v17;
    v13 = v16;
    v7 = v18;
    v8 = v19;
    ArchiveHeader._field(at:)(a2, (uint64_t)&v16);
    v9 = v16;
    v10 = v17;
    v11 = v18;
    v12 = v19;
    v14[0] = v16;
    v14[1] = v17;
    v14[2] = v18;
    v15 = v19;
    ArchiveHeader._set(at:field:)(v5, (uint64_t)v14);
    outlined consume of ArchiveHeader.Field(v9, v10, v11, v12);
    v16 = v13;
    v17 = v6;
    v18 = v7;
    v19 = v8;
    ArchiveHeader._set(at:field:)(a2, (uint64_t)&v16);
    return outlined consume of ArchiveHeader.Field(v13, v6, v7, v8);
  }
  return result;
}

void protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAEntryXATBlobTraits(AAEntryXATBlob *a1)
{
  AAEntryXATBlobDestroy(*a1);
}

uint64_t ArchiveHeader.EntryXATBlob.ExtendedAttribute.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;

  v1 = *v0;
  v2 = (void *)v0[1];
  v3 = v0[2];
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    result = swift_retain();
    v6 = 0;
    v7 = MEMORY[0x24BEE4260];
    v8 = MEMORY[0x24BEE42B0];
    while (v6 < *(_QWORD *)(v3 + 16))
    {
      v9 = *(_BYTE *)(v3 + v6++ + 32);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
      v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_220078890;
      *(_QWORD *)(v10 + 56) = v7;
      *(_QWORD *)(v10 + 64) = v8;
      *(_BYTE *)(v10 + 32) = v9;
      v11._countAndFlagsBits = String.init(format:_:)();
      String.append(_:)(v11);
      result = swift_bridgeObjectRelease();
      if (v4 == v6)
      {
        swift_release();
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_6:
    v12._countAndFlagsBits = v1;
    v12._object = v2;
    String.append(_:)(v12);
    swift_bridgeObjectRetain();
    v13._countAndFlagsBits = 0x3A61746164202CLL;
    v13._object = (void *)0xE700000000000000;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v14._countAndFlagsBits = 0;
    v14._object = (void *)0xE000000000000000;
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0x203A79656BLL;
  }
  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.ExtendedAttribute.init(key:data:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

BOOL static ArchiveHeader.EntryXATBlob.ExtendedAttribute.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  char v5;
  _BOOL8 result;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v16;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v5 & 1) != 0))
  {
    v7 = *(_QWORD *)(v2 + 16);
    if (v7 == *(_QWORD *)(v3 + 16))
    {
      if (!v7 || v2 == v3)
      {
        return 1;
      }
      else
      {
        v8 = (unsigned __int8 *)(v2 + 32);
        v9 = (unsigned __int8 *)(v3 + 32);
        v10 = v7 - 1;
        do
        {
          v12 = *v8++;
          v11 = v12;
          v14 = *v9++;
          v13 = v14;
          v16 = v10-- != 0;
          result = v11 == v13;
        }
        while (v11 == v13 && v16);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL specialized static ContiguousArray<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v11;
  _BOOL8 result;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = (unsigned __int8 *)(a1 + 32);
  v4 = (unsigned __int8 *)(a2 + 32);
  v5 = v2 - 1;
  do
  {
    v7 = *v3++;
    v6 = v7;
    v9 = *v4++;
    v8 = v9;
    v11 = v5-- != 0;
    result = v6 == v8;
  }
  while (v6 == v8 && v11);
  return result;
}

void ArchiveHeader.EntryXATBlob.ExtendedAttribute.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  Swift::UInt v2;
  Swift::UInt8 *v3;
  Swift::UInt8 v4;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
}

Swift::Int ArchiveHeader.EntryXATBlob.ExtendedAttribute.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  Swift::UInt v2;
  Swift::UInt8 *v3;
  Swift::UInt8 v4;

  v1 = *(_QWORD *)(v0 + 16);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  return (v4 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      && specialized static ContiguousArray<A>.== infix(_:_:)(v2, v3);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute()
{
  uint64_t v0;
  uint64_t v1;
  Swift::UInt v2;
  Swift::UInt8 *v3;
  Swift::UInt8 v4;

  v1 = *(_QWORD *)(v0 + 16);
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v1 + 16);
  Hasher._combine(_:)(v2);
  if (v2)
  {
    v3 = (Swift::UInt8 *)(v1 + 32);
    do
    {
      v4 = *v3++;
      Hasher._combine(_:)(v4);
      --v2;
    }
    while (v2);
  }
  return Hasher._finalize()();
}

uint64_t ArchiveHeader.EntryXATBlob.__allocating_init()()
{
  uint64_t v0;
  AAEntryXATBlob v1;
  uint64_t result;

  v0 = swift_allocObject();
  v1 = AAEntryXATBlobCreate();
  if (v1)
  {
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.init()()
{
  uint64_t v0;
  AAEntryXATBlob v1;
  uint64_t result;

  v1 = AAEntryXATBlobCreate();
  if (v1)
  {
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.__allocating_init(directory:path:flags:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return ArchiveHeader.EntryXATBlob.init(directory:path:flags:)(a1, a2);
}

uint64_t ArchiveHeader.EntryXATBlob.init(directory:path:flags:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t, uint64_t);
  uint64_t v10;

  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  FilePath.withCString<A>(_:)();
  v6 = type metadata accessor for FilePath();
  if (v10)
  {
    v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
    v7(a1, v6);
    *(_QWORD *)(v3 + 16) = v10;
    *(_BYTE *)(v3 + 24) = 1;
    v7(a2, v6);
  }
  else
  {
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
    v8(a1, v6);
    v8(a2, v6);
    type metadata accessor for ArchiveHeader.EntryXATBlob();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v3;
}

uint64_t partial apply for closure #1 in ArchiveHeader.EntryXATBlob.init(directory:path:flags:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  return FilePath.withCString<A>(_:)();
}

uint64_t type metadata accessor for ArchiveHeader.EntryXATBlob()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ArchiveHeader.EntryXATBlob;
  if (!type metadata singleton initialization cache for ArchiveHeader.EntryXATBlob)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.apply(directory:path:flags:)()
{
  uint64_t result;
  _BYTE *v1;
  int v2;

  result = FilePath.withCString<A>(_:)();
  if (v2)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v1 = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t partial apply for closure #1 in ArchiveHeader.EntryXATBlob.apply(directory:path:flags:)()
{
  return FilePath.withCString<A>(_:)();
}

uint64_t ArchiveHeader.EntryXATBlob._attribute(at:)@<X0>(unint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  unint64_t v5;
  uint64_t v8;
  char *v9;
  AAEntryXATBlob_impl *v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  _QWORD v22[5];
  size_t data_size;
  size_t key_length[2];

  key_length[1] = *MEMORY[0x24BDAC8D0];
  type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  data_size = 0;
  key_length[0] = 0;
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (HIDWORD(a1))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v10 = *(AAEntryXATBlob_impl **)(v2 + 16);
  if (AAEntryXATBlobGetEntry(v10, a1, 0, 0, key_length, 0, 0, &data_size))
    goto LABEL_30;
  v5 = key_length[0];
  v11 = key_length[0] + 1;
  if (__OFADD__(key_length[0], 1))
    goto LABEL_24;
  v4 = data_size;
  v12 = v11 + data_size;
  if (__OFADD__(v11, data_size))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((v12 & 0x8000000000000000) != 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v12)
  {
    v2 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v2 + 16) = v12;
  }
  else
  {
    v2 = MEMORY[0x24BEE4AF8];
  }
  v3 = v2 + 32;
  if (!AAEntryXATBlobGetEntry(v10, a1, v5 + 1, (char *)(v2 + 32), 0, v4, (uint8_t *)(v2 + 32 + v11), 0))
  {
    *(_QWORD *)(v2 + 16) = v12;
    v22[1] = specialized Collection.prefix(_:)(v5, v2);
    v22[2] = v13;
    v22[3] = v14;
    v22[4] = v15;
    swift_bridgeObjectRetain();
    static String.Encoding.utf8.getter();
    v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<UInt8>);
    lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type ArraySlice<UInt8> and conformance ArraySlice<A>, &demangling cache variable for type metadata for ArraySlice<UInt8>, MEMORY[0x24BEE2180]);
    v9 = (char *)String.init<A>(bytes:encoding:)();
    a1 = v16;
    swift_unknownObjectRelease();
    if (!a1)
      __break(1u);
    if ((v4 & 0x8000000000000000) == 0)
    {
      v5 = *(_QWORD *)(v2 + 16);
      if (v5 >= v4)
        v4 = v5 - v4;
      else
        v4 = 0;
      type metadata accessor for __ContiguousArrayStorageBase();
      swift_unknownObjectRetain_n();
      v17 = swift_dynamicCastClass();
      if (!v17)
      {
        swift_unknownObjectRelease();
        v17 = MEMORY[0x24BEE4AF8];
      }
      v18 = *(_QWORD *)(v17 + 16);
      swift_release();
      if (v18 == v5 - v4)
      {
        v19 = swift_dynamicCastClass();
        if (!v19)
        {
          swift_unknownObjectRelease();
          v19 = MEMORY[0x24BEE4AF8];
        }
        goto LABEL_21;
      }
LABEL_28:
      swift_unknownObjectRelease();
      specialized _copyCollectionToContiguousArray<A>(_:)(v2, v3, v4, (2 * v5) | 1);
      v19 = v21;
LABEL_21:
      result = swift_unknownObjectRelease();
      *a2 = v9;
      a2[1] = a1;
      a2[2] = v19;
      return result;
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
LABEL_30:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

int64_t specialized Collection.prefix(_:)(int64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v2 >= result)
      v3 = result;
    else
      v3 = *(_QWORD *)(a2 + 16);
    if (!result)
      v3 = 0;
    if (v2 >= v3)
      return a2;
  }
  __break(1u);
  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.__allocating_init(withAAEncodedData:)(const uint8_t *a1, size_t a2)
{
  uint64_t result;
  uint64_t v5;
  AAEntryXATBlob v6;

  result = swift_allocObject();
  if (a1)
  {
    v5 = result;
    v6 = AAEntryXATBlobCreateWithEncodedData(a1, a2);
    if (v6)
    {
      *(_QWORD *)(v5 + 16) = v6;
      *(_BYTE *)(v5 + 24) = 1;
    }
    else
    {
      swift_deallocPartialClassInstance();
      return 0;
    }
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

const uint8_t *ArchiveHeader.EntryXATBlob.init(withAAEncodedData:)(const uint8_t *result, size_t a2)
{
  uint64_t v2;
  AAEntryXATBlob v3;

  if (result)
  {
    v3 = AAEntryXATBlobCreateWithEncodedData(result, a2);
    if (v3)
    {
      *(_QWORD *)(v2 + 16) = v3;
      *(_BYTE *)(v2 + 24) = 1;
    }
    else
    {
      type metadata accessor for ArchiveHeader.EntryXATBlob();
      swift_deallocPartialClassInstance();
      return 0;
    }
    return (const uint8_t *)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.withAAEncodedData<A>(_:)(uint64_t (*a1)(const uint8_t *, size_t))
{
  uint64_t v1;
  AAEntryXATBlob_impl *v3;
  size_t EncodedSize;
  const uint8_t *EncodedData;

  v3 = *(AAEntryXATBlob_impl **)(v1 + 16);
  EncodedSize = AAEntryXATBlobGetEncodedSize(v3);
  EncodedData = AAEntryXATBlobGetEncodedData(v3);
  return a1(EncodedData, EncodedSize);
}

void ArchiveHeader.EntryXATBlob.__allocating_init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ArchiveHeader.EntryXATBlob.init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ArchiveHeader.EntryXATBlob.deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
    AAEntryXATBlobDestroy(*(AAEntryXATBlob *)(v0 + 16));
  return v0;
}

uint64_t ArchiveHeader.EntryXATBlob.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
    AAEntryXATBlobDestroy(*(AAEntryXATBlob *)(v0 + 16));
  return swift_deallocClassInstance();
}

void vtable thunk for _AAObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveHeader.EntryXATBlob.__allocating_init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t protocol witness for _AAEncodableProtocol.init(withAAEncodedData:) in conformance ArchiveHeader.EntryXATBlob@<X0>(const uint8_t *a1@<X0>, size_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v7;

  type metadata accessor for ArchiveHeader.EntryXATBlob();
  result = swift_allocObject();
  if (a1)
  {
    v7 = result;
    result = (uint64_t)AAEntryXATBlobCreateWithEncodedData(a1, a2);
    if (result)
    {
      *(_QWORD *)(v7 + 16) = result;
      *(_BYTE *)(v7 + 24) = 1;
    }
    else
    {
      result = swift_deallocPartialClassInstance();
      v7 = 0;
    }
    *a3 = v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for _AAEncodableProtocol.withAAEncodedData<A>(_:) in conformance ArchiveHeader.EntryXATBlob(uint64_t (*a1)(const uint8_t *, size_t))
{
  return ArchiveHeader.EntryXATBlob.withAAEncodedData<A>(_:)(a1);
}

uint64_t ArchiveHeader.EntryXATBlob.startIndex.getter()
{
  return 0;
}

uint64_t ArchiveHeader.EntryXATBlob.endIndex.getter()
{
  uint64_t v0;

  return AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v0 + 16));
}

uint64_t key path setter for ArchiveHeader.EntryXATBlob.subscript(_:) : ArchiveHeader.EntryXATBlob(_QWORD *a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];

  v3 = *a3;
  v4 = a1[1];
  v5 = a1[2];
  v7[0] = *a1;
  v7[1] = v4;
  v7[2] = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  return ArchiveHeader.EntryXATBlob.subscript.setter((uint64_t)v7, v3);
}

uint64_t ArchiveHeader.EntryXATBlob.subscript.setter(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = String.utf8CString.getter();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (HIDWORD(a2))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (!AAEntryXATBlobSetEntry(*(AAEntryXATBlob *)(v2 + 16), a2, (const char *)(v5 + 32), (const uint8_t *)(v4 + 32), *(_QWORD *)(v4 + 16)))
  {
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
LABEL_7:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void (*ArchiveHeader.EntryXATBlob.subscript.modify(_QWORD *a1, unint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = malloc(0x28uLL);
  *a1 = v5;
  v5[3] = a2;
  v5[4] = v2;
  ArchiveHeader.EntryXATBlob._attribute(at:)(a2, v5);
  return ArchiveHeader.EntryXATBlob.subscript.modify;
}

void ArchiveHeader.EntryXATBlob.subscript.modify(uint64_t a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  size_t v8;
  AAEntryXATBlob_impl *v9;
  unint64_t v10;
  unint64_t v11;

  v3 = *(_QWORD **)a1;
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v7 = (const char *)(String.utf8CString.getter() + 32);
  v8 = *(_QWORD *)(v6 + 16);
  v9 = *(AAEntryXATBlob_impl **)(v4 + 16);
  if ((a2 & 1) != 0)
  {
    if ((v5 & 0x8000000000000000) == 0)
    {
      v10 = v3[3];
      if (!HIDWORD(v10))
      {
        swift_bridgeObjectRetain();
        swift_retain();
        if (!AAEntryXATBlobSetEntry(v9, v10, v7, (const uint8_t *)(v6 + 32), v8))
        {
          swift_release();
          swift_bridgeObjectRelease();
          swift_release();
LABEL_10:
          swift_bridgeObjectRelease();
          swift_release();
          free(v3);
          return;
        }
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v5 < 0)
    goto LABEL_12;
  v11 = v3[3];
  if (HIDWORD(v11))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!AAEntryXATBlobSetEntry(v9, v11, v7, (const uint8_t *)(v6 + 32), *(_QWORD *)(v6 + 16)))
  {
    swift_release();
    goto LABEL_10;
  }
LABEL_15:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

Swift::Void __swiftcall ArchiveHeader.EntryXATBlob.removeAll()()
{
  uint64_t v0;

  if (AAEntryXATBlobClear(*(AAEntryXATBlob *)(v0 + 16)))
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t ArchiveHeader.EntryXATBlob.remove(at:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  __int128 v7;
  uint64_t v8;
  __int128 v9;

  ArchiveHeader.EntryXATBlob._attribute(at:)(a1, &v8);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (HIDWORD(a1))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v5 = v8;
  v7 = v9;
  result = AAEntryXATBlobRemoveEntry(*(AAEntryXATBlob *)(v2 + 16), a1);
  if (!(_DWORD)result)
  {
    *(_QWORD *)a2 = v5;
    *(_OWORD *)(a2 + 8) = v7;
    return result;
  }
LABEL_7:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveHeader.EntryXATBlob.append(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = String.utf8CString.getter();
  if (!AAEntryXATBlobAppendEntry(*(AAEntryXATBlob *)(v1 + 16), (const char *)(v3 + 32), (const uint8_t *)(v2 + 32), *(_QWORD *)(v2 + 16)))return swift_release();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob.ExtendedAttribute and conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob.ExtendedAttribute and conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob.ExtendedAttribute and conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader.EntryXATBlob.ExtendedAttribute, &type metadata for ArchiveHeader.EntryXATBlob.ExtendedAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob.ExtendedAttribute and conformance ArchiveHeader.EntryXATBlob.ExtendedAttribute);
  }
  return result;
}

uint64_t base witness table accessor for BidirectionalCollection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob(&lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob, (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob);
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>, &lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob, (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob, MEMORY[0x24BEE4230]);
}

uint64_t base witness table accessor for Collection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob(&lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob, (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob);
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>, &lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob, (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob, MEMORY[0x24BEE4220]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<ArchiveHeader.EntryXATBlob>);
    v10 = lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob(a2, a3);
    result = MEMORY[0x2207DD494](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance ArchiveHeader.EntryXATBlob(uint64_t a1, unint64_t *a2)
{
  return ArchiveHeader.EntryXATBlob.subscript.setter(a1, *a2);
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader.EntryXATBlob(_QWORD *a1, unint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = ArchiveHeader.EntryXATBlob.subscript.modify(v4, *a2);
  return protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader;
}

uint64_t protocol witness for MutableCollection.subscript.setter in conformance ArchiveHeader.EntryXATBlob(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;

  specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  return swift_release();
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader.EntryXATBlob(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance ArchiveHeader;
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance ArchiveHeader.EntryXATBlob@<X0>(uint64_t (*a1)(uint64_t *)@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance ArchiveHeader.EntryXATBlob(unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

uint64_t protocol witness for MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:) in conformance ArchiveHeader.EntryXATBlob()
{
  type metadata accessor for ArchiveHeader.EntryXATBlob();
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t protocol witness for MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:) in conformance ArchiveHeader.EntryXATBlob()
{
  type metadata accessor for ArchiveHeader.EntryXATBlob();
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)();
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader.EntryXATBlob> and conformance <> Slice<A>, &lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob, (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob, MEMORY[0x24BEE4218]);
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance ArchiveHeader.EntryXATBlob@<X0>(_QWORD *result@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t v4;

  v4 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    result = (_QWORD *)AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(_QWORD *)v2 + 16));
    if (v4 < result)
    {
      *a2 = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance ArchiveHeader.EntryXATBlob(unint64_t *result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t *v3;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    result = (unint64_t *)AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(_QWORD *)v1 + 16));
    if (v2 < result)
    {
      *v3 = v2;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t base witness table accessor for Sequence in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob(&lazy protocol witness table cache variable for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob, (uint64_t)&protocol conformance descriptor for ArchiveHeader.EntryXATBlob);
}

uint64_t lazy protocol witness table accessor for type ArchiveHeader.EntryXATBlob and conformance ArchiveHeader.EntryXATBlob(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ArchiveHeader.EntryXATBlob();
    result = MEMORY[0x2207DD494](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader.EntryXATBlob> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<ArchiveHeader.EntryXATBlob>, MEMORY[0x24BEE4238]);
}

uint64_t protocol witness for Collection.endIndex.getter in conformance ArchiveHeader.EntryXATBlob@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(_QWORD *)v1 + 16));
  *a1 = result;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader.EntryXATBlob(_QWORD *a1, unint64_t *a2))()
{
  ArchiveHeader.EntryXATBlob._attribute(at:)(*a2, a1);
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader.EntryXATBlob;
}

uint64_t protocol witness for Collection.subscript.read in conformance ArchiveHeader.EntryXATBlob()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t protocol witness for Collection.subscript.getter in conformance ArchiveHeader.EntryXATBlob@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = *a1;
  v5 = a1[1];
  v6 = *v2;
  result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v6 + 16));
  if (v4 < 0)
  {
    __break(1u);
  }
  else if (v5 <= result)
  {
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
    return swift_retain();
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance ArchiveHeader.EntryXATBlob@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(_QWORD *)v1 + 16));
  *a1 = 0;
  a1[1] = result;
  return result;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance ArchiveHeader.EntryXATBlob@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v5;

  v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    result = (_QWORD *)AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(_QWORD *)v3 + 16));
    if (v5 <= result)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader.EntryXATBlob@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

unint64_t protocol witness for RandomAccessCollection.distance(from:to:) in conformance ArchiveHeader.EntryXATBlob(unint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  AAEntryXATBlob_impl *v5;
  unint64_t result;

  v3 = *a1;
  v4 = *a2;
  v5 = *(AAEntryXATBlob_impl **)(*(_QWORD *)v2 + 16);
  result = AAEntryXATBlobGetEntryCount(v5);
  if (v3 > result)
  {
    __break(1u);
  }
  else
  {
    result = AAEntryXATBlobGetEntryCount(v5);
    if (v4 <= result)
      return v4 - v3;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.index(after:) in conformance ArchiveHeader.EntryXATBlob@<X0>(unint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v4;
  uint64_t result;

  v4 = *a1;
  result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*(_QWORD *)v2 + 16));
  if (v4 >= result)
  {
    __break(1u);
  }
  else if (!__OFADD__(v4, 1))
  {
    *a2 = v4 + 1;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.formIndex(after:) in conformance ArchiveHeader.EntryXATBlob(unint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  v3 = *v1;
  v4 = *a1;
  result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v3 + 16));
  if (v4 >= result)
  {
    __break(1u);
  }
  else if (!__OFADD__(v4, 1))
  {
    *a1 = v4 + 1;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader.EntryXATBlob()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader.EntryXATBlob> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader.EntryXATBlob>, MEMORY[0x24BEE2C18]);
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance ArchiveHeader.EntryXATBlob(uint64_t a1)
{
  MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader.EntryXATBlob, a1);
  return Collection.underestimatedCount.getter();
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader.EntryXATBlob()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

_QWORD *protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader.EntryXATBlob(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance ArchiveHeader.EntryXATBlob()
{
  type metadata accessor for ArchiveHeader.EntryXATBlob();
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

double sub_220069DF0@<D0>(unint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  uint64_t v4;
  __int128 v5;

  ArchiveHeader.EntryXATBlob._attribute(at:)(*a1, &v4);
  *(_QWORD *)a2 = v4;
  result = *(double *)&v5;
  *(_OWORD *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_220069E38()
{
  return 0;
}

ValueMetadata *type metadata accessor for _AAEntryXATBlobTraits()
{
  return &type metadata for _AAEntryXATBlobTraits;
}

uint64_t method lookup function for ArchiveHeader.EntryXATBlob()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.__allocating_init(directory:path:flags:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.apply(directory:path:flags:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.__allocating_init(withAAEncodedData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of ArchiveHeader.EntryXATBlob.withAAEncodedData<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t destroy for ArchiveHeader.EntryXATBlob.ExtendedAttribute()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeBufferWithCopyOfBuffer for ArchiveHeader.EntryXATBlob.ExtendedAttribute(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ArchiveHeader.EntryXATBlob.ExtendedAttribute(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

uint64_t assignWithTake for ArchiveHeader.EntryXATBlob.ExtendedAttribute(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArchiveHeader.EntryXATBlob.ExtendedAttribute(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ArchiveHeader.EntryXATBlob.ExtendedAttribute(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ArchiveHeader.EntryXATBlob.ExtendedAttribute()
{
  return &type metadata for ArchiveHeader.EntryXATBlob.ExtendedAttribute;
}

uint64_t specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, int64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  AAHeader_impl *header;
  _QWORD v19[3];
  char v20;

  v10 = *a1;
  result = AAHeaderGetFieldCount(*(AAHeader *)(*a1 + 16));
  if (a2 < 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (result < a3)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    if (a2 >= a3)
    {
LABEL_25:
      __break(1u);
      return result;
    }
    header = *(AAHeader_impl **)(a6 + 16);
    while ((uint64_t)a4 < a5)
    {
      ArchiveHeader._field(at:)(a4, (uint64_t)v19);
      v12 = v19[0];
      v13 = v19[1];
      v14 = v19[2];
      v15 = v20;
      ArchiveHeader._set(at:field:)(a2, (uint64_t)v19);
      outlined consume of ArchiveHeader.Field(v12, v13, v14, v15);
      result = AAHeaderGetFieldCount(*(AAHeader *)(v10 + 16));
      if (a2 >= (unint64_t)result)
        goto LABEL_18;
      result = AAHeaderGetFieldCount(header);
      if (a4 >= result)
        goto LABEL_19;
      v16 = a4 + 1;
      if (__OFADD__(a4, 1))
        goto LABEL_20;
      if (a3 == ++a2)
        goto LABEL_14;
      ++a4;
      if (v16 == a5)
      {
        __break(1u);
LABEL_14:
        a4 = v16;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_15:
  if (a4 != a5)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  return result;
}

{
  AAEntryXATBlob_impl *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v18[3];

  v17 = *a1;
  v11 = *(AAEntryXATBlob_impl **)(*a1 + 16);
  result = AAEntryXATBlobGetEntryCount(v11);
  if (a2 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (result >= a3)
  {
    if (a2 == a3)
    {
LABEL_18:
      if (a4 == a5)
        return result;
      goto LABEL_27;
    }
    if (a4 == a5)
      goto LABEL_28;
    if (a2 <= 0x100000000)
      v13 = 0x100000000;
    else
      v13 = a2;
    while ((uint64_t)a4 < a5)
    {
      ArchiveHeader.EntryXATBlob._attribute(at:)(a4, v18);
      v14 = v18[2];
      v15 = String.utf8CString.getter();
      if (v13 == a2)
        goto LABEL_21;
      if (AAEntryXATBlobSetEntry(v11, a2, (const char *)(v15 + 32), (const uint8_t *)(v14 + 32), *(_QWORD *)(v14 + 16)))
        goto LABEL_29;
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      v11 = *(AAEntryXATBlob_impl **)(v17 + 16);
      if (a2 >= AAEntryXATBlobGetEntryCount(v11))
        goto LABEL_22;
      result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(a6 + 16));
      if (a4 >= result)
        goto LABEL_23;
      v16 = a4 + 1;
      if (__OFADD__(a4, 1))
        goto LABEL_24;
      if (a3 == ++a2)
        goto LABEL_17;
      ++a4;
      if (v16 == a5)
      {
        __break(1u);
LABEL_17:
        a4 = v16;
        goto LABEL_18;
      }
    }
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
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t specialized MutableCollection<>._partitionImpl(by:)(uint64_t (*a1)(uint64_t *), uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint32_t FieldCount;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  unint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v29 = a2;
  v4 = *v2;
  FieldCount = AAHeaderGetFieldCount(*(AAHeader *)(*v2 + 16));
  if (!FieldCount)
    return 0;
  v6 = 0;
  v7 = FieldCount;
LABEL_3:
  do
  {
    ArchiveHeader._field(at:)(v6, (uint64_t)&v25);
    v9 = v25;
    v8 = v26;
    v10 = v27;
    v21 = v25;
    v22 = v26;
    v23 = v27;
    v11 = v28;
    v24 = v28;
    v12 = a1(&v21);
    outlined consume of ArchiveHeader.Field(v9, v8, v10, v11);
    if (v3)
      break;
    if ((v12 & 1) != 0)
    {
      --v7;
      result = AAHeaderGetFieldCount(*(AAHeader *)(v4 + 16));
      if (v7 >= (unint64_t)result)
      {
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        return result;
      }
      while ((uint64_t)v6 < v7)
      {
        ArchiveHeader._field(at:)(v7, (uint64_t)&v25);
        v14 = v25;
        v15 = v26;
        v16 = v27;
        v21 = v25;
        v22 = v26;
        v23 = v27;
        v17 = v28;
        v24 = v28;
        v18 = a1(&v21);
        outlined consume of ArchiveHeader.Field(v14, v15, v16, v17);
        if ((v18 & 1) == 0)
        {
          specialized MutableCollection.swapAt(_:_:)(v6, v7);
          result = AAHeaderGetFieldCount(*(AAHeader *)(v4 + 16));
          if (v6 >= result)
            goto LABEL_23;
          if ((uint64_t)++v6 < v7)
            goto LABEL_3;
          return v6;
        }
        --v7;
        result = AAHeaderGetFieldCount(*(AAHeader *)(v4 + 16));
        if (v7 >= (unint64_t)result)
        {
          __break(1u);
          goto LABEL_20;
        }
      }
      return v6;
    }
    result = AAHeaderGetFieldCount(*(AAHeader *)(v4 + 16));
    if (v6 >= result)
      goto LABEL_21;
    if (__OFADD__(v6++, 1))
      goto LABEL_22;
  }
  while ((uint64_t)v6 < v7);
  return v6;
}

unint64_t specialized MutableCollection<>._partitionImpl(by:)(uint64_t (*a1)(uint64_t *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint32_t EntryCount;
  unint64_t v6;
  int64_t v7;
  char v8;
  unint64_t result;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;

  v4 = *v1;
  EntryCount = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(*v1 + 16));
  if (!EntryCount)
    return 0;
  v18 = v1;
  v6 = 0;
  v7 = EntryCount;
LABEL_3:
  do
  {
    ArchiveHeader.EntryXATBlob._attribute(at:)(v6, &v15);
    v12 = v15;
    v13 = v16;
    v14 = v17;
    v8 = a1(&v12);
    swift_release();
    swift_bridgeObjectRelease();
    if (v2)
      break;
    if ((v8 & 1) != 0)
    {
      --v7;
      result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v4 + 16));
      if (v7 >= (unint64_t)result)
      {
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        return result;
      }
      while ((uint64_t)v6 < v7)
      {
        ArchiveHeader.EntryXATBlob._attribute(at:)(v7, &v15);
        v12 = v15;
        v13 = v16;
        v14 = v17;
        v10 = a1(&v12);
        swift_release();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0)
        {
          specialized MutableCollection.swapAt(_:_:)(v6, v7);
          result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v4 + 16));
          if (v6 >= result)
            goto LABEL_23;
          if ((uint64_t)++v6 < v7)
            goto LABEL_3;
          return v6;
        }
        --v7;
        result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v4 + 16));
        if (v7 >= (unint64_t)result)
        {
          __break(1u);
          goto LABEL_20;
        }
      }
      return v6;
    }
    result = AAEntryXATBlobGetEntryCount(*(AAEntryXATBlob *)(v4 + 16));
    if (v6 >= result)
      goto LABEL_21;
    if (__OFADD__(v6++, 1))
      goto LABEL_22;
  }
  while ((uint64_t)v6 < v7);
  return v6;
}

uint64_t partial apply for closure #1 in closure #1 in ArchiveHeader.EntryXATBlob.apply(directory:path:flags:)@<X0>(char *path@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = AAEntryXATBlobApplyToPath(*(AAEntryXATBlob *)(*(_QWORD *)(v2 + 16) + 16), *(const char **)(v2 + 24), path, *(_QWORD *)(v2 + 32));
  *a2 = result;
  return result;
}

AAEntryXATBlob partial apply for closure #1 in closure #1 in ArchiveHeader.EntryXATBlob.init(directory:path:flags:)@<X0>(char *path@<X0>, AAEntryXATBlob *a2@<X8>)
{
  uint64_t v2;
  AAEntryXATBlob result;

  result = AAEntryXATBlobCreateWithPath(*(const char **)(v2 + 16), path, *(_QWORD *)(v2 + 24));
  *a2 = result;
  return result;
}

uint64_t protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAByteStreamTraits(AAByteStream *a1)
{
  return AAByteStreamClose(*a1);
}

uint64_t ArchiveByteStream.read(into:)(uint64_t a1, uint64_t a2)
{
  return ArchiveByteStream.read(into:)(a1, a2, MEMORY[0x24BED2A68]);
}

uint64_t ArchiveByteStream.read(into:atOffset:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveByteStream.read(into:atOffset:)(a1, a2, a3, MEMORY[0x24BED2A40]);
}

uint64_t ArchiveByteStream.write(from:)(uint64_t a1, uint64_t a2)
{
  return ArchiveByteStream.read(into:)(a1, a2, MEMORY[0x24BED2A80]);
}

uint64_t ArchiveByteStream.read(into:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v7;
  _BYTE *v8;

  swift_beginAccess();
  result = *(_QWORD *)(v3 + 16);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (!a1)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v7 = a3();
  if (v7 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v8 = 0;
    swift_willThrow();
  }
  return v7;
}

uint64_t ArchiveByteStream.write(from:atOffset:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveByteStream.read(into:atOffset:)(a1, a2, a3, MEMORY[0x24BED2A50]);
}

uint64_t ArchiveByteStream.read(into:atOffset:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;

  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v6 = result;
  swift_beginAccess();
  result = *(_QWORD *)(v4 + 16);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v7 = a4();
  if (v7 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v8 = 0;
    swift_willThrow();
  }
  return v7;
}

AAByteStream_impl *ArchiveByteStream.seek(toOffset:relativeTo:)(off_t a1, int a2)
{
  uint64_t v2;
  AAByteStream_impl *result;
  off_t v6;
  _BYTE *v7;

  swift_beginAccess();
  result = *(AAByteStream_impl **)(v2 + 16);
  if (result)
  {
    v6 = AAByteStreamSeek(result, a1, a2);
    if (v6 < 0)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *v7 = 0;
      swift_willThrow();
    }
    return (AAByteStream_impl *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall ArchiveByteStream.cancel()()
{
  uint64_t v0;
  AAByteStream_impl *v1;

  swift_beginAccess();
  v1 = *(AAByteStream_impl **)(v0 + 16);
  if (v1)
    AAByteStreamCancel(v1);
  else
    __break(1u);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ArchiveByteStream.close()()
{
  uint64_t v0;
  AAByteStream_impl *v1;
  int v2;
  _BYTE *v3;

  swift_beginAccess();
  v1 = *(AAByteStream_impl **)(v0 + 16);
  if (v1)
  {
    v2 = AAByteStreamClose(v1);
    *(_QWORD *)(v0 + 16) = 0;
    if (v2)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *v3 = 0;
      swift_willThrow();
    }
  }
}

uint64_t ArchiveByteStream.__allocating_init(object:owned:)(uint64_t a1, char a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = a1;
  *(_BYTE *)(v4 + 24) = a2;
  return v4;
}

uint64_t ArchiveByteStream.init(object:owned:)(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_BYTE *)(v2 + 24) = a2;
  return v2;
}

uint64_t ArchiveByteStream.deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
  {
    swift_beginAccess();
    AAByteStreamClose(*(AAByteStream *)(v0 + 16));
    *(_QWORD *)(v0 + 16) = 0;
  }
  return v0;
}

uint64_t ArchiveByteStream.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
  {
    swift_beginAccess();
    AAByteStreamClose(*(AAByteStream *)(v0 + 16));
  }
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for _AAOptionalObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveByteStream.__allocating_init(object:owned:)(uint64_t *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  type metadata accessor for ArchiveByteStream();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = a2;
  return v4;
}

uint64_t protocol witness for ArchiveByteStreamProtocol.read(into:) in conformance ArchiveByteStream(uint64_t a1, uint64_t a2)
{
  return ArchiveByteStream.read(into:)(a1, a2);
}

uint64_t protocol witness for ArchiveByteStreamProtocol.read(into:atOffset:) in conformance ArchiveByteStream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveByteStream.read(into:atOffset:)(a1, a2, a3);
}

uint64_t protocol witness for ArchiveByteStreamProtocol.write(from:) in conformance ArchiveByteStream(uint64_t a1, uint64_t a2)
{
  return ArchiveByteStream.write(from:)(a1, a2);
}

uint64_t protocol witness for ArchiveByteStreamProtocol.write(from:atOffset:) in conformance ArchiveByteStream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveByteStream.write(from:atOffset:)(a1, a2, a3);
}

AAByteStream_impl *protocol witness for ArchiveByteStreamProtocol.seek(toOffset:relativeTo:) in conformance ArchiveByteStream(off_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v5;
  AAByteStream_impl *result;
  off_t v7;
  _BYTE *v8;

  v5 = *v2;
  swift_beginAccess();
  result = *(AAByteStream_impl **)(v5 + 16);
  if (result)
  {
    v7 = AAByteStreamSeek(result, a1, a2);
    if (v7 < 0)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *v8 = 0;
      swift_willThrow();
    }
    return (AAByteStream_impl *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void protocol witness for ArchiveByteStreamProtocol.cancel() in conformance ArchiveByteStream()
{
  uint64_t *v0;
  uint64_t v1;
  AAByteStream_impl *v2;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(AAByteStream_impl **)(v1 + 16);
  if (v2)
    AAByteStreamCancel(v2);
  else
    __break(1u);
}

void protocol witness for ArchiveByteStreamProtocol.close() in conformance ArchiveByteStream()
{
  ArchiveByteStream.close()();
}

uint64_t static ArchiveByteStream.fileStream(path:mode:options:permissions:)()
{
  uint64_t v0;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  FilePath.withCString<A>(_:)();
  if (!v2)
    return 0;
  type metadata accessor for ArchiveByteStream();
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v0 + 16) = v2;
  *(_BYTE *)(v0 + 24) = 1;
  return v0;
}

AAByteStream closure #1 in static ArchiveByteStream.fileStream(path:mode:options:permissions:)@<X0>(const char *a1@<X0>, int a2@<W1>, mode_t a3@<W2>, AAByteStream *a4@<X8>)
{
  AAByteStream result;

  result = AAFileStreamOpenWithPath(a1, a2, a3);
  *a4 = result;
  return result;
}

AAByteStream partial apply for closure #1 in static ArchiveByteStream.fileStream(path:mode:options:permissions:)@<X0>(const char *a1@<X0>, AAByteStream *a2@<X8>)
{
  uint64_t v2;
  AAByteStream result;

  result = AAFileStreamOpenWithPath(a1, *(_DWORD *)(v2 + 16), *(_WORD *)(v2 + 20));
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for ArchiveByteStream()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ArchiveByteStream;
  if (!type metadata singleton initialization cache for ArchiveByteStream)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t static ArchiveByteStream.fileStream(fd:automaticClose:)(int a1, char a2)
{
  AAByteStream v2;
  AAByteStream v3;
  uint64_t v4;

  v2 = AAFileStreamOpenWithFD(a1, a2 & 1);
  if (!v2)
    return 0;
  v3 = v2;
  type metadata accessor for ArchiveByteStream();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = 1;
  return v4;
}

uint64_t static ArchiveByteStream.temporaryFileStream()()
{
  AAByteStream v0;
  AAByteStream v1;
  uint64_t v2;

  v0 = AATempFileStreamOpen();
  if (!v0)
    return 0;
  v1 = v0;
  type metadata accessor for ArchiveByteStream();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 24) = 1;
  return v2;
}

AAByteStream_impl *static ArchiveByteStream.compressionStream(using:writingTo:blockSize:flags:threadCount:)(AACompressionAlgorithm *a1, uint64_t a2, size_t a3, AAFlagSet *a4, uint64_t a5)
{
  AACompressionAlgorithm v8;
  AAFlagSet v9;
  AAByteStream_impl *result;
  AAByteStream v11;
  AAByteStream v12;
  uint64_t v13;

  v8 = *a1;
  v9 = *a4;
  swift_beginAccess();
  result = *(AAByteStream_impl **)(a2 + 16);
  if (!result)
    goto LABEL_10;
  if (a5 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a5 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  v11 = AACompressionOutputStreamOpen(result, v8, a3, v9, a5);
  if (!v11)
    return 0;
  v12 = v11;
  type metadata accessor for ArchiveByteStream();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v13 + 16) = v12;
  *(_BYTE *)(v13 + 24) = 1;
  return (AAByteStream_impl *)v13;
}

uint64_t static ArchiveByteStream.compressionStream(appendingTo:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static ArchiveByteStream.compressionStream(appendingTo:flags:threadCount:)(a1, a2, a3, MEMORY[0x24BED2A98]);
}

uint64_t static ArchiveByteStream.decompressionStream(readingFrom:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static ArchiveByteStream.compressionStream(appendingTo:flags:threadCount:)(a1, a2, a3, MEMORY[0x24BED2B58]);
}

uint64_t static ArchiveByteStream.compressionStream(appendingTo:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_beginAccess();
  result = *(_QWORD *)(a1 + 16);
  if (!result)
    goto LABEL_10;
  if (a3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a3 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  v8 = a4();
  if (!v8)
    return 0;
  v9 = v8;
  type metadata accessor for ArchiveByteStream();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v10 + 16) = v9;
  *(_BYTE *)(v10 + 24) = 1;
  return v10;
}

uint64_t static ArchiveByteStream.sharedBufferPipe(capacity:)(uint64_t result)
{
  size_t v1;
  AAByteStream *v2;
  uint64_t v3;
  AAByteStream v4;
  AAByteStream v5;
  uint64_t v6;

  if (result < 1)
  {
    __break(1u);
  }
  else
  {
    v1 = result;
    v2 = (AAByteStream *)swift_slowAlloc();
    if (AASharedBufferPipeOpen(v2, v2 + 1, v1))
      return 0;
    v4 = *v2;
    type metadata accessor for ArchiveByteStream();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v3 + 16) = v4;
    *(_BYTE *)(v3 + 24) = 1;
    v5 = v2[1];
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v6 + 16) = v5;
    *(_BYTE *)(v6 + 24) = 1;
    MEMORY[0x2207DD50C](v2, -1, -1);
    return v3;
  }
  return result;
}

uint64_t static ArchiveByteStream.process(readingFrom:writingTo:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  AAByteStream_impl *v5;
  AAByteStream_impl *v6;
  off_t v7;
  _BYTE *v8;

  result = swift_beginAccess();
  v5 = *(AAByteStream_impl **)(a1 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_7;
  }
  result = swift_beginAccess();
  v6 = *(AAByteStream_impl **)(a2 + 16);
  if (!v6)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v7 = AAByteStreamProcess(v5, v6);
  if (v7 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v8 = 0;
    swift_willThrow();
  }
  return v7;
}

AAByteStream_impl *specialized static ArchiveByteStream.randomAccessDecompressionStream(readingFrom:allocationLimit:flags:threadCount:)(AAByteStream_impl *result, int64_t a2, AAFlagSet *a3, uint64_t a4)
{
  AAByteStream_impl *v6;
  AAFlagSet v7;
  AAByteStream v8;
  AAByteStream v9;
  uint64_t v10;

  if (a2 < -1)
    goto LABEL_11;
  v6 = result;
  v7 = *a3;
  swift_beginAccess();
  result = (AAByteStream_impl *)*((_QWORD *)v6 + 2);
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if (a4 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (a4 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v8 = AADecompressionRandomAccessInputStreamOpen(result, a2, v7, a4);
  if (!v8)
    return 0;
  v9 = v8;
  type metadata accessor for ArchiveByteStream();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v10 + 16) = v9;
  *(_BYTE *)(v10 + 24) = 1;
  return (AAByteStream_impl *)v10;
}

ValueMetadata *type metadata accessor for _AAByteStreamTraits()
{
  return &type metadata for _AAByteStreamTraits;
}

uint64_t type metadata completion function for ArchiveByteStream()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ArchiveByteStream()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveByteStream.read(into:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ArchiveByteStream.read(into:atOffset:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ArchiveByteStream.write(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ArchiveByteStream.write(from:atOffset:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ArchiveByteStream.seek(toOffset:relativeTo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ArchiveByteStream.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ArchiveByteStream.close()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

void static ArchiveHeader.FieldType.flag.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveHeader.FieldType.uint.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveHeader.FieldType.string.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ArchiveHeader.FieldType.hash.getter(_DWORD *a1@<X8>)
{
  *a1 = 3;
}

void static ArchiveHeader.FieldType.timespec.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ArchiveHeader.FieldType.blob.getter(_DWORD *a1@<X8>)
{
  *a1 = 5;
}

uint64_t ArchiveHeader.FieldType.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveHeader.FieldType.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveHeader.FieldType.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveHeader.FieldType.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ArchiveHeader.FieldType.description.getter()
{
  _DWORD *v0;
  uint64_t result;

  result = 1734437990;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      result = 1953393013;
      break;
    case 2:
      result = 0x676E69727473;
      break;
    case 3:
      result = 1752392040;
      break;
    case 4:
      result = 0x63657073656D6974;
      break;
    case 5:
      result = 1651469410;
      break;
    default:
      result = 4144959;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.FieldType and conformance ArchiveHeader.FieldType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader.FieldType and conformance ArchiveHeader.FieldType;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.FieldType and conformance ArchiveHeader.FieldType)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader.FieldType, &type metadata for ArchiveHeader.FieldType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.FieldType and conformance ArchiveHeader.FieldType);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.FieldType()
{
  return &type metadata for ArchiveHeader.FieldType;
}

uint64_t _AAObjectWrapper.init(object:owned:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;

  v5 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 96);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(v5, a1, AssociatedTypeWitness);
  *(_BYTE *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 104)) = a2;
  return v2;
}

char *_AAObjectWrapper.deinit()
{
  char *v0;
  char *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v1 = v0;
  v2 = *(_QWORD **)v0;
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v4 = v2[11];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - v8;
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  if ((v1[v2[13]] & 1) != 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v9, &v1[v2[12]], AssociatedTypeWitness);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v9, 0, 1, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v3, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v2 = *(_QWORD **)v1;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(&v1[v2[12]], AssociatedTypeWitness);
  return v1;
}

uint64_t _AAOptionalObjectWrapper.init(object:owned:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;

  v5 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 96);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v5, 1, 1, AssociatedTypeWitness);
  swift_beginAccess();
  v7 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, a1, v7);
  swift_endAccess();
  *(_BYTE *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 104)) = a2;
  return v2;
}

_QWORD *_AAOptionalObjectWrapper.deinit()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  char *v10;
  void (*v11)(_BYTE *, uint64_t);
  _BYTE v13[24];

  v1 = v0;
  v2 = (_QWORD *)*v0;
  v3 = *(_QWORD *)(*v0 + 80);
  v4 = v2[11];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = &v13[-v8];
  if ((*((_BYTE *)v1 + v2[13]) & 1) != 0)
  {
    v10 = (char *)v1 + v2[12];
    swift_beginAccess();
    (*(void (**)(_BYTE *, char *, uint64_t))(v7 + 16))(v9, v10, v6);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v9, v3, v4);
    v11 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v11(v9, v6);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v9, 1, 1, AssociatedTypeWitness);
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v7 + 40))(v10, v9, v6);
    swift_endAccess();
    v2 = (_QWORD *)*v1;
  }
  else
  {
    v11 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
  }
  v11((_BYTE *)v1 + v2[12], v6);
  return v1;
}

uint64_t _AAObjectWrapper.__allocating_init(object:owned:)(uint64_t a1, uint64_t a2)
{
  return _AAObjectWrapper.__allocating_init(object:owned:)(a1, a2, (void (*)(uint64_t, uint64_t))_AAObjectWrapper.init(object:owned:));
}

uint64_t _AAObjectWrapper.__deallocating_deinit()
{
  return _AAObjectWrapper.__deallocating_deinit((void (*)(void))_AAObjectWrapper.deinit);
}

uint64_t _AAOptionalObjectWrapper.__allocating_init(object:owned:)(uint64_t a1, uint64_t a2)
{
  return _AAObjectWrapper.__allocating_init(object:owned:)(a1, a2, (void (*)(uint64_t, uint64_t))_AAOptionalObjectWrapper.init(object:owned:));
}

uint64_t _AAObjectWrapper.__allocating_init(object:owned:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;

  v6 = swift_allocObject();
  a3(a1, a2);
  return v6;
}

uint64_t _AAOptionalObjectWrapper.__deallocating_deinit()
{
  return _AAObjectWrapper.__deallocating_deinit((void (*)(void))_AAOptionalObjectWrapper.deinit);
}

uint64_t _AAOptionalObjectWrapperWithFilter.__allocating_init(object:owned:messageProc:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  _AAOptionalObjectWrapperWithFilter.init(object:owned:messageProc:)(a1, a2, a3);
  return v6;
}

uint64_t _AAOptionalObjectWrapperWithFilter.init(object:owned:messageProc:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;

  v7 = v3 + *(_QWORD *)(*(_QWORD *)v3 + 96);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v7, 1, 1, AssociatedTypeWitness);
  swift_beginAccess();
  v9 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, a1, v9);
  swift_endAccess();
  *(_BYTE *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 104)) = a2;
  *(_QWORD *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 112)) = a3;
  return v3;
}

_QWORD *_AAOptionalObjectWrapperWithFilter.deinit()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  char *v10;
  void (*v11)(_BYTE *, uint64_t);
  _BYTE v13[24];

  v1 = v0;
  v2 = (_QWORD *)*v0;
  v3 = *(_QWORD *)(*v0 + 80);
  v4 = v2[11];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = &v13[-v8];
  if ((*((_BYTE *)v1 + v2[13]) & 1) != 0)
  {
    v10 = (char *)v1 + v2[12];
    swift_beginAccess();
    (*(void (**)(_BYTE *, char *, uint64_t))(v7 + 16))(v9, v10, v6);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v9, v3, v4);
    v11 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v11(v9, v6);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(v9, 1, 1, AssociatedTypeWitness);
    swift_beginAccess();
    (*(void (**)(char *, _BYTE *, uint64_t))(v7 + 40))(v10, v9, v6);
    swift_endAccess();
    v2 = (_QWORD *)*v1;
  }
  else
  {
    v11 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
  }
  v11((_BYTE *)v1 + v2[12], v6);
  swift_release();
  return v1;
}

uint64_t _AAOptionalObjectWrapperWithFilter.__deallocating_deinit()
{
  return _AAObjectWrapper.__deallocating_deinit((void (*)(void))_AAOptionalObjectWrapperWithFilter.deinit);
}

uint64_t _AAObjectWrapper.__deallocating_deinit(void (*a1)(void))
{
  a1();
  return swift_deallocClassInstance();
}

uint64_t dispatch thunk of _AAEncodableProtocol.init(withAAEncodedData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of _AAEncodableProtocol.withAAEncodedData<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of static _AAObjectTraits.aaDestroy(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t type metadata completion function for _AAObjectWrapper()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for _AAObjectWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _AAObjectWrapper);
}

uint64_t method lookup function for _AAObjectWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _AAObjectWrapper.__allocating_init(object:owned:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata completion function for _AAOptionalObjectWrapper()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for _AAOptionalObjectWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _AAOptionalObjectWrapper);
}

uint64_t method lookup function for _AAOptionalObjectWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata completion function for _AAOptionalObjectWrapperWithFilter()
{
  uint64_t result;
  unint64_t v1;

  swift_getAssociatedTypeWitness();
  result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for _AAOptionalObjectWrapperWithFilter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _AAOptionalObjectWrapperWithFilter);
}

uint64_t method lookup function for _AAOptionalObjectWrapperWithFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _AAOptionalObjectWrapperWithFilter.__allocating_init(object:owned:messageProc:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2207DD464](a1, v6, a5);
}

void static ArchiveFlags.ignoreOperationNotPermitted.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveFlags.archiveDeduplicateData.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ArchiveFlags.replaceAttributes.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static ArchiveFlags.extractNoAutoDeduplicate.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static ArchiveFlags.extractNoAutoSparse.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

uint64_t static ArchiveFlags.verbosity(level:)@<X0>(uint64_t result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v2;

  v2 = 0xC000000000000000;
  if (result == 2)
    v2 = 0x8000000000000000;
  if (result == 1)
    v2 = 0x4000000000000000;
  if (result <= 0)
    v2 = 0;
  *a2 = v2;
  return result;
}

uint64_t ArchiveFlags.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ArchiveFlags.rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveFlags.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

void ArchiveFlags.init()(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t ArchiveFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveFlags and conformance ArchiveFlags()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags;
  if (!lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveFlags, &type metadata for ArchiveFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags;
  if (!lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveFlags, &type metadata for ArchiveFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags;
  if (!lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveFlags, &type metadata for ArchiveFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags;
  if (!lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveFlags, &type metadata for ArchiveFlags);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveFlags and conformance ArchiveFlags);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ArchiveFlags()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ArchiveFlags()
{
  Swift::UInt64 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ArchiveFlags()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance ArchiveFlags@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveFlags(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *protocol witness for SetAlgebra.union(_:) in conformance ArchiveFlags@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.intersection(_:) in conformance ArchiveFlags@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance ArchiveFlags@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance ArchiveFlags(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *protocol witness for SetAlgebra.remove(_:) in conformance ArchiveFlags@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance ArchiveFlags@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance ArchiveFlags(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance ArchiveFlags(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance ArchiveFlags(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance ArchiveFlags@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance ArchiveFlags(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance ArchiveFlags(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance ArchiveFlags(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance ArchiveFlags()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance ArchiveFlags()
{
  return SetAlgebra.init<A>(_:)();
}

_QWORD *protocol witness for SetAlgebra.subtract(_:) in conformance ArchiveFlags(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance ArchiveFlags@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ArchiveFlags(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

ValueMetadata *type metadata accessor for ArchiveFlags()
{
  return &type metadata for ArchiveFlags;
}

uint64_t static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  return specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)(a1, a2, a3, a4, a5, MEMORY[0x24BED2B68]);
}

uint64_t static ArchiveStream.decodeStream(readingFrom:selectUsing:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  return specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)(a1, a2, a3, a4, a5, MEMORY[0x24BED2B50]);
}

uint64_t protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAArchiveStreamTraits(AAArchiveStream *a1)
{
  return AAArchiveStreamClose(*a1);
}

uint64_t ArchiveStream.writeHeader(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  _BYTE *v4;

  swift_beginAccess();
  result = *(_QWORD *)(v1 + 16);
  if (result)
  {
    result = AAArchiveStreamWriteHeader((AAArchiveStream)result, *(AAHeader *)(a1 + 16));
    if ((_DWORD)result)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *v4 = 0;
      return swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ArchiveStream.writeBlob(key:from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveStream.writeBlob(key:from:)(a1, a2, a3, MEMORY[0x24BED2A08]);
}

uint64_t ArchiveStream.readHeader()()
{
  uint64_t v0;
  AAArchiveStream_impl *v1;
  int v2;
  AAHeader v3;
  uint64_t result;
  _BYTE *v5;
  AAHeader header[2];

  header[1] = *(AAHeader *)MEMORY[0x24BDAC8D0];
  header[0] = 0;
  swift_beginAccess();
  v1 = *(AAArchiveStream_impl **)(v0 + 16);
  if (!v1)
    __break(1u);
  v2 = AAArchiveStreamReadHeader(v1, header);
  if (v2 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v5 = 0;
    return swift_willThrow();
  }
  v3 = header[0];
  if (v2)
  {
    if (header[0])
    {
      type metadata accessor for ArchiveHeader();
      result = swift_allocObject();
      *(_QWORD *)(result + 16) = v3;
      *(_BYTE *)(result + 24) = 1;
      return result;
    }
  }
  else if (!header[0])
  {
    return 0;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveStream.readBlob(key:into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveStream.writeBlob(key:from:)(a1, a2, a3, MEMORY[0x24BED29F8]);
}

uint64_t ArchiveStream.writeBlob(key:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t result;
  _BYTE *v8;

  swift_beginAccess();
  result = *(_QWORD *)(v4 + 16);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (!a2)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  result = a4();
  if ((_DWORD)result)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v8 = 0;
    return swift_willThrow();
  }
  return result;
}

Swift::Void __swiftcall ArchiveStream.cancel()()
{
  uint64_t v0;
  AAArchiveStream_impl *v1;

  swift_beginAccess();
  v1 = *(AAArchiveStream_impl **)(v0 + 16);
  if (v1)
    AAArchiveStreamCancel(v1);
  else
    __break(1u);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ArchiveStream.close()()
{
  uint64_t v0;
  AAArchiveStream_impl *v1;
  int v2;
  _BYTE *v3;

  swift_beginAccess();
  v1 = *(AAArchiveStream_impl **)(v0 + 16);
  if (v1)
  {
    v2 = AAArchiveStreamClose(v1);
    *(_QWORD *)(v0 + 16) = 0;
    if (v2)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *v3 = 0;
      swift_willThrow();
    }
  }
}

uint64_t ArchiveStream.__allocating_init(object:owned:messageProc:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v6 + 16) = a1;
  *(_BYTE *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  return v6;
}

uint64_t ArchiveStream.init(object:owned:messageProc:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = a1;
  *(_BYTE *)(v3 + 24) = a2;
  *(_QWORD *)(v3 + 32) = a3;
  return v3;
}

uint64_t ArchiveStream.deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
  {
    swift_beginAccess();
    AAArchiveStreamClose(*(AAArchiveStream *)(v0 + 16));
    *(_QWORD *)(v0 + 16) = 0;
  }
  swift_release();
  return v0;
}

uint64_t ArchiveStream.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
  {
    swift_beginAccess();
    AAArchiveStreamClose(*(AAArchiveStream *)(v0 + 16));
    *(_QWORD *)(v0 + 16) = 0;
  }
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for _AAOptionalObjectWrapperWithFilter.__allocating_init(object:owned:messageProc:) dispatching to ArchiveStream.__allocating_init(object:owned:messageProc:)(uint64_t *a1, char a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *a1;
  type metadata accessor for ArchiveStream();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v6 + 16) = v5;
  *(_BYTE *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  return v6;
}

uint64_t protocol witness for ArchiveStreamProtocol.writeHeader(_:) in conformance ArchiveStream(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  _BYTE *v5;

  v3 = *v1;
  swift_beginAccess();
  result = *(_QWORD *)(v3 + 16);
  if (result)
  {
    result = AAArchiveStreamWriteHeader((AAArchiveStream)result, *(AAHeader *)(a1 + 16));
    if ((_DWORD)result)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *v5 = 0;
      return swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for ArchiveStreamProtocol.writeBlob(key:from:) in conformance ArchiveStream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveStream.writeBlob(key:from:)(a1, a2, a3);
}

uint64_t protocol witness for ArchiveStreamProtocol.readHeader() in conformance ArchiveStream()
{
  return ArchiveStream.readHeader()();
}

uint64_t protocol witness for ArchiveStreamProtocol.readBlob(key:into:) in conformance ArchiveStream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ArchiveStream.readBlob(key:into:)(a1, a2, a3);
}

void protocol witness for ArchiveStreamProtocol.cancel() in conformance ArchiveStream()
{
  uint64_t *v0;
  uint64_t v1;
  AAArchiveStream_impl *v2;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(AAArchiveStream_impl **)(v1 + 16);
  if (v2)
    AAArchiveStreamCancel(v2);
  else
    __break(1u);
}

void protocol witness for ArchiveStreamProtocol.close() in conformance ArchiveStream()
{
  ArchiveStream.close()();
}

uint64_t ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v8;
  uint64_t (*v9)();
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  AAPathList_impl *v14;

  type metadata accessor for ArchiveHeader._EntryFilterWrapper();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a4;
  v8[3] = a5;
  v9 = @objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  if (!a4)
    v9 = 0;
  v8[4] = v9;
  v10 = type metadata accessor for FilePath();
  (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(a2, 1, v10);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  v11 = FilePath.withCString<A>(_:)();
  if (!v14 || (MEMORY[0x24BDAC7A8](v11), FilePath.withCString<A>(_:)(), AAPathListDestroy(v14), (_DWORD)v14))
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v12 = 0;
    swift_willThrow();
  }
  return swift_release();
}

const char *closure #1 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>(AAFlagSet flags@<X2>, uint64_t n_threads@<X3>, const char *result@<X0>, uint64_t a4@<X1>, const char **a5@<X8>)
{
  void *v7;

  if (n_threads < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (n_threads > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (*(_QWORD *)(a4 + 16))
    v7 = (void *)a4;
  else
    v7 = 0;
  result = (const char *)AAPathListCreateWithDirectoryContents(result, 0, v7, *(AAEntryMessageProc *)(a4 + 32), flags, n_threads);
  *a5 = result;
  return result;
}

uint64_t closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD v16[2];

  v16[1] = a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FilePath?);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of FilePath?(a2, (uint64_t)v12);
  v13 = type metadata accessor for FilePath();
  v14 = *(_QWORD *)(v13 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x24BDAC7A8]();
    v16[-4] = a1;
    v16[-3] = a3;
    v16[-2] = a4;
    v16[-1] = a5;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
    FilePath.withCString<A>(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  }
  return result;
}

const char *closure #1 in closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>(const char *path@<X0>, char *dir@<X1>, AAFlagSet flags@<X3>, uint64_t n_threads@<X4>, _QWORD *a5@<X2>, const char **a6@<X8>)
{
  int v6;
  int (__cdecl *v9)(void *, AAEntryMessage, const char *, void *);

  v6 = n_threads;
  if (n_threads < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (n_threads > 0x7FFFFFFF)
  {
LABEL_7:
    __break(1u);
    return path;
  }
  v9 = (int (__cdecl *)(void *, AAEntryMessage, const char *, void *))a5[4];
  if (!a5[2])
    a5 = 0;
  path = (const char *)AAPathListCreateWithDirectoryContents(dir, path, a5, v9, flags, v6);
  *a6 = path;
  return path;
}

AAArchiveStream_impl *closure #3 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>(const char *a1@<X0>, uint64_t a2@<X1>, AAPathList *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, AAFlagSet a6@<X5>, uint64_t a7@<X6>, _DWORD *a8@<X8>)
{
  AAArchiveStream_impl *result;
  void *v17;

  swift_beginAccess();
  result = *(AAArchiveStream_impl **)(a2 + 16);
  if (!result)
    goto LABEL_11;
  if (!*a3)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if (a7 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (a7 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (*(_QWORD *)(a5 + 16))
    v17 = (void *)a5;
  else
    v17 = 0;
  result = (AAArchiveStream_impl *)AAArchiveStreamWritePathList(result, *a3, *(AAFieldKeySet *)(a4 + 16), a1, v17, *(AAEntryMessageProc *)(a5 + 32), a6, a7);
  *a8 = (_DWORD)result;
  return result;
}

uint64_t static ArchiveStream.process(readingFrom:writingTo:selectUsing:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, AAFlagSet *a5, uint64_t a6)
{
  _QWORD *v11;
  _QWORD *v12;
  int (__cdecl *v13)(void *, AAEntryMessage, const char *, void *);
  uint64_t result;
  AAArchiveStream_impl *v15;
  AAArchiveStream_impl *v16;
  void *v17;
  ssize_t v18;
  _BYTE *v19;
  AAFlagSet flags;

  flags = *a5;
  type metadata accessor for ArchiveHeader._EntryFilterWrapper();
  v11 = (_QWORD *)swift_allocObject();
  v12 = v11;
  v11[2] = a3;
  v11[3] = a4;
  if (a3)
    v13 = (int (__cdecl *)(void *, AAEntryMessage, const char *, void *))@objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  else
    v13 = 0;
  v11[4] = v13;
  result = swift_beginAccess();
  v15 = *(AAArchiveStream_impl **)(a1 + 16);
  if (!v15)
    goto LABEL_16;
  result = swift_beginAccess();
  v16 = *(AAArchiveStream_impl **)(a2 + 16);
  if (!v16)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  if (a3)
    v17 = v12;
  else
    v17 = 0;
  if (a6 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a6 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a3);
  v18 = AAArchiveStreamProcess(v15, v16, v17, v13, flags, a6);
  if (v18 < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v19 = 0;
    swift_willThrow();
  }
  swift_release();
  return v18;
}

const char *closure #1 in static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)@<X0>(AAFlagSet flags@<X2>, uint64_t n_threads@<X3>, const char *result@<X0>, _QWORD *a4@<X1>, const char **a5@<X8>)
{
  int v5;
  int (__cdecl *v8)(void *, AAEntryMessage, const char *, void *);

  v5 = n_threads;
  if (n_threads < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (n_threads > 0x7FFFFFFF)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v8 = (int (__cdecl *)(void *, AAEntryMessage, const char *, void *))a4[4];
  if (!a4[2])
    a4 = 0;
  result = (const char *)AAExtractArchiveOutputStreamOpen(result, a4, v8, flags, v5);
  *a5 = result;
  return result;
}

uint64_t specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  return specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)(a1, a2, a3, a4, a5, MEMORY[0x24BED2B68]);
}

uint64_t specialized static ArchiveStream.decodeStream(readingFrom:selectUsing:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  return specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)(a1, a2, a3, a4, a5, MEMORY[0x24BED2B50]);
}

uint64_t specialized static ArchiveStream.encodeStream(writingTo:selectUsing:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t (*a6)(uint64_t, _QWORD *, uint64_t (*)(), uint64_t, uint64_t))
{
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t (*v14)();
  uint64_t result;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v11 = *a4;
  type metadata accessor for ArchiveHeader._EntryFilterWrapper();
  v12 = (_QWORD *)swift_allocObject();
  v13 = v12;
  v12[2] = a2;
  v12[3] = a3;
  if (a2)
    v14 = @objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  else
    v14 = 0;
  v12[4] = v14;
  result = swift_beginAccess();
  v16 = *(_QWORD *)(a1 + 16);
  if (!v16)
    goto LABEL_16;
  if (a2)
    v17 = v13;
  else
    v17 = 0;
  if (a5 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a5 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a2);
  v18 = a6(v16, v17, v14, v11, a5);
  if (v18)
  {
    v19 = v18;
    type metadata accessor for ArchiveStream();
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v20 + 16) = v19;
    *(_BYTE *)(v20 + 24) = 1;
    *(_QWORD *)(v20 + 32) = v13;
  }
  else
  {
    swift_release();
    return 0;
  }
  return v20;
}

uint64_t specialized static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v10;

  type metadata accessor for ArchiveHeader._EntryFilterWrapper();
  v5 = (_QWORD *)swift_allocObject();
  v6 = v5;
  v5[2] = a2;
  v5[3] = a3;
  v7 = @objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  if (!a2)
    v7 = 0;
  v5[4] = v7;
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a2);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  FilePath.withCString<A>(_:)();
  if (v10)
  {
    type metadata accessor for ArchiveStream();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v8 + 16) = v10;
    *(_BYTE *)(v8 + 24) = 1;
    *(_QWORD *)(v8 + 32) = v6;
  }
  else
  {
    swift_release();
    return 0;
  }
  return v8;
}

uint64_t specialized static ArchiveStream.convertStream(writingTo:insertKeySet:removeKeySet:selectUsing:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, AAFlagSet *a6, uint64_t a7)
{
  AAFlagSet v13;
  _QWORD *v14;
  _QWORD *v15;
  int (__cdecl *v16)(void *, AAEntryMessage, const char *, void *);
  uint64_t result;
  AAArchiveStream_impl *v18;
  void *v19;
  AAFieldKeySet_impl *v20;
  AAFieldKeySet_impl *v21;
  AAArchiveStream v22;
  AAArchiveStream v23;
  uint64_t v24;

  v13 = *a6;
  type metadata accessor for ArchiveHeader._EntryFilterWrapper();
  v14 = (_QWORD *)swift_allocObject();
  v15 = v14;
  v14[2] = a4;
  v14[3] = a5;
  if (a4)
    v16 = (int (__cdecl *)(void *, AAEntryMessage, const char *, void *))@objc closure #1 in ArchiveHeader._EntryFilterWrapper.init(_:);
  else
    v16 = 0;
  v14[4] = v16;
  result = swift_beginAccess();
  v18 = *(AAArchiveStream_impl **)(a1 + 16);
  if (!v18)
    goto LABEL_16;
  if (a4)
    v19 = v15;
  else
    v19 = 0;
  if (a7 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a7 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  v20 = *(AAFieldKeySet_impl **)(a2 + 16);
  v21 = *(AAFieldKeySet_impl **)(a3 + 16);
  outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(a4);
  v22 = AAConvertArchiveOutputStreamOpen(v18, v20, v21, v19, v16, v13, a7);
  if (v22)
  {
    v23 = v22;
    type metadata accessor for ArchiveStream();
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v24 + 16) = v23;
    *(_BYTE *)(v24 + 24) = 1;
    *(_QWORD *)(v24 + 32) = v15;
  }
  else
  {
    swift_release();
    return 0;
  }
  return v24;
}

const char *partial apply for closure #1 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>(const char *a1@<X0>, const char **a2@<X8>)
{
  uint64_t v2;

  return closure #1 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)(*(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@in_guaranteed ArchiveHeader.EntryMessage, @in_guaranteed FilePath, @in_guaranteed ArchiveHeader.EntryFilterData?) -> (@out ArchiveHeader.EntryMessageStatus))?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

AAArchiveStream_impl *partial apply for closure #3 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>(const char *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;

  return closure #3 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)(a1, *(_QWORD *)(v2 + 16), *(AAPathList **)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), a2);
}

uint64_t partial apply for closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)(a1, v2[2], v2[3], v2[4], v2[5], a2);
}

ValueMetadata *type metadata accessor for _AAArchiveStreamTraits()
{
  return &type metadata for _AAArchiveStreamTraits;
}

uint64_t type metadata accessor for ArchiveStream()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ArchiveStream;
  if (!type metadata singleton initialization cache for ArchiveStream)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for ArchiveStream()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ArchiveStream()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveStream.writeHeader(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ArchiveStream.writeBlob(key:from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ArchiveStream.readHeader()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ArchiveStream.readBlob(key:into:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ArchiveStream.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ArchiveStream.close()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t outlined init with copy of FilePath?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FilePath?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

const char *partial apply for closure #1 in closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)@<X0>(const char *a1@<X0>, const char **a2@<X8>)
{
  uint64_t v2;

  return closure #1 in closure #2 in ArchiveStream.writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:threadCount:)(a1, *(char **)(v2 + 16), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD **)(v2 + 24), a2);
}

const char *partial apply for closure #1 in static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)@<X0>(const char *a1@<X0>, const char **a2@<X8>)
{
  uint64_t v2;

  return closure #1 in static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)(*(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a1, *(_QWORD **)(v2 + 16), a2);
}

uint64_t static ArchiveStream.customStream<A>(instance:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];

  v6 = type metadata accessor for ArchiveStream.CustomArchiveStreamBridge();
  v10[0] = a1;
  result = specialized ArchiveStream.CustomArchiveStreamBridge.__allocating_init(_:)((uint64_t)v10, v6, a2, a3);
  if (!result)
    return 0;
  v8 = *(_QWORD *)(result + 56);
  if (v8)
  {
    swift_release();
    type metadata accessor for ArchiveStream();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v9 + 16) = v8;
    *(_BYTE *)(v9 + 24) = 1;
    *(_QWORD *)(v9 + 32) = 0;
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ArchiveStream.CustomArchiveStreamBridge()
{
  return objc_opt_self();
}

uint64_t closure #1 in ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _OWORD v3[2];
  uint64_t v4;

  if (result)
  {
    v1 = result;
    v2 = result + 16;
    v4 = 0;
    memset(v3, 0, sizeof(v3));
    swift_beginAccess();
    outlined assign with take of ArchiveStreamProtocol?((uint64_t)v3, v2);
    swift_endAccess();
    *(_QWORD *)(v1 + 56) = 0;
    swift_release();
    return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t @objc closure #2 in ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v1 = swift_retain() + 16;
    swift_beginAccess();
    result = outlined init with copy of ArchiveStreamProtocol?(v1, (uint64_t)v4);
    v2 = v5;
    if (v5)
    {
      v3 = v6;
      __swift_project_boxed_opaque_existential_1(v4, v5);
      (*(void (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #3 in ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v3 = swift_retain() + 16;
    swift_beginAccess();
    result = outlined init with copy of ArchiveStreamProtocol?(v3, (uint64_t)v6);
    if (v7)
    {
      v4 = v8;
      __swift_project_boxed_opaque_existential_1(v6, v7);
      type metadata accessor for ArchiveHeader();
      v5 = swift_allocObject();
      *(_QWORD *)(v5 + 16) = a2;
      *(_BYTE *)(v5 + 24) = 0;
      (*(void (**)(void))(v4 + 8))();
      swift_release();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #4 in ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unsigned int v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  if (!a1)
  {
    __break(1u);
    goto LABEL_9;
  }
  v7 = swift_retain() + 16;
  swift_beginAccess();
  outlined init with copy of ArchiveStreamProtocol?(v7, (uint64_t)v12);
  v8 = v13;
  if (!v13)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  if (!HIBYTE(a2) && (char)a2 >= 32 && (__int16)a2 >> 8 >= 32 && (int)(a2 << 8) >> 24 > 31)
  {
    v11 = a2;
    (*(void (**)(unsigned int *, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16))(&v11, a3, a3 + a4, v8, v9);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    return 0;
  }
LABEL_10:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t closure #5 in ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t result, AAHeader *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  if (!result)
  {
    __break(1u);
    goto LABEL_11;
  }
  v3 = swift_retain() + 16;
  swift_beginAccess();
  result = outlined init with copy of ArchiveStreamProtocol?(v3, (uint64_t)v7);
  v4 = v8;
  if (!v8)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (v6)
  {
    if (*a2)
      AAHeaderAssign(*a2, *(AAHeader *)(v6 + 16));
    else
      *a2 = AAHeaderClone(*(AAHeader *)(v6 + 16));
    swift_release();
    swift_release();
    return 1;
  }
  else
  {
    swift_release();
    return 0;
  }
}

uint64_t ArchiveStream.CustomArchiveStreamBridge.__deallocating_deinit()
{
  uint64_t v0;

  outlined destroy of ArchiveStreamProtocol?(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t specialized ArchiveStream.CustomArchiveStreamBridge.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  AAArchiveStream v8;
  AAArchiveStream_impl *v9;
  _BYTE v11[40];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a3;
  v14 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  v8 = AACustomArchiveStreamOpen();
  if (v8)
  {
    v9 = v8;
    swift_retain();
    AACustomArchiveStreamSetData(v9, (void *)a2);
    AACustomArchiveStreamSetCloseProc(v9, (AAArchiveStreamCloseProc)@objc closure #1 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    AACustomArchiveStreamSetCancelProc(v9, (AAArchiveStreamCancelProc)@objc closure #2 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    AACustomArchiveStreamSetWriteHeaderProc(v9, (AAArchiveStreamWriteHeaderProc)@objc closure #3 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    AACustomArchiveStreamSetWriteBlobProc(v9, (AAArchiveStreamWriteBlobProc)@objc closure #4 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    AACustomArchiveStreamSetReadHeaderProc(v9, (AAArchiveStreamReadHeaderProc)@objc closure #5 in ArchiveStream.CustomArchiveStreamBridge.init(_:));
    outlined init with take of ArchiveStreamProtocol(&v12, (uint64_t)v11);
    swift_beginAccess();
    outlined assign with take of ArchiveStreamProtocol?((uint64_t)v11, a2 + 16);
    swift_endAccess();
    *(_QWORD *)(a2 + 56) = v9;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
    swift_release();
    return 0;
  }
  return a2;
}

uint64_t specialized ArchiveStream.CustomArchiveStreamBridge.__allocating_init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ArchiveStream.CustomArchiveStreamBridge();
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return specialized ArchiveStream.CustomArchiveStreamBridge.init(_:)((uint64_t)v9, v10, a3, a4);
}

uint64_t outlined destroy of ArchiveStreamProtocol?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with take of ArchiveStreamProtocol(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t outlined assign with take of ArchiveStreamProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ArchiveStreamProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t closure #1 in ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  if (result)
  {
    v1 = result;
    v2 = result + 16;
    swift_beginAccess();
    outlined init with copy of ArchiveByteStreamProtocol?(v2, (uint64_t)&v6);
    v3 = *((_QWORD *)&v7 + 1);
    outlined destroy of ArchiveByteStreamProtocol?((uint64_t)&v6);
    if (!v3)
    {
LABEL_5:
      v8 = 0;
      v6 = 0u;
      v7 = 0u;
      swift_beginAccess();
      outlined assign with take of ArchiveByteStreamProtocol?((uint64_t)&v6, v2);
      swift_endAccess();
      *(_QWORD *)(v1 + 56) = 0;
      swift_release();
      return 0;
    }
    result = outlined init with copy of ArchiveByteStreamProtocol?(v2, (uint64_t)&v6);
    v4 = *((_QWORD *)&v7 + 1);
    if (*((_QWORD *)&v7 + 1))
    {
      v5 = v8;
      __swift_project_boxed_opaque_existential_1(&v6, *((uint64_t *)&v7 + 1));
      (*(void (**)(uint64_t, uint64_t))(v5 + 56))(v4, v5);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
      goto LABEL_5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #2 in ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  if (result)
  {
    v5 = swift_retain() + 16;
    swift_beginAccess();
    result = outlined init with copy of ArchiveByteStreamProtocol?(v5, (uint64_t)v9);
    v6 = v10;
    if (v10)
    {
      v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8))(a2, a2 + a3, v6, v7);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      return v8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #3 in ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  if (result)
  {
    v7 = swift_retain() + 16;
    swift_beginAccess();
    result = outlined init with copy of ArchiveByteStreamProtocol?(v7, (uint64_t)v11);
    v8 = v12;
    if (v12)
    {
      v9 = v13;
      __swift_project_boxed_opaque_existential_1(v11, v12);
      v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16))(a2, a2 + a3, a4, v8, v9);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      return v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #4 in ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  if (result)
  {
    v5 = swift_retain() + 16;
    swift_beginAccess();
    result = outlined init with copy of ArchiveByteStreamProtocol?(v5, (uint64_t)v9);
    v6 = v10;
    if (v10)
    {
      v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 24))(a2, a2 + a3, v6, v7);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      return v8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #5 in ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  if (result)
  {
    v7 = swift_retain() + 16;
    swift_beginAccess();
    result = outlined init with copy of ArchiveByteStreamProtocol?(v7, (uint64_t)v11);
    v8 = v12;
    if (v12)
    {
      v9 = v13;
      __swift_project_boxed_opaque_existential_1(v11, v12);
      v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 32))(a2, a2 + a3, a4, v8, v9);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      return v10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t @objc closure #6 in ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v1 = swift_retain() + 16;
    swift_beginAccess();
    result = outlined init with copy of ArchiveByteStreamProtocol?(v1, (uint64_t)v4);
    v2 = v5;
    if (v5)
    {
      v3 = v6;
      __swift_project_boxed_opaque_existential_1(v4, v5);
      (*(void (**)(uint64_t, uint64_t))(v3 + 48))(v2, v3);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #7 in ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  if (result)
  {
    v5 = swift_retain() + 16;
    swift_beginAccess();
    result = outlined init with copy of ArchiveByteStreamProtocol?(v5, (uint64_t)v9);
    v6 = v10;
    if (v10)
    {
      v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 40))(a2, a3, v6, v7);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      return v8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t ArchiveByteStream.CustomByteStreamBridge.__deallocating_deinit()
{
  uint64_t v0;

  outlined destroy of ArchiveByteStreamProtocol?(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t static ArchiveByteStream.customStream<A>(instance:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];

  v6 = type metadata accessor for ArchiveByteStream.CustomByteStreamBridge();
  v10[0] = a1;
  result = specialized ArchiveByteStream.CustomByteStreamBridge.__allocating_init(_:)((uint64_t)v10, v6, a2, a3);
  if (!result)
    return 0;
  v8 = *(_QWORD *)(result + 56);
  if (v8)
  {
    swift_release();
    type metadata accessor for ArchiveByteStream();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v9 + 16) = v8;
    *(_BYTE *)(v9 + 24) = 0;
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ArchiveByteStream.CustomByteStreamBridge()
{
  return objc_opt_self();
}

uint64_t specialized ArchiveByteStream.CustomByteStreamBridge.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  AAByteStream v8;
  AAByteStream_impl *v9;
  _BYTE v11[40];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a3;
  v14 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  v8 = AACustomByteStreamOpen();
  if (v8)
  {
    v9 = v8;
    swift_retain();
    AACustomByteStreamSetData(v9, (void *)a2);
    AACustomByteStreamSetCloseProc(v9, (AAByteStreamCloseProc)@objc closure #1 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetReadProc(v9, (AAByteStreamReadProc)@objc closure #2 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetPReadProc(v9, (AAByteStreamPReadProc)@objc closure #3 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetWriteProc(v9, (AAByteStreamWriteProc)@objc closure #4 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetPWriteProc(v9, (AAByteStreamPWriteProc)@objc closure #5 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetCancelProc(v9, (AAByteStreamCancelProc)@objc closure #6 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    AACustomByteStreamSetSeekProc(v9, (AAByteStreamSeekProc)@objc closure #7 in ArchiveByteStream.CustomByteStreamBridge.init(_:));
    outlined init with take of ArchiveStreamProtocol(&v12, (uint64_t)v11);
    swift_beginAccess();
    outlined assign with take of ArchiveByteStreamProtocol?((uint64_t)v11, a2 + 16);
    swift_endAccess();
    *(_QWORD *)(a2 + 56) = v9;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
    swift_release();
    return 0;
  }
  return a2;
}

uint64_t specialized ArchiveByteStream.CustomByteStreamBridge.__allocating_init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ArchiveByteStream.CustomByteStreamBridge();
  v10 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  return specialized ArchiveByteStream.CustomByteStreamBridge.init(_:)((uint64_t)v9, v10, a3, a4);
}

uint64_t outlined destroy of ArchiveByteStreamProtocol?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveByteStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined assign with take of ArchiveByteStreamProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveByteStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of ArchiveByteStreamProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArchiveByteStreamProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static ArchiveByteStream._withStream<A>(stream:_:)@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  _BYTE *v9;
  _BYTE *v10;

  if (a1)
  {
    result = a2();
    if (!v4)
    {
      swift_beginAccess();
      result = *(_QWORD *)(a1 + 16);
      if (result)
      {
        result = AAByteStreamClose((AAByteStream)result);
        *(_QWORD *)(a1 + 16) = 0;
        if ((_DWORD)result)
        {
          lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
          swift_allocError();
          *v9 = 0;
          swift_willThrow();
          return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a4, a3);
        }
      }
    }
  }
  else
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v10 = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t static ArchiveByteStream.withFileStream<A>(path:mode:options:permissions:_:)@<X0>(uint64_t (*a1)(void)@<X4>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OpaquePointer?);
  FilePath.withCString<A>(_:)();
  if (v8)
  {
    type metadata accessor for ArchiveByteStream();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v6 + 16) = v8;
    *(_BYTE *)(v6 + 24) = 1;
  }
  else
  {
    v6 = 0;
  }
  static ArchiveByteStream._withStream<A>(stream:_:)(v6, a1, a2, a3);
  return swift_release();
}

AAByteStream _s12AppleArchive0B10ByteStreamC04fileD04path4mode7options11permissionsACSg6System8FilePathV_AJ0K10DescriptorV10AccessModeVAN11OpenOptionsVAJ0K11PermissionsVtFZs13OpaquePointerVSgSPys4Int8VGXEfU_TA_0@<X0>(const char *a1@<X0>, AAByteStream *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in static ArchiveByteStream.fileStream(path:mode:options:permissions:)(a1, *(_DWORD *)(v2 + 16), *(_WORD *)(v2 + 20), a2);
}

uint64_t static ArchiveByteStream.withFileStream<A>(fd:automaticClose:_:)@<X0>(int a1@<W0>, char a2@<W1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  AAByteStream v8;
  AAByteStream v9;
  uint64_t v10;

  v8 = AAFileStreamOpenWithFD(a1, a2 & 1);
  if (v8)
  {
    v9 = v8;
    type metadata accessor for ArchiveByteStream();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v10 + 16) = v9;
    *(_BYTE *)(v10 + 24) = 1;
  }
  else
  {
    v10 = 0;
  }
  static ArchiveByteStream._withStream<A>(stream:_:)(v10, a3, a4, a5);
  return swift_release();
}

uint64_t static ArchiveByteStream.withTemporaryFileStream<A>(_:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  AAByteStream v6;
  AAByteStream v7;
  uint64_t v8;

  v6 = AATempFileStreamOpen();
  if (v6)
  {
    v7 = v6;
    type metadata accessor for ArchiveByteStream();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v8 + 16) = v7;
    *(_BYTE *)(v8 + 24) = 1;
  }
  else
  {
    v8 = 0;
  }
  static ArchiveByteStream._withStream<A>(stream:_:)(v8, a1, a2, a3);
  return swift_release();
}

AAByteStream_impl *static ArchiveByteStream.withCompressionStream<A>(using:writingTo:blockSize:flags:threadCount:_:)@<X0>(AACompressionAlgorithm *a1@<X0>, uint64_t a2@<X1>, size_t a3@<X2>, AAFlagSet *a4@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(void)@<X5>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  AACompressionAlgorithm v14;
  AAFlagSet v15;
  AAByteStream_impl *result;
  AAByteStream v17;
  AAByteStream v18;
  uint64_t v19;

  v14 = *a1;
  v15 = *a4;
  swift_beginAccess();
  result = *(AAByteStream_impl **)(a2 + 16);
  if (!result)
    goto LABEL_10;
  if (a5 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a5 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  v17 = AACompressionOutputStreamOpen(result, v14, a3, v15, a5);
  if (v17)
  {
    v18 = v17;
    type metadata accessor for ArchiveByteStream();
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v19 + 16) = v18;
    *(_BYTE *)(v19 + 24) = 1;
  }
  else
  {
    v19 = 0;
  }
  static ArchiveByteStream._withStream<A>(stream:_:)(v19, a6, a7, a8);
  return (AAByteStream_impl *)swift_release();
}

uint64_t static ArchiveByteStream.withCompressionStream<A>(appendingTo:flags:threadCount:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(void)@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  return static ArchiveByteStream.withCompressionStream<A>(appendingTo:flags:threadCount:_:)(a1, a2, a3, a4, MEMORY[0x24BED2A98], a5);
}

uint64_t static ArchiveByteStream.withDecompressionStream<A>(readingFrom:flags:threadCount:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(void)@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  return static ArchiveByteStream.withCompressionStream<A>(appendingTo:flags:threadCount:_:)(a1, a2, a3, a4, MEMORY[0x24BED2B58], a5);
}

uint64_t static ArchiveByteStream.withCompressionStream<A>(appendingTo:flags:threadCount:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(void)@<X3>, uint64_t a4@<X5>, uint64_t (*a5)(void)@<X6>, uint64_t a6@<X8>)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  swift_beginAccess();
  result = *(_QWORD *)(a1 + 16);
  if (!result)
    goto LABEL_10;
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  v13 = a5();
  if (v13)
  {
    v14 = v13;
    type metadata accessor for ArchiveByteStream();
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = 0;
    swift_beginAccess();
    *(_QWORD *)(v15 + 16) = v14;
    *(_BYTE *)(v15 + 24) = 1;
  }
  else
  {
    v15 = 0;
  }
  static ArchiveByteStream._withStream<A>(stream:_:)(v15, a3, a4, a6);
  return swift_release();
}

uint64_t static ArchiveByteStream.withRandomAccessDecompressionStream<A>(readingFrom:allocationLimit:flags:threadCount:_:)@<X0>(AAByteStream_impl *a1@<X0>, int64_t a2@<X1>, AAFlagSet *a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  AAByteStream_impl *v10;
  AAFlagSet v12;

  v12 = *a3;
  v10 = specialized static ArchiveByteStream.randomAccessDecompressionStream(readingFrom:allocationLimit:flags:threadCount:)(a1, a2, &v12, a4);
  static ArchiveByteStream._withStream<A>(stream:_:)((uint64_t)v10, a5, a6, a7);
  return swift_release();
}

uint64_t static ArchiveByteStream.withStream<A, B>(wrapping:_:)@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v9;

  v9 = static ArchiveByteStream.customStream<A>(instance:)(a1, a3, a5);
  static ArchiveByteStream._withStream<A>(stream:_:)(v9, a2, a4, a6);
  return swift_release();
}

uint64_t ArchiveHeader.FieldKey.init(_:)@<X0>(int *a1@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t result;

  v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v2 + 16) != 4
    || *(_BYTE *)(v2 + 35)
    || *(char *)(v2 + 32) < 32
    || *(char *)(v2 + 33) < 32
    || *(char *)(v2 + 34) <= 31)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v3 = *(unsigned __int8 *)(v2 + 32);
    v4 = *(unsigned __int8 *)(v2 + 33);
    v5 = *(unsigned __int8 *)(v2 + 34);
    result = swift_release();
    *a1 = v3 | (v4 << 8) | (v5 << 16);
  }
  return result;
}

uint64_t ArchiveHeader.FieldKey.description.getter()
{
  int *v0;
  int v1;
  uint64_t inited;
  uint64_t v3;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int8>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220079160;
  *(_WORD *)(inited + 32) = v1;
  *(_BYTE *)(inited + 34) = BYTE2(v1);
  *(_BYTE *)(inited + 35) = 0;
  v3 = specialized String.init(cString:)(inited);
  swift_setDeallocating();
  return v3;
}

BOOL static ArchiveHeader.FieldKey.== infix(_:_:)(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void ArchiveHeader.FieldKey.hash(into:)()
{
  Swift::UInt32 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int ArchiveHeader.FieldKey.hashValue.getter()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveHeader.FieldKey()
{
  int *v0;
  int v1;
  uint64_t inited;
  uint64_t v3;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int8>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220079160;
  *(_WORD *)(inited + 32) = v1;
  *(_BYTE *)(inited + 34) = BYTE2(v1);
  *(_BYTE *)(inited + 35) = 0;
  v3 = specialized String.init(cString:)(inited);
  swift_setDeallocating();
  return v3;
}

uint64_t specialized String.init(cString:)(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 32);
    result += 32;
    if (!v3)
      return static String._fromUTF8Repairing(_:)();
    v4 = 0;
    v5 = v1 - 1;
    v6 = v2 + 33;
    while (v5 != v4)
    {
      if (!*(unsigned __int8 *)(v6 + v4++))
        return static String._fromUTF8Repairing(_:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveHeader.FieldKey and conformance ArchiveHeader.FieldKey()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveHeader.FieldKey and conformance ArchiveHeader.FieldKey;
  if (!lazy protocol witness table cache variable for type ArchiveHeader.FieldKey and conformance ArchiveHeader.FieldKey)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveHeader.FieldKey, &type metadata for ArchiveHeader.FieldKey);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveHeader.FieldKey and conformance ArchiveHeader.FieldKey);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArchiveHeader.FieldKey()
{
  return &type metadata for ArchiveHeader.FieldKey;
}

uint64_t ArchiveEncryptionContext.ChecksumMode.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveEncryptionContext.ChecksumMode.none.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveEncryptionContext.ChecksumMode.murmurhash64.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveEncryptionContext.ChecksumMode.sha256.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t ArchiveEncryptionContext.ChecksumMode.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveEncryptionContext.ChecksumMode.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveEncryptionContext.ChecksumMode.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveEncryptionContext.ChecksumMode.description.getter()
{
  int *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = 0x363532616873;
  v3 = 4144959;
  if (*v0 == 1)
    v3 = 0x616872756D72756DLL;
  if (v1 != 2)
    v2 = v3;
  if (v1)
    return v2;
  else
    return 1701736302;
}

unint64_t lazy protocol witness table accessor for type ArchiveEncryptionContext.ChecksumMode and conformance ArchiveEncryptionContext.ChecksumMode()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveEncryptionContext.ChecksumMode and conformance ArchiveEncryptionContext.ChecksumMode;
  if (!lazy protocol witness table cache variable for type ArchiveEncryptionContext.ChecksumMode and conformance ArchiveEncryptionContext.ChecksumMode)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveEncryptionContext.ChecksumMode, &type metadata for ArchiveEncryptionContext.ChecksumMode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveEncryptionContext.ChecksumMode and conformance ArchiveEncryptionContext.ChecksumMode);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveEncryptionContext.ChecksumMode()
{
  int *v0;
  int v1;
  uint64_t v2;

  v1 = *v0;
  v2 = 1701736302;
  if (*v0)
    v2 = 4144959;
  if (v1 == 1)
    v2 = 0x616872756D72756DLL;
  if (v1 == 2)
    return 0x363532616873;
  else
    return v2;
}

ValueMetadata *type metadata accessor for ArchiveEncryptionContext.ChecksumMode()
{
  return &type metadata for ArchiveEncryptionContext.ChecksumMode;
}

uint64_t ArchiveEncryptionContext.SignatureMode.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveEncryptionContext.SignatureMode.none.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveEncryptionContext.SignatureMode.ecdsa_p256.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t ArchiveEncryptionContext.SignatureMode.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveEncryptionContext.SignatureMode.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveEncryptionContext.SignatureMode.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

uint64_t ArchiveEncryptionContext.SignatureMode.description.getter()
{
  _DWORD *v0;
  uint64_t v1;

  v1 = 4144959;
  if (*v0 == 1)
    v1 = 0x32705F6173646365;
  if (*v0)
    return v1;
  else
    return 1701736302;
}

unint64_t lazy protocol witness table accessor for type ArchiveEncryptionContext.SignatureMode and conformance ArchiveEncryptionContext.SignatureMode()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveEncryptionContext.SignatureMode and conformance ArchiveEncryptionContext.SignatureMode;
  if (!lazy protocol witness table cache variable for type ArchiveEncryptionContext.SignatureMode and conformance ArchiveEncryptionContext.SignatureMode)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveEncryptionContext.SignatureMode, &type metadata for ArchiveEncryptionContext.SignatureMode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveEncryptionContext.SignatureMode and conformance ArchiveEncryptionContext.SignatureMode);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveEncryptionContext.SignatureMode()
{
  _DWORD *v0;
  uint64_t v1;

  v1 = 1701736302;
  if (*v0)
    v1 = 4144959;
  if (*v0 == 1)
    return 0x32705F6173646365;
  else
    return v1;
}

ValueMetadata *type metadata accessor for ArchiveEncryptionContext.SignatureMode()
{
  return &type metadata for ArchiveEncryptionContext.SignatureMode;
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.read(into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.read(into:atOffset:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.write(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.write(from:atOffset:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.seek(toOffset:relativeTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ArchiveByteStreamProtocol.close()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(a1, a2, a3, MEMORY[0x24BED2CE8]);
}

{
  return specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(a1, a2, a3, MEMORY[0x24BED2BF8]);
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  AAHeader_impl *v7;
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;

  v7 = *(AAHeader_impl **)(a4 + 16);
  result = AAHeaderGetFieldCount(v7);
  if (result < a1)
  {
    __break(1u);
    goto LABEL_14;
  }
  result = AAHeaderGetFieldCount(v7);
  if (result < a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v9 = a3 - a1;
  if (a2 >= 1)
  {
    if (v9 < 0 || v9 >= (unint64_t)a2)
      goto LABEL_10;
    return 0;
  }
  if (v9 <= 0 && v9 > a2)
    return 0;
LABEL_10:
  v11 = __OFADD__(a1, a2);
  v10 = a1 + a2;
  if (v11)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  result = AAHeaderGetFieldCount(v7);
  if (v10 <= result)
    return v10;
LABEL_16:
  __break(1u);
  return result;
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v4;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;

  v9 = *(_QWORD *)(v4 + 16);
  result = a4(v9);
  if (result < a1)
  {
    __break(1u);
    goto LABEL_14;
  }
  result = a4(v9);
  if (result < a3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v11 = a3 - a1;
  if (a2 >= 1)
  {
    if (v11 < 0 || v11 >= (unint64_t)a2)
      goto LABEL_10;
    return 0;
  }
  if (v11 <= 0 && v11 > a2)
    return 0;
LABEL_10:
  v13 = __OFADD__(a1, a2);
  v12 = a1 + a2;
  if (v13)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  result = a4(v9);
  if (v12 <= result)
    return v12;
LABEL_16:
  __break(1u);
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t specialized SetAlgebra.subtracting(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  AAFieldKeySet_impl *v4;
  AAFieldKeySet v5;
  AAFieldKeySet_impl *v6;
  uint64_t result;

  swift_retain_n();
  v1 = swift_retain();
  v2 = specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(v1, v0);
  swift_release();
  v3 = swift_allocObject();
  v4 = *(AAFieldKeySet_impl **)(v0 + 16);
  swift_retain();
  v5 = AAFieldKeySetClone(v4);
  if (!v5
    || (v6 = v5,
        swift_release(),
        *(_QWORD *)(v3 + 16) = v6,
        *(_BYTE *)(v3 + 24) = 1,
        AAFieldKeySetSelectKeySet(v6, *(AAFieldKeySet *)(v2 + 16)) < 0))
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_release();
    swift_release();
    return v3;
  }
  return result;
}

uint64_t specialized SetAlgebra.isSubset(of:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  AAFieldKeySet_impl *v5;
  AAFieldKeySet_impl *v6;
  AAFieldKeySet_impl *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t result;

  v2 = v1;
  inited = swift_initStackObject();
  v5 = *(AAFieldKeySet_impl **)(v2 + 16);
  swift_retain();
  v6 = AAFieldKeySetClone(v5);
  if (!v6 || (v7 = v6, *(_QWORD *)(inited + 16) = v6, AAFieldKeySetSelectKeySet(v6, *(AAFieldKeySet *)(a1 + 16)) < 0))
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_release();
    v8 = ArchiveHeader.FieldKeySet.description.getter();
    v10 = v9;
    if (v8 == ArchiveHeader.FieldKeySet.description.getter() && v10 == v11)
      v12 = 1;
    else
      v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    AAFieldKeySetDestroy(v7);
    return v12 & 1;
  }
  return result;
}

uint64_t specialized SetAlgebra.isDisjoint(with:)(uint64_t a1)
{
  uint64_t v1;
  AAFieldKeySet_impl *v3;
  AAFieldKeySet_impl *v4;
  AAFieldKeySet_impl *v5;
  uint32_t KeyCount;
  uint64_t result;

  v3 = *(AAFieldKeySet_impl **)(v1 + 16);
  swift_retain();
  v4 = AAFieldKeySetClone(v3);
  if (!v4 || (v5 = v4, AAFieldKeySetSelectKeySet(v4, *(AAFieldKeySet *)(a1 + 16)) < 0))
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_release();
    KeyCount = AAFieldKeySetGetKeyCount(v5);
    AAFieldKeySetDestroy(v5);
    return KeyCount == 0;
  }
  return result;
}

uint64_t specialized SetAlgebra.isSuperset(of:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t inited;
  AAFieldKeySet_impl *v4;
  AAFieldKeySet_impl *v5;
  AAFieldKeySet_impl *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t result;

  inited = swift_initStackObject();
  v4 = *(AAFieldKeySet_impl **)(a1 + 16);
  swift_retain();
  v5 = AAFieldKeySetClone(v4);
  if (!v5 || (v6 = v5, *(_QWORD *)(inited + 16) = v5, AAFieldKeySetSelectKeySet(v5, *(AAFieldKeySet *)(v1 + 16)) < 0))
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_release();
    v7 = ArchiveHeader.FieldKeySet.description.getter();
    v9 = v8;
    if (v7 == ArchiveHeader.FieldKeySet.description.getter() && v9 == v10)
      v11 = 1;
    else
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    AAFieldKeySetDestroy(v6);
    return v11 & 1;
  }
  return result;
}

void protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance _AAFieldKeySetTraits(AAFieldKeySet *a1)
{
  AAFieldKeySetDestroy(*a1);
}

uint64_t ArchiveHeader.FieldKeySet.__allocating_init()()
{
  uint64_t v0;
  AAFieldKeySet v1;
  uint64_t result;

  v0 = swift_allocObject();
  v1 = AAFieldKeySetCreate();
  if (v1)
  {
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.init()()
{
  uint64_t v0;
  AAFieldKeySet v1;
  uint64_t result;

  v1 = AAFieldKeySetCreate();
  if (v1)
  {
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    return v0;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.__allocating_init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  AAFieldKeySet v2;

  v0 = swift_allocObject();
  v1 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v2 = AAFieldKeySetCreateWithString((const char *)(v1 + 32));
  swift_release();
  if (v2)
  {
    *(_QWORD *)(v0 + 16) = v2;
    *(_BYTE *)(v0 + 24) = 1;
  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v0;
}

uint64_t ArchiveHeader.FieldKeySet.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  AAFieldKeySet v2;

  v1 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v2 = AAFieldKeySetCreateWithString((const char *)(v1 + 32));
  swift_release();
  if (v2)
  {
    *(_QWORD *)(v0 + 16) = v2;
    *(_BYTE *)(v0 + 24) = 1;
  }
  else
  {
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v0;
}

uint64_t ArchiveHeader.FieldKeySet.__allocating_init(copying:)(uint64_t a1)
{
  uint64_t v2;
  AAFieldKeySet v3;
  AAFieldKeySet v4;
  uint64_t result;

  v2 = swift_allocObject();
  v3 = AAFieldKeySetClone(*(AAFieldKeySet *)(a1 + 16));
  if (v3)
  {
    v4 = v3;
    swift_release();
    *(_QWORD *)(v2 + 16) = v4;
    *(_BYTE *)(v2 + 24) = 1;
    return v2;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.init(copying:)(uint64_t a1)
{
  uint64_t v1;
  AAFieldKeySet v2;
  AAFieldKeySet v3;
  uint64_t result;

  v2 = AAFieldKeySetClone(*(AAFieldKeySet *)(a1 + 16));
  if (v2)
  {
    v3 = v2;
    swift_release();
    *(_QWORD *)(v1 + 16) = v3;
    *(_BYTE *)(v1 + 24) = 1;
    return v1;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t static ArchiveHeader.FieldKeySet.defaultForArchive.getter()
{
  return static ArchiveHeader.FieldKeySet.defaultForArchive.getter("TYP,PAT,LNK,DEV,DAT,UID,GID,MOD,FLG,MTM,BTM,CTM,HLC,CLC");
}

uint64_t static ArchiveHeader.FieldKeySet.defaultForManifest.getter()
{
  return static ArchiveHeader.FieldKeySet.defaultForArchive.getter("TYP,PAT,LNK,DEV,UID,GID,MOD,FLG,MTM,BTM,CTM,HLC,CLC,DUZ,SIZ,CKS,SH1");
}

uint64_t static ArchiveHeader.FieldKeySet.defaultForArchive.getter(const char *a1)
{
  uint64_t v2;
  AAFieldKeySet v3;
  uint64_t result;

  v2 = swift_allocObject();
  v3 = AAFieldKeySetCreateWithString(a1);
  if (v3)
  {
    *(_QWORD *)(v2 + 16) = v3;
    *(_BYTE *)(v2 + 24) = 1;
    return v2;
  }
  else
  {
    result = swift_deallocPartialClassInstance();
    __break(1u);
  }
  return result;
}

void ArchiveHeader.FieldKeySet.__allocating_init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ArchiveHeader.FieldKeySet.init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ArchiveHeader.FieldKeySet.deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
    AAFieldKeySetDestroy(*(AAFieldKeySet *)(v0 + 16));
  return v0;
}

uint64_t ArchiveHeader.FieldKeySet.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
    AAFieldKeySetDestroy(*(AAFieldKeySet *)(v0 + 16));
  return swift_deallocClassInstance();
}

void vtable thunk for _AAObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveHeader.FieldKeySet.__allocating_init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ArchiveHeader.FieldKeySet.insert(_:)(AAFieldKey *a1, AAFieldKey *a2)
{
  uint64_t v2;
  AAFieldKey v4;
  AAFieldKeySet_impl *v5;
  AAFieldKey v6;
  int v7;
  int v8;
  AAFieldKey v9;
  uint64_t result;

  v4 = *a2;
  v5 = *(AAFieldKeySet_impl **)(v2 + 16);
  v6 = *a2;
  v7 = AAFieldKeySetContainsKey(v5, v6);
  if (v7 < 0 || (v8 = v7, v7 != 1) && (v9 = v4, AAFieldKeySetInsertKey(v5, v9) < 0))
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    result = v8 != 1;
    *a1 = v4;
  }
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.contains(_:)(AAFieldKey *a1)
{
  uint64_t v1;
  AAFieldKey v2;
  int v3;
  uint64_t result;

  v2 = *a1;
  v3 = AAFieldKeySetContainsKey(*(AAFieldKeySet *)(v1 + 16), v2);
  if ((v3 & 0x80000000) == 0)
    return v3 == 1;
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.remove(_:)@<X0>(AAFieldKey *a1@<X0>, AAFieldKey *a2@<X8>)
{
  uint64_t v2;
  AAFieldKey v4;
  AAFieldKeySet_impl *v5;
  AAFieldKey v6;
  uint64_t result;
  int v8;
  AAFieldKey v9;

  v4 = *a1;
  v5 = *(AAFieldKeySet_impl **)(v2 + 16);
  v6 = *a1;
  result = AAFieldKeySetContainsKey(v5, v6);
  if ((result & 0x80000000) == 0)
  {
    v8 = result;
    if ((_DWORD)result != 1)
    {
      v4.ikey = 0;
LABEL_5:
      *a2 = v4;
      a2[1].skey[0] = v8 != 1;
      return result;
    }
    v9 = v4;
    result = AAFieldKeySetRemoveKey(v5, v9);
    if ((result & 0x80000000) == 0)
      goto LABEL_5;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.update(with:)@<X0>(AAFieldKey *a1@<X0>, AAFieldKey *a2@<X8>)
{
  uint64_t v2;
  AAFieldKey v4;
  AAFieldKey v5;
  uint64_t result;

  v4 = *a1;
  v5 = *a1;
  result = AAFieldKeySetInsertKey(*(AAFieldKeySet *)(v2 + 16), v5);
  if ((result & 0x80000000) != 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *a2 = v4;
    a2[1].skey[0] = 0;
  }
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.formUnion(_:)(uint64_t a1)
{
  return ArchiveHeader.FieldKeySet.formUnion(_:)(a1, MEMORY[0x24BED2C58]);
}

uint64_t ArchiveHeader.FieldKeySet.formIntersection(_:)(uint64_t a1)
{
  return ArchiveHeader.FieldKeySet.formUnion(_:)(a1, MEMORY[0x24BED2C70]);
}

uint64_t ArchiveHeader.FieldKeySet.formUnion(_:)(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t result;

  result = a2(*(_QWORD *)(v2 + 16), *(_QWORD *)(a1 + 16));
  if ((result & 0x80000000) != 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void ArchiveHeader.FieldKeySet.formSymmetricDifference(_:)(uint64_t a1)
{
  uint64_t v1;
  AAFieldKeySet_impl *v3;
  AAFieldKeySet v4;
  AAFieldKeySet_impl *v5;
  AAFieldKeySet_impl *v6;

  v3 = *(AAFieldKeySet_impl **)(v1 + 16);
  swift_retain();
  v4 = AAFieldKeySetClone(v3);
  if (!v4
    || (v5 = v4, swift_release(), v6 = *(AAFieldKeySet_impl **)(a1 + 16), AAFieldKeySetSelectKeySet(v5, v6) < 0)
    || AAFieldKeySetInsertKeySet(v3, v6) < 0
    || AAFieldKeySetRemoveKeySet(v3, v5) < 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_release();
    AAFieldKeySetDestroy(v5);
  }
}

uint64_t ArchiveHeader.FieldKeySet.intersection(_:)(uint64_t a1)
{
  return ArchiveHeader.FieldKeySet.intersection(_:)(a1, (uint64_t (*)(AAFieldKeySet, _QWORD))MEMORY[0x24BED2C70]);
}

uint64_t ArchiveHeader.FieldKeySet.union(_:)(uint64_t a1)
{
  return ArchiveHeader.FieldKeySet.intersection(_:)(a1, (uint64_t (*)(AAFieldKeySet, _QWORD))MEMORY[0x24BED2C58]);
}

uint64_t ArchiveHeader.FieldKeySet.intersection(_:)(uint64_t a1, uint64_t (*a2)(AAFieldKeySet, _QWORD))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  AAFieldKeySet_impl *v7;
  AAFieldKeySet v8;
  AAFieldKeySet v9;
  uint64_t result;

  v4 = v2;
  v6 = swift_allocObject();
  v7 = *(AAFieldKeySet_impl **)(v4 + 16);
  swift_retain();
  v8 = AAFieldKeySetClone(v7);
  if (v8)
  {
    v9 = v8;
    swift_release();
    *(_QWORD *)(v6 + 16) = v9;
    *(_BYTE *)(v6 + 24) = 1;
    if ((a2(v9, *(_QWORD *)(a1 + 16)) & 0x80000000) == 0)
      return v6;
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t ArchiveHeader.FieldKeySet.symmetricDifference(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(a1, v1);
  swift_release();
  return v2;
}

BOOL ArchiveHeader.FieldKeySet.isEmpty.getter()
{
  uint64_t v0;

  return AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(v0 + 16)) == 0;
}

uint64_t ArchiveHeader.FieldKeySet.startIndex.getter()
{
  return 0;
}

uint64_t ArchiveHeader.FieldKeySet.endIndex.getter()
{
  uint64_t v0;

  return AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(v0 + 16));
}

AAFieldKey ArchiveHeader.FieldKeySet.subscript.getter@<W0>(unint64_t i@<X0>, AAFieldKey *a2@<X8>)
{
  uint64_t v2;
  AAFieldKey result;

  if ((i & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (HIDWORD(i))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  result = AAFieldKeySetGetKey(*(AAFieldKeySet *)(v2 + 16), i);
  if ((int)(result.ikey << 8) >> 24 >= 32
    && HIBYTE(result.ikey) == 0
    && result.skey[0] >= 32
    && *(__int16 *)result.skey >> 8 > 31)
  {
    *a2 = result;
    return result;
  }
LABEL_15:
  result.ikey = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static ArchiveHeader.FieldKeySet.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v0 = ArchiveHeader.FieldKeySet.description.getter();
  v2 = v1;
  if (v0 == ArchiveHeader.FieldKeySet.description.getter() && v2 == v3)
    v4 = 1;
  else
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t ArchiveHeader.FieldKeySet.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  AAFieldKeySet_impl *v2;
  uint32_t KeyCount;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v1 = type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8](v1);
  v2 = *(AAFieldKeySet_impl **)(v0 + 16);
  KeyCount = AAFieldKeySetGetKeyCount(v2);
  if (KeyCount >> 30)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v4 = 4 * KeyCount;
  v0 = swift_slowAlloc();
  if ((AAFieldKeySetSerialize(v2, v4, (char *)v0) & 0x80000000) == 0)
  {
    static String.Encoding.utf8.getter();
    v5 = String.init(cString:encoding:)();
    if (v6)
    {
      v7 = v5;
      MEMORY[0x2207DD50C](v0, -1, -1);
      return v7;
    }
    goto LABEL_6;
  }
LABEL_7:
  MEMORY[0x2207DD50C](v0, -1, -1);
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ArchiveHeader.FieldKeySet()
{
  return ArchiveHeader.FieldKeySet.description.getter();
}

uint64_t protocol witness for SetAlgebra.init() in conformance ArchiveHeader.FieldKeySet@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = swift_allocObject();
  result = (uint64_t)AAFieldKeySetCreate();
  if (result)
  {
    *(_QWORD *)(v2 + 16) = result;
    *(_BYTE *)(v2 + 24) = 1;
    *a1 = v2;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance ArchiveHeader.FieldKeySet(AAFieldKey *a1)
{
  uint64_t v1;
  AAFieldKey v2;
  int v3;
  uint64_t result;

  v2 = *a1;
  v3 = AAFieldKeySetContainsKey(*(AAFieldKeySet *)(*(_QWORD *)v1 + 16), v2);
  if ((v3 & 0x80000000) == 0)
    return v3 == 1;
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance ArchiveHeader.FieldKeySet@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = ArchiveHeader.FieldKeySet.union(_:)(*a1);
  swift_release();
  result = swift_release();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance ArchiveHeader.FieldKeySet@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = ArchiveHeader.FieldKeySet.intersection(_:)(*a1);
  result = swift_release();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance ArchiveHeader.FieldKeySet@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t result;

  v4 = specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(*a1, *v2);
  result = swift_release();
  *a2 = v4;
  return result;
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance ArchiveHeader.FieldKeySet(AAFieldKey *a1, AAFieldKey *a2)
{
  AAFieldKey v3;

  v3 = *a2;
  return ArchiveHeader.FieldKeySet.insert(_:)(a1, &v3) & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance ArchiveHeader.FieldKeySet@<X0>(AAFieldKey *a1@<X0>, AAFieldKey *a2@<X8>)
{
  return ArchiveHeader.FieldKeySet.remove(_:)(a1, a2);
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance ArchiveHeader.FieldKeySet@<X0>(AAFieldKey *a1@<X0>, AAFieldKey *a2@<X8>)
{
  uint64_t v2;
  AAFieldKey v4;
  AAFieldKey v5;
  uint64_t result;

  v4 = *a1;
  v5 = *a1;
  result = AAFieldKeySetInsertKey(*(AAFieldKeySet *)(*(_QWORD *)v2 + 16), v5);
  if ((result & 0x80000000) != 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *a2 = v4;
    a2[1].skey[0] = 0;
  }
  return result;
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance ArchiveHeader.FieldKeySet(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  if ((AAFieldKeySetInsertKeySet(*(AAFieldKeySet *)(*(_QWORD *)v1 + 16), *(AAFieldKeySet *)(*(_QWORD *)a1 + 16)) & 0x80000000) == 0)
    return swift_release();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance ArchiveHeader.FieldKeySet(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = AAFieldKeySetSelectKeySet(*(AAFieldKeySet *)(*(_QWORD *)v1 + 16), *(AAFieldKeySet *)(*(_QWORD *)a1 + 16));
  if ((result & 0x80000000) != 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

void protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance ArchiveHeader.FieldKeySet(uint64_t *a1)
{
  ArchiveHeader.FieldKeySet.formSymmetricDifference(_:)(*a1);
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance ArchiveHeader.FieldKeySet@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = specialized SetAlgebra.subtracting(_:)();
  result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance ArchiveHeader.FieldKeySet(uint64_t *a1)
{
  return specialized SetAlgebra.isSubset(of:)(*a1) & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance ArchiveHeader.FieldKeySet(uint64_t *a1)
{
  return specialized SetAlgebra.isDisjoint(with:)(*a1) & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance ArchiveHeader.FieldKeySet(uint64_t *a1)
{
  return specialized SetAlgebra.isSuperset(of:)(*a1) & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance ArchiveHeader.FieldKeySet()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance ArchiveHeader.FieldKeySet()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = *v0;
  swift_retain();
  v2 = swift_retain();
  v3 = specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(v2, v1);
  swift_release();
  if ((AAFieldKeySetSelectKeySet(*(AAFieldKeySet *)(v1 + 16), *(AAFieldKeySet *)(v3 + 16)) & 0x80000000) == 0)
    return swift_release();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *protocol witness for BidirectionalCollection.index(before:) in conformance ArchiveHeader.FieldKeySet@<X0>(_QWORD *result@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t v4;

  v4 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    result = (_QWORD *)AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(_QWORD *)v2 + 16));
    if (v4 < result)
    {
      *a2 = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance ArchiveHeader.FieldKeySet(unint64_t *result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t *v3;

  v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    result = (unint64_t *)AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(_QWORD *)v1 + 16));
    if (v2 < result)
    {
      *v3 = v2;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance ArchiveHeader.FieldKeySet@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, MEMORY[0x24BED2C48]);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ArchiveHeader.FieldKeySet()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = ArchiveHeader.FieldKeySet.description.getter();
  v2 = v1;
  if (v0 == ArchiveHeader.FieldKeySet.description.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance ArchiveHeader.FieldKeySet@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for Collection.endIndex.getter in conformance ArchiveHeader.FieldKeySet@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(_QWORD *)v1 + 16));
  *a1 = result;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ArchiveHeader.FieldKeySet(AAFieldKey *a1, unint64_t *a2))()
{
  uint64_t v2;
  unint64_t v3;
  AAFieldKey Key;
  uint64_t (*result)();

  v3 = *a2;
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (HIDWORD(v3))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  Key = AAFieldKeySetGetKey(*(AAFieldKeySet *)(*(_QWORD *)v2 + 16), v3);
  if ((int)(Key.ikey << 8) >> 24 >= 32 && HIBYTE(Key.ikey) == 0 && Key.skey[0] >= 32 && *(__int16 *)Key.skey >> 8 > 31)
  {
    *a1 = Key;
    return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
  }
LABEL_15:
  result = (uint64_t (*)())_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.subscript.getter in conformance ArchiveHeader.FieldKeySet@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = *a1;
  v5 = a1[1];
  v6 = *v2;
  result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(v6 + 16));
  if (v4 < 0)
  {
    __break(1u);
  }
  else if (v5 <= result)
  {
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
    return swift_retain();
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.indices.getter in conformance ArchiveHeader.FieldKeySet@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(_QWORD *)v1 + 16));
  *a1 = 0;
  a1[1] = result;
  return result;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance ArchiveHeader.FieldKeySet()
{
  uint64_t v0;

  return AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(_QWORD *)v0 + 16)) == 0;
}

_QWORD *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance ArchiveHeader.FieldKeySet@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v5;

  v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    result = (_QWORD *)AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(_QWORD *)v3 + 16));
    if (v5 <= result)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

unint64_t protocol witness for RandomAccessCollection.distance(from:to:) in conformance ArchiveHeader.FieldKeySet(unint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  AAFieldKeySet_impl *v5;
  unint64_t result;

  v3 = *a1;
  v4 = *a2;
  v5 = *(AAFieldKeySet_impl **)(*(_QWORD *)v2 + 16);
  result = AAFieldKeySetGetKeyCount(v5);
  if (v3 > result)
  {
    __break(1u);
  }
  else
  {
    result = AAFieldKeySetGetKeyCount(v5);
    if (v4 <= result)
      return v4 - v3;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.index(after:) in conformance ArchiveHeader.FieldKeySet@<X0>(unint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v4;
  uint64_t result;

  v4 = *a1;
  result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(*(_QWORD *)v2 + 16));
  if (v4 >= result)
  {
    __break(1u);
  }
  else if (!__OFADD__(v4, 1))
  {
    *a2 = v4 + 1;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.formIndex(after:) in conformance ArchiveHeader.FieldKeySet(unint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  v3 = *v1;
  v4 = *a1;
  result = AAFieldKeySetGetKeyCount(*(AAFieldKeySet *)(v3 + 16));
  if (v4 >= result)
  {
    __break(1u);
  }
  else if (!__OFADD__(v4, 1))
  {
    *a1 = v4 + 1;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.count.getter in conformance ArchiveHeader.FieldKeySet()
{
  uint64_t v0;
  AAFieldKeySet_impl *v1;
  uint32_t KeyCount;
  uint64_t result;

  v1 = *(AAFieldKeySet_impl **)(*(_QWORD *)v0 + 16);
  KeyCount = AAFieldKeySetGetKeyCount(v1);
  AAFieldKeySetGetKeyCount(v1);
  result = AAFieldKeySetGetKeyCount(v1);
  if (result >= KeyCount)
    return KeyCount;
  __break(1u);
  return result;
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance ArchiveHeader.FieldKeySet()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_release();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance ArchiveHeader.FieldKeySet(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3);
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(a1, &demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.FieldKey>, (uint64_t (*)(uint64_t *, _QWORD *, _QWORD, uint64_t))specialized Sequence._copySequenceContents(initializing:));
}

{
  AAFieldKeySet_impl *v1;
  uint32_t KeyCount;
  _QWORD *result;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(AAFieldKeySet_impl **)(a1 + 16);
  KeyCount = AAFieldKeySetGetKeyCount(v1);
  AAFieldKeySetGetKeyCount(v1);
  result = (_QWORD *)AAFieldKeySetGetKeyCount(v1);
  if (result >= KeyCount)
  {
    if (KeyCount)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.FieldKey>);
      v4 = (_QWORD *)swift_allocObject();
      v5 = _swift_stdlib_malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 29;
      v4[2] = KeyCount;
      v4[3] = 2 * (v6 >> 2);
      swift_retain();
      v7 = specialized Sequence._copySequenceContents(initializing:)(&v8, (uint64_t)(v4 + 4), KeyCount);
      swift_release();
      if (v7 == KeyCount)
        return v4;
      __break(1u);
    }
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  __break(1u);
  return result;
}

{
  return specialized _copyCollectionToContiguousArray<A>(_:)(a1, &demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.FieldType>, (uint64_t (*)(uint64_t *, _QWORD *, _QWORD, uint64_t))specialized Sequence._copySequenceContents(initializing:));
}

{
  AAEntryXATBlob_impl *v1;
  uint32_t EntryCount;
  _QWORD *result;
  _QWORD *v4;
  size_t v5;
  _QWORD *v6;
  uint64_t v7;

  v1 = *(AAEntryXATBlob_impl **)(a1 + 16);
  EntryCount = AAEntryXATBlobGetEntryCount(v1);
  AAEntryXATBlobGetEntryCount(v1);
  result = (_QWORD *)AAEntryXATBlobGetEntryCount(v1);
  if (result >= EntryCount)
  {
    if (EntryCount)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.EntryXATBlob.ExtendedAttribute>);
      v4 = (_QWORD *)swift_allocObject();
      v5 = _swift_stdlib_malloc_size(v4);
      v4[2] = EntryCount;
      v4[3] = 2 * ((uint64_t)(v5 - 32) / 24);
      swift_retain();
      v6 = specialized Sequence._copySequenceContents(initializing:)(&v7, (uint64_t)(v4 + 4), EntryCount);
      swift_release();
      if (v6 == (_QWORD *)EntryCount)
        return v4;
      __break(1u);
    }
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  __break(1u);
  return result;
}

{
  AAHeader_impl *v1;
  uint32_t FieldCount;
  _QWORD *result;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v1 = *(AAHeader_impl **)(a1 + 16);
  FieldCount = AAHeaderGetFieldCount(v1);
  AAHeaderGetFieldCount(v1);
  result = (_QWORD *)AAHeaderGetFieldCount(v1);
  if (result >= FieldCount)
  {
    if (FieldCount)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ArchiveHeader.Field>);
      v4 = (_QWORD *)swift_allocObject();
      v5 = _swift_stdlib_malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 1;
      v4[2] = FieldCount;
      v4[3] = 2 * (v6 >> 5);
      swift_retain();
      v7 = specialized Sequence._copySequenceContents(initializing:)(&v8, (uint64_t)(v4 + 4), FieldCount);
      swift_release();
      if (v7 == (_QWORD *)FieldCount)
        return v4;
      __break(1u);
    }
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  __break(1u);
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t *, _QWORD *, _QWORD, uint64_t))
{
  AAHeader_impl *v6;
  uint32_t FieldCount;
  _QWORD *result;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(AAHeader_impl **)(a1 + 16);
  FieldCount = AAHeaderGetFieldCount(v6);
  AAHeaderGetFieldCount(v6);
  result = (_QWORD *)AAHeaderGetFieldCount(v6);
  if (result >= FieldCount)
  {
    if (FieldCount)
    {
      __swift_instantiateConcreteTypeFromMangledName(a2);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 29;
      v9[2] = FieldCount;
      v9[3] = 2 * (v11 >> 2);
      swift_retain();
      v12 = a3(&v13, v9 + 4, FieldCount, a1);
      swift_release();
      if (v12 == FieldCount)
        return v9;
      __break(1u);
    }
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  __break(1u);
  return result;
}

void specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  int64_t v5;
  _QWORD *v8;
  size_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_9:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (v4 != a3)
        goto LABEL_5;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3)
      {
LABEL_5:
        memcpy(v8 + 4, (const void *)(a2 + a3), v5);
        return;
      }
    }
    __break(1u);
    goto LABEL_9;
  }
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  AAHeader_impl *v8;
  unint64_t v9;
  AAFieldKey FieldKey;
  AAFieldKey v12;
  uint64_t result;

  if (!a2)
  {
    v9 = 0;
    goto LABEL_18;
  }
  if (!a3)
  {
LABEL_17:
    v9 = a3;
    goto LABEL_18;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v8 = *(AAHeader_impl **)(a4 + 16);
    v9 = 0;
    if (AAHeaderGetFieldCount(v8))
    {
      do
      {
        FieldKey = AAHeaderGetFieldKey(v8, v9);
        if ((int)(FieldKey.ikey << 8) >> 24 < 32 || HIBYTE(FieldKey.ikey) != 0)
          goto LABEL_21;
        v12 = FieldKey;
        if (FieldKey.skey[0] < 32 || *(__int16 *)FieldKey.skey >> 8 <= 31)
          goto LABEL_21;
        if (v9 >= AAHeaderGetFieldCount(v8))
        {
          __break(1u);
          goto LABEL_20;
        }
        *(AAFieldKey *)(a2 + 4 * v9) = v12;
        if (a3 - 1 == v9)
          goto LABEL_17;
      }
      while (++v9 != AAHeaderGetFieldCount(v8));
    }
LABEL_18:
    *a1 = a4;
    a1[1] = v9;
    return v9;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  AAFieldKeySet_impl *v7;
  unint64_t v8;
  AAFieldKey Key;
  AAFieldKey v11;
  uint64_t result;

  if (!a2)
  {
    v8 = 0;
    goto LABEL_18;
  }
  if (!a3)
  {
LABEL_17:
    v8 = a3;
    goto LABEL_18;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v7 = *(AAFieldKeySet_impl **)(v3 + 16);
    v8 = 0;
    if (AAFieldKeySetGetKeyCount(v7))
    {
      do
      {
        Key = AAFieldKeySetGetKey(v7, v8);
        if ((int)(Key.ikey << 8) >> 24 < 32 || HIBYTE(Key.ikey) != 0)
          goto LABEL_21;
        v11 = Key;
        if (Key.skey[0] < 32 || *(__int16 *)Key.skey >> 8 <= 31)
          goto LABEL_21;
        if (v8 >= AAFieldKeySetGetKeyCount(v7))
        {
          __break(1u);
          goto LABEL_20;
        }
        *(AAFieldKey *)(a2 + 4 * v8) = v11;
        if (a3 - 1 == v8)
          goto LABEL_17;
      }
      while (++v8 != AAFieldKeySetGetKeyCount(v7));
    }
LABEL_18:
    *a1 = v3;
    a1[1] = v8;
    return v8;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(_QWORD *a1, int *a2, unint64_t a3, uint64_t a4)
{
  unint64_t v6;
  AAHeader_impl *v8;
  int FieldType;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t result;

  if (!a2)
    goto LABEL_15;
  v6 = a3;
  if (!a3)
    goto LABEL_16;
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v8 = *(AAHeader_impl **)(a4 + 16);
  if (!AAHeaderGetFieldCount(v8))
  {
LABEL_15:
    v6 = 0;
    goto LABEL_16;
  }
  FieldType = AAHeaderGetFieldType(v8, 0);
  if ((FieldType & 0x80000000) == 0)
  {
    v10 = FieldType;
    if (!AAHeaderGetFieldCount(v8))
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    *a2 = v10;
    if (v6 != 1)
    {
      v11 = 1;
      while (v6 != v11)
      {
        if (v11 == AAHeaderGetFieldCount(v8))
        {
          v6 = v11;
          goto LABEL_16;
        }
        v12 = AAHeaderGetFieldType(v8, v11);
        if (v12 < 0)
          goto LABEL_22;
        v13 = v12;
        if (v11 >= AAHeaderGetFieldCount(v8))
          goto LABEL_19;
        a2[v11++] = v13;
        if (v6 == v11)
          goto LABEL_16;
      }
      __break(1u);
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
LABEL_16:
    *a1 = a4;
    a1[1] = v6;
    return v6;
  }
LABEL_22:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *specialized Sequence._copySequenceContents(initializing:)(_QWORD *result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  AAEntryXATBlob_impl *v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v11;
  uint64_t v12;
  __int128 v13;

  v4 = result;
  if (!a2)
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = a3;
  if (!a3)
  {
LABEL_13:
    *v4 = v3;
    v4[1] = v5;
    return (_QWORD *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = a2;
    v7 = *(AAEntryXATBlob_impl **)(v3 + 16);
    if (AAEntryXATBlobGetEntryCount(v7))
    {
      ArchiveHeader.EntryXATBlob._attribute(at:)(0, &v12);
      v8 = v12;
      v11 = v13;
      if (AAEntryXATBlobGetEntryCount(v7))
      {
        v9 = 1;
        do
        {
          *(_QWORD *)v6 = v8;
          *(_OWORD *)(v6 + 8) = v11;
          if (v5 == v9)
            goto LABEL_13;
          if (v9 == AAEntryXATBlobGetEntryCount(v7))
          {
            v5 = v9;
            goto LABEL_13;
          }
          ArchiveHeader.EntryXATBlob._attribute(at:)(v9, &v12);
          v8 = v12;
          v11 = v13;
          v6 += 24;
        }
        while (v9++ < AAEntryXATBlobGetEntryCount(v7));
      }
      __break(1u);
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

{
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  AAHeader_impl *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v4 = result;
  if (!a2)
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = a3;
  if (!a3)
  {
LABEL_13:
    *v4 = v3;
    v4[1] = v5;
    return (_QWORD *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = a2;
    v7 = *(AAHeader_impl **)(v3 + 16);
    if (AAHeaderGetFieldCount(v7))
    {
      v14 = v4;
      ArchiveHeader._field(at:)(0, (uint64_t)&v15);
      v8 = v15;
      v9 = v16;
      v10 = v17;
      v11 = v18;
      if (AAHeaderGetFieldCount(v7))
      {
        v12 = 1;
        while (1)
        {
          *(_QWORD *)v6 = v8;
          *(_QWORD *)(v6 + 8) = v9;
          *(_QWORD *)(v6 + 16) = v10;
          *(_BYTE *)(v6 + 24) = v11;
          if (v5 == v12)
          {
            v4 = v14;
            goto LABEL_13;
          }
          if (v12 == AAHeaderGetFieldCount(v7))
            break;
          v4 = (_QWORD *)(v12 + 1);
          ArchiveHeader._field(at:)(v12, (uint64_t)&v15);
          v8 = v15;
          v9 = v16;
          v10 = v17;
          v11 = v18;
          v6 += 32;
          if (v12++ >= AAHeaderGetFieldCount(v7))
            goto LABEL_11;
        }
        v5 = v12;
        v4 = v14;
        goto LABEL_13;
      }
LABEL_11:
      __break(1u);
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t a1)
{
  uint64_t v2;
  AAFieldKeySet v3;
  AAFieldKeySet_impl *v4;
  uint64_t v5;
  AAFieldKey *v6;
  AAFieldKey v7;
  AAFieldKey v8;
  AAFieldKey v9;
  int v10;
  AAFieldKey v11;

  type metadata accessor for ArchiveHeader.FieldKeySet();
  v2 = swift_allocObject();
  v3 = AAFieldKeySetCreate();
  if (!v3)
    goto LABEL_10;
  v4 = v3;
  *(_QWORD *)(v2 + 16) = v3;
  *(_BYTE *)(v2 + 24) = 1;
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v6 = (AAFieldKey *)(a1 + 32);
    while (1)
    {
      v8 = *v6++;
      v7 = v8;
      v9 = v8;
      v10 = AAFieldKeySetContainsKey(v4, v9);
      if (v10 < 0)
        break;
      if (v10 != 1)
      {
        v11 = v7;
        if (AAFieldKeySetInsertKey(v4, v11) < 0)
          break;
      }
      if (!--v5)
        return v2;
    }
    while (1)
    {
LABEL_10:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  return v2;
}

uint64_t specialized ArchiveHeader.FieldKeySet.symmetricDifference(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  AAFieldKeySet_impl *v5;
  AAFieldKeySet_impl *v6;
  AAFieldKeySet_impl *v7;
  AAFieldKeySet_impl *v8;
  AAFieldKeySet_impl *v9;
  uint64_t result;

  v4 = swift_allocObject();
  v5 = AAFieldKeySetClone(*(AAFieldKeySet *)(a2 + 16));
  if (!v5
    || (v6 = v5, *(_QWORD *)(v4 + 16) = v5, *(_BYTE *)(v4 + 24) = 1, (v7 = AAFieldKeySetClone(v5)) == 0)
    || (v8 = v7, v9 = *(AAFieldKeySet_impl **)(a1 + 16), AAFieldKeySetSelectKeySet(v7, v9) < 0)
    || AAFieldKeySetInsertKeySet(v6, v9) < 0
    || AAFieldKeySetRemoveKeySet(v6, v8) < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_release();
    AAFieldKeySetDestroy(v8);
    return v4;
  }
  return result;
}

uint64_t base witness table accessor for BidirectionalCollection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet(&lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet, (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t type metadata accessor for ArchiveHeader.FieldKeySet()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ArchiveHeader.FieldKeySet;
  if (!type metadata singleton initialization cache for ArchiveHeader.FieldKeySet)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>, &lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet, (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet, MEMORY[0x24BEE4230]);
}

uint64_t base witness table accessor for Equatable in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet(&lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet, (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t base witness table accessor for ExpressibleByArrayLiteral in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet(&lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet, (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t base witness table accessor for Collection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet(&lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet, (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>, &lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet, (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet, MEMORY[0x24BEE4218]);
}

uint64_t lazy protocol witness table accessor for type Slice<ArchiveHeader.FieldKeySet> and conformance <> Slice<A>(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<ArchiveHeader.FieldKeySet>);
    v10 = lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet(a2, a3);
    result = MEMORY[0x2207DD494](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Sequence in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet(&lazy protocol witness table cache variable for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet, (uint64_t)&protocol conformance descriptor for ArchiveHeader.FieldKeySet);
}

uint64_t lazy protocol witness table accessor for type ArchiveHeader.FieldKeySet and conformance ArchiveHeader.FieldKeySet(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ArchiveHeader.FieldKeySet();
    result = MEMORY[0x2207DD494](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<ArchiveHeader.FieldKeySet> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<ArchiveHeader.FieldKeySet>, MEMORY[0x24BEE4238]);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ArchiveHeader.FieldKeySet()
{
  return lazy protocol witness table accessor for type Slice<ArchiveHeader> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<ArchiveHeader.FieldKeySet> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<ArchiveHeader.FieldKeySet>, MEMORY[0x24BEE2C18]);
}

ValueMetadata *type metadata accessor for _AAFieldKeySetTraits()
{
  return &type metadata for _AAFieldKeySetTraits;
}

uint64_t method lookup function for ArchiveHeader.FieldKeySet()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveHeader.FieldKeySet.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ArchiveHeader.FieldKeySet.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArchiveHeader.FieldKeySet.__allocating_init(copying:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

void protocol witness for static _AAObjectTraits.aaDestroy(_:) in conformance AEAContextTraits(AEAContext *a1)
{
  AEAContextDestroy(*a1);
}

void specialized P256.Signing.PublicKey.withUnsafeX963Bytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = swift_retain_n();
  a4(v5);
  __asm { BR              X10 }
}

uint64_t sub_220072574(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t buf, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  AEAContextField v25;
  _BYTE *v26;
  uint64_t v28;
  __int16 v29;
  char v30;
  char v31;
  char v32;
  char v33;

  v28 = v24;
  v29 = v22;
  v30 = BYTE2(v22);
  v31 = BYTE3(v22);
  v32 = BYTE4(v22);
  v33 = BYTE5(v22);
  if (AEAContextSetFieldBlob(*(AEAContext *)(v23 + 16), v25, 1u, (const uint8_t *)&v28, BYTE6(v22)) < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v26 = 1;
    swift_willThrow();
  }
  outlined consume of Data._Representation(v24, v22);
  return swift_release_n();
}

uint64_t ArchiveEncryptionContext.__allocating_init(profile:compressionAlgorithm:compressionBlockSize:)(AEAProfile *a1, unsigned int *a2, unint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  ArchiveEncryptionContext.init(profile:compressionAlgorithm:compressionBlockSize:)(a1, a2, a3);
  return v6;
}

uint64_t ArchiveEncryptionContext.init(profile:compressionAlgorithm:compressionBlockSize:)(AEAProfile *a1, unsigned int *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  AEAContext_impl *v6;
  AEAContext_impl *v7;
  uint64_t v8;
  uint64_t result;

  v5 = *a2;
  v6 = AEAContextCreateWithProfile(*a1);
  if (v6)
  {
    v7 = v6;
    if ((AEAContextSetFieldUInt(v6, 3u, v5) & 0x80000000) == 0)
    {
      v8 = a3 >= 0xFFFFFFFF ? 0xFFFFFFFFLL : a3;
      if ((AEAContextSetFieldUInt(v7, 4u, v8) & 0x80000000) == 0)
      {
        *(_QWORD *)(v3 + 16) = v7;
        *(_BYTE *)(v3 + 24) = 1;
        return v3;
      }
    }
    AEAContextDestroy(v7);
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t AEAContextSetCompressionAlgorithm(AEAContext_impl *a1, uint64_t value)
{
  return AEAContextSetFieldUInt(a1, 3u, value);
}

uint64_t AEAContextSetCompressionBlockSize(AEAContext_impl *a1, unint64_t a2)
{
  uint64_t v2;

  if (a2 >= 0xFFFFFFFF)
    v2 = 0xFFFFFFFFLL;
  else
    v2 = a2;
  return AEAContextSetFieldUInt(a1, 4u, v2);
}

AAByteStream_impl *ArchiveEncryptionContext.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2;
  AAByteStream_impl *result;
  AEAContext v4;

  v2 = swift_allocObject();
  swift_beginAccess();
  result = *(AAByteStream_impl **)(a1 + 16);
  if (result)
  {
    v4 = AEAContextCreateWithEncryptedStream(result);
    swift_release();
    if (v4)
    {
      *(_QWORD *)(v2 + 16) = v4;
      *(_BYTE *)(v2 + 24) = 1;
    }
    else
    {
      swift_deallocPartialClassInstance();
      return 0;
    }
    return (AAByteStream_impl *)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

AAByteStream_impl *ArchiveEncryptionContext.init(from:)(uint64_t a1)
{
  uint64_t v1;
  AAByteStream_impl *result;
  AEAContext v4;

  swift_beginAccess();
  result = *(AAByteStream_impl **)(a1 + 16);
  if (result)
  {
    v4 = AEAContextCreateWithEncryptedStream(result);
    swift_release();
    if (v4)
    {
      *(_QWORD *)(v1 + 16) = v4;
      *(_BYTE *)(v1 + 24) = 1;
    }
    else
    {
      type metadata accessor for ArchiveEncryptionContext();
      swift_deallocPartialClassInstance();
      return 0;
    }
    return (AAByteStream_impl *)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for ArchiveEncryptionContext()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ArchiveEncryptionContext;
  if (!type metadata singleton initialization cache for ArchiveEncryptionContext)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ArchiveEncryptionContext.profile.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 0);
  *a1 = result;
  return result;
}

uint64_t ArchiveEncryptionContext.signatureMode.getter@<X0>(int *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  int v4;

  result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 0);
  if (result > 5)
    v4 = -1;
  else
    v4 = dword_2200798D4[(int)result];
  *a1 = v4;
  return result;
}

uint64_t ArchiveEncryptionContext.encryptionMode.getter@<X0>(int *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  int v4;

  result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 0);
  if (result > 5)
    v4 = -1;
  else
    v4 = dword_2200798EC[(int)result];
  *a1 = v4;
  return result;
}

uint64_t key path setter for ArchiveEncryptionContext.paddingSize : ArchiveEncryptionContext(uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  if ((*a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  result = AEAContextSetPaddingSize(*(AEAContext_impl **)(*(_QWORD *)a2 + 16), *a1);
  if ((_DWORD)result)
  {
LABEL_5:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveEncryptionContext.paddingSize.getter()
{
  return ArchiveEncryptionContext.paddingSize.getter(1u);
}

uint64_t AEAContextGetPaddingSize(AEAContext_impl *a1)
{
  return AEAContextGetFieldUInt(a1, 1u);
}

uint64_t ArchiveEncryptionContext.paddingSize.setter(uint64_t value)
{
  uint64_t v1;
  uint64_t result;

  if ((value & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  result = AEAContextSetFieldUInt(*(AEAContext *)(v1 + 16), 1u, value);
  if ((_DWORD)result)
  {
LABEL_5:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t AEAContextSetPaddingSize(AEAContext_impl *a1, uint64_t value)
{
  return AEAContextSetFieldUInt(a1, 1u, value);
}

uint64_t ArchiveEncryptionContext.paddingSize.modify(uint64_t *a1)
{
  uint64_t v1;
  AEAContext_impl *v3;
  uint64_t result;

  v3 = *(AEAContext_impl **)(v1 + 16);
  a1[1] = (uint64_t)v3;
  result = AEAContextGetFieldUInt(v3, 1u);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = result;
    return (uint64_t)ArchiveEncryptionContext.paddingSize.modify;
  }
  return result;
}

uint64_t ArchiveEncryptionContext.paddingSize.modify(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)a1;
  if ((a2 & 1) != 0)
  {
    if ((v2 & 0x8000000000000000) == 0)
      goto LABEL_5;
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_5:
  result = AEAContextSetFieldUInt(*(AEAContext *)(a1 + 8), 1u, v2);
  if ((_DWORD)result)
  {
LABEL_8:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveEncryptionContext.checksumMode.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 2u);
  *a1 = result;
  return result;
}

uint64_t AEAContextGetChecksumMode(AEAContext_impl *a1)
{
  return AEAContextGetFieldUInt(a1, 2u);
}

uint64_t ArchiveEncryptionContext.checksumMode.setter(unsigned int *a1)
{
  return ArchiveEncryptionContext.checksumMode.setter(a1, 2u);
}

uint64_t AEAContextSetChecksumMode(AEAContext_impl *a1, uint64_t value)
{
  return AEAContextSetFieldUInt(a1, 2u, value);
}

uint64_t (*ArchiveEncryptionContext.checksumMode.modify(uint64_t a1))(uint64_t a1, int a2)
{
  uint64_t v1;
  AEAContext_impl *v3;

  v3 = *(AEAContext_impl **)(v1 + 16);
  *(_QWORD *)a1 = v3;
  *(_DWORD *)(a1 + 8) = AEAContextGetFieldUInt(v3, 2u);
  return ArchiveEncryptionContext.checksumMode.modify;
}

uint64_t ArchiveEncryptionContext.checksumMode.modify(uint64_t a1, int a2)
{
  return ArchiveEncryptionContext.checksumMode.modify(a1, a2, 2u);
}

uint64_t key path setter for ArchiveEncryptionContext.checksumMode : ArchiveEncryptionContext(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD))
{
  uint64_t result;

  result = a5(*(_QWORD *)(*(_QWORD *)a2 + 16), *a1);
  if ((_DWORD)result)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveEncryptionContext.compressionAlgorithm.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), 3u);
  *a1 = result;
  return result;
}

uint64_t AEAContextGetCompressionAlgorithm(AEAContext_impl *a1)
{
  return AEAContextGetFieldUInt(a1, 3u);
}

uint64_t ArchiveEncryptionContext.compressionAlgorithm.setter(unsigned int *a1)
{
  return ArchiveEncryptionContext.checksumMode.setter(a1, 3u);
}

uint64_t ArchiveEncryptionContext.checksumMode.setter(unsigned int *a1, AEAContextField a2)
{
  uint64_t v2;
  uint64_t result;

  result = AEAContextSetFieldUInt(*(AEAContext *)(v2 + 16), a2, *a1);
  if ((_DWORD)result)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t (*ArchiveEncryptionContext.compressionAlgorithm.modify(uint64_t a1))(uint64_t a1, int a2)
{
  uint64_t v1;
  AEAContext_impl *v3;

  v3 = *(AEAContext_impl **)(v1 + 16);
  *(_QWORD *)a1 = v3;
  *(_DWORD *)(a1 + 8) = AEAContextGetFieldUInt(v3, 3u);
  return ArchiveEncryptionContext.compressionAlgorithm.modify;
}

uint64_t ArchiveEncryptionContext.compressionAlgorithm.modify(uint64_t a1, int a2)
{
  return ArchiveEncryptionContext.checksumMode.modify(a1, a2, 3u);
}

uint64_t ArchiveEncryptionContext.checksumMode.modify(uint64_t a1, int a2, AEAContextField field)
{
  uint64_t result;

  result = AEAContextSetFieldUInt(*(AEAContext *)a1, field, *(unsigned int *)(a1 + 8));
  if ((_DWORD)result)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t key path setter for ArchiveEncryptionContext.compressionBlockSize : ArchiveEncryptionContext(unint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = AEAContextSetCompressionBlockSize(*(AEAContext_impl **)(*(_QWORD *)a2 + 16), *a1);
  if ((_DWORD)result)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveEncryptionContext.compressionBlockSize.getter()
{
  uint64_t v0;

  return AEAContextGetFieldUInt(*(AEAContext *)(v0 + 16), 4u);
}

uint64_t AEAContextGetCompressionBlockSize(AEAContext_impl *a1)
{
  return AEAContextGetFieldUInt(a1, 4u);
}

uint64_t ArchiveEncryptionContext.compressionBlockSize.setter(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  if (a1 >= 0xFFFFFFFF)
    v2 = 0xFFFFFFFFLL;
  else
    v2 = a1;
  result = AEAContextSetFieldUInt(*(AEAContext *)(v1 + 16), 4u, v2);
  if ((_DWORD)result)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t (*ArchiveEncryptionContext.compressionBlockSize.modify(uint64_t *a1))(uint64_t a1)
{
  uint64_t v1;
  AEAContext_impl *v3;

  v3 = *(AEAContext_impl **)(v1 + 16);
  a1[1] = (uint64_t)v3;
  *a1 = AEAContextGetFieldUInt(v3, 4u);
  return ArchiveEncryptionContext.compressionBlockSize.modify;
}

uint64_t ArchiveEncryptionContext.compressionBlockSize.modify(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
    v1 = 0xFFFFFFFFLL;
  else
    v1 = *(_QWORD *)a1;
  result = AEAContextSetFieldUInt(*(AEAContext *)(a1 + 8), 4u, v1);
  if ((_DWORD)result)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t ArchiveEncryptionContext.rawSize.getter()
{
  return ArchiveEncryptionContext.paddingSize.getter(0xDu);
}

uint64_t ArchiveEncryptionContext.containerSize.getter()
{
  return ArchiveEncryptionContext.paddingSize.getter(0xEu);
}

uint64_t ArchiveEncryptionContext.paddingSize.getter(AEAContextField field)
{
  uint64_t v1;
  uint64_t result;

  result = AEAContextGetFieldUInt(*(AEAContext *)(v1 + 16), field);
  if ((result & 0x8000000000000000) != 0)
    __break(1u);
  return result;
}

uint64_t key path getter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  if (ArchiveEncryptionContext._getBlob(field:representation:)(9u, 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
    SymmetricKey.init<A>(data:)();
    v2 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
  }
  else
  {
    v4 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
  }
}

uint64_t ArchiveEncryptionContext.symmetricKey.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v8;
  uint64_t result;
  uint64_t v11[3];
  uint64_t v12;
  _UNKNOWN **v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of SymmetricKey?(a1, (uint64_t)v4);
  v5 = type metadata accessor for SymmetricKey();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    __break(1u);
    MEMORY[0x2207DD440](v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = v5;
    v13 = &protocol witness table for SymmetricKey;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 32))(boxed_opaque_existential_1, v4, v5);
    v8 = __swift_project_boxed_opaque_existential_1(v11, v12);
    MEMORY[0x24BDAC7A8](v8);
    SymmetricKey.withUnsafeBytes<A>(_:)();
    outlined destroy of SymmetricKey?(a1);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  return result;
}

uint64_t outlined init with copy of SymmetricKey?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ArchiveEncryptionContext.symmetricKey.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  size_t buf_size[2];

  buf_size[1] = *MEMORY[0x24BDAC8D0];
  buf_size[0] = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 9u, 0, 0, 0, buf_size) < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v3 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      v4 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v3, v1, 9u, 0, buf_size);
      swift_release();
      buf_size[0] = v4;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
      SymmetricKey.init<A>(data:)();
      v5 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 0, 1, v5);
    }
    else
    {
      v7 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, 1, 1, v7);
    }
  }
  return result;
}

void (*ArchiveEncryptionContext.symmetricKey.modify(size_t **a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t *v3;
  size_t v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*result)(uint64_t, char);

  v3 = (size_t *)malloc(0x28uLL);
  *a1 = v3;
  v3[2] = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?)
                             - 8)
                 + 64);
  v3[3] = (size_t)malloc(v4);
  v5 = malloc(v4);
  v3[4] = (size_t)v5;
  *v3 = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 9u, 0, 0, 0, v3) < 0)
  {
    result = (void (*)(uint64_t, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v6 = *v3;
    if (*v3)
    {
      swift_retain();
      v7 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v6, v1, 9u, 0, v3);
      swift_release();
      v3[1] = v7;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
      SymmetricKey.init<A>(data:)();
      v8 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
    }
    else
    {
      v9 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
    }
    return ArchiveEncryptionContext.symmetricKey.modify;
  }
  return result;
}

void ArchiveEncryptionContext.symmetricKey.modify(uint64_t a1, char a2)
{
  ArchiveEncryptionContext.symmetricKey.modify(a1, a2, (void (*)(void *))ArchiveEncryptionContext.symmetricKey.setter);
}

uint64_t key path getter for ArchiveEncryptionContext.password : ArchiveEncryptionContext@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8](v2);
  result = ArchiveEncryptionContext._getBlob(field:representation:)(0x13u, 0);
  if (result)
  {
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance ContiguousArray<A>, MEMORY[0x24BEE2A48]);
    v4 = String.init<A>(bytes:encoding:)();
    v6 = v5;
    result = swift_release();
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  *a1 = v4;
  a1[1] = v6;
  return result;
}

uint64_t ArchiveEncryptionContext.password.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4[2];

  if (a2)
  {
    v4[0] = a1;
    v4[1] = a2;
    swift_retain();
    swift_bridgeObjectRetain();
    specialized String.withUTF8<A>(_:)(v4, v2, 0x13u);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    while (1)
    {
      result = AEAContextSetFieldBlob(*(AEAContext *)(v2 + 16), 0x13u, 0, 0, 0);
      if ((result & 0x80000000) == 0)
        break;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  return result;
}

uint64_t ArchiveEncryptionContext.password.getter()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  size_t buf_size[2];

  buf_size[1] = *MEMORY[0x24BDAC8D0];
  v1 = type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8](v1);
  buf_size[0] = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v0 + 16), 0x13u, 0, 0, 0, buf_size) < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v2 = buf_size[0];
    if (!buf_size[0])
      return 0;
    swift_retain();
    v3 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v2, v0, 0x13u, 0, buf_size);
    swift_release();
    buf_size[0] = v3;
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance ContiguousArray<A>, MEMORY[0x24BEE2A48]);
    v4 = String.init<A>(bytes:encoding:)();
    swift_bridgeObjectRelease();
    return v4;
  }
  return result;
}

void (*ArchiveEncryptionContext.password.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  int64_t *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*result)(uint64_t **, char);

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = type metadata accessor for String.Encoding();
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[2] = 0;
  v6 = v3 + 2;
  v3[5] = v5;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 0x13u, 0, 0, 0, v3 + 2) < 0)
  {
    result = (void (*)(uint64_t **, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v7 = *v6;
    if (*v6)
    {
      swift_retain();
      v8 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v7, v1, 0x13u, 0, v3 + 2);
      swift_release();
      v3[3] = v8;
      static String.Encoding.utf8.getter();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance ContiguousArray<A>, MEMORY[0x24BEE2A48]);
      v9 = String.init<A>(bytes:encoding:)();
      v11 = v10;
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = 0;
      v11 = 0;
    }
    *v3 = v9;
    v3[1] = v11;
    return ArchiveEncryptionContext.password.modify;
  }
  return result;
}

void ArchiveEncryptionContext.password.modify(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *a1;
  v4 = **a1;
  v3 = (*a1)[1];
  v5 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    ArchiveEncryptionContext.password.setter(v4, v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    ArchiveEncryptionContext.password.setter(**a1, v3);
  }
  free(v5);
  free(v2);
}

uint64_t ArchiveEncryptionContext.generateSymmetricKey()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  AEAContext_impl *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t result;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  size_t buf_size[2];

  buf_size[1] = *MEMORY[0x24BDAC8D0];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)buf_size - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)buf_size - v7;
  v9 = *(AEAContext_impl **)(v1 + 16);
  if (AEAContextGenerateFieldBlob(v9, 9u) < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v16 = 1;
    return swift_willThrow();
  }
  buf_size[0] = 0;
  if (AEAContextGetFieldBlob(v9, 9u, 0, 0, 0, buf_size) < 0)
    goto LABEL_11;
  v10 = buf_size[0];
  if (!buf_size[0])
  {
    v17 = type metadata accessor for SymmetricKey();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v8, 1, 1, v17);
    goto LABEL_9;
  }
  swift_retain();
  v11 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v10, v1, 9u, 0, buf_size);
  swift_release();
  buf_size[0] = v11;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
  lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
  SymmetricKey.init<A>(data:)();
  v12 = type metadata accessor for SymmetricKey();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v14(v8, 1, v12) == 1)
  {
LABEL_9:
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v18 = 1;
    swift_willThrow();
    return outlined destroy of SymmetricKey?((uint64_t)v8);
  }
  outlined init with copy of SymmetricKey?((uint64_t)v8, (uint64_t)v6);
  if (v14(v6, 1, v12) != 1)
  {
    outlined destroy of SymmetricKey?((uint64_t)v8);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v6, v12);
  }
  __break(1u);
LABEL_11:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ArchiveEncryptionContext.generatePassword()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  AEAContext_impl *v4;
  int64_t v5;
  uint64_t v6;
  char *v7;
  _BYTE *v8;
  uint64_t v9;
  void *v10;
  Swift::String result;
  size_t buf_size[2];

  buf_size[1] = *MEMORY[0x24BDAC8D0];
  v1 = type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)buf_size - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(AEAContext_impl **)(v0 + 16);
  if (AEAContextGenerateFieldBlob(v4, 0x13u) < 0)
    goto LABEL_5;
  buf_size[0] = 0;
  if (AEAContextGetFieldBlob(v4, 0x13u, 0, 0, 0, buf_size) < 0)
  {
    v9 = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_8;
  }
  v5 = buf_size[0];
  if (!buf_size[0])
    goto LABEL_5;
  swift_retain();
  v6 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v5, v0, 0x13u, 0, buf_size);
  swift_release();
  buf_size[0] = v6;
  static String.Encoding.utf8.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
  lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance ContiguousArray<A>, MEMORY[0x24BEE2A48]);
  v0 = String.init<A>(bytes:encoding:)();
  v3 = v7;
  swift_bridgeObjectRelease();
  if (!v3)
  {
LABEL_5:
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v8 = 1;
    swift_willThrow();
  }
  v9 = v0;
  v10 = v3;
LABEL_8:
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

uint64_t ArchiveEncryptionContext.setSymmetricKey(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v5[3];
  uint64_t v6;
  _UNKNOWN **v7;

  v2 = type metadata accessor for SymmetricKey();
  v6 = v2;
  v7 = &protocol witness table for SymmetricKey;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v5);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_1, a1, v2);
  __swift_project_boxed_opaque_existential_1(v5, v6);
  SymmetricKey.withUnsafeBytes<A>(_:)();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ArchiveEncryptionContext.setPassword(_:)(Swift::String a1)
{
  uint64_t v1;
  Swift::String v2;

  v2 = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  specialized String.withUTF8<A>(_:)(&v2._countAndFlagsBits, v1, 0x13u);
  swift_bridgeObjectRelease();
}

void ArchiveEncryptionContext.setSigningPublicKey(_:)(uint64_t a1)
{
  uint64_t v1;

  swift_retain();
  specialized P256.Signing.PublicKey.withUnsafeX963Bytes<A>(_:)(a1, v1, 7, MEMORY[0x24BDC6A28]);
}

void ArchiveEncryptionContext.setSigningPrivateKey(_:)(uint64_t a1)
{
  uint64_t v1;

  swift_retain();
  specialized P256.Signing.PublicKey.withUnsafeX963Bytes<A>(_:)(a1, v1, 8, MEMORY[0x24BDC6998]);
}

void ArchiveEncryptionContext.setRecipientPublicKey(_:)(uint64_t a1)
{
  uint64_t v1;

  swift_retain();
  specialized P256.Signing.PublicKey.withUnsafeX963Bytes<A>(_:)(a1, v1, 10, MEMORY[0x24BDC6888]);
}

void ArchiveEncryptionContext.setRecipientPrivateKey(_:)(uint64_t a1)
{
  uint64_t v1;

  swift_retain();
  specialized P256.Signing.PublicKey.withUnsafeX963Bytes<A>(_:)(a1, v1, 11, MEMORY[0x24BDC6920]);
}

uint64_t key path getter for ArchiveEncryptionContext.authData : ArchiveEncryptionContext@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  result = ArchiveEncryptionContext._getBlob(field:representation:)(5u, 0);
  if (result)
  {
    v3 = specialized Data.init<A>(_:)(result);
    v5 = v4;
    result = swift_release();
  }
  else
  {
    v3 = 0;
    v5 = 0xF000000000000000;
  }
  *a1 = v3;
  a1[1] = v5;
  return result;
}

uint64_t key path setter for ArchiveEncryptionContext.authData : ArchiveEncryptionContext(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  outlined copy of Data?(*a1, v2);
  ArchiveEncryptionContext._setBlob(field:data:)(5u, v1, v2);
  return outlined consume of Data?(v1, v2);
}

uint64_t ArchiveEncryptionContext.authData.setter(uint64_t a1, unint64_t a2)
{
  ArchiveEncryptionContext._setBlob(field:data:)(5u, a1, a2);
  return outlined consume of Data?(a1, a2);
}

uint64_t ArchiveEncryptionContext.authData.getter()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  size_t buf_size[2];

  buf_size[1] = *MEMORY[0x24BDAC8D0];
  buf_size[0] = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v0 + 16), 5u, 0, 0, 0, buf_size) < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v1 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      v2 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v1, v0, 5u, 0, buf_size);
      swift_release();
      v1 = specialized Data.init<A>(_:)(v2);
      swift_bridgeObjectRelease();
    }
    return v1;
  }
  return result;
}

void (*ArchiveEncryptionContext.authData.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  size_t *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void (*result)(uint64_t **, char);

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[2] = 0;
  v4 = v3 + 2;
  v3[3] = v1;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 5u, 0, 0, 0, v3 + 2) < 0)
  {
    result = (void (*)(uint64_t **, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v5 = *v4;
    if (*v4)
    {
      swift_retain();
      v6 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v5, v1, 5u, 0, v4);
      swift_release();
      v7 = specialized Data.init<A>(_:)(v6);
      v9 = v8;
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = 0;
      v9 = 0xF000000000000000;
    }
    v3[4] = 0;
    *v3 = v7;
    v3[1] = v9;
    return ArchiveEncryptionContext.authData.modify;
  }
  return result;
}

void ArchiveEncryptionContext.authData.modify(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v2 = *a1;
  v3 = **a1;
  v4 = (*a1)[1];
  v5 = (*a1)[4];
  if ((a2 & 1) != 0)
  {
    outlined copy of Data?(**a1, v4);
    ArchiveEncryptionContext._setBlob(field:data:)(5u, v3, v4);
    if (!v5)
    {
      outlined consume of Data?(v3, v4);
      v6 = *v2;
      v7 = v2[1];
LABEL_6:
      outlined consume of Data?(v6, v7);
      free(v2);
      return;
    }
  }
  else
  {
    ArchiveEncryptionContext._setBlob(field:data:)(5u, v3, v4);
    if (!v5)
    {
      v6 = v3;
      v7 = v4;
      goto LABEL_6;
    }
  }
  MEMORY[0x2207DD440](v5);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t ArchiveEncryptionContext.archiveIdentifier.getter()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  size_t buf_size[2];

  buf_size[1] = *MEMORY[0x24BDAC8D0];
  buf_size[0] = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v0 + 16), 0x12u, 0, 0, 0, buf_size) < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v1 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      v2 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v1, v0, 0x12u, 0, buf_size);
      swift_release();
      v1 = specialized Data.init<A>(_:)(v2);
      swift_bridgeObjectRelease();
    }
    return v1;
  }
  return result;
}

uint64_t key path getter for ArchiveEncryptionContext.signatureEncryptionKey : ArchiveEncryptionContext@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  if (ArchiveEncryptionContext._getBlob(field:representation:)(0xCu, 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
    SymmetricKey.init<A>(data:)();
    v2 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
  }
  else
  {
    v4 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
  }
}

uint64_t ArchiveEncryptionContext.signatureEncryptionKey.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v8;
  uint64_t result;
  uint64_t v11[3];
  uint64_t v12;
  _UNKNOWN **v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of SymmetricKey?(a1, (uint64_t)v4);
  v5 = type metadata accessor for SymmetricKey();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    __break(1u);
    MEMORY[0x2207DD440](v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = v5;
    v13 = &protocol witness table for SymmetricKey;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 32))(boxed_opaque_existential_1, v4, v5);
    v8 = __swift_project_boxed_opaque_existential_1(v11, v12);
    MEMORY[0x24BDAC7A8](v8);
    SymmetricKey.withUnsafeBytes<A>(_:)();
    outlined destroy of SymmetricKey?(a1);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  return result;
}

uint64_t ArchiveEncryptionContext.signatureEncryptionKey.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  size_t buf_size[2];

  buf_size[1] = *MEMORY[0x24BDAC8D0];
  buf_size[0] = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 0xCu, 0, 0, 0, buf_size) < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v3 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      v4 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v3, v1, 0xCu, 0, buf_size);
      swift_release();
      buf_size[0] = v4;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
      SymmetricKey.init<A>(data:)();
      v5 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 0, 1, v5);
    }
    else
    {
      v7 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, 1, 1, v7);
    }
  }
  return result;
}

void (*ArchiveEncryptionContext.signatureEncryptionKey.modify(size_t **a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t *v3;
  size_t v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*result)(uint64_t, char);

  v3 = (size_t *)malloc(0x28uLL);
  *a1 = v3;
  v3[2] = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?)
                             - 8)
                 + 64);
  v3[3] = (size_t)malloc(v4);
  v5 = malloc(v4);
  v3[4] = (size_t)v5;
  *v3 = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 0xCu, 0, 0, 0, v3) < 0)
  {
    result = (void (*)(uint64_t, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v6 = *v3;
    if (*v3)
    {
      swift_retain();
      v7 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v6, v1, 0xCu, 0, v3);
      swift_release();
      v3[1] = v7;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
      SymmetricKey.init<A>(data:)();
      v8 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
    }
    else
    {
      v9 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
    }
    return ArchiveEncryptionContext.signatureEncryptionKey.modify;
  }
  return result;
}

void ArchiveEncryptionContext.signatureEncryptionKey.modify(uint64_t a1, char a2)
{
  ArchiveEncryptionContext.symmetricKey.modify(a1, a2, (void (*)(void *))ArchiveEncryptionContext.signatureEncryptionKey.setter);
}

uint64_t key path getter for ArchiveEncryptionContext.mainKey : ArchiveEncryptionContext@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  if (ArchiveEncryptionContext._getBlob(field:representation:)(6u, 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
    SymmetricKey.init<A>(data:)();
    v2 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
  }
  else
  {
    v4 = type metadata accessor for SymmetricKey();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
  }
}

uint64_t key path setter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of SymmetricKey?(a1, (uint64_t)v9);
  return a5(v9);
}

uint64_t ArchiveEncryptionContext.mainKey.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v8;
  uint64_t result;
  uint64_t v11[3];
  uint64_t v12;
  _UNKNOWN **v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of SymmetricKey?(a1, (uint64_t)v4);
  v5 = type metadata accessor for SymmetricKey();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    __break(1u);
    MEMORY[0x2207DD440](v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v12 = v5;
    v13 = &protocol witness table for SymmetricKey;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 32))(boxed_opaque_existential_1, v4, v5);
    v8 = __swift_project_boxed_opaque_existential_1(v11, v12);
    MEMORY[0x24BDAC7A8](v8);
    SymmetricKey.withUnsafeBytes<A>(_:)();
    outlined destroy of SymmetricKey?(a1);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  return result;
}

uint64_t ArchiveEncryptionContext.mainKey.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  size_t buf_size[2];

  buf_size[1] = *MEMORY[0x24BDAC8D0];
  buf_size[0] = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 6u, 0, 0, 0, buf_size) < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v3 = buf_size[0];
    if (buf_size[0])
    {
      swift_retain();
      v4 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v3, v1, 6u, 0, buf_size);
      swift_release();
      buf_size[0] = v4;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
      SymmetricKey.init<A>(data:)();
      v5 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 0, 1, v5);
    }
    else
    {
      v7 = type metadata accessor for SymmetricKey();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a1, 1, 1, v7);
    }
  }
  return result;
}

void (*ArchiveEncryptionContext.mainKey.modify(size_t **a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t *v3;
  size_t v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*result)(uint64_t, char);

  v3 = (size_t *)malloc(0x28uLL);
  *a1 = v3;
  v3[2] = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?)
                             - 8)
                 + 64);
  v3[3] = (size_t)malloc(v4);
  v5 = malloc(v4);
  v3[4] = (size_t)v5;
  *v3 = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v1 + 16), 6u, 0, 0, 0, v3) < 0)
  {
    result = (void (*)(uint64_t, char))_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v6 = *v3;
    if (*v3)
    {
      swift_retain();
      v7 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v6, v1, 6u, 0, v3);
      swift_release();
      v3[1] = v7;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
      lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
      SymmetricKey.init<A>(data:)();
      v8 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
    }
    else
    {
      v9 = type metadata accessor for SymmetricKey();
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
    }
    return ArchiveEncryptionContext.mainKey.modify;
  }
  return result;
}

void ArchiveEncryptionContext.mainKey.modify(uint64_t a1, char a2)
{
  ArchiveEncryptionContext.symmetricKey.modify(a1, a2, (void (*)(void *))ArchiveEncryptionContext.mainKey.setter);
}

void ArchiveEncryptionContext.symmetricKey.modify(uint64_t a1, char a2, void (*a3)(void *))
{
  void *v4;
  void *v5;
  void *v6;

  v4 = *(void **)a1;
  v5 = *(void **)(*(_QWORD *)a1 + 24);
  v6 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    outlined init with copy of SymmetricKey?((uint64_t)v6, (uint64_t)v5);
    a3(v5);
    outlined destroy of SymmetricKey?((uint64_t)v6);
  }
  else
  {
    a3(v6);
  }
  free(v6);
  free(v5);
  free(v4);
}

uint64_t ArchiveEncryptionContext._getBlob(field:representation:)(AEAContextField field, AEAContextFieldRepresentation representation)
{
  uint64_t v2;
  int64_t v5;
  uint64_t v6;
  uint64_t result;
  size_t buf_size[2];

  buf_size[1] = *MEMORY[0x24BDAC8D0];
  buf_size[0] = 0;
  if (AEAContextGetFieldBlob(*(AEAContext *)(v2 + 16), field, representation, 0, 0, buf_size) < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    v5 = buf_size[0];
    if (!buf_size[0])
      return 0;
    swift_retain();
    v6 = specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(v5, v2, field, representation, buf_size);
    swift_release();
    return v6;
  }
  return result;
}

uint64_t partial apply for closure #1 in ArchiveEncryptionContext._setBlob(field:key:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return closure #1 in ArchiveEncryptionContext._setBlob(field:key:)(a1, a2, *(_QWORD *)(v2 + 16), *(_DWORD *)(v2 + 24), 0);
}

uint64_t outlined destroy of SymmetricKey?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ArchiveEncryptionContext._setBlob(field:data:)(AEAContextField field, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  _BYTE *v5;

  if (a3 >> 60 != 15)
    __asm { BR              X10 }
  result = AEAContextSetFieldBlob(*(AEAContext *)(v3 + 16), field, 0, 0, 0);
  if ((result & 0x80000000) != 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v5 = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t closure #1 in ArchiveEncryptionContext._setBlob(field:key:)(uint64_t buf, uint64_t a2, uint64_t a3, AEAContextField field, AEAContextFieldRepresentation representation)
{
  _BYTE *v5;

  if (buf)
  {
    buf = AEAContextSetFieldBlob(*(AEAContext *)(a3 + 16), field, representation, (const uint8_t *)buf, a2 - buf);
    if ((buf & 0x80000000) != 0)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *v5 = 1;
      return swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  return buf;
}

const uint8_t *specialized String.withUTF8<A>(_:)(uint64_t *a1, uint64_t a2, AEAContextField field)
{
  uint64_t v5;
  unint64_t v6;
  const uint8_t *v7;
  size_t v8;
  AEAContext_impl *v9;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  const uint8_t *result;
  size_t v15;
  _QWORD v16[2];

  v5 = *a1;
  v6 = a1[1];
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v16[0] = v5;
    v16[1] = v6 & 0xFFFFFFFFFFFFFFLL;
    v9 = *(AEAContext_impl **)(a2 + 16);
    v7 = (const uint8_t *)v16;
    goto LABEL_7;
  }
  v5 = static String._copying(_:)();
  v12 = v11;
  swift_bridgeObjectRelease();
  *a1 = v5;
  a1[1] = v12;
  v6 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (const uint8_t *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
    v9 = *(AEAContext_impl **)(a2 + 16);
  }
  else
  {
    result = (const uint8_t *)_StringObject.sharedUTF8.getter();
    if (!result)
    {
      __break(1u);
      return result;
    }
    v7 = result;
    v8 = v15;
    v9 = *(AEAContext_impl **)(a2 + 16);
  }
LABEL_7:
  if (AEAContextSetFieldBlob(v9, field, 0, v7, v8) < 0)
  {
    lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
  }
  return (const uint8_t *)swift_release();
}

void ArchiveEncryptionContext.__allocating_init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ArchiveEncryptionContext.init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ArchiveEncryptionContext.deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
    AEAContextDestroy(*(AEAContext *)(v0 + 16));
  return v0;
}

uint64_t ArchiveEncryptionContext.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 24) == 1)
    AEAContextDestroy(*(AEAContext *)(v0 + 16));
  return swift_deallocClassInstance();
}

void vtable thunk for _AAObjectWrapper.__allocating_init(object:owned:) dispatching to ArchiveEncryptionContext.__allocating_init(object:owned:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t static ArchiveEncryptionContext.sign(encryptedStream:encryptionContext:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _BYTE *v5;

  swift_beginAccess();
  result = *(_QWORD *)(a1 + 16);
  if (result)
  {
    result = AEAStreamSign((AAByteStream)result, *(AEAContext *)(a2 + 16));
    if ((result & 0x80000000) != 0)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *v5 = 1;
      return swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall ArchiveEncryptionContext.decryptAttributes()()
{
  uint64_t v0;

  return AEAContextDecryptAttributes(*(AEAContext *)(v0 + 16)) == 0;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = String.subscript.getter();
  v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0);
      v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2207DCD50](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2207DCD50);
LABEL_9:
      _StringObject.sharedUTF8.getter();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2207DCD50]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t specialized Collection.count.getter(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)();
  }
  __break(1u);
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
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
    v5 = MEMORY[0x2207DCD8C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, AEAContextField a5, AEAContextFieldRepresentation a6)
{
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = __DataStorage._bytes.getter();
  v12 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v12 += a1 - result;
  }
  v13 = __OFSUB__(a2, a1);
  v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  v15 = __DataStorage._length.getter();
  if (v15 >= v14)
    v16 = v14;
  else
    v16 = v15;
  v17 = v12 + v16;
  if (v12)
    v18 = v17;
  else
    v18 = 0;
  closure #1 in ArchiveEncryptionContext._setBlob(field:key:)(v12, v18, a4, a5, a6);
  return swift_release();
}

_BYTE *closure #1 in Data.init<A>(_:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)specialized Data.InlineData.init(_:)(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t specialized Array.init(_unsafeUninitializedCapacity:initializingWith:)(int64_t a1, uint64_t a2, AEAContextField a3, AEAContextFieldRepresentation a4, size_t *a5)
{
  uint64_t v10;
  uint64_t result;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    if (a1)
    {
      v10 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(_QWORD *)(v10 + 16) = a1;
    }
    else
    {
      v10 = MEMORY[0x24BEE4AF8];
    }
    if (AEAContextGetFieldBlob(*(AEAContext *)(a2 + 16), a3, a4, *a5, (uint8_t *)(v10 + 32), 0) < 0)
      goto LABEL_10;
    if ((uint64_t)*a5 <= a1)
    {
      *(_QWORD *)(v10 + 16) = *a5;
      return v10;
    }
  }
  __break(1u);
LABEL_10:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
    result = MEMORY[0x2207DD494](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t specialized Data.InlineData.init(_:)(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  type metadata accessor for __DataStorage();
  swift_allocObject();
  result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousArray<UInt8>);
  v10 = lazy protocol witness table accessor for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>(&lazy protocol witness table cache variable for type ContiguousArray<UInt8> and conformance <A> ContiguousArray<A>, MEMORY[0x24BDD06A8]);
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_retain();
  closure #1 in Data.init<A>(_:)(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined copy of Data._Representation(a1, a2);
  return a1;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_220076794@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = AEAContextGetPaddingSize(*(AEAContext_impl **)(*(_QWORD *)a1 + 16));
  if ((result & 0x8000000000000000) != 0)
    __break(1u);
  else
    *a2 = result;
  return result;
}

uint64_t sub_2200767CC@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = AEAContextGetChecksumMode(*(AEAContext_impl **)(*(_QWORD *)a1 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_2200767F8(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.checksumMode : ArchiveEncryptionContext(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))AEAContextSetChecksumMode);
}

uint64_t sub_220076818@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = AEAContextGetCompressionAlgorithm(*(AEAContext_impl **)(*(_QWORD *)a1 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_220076844(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.checksumMode : ArchiveEncryptionContext(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))AEAContextSetCompressionAlgorithm);
}

uint64_t sub_220076864@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = AEAContextGetCompressionBlockSize(*(AEAContext_impl **)(*(_QWORD *)a1 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_220076898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext(a1, a2, a3, a4, (uint64_t (*)(char *))ArchiveEncryptionContext.symmetricKey.setter);
}

uint64_t sub_2200768B8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return ArchiveEncryptionContext.password.setter(v1, v2);
}

uint64_t sub_220076900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext(a1, a2, a3, a4, (uint64_t (*)(char *))ArchiveEncryptionContext.signatureEncryptionKey.setter);
}

uint64_t sub_220076920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for ArchiveEncryptionContext.symmetricKey : ArchiveEncryptionContext(a1, a2, a3, a4, (uint64_t (*)(char *))ArchiveEncryptionContext.mainKey.setter);
}

ValueMetadata *type metadata accessor for AEAContextTraits()
{
  return &type metadata for AEAContextTraits;
}

uint64_t dispatch thunk of _AppleArchiveContiguousBytes.withUnsafeBytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t method lookup function for ArchiveEncryptionContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.__allocating_init(profile:compressionAlgorithm:compressionBlockSize:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.profile.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.signatureMode.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.encryptionMode.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.paddingSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.paddingSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.paddingSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.checksumMode.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.checksumMode.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.checksumMode.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionAlgorithm.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionAlgorithm.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionAlgorithm.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionBlockSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionBlockSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.compressionBlockSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.rawSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.containerSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.symmetricKey.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.symmetricKey.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.symmetricKey.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.password.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.password.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.password.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.generateSymmetricKey()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.generatePassword()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setSymmetricKey(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setPassword(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setSigningPublicKey(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setSigningPrivateKey(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setRecipientPublicKey(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.setRecipientPrivateKey(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.authData.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.authData.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.authData.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.archiveIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.signatureEncryptionKey.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.signatureEncryptionKey.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.signatureEncryptionKey.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.mainKey.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.mainKey.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of ArchiveEncryptionContext.mainKey.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of _AppleArchiveContiguousBytesX963.withUnsafeX963Bytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return dispatch thunk of _AppleArchiveContiguousBytes.withUnsafeBytes<A>(_:)(a1, a2, a3, a4, a5);
}

uint64_t closure #1 in ArchiveEncryptionContext._setBlob(field:key:)partial apply(uint64_t a1, uint64_t a2)
{
  return partial apply for closure #1 in ArchiveEncryptionContext._setBlob(field:key:)(a1, a2);
}

uint64_t static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)(a1, a2, a3, a4, MEMORY[0x24BED2E40]);
}

uint64_t static ArchiveByteStream.encryptionStream(appendingTo:encryptionContext:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)(a1, a2, a3, a4, MEMORY[0x24BED2E48]);
}

uint64_t static ArchiveByteStream.decryptionStream(readingFrom:encryptionContext:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)(a1, a2, a3, a4, MEMORY[0x24BED2E20]);
}

uint64_t static ArchiveByteStream.encryptionStream(writingTo:encryptionContext:flags:threadCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  swift_beginAccess();
  result = *(_QWORD *)(a1 + 16);
  if (!result)
    goto LABEL_10;
  if (a4 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a4 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  v9 = a5();
  if (!v9)
    return 0;
  v10 = v9;
  type metadata accessor for ArchiveByteStream();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v11 + 16) = v10;
  *(_BYTE *)(v11 + 24) = 1;
  return v11;
}

AAByteStream_impl *static ArchiveByteStream.randomAccessDecryptionStream(readingFrom:encryptionContext:allocationLimit:flags:threadCount:)(AAByteStream_impl *result, uint64_t a2, int64_t a3, AAFlagSet *a4, uint64_t a5)
{
  AAByteStream_impl *v8;
  AAFlagSet v9;
  AAByteStream v10;
  AAByteStream v11;
  uint64_t v12;

  if (a3 < -1)
    goto LABEL_11;
  v8 = result;
  v9 = *a4;
  swift_beginAccess();
  result = (AAByteStream_impl *)*((_QWORD *)v8 + 2);
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if (a5 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (a5 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v10 = AEADecryptionRandomAccessInputStreamOpen(result, *(AEAContext *)(a2 + 16), a3, v9, a5);
  if (!v10)
    return 0;
  v11 = v10;
  type metadata accessor for ArchiveByteStream();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  swift_beginAccess();
  *(_QWORD *)(v12 + 16) = v11;
  *(_BYTE *)(v12 + 24) = 1;
  return (AAByteStream_impl *)v12;
}

uint64_t ArchiveByteStream.close(updatingContext:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  _BYTE *v4;

  swift_beginAccess();
  result = *(_QWORD *)(v1 + 16);
  if (result)
  {
    result = AEAEncryptionOutputStreamCloseAndUpdateContext((AAByteStream)result, *(AEAContext *)(a1 + 16));
    *(_QWORD *)(v1 + 16) = 0;
    if ((_DWORD)result)
    {
      lazy protocol witness table accessor for type ArchiveError and conformance ArchiveError();
      swift_allocError();
      *v4 = 0;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t ArchiveEncryptionContext.Profile.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_hmac__none__ecdsa_p256.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__symmetric__none.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__symmetric__ecdsa_p256.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__ecdhe_p256__none.getter(_DWORD *a1@<X8>)
{
  *a1 = 3;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__ecdhe_p256__ecdsa_p256.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ArchiveEncryptionContext.Profile.hkdf_sha256_aesctr_hmac__scrypt__none.getter(_DWORD *a1@<X8>)
{
  *a1 = 5;
}

uint64_t ArchiveEncryptionContext.Profile.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t ArchiveEncryptionContext.Profile.rawValue.setter(uint64_t result)
{
  _DWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*ArchiveEncryptionContext.Profile.rawValue.modify())()
{
  return protocol witness for Collection.subscript.read in conformance ArchiveHeader._FieldTypes;
}

unint64_t ArchiveEncryptionContext.Profile.description.getter()
{
  _DWORD *v0;
  unint64_t result;

  result = 0xD000000000000022;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      result = 0xD000000000000028;
      break;
    case 2:
      result = 0xD00000000000002ELL;
      break;
    case 3:
      result = 0xD000000000000029;
      break;
    case 4:
      result = 0xD00000000000002FLL;
      break;
    case 5:
      result = 0xD000000000000025;
      break;
    default:
      result = 4144959;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ArchiveEncryptionContext.Profile and conformance ArchiveEncryptionContext.Profile()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ArchiveEncryptionContext.Profile and conformance ArchiveEncryptionContext.Profile;
  if (!lazy protocol witness table cache variable for type ArchiveEncryptionContext.Profile and conformance ArchiveEncryptionContext.Profile)
  {
    result = MEMORY[0x2207DD494](&protocol conformance descriptor for ArchiveEncryptionContext.Profile, &type metadata for ArchiveEncryptionContext.Profile);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArchiveEncryptionContext.Profile and conformance ArchiveEncryptionContext.Profile);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArchiveEncryptionContext.Profile()
{
  return &type metadata for ArchiveEncryptionContext.Profile;
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t Algorithm.rawValue.getter()
{
  return MEMORY[0x24BEE0020]();
}

uint64_t type metadata accessor for Algorithm()
{
  return MEMORY[0x24BEE0028]();
}

uint64_t FilePath.withCString<A>(_:)()
{
  return MEMORY[0x24BEE6010]();
}

uint64_t FilePath.init(platformString:)()
{
  return MEMORY[0x24BEE6048]();
}

uint64_t type metadata accessor for FilePath()
{
  return MEMORY[0x24BEE60D8]();
}

uint64_t FilePath.init(_:)()
{
  return MEMORY[0x24BEE6100]();
}

uint64_t SymmetricKey.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x24BDC63A0]();
}

uint64_t SymmetricKey.init<A>(data:)()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0830]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return MEMORY[0x24BDCFA50]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t String.init(cString:encoding:)()
{
  return MEMORY[0x24BDCFA80]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
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

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x24BEE0C38]();
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

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t Collection.underestimatedCount.getter()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t Collection.count.getter()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
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

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x24BEE4310](*(_QWORD *)&a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
  MEMORY[0x24BEE4318](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

void AAArchiveStreamCancel(AAArchiveStream s)
{
  MEMORY[0x24BED29E0](s);
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return MEMORY[0x24BED29E8](s);
}

ssize_t AAArchiveStreamProcess(AAArchiveStream istream, AAArchiveStream ostream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x24BED29F0](istream, ostream, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

int AAArchiveStreamReadHeader(AAArchiveStream s, AAHeader *header)
{
  return MEMORY[0x24BED2A00](s, header);
}

int AAArchiveStreamWriteHeader(AAArchiveStream s, AAHeader header)
{
  return MEMORY[0x24BED2A10](s, header);
}

int AAArchiveStreamWritePathList(AAArchiveStream s, AAPathList path_list, AAFieldKeySet key_set, const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x24BED2A18](s, path_list, key_set, dir, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

void AAByteStreamCancel(AAByteStream s)
{
  MEMORY[0x24BED2A28](s);
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x24BED2A38](s);
}

off_t AAByteStreamProcess(AAByteStream istream, AAByteStream ostream)
{
  return MEMORY[0x24BED2A58](istream, ostream);
}

off_t AAByteStreamSeek(AAByteStream s, off_t offset, int whence)
{
  return MEMORY[0x24BED2A78](s, offset, *(_QWORD *)&whence);
}

AAByteStream AACompressionOutputStreamOpen(AAByteStream compressed_stream, AACompressionAlgorithm compression_algorithm, size_t block_size, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x24BED2A90](compressed_stream, *(_QWORD *)&compression_algorithm, block_size, flags, *(_QWORD *)&n_threads);
}

AAArchiveStream AAConvertArchiveOutputStreamOpen(AAArchiveStream stream, AAFieldKeySet insert_key_set, AAFieldKeySet remove_key_set, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x24BED2AA0](stream, insert_key_set, remove_key_set, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

AAArchiveStream AACustomArchiveStreamOpen(void)
{
  return (AAArchiveStream)MEMORY[0x24BED2AA8]();
}

void AACustomArchiveStreamSetCancelProc(AAArchiveStream s, AAArchiveStreamCancelProc proc)
{
  MEMORY[0x24BED2AB0](s, proc);
}

void AACustomArchiveStreamSetCloseProc(AAArchiveStream s, AAArchiveStreamCloseProc proc)
{
  MEMORY[0x24BED2AB8](s, proc);
}

void AACustomArchiveStreamSetData(AAArchiveStream s, void *data)
{
  MEMORY[0x24BED2AC0](s, data);
}

void AACustomArchiveStreamSetReadHeaderProc(AAArchiveStream s, AAArchiveStreamReadHeaderProc proc)
{
  MEMORY[0x24BED2AC8](s, proc);
}

void AACustomArchiveStreamSetWriteBlobProc(AAArchiveStream s, AAArchiveStreamWriteBlobProc proc)
{
  MEMORY[0x24BED2AD0](s, proc);
}

void AACustomArchiveStreamSetWriteHeaderProc(AAArchiveStream s, AAArchiveStreamWriteHeaderProc proc)
{
  MEMORY[0x24BED2AD8](s, proc);
}

AAByteStream AACustomByteStreamOpen(void)
{
  return (AAByteStream)MEMORY[0x24BED2AE8]();
}

void AACustomByteStreamSetCancelProc(AAByteStream s, AAByteStreamCancelProc proc)
{
  MEMORY[0x24BED2AF0](s, proc);
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
  MEMORY[0x24BED2B00](s, proc);
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
  MEMORY[0x24BED2B10](s, data);
}

void AACustomByteStreamSetPReadProc(AAByteStream s, AAByteStreamPReadProc proc)
{
  MEMORY[0x24BED2B18](s, proc);
}

void AACustomByteStreamSetPWriteProc(AAByteStream s, AAByteStreamPWriteProc proc)
{
  MEMORY[0x24BED2B28](s, proc);
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
  MEMORY[0x24BED2B30](s, proc);
}

void AACustomByteStreamSetSeekProc(AAByteStream s, AAByteStreamSeekProc proc)
{
  MEMORY[0x24BED2B40](s, proc);
}

void AACustomByteStreamSetWriteProc(AAByteStream s, AAByteStreamWriteProc proc)
{
  MEMORY[0x24BED2B48](s, proc);
}

AAByteStream AADecompressionRandomAccessInputStreamOpen(AAByteStream compressed_stream, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x24BED2B60](compressed_stream, alloc_limit, flags, *(_QWORD *)&n_threads);
}

int AAEntryXATBlobAppendEntry(AAEntryXATBlob xat, const char *key, const uint8_t *data, size_t data_size)
{
  return MEMORY[0x24BED2BA8](xat, key, data, data_size);
}

int AAEntryXATBlobApplyToPath(AAEntryXATBlob xat, const char *dir, const char *path, AAFlagSet flags)
{
  return MEMORY[0x24BED2BB0](xat, dir, path, flags);
}

int AAEntryXATBlobClear(AAEntryXATBlob xat)
{
  return MEMORY[0x24BED2BB8](xat);
}

AAEntryXATBlob AAEntryXATBlobCreate(void)
{
  return (AAEntryXATBlob)MEMORY[0x24BED2BC0]();
}

AAEntryXATBlob AAEntryXATBlobCreateWithEncodedData(const uint8_t *data, size_t data_size)
{
  return (AAEntryXATBlob)MEMORY[0x24BED2BC8](data, data_size);
}

AAEntryXATBlob AAEntryXATBlobCreateWithPath(const char *dir, const char *path, AAFlagSet flags)
{
  return (AAEntryXATBlob)MEMORY[0x24BED2BD0](dir, path, flags);
}

void AAEntryXATBlobDestroy(AAEntryXATBlob xat)
{
  MEMORY[0x24BED2BD8](xat);
}

const uint8_t *__cdecl AAEntryXATBlobGetEncodedData(AAEntryXATBlob xat)
{
  return (const uint8_t *)MEMORY[0x24BED2BE0](xat);
}

size_t AAEntryXATBlobGetEncodedSize(AAEntryXATBlob xat)
{
  return MEMORY[0x24BED2BE8](xat);
}

int AAEntryXATBlobGetEntry(AAEntryXATBlob xat, uint32_t i, size_t key_capacity, char *key, size_t *key_length, size_t data_capacity, uint8_t *data, size_t *data_size)
{
  return MEMORY[0x24BED2BF0](xat, *(_QWORD *)&i, key_capacity, key, key_length, data_capacity, data, data_size);
}

uint32_t AAEntryXATBlobGetEntryCount(AAEntryXATBlob xat)
{
  return MEMORY[0x24BED2BF8](xat);
}

int AAEntryXATBlobRemoveEntry(AAEntryXATBlob xat, uint32_t i)
{
  return MEMORY[0x24BED2C00](xat, *(_QWORD *)&i);
}

int AAEntryXATBlobSetEntry(AAEntryXATBlob xat, uint32_t i, const char *key, const uint8_t *data, size_t data_size)
{
  return MEMORY[0x24BED2C08](xat, *(_QWORD *)&i, key, data, data_size);
}

AAArchiveStream AAExtractArchiveOutputStreamOpen(const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x24BED2C10](dir, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

AAFieldKeySet AAFieldKeySetClone(AAFieldKeySet key_set)
{
  return (AAFieldKeySet)MEMORY[0x24BED2C18](key_set);
}

int AAFieldKeySetContainsKey(AAFieldKeySet key_set, AAFieldKey key)
{
  return MEMORY[0x24BED2C20](key_set, *(_QWORD *)key.skey);
}

AAFieldKeySet AAFieldKeySetCreate(void)
{
  return (AAFieldKeySet)MEMORY[0x24BED2C28]();
}

AAFieldKeySet AAFieldKeySetCreateWithString(const char *s)
{
  return (AAFieldKeySet)MEMORY[0x24BED2C30](s);
}

void AAFieldKeySetDestroy(AAFieldKeySet key_set)
{
  MEMORY[0x24BED2C38](key_set);
}

AAFieldKey AAFieldKeySetGetKey(AAFieldKeySet key_set, uint32_t i)
{
  return (AAFieldKey)MEMORY[0x24BED2C40](key_set, *(_QWORD *)&i);
}

uint32_t AAFieldKeySetGetKeyCount(AAFieldKeySet key_set)
{
  return MEMORY[0x24BED2C48](key_set);
}

int AAFieldKeySetInsertKey(AAFieldKeySet key_set, AAFieldKey key)
{
  return MEMORY[0x24BED2C50](key_set, *(_QWORD *)key.skey);
}

int AAFieldKeySetInsertKeySet(AAFieldKeySet key_set, AAFieldKeySet s)
{
  return MEMORY[0x24BED2C58](key_set, s);
}

int AAFieldKeySetRemoveKey(AAFieldKeySet key_set, AAFieldKey key)
{
  return MEMORY[0x24BED2C60](key_set, *(_QWORD *)key.skey);
}

int AAFieldKeySetRemoveKeySet(AAFieldKeySet key_set, AAFieldKeySet s)
{
  return MEMORY[0x24BED2C68](key_set, s);
}

int AAFieldKeySetSelectKeySet(AAFieldKeySet key_set, AAFieldKeySet s)
{
  return MEMORY[0x24BED2C70](key_set, s);
}

int AAFieldKeySetSerialize(AAFieldKeySet key_set, size_t capacity, char *s)
{
  return MEMORY[0x24BED2C78](key_set, capacity, s);
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return (AAByteStream)MEMORY[0x24BED2C88](*(_QWORD *)&fd, *(_QWORD *)&automatic_close);
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return (AAByteStream)MEMORY[0x24BED2C90](path, *(_QWORD *)&open_flags, open_mode);
}

int AAHeaderAssign(AAHeader header, AAHeader from_header)
{
  return MEMORY[0x24BED2C98](header, from_header);
}

int AAHeaderClear(AAHeader header)
{
  return MEMORY[0x24BED2CA0](header);
}

AAHeader AAHeaderClone(AAHeader header)
{
  return (AAHeader)MEMORY[0x24BED2CA8](header);
}

AAHeader AAHeaderCreate(void)
{
  return (AAHeader)MEMORY[0x24BED2CB0]();
}

AAHeader AAHeaderCreateWithEncodedData(size_t data_size, const uint8_t *data)
{
  return (AAHeader)MEMORY[0x24BED2CB8](data_size, data);
}

AAHeader AAHeaderCreateWithPath(AAFieldKeySet key_set, const char *dir, const char *path, AAFlagSet flags)
{
  return (AAHeader)MEMORY[0x24BED2CC0](key_set, dir, path, flags);
}

void AAHeaderDestroy(AAHeader header)
{
  MEMORY[0x24BED2CC8](header);
}

const uint8_t *__cdecl AAHeaderGetEncodedData(AAHeader header)
{
  return (const uint8_t *)MEMORY[0x24BED2CD0](header);
}

size_t AAHeaderGetEncodedSize(AAHeader header)
{
  return MEMORY[0x24BED2CD8](header);
}

int AAHeaderGetFieldBlob(AAHeader header, uint32_t i, uint64_t *size, uint64_t *offset)
{
  return MEMORY[0x24BED2CE0](header, *(_QWORD *)&i, size, offset);
}

uint32_t AAHeaderGetFieldCount(AAHeader header)
{
  return MEMORY[0x24BED2CE8](header);
}

int AAHeaderGetFieldHash(AAHeader header, uint32_t i, size_t capacity, AAHashFunction *hash_function, uint8_t *value)
{
  return MEMORY[0x24BED2CF0](header, *(_QWORD *)&i, capacity, hash_function, value);
}

AAFieldKey AAHeaderGetFieldKey(AAHeader header, uint32_t i)
{
  return (AAFieldKey)MEMORY[0x24BED2CF8](header, *(_QWORD *)&i);
}

int AAHeaderGetFieldString(AAHeader header, uint32_t i, size_t capacity, char *value, size_t *length)
{
  return MEMORY[0x24BED2D00](header, *(_QWORD *)&i, capacity, value, length);
}

int AAHeaderGetFieldTimespec(AAHeader header, uint32_t i, timespec *value)
{
  return MEMORY[0x24BED2D08](header, *(_QWORD *)&i, value);
}

int AAHeaderGetFieldType(AAHeader header, uint32_t i)
{
  return MEMORY[0x24BED2D10](header, *(_QWORD *)&i);
}

int AAHeaderGetFieldUInt(AAHeader header, uint32_t i, uint64_t *value)
{
  return MEMORY[0x24BED2D18](header, *(_QWORD *)&i, value);
}

int AAHeaderGetKeyIndex(AAHeader header, AAFieldKey key)
{
  return MEMORY[0x24BED2D20](header, *(_QWORD *)key.skey);
}

int AAHeaderRemoveField(AAHeader header, uint32_t i)
{
  return MEMORY[0x24BED2D28](header, *(_QWORD *)&i);
}

int AAHeaderSetFieldBlob(AAHeader header, uint32_t i, AAFieldKey key, uint64_t size)
{
  return MEMORY[0x24BED2D30](header, *(_QWORD *)&i, *(_QWORD *)key.skey, size);
}

int AAHeaderSetFieldFlag(AAHeader header, uint32_t i, AAFieldKey key)
{
  return MEMORY[0x24BED2D38](header, *(_QWORD *)&i, *(_QWORD *)key.skey);
}

int AAHeaderSetFieldHash(AAHeader header, uint32_t i, AAFieldKey key, AAHashFunction hash_function, const uint8_t *value)
{
  return MEMORY[0x24BED2D40](header, *(_QWORD *)&i, *(_QWORD *)key.skey, *(_QWORD *)&hash_function, value);
}

int AAHeaderSetFieldString(AAHeader header, uint32_t i, AAFieldKey key, const char *value, size_t length)
{
  return MEMORY[0x24BED2D48](header, *(_QWORD *)&i, *(_QWORD *)key.skey, value, length);
}

int AAHeaderSetFieldTimespec(AAHeader header, uint32_t i, AAFieldKey key, const timespec *value)
{
  return MEMORY[0x24BED2D50](header, *(_QWORD *)&i, *(_QWORD *)key.skey, value);
}

int AAHeaderSetFieldUInt(AAHeader header, uint32_t i, AAFieldKey key, uint64_t value)
{
  return MEMORY[0x24BED2D58](header, *(_QWORD *)&i, *(_QWORD *)key.skey, value);
}

AAPathList AAPathListCreateWithDirectoryContents(const char *dir, const char *path, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAPathList)MEMORY[0x24BED2D60](dir, path, msg_data, msg_proc, flags, *(_QWORD *)&n_threads);
}

void AAPathListDestroy(AAPathList path_list)
{
  MEMORY[0x24BED2D70](path_list);
}

int AASharedBufferPipeOpen(AAByteStream *ostream, AAByteStream *istream, size_t buffer_capacity)
{
  return MEMORY[0x24BED2D78](ostream, istream, buffer_capacity);
}

AAByteStream AATempFileStreamOpen(void)
{
  return (AAByteStream)MEMORY[0x24BED2D80]();
}

AEAContext AEAContextCreateWithEncryptedStream(AAByteStream encrypted_stream)
{
  return (AEAContext)MEMORY[0x24BED2DB8](encrypted_stream);
}

AEAContext AEAContextCreateWithProfile(AEAProfile profile)
{
  return (AEAContext)MEMORY[0x24BED2DC0](*(_QWORD *)&profile);
}

int AEAContextDecryptAttributes(AEAContext context)
{
  return MEMORY[0x24BED2DC8](context);
}

void AEAContextDestroy(AEAContext context)
{
  MEMORY[0x24BED2DD8](context);
}

int AEAContextGenerateFieldBlob(AEAContext context, AEAContextField field)
{
  return MEMORY[0x24BED2DE0](context, *(_QWORD *)&field);
}

int AEAContextGetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, size_t buf_capacity, uint8_t *buf, size_t *buf_size)
{
  return MEMORY[0x24BED2DF0](context, *(_QWORD *)&field, *(_QWORD *)&representation, buf_capacity, buf, buf_size);
}

uint64_t AEAContextGetFieldUInt(AEAContext context, AEAContextField field)
{
  return MEMORY[0x24BED2DF8](context, *(_QWORD *)&field);
}

int AEAContextSetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return MEMORY[0x24BED2E08](context, *(_QWORD *)&field, *(_QWORD *)&representation, buf, buf_size);
}

int AEAContextSetFieldUInt(AEAContext context, AEAContextField field, uint64_t value)
{
  return MEMORY[0x24BED2E18](context, *(_QWORD *)&field, value);
}

AAByteStream AEADecryptionRandomAccessInputStreamOpen(AAByteStream encrypted_stream, AEAContext context, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x24BED2E28](encrypted_stream, context, alloc_limit, flags, *(_QWORD *)&n_threads);
}

int AEAEncryptionOutputStreamCloseAndUpdateContext(AAByteStream stream, AEAContext context)
{
  return MEMORY[0x24BED2E38](stream, context);
}

int AEAStreamSign(AAByteStream encrypted_stream, AEAContext context)
{
  return MEMORY[0x24BED2E50](encrypted_stream, context);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

