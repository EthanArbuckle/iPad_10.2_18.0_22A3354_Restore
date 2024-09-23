BOOL static Selector.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t Selector.description.getter(const char *a1)
{
  sel_getName(a1);
  return String.init(cString:)();
}

SEL Selector.init(stringLiteral:)()
{
  uint64_t v0;
  SEL v1;

  v0 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v1 = sel_registerName((const char *)(v0 + 32));
  swift_release();
  return v1;
}

SEL closure #1 in Selector.init(_:)@<X0>(const char *a1@<X0>, SEL *a2@<X8>)
{
  SEL result;

  result = sel_registerName(a1);
  *a2 = result;
  return result;
}

uint64_t base witness table accessor for Equatable in NSObject()
{
  return lazy protocol witness table accessor for type NSObject and conformance NSObject(&lazy protocol witness table cache variable for type NSObject and conformance NSObject, 255, (uint64_t (*)(uint64_t))type metadata accessor for NSObject, (uint64_t)&protocol conformance descriptor for NSObject);
}

uint64_t lazy protocol witness table accessor for type NSObject and conformance NSObject(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1B5E17FF0](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t type metadata accessor for NSObject()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

SEL Selector.init(_:)(uint64_t a1, uint64_t a2)
{
  const char *v2;
  SEL v3;
  char str[8];
  uint64_t v6;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    return *(SEL *)str;
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    *(_QWORD *)str = a1;
    v6 = a2 & 0xFFFFFFFFFFFFFFLL;
    v3 = sel_registerName(str);
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((a1 & 0x1000000000000000) != 0)
      v2 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v2 = (const char *)_StringObject.sharedUTF8.getter();
    closure #1 in Selector.init(_:)(v2, (SEL *)str);
    v3 = *(SEL *)str;
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t protocol witness for CVarArg._cVarArgEncoding.getter in conformance NSObject()
{
  id *v0;
  id v1;
  uint64_t result;

  v1 = *v0;
  result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(result + 16) = 1;
  *(_QWORD *)(result + 32) = v1;
  return result;
}

void protocol witness for Hashable.hash(into:) in conformance NSObject()
{
  id *v0;

  Hasher._combine(_:)((Swift::UInt)objc_msgSend(*v0, sel_hash));
}

void Selector.hash(into:)(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Selector()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void NSObject.hash(into:)()
{
  void *v0;

  Hasher._combine(_:)((Swift::UInt)objc_msgSend(v0, sel_hash));
}

id protocol witness for static Equatable.== infix(_:_:) in conformance NSObject(id *a1, _QWORD *a2)
{
  return objc_msgSend(*a1, sel_isEqual_, *a2);
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance NSObject()
{
  id *v0;

  objc_msgSend(*v0, sel_hash);
  return static Hasher._hash(seed:_:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  void *v1;

  objc_msgSend(v1, sel_hash);
  return static Hasher._hash(seed:_:)();
}

id static NSObject.== infix(_:_:)(void *a1, uint64_t a2)
{
  return objc_msgSend(a1, sel_isEqual_, a2);
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Selector(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

ObjectiveC::ObjCBool __swiftcall _convertBoolToObjCBool(_:)(Swift::Bool a1)
{
  return (ObjectiveC::ObjCBool)a1;
}

id protocol witness for Hashable.hashValue.getter in conformance NSObject()
{
  id *v0;

  return objc_msgSend(*v0, sel_hash);
}

id NSObject.hashValue.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_hash);
}

Swift::Bool __swiftcall _convertObjCBoolToBool(_:)(ObjectiveC::ObjCBool a1)
{
  return a1._value;
}

unint64_t lazy protocol witness table accessor for type Selector and conformance Selector()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Selector and conformance Selector;
  if (!lazy protocol witness table cache variable for type Selector and conformance Selector)
  {
    result = MEMORY[0x1B5E17FF0](&protocol conformance descriptor for Selector, &type metadata for Selector);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Selector and conformance Selector);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Selector and conformance Selector;
  if (!lazy protocol witness table cache variable for type Selector and conformance Selector)
  {
    result = MEMORY[0x1B5E17FF0](&protocol conformance descriptor for Selector, &type metadata for Selector);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Selector and conformance Selector);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Selector and conformance Selector;
  if (!lazy protocol witness table cache variable for type Selector and conformance Selector)
  {
    result = MEMORY[0x1B5E17FF0](&protocol conformance descriptor for Selector, &type metadata for Selector);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Selector and conformance Selector);
  }
  return result;
}

uint64_t ObjCBool._value.getter(char a1)
{
  return a1 & 1;
}

uint64_t ObjCBool._value.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*ObjCBool._value.modify())()
{
  return ObjCBool._value.modify;
}

ObjectiveC::ObjCBool __swiftcall ObjCBool.init(_:)(Swift::Bool a1)
{
  return (ObjectiveC::ObjCBool)a1;
}

uint64_t ObjCBool.BOOLValue.getter(char a1)
{
  return a1 & 1;
}

ObjectiveC::ObjCBool __swiftcall ObjCBool.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (ObjectiveC::ObjCBool)BOOLeanLiteral;
}

_BYTE *protocol witness for ExpressibleByBooleanLiteral.init(BOOLeanLiteral:) in conformance ObjCBool@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t ObjCBool.customMirror.getter()
{
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance ObjCBool()
{
  return Mirror.init(reflecting:)();
}

uint64_t ObjCBool.description.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 1702195828;
  else
    return 0x65736C6166;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ObjCBool()
{
  _BYTE *v0;

  if (*v0)
    return 1702195828;
  else
    return 0x65736C6166;
}

uint64_t protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance Selector@<X0>(SEL *a1@<X8>)
{
  uint64_t v2;
  SEL v3;
  uint64_t result;

  v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v3 = sel_registerName((const char *)(v2 + 32));
  result = swift_release();
  *a1 = v3;
  return result;
}

Swift::Int Selector.hashValue.getter(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Selector()
{
  Swift::UInt *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Selector()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t String.init(_sel:)(const char *a1)
{
  sel_getName(a1);
  return String.init(cString:)();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Selector()
{
  SEL *v0;

  sel_getName(*v0);
  return String.init(cString:)();
}

uint64_t Selector.customMirror.getter(const char *a1)
{
  sel_getName(a1);
  String.init(cString:)();
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Selector()
{
  SEL *v0;

  sel_getName(*v0);
  String.init(cString:)();
  return Mirror.init(reflecting:)();
}

void autoreleasepool<A>(invoking:)(void (*a1)(void))
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E17E34]();
  a1();
  objc_autoreleasePoolPop(v2);
}

void YES.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void NO.getter()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t NSObject._cVarArgEncoding.getter()
{
  void *v0;
  id v1;
  uint64_t result;

  v1 = v0;
  result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(result + 16) = 1;
  *(_QWORD *)(result + 32) = v1;
  return result;
}

uint64_t ObjCClassList.Iterator.deinit()
{
  uint64_t v0;

  swift_beginAccess();
  _objc_endClassEnumeration();
  swift_endAccess();
  free(*(void **)(v0 + 80));
  return v0;
}

uint64_t ObjCClassList.Iterator.__deallocating_deinit()
{
  uint64_t v0;

  swift_beginAccess();
  _objc_endClassEnumeration();
  swift_endAccess();
  free(*(void **)(v0 + 80));
  return swift_deallocClassInstance();
}

uint64_t ObjCClassList.Iterator.next()()
{
  uint64_t Class;

  swift_beginAccess();
  Class = _objc_enumerateNextClass();
  swift_endAccess();
  if (Class)
    return swift_getObjCClassMetadata();
  else
    return 0;
}

uint64_t protocol witness for IteratorProtocol.next() in conformance ObjCClassList.Iterator@<X0>(uint64_t *a1@<X8>)
{
  uint64_t Class;
  uint64_t result;

  swift_beginAccess();
  Class = _objc_enumerateNextClass();
  swift_endAccess();
  if (Class)
    result = swift_getObjCClassMetadata();
  else
    result = 0;
  *a1 = result;
  return result;
}

uint64_t ObjCClassList.makeIterator()()
{
  uint64_t *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v10;
  char v11;

  v1 = *v0;
  v2 = *((_BYTE *)v0 + 8);
  v3 = v0[2];
  v4 = (char *)v0[3];
  v6 = (void *)v0[4];
  v5 = v0[5];
  v10 = v1;
  v11 = v2;
  type metadata accessor for ObjCClassList.Iterator();
  swift_allocObject();
  v7 = v6;
  swift_bridgeObjectRetain();
  v8 = specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)((uint64_t)&v10, v3, v4, (uint64_t)v6, v5);

  return v8;
}

uint64_t protocol witness for Sequence.makeIterator() in conformance ObjCClassList@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char v13;

  v3 = *v1;
  v4 = *((_BYTE *)v1 + 8);
  v5 = v1[2];
  v6 = (char *)v1[3];
  v8 = (void *)v1[4];
  v7 = v1[5];
  v12 = v3;
  v13 = v4;
  type metadata accessor for ObjCClassList.Iterator();
  swift_allocObject();
  v9 = v8;
  swift_bridgeObjectRetain();
  v10 = specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)((uint64_t)&v12, v5, v6, (uint64_t)v8, v7);

  result = swift_bridgeObjectRelease();
  *a1 = v10;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance ObjCClassList()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance ObjCClassList()
{
  return 2;
}

_QWORD *protocol witness for Sequence._copyToContiguousArray() in conformance ObjCClassList()
{
  _OWORD *v0;
  __int128 v1;
  _QWORD *v2;
  _OWORD v4[3];

  v1 = v0[1];
  v4[0] = *v0;
  v4[1] = v1;
  v4[2] = v0[2];
  v2 = specialized _copySequenceToContiguousArray<A>(_:)((uint64_t *)v4);
  outlined release of ObjCClassList((uint64_t)v4);
  return v2;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance ObjCClassList(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3);
}

uint64_t specialized Sequence._copyContents(initializing:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  _BYTE v16[24];
  uint64_t v17[2];

  v4 = v3;
  outlined init with take of ObjCEnumerationImage(v3, (uint64_t)v17);
  v8 = v3[2];
  v9 = (char *)v4[3];
  v10 = (void *)v4[4];
  v11 = v4[5];
  outlined init with take of ObjCEnumerationImage(v17, (uint64_t)v16);
  type metadata accessor for ObjCClassList.Iterator();
  swift_allocObject();
  v12 = v10;
  swift_bridgeObjectRetain();
  v13 = specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)((uint64_t)v16, v8, v9, (uint64_t)v10, v11);

  result = outlined release of ObjCClassList((uint64_t)v4);
  if (!a2)
  {
    a3 = 0;
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_10:
    *a1 = v13;
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    swift_beginAccess();
    v15 = 0;
    if (_objc_enumerateNextClass())
    {
      while (1)
      {
        *(_QWORD *)(a2 + 8 * v15) = swift_getObjCClassMetadata();
        if (a3 - 1 == v15)
          break;
        ++v15;
        if (!_objc_enumerateNextClass())
          goto LABEL_7;
      }
      swift_endAccess();
    }
    else
    {
LABEL_7:
      swift_endAccess();
      a3 = v15;
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance ObjCClassList()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t objc_enumerateClasses(fromImage:matchingNamePrefix:conformingTo:subclassing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v6;
  id v7;

  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a6 = *(_QWORD *)a1;
  *(_BYTE *)(a6 + 8) = v6;
  *(_QWORD *)(a6 + 16) = a2;
  *(_QWORD *)(a6 + 24) = a3;
  *(_QWORD *)(a6 + 32) = a4;
  *(_QWORD *)(a6 + 40) = a5;
  v7 = a4;
  return swift_bridgeObjectRetain();
}

_QWORD *specialized _copySequenceToContiguousArray<A>(_:)(uint64_t *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t Class;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _BYTE v27[16];
  uint64_t v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  outlined init with take of ObjCEnumerationImage(a1, (uint64_t)v28);
  v2 = a1[2];
  v3 = (char *)a1[3];
  v5 = (void *)a1[4];
  v4 = a1[5];
  outlined init with take of ObjCEnumerationImage(v28, (uint64_t)v27);
  type metadata accessor for ObjCClassList.Iterator();
  swift_initStackObject();
  v6 = v5;
  swift_bridgeObjectRetain();
  specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)((uint64_t)v27, v2, v3, (uint64_t)v5, v4);

  swift_beginAccess();
  Class = _objc_enumerateNextClass();
  swift_endAccess();
  v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v9 = 0;
  if (Class)
  {
    v10 = (uint64_t *)(MEMORY[0x1E0DEE9D8] + 32);
    while (1)
    {
      if (!v9)
      {
        v11 = v8[3];
        if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_26;
        v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
        if (v12 <= 1)
          v13 = 1;
        else
          v13 = v12;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
        v14 = (_QWORD *)swift_allocObject();
        v15 = _swift_stdlib_malloc_size(v14);
        v16 = v15 - 32;
        if (v15 < 32)
          v16 = v15 - 25;
        v17 = v16 >> 3;
        v14[2] = v13;
        v14[3] = 2 * (v16 >> 3);
        v18 = (unint64_t)(v14 + 4);
        v19 = v8[3] >> 1;
        if (v8[2])
        {
          if (v14 != v8 || v18 >= (unint64_t)&v8[v19 + 4])
            memmove(v14 + 4, v8 + 4, 8 * v19);
          v8[2] = 0;
        }
        v10 = (uint64_t *)(v18 + 8 * v19);
        v9 = (v17 & 0x7FFFFFFFFFFFFFFFLL) - v19;
        swift_release();
        v8 = v14;
      }
      v21 = __OFSUB__(v9--, 1);
      if (v21)
        break;
      *v10++ = swift_getObjCClassMetadata();
      swift_beginAccess();
      v22 = _objc_enumerateNextClass();
      swift_endAccess();
      if (!v22)
        goto LABEL_21;
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
LABEL_21:
  swift_release();
  v23 = v8[3];
  if (v23 >= 2)
  {
    v24 = v23 >> 1;
    v21 = __OFSUB__(v24, v9);
    v25 = v24 - v9;
    if (v21)
      goto LABEL_27;
    v8[2] = v25;
  }
  return v8;
}

uint64_t type metadata accessor for ObjCClassList.Iterator()
{
  return objc_opt_self();
}

uint64_t specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v8;
  uint64_t result;
  uint64_t v10;

  v8 = *(unsigned __int8 *)(a1 + 8);
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 48) = 0u;
  *(_OWORD *)(v5 + 64) = 0u;
  if (v8 || (result = _dyld_get_dlopen_image_header()) != 0)
  {
    if (a3)
    {
      v10 = String.utf8CString.getter();
      swift_bridgeObjectRelease();
      a3 = strdup((const char *)(v10 + 32));
      swift_release();
    }
    *(_QWORD *)(v5 + 80) = a3;
    if (a5)
      swift_getObjCClassFromMetadata();
    swift_beginAccess();
    _objc_beginClassEnumeration();
    swift_endAccess();
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByBooleanLiteral.BooleanLiteralType : _ExpressibleByBuiltinBooleanLiteral in ObjCBool()
{
  return MEMORY[0x1E0DEAFD0];
}

uint64_t associated type witness table accessor for ExpressibleByStringLiteral.StringLiteralType : _ExpressibleByBuiltinStringLiteral in Selector()
{
  return MEMORY[0x1E0DEA9F0];
}

uint64_t associated type witness table accessor for ExpressibleByExtendedGraphemeClusterLiteral.ExtendedGraphemeClusterLiteralType : _ExpressibleByBuiltinExtendedGraphemeClusterLiteral in Selector()
{
  return MEMORY[0x1E0DEAA00];
}

uint64_t associated type witness table accessor for ExpressibleByUnicodeScalarLiteral.UnicodeScalarLiteralType : _ExpressibleByBuiltinUnicodeScalarLiteral in Selector()
{
  return MEMORY[0x1E0DEA9F8];
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ObjCClassList(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type NSObject and conformance NSObject(&lazy protocol witness table cache variable for type ObjCClassList.Iterator and conformance ObjCClassList.Iterator, a2, (uint64_t (*)(uint64_t))type metadata accessor for ObjCClassList.Iterator, (uint64_t)&protocol conformance descriptor for ObjCClassList.Iterator);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ObjCBool(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ObjCBool(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B11DBA4C + 4 * byte_1B11DC345[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1B11DBA80 + 4 * byte_1B11DC340[v4]))();
}

uint64_t sub_1B11DBA80(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B11DBA88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B11DBA90);
  return result;
}

uint64_t sub_1B11DBA9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B11DBAA4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1B11DBAA8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B11DBAB0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ObjCBool()
{
  return &type metadata for ObjCBool;
}

ValueMetadata *type metadata accessor for Selector()
{
  return &type metadata for Selector;
}

uint64_t getEnumTagSinglePayload for Selector(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Selector(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for NSZone()
{
  return &type metadata for NSZone;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ObjCEnumerationImage(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ObjCEnumerationImage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for ObjCEnumerationImage(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t destructiveInjectEnumTag for ObjCEnumerationImage(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ObjCEnumerationImage()
{
  return &type metadata for ObjCEnumerationImage;
}

uint64_t initializeBufferWithCopyOfBuffer for ObjCClassList(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ObjCClassList(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for ObjCClassList(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v5 = *(void **)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  v6 = v5;
  return a1;
}

uint64_t assignWithCopy for ObjCClassList(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  v6 = (void *)a2[4];
  *(_QWORD *)(a1 + 32) = v6;
  v7 = v6;

  *(_QWORD *)(a1 + 40) = a2[5];
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ObjCClassList(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ObjCClassList(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ObjCClassList(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ObjCClassList()
{
  return &type metadata for ObjCClassList;
}

uint64_t method lookup function for ObjCClassList.Iterator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ObjCClassList.Iterator.next()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for objc_class_enumerator(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for objc_class_enumerator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

void type metadata accessor for objc_class_enumerator()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for objc_class_enumerator)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for objc_class_enumerator);
  }
}

uint64_t outlined init with take of ObjCEnumerationImage(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  *(_BYTE *)(a2 + 8) = *((_BYTE *)a1 + 8);
  *(_QWORD *)a2 = v2;
  return a2;
}

uint64_t outlined release of ObjCClassList(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  swift_bridgeObjectRelease();

  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E17FE4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t _dyld_get_dlopen_image_header()
{
  return MEMORY[0x1E0C80E58]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

uint64_t _objc_beginClassEnumeration()
{
  return MEMORY[0x1E0DE7978]();
}

uint64_t _objc_endClassEnumeration()
{
  return MEMORY[0x1E0DE7990]();
}

uint64_t _objc_enumerateNextClass()
{
  return MEMORY[0x1E0DE7998]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

