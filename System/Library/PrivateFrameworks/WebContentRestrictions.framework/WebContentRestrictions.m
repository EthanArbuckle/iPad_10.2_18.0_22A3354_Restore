void sub_24A43DCCC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

double variable initialization expression of BloomFilterShim.filter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

id BloomFilterShim.__allocating_init(path:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return BloomFilterShim.init(path:)(a1, a2);
}

id BloomFilterShim.init(path:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  objc_class *v25;
  _QWORD v27[2];
  uint64_t v28;
  objc_super v29;
  _QWORD v30[6];

  v27[1] = a2;
  v3 = type metadata accessor for URL.DirectoryHint();
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v27 - v14;
  v16 = &v2[OBJC_IVAR____TtC22WebContentRestrictions15BloomFilterShim_filter];
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  v28 = (uint64_t)v16;
  *((_QWORD *)v16 + 4) = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCD7A0], v3);
  v17 = v2;
  URL.init(filePath:directoryHint:relativeTo:)();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v18 = objc_allocWithZone(MEMORY[0x24BDBCE50]);
  v19 = @nonobjc NSData.init(contentsOf:options:)((uint64_t)v13, 0);
  v20 = v9;
  v21 = specialized Data.init<A>(_:)(v19);
  v23 = v22;
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  v30[3] = type metadata accessor for BloomFilter();
  v30[4] = lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter, (uint64_t)&protocol conformance descriptor for BloomFilter);
  lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter, (uint64_t)&protocol conformance descriptor for BloomFilter);
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v20);
  swift_release();
  outlined consume of Data._Representation(v21, v23);
  v24 = v28;
  swift_beginAccess();
  outlined assign with take of MembershipFilter?((uint64_t)v30, v24);
  swift_endAccess();

  v25 = (objc_class *)type metadata accessor for BloomFilterShim();
  v29.receiver = v17;
  v29.super_class = v25;
  return objc_msgSendSuper2(&v29, sel_init);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD101DC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t specialized Data.init<A>(_:)(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v12;
  __int128 v13[2];
  uint64_t v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v12 = a1;
  type metadata accessor for NSData();
  v2 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (!swift_dynamicCast())
  {
    v14 = 0;
    memset(v13, 0, sizeof(v13));
    outlined destroy of MembershipFilter?((uint64_t)v13, &demangling cache variable for type metadata for ContiguousBytes?);
    v3 = NSData.startIndex.getter();
    v4 = NSData.endIndex.getter();
    v5 = NSData.startIndex.getter();
    v6 = NSData.endIndex.getter();
    if (v3 < v5 || v6 < v3)
    {
      __break(1u);
    }
    else
    {
      v7 = NSData.startIndex.getter();
      v8 = NSData.endIndex.getter();
      if (v4 >= v7 && v8 >= v4)
      {
        if (!__OFSUB__(v4, v3))
        {
          *(_QWORD *)&v13[0] = specialized Data._Representation.init(count:)(v4 - v3);
          *((_QWORD *)&v13[0] + 1) = v9;
          MEMORY[0x24BDAC7A8]();
          specialized Data._Representation.withUnsafeMutableBytes<A>(_:)();
          __asm { BR              X12 }
        }
LABEL_11:
        __break(1u);
        JUMPOUT(0x24A440ABCLL);
      }
    }
    __break(1u);
    goto LABEL_11;
  }
  outlined init with take of ContiguousBytes(v13, (uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();

  v13[0] = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return *(_QWORD *)&v13[0];
}

uint64_t specialized Data.init<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  Swift::Int v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    outlined destroy of MembershipFilter?((uint64_t)v14, &demangling cache variable for type metadata for ContiguousBytes?);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = _StringObject.sharedUTF8.getter();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = specialized Data._Representation.init(_:)(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = String.UTF8View._foreignCount()();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = specialized Data._Representation.init(count:)(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    specialized Data._Representation.withUnsafeMutableBytes<A>(_:)();
    __asm { BR              X12 }
  }
  outlined init with take of ContiguousBytes(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

Swift::Bool __swiftcall BloomFilterShim.contains(_:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  Swift::Bool result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v4 = v1 + OBJC_IVAR____TtC22WebContentRestrictions15BloomFilterShim_filter;
  swift_beginAccess();
  result = outlined init with copy of MembershipFilter?(v4, (uint64_t)v11);
  if (v12)
  {
    v6 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    swift_bridgeObjectRetain();
    v7 = specialized Data.init<A>(_:)(countAndFlagsBits, (unint64_t)object);
    v9 = v8;
    v10 = (*(uint64_t (**)(void))(v6 + 56))();
    outlined consume of Data._Representation(v7, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    return v10 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id BloomFilterShim.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BloomFilterShim.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BloomFilterShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BloomFilterShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id @nonobjc NSData.init(contentsOf:options:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  id v12;
  id v13;
  uint64_t v14;
  id v16;
  NSURL *v17;

  v3 = v2;
  v17 = (NSURL *)*MEMORY[0x24BDAC8D0];
  URL._bridgeToObjectiveC()(v17);
  v7 = v6;
  v16 = 0;
  v8 = objc_msgSend(v3, sel_initWithContentsOfURL_options_error_, v6, a2, &v16);

  v9 = v16;
  if (v8)
  {
    v10 = type metadata accessor for URL();
    v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
    v12 = v9;
    v11(a1, v10);
  }
  else
  {
    v13 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v14 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
  }
  return v8;
}

uint64_t type metadata accessor for BloomFilterShim()
{
  return objc_opt_self();
}

uint64_t lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for BloomFilter();
    result = MEMORY[0x24BD101E8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for BloomFilter();
    result = MEMORY[0x24BD101E8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
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

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x24BD10224);
  return result;
}

uint64_t outlined assign with take of MembershipFilter?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MembershipFilter?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of MembershipFilter?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MembershipFilter?);
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined destroy of MembershipFilter?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)()
{
  __asm { BR              X11 }
}

{
  __asm { BR              X11 }
}

_QWORD *sub_24A44155C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_QWORD *sub_24A441848@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
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

_QWORD *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySo6NSDataCG_SitTgm5(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

_QWORD *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)__DataStorage._offset.getter();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = __DataStorage._length.getter();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)__DataStorage._bytes.getter();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)__DataStorage._offset.getter();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = __DataStorage._length.getter();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

void specialized Sequence._copySequenceContents(initializing:)(_QWORD *a1, _BYTE *a2, uint64_t a3)
{
  void *v3;
  id v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _BYTE *v21;

  v7 = v3;
  v8 = NSData.startIndex.getter();

  v21 = a2;
  if (!a2 || !a3)
    goto LABEL_5;
  if (a3 < 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v8 == NSData.endIndex.getter())
  {
LABEL_5:
    *a1 = v7;
    a1[1] = v8;
    return;
  }
  v9 = NSData.subscript.getter();
  v10 = v7;
  v11 = NSData.startIndex.getter();
  v12 = NSData.endIndex.getter();

  if (v8 >= v11 && v8 < v12)
  {
    *a2 = v9;
    if (a3 == 1)
    {
      ++v8;
      goto LABEL_5;
    }
    v20 = a1;
    v13 = 1;
    while (a3 != v13)
    {
      v14 = v8 + v13;
      if (v8 + v13 == NSData.endIndex.getter())
      {
        v8 += v13;
        goto LABEL_18;
      }
      v15 = NSData.subscript.getter();
      v16 = v10;
      v17 = NSData.startIndex.getter();
      v18 = NSData.endIndex.getter();

      if (v14 < v17 || v14 >= v18)
        goto LABEL_20;
      v19 = v13 + 1;
      v21[v13] = v15;
      v13 = v19;
      if (a3 == v19)
      {
        v8 += v19;
LABEL_18:
        a1 = v20;
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
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
    v5 = MEMORY[0x24BD0FBE8](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
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

uint64_t specialized Data._Representation.init(count:)(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

_QWORD *partial apply for specialized closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

{
  uint64_t v3;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;

  v9 = **(_QWORD **)(v3 + 16);
  v8[2] = &v9;
  result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySo6NSDataCG_SitTgm5((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v8, a1, a2);
  *a3 = result;
  a3[1] = v6;
  a3[2] = v7;
  return result;
}

uint64_t outlined consume of Data._Representation?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
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

_BYTE *specialized Data._Representation.init(_:)(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)specialized Data.InlineData.init(_:)(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t outlined init with take of ContiguousBytes(__int128 *a1, uint64_t a2)
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

uint64_t partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return specialized closure #1 in closure #3 in Data.init<A>(_:)(a1, a2);
}

unint64_t type metadata accessor for NSData()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSData;
  if (!lazy cache variable for type metadata for NSData)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSData);
  }
  return result;
}

void partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)(_BYTE *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v7 = **(id **)(v3 + 16);
  specialized Sequence._copySequenceContents(initializing:)(v10, a1, a2);
  v8 = v10[1];
  *a3 = v10[0];
  a3[1] = v8;
  a3[2] = v9;
}

void type metadata accessor for CFMutableBitVectorRef(uint64_t a1)
{
  type metadata accessor for CFMutableBitVectorRef(a1, &lazy cache variable for type metadata for CFMutableBitVectorRef);
}

uint64_t type metadata completion function for CFMutableBitVectorRef(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for CFBitVectorRef(255);
  *(_QWORD *)(a1 + 16) = v2;
  return 0;
}

void type metadata accessor for CFBitVectorRef(uint64_t a1)
{
  type metadata accessor for CFMutableBitVectorRef(a1, &lazy cache variable for type metadata for CFBitVectorRef);
}

void type metadata accessor for CFMutableBitVectorRef(uint64_t a1, unint64_t *a2)
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

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance BloomFilterError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance BloomFilterError()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance BloomFilterError()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BloomFilterError()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t static BloomFilter.predictedNumberOfBits(expectedNumberOfItems:falsePositiveTolerance:)(uint64_t a1, long double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for BloomFilter();
  v5 = swift_allocObject();
  v6 = a1;
  v7 = v5;
  BloomFilter.init(expectedNumberOfItems:falsePositiveTolerance:allocate:)(v6, 0, a2);
  if (!v2)
  {
    v7 = *(_QWORD *)(v8 + 32);
    swift_release();
  }
  return v7;
}

uint64_t type metadata accessor for BloomFilter()
{
  return objc_opt_self();
}

void BloomFilter.__allocating_init(expectedNumberOfItems:falsePositiveTolerance:)(uint64_t a1, long double a2)
{
  type metadata accessor for BloomFilter();
  swift_allocObject();
  BloomFilter.init(expectedNumberOfItems:falsePositiveTolerance:allocate:)(a1, 1, a2);
}

void BloomFilter.init(expectedNumberOfItems:falsePositiveTolerance:allocate:)(uint64_t a1, char a2, long double a3)
{
  uint64_t v3;
  char v5;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  CFIndex v11;
  __CFBitVector *Mutable;
  __CFBitVector *v13;
  char *v14;

  if (a1 < 1)
  {
    v5 = 0;
    goto LABEL_20;
  }
  if (a3 <= 0.0 || a3 >= 1.0)
  {
    v5 = 1;
LABEL_20:
    lazy protocol witness table accessor for type BloomFilterError and conformance BloomFilterError();
    swift_allocError();
    *v14 = v5;
    swift_willThrow();
    type metadata accessor for BloomFilter();
    swift_deallocPartialClassInstance();
    return;
  }
  *(_QWORD *)(v3 + 16) = a1;
  *(long double *)(v3 + 24) = a3;
  v7 = (double)a1;
  v8 = ceil(log(a3) * (double)a1 / -0.480453014);
  if ((~*(_QWORD *)&v8 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v8 >= 9.22337204e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = (uint64_t)v8;
  *(_QWORD *)(v3 + 32) = (uint64_t)v8;
  v10 = ceil((double)(uint64_t)v8 / v7 * 0.693147181);
  if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v10 < 9.22337204e18)
  {
    *(_QWORD *)(v3 + 40) = (uint64_t)v10;
    *(_DWORD *)(v3 + 48) = arc4random();
    if ((a2 & 1) != 0)
      v11 = v9;
    else
      v11 = 1;
    Mutable = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], v11);
    if (Mutable)
    {
      v13 = Mutable;
      CFBitVectorSetCount(Mutable, v11);
      *(_QWORD *)(v3 + 56) = v13;
      *(_BYTE *)(v3 + 64) = 1;
      return;
    }
    v5 = 2;
    goto LABEL_20;
  }
LABEL_26:
  __break(1u);
}

double BloomFilter.falsePositiveProbability.getter()
{
  uint64_t *v0;
  long double v1;
  long double v2;

  v1 = (double)v0[5];
  v2 = pow(2.71828183, -(v1 * (double)v0[2]) / (double)v0[4]);
  return pow(1.0 - v2, v1);
}

void BloomFilter.estimatedCount.getter()
{
  uint64_t v0;
  CFIndex v1;
  double v2;
  double v3;
  const __CFBitVector *v4;
  CFIndex CountOfBit;
  double v6;
  CFRange v7;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = (double)v1;
  v3 = (double)*(uint64_t *)(v0 + 40);
  v4 = (const __CFBitVector *)*(id *)(v0 + 56);
  v7.location = 0;
  v7.length = v1;
  CountOfBit = CFBitVectorGetCountOfBit(v4, v7, 1u);

  v6 = ceil(-v2 / v3 * log(1.0 - (double)CountOfBit / v2));
  if ((~*(_QWORD *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v6 >= 9.22337204e18)
LABEL_7:
    __break(1u);
}

void BloomFilter.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  long double v4;
  long double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t v29;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24A446490;
  v3 = v0[4];
  v2 = v0[5];
  v4 = pow(2.71828183, -((double)v2 * (double)v0[2]) / (double)v3);
  v5 = pow(1.0 - v4, (double)v2);
  v6 = MEMORY[0x24BEE13C8];
  v7 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v1 + 56) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v1 + 64) = v7;
  *(long double *)(v1 + 32) = v5;
  v29 = String.init(format:_:)();
  v9 = v8;
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24A446490;
  v11 = v0[3];
  *(_QWORD *)(v10 + 56) = v6;
  *(_QWORD *)(v10 + 64) = v7;
  *(_QWORD *)(v10 + 32) = v11;
  v12 = String.init(format:_:)();
  v14 = v13;
  _StringGuts.grow(_:)(70);
  v15._countAndFlagsBits = 0x3D736D657469;
  v15._object = (void *)0xE600000000000000;
  String.append(_:)(v15);
  BloomFilter.estimatedCount.getter();
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 47;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  v18._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  v19._countAndFlagsBits = 0x3D657A6973202CLL;
  v19._object = (void *)0xE700000000000000;
  String.append(_:)(v19);
  v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 0x28207374696220;
  v21._object = (void *)0xE700000000000000;
  String.append(_:)(v21);
  if (__OFADD__(v3, 7))
  {
    __break(1u);
  }
  else
  {
    v22._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v22);
    swift_bridgeObjectRelease();
    v23._object = (void *)0x800000024A4472B0;
    v23._countAndFlagsBits = 0xD000000000000010;
    String.append(_:)(v23);
    v24._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    v25._countAndFlagsBits = 0xD000000000000012;
    v25._object = (void *)0x800000024A4472D0;
    String.append(_:)(v25);
    v26._countAndFlagsBits = v29;
    v26._object = v9;
    String.append(_:)(v26);
    swift_bridgeObjectRelease();
    v27._countAndFlagsBits = 47;
    v27._object = (void *)0xE100000000000000;
    String.append(_:)(v27);
    v28._countAndFlagsBits = v12;
    v28._object = v14;
    String.append(_:)(v28);
    swift_bridgeObjectRelease();
  }
}

uint64_t BloomFilter.insert(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  __CFBitVector *v5;
  uint64_t v6;
  uint64_t v7;
  CFIndex *v8;
  CFIndex v9;

  if (*(_BYTE *)(v2 + 64) == 1)
  {
    v4 = result;
    v5 = (__CFBitVector *)*(id *)(v2 + 56);
    v6 = BloomFilter.indexes(for:)(v4, a2);
    v7 = *(_QWORD *)(v6 + 16);
    if (v7)
    {
      v8 = (CFIndex *)(v6 + 32);
      do
      {
        v9 = *v8++;
        CFBitVectorSetBitAtIndex(v5, v9, 1u);
        --v7;
      }
      while (v7);
    }

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t BloomFilter.contains(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const __CFBitVector *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;

  v5 = (const __CFBitVector *)*(id *)(v2 + 56);
  v6 = BloomFilter.indexes(for:)(a1, a2);
  v7 = v6;
  v8 = *(_QWORD *)(v6 + 16);
  if (v8)
  {
    result = CFBitVectorGetBitAtIndex(v5, *(_QWORD *)(v6 + 32));
    if ((_DWORD)result)
    {
      v10 = 0;
      v11 = v8 - 1;
      do
      {
        v12 = v11 == v10;
        if (v11 == v10)
          break;
        if ((unint64_t)(v10 + 1) >= *(_QWORD *)(v7 + 16))
        {
          __break(1u);
          return result;
        }
        result = CFBitVectorGetBitAtIndex(v5, *(_QWORD *)(v7 + 40 + 8 * v10++));
      }
      while ((_DWORD)result);
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 1;
  }

  swift_bridgeObjectRelease();
  return v12;
}

uint64_t BloomFilter.indexes(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  specialized static FNVHash.hash(_:)(a1, a2);
  v6 = v5;
  specialized static MurmurHash3.hash(_:seed:)(a1, a2);
  v8 = *(_QWORD *)(v2 + 32);
  if ((v8 & 0x8000000000000000) == 0 && !HIDWORD(v8))
  {
    v9 = *(_QWORD *)(v2 + 40);
    if ((v9 & 0x8000000000000000) == 0 && !HIDWORD(v9))
    {
      if (!(_DWORD)v9)
        return MEMORY[0x24BEE4AF8];
      if ((_DWORD)v8)
      {
        v10 = v7;
        v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x24BEE4AF8]);
        do
        {
          v13 = v11[2];
          v12 = v11[3];
          if (v13 >= v12 >> 1)
            v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v12 > 1), v13 + 1, 1, v11);
          v11[2] = v13 + 1;
          v11[v13 + 4] = v6 % v8;
          v6 += v10;
          LODWORD(v9) = v9 - 1;
        }
        while ((_DWORD)v9);
        return (uint64_t)v11;
      }
      __break(1u);
    }
  }
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t BloomFilter.CodingKeys.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A442FA8 + 4 * byte_24A4465A0[a1]))(0xD000000000000015, 0x800000024A447180);
}

uint64_t sub_24A442FA8(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_24A442FC0()
{
  return 0x664F7265626D756ELL;
}

uint64_t sub_24A442FF4()
{
  return 0x655372756D72756DLL;
}

uint64_t sub_24A443010()
{
  return 0x6F74636556746962;
}

uint64_t BloomFilter.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24A44306C + 4 * byte_24A4465A6[a1]))(0xD000000000000015, 0x800000024A447180);
}

uint64_t sub_24A44306C(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_24A443084()
{
  return 0x664F7265626D756ELL;
}

uint64_t sub_24A4430B8()
{
  return 0x655372756D72756DLL;
}

uint64_t sub_24A4430D4()
{
  return 0x6F74636556746962;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance BloomFilter.CodingKeys(char *a1)
{
  specialized == infix<A>(_:_:)(*a1);
}

void specialized == infix<A>(_:_:)(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_24A443150(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24A443208 + 4 * byte_24A4465B2[a2]))(a3 + 1);
}

uint64_t sub_24A443208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 + 1 && v3 == 0x800000024A4471A0)
    v4 = 1;
  else
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

void protocol witness for Hashable.hashValue.getter in conformance BloomFilter.CodingKeys()
{
  char *v0;

  specialized RawRepresentable<>.hashValue.getter(*v0);
}

void specialized RawRepresentable<>.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  __asm { BR              X10 }
}

Swift::Int sub_24A443370()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance BloomFilter.CodingKeys(uint64_t a1)
{
  char *v1;

  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

void specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_24A443478()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance BloomFilter.CodingKeys(uint64_t a1)
{
  char *v1;

  specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

void specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  Hasher.init(_seed:)();
  __asm { BR              X10 }
}

Swift::Int sub_24A443574()
{
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance BloomFilter.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized BloomFilter.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance BloomFilter.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = BloomFilter.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance BloomFilter.CodingKeys()
{
  unsigned __int8 *v0;

  return BloomFilter.CodingKeys.stringValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance BloomFilter.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized BloomFilter.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance BloomFilter.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance BloomFilter.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance BloomFilter.CodingKeys()
{
  lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance BloomFilter.CodingKeys()
{
  lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t BloomFilter.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  BloomFilter.init(from:)(a1);
  return v2;
}

uint64_t BloomFilter.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  double v9;
  _BYTE *v11;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char *v16;
  _QWORD v17[5];
  uint64_t v18;
  UInt8 bytes[8];
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<BloomFilter.CodingKeys>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    bytes[0] = 0;
    v8 = KeyedDecodingContainer.decode(_:forKey:)();
    if (v8 >= 1)
    {
      *(_QWORD *)(v1 + 16) = v8;
      bytes[0] = 1;
      KeyedDecodingContainer.decode(_:forKey:)();
      if (v9 > 0.0 && v9 < 1.0)
      {
        *(double *)(v1 + 24) = v9;
        bytes[0] = 2;
        v13 = KeyedDecodingContainer.decode(_:forKey:)();
        if (v13 >= 1)
        {
          *(_QWORD *)(v1 + 32) = v13;
          bytes[0] = 3;
          v14 = KeyedDecodingContainer.decode(_:forKey:)();
          if (v14 >= 1)
          {
            *(_QWORD *)(v1 + 40) = v14;
            bytes[0] = 4;
            v15 = KeyedDecodingContainer.decode(_:forKey:)();
            *(_DWORD *)(v1 + 48) = v15;
            LOBYTE(v18) = 5;
            lazy protocol witness table accessor for type Data and conformance Data();
            KeyedDecodingContainer.decode<A>(_:forKey:)();
            v16 = (char *)&loc_24A443A00 + dword_24A443E9C[v20 >> 62];
            v17[3] = v20;
            v17[4] = *(_QWORD *)bytes;
            __asm { BR              X10 }
          }
        }
      }
    }
    lazy protocol witness table accessor for type BloomFilterError and conformance BloomFilterError();
    swift_allocError();
    *v11 = 3;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  type metadata accessor for BloomFilter();
  swift_deallocPartialClassInstance();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

CFBitVectorRef closure #1 in BloomFilter.init(from:)@<X0>(UInt8 *bytes@<X0>, CFIndex a2@<X2>, uint64_t a3@<X8>)
{
  CFBitVectorRef result;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _BYTE *v9;

  result = CFBitVectorCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, a2);
  if (result)
  {
    *(_QWORD *)a3 = result;
    *(_BYTE *)(a3 + 8) = 0;
  }
  else
  {
    v5 = static os_log_type_t.error.getter();
    type metadata accessor for OS_os_log();
    v6 = static OS_os_log.default.getter();
    v7 = v5;
    if (os_log_type_enabled(v6, v5))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v8 = 134217984;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_24A43B000, v6, v7, "Invalid serialized bit vector:  too many bits? %ld", v8, 0xCu);
      MEMORY[0x24BD10224](v8, -1, -1);
    }

    lazy protocol witness table accessor for type BloomFilterError and conformance BloomFilterError();
    swift_allocError();
    *v9 = 3;
    return (CFBitVectorRef)swift_willThrow();
  }
  return result;
}

uint64_t BloomFilter.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  _BYTE v18[16];
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<BloomFilter.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v21) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (v2)
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  LOBYTE(v21) = 1;
  KeyedEncodingContainer.encode(_:forKey:)();
  v9 = *(_QWORD *)(v3 + 32);
  LOBYTE(v21) = 2;
  KeyedEncodingContainer.encode(_:forKey:)();
  LOBYTE(v21) = 3;
  KeyedEncodingContainer.encode(_:forKey:)();
  LOBYTE(v21) = 4;
  result = KeyedEncodingContainer.encode(_:forKey:)();
  v11 = v9 + 7;
  if (!__OFADD__(v9, 7))
  {
    if (v11 < 0)
      v11 = v9 + 14;
    v12 = v11 >> 3;
    v13 = *(id *)(v3 + 56);
    v21 = specialized Data._Representation.init(count:)(v12);
    v22 = v14;
    v15 = v13;
    swift_retain();
    specialized Data._Representation.withUnsafeMutableBytes<A>(_:)((uint64_t)&v21);
    v16 = v21;
    v17 = v22;
    v19 = v21;
    v20 = v22;
    v18[15] = 5;
    outlined copy of Data._Representation(v21, v22);
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedEncodingContainer.encode<A>(_:forKey:)();

    outlined consume of Data._Representation(v16, v17);
    outlined consume of Data._Representation(v16, v17);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  }
  __break(1u);
  return result;
}

uint64_t BloomFilter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t BloomFilter.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t protocol witness for static MembershipFilter.predictedNumberOfBits(expectedNumberOfItems:falsePositiveTolerance:) in conformance BloomFilter(uint64_t a1, long double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for BloomFilter();
  v5 = swift_allocObject();
  v6 = a1;
  v7 = v5;
  BloomFilter.init(expectedNumberOfItems:falsePositiveTolerance:allocate:)(v6, 0, a2);
  if (!v2)
  {
    v7 = *(_QWORD *)(v8 + 32);
    swift_release();
  }
  return v7;
}

void protocol witness for MembershipFilter.init(expectedNumberOfItems:falsePositiveTolerance:) in conformance BloomFilter(uint64_t a1@<X0>, _QWORD *a2@<X8>, long double a3@<D0>)
{
  uint64_t v3;
  uint64_t v7;

  type metadata accessor for BloomFilter();
  swift_allocObject();
  BloomFilter.init(expectedNumberOfItems:falsePositiveTolerance:allocate:)(a1, 1, a3);
  if (!v3)
    *a2 = v7;
}

uint64_t protocol witness for MembershipFilter.insert(_:) in conformance BloomFilter(uint64_t a1, uint64_t a2)
{
  return BloomFilter.insert(_:)(a1, a2);
}

uint64_t protocol witness for MembershipFilter.contains(_:) in conformance BloomFilter(uint64_t a1, uint64_t a2)
{
  return BloomFilter.contains(_:)(a1, a2) & 1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance BloomFilter@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for BloomFilter();
  v5 = swift_allocObject();
  result = BloomFilter.init(from:)(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance BloomFilter(_QWORD *a1)
{
  return BloomFilter.encode(to:)(a1);
}

void protocol witness for CustomStringConvertible.description.getter in conformance BloomFilter()
{
  BloomFilter.description.getter();
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys;
  if (!lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys)
  {
    result = MEMORY[0x24BD101E8](&protocol conformance descriptor for BloomFilter.CodingKeys, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys;
  if (!lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys)
  {
    result = MEMORY[0x24BD101E8](&protocol conformance descriptor for BloomFilter.CodingKeys, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys;
  if (!lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys)
  {
    result = MEMORY[0x24BD101E8](&protocol conformance descriptor for BloomFilter.CodingKeys, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys;
  if (!lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys)
  {
    result = MEMORY[0x24BD101E8](&protocol conformance descriptor for BloomFilter.CodingKeys, &type metadata for BloomFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type BloomFilterError and conformance BloomFilterError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError;
  if (!lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError)
  {
    result = MEMORY[0x24BD101E8](&protocol conformance descriptor for BloomFilterError, &type metadata for BloomFilterError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError;
  if (!lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError)
  {
    result = MEMORY[0x24BD101E8](&protocol conformance descriptor for BloomFilterError, &type metadata for BloomFilterError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x24BD101E8](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x24BD101E8](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
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

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(uint64_t a1)
{
  __asm { BR              X12 }
}

uint64_t sub_24A4446FC@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t bytes, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  const __CFBitVector *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  unsigned int v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  CFRange v32;

  v27 = v17;
  LOWORD(v28) = a1;
  BYTE2(v28) = BYTE2(a1);
  HIBYTE(v28) = BYTE3(a1);
  v29 = BYTE4(a1);
  v30 = BYTE5(a1);
  v31 = BYTE6(a1);
  v32.length = *(_QWORD *)(v19 + 32);
  v32.location = 0;
  CFBitVectorGetBits(v18, v32, (UInt8 *)&v27);
  v21 = v27;
  v22 = v28;
  v23 = v29;
  v24 = v30;
  v25 = v31;

  *v20 = v21;
  v20[1] = v22 | (v23 << 32) | (v24 << 40) | (v25 << 48);
  return swift_release();
}

void specialized Data.InlineSlice.withUnsafeMutableBytes<A>(_:)(int *a1, const __CFBitVector *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  CFRange v12;

  Data.InlineSlice.ensureUniqueReference()();
  v6 = *a1;
  if (a1[1] < (int)v6)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v7 = __DataStorage._bytes.getter();
  if (v7)
  {
    v8 = v7;
    v9 = __DataStorage._offset.getter();
    v10 = __OFSUB__(v6, v9);
    v11 = v6 - v9;
    if (!v10)
    {
      __DataStorage._length.getter();
      v12.length = *(_QWORD *)(a3 + 32);
      v12.location = 0;
      CFBitVectorGetBits(a2, v12, (UInt8 *)(v8 + v11));
      swift_release();

      return;
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t specialized BloomFilter.CodingKeys.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of BloomFilter.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 6)
    return 6;
  else
    return v3;
}

uint64_t instantiation function for generic protocol witness table for BloomFilter(_QWORD *a1)
{
  uint64_t result;

  a1[1] = lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter, (uint64_t)&protocol conformance descriptor for BloomFilter);
  a1[2] = lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter, (uint64_t)&protocol conformance descriptor for BloomFilter);
  result = lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter, (uint64_t)&protocol conformance descriptor for BloomFilter);
  a1[3] = result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for BloomFilter.BitVector(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void destroy for BloomFilter.BitVector(id *a1)
{

}

uint64_t assignWithCopy for BloomFilter.BitVector(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for BloomFilter.BitVector(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilter.BitVector(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilter.BitVector(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for BloomFilter.BitVector(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for BloomFilter.BitVector(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter.BitVector()
{
  return &type metadata for BloomFilter.BitVector;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BloomFilterError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BloomFilterError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A444E0C + 4 * byte_24A4465CF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24A444E40 + 4 * byte_24A4465CA[v4]))();
}

uint64_t sub_24A444E40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A444E48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A444E50);
  return result;
}

uint64_t sub_24A444E5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A444E64);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24A444E68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A444E70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterError()
{
  return &type metadata for BloomFilterError;
}

uint64_t getEnumTagSinglePayload for BloomFilter.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilter.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_24A444F68 + 4 * byte_24A4465D9[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24A444F9C + 4 * byte_24A4465D4[v4]))();
}

uint64_t sub_24A444F9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A444FA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A444FACLL);
  return result;
}

uint64_t sub_24A444FB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A444FC0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24A444FC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A444FCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for BloomFilter.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for BloomFilter.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter.CodingKeys()
{
  return &type metadata for BloomFilter.CodingKeys;
}

void specialized static FNVHash.hash(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = type metadata accessor for Data.Iterator();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

uint64_t sub_24A4451A0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::UInt8_optional i;

  outlined copy of Data._Representation(v3, v2);
  v5 = 2166136261;
  Data.Iterator.init(_:at:)();
  for (i = Data.Iterator.next()(); (*(_WORD *)&i & 0x100) == 0; i = Data.Iterator.next()())
    v5 = 16777619 * (v5 ^ i.value);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v0);
  return v5;
}

uint64_t specialized static MurmurHash3.digest32BitX86(_:_:)(int *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;

  if (a1)
  {
    v3 = a2 - (_QWORD)a1;
    if (a2 - (uint64_t)a1 >= 0)
      v4 = a2 - (_QWORD)a1;
    else
      v4 = a2 - (_QWORD)a1 + 3;
    if (v3 >= -3)
    {
      v5 = v4 >> 2;
      if ((unint64_t)(a2 - (_QWORD)a1 + 3) < 7)
      {
        v6 = 0;
LABEL_17:
        switch(v3 - 4 * v5)
        {
          case 0uLL:
            goto LABEL_23;
          case 1uLL:
            v12 = 0;
            goto LABEL_22;
          case 2uLL:
            v13 = 0;
            goto LABEL_21;
          case 3uLL:
            v13 = *((unsigned __int8 *)a1 + ((v6 * 4) | 2)) << 16;
LABEL_21:
            v12 = v13 | (*((unsigned __int8 *)a1 + ((v6 * 4) | 1)) << 8);
LABEL_22:
            a3 ^= 461845907
                * ((380141568 * (v12 ^ LOBYTE(a1[v6]))) | ((-862048943 * (v12 ^ LOBYTE(a1[v6]))) >> 17));
LABEL_23:
            if (v3 < 0x100000000)
              goto LABEL_24;
            goto LABEL_28;
          default:
            goto LABEL_27;
        }
      }
      v7 = v5 - 1;
      if (v5 < v5 - 1)
        v7 = v4 >> 2;
      if (v7 >= 0x2000000000000000)
        v7 = 0x2000000000000000;
      v8 = a1;
      v9 = v4 >> 2;
      while (v5 != v7)
      {
        v10 = *v8++;
        HIDWORD(v11) = (461845907 * ((380141568 * v10) | ((-862048943 * v10) >> 17))) ^ a3;
        LODWORD(v11) = HIDWORD(v11);
        a3 = 5 * (v11 >> 19) - 430675100;
        if (!--v9)
        {
          v6 = v5;
          goto LABEL_17;
        }
      }
      __break(1u);
    }
    __break(1u);
LABEL_27:
    _StringGuts.grow(_:)(43);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    v17._countAndFlagsBits = 0xD000000000000015;
    v17._object = (void *)0x800000024A4474E0;
    String.append(_:)(v17);
    v18._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    v19._countAndFlagsBits = 46;
    v19._object = (void *)0xE100000000000000;
    String.append(_:)(v19);
    v20._countAndFlagsBits = 0xD000000000000011;
    v20._object = (void *)0x800000024A4474C0;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_28:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    JUMPOUT(0x24A445524);
  }
  LODWORD(v3) = 0;
LABEL_24:
  v14 = -2048144789 * (a3 ^ v3 ^ ((a3 ^ v3) >> 16));
  return (-1028477387 * (v14 ^ (v14 >> 13))) ^ ((-1028477387 * (v14 ^ (v14 >> 13))) >> 16);
}

void specialized static MurmurHash3.hash(_:seed:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_24A445588()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v4;
  char v5;
  char v6;
  char v7;
  char v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  LOWORD(v4) = v1;
  BYTE2(v4) = BYTE2(v1);
  HIBYTE(v4) = BYTE3(v1);
  v5 = BYTE4(v1);
  v6 = BYTE5(v1);
  v7 = BYTE6(v1);
  v8 = HIBYTE(v1);
  v9 = v2;
  v10 = BYTE2(v2);
  v11 = BYTE3(v2);
  v12 = BYTE4(v2);
  v13 = BYTE5(v2);
  return specialized static MurmurHash3.digest32BitX86(_:_:)(&v4, (uint64_t)&v4 + BYTE6(v2), v0);
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x24BDCBBD0]();
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

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x24BDCD7B8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
  MEMORY[0x24BDCDB60]();
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
  MEMORY[0x24BDCDBC8]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x24BDCDC40]();
}

Swift::UInt8_optional __swiftcall Data.Iterator.next()()
{
  return (Swift::UInt8_optional)MEMORY[0x24BDCDD70]();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t Data.Iterator.init(_:at:)()
{
  return MEMORY[0x24BDCDD88]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
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

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t NSData.startIndex.getter()
{
  return MEMORY[0x24BDD0128]();
}

uint64_t NSData.endIndex.getter()
{
  return MEMORY[0x24BDD0130]();
}

uint64_t NSData.subscript.getter()
{
  return MEMORY[0x24BDD0138]();
}

uint64_t static OS_os_log.default.getter()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3360]();
}

{
  return MEMORY[0x24BEE3370]();
}

{
  return MEMORY[0x24BEE33B8]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34B0]();
}

{
  return MEMORY[0x24BEE34C0]();
}

{
  return MEMORY[0x24BEE3508]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
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

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x24BEE42C0]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFBitVectorRef CFBitVectorCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex numBits)
{
  return (CFBitVectorRef)MEMORY[0x24BDBB9D8](allocator, bytes, numBits);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x24BDBB9E0](allocator, capacity);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x24BDBB9E8](bv, idx);
}

void CFBitVectorGetBits(CFBitVectorRef bv, CFRange range, UInt8 *bytes)
{
  MEMORY[0x24BDBB9F0](bv, range.location, range.length, bytes);
}

CFIndex CFBitVectorGetCountOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x24BDBB9F8](bv, range.location, range.length, *(_QWORD *)&value);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
  MEMORY[0x24BDBBA08](bv, idx, *(_QWORD *)&value);
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
  MEMORY[0x24BDBBA10](bv, count);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
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

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

