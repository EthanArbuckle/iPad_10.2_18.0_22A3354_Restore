void protocol witness for RawRepresentable.init(rawValue:) in conformance MKMapItemIdentifier(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *a1;
  v4 = a1[1];
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v6 = (void *)MEMORY[0x20BD37E4C](v3, v4);
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithIdentifierString_, v6);

  *a2 = v7;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance MKMapItemIdentifier(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*v1, sel_identifierString);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t protocol witness for Decodable.init(from:) in conformance MKMapItemIdentifier()
{
  MEMORY[0x20BD37FF0](&protocol conformance descriptor for MKMapItemIdentifier);
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance MKMapItemIdentifier()
{
  MEMORY[0x20BD37FF0](&protocol conformance descriptor for MKMapItemIdentifier);
  return RawRepresentable<>.encode(to:)();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MKCoordinateSpan(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MKCoordinateSpan(uint64_t result, int a2, int a3)
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

void type metadata accessor for MKCoordinateSpan()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for MKCoordinateSpan)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for MKCoordinateSpan);
  }
}

char *MKGradientPolylineRenderer.locations.getter()
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
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_locations);
  type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
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
  v13 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v13;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x20BD37E94](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      objc_msgSend(v7, sel_doubleValue);
      v10 = v9;

      v12 = *(_QWORD *)(v13 + 16);
      v11 = *(_QWORD *)(v13 + 24);
      if (v12 >= v11 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      ++v5;
      *(_QWORD *)(v13 + 16) = v12 + 1;
      *(_QWORD *)(v13 + 8 * v12 + 32) = v10;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall MKGradientPolylineRenderer.setColors(_:locations:)(Swift::OpaquePointer _, Swift::OpaquePointer locations)
{
  void *v2;
  uint64_t v3;
  double *v5;
  double v6;
  Class isa;
  Class v8;

  v3 = *((_QWORD *)locations._rawValue + 2);
  if (v3)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    v5 = (double *)((char *)locations._rawValue + 32);
    do
    {
      v6 = *v5++;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v6);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v3;
    }
    while (v3);
  }
  type metadata accessor for NSNumber(0, &lazy cache variable for type metadata for UIColor);
  isa = Array._bridgeToObjectiveC()().super.isa;
  type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  v8 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setColors_atLocations_, isa, v8);

}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t type metadata accessor for NSNumber(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CGFloat>);
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD37FE4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id one-time initialization function for MKCoordinateSpanInNSValueObjCType()
{
  id v0;
  id v1;
  id result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_valueWithMKCoordinateSpan_, 0.0, 0.0);
  v1 = objc_msgSend(v0, sel_objCType);
  result = v0;
  MKCoordinateSpanInNSValueObjCType = (uint64_t)v1;
  return result;
}

NSValue __swiftcall MKCoordinateSpan._bridgeToObjectiveC()()
{
  double v0;
  double v1;

  return (NSValue)objc_msgSend((id)objc_opt_self(), sel_valueWithMKCoordinateSpan_, v0, v1);
}

id static MKCoordinateSpan._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1)
    swift_once();
  result = (id)strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_MKCoordinateSpanValue);
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v7;
    *(_BYTE *)(a2 + 16) = 0;
  }
  return result;
}

BOOL static MKCoordinateSpan._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 result;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1)
    swift_once();
  v5 = strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
  v6 = 0;
  v7 = 0;
  if (!v5)
    objc_msgSend(v3, sel_MKCoordinateSpanValue, 0.0, 0.0);
  result = v5 == 0;
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v5 != 0;
  return result;
}

id static MKCoordinateSpan._unconditionallyBridgeFromObjectiveC(_:)(id result)
{
  id v1;
  const char *v2;

  if (result)
  {
    v1 = objc_retainAutorelease(result);
    v2 = (const char *)objc_msgSend(v1, sel_objCType);
    if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1)
      swift_once();
    result = (id)strcmp(v2, (const char *)MKCoordinateSpanInNSValueObjCType);
    if (!(_DWORD)result)
      return objc_msgSend(v1, sel_MKCoordinateSpanValue);
    __break(1u);
  }
  __break(1u);
  return result;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MKCoordinateSpan()
{
  double *v0;

  return objc_msgSend((id)objc_opt_self(), sel_valueWithMKCoordinateSpan_, *v0, v0[1]);
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance MKCoordinateSpan(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  id result;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1)
    swift_once();
  result = (id)strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
  if ((_DWORD)result)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v3, sel_MKCoordinateSpanValue);
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v7;
    *(_BYTE *)(a2 + 16) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance MKCoordinateSpan(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 result;

  v3 = objc_retainAutorelease(a1);
  v4 = (const char *)objc_msgSend(v3, sel_objCType);
  if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1)
    swift_once();
  v5 = strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
  v6 = 0;
  v7 = 0;
  if (!v5)
    objc_msgSend(v3, sel_MKCoordinateSpanValue, 0.0, 0.0);
  result = v5 == 0;
  *(_QWORD *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v5 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance MKCoordinateSpan@<X0>(id result@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v3 = objc_retainAutorelease(result);
    v4 = (const char *)objc_msgSend(v3, sel_objCType);
    if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1)
      swift_once();
    result = (id)strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v3, sel_MKCoordinateSpanValue);
      *a2 = v5;
      a2[1] = v6;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id static MKMapItemDetailSelectionAccessoryPresentationStyle.automatic(presentationViewController:)(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_automaticWithPresentationViewController_, a1);
}

id static MKMapItemDetailSelectionAccessoryPresentationStyle.callout(_:)(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_calloutWithCalloutStyle_, a1);
}

char *MKMultiPoint.locations(at:)@<X0>(NSIndexSet *a1@<X8>)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  char *result;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v2 = v1;
  IndexSet._bridgeToObjectiveC()(a1);
  v4 = v3;
  v5 = objc_msgSend(v2, sel_locationsAtPointIndexes_, v3);

  type metadata accessor for NSNumber();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v7 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v7)
    goto LABEL_13;
LABEL_3:
  v17 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000) == 0)
  {
    v9 = 0;
    v10 = v17;
    do
    {
      if ((v6 & 0xC000000000000001) != 0)
        v11 = (id)MEMORY[0x20BD37E94](v9, v6);
      else
        v11 = *(id *)(v6 + 8 * v9 + 32);
      v12 = v11;
      objc_msgSend(v11, sel_doubleValue);
      v14 = v13;

      v16 = *(_QWORD *)(v17 + 16);
      v15 = *(_QWORD *)(v17 + 24);
      if (v16 >= v15 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v15 > 1), v16 + 1, 1);
      ++v9;
      *(_QWORD *)(v17 + 16) = v16 + 1;
      *(_QWORD *)(v17 + 8 * v16 + 32) = v14;
    }
    while (v7 != v9);
    swift_bridgeObjectRelease();
    return (char *)v10;
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

void __swiftcall IndexSet._bridgeToObjectiveC()(NSIndexSet *__return_ptr retstr)
{
  MEMORY[0x24BDCF368](retstr);
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x24BEE1080]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
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

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

